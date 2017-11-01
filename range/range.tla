------------------------------- MODULE range -------------------------------

EXTENDS Integers, TLC

Max(set) == 0
Min(set) == 0

MinMaxDiff(set) == Max(set) - Min(set)

(*--algorithm range

variables number_set = 1..3

begin
    print(MinMaxDiff(number_set));
end algorithm; *)

\* You can ignore everything below this line.






\* BEGIN TRANSLATION
VARIABLES number_set, pc

vars == << number_set, pc >>

Init == (* Global variables *)
        /\ number_set = 1..3
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ PrintT((MinMaxDiff(number_set)))
         /\ pc' = "Done"
         /\ UNCHANGED number_set

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Wed Nov 01 16:20:13 CDT 2017 by hillel
\* Created Wed Nov 01 16:14:49 CDT 2017 by hillel

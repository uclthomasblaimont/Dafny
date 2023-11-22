
// Whether the sequence is sorted
predicate sorted(a: seq<int>) {
    // -> Copy/Paste from ./5_sort.dfy .
} 

// Tries to find a sum such that a[i] + a[j] = s
method findsum(a: seq<int>, s: int) returns (found: bool, i: int, j: int)
    // TODO
{
    i, j := 0, |a|-1;
    while i < j 
    // TODO
    {
        if (a[i] + a[j] == s) {
            found := true;
            return;
        } else if (a[i] + a[j] > s) {
            j := j - 1;
        } else {
            i := i + 1;
        }
    }
    found := false;
}


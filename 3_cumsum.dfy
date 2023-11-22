
function sum(a: array<int>, i: int): int
    requires 0 <= i < a.Length
    reads a
{
    a[i] + if i == 0 then 0 else /* 1 */
}

method cumsum(a: array<int>, b: array<int>)
    requires a.Length == b.Length
    /* 4 */
    ensures forall i | 0 <= i < a.Length :: b[i] == sum(a, i)
    modifies b
{
    /* 2 */
    while i < a.Length
        invariant 1 <= i <= a.Length
        invariant forall i' | 0 <= i' < i :: b[i'] == sum(a, i')
    {
        /* 3 */
    }
}

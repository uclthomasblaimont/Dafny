
predicate contains(a: array<int>, e: int) 
    reads a
{
    exists k | 0 <= k < a.Length :: a[k] == e
}

// Tests if e can be found in a.
method search(a: array<int>, e: int) returns (found: bool)
    ensures found <==> contains(a, e)
{
    var i := 0;
    while i < a.Length && a[i] != e
        /* TODO */
    {
        i := i + 1;
    }
    return i != a.Length; // équivalent à found := a ! a.Length;
}

// Tests if an element from "elements" can be found in the array a.
method searchAny(a: array<int>, elements: array<int>) returns (found: bool)
    /* TODO */
{
    found := false;
    var i := 0;
    while i < elements.Length && !found
        /* TODO */
    {
        found := search(a, elements[i]);
        assert found <==> contains(a, elements[i]); // Dafny ? WAKE UP !
        i := i+1;
    }
    // return found; // inutile, car found *est* la variable de retour.
}

// Tests if all the elements from "elements" can be found in the array a.
method searchAll(a: array<int>, elements: array<int>) returns (allFound: bool)
    /* TODO */
{
    /* TODO */
}

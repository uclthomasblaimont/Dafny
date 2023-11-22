
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

        invariant 0 <= i <= a.Length
        invariant forall i' | 0 <= i' < i :: a[i'] != e

        /* TODO */
    {
        i := i + 1;
    }
    return i != a.Length; // équivalent à found := a ! a.Length;
}

// Tests if an element from "elements" can be found in the array a.
method searchAny(a: array<int>, elements: array<int>) returns (found: bool)
    /* TODO */
    requires a != null && elements != null
    ensures found <==> exists k | 0 <= k < elements.Length :: contains(a, elements[k]) 
{
    found := false;
    var i := 0;
    while i < elements.Length && !found
        /* TODO */
        invariant 0 <= i <= elements.Length
        invariant found <==> exists j | 0 <= j < i :: contains(a, elements[j])
        invariant !found <==> forall k | 0 <= k < i :: !contains(a, elements[k])

       
    {
        found := search(a, elements[i]);
        assert found <==> contains(a, elements[i]); // Dafny ? WAKE UP !
        i := i+1;
    }
    // return found; // inutile, car found *est* la variable de retour.
}

method searchAll(a: array<int>, elements: array<int>) returns (allFound: bool)
    requires a.Length > 0 && elements.Length > 0 // Précondition : les tableaux ne doivent pas être nuls
    ensures allFound <==> forall k | 0 <= k < elements.Length :: contains(a, elements[k]) // Postcondition
{
    allFound := true;
    var i := 0;
    while i < elements.Length && allFound
        invariant 0 <= i <= elements.Length // Invariant de boucle : l'indice reste dans les limites du tableau
        invariant allFound <==> forall j | 0 <= j < i :: contains(a, elements[j]) // Invariant de boucle : tous les éléments vérifiés jusqu'à présent sont dans `a`
        invariant !allFound <==> exists k | 0 <= k < i :: !contains(a, elements[k]) // Invariant de boucle : si non trouvé, alors au moins un élément vérifié n'est pas dans `a`
    {
        if (!search(a, elements[i])) {
            allFound := false;
        }
        i := i + 1;
    }
}


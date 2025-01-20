@interface _UIDiffableSectionBoundaryMoveDetector
- (BOOL)didShortCircuit;
- (NSSet)movePairs;
- (_UIDiffableSectionBoundaryMoveDetector)initWithItemDiffer:(id)a3 beforeDataSourceState:(id)a4 afterDataSourceState:(id)a5;
- (id)_computeMovePairsFoundation;
@end

@implementation _UIDiffableSectionBoundaryMoveDetector

- (NSSet)movePairs
{
  return self->_movePairs;
}

- (_UIDiffableSectionBoundaryMoveDetector)initWithItemDiffer:(id)a3 beforeDataSourceState:(id)a4 afterDataSourceState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_UIDiffableSectionBoundaryMoveDetector;
  v12 = [(_UIDiffableSectionBoundaryMoveDetector *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_differ, a3);
    objc_storeStrong((id *)&v13->_beforeState, a4);
    objc_storeStrong((id *)&v13->_afterState, a5);
    uint64_t v14 = [(_UIDiffableSectionBoundaryMoveDetector *)v13 _computeMovePairsFoundation];
    movePairs = v13->_movePairs;
    v13->_movePairs = (NSSet *)v14;
  }
  return v13;
}

- (id)_computeMovePairsFoundation
{
  v47 = [(_UIDiffableDataSourceState *)self->_beforeState dataSourceSnapshot];
  v48 = [(_UIDiffableDataSourceState *)self->_afterState dataSourceSnapshot];
  BOOL v4 = -[_UIIdentifierDiffer hasChanges]((BOOL)self->_differ);
  uint64_t v5 = [v47 numberOfSections];
  if (v5 == [v48 numberOfSections] && objc_msgSend(v47, "isEqual:", v48))
  {
    v6 = [(_UIDiffableDataSourceState *)self->_beforeState sections];
    v7 = [(_UIDiffableDataSourceState *)self->_afterState sections];
    int v8 = [v6 isEqualToOrderedSet:v7];
  }
  else
  {
    int v8 = 0;
  }
  if ([v48 numberOfItems] && ((v4 | v8 ^ 1) & 1) != 0)
  {
    id v9 = [(_UIDiffableDataSourceState *)self->_beforeState identifiers];
    v45 = [(_UIDiffableDataSourceState *)self->_afterState identifiers];
    v51 = [(_UIDiffableDataSourceState *)self->_beforeState sections];
    v50 = [(_UIDiffableDataSourceState *)self->_afterState sections];
    uint64_t v10 = [v47 numberOfItems];
    if (v10 != [v9 count])
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, self, @"_UIDiffableSectionBoundaryMoveDetector.mm", 70, @"Invalid parameter not satisfying: %@", @"initialSnapshot.numberOfItems == initialIdentifiers.count" object file lineNumber description];
    }
    uint64_t v11 = [v47 numberOfSections];
    if (v11 != [v51 count])
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:a2, self, @"_UIDiffableSectionBoundaryMoveDetector.mm", 71, @"Invalid parameter not satisfying: %@", @"initialSnapshot.numberOfSections == initialSections.count" object file lineNumber description];
    }
    uint64_t v12 = [v48 numberOfItems];
    if (v12 != [v45 count])
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2, self, @"_UIDiffableSectionBoundaryMoveDetector.mm", 72, @"Invalid parameter not satisfying: %@", @"finalSnapshot.numberOfItems == finalIdentifiers.count" object file lineNumber description];
    }
    uint64_t v13 = [v48 numberOfSections];
    if (v13 != [v50 count])
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:a2, self, @"_UIDiffableSectionBoundaryMoveDetector.mm", 73, @"Invalid parameter not satisfying: %@", @"finalSnapshot.numberOfSections == finalSections.count" object file lineNumber description];
    }
    unint64_t v14 = [v45 count];
    uint64_t v46 = [v47 numberOfSections];
    uint64_t v15 = [v48 numberOfSections];
    __p = 0;
    v53 = 0;
    v54 = 0;
    std::vector<long>::reserve(&__p, v14);
    if (v15 >= 1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        uint64_t v17 = [v48 rangeForSection:i];
        uint64_t v19 = v17 + v18;
        if (v17 < v17 + v18)
        {
          v20 = v53;
          do
          {
            if (v20 >= v54)
            {
              v22 = (char *)__p;
              uint64_t v23 = (v20 - (unsigned char *)__p) >> 3;
              unint64_t v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 61) {
                abort();
              }
              uint64_t v25 = v54 - (unsigned char *)__p;
              if ((v54 - (unsigned char *)__p) >> 2 > v24) {
                unint64_t v24 = v25 >> 2;
              }
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v26 = v24;
              }
              if (v26)
              {
                v27 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)&v54, v26);
                v22 = (char *)__p;
                v20 = v53;
              }
              else
              {
                v27 = 0;
              }
              v28 = &v27[8 * v23];
              *(void *)v28 = i;
              v21 = v28 + 8;
              while (v20 != v22)
              {
                uint64_t v29 = *((void *)v20 - 1);
                v20 -= 8;
                *((void *)v28 - 1) = v29;
                v28 -= 8;
              }
              __p = v28;
              v53 = v21;
              v54 = &v27[8 * v26];
              if (v22) {
                operator delete(v22);
              }
            }
            else
            {
              *(void *)v20 = i;
              v21 = v20 + 8;
            }
            v53 = v21;
            ++v17;
            v20 = v21;
          }
          while (v17 != v19);
        }
      }
    }
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (v46 >= 1)
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        uint64_t v31 = [v47 rangeForSection:j];
        uint64_t v33 = v32;
        if (v31 < v31 + v32)
        {
          do
          {
            v34 = [v9 objectAtIndexedSubscript:v31];
            uint64_t v35 = [(_UIDiffableDataSourceState *)self->_afterState indexOfItemIdentifier:v34];
            if (v35 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v36 = *((void *)__p + v35);
              v37 = [v51 objectAtIndexedSubscript:j];
              v38 = [v50 objectAtIndexedSubscript:v36];
              if (([v37 isEqual:v38] & 1) == 0)
              {
                v39 = -[_UIIdentifierDifferMovePair initWithFromIndex:toIndex:]([_UIIdentifierDifferMovePair alloc], v31, v35);
                [v49 addObject:v39];
              }
            }

            ++v31;
            --v33;
          }
          while (v33);
        }
      }
    }
    if (__p)
    {
      v53 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    self->_didShortCircuit = 1;
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v49;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movePairs, 0);
  objc_storeStrong((id *)&self->_afterState, 0);
  objc_storeStrong((id *)&self->_beforeState, 0);
  objc_storeStrong((id *)&self->_differ, 0);
}

- (BOOL)didShortCircuit
{
  return self->_didShortCircuit;
}

@end
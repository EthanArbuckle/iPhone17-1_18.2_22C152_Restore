@interface PRPosterCollectionDiffInspector
- (BOOL)associatedPostersAreEqual;
- (BOOL)isEqual;
- (BOOL)orderedPostersAreEqual;
- (BOOL)postersAreEqual;
- (BOOL)selectedPostersAreEqual;
- (NSOrderedCollectionDifference)postersDiff;
- (NSSet)addedAssocPosters;
- (NSSet)addedPosters;
- (NSSet)removedAssocPosters;
- (NSSet)removedPosters;
- (NSSet)updatedAssocPosters;
- (NSSet)updatedPosters;
- (PRPosterCollection)initialCollection;
- (PRPosterCollection)newCollection;
- (PRPosterCollectionDiffInspector)initWithCollection:(id)a3 newCollection:(id)a4;
@end

@implementation PRPosterCollectionDiffInspector

- (PRPosterCollectionDiffInspector)initWithCollection:(id)a3 newCollection:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (v9)
  {
    NSClassFromString(&cfstr_Prpostercollec_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterCollectionClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterCollectionDiffInspector initWithCollection:newCollection:]();
      }
      [v55 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C236F24);
    }
  }

  id v10 = v8;
  NSClassFromString(&cfstr_Prpostercollec_0.isa);
  if (!v10)
  {
    v53 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollectionDiffInspector initWithCollection:newCollection:]();
    }
    [v53 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C236E5CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v54 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterCollectionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollectionDiffInspector initWithCollection:newCollection:]();
    }
    [v54 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C236EC0);
  }

  v73.receiver = self;
  v73.super_class = (Class)PRPosterCollectionDiffInspector;
  v11 = [(PRPosterCollectionDiffInspector *)&v73 init];
  v12 = v11;
  if (v11)
  {
    p_lhsCollection = (id *)&v11->_lhsCollection;
    objc_storeStrong((id *)&v11->_lhsCollection, a3);
    p_rhsCollection = (id *)&v12->_rhsCollection;
    objc_storeStrong((id *)&v12->_rhsCollection, a4);
    if (v9)
    {
      v15 = [(PRPosterCollection *)v12->_rhsCollection orderedPosters];
      v16 = [(PRPosterCollection *)v12->_lhsCollection orderedPosters];
      uint64_t v17 = [v15 differenceFromOrderedSet:v16 withOptions:0 usingEquivalenceTest:&__block_literal_global_107];
      postersDiff = v12->_postersDiff;
      v12->_postersDiff = (NSOrderedCollectionDifference *)v17;
    }
    else
    {
      v15 = v12->_postersDiff;
      v12->_postersDiff = 0;
    }

    v19 = [(PRPosterCollection *)v12->_lhsCollection orderedPosters];
    v20 = [v19 set];
    v21 = [(PRPosterCollection *)v12->_rhsCollection orderedPosters];
    v22 = [v21 set];
    v12->_postersAreEqual = BSEqualObjects();

    v12->_orderedPostersAreEqual = ![(NSOrderedCollectionDifference *)v12->_postersDiff hasChanges];
    v23 = [(PRPosterCollection *)v12->_lhsCollection selectedPoster];
    v24 = [(PRPosterCollection *)v12->_rhsCollection selectedPoster];
    v63 = [v23 _path];
    v62 = [v63 serverIdentity];
    uint64_t v25 = [v62 posterUUID];
    v60 = [v24 _path];
    v26 = [v60 serverIdentity];
    v27 = [v26 posterUUID];
    v61 = (void *)v25;
    id v58 = v10;
    id v59 = v9;
    v64 = v23;
    v57 = v24;
    if (BSEqualObjects())
    {
      v28 = [v23 _path];
      v29 = [v28 serverIdentity];
      v30 = [v24 _path];
      v31 = [v30 serverIdentity];
      v12->_selectedPostersAreEqual = [v29 compare:v31] == 0;
      p_selectedPostersAreEqual = &v12->_selectedPostersAreEqual;
    }
    else
    {
      v12->_selectedPostersAreEqual = 0;
      p_selectedPostersAreEqual = &v12->_selectedPostersAreEqual;
    }

    v32 = objc_opt_new();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v33 = [*p_lhsCollection orderedPosters];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v70 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*p_lhsCollection associatedPosterForPoster:*(void *)(*((void *)&v69 + 1) + 8 * i)];
          if (v38) {
            [v32 addObject:v38];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v69 objects:v75 count:16];
      }
      while (v35);
    }

    v39 = objc_opt_new();
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v40 = [*p_rhsCollection orderedPosters];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v66 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*p_rhsCollection associatedPosterForPoster:*(void *)(*((void *)&v65 + 1) + 8 * j)];
          if (v45) {
            [v39 addObject:v45];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v65 objects:v74 count:16];
      }
      while (v42);
    }

    uint64_t v46 = [v39 differenceFromOrderedSet:v32 withOptions:0 usingEquivalenceTest:&__block_literal_global_110];
    assocPostersDiff = v12->_assocPostersDiff;
    v12->_assocPostersDiff = (NSOrderedCollectionDifference *)v46;

    v48 = [v39 set];
    v49 = [v32 set];
    v12->_BOOL associatedPostersAreEqual = [v48 isEqualToSet:v49];

    BOOL associatedPostersAreEqual = v12->_associatedPostersAreEqual;
    if (associatedPostersAreEqual)
    {
      v51 = v57;
      BOOL associatedPostersAreEqual = *p_selectedPostersAreEqual;
      id v10 = v58;
      id v9 = v59;
      if (*p_selectedPostersAreEqual)
      {
        BOOL associatedPostersAreEqual = v12->_orderedPostersAreEqual;
        if (associatedPostersAreEqual) {
          BOOL associatedPostersAreEqual = v12->_postersAreEqual;
        }
      }
    }
    else
    {
      id v10 = v58;
      id v9 = v59;
      v51 = v57;
    }
    v12->_isEqual = associatedPostersAreEqual;
  }
  return v12;
}

uint64_t __68__PRPosterCollectionDiffInspector_initWithCollection_newCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 _path];
  v6 = [v5 serverIdentity];

  id v7 = [v4 _path];

  id v8 = [v7 serverIdentity];

  id v9 = [v6 posterUUID];
  id v10 = [v8 posterUUID];
  uint64_t v11 = [v9 isEqual:v10];

  return v11;
}

uint64_t __68__PRPosterCollectionDiffInspector_initWithCollection_newCollection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 _path];
  v6 = [v5 serverIdentity];
  id v7 = [v6 posterUUID];
  id v8 = [v4 _path];

  id v9 = [v8 serverIdentity];
  id v10 = [v9 posterUUID];
  uint64_t v11 = [v7 isEqual:v10];

  return v11;
}

- (PRPosterCollection)initialCollection
{
  return self->_lhsCollection;
}

- (PRPosterCollection)newCollection
{
  return self->_rhsCollection;
}

- (NSSet)removedPosters
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  removedPosters = self->_removedPosters;
  if (removedPosters)
  {
    v3 = removedPosters;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CA80];
    v6 = [(NSOrderedCollectionDifference *)self->_postersDiff removals];
    id v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_113_0);
    id v8 = [v5 setWithArray:v7];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = (id)[v8 copy];
    uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v14 = [(NSOrderedCollectionDifference *)self->_postersDiff insertions];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __49__PRPosterCollectionDiffInspector_removedPosters__block_invoke_2;
          v20[3] = &unk_1E54DC080;
          v20[4] = v13;
          int v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v20);

          if (v15) {
            [v8 removeObject:v13];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    v16 = (NSSet *)[v8 copy];
    uint64_t v17 = self->_removedPosters;
    self->_removedPosters = v16;

    v3 = self->_removedPosters;
  }
  return v3;
}

uint64_t __49__PRPosterCollectionDiffInspector_removedPosters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __49__PRPosterCollectionDiffInspector_removedPosters__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 object];
  id v4 = objc_msgSend(v3, "pr_posterUUID");
  v5 = objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (NSSet)addedPosters
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  addedPosters = self->_addedPosters;
  if (!addedPosters)
  {
    postersDiff = self->_postersDiff;
    if (postersDiff)
    {
      v5 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v6 = [(NSOrderedCollectionDifference *)postersDiff insertions];
      id v7 = objc_msgSend(v6, "bs_map:", &__block_literal_global_116);
      id v8 = [v5 setWithArray:v7];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      obuint64_t j = (id)[v8 copy];
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            v14 = [(NSOrderedCollectionDifference *)self->_postersDiff removals];
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __47__PRPosterCollectionDiffInspector_addedPosters__block_invoke_2;
            v24[3] = &unk_1E54DC080;
            v24[4] = v13;
            int v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v24);

            if (v15) {
              [v8 removeObject:v13];
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      v16 = (NSSet *)[v8 copy];
      uint64_t v17 = self->_addedPosters;
      self->_addedPosters = v16;
    }
    else
    {
      id v8 = [(PRPosterCollection *)self->_rhsCollection orderedPosters];
      v18 = [v8 set];
      v19 = (NSSet *)[v18 copy];
      v20 = self->_addedPosters;
      self->_addedPosters = v19;
    }
    addedPosters = self->_addedPosters;
  }
  long long v21 = addedPosters;
  return v21;
}

uint64_t __47__PRPosterCollectionDiffInspector_addedPosters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __47__PRPosterCollectionDiffInspector_addedPosters__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 object];
  id v4 = objc_msgSend(v3, "pr_posterUUID");
  v5 = objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (NSSet)updatedPosters
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  updatedPosters = self->_updatedPosters;
  if (updatedPosters)
  {
    long long v22 = updatedPosters;
  }
  else
  {
    long long v22 = (NSSet *)objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = [(PRPosterCollection *)self->_lhsCollection orderedPosters];
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          rhsCollection = self->_rhsCollection;
          uint64_t v10 = [v8 _path];
          uint64_t v11 = [v10 serverIdentity];
          v12 = [v11 posterUUID];
          uint64_t v13 = [(PRPosterCollection *)rhsCollection posterWithUUID:v12];

          if (v13)
          {
            v14 = [v13 _path];
            int v15 = [v14 serverIdentity];
            v16 = [v8 _path];
            uint64_t v17 = [v16 serverIdentity];
            int v18 = [v15 isNewerVersionOfIdentity:v17];

            if (v18) {
              [(NSSet *)v22 addObject:v13];
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v5);
    }

    v19 = (NSSet *)[(NSSet *)v22 copy];
    v20 = self->_updatedPosters;
    self->_updatedPosters = v19;
  }
  return v22;
}

- (NSSet)updatedAssocPosters
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  updatedAssocPosters = self->_updatedAssocPosters;
  if (updatedAssocPosters)
  {
    v3 = updatedAssocPosters;
  }
  else
  {
    uint64_t v4 = self;
    long long v28 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v5 = [(PRPosterCollection *)v4->_lhsCollection orderedPosters];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        uint64_t v9 = 0;
        uint64_t v29 = v7;
        do
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
          rhsCollection = v4->_rhsCollection;
          v12 = [v10 _path];
          uint64_t v13 = [v12 serverIdentity];
          v14 = [v13 posterUUID];
          int v15 = [(PRPosterCollection *)rhsCollection posterWithUUID:v14];

          if (v15)
          {
            v16 = [(PRPosterCollection *)v4->_lhsCollection associatedPosterForPoster:v10];
            if (v16)
            {
              uint64_t v17 = [(PRPosterCollection *)v4->_rhsCollection associatedPosterForPoster:v15];
              int v18 = v17;
              if (v17)
              {
                v31 = [v17 _path];
                v19 = [v31 serverIdentity];
                v20 = [v16 _path];
                [v20 serverIdentity];
                uint64_t v21 = v8;
                long long v22 = v4;
                v24 = long long v23 = v5;
                int v30 = [v19 isNewerVersionOfIdentity:v24];

                uint64_t v5 = v23;
                uint64_t v4 = v22;
                uint64_t v8 = v21;

                uint64_t v7 = v29;
                if (v30) {
                  [v28 addObject:v18];
                }
              }
            }
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v7);
    }

    uint64_t v25 = [v28 copy];
    long long v26 = v4->_updatedAssocPosters;
    v4->_updatedAssocPosters = (NSSet *)v25;

    v3 = v4->_updatedAssocPosters;
  }
  return v3;
}

- (NSSet)removedAssocPosters
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  removedAssocPosters = self->_removedAssocPosters;
  if (removedAssocPosters)
  {
    v3 = removedAssocPosters;
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [(NSOrderedCollectionDifference *)self->_assocPostersDiff removals];
    uint64_t v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_118);
    [v5 addObjectsFromArray:v7];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = (id)[v5 copy];
    uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [(NSOrderedCollectionDifference *)self->_assocPostersDiff insertions];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __54__PRPosterCollectionDiffInspector_removedAssocPosters__block_invoke_2;
          v19[3] = &unk_1E54DC080;
          v19[4] = v12;
          int v14 = objc_msgSend(v13, "bs_containsObjectPassingTest:", v19);

          if (v14) {
            [v5 removeObject:v12];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    int v15 = (NSSet *)[v5 copy];
    v16 = self->_removedAssocPosters;
    self->_removedAssocPosters = v15;

    v3 = self->_removedAssocPosters;
  }
  return v3;
}

uint64_t __54__PRPosterCollectionDiffInspector_removedAssocPosters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __54__PRPosterCollectionDiffInspector_removedAssocPosters__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 object];
  uint64_t v4 = objc_msgSend(v3, "pr_posterUUID");
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (NSSet)addedAssocPosters
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  addedAssocPosters = self->_addedAssocPosters;
  if (addedAssocPosters)
  {
    v3 = addedAssocPosters;
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [(NSOrderedCollectionDifference *)self->_assocPostersDiff insertions];
    uint64_t v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_120);
    [v5 addObjectsFromArray:v7];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = (id)[v5 copy];
    uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [(NSOrderedCollectionDifference *)self->_assocPostersDiff removals];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __52__PRPosterCollectionDiffInspector_addedAssocPosters__block_invoke_2;
          v19[3] = &unk_1E54DC080;
          v19[4] = v12;
          int v14 = objc_msgSend(v13, "bs_containsObjectPassingTest:", v19);

          if (v14) {
            [v5 removeObject:v12];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    int v15 = (NSSet *)[v5 copy];
    v16 = self->_addedAssocPosters;
    self->_addedAssocPosters = v15;

    v3 = self->_addedAssocPosters;
  }
  return v3;
}

uint64_t __52__PRPosterCollectionDiffInspector_addedAssocPosters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __52__PRPosterCollectionDiffInspector_addedAssocPosters__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 object];
  uint64_t v4 = objc_msgSend(v3, "pr_posterUUID");
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "pr_posterUUID");
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (NSOrderedCollectionDifference)postersDiff
{
  return self->_postersDiff;
}

- (BOOL)associatedPostersAreEqual
{
  return self->_associatedPostersAreEqual;
}

- (BOOL)orderedPostersAreEqual
{
  return self->_orderedPostersAreEqual;
}

- (BOOL)postersAreEqual
{
  return self->_postersAreEqual;
}

- (BOOL)selectedPostersAreEqual
{
  return self->_selectedPostersAreEqual;
}

- (BOOL)isEqual
{
  return self->_isEqual;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postersDiff, 0);
  objc_storeStrong((id *)&self->_assocPostersDiff, 0);
  objc_storeStrong((id *)&self->_addedAssocPosters, 0);
  objc_storeStrong((id *)&self->_removedAssocPosters, 0);
  objc_storeStrong((id *)&self->_updatedAssocPosters, 0);
  objc_storeStrong((id *)&self->_addedPosters, 0);
  objc_storeStrong((id *)&self->_removedPosters, 0);
  objc_storeStrong((id *)&self->_updatedPosters, 0);
  objc_storeStrong((id *)&self->_rhsCollection, 0);
  objc_storeStrong((id *)&self->_lhsCollection, 0);
}

- (void)initWithCollection:newCollection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithCollection:newCollection:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end
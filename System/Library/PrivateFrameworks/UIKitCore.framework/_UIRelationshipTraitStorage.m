@interface _UIRelationshipTraitStorage
- (_UIRelationshipTraitStorage)initWithCoder:(id)a3;
- (_UIRelationshipTraitStorage)initWithObject:(id)a3 keyPath:(id)a4 relationshipCandidates:(id)a5;
- (id)_propertyDescriptionString;
- (void)addRecordWithTraitCollection:(id)a3 addedObjects:(id)a4 removedObjects:(id)a5;
- (void)applyRecordsMatchingTraitCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIRelationshipTraitStorage

- (_UIRelationshipTraitStorage)initWithObject:(id)a3 keyPath:(id)a4 relationshipCandidates:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIRelationshipTraitStorage;
  v9 = [(_UITraitStorage *)&v13 initWithObject:a3 keyPath:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    relationshipCandidates = v9->_relationshipCandidates;
    v9->_relationshipCandidates = (NSOrderedSet *)v10;
  }
  return v9;
}

- (_UIRelationshipTraitStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIRelationshipTraitStorage;
  v5 = [(_UITraitStorage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIRelationshipCandidates"];
    relationshipCandidates = v5->_relationshipCandidates;
    v5->_relationshipCandidates = (NSOrderedSet *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRelationshipTraitStorage;
  id v4 = a3;
  [(_UITraitStorage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationshipCandidates, @"UIRelationshipCandidates", v5.receiver, v5.super_class);
}

- (void)addRecordWithTraitCollection:(id)a3 addedObjects:(id)a4 removedObjects:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(NSOrderedSet *)self->_relationshipCandidates set];
  char v13 = [v10 isSubsetOfSet:v12];

  if ((v13 & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UITraitStorage.m" lineNumber:407 description:@"Can only add known relationship candidates."];
  }
  v14 = [(NSOrderedSet *)self->_relationshipCandidates set];
  char v15 = [v11 isSubsetOfSet:v14];

  if ((v15 & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UITraitStorage.m" lineNumber:408 description:@"Can only remove known relationship candidates."];
  }
  if ([v10 intersectsSet:v11])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_UITraitStorage.m" lineNumber:409 description:@"Can't both add and remove an object."];
  }
  v16 = -[UITraitCollection _traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified]((uint64_t)v9);
  if (v16)
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = [v16 _traitsDescription];
      [v21 handleFailureInMethod:a2, self, @"_UITraitStorage.m", 411, @"Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@", v22 object file lineNumber description];

      goto LABEL_8;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v24 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        goto LABEL_15;
      }
      v25 = [v16 _traitsDescription];
      *(_DWORD *)buf = 138412290;
      v27 = v25;
      _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
    }
    else
    {
      v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &addRecordWithTraitCollection_addedObjects_removedObjects____s_category)+ 8);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      v24 = v23;
      v25 = [v16 _traitsDescription];
      *(_DWORD *)buf = 138412290;
      v27 = v25;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
    }

LABEL_15:
  }
LABEL_8:
  v17 = [[_UIRelationshipTraitStorageRecord alloc] initWithTraitCollection:v9 addedObjects:v10 removedObjects:v11];
  [(_UITraitStorage *)self addRecord:v17];
}

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (void *)[(NSOrderedSet *)self->_relationshipCandidates mutableCopy];
  uint64_t v6 = [(_UITraitStorage *)self object];
  v7 = [(_UITraitStorage *)self keyPath];
  id v8 = [v6 valueForKeyPath:v7];
  id v9 = v5;
  id v10 = v8;
  if ([v10 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      v12 = [v10 objectAtIndex:v11];
      if ([v9 containsObject:v12]) {
        break;
      }
      [v9 insertObject:v12 atIndex:v11];

      if (++v11 >= (unint64_t)[v10 count]) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
  uint64_t v13 = [v10 count];
  if (v13 >= 1)
  {
    uint64_t v14 = v13;
    do
    {
      uint64_t v15 = v14 - 1;
      v16 = [v10 objectAtIndex:v14 - 1];
      if (([v9 containsObject:v16] & 1) == 0)
      {
        if (v14 == [v10 count])
        {
          [v9 addObject:v16];
        }
        else
        {
          v17 = [v10 objectAtIndex:v14];
          objc_msgSend(v9, "insertObject:atIndex:", v16, objc_msgSend(v9, "indexOfObject:", v17));
        }
      }

      uint64_t v14 = v15;
    }
    while ((unint64_t)(v15 + 1) > 1);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v33 = self;
  v19 = [(_UITraitStorage *)self records];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v25 = [v24 traitCollection];
        v26 = (void *)v25;
        if (!v4 || v25)
        {
          BOOL v27 = -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v4, v25);

          if (!v27) {
            continue;
          }
        }
        uint64_t v28 = [v24 addedObjects];
        [v18 minusSet:v28];

        v29 = [v24 removedObjects];
        [v18 unionSet:v29];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v21);
  }

  [v9 minusSet:v18];
  v30 = [(_UITraitStorage *)v33 object];
  v31 = [v9 array];
  v32 = [(_UITraitStorage *)v33 keyPath];
  objc_msgSend(v30, "_uikit_applyValueFromTraitStorage:forKeyPath:", v31, v32);
}

- (id)_propertyDescriptionString
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UIRelationshipTraitStorage;
  id v4 = [(_UITraitStorage *)&v7 _propertyDescriptionString];
  objc_super v5 = [v3 stringWithFormat:@"%@, relationshipCandidates=%@", v4, self->_relationshipCandidates];

  return v5;
}

- (void).cxx_destruct
{
}

@end
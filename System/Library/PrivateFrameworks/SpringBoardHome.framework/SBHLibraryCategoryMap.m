@interface SBHLibraryCategoryMap
+ (BOOL)supportsSecureCoding;
+ (id)diffMap:(id)a3 withMap:(id)a4;
- (BOOL)categoriesContainApplicationIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCategoryMap:(id)a3;
- (BOOL)loadedFromDisk;
- (NSArray)categoryIdentifiers;
- (NSDate)generatedDate;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)localizedCategoryNameByCategoryIdentifier;
- (NSDictionary)metadata;
- (NSDictionary)sortedApplicationIdentifiersByCategoryIdentifier;
- (NSString)uniqueIdentifier;
- (SBHLibraryCategoryMap)init;
- (SBHLibraryCategoryMap)initWithCoder:(id)a3;
- (id)categoryIdentifierForProactiveCategoryIdentifier:(unint64_t)a3;
- (id)categoryIdentifiersForApplicationIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedCategoryNameForCategoryIdentifier:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sortedApplicationIdentifiersForCategoryIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryIdentifiers:(id)a3;
- (void)setGeneratedDate:(id)a3;
- (void)setLoadedFromDisk:(BOOL)a3;
- (void)setLocalizedCategoryNameByCategoryIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSortedApplicationIdentifiersByCategoryIdentifier:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SBHLibraryCategoryMap

- (id)sortedApplicationIdentifiersForCategoryIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sortedApplicationIdentifiersByCategoryIdentifier objectForKey:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SBHLibraryCategoryMap *)self categoryIdentifiers];
  [v4 setCategoryIdentifiers:v5];

  v6 = [(SBHLibraryCategoryMap *)self sortedApplicationIdentifiersByCategoryIdentifier];
  [v4 setSortedApplicationIdentifiersByCategoryIdentifier:v6];

  v7 = [(SBHLibraryCategoryMap *)self localizedCategoryNameByCategoryIdentifier];
  [v4 setLocalizedCategoryNameByCategoryIdentifier:v7];

  v8 = [(SBHLibraryCategoryMap *)self metadata];
  [v4 setMetadata:v8];

  objc_msgSend(v4, "setLoadedFromDisk:", -[SBHLibraryCategoryMap loadedFromDisk](self, "loadedFromDisk"));
  v9 = [(SBHLibraryCategoryMap *)self uniqueIdentifier];
  [v4 setUniqueIdentifier:v9];

  v10 = [(SBHLibraryCategoryMap *)self generatedDate];
  [v4 setGeneratedDate:v10];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SBHLibraryCategoryMap *)self categoryIdentifiers];
  [v4 setCategoryIdentifiers:v5];

  v6 = [(SBHLibraryCategoryMap *)self sortedApplicationIdentifiersByCategoryIdentifier];
  [v4 setSortedApplicationIdentifiersByCategoryIdentifier:v6];

  v7 = [(SBHLibraryCategoryMap *)self localizedCategoryNameByCategoryIdentifier];
  [v4 setLocalizedCategoryNameByCategoryIdentifier:v7];

  v8 = [(SBHLibraryCategoryMap *)self metadata];
  [v4 setMetadata:v8];

  objc_msgSend(v4, "setLoadedFromDisk:", -[SBHLibraryCategoryMap loadedFromDisk](self, "loadedFromDisk"));
  v9 = [(SBHLibraryCategoryMap *)self uniqueIdentifier];
  [v4 setUniqueIdentifier:v9];

  v10 = [(SBHLibraryCategoryMap *)self generatedDate];
  [v4 setGeneratedDate:v10];

  return v4;
}

- (NSArray)categoryIdentifiers
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_categoryIdentifiers array];
}

- (void)setMetadata:(id)a3
{
}

- (void)setCategoryIdentifiers:(id)a3
{
  v4 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:a3];
  categoryIdentifiers = self->_categoryIdentifiers;
  self->_categoryIdentifiers = v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDictionary)sortedApplicationIdentifiersByCategoryIdentifier
{
  return &self->_sortedApplicationIdentifiersByCategoryIdentifier->super;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setSortedApplicationIdentifiersByCategoryIdentifier:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  id v7 = v4;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (NSMutableDictionary *)objc_opt_new();
  }
  sortedApplicationIdentifiersByCategoryIdentifier = self->_sortedApplicationIdentifiersByCategoryIdentifier;
  self->_sortedApplicationIdentifiersByCategoryIdentifier = v5;
}

- (void)setLocalizedCategoryNameByCategoryIdentifier:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  id v7 = v4;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (NSMutableDictionary *)objc_opt_new();
  }
  localizedCategoryNameByCategoryIdentifier = self->_localizedCategoryNameByCategoryIdentifier;
  self->_localizedCategoryNameByCategoryIdentifier = v5;
}

- (void)setLoadedFromDisk:(BOOL)a3
{
  self->_loadedFromDisk = a3;
}

- (void)setGeneratedDate:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDictionary)localizedCategoryNameByCategoryIdentifier
{
  return &self->_localizedCategoryNameByCategoryIdentifier->super;
}

- (BOOL)loadedFromDisk
{
  return self->_loadedFromDisk;
}

- (SBHLibraryCategoryMap)init
{
  v15.receiver = self;
  v15.super_class = (Class)SBHLibraryCategoryMap;
  v2 = [(SBHLibraryCategoryMap *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    categoryIdentifiers = v2->_categoryIdentifiers;
    v2->_categoryIdentifiers = (NSMutableOrderedSet *)v3;

    uint64_t v5 = objc_opt_new();
    sortedApplicationIdentifiersByCategoryIdentifier = v2->_sortedApplicationIdentifiersByCategoryIdentifier;
    v2->_sortedApplicationIdentifiersByCategoryIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    localizedCategoryNameByCategoryIdentifier = v2->_localizedCategoryNameByCategoryIdentifier;
    v2->_localizedCategoryNameByCategoryIdentifier = (NSMutableDictionary *)v7;

    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    generatedDate = v2->_generatedDate;
    v2->_generatedDate = (NSDate *)v12;

    v2->_loadedFromDisk = 0;
  }
  return v2;
}

- (NSDate)generatedDate
{
  return self->_generatedDate;
}

- (BOOL)isEqualToCategoryMap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4
    && [*((id *)v4 + 1) isEqual:self->_categoryIdentifiers]
    && [(NSMutableDictionary *)self->_sortedApplicationIdentifiersByCategoryIdentifier isEqualToDictionary:v5[2]])
  {
    char v6 = [(NSMutableDictionary *)self->_localizedCategoryNameByCategoryIdentifier isEqualToDictionary:v5[3]];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_generatedDate, 0);
  objc_storeStrong((id *)&self->_localizedCategoryNameByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_sortedApplicationIdentifiersByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBHLibraryCategoryMap)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SBHLibraryCategoryMap;
  uint64_t v5 = [(SBHLibraryCategoryMap *)&v41 init];
  if (v5)
  {
    char v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_categoryIdentifiers"];
    v11 = (void *)v10;
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    id v13 = v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v13];

    categoryIdentifiers = v5->_categoryIdentifiers;
    v5->_categoryIdentifiers = (NSMutableOrderedSet *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v21 = [v4 decodeObjectOfClasses:v20 forKey:@"_sortedApplicationIdentifiersByCategoryIdentifier"];
    v22 = v21;
    if (v21) {
      id v23 = v21;
    }
    else {
      id v23 = (id)objc_opt_new();
    }
    v24 = v23;

    objc_storeStrong((id *)&v5->_sortedApplicationIdentifiersByCategoryIdentifier, v24);
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    v29 = [v4 decodeObjectOfClasses:v28 forKey:@"_localizedCategoryNameByCategoryIdentifier"];
    v30 = v29;
    if (v29) {
      id v31 = v29;
    }
    else {
      id v31 = (id)objc_opt_new();
    }
    v32 = v31;

    objc_storeStrong((id *)&v5->_localizedCategoryNameByCategoryIdentifier, v32);
    if ([v4 containsValueForKey:@"_uniqueIdentifier"])
    {
      v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueIdentifier"];
    }
    else
    {
      v34 = [MEMORY[0x1E4F29128] UUID];
      v33 = [v34 UUIDString];
    }
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = v33;
    v36 = v33;

    if ([v4 containsValueForKey:@"_generatedDate"]) {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_generatedDate"];
    }
    else {
    uint64_t v37 = [MEMORY[0x1E4F1C9C8] date];
    }
    generatedDate = v5->_generatedDate;
    v5->_generatedDate = (NSDate *)v37;

    if ([v4 containsValueForKey:@"_loadedFromDisk"]) {
      char v39 = [v4 decodeBoolForKey:@"_loadedFromDisk"];
    }
    else {
      char v39 = 1;
    }
    v5->_loadedFromDisk = v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  categoryIdentifiers = self->_categoryIdentifiers;
  id v8 = a3;
  uint64_t v5 = [(NSMutableOrderedSet *)categoryIdentifiers array];
  char v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [v8 encodeObject:v7 forKey:@"_categoryIdentifiers"];

  [v8 encodeObject:self->_sortedApplicationIdentifiersByCategoryIdentifier forKey:@"_sortedApplicationIdentifiersByCategoryIdentifier"];
  [v8 encodeObject:self->_localizedCategoryNameByCategoryIdentifier forKey:@"_localizedCategoryNameByCategoryIdentifier"];
  [v8 encodeBool:1 forKey:@"_loadedFromDisk"];
  [v8 encodeObject:self->_uniqueIdentifier forKey:@"_uniqueIdentifier"];
  [v8 encodeObject:self->_generatedDate forKey:@"_generatedDate"];
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(SBHLibraryCategoryMap *)self categoryIdentifiers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [(SBHLibraryCategoryMap *)self sortedApplicationIdentifiersForCategoryIdentifier:v8];
        uint64_t v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = MEMORY[0x1E4F1CBF0];
        }
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "predictionCategoryID"));
        id v13 = [v12 description];
        [v3 setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SBHLibraryCategoryMap *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(SBHLibraryCategoryMap *)self isEqualToCategoryMap:v4];
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_generatedDate withName:@"generatedDate"];
  id v5 = (id)[v3 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  id v6 = (id)[v3 appendBool:self->_loadedFromDisk withName:@"loadedFromDisk"];
  uint64_t v7 = [(NSMutableOrderedSet *)self->_categoryIdentifiers valueForKey:@"predictionCategoryID"];
  [v3 appendArraySection:v7 withName:@"categoryIdentifiers" skipIfEmpty:0];

  [v3 appendDictionarySection:self->_sortedApplicationIdentifiersByCategoryIdentifier withName:@"sortedApplicationIdentifiersByCategoryIdentifier" skipIfEmpty:0];
  [v3 appendDictionarySection:self->_localizedCategoryNameByCategoryIdentifier withName:@"_localizedCategoryNameByCategoryIdentifier" skipIfEmpty:0];
  id v8 = [v3 build];

  return v8;
}

+ (id)diffMap:(id)a3 withMap:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)a3;
  id v6 = (id *)a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"LHS: %p\nRHS: %p\n", v5, v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SBHLibraryCategoryMap_diffMap_withMap___block_invoke;
  aBlock[3] = &unk_1E6AAF8C0;
  id v38 = v7;
  id v44 = v38;
  id v8 = (void (**)(void *, uint64_t, void *, void *))_Block_copy(aBlock);
  uint64_t v9 = +[SBHLibraryCategoryIdentifier categoryWithLocalizedDisplayName:@"CategoryIdentifiers" categoryID:31337 categoryIndex:0];
  uint64_t v10 = [v5[1] array];
  uint64_t v11 = [v6[1] array];
  v35 = (void *)v9;
  v8[2](v8, v9, v10, v11);

  uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
  id v13 = [v5[1] set];
  uint64_t v14 = [v12 setWithSet:v13];

  objc_super v15 = v6;
  long long v16 = [v6[1] array];
  [v14 addObjectsFromArray:v16];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v14;
  uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v21 = [v5[3] objectForKeyedSubscript:v20];
        uint64_t v22 = [v15[3] objectForKeyedSubscript:v20];
        id v23 = (void *)v22;
        if (v21) {
          BOOL v24 = v22 == 0;
        }
        else {
          BOOL v24 = 0;
        }
        v25 = @"\t--> ADD %@: ";
        if (v24 || (!v21 ? (BOOL v26 = v22 == 0) : (BOOL v26 = 1), v25 = @"\t--> DELETE %@: ", !v26)) {
          objc_msgSend(v38, "appendFormat:", v25, v20);
        }
        if (([v21 isEqualToString:v23] & 1) == 0) {
          [v38 appendFormat:@"Category id '%@' name change from '%@'->'%@'", v20, v21, v23];
        }
        [v5[2] objectForKeyedSubscript:v20];
        v28 = uint64_t v27 = v5;
        uint64_t v29 = [v15[2] objectForKeyedSubscript:v20];
        v30 = (void *)v29;
        if (v28) {
          id v31 = v28;
        }
        else {
          id v31 = (void *)MEMORY[0x1E4F1CBF0];
        }
        if (v29) {
          uint64_t v32 = v29;
        }
        else {
          uint64_t v32 = MEMORY[0x1E4F1CBF0];
        }
        v8[2](v8, v20, v31, (void *)v32);

        id v5 = v27;
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v18);
  }

  id v33 = v38;
  return v33;
}

void __41__SBHLibraryCategoryMap_diffMap_withMap___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a3 | a4)
  {
    id v8 = [(id)a3 differenceFromArray:a4];
    if ([v8 hasChanges])
    {
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v7 localizedDisplayName];
      [v9 appendFormat:@"\t-->%@: ", v10];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v11 = [v8 removals];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(a1 + 32);
            uint64_t v17 = [*(id *)(*((void *)&v29 + 1) + 8 * v15) object];
            [v16 appendFormat:@"\n\t\tDELETION %@", v17];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v13);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v18 = [v8 insertions];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(a1 + 32);
            BOOL v24 = [*(id *)(*((void *)&v25 + 1) + 8 * v22) object];
            [v23 appendFormat:@"\n\t\tINSERT %@", v24];

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v20);
      }

      [*(id *)(a1 + 32) appendString:@"\n"];
    }
  }
}

- (id)localizedCategoryNameForCategoryIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_localizedCategoryNameByCategoryIdentifier objectForKey:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)categoriesContainApplicationIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(SBHLibraryCategoryMap *)self categoryIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(SBHLibraryCategoryMap *)self sortedApplicationIdentifiersForCategoryIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        char v11 = [v10 containsObject:v4];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)categoryIdentifiersForApplicationIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_sortedApplicationIdentifiersByCategoryIdentifier;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = -[NSMutableDictionary objectForKey:](self->_sortedApplicationIdentifiersByCategoryIdentifier, "objectForKey:", v11, (void)v15);
        int v13 = [v12 containsObject:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)categoryIdentifierForProactiveCategoryIdentifier:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SBHLibraryCategoryMap *)self categoryIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 predictionCategoryID] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

@end
@interface STStatusBarOverridesStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STStatusBarOverridesStatusDomainDataDiff)init;
- (STStatusBarOverridesStatusDomainDataDiff)initWithChanges:(id)a3 suppressedBackgroundActivityIdentifierListDataDiff:(id)a4;
- (STStatusBarOverridesStatusDomainDataDiff)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingToData:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffByApplyingDiff:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)applyToMutableData:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarOverridesStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v53 = a4;
  id v54 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v52 = v5;
  v6 = [v5 customOverrides];
  v7 = v6;
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = objc_alloc_init(STStatusBarData);
  }
  v55 = v8;

  v9 = [v53 customOverrides];
  v10 = v9;
  if (v9) {
    v11 = v9;
  }
  else {
    v11 = objc_alloc_init(STStatusBarData);
  }
  v12 = v11;

  v51 = [v53 editedKeys];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v13 = +[STStatusBarData entryKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v61;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v60 + 1) + 8 * v17);
        v19 = [(STStatusBarData *)v55 entryForKey:v18];
        v20 = [(STStatusBarData *)v12 entryForKey:v18];
        id v21 = v19;
        id v22 = v20;
        if (v21 == v22 || ([v21 isEqual:v22] & 1) != 0)
        {
          id v23 = 0;
        }
        else
        {
          if (v22)
          {
            id v24 = v22;
          }
          else
          {
            id v24 = [MEMORY[0x1E4F1CA98] null];
          }
          id v23 = v24;
        }

        if (!v23)
        {
          if (![v51 containsObject:v18]) {
            goto LABEL_23;
          }
          if (v22)
          {
            id v23 = v22;
          }
          else
          {
            id v23 = [MEMORY[0x1E4F1CA98] null];
            if (!v23) {
              goto LABEL_23;
            }
          }
        }
        uint64_t v25 = qword_1EB5A35C8;
        id v26 = v18;
        if (v25 != -1) {
          dispatch_once(&qword_1EB5A35C8, &__block_literal_global_14);
        }
        uint64_t v27 = [(id)_MergedGlobals_13 indexOfObject:v26];

        [v54 setObject:v23 forSetting:v27];
LABEL_23:

        ++v17;
      }
      while (v15 != v17);
      uint64_t v28 = [v13 countByEnumeratingWithState:&v60 objects:v65 count:16];
      uint64_t v15 = v28;
    }
    while (v28);
  }

  v29 = [v52 suppressedBackgroundActivityIdentifierListData];
  v30 = [v53 suppressedBackgroundActivityIdentifierListData];
  v31 = +[STListDataDiff diffFromListData:v29 toListData:v30];

  v32 = [v53 editedIdentifiers];
  if ([v32 count])
  {
    v50 = v31;
    v33 = objc_alloc_init(STMutableListData);
    v48 = objc_alloc_init(STMutableListData);
    v49 = v32;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v34 = v32;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          v40 = objc_msgSend(v52, "suppressedBackgroundActivityIdentifiers", v48);
          char v41 = [v40 containsObject:v39];

          v42 = [v53 suppressedBackgroundActivityIdentifiers];
          char v43 = [v42 containsObject:v39];

          if ((v41 & 1) == 0 && (v43 & 1) == 0) {
            [(STMutableListData *)v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v36);
    }

    v44 = v48;
    if ([(STListData *)v33 count] || [(STListData *)v48 count])
    {
      v45 = +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v33, v48, v48);
      v31 = [v50 diffByApplyingDiff:v45];
    }
    else
    {
      v31 = v50;
    }

    v32 = v49;
  }
  v46 = [[STStatusBarOverridesStatusDomainDataDiff alloc] initWithChanges:v54 suppressedBackgroundActivityIdentifierListDataDiff:v31];

  return v46;
}

- (STStatusBarOverridesStatusDomainDataDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  v4 = objc_alloc_init(STListDataDiff);
  id v5 = [(STStatusBarOverridesStatusDomainDataDiff *)self initWithChanges:v3 suppressedBackgroundActivityIdentifierListDataDiff:v4];

  return v5;
}

- (STStatusBarOverridesStatusDomainDataDiff)initWithChanges:(id)a3 suppressedBackgroundActivityIdentifierListDataDiff:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STStatusBarOverridesStatusDomainDataDiff;
  v8 = [(STStatusBarOverridesStatusDomainDataDiff *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    changes = v8->_changes;
    v8->_changes = (BSSettings *)v9;

    uint64_t v11 = [v7 copy];
    suppressedBackgroundActivityIdentifierListDataDiff = v8->_suppressedBackgroundActivityIdentifierListDataDiff;
    v8->_suppressedBackgroundActivityIdentifierListDataDiff = (STListDataDiff *)v11;
  }
  return v8;
}

- (id)dataByApplyingToData:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  [(STStatusBarOverridesStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  id v4 = a3;
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  id v6 = changes;
  if (([(BSSettings *)v6 isEmpty] & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__STStatusBarOverridesStatusDomainDataDiff_applyToMutableData___block_invoke;
    v10[3] = &unk_1E6B63030;
    id v11 = v4;
    [(BSSettings *)v6 enumerateObjectsWithBlock:v10];
  }
  if (self) {
    suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
  }
  else {
    suppressedBackgroundActivityIdentifierListDataDiff = 0;
  }
  v8 = suppressedBackgroundActivityIdentifierListDataDiff;
  uint64_t v9 = [v4 suppressedBackgroundActivityIdentifierListData];
  [(STListDataDiff *)v8 applyToMutableListData:v9];
}

void __63__STStatusBarOverridesStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (qword_1EB5A35C8 != -1) {
    dispatch_once(&qword_1EB5A35C8, &__block_literal_global_14);
  }
  id v5 = [(id)_MergedGlobals_13 objectAtIndex:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v7;
  }
  else
  {

    id v6 = 0;
  }
  id v8 = v6;
  [*(id *)(a1 + 32) setEntry:v6 forKey:v5];
}

- (BOOL)isEmpty
{
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  id v4 = changes;
  if ([(BSSettings *)v4 isEmpty])
  {
    if (self) {
      suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
    }
    else {
      suppressedBackgroundActivityIdentifierListDataDiff = 0;
    }
    BOOL v6 = [(STListDataDiff *)suppressedBackgroundActivityIdentifierListDataDiff isEmpty];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (self) {
      changes = self->_changes;
    }
    else {
      changes = 0;
    }
    id v7 = (void *)[(BSSettings *)changes mutableCopy];
    if (v5) {
      id v8 = (void *)v5[1];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    [v7 applySettings:v9];
    if (self)
    {
      suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
      if (v5)
      {
LABEL_8:
        uint64_t v11 = v5[2];
LABEL_9:
        v12 = suppressedBackgroundActivityIdentifierListDataDiff;
        v13 = [(STListDataDiff *)v12 diffByApplyingDiff:v11];

        objc_super v14 = [[STStatusBarOverridesStatusDomainDataDiff alloc] initWithChanges:v7 suppressedBackgroundActivityIdentifierListDataDiff:v13];
        goto LABEL_11;
      }
    }
    else
    {
      suppressedBackgroundActivityIdentifierListDataDiff = 0;
      if (v5) {
        goto LABEL_8;
      }
    }
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  objc_super v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STStatusBarOverridesStatusDomainDataDiff *)self isEmpty]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEmpty];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke;
  v19[3] = &unk_1E6B640B0;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:changes counterpart:v19];
  if (self) {
    self = (STStatusBarOverridesStatusDomainDataDiff *)self->_suppressedBackgroundActivityIdentifierListDataDiff;
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke_2;
  uint64_t v17 = &unk_1E6B640D8;
  id v18 = v8;
  id v10 = v8;
  id v11 = (id)[v5 appendObject:self counterpart:&v14];
  char v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v12;
}

id __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __52__STStatusBarOverridesStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 16);
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendObject:self->_changes];
    suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
  }
  else
  {
    id v10 = (id)[v3 appendObject:0];
    suppressedBackgroundActivityIdentifierListDataDiff = 0;
  }
  id v7 = (id)[v4 appendObject:suppressedBackgroundActivityIdentifierListDataDiff];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STStatusBarOverridesStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_changes forKey:@"changes"];
    suppressedBackgroundActivityIdentifierListDataDiff = self->_suppressedBackgroundActivityIdentifierListDataDiff;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"changes"];
    suppressedBackgroundActivityIdentifierListDataDiff = 0;
  }
  [a3 encodeObject:suppressedBackgroundActivityIdentifierListDataDiff forKey:@"suppressedBackgroundActivityIdentifierListDataDiff"];
}

- (STStatusBarOverridesStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppressedBackgroundActivityIdentifierListDataDiff"];

  id v7 = [(STStatusBarOverridesStatusDomainDataDiff *)self initWithChanges:v5 suppressedBackgroundActivityIdentifierListDataDiff:v6];
  return v7;
}

- (id)succinctDescription
{
  v2 = [(STStatusBarOverridesStatusDomainDataDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STStatusBarOverridesStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STStatusBarOverridesStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((uint64_t)self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = [(id)a1 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];

    id v7 = *(id *)(a1 + 8);
    if (([v7 isEmpty] & 1) == 0)
    {
      unint64_t v8 = [v6 activeMultilinePrefix];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
      uint64_t v14 = &unk_1E6B63080;
      id v15 = v7;
      id v16 = v6;
      [v16 appendBodySectionWithName:0 multilinePrefix:v8 block:&v11];
    }
    id v9 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", *(void *)(a1 + 16), @"suppressedBackgroundActivityIdentifiers", 1, v11, v12, v13, v14);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusBarOverridesStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((uint64_t)self, a3, 0);
}

void __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2;
  v2[3] = &unk_1E6B63030;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsWithBlock:v2];
}

void __92__STStatusBarOverridesStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (qword_1EB5A35C8 != -1) {
    dispatch_once(&qword_1EB5A35C8, &__block_literal_global_14);
  }
  id v5 = [(id)_MergedGlobals_13 objectAtIndex:a2];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:v7 withName:v5 skipIfNil:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressedBackgroundActivityIdentifierListDataDiff, 0);

  objc_storeStrong((id *)&self->_changes, 0);
}

@end
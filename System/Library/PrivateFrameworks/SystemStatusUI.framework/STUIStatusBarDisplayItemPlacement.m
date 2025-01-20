@interface STUIStatusBarDisplayItemPlacement
+ (STUIStatusBarDisplayItemPlacement)placementWithIdentifier:(id)a3 priority:(int64_t)a4;
+ (id)spacerPlacementWithSize:(CGSize)a3 priority:(int64_t)a4;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)itemInfo;
- (NSHashTable)allRequiredPlacements;
- (NSHashTable)anyRequiredPlacements;
- (NSHashTable)excludedPlacements;
- (NSHashTable)includedPlacements;
- (NSSet)excludedRegionIdentifiers;
- (STUIStatusBarIdentifier)identifier;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescription;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)disabledPlacement;
- (id)excludingAllPlacementsInRegions:(id)a3;
- (id)excludingAllPlacementsInRegions:(id)a3 exceptPlacements:(id)a4;
- (id)excludingPlacements:(id)a3;
- (id)requiringAllPlacements:(id)a3;
- (id)requiringAnyPlacements:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)withItemInfo:(id)a3;
- (int64_t)priority;
- (unint64_t)hash;
- (void)setEnabled:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation STUIStatusBarDisplayItemPlacement

uint64_t __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

uint64_t __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) priority];
}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  identifier = self->_identifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke;
  v19[3] = &unk_1E6AA4410;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendPointer:identifier counterpart:v19];
  int64_t v10 = [(STUIStatusBarDisplayItemPlacement *)self priority];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke_2;
  v17 = &unk_1E6AA4438;
  id v18 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendInteger:v10 counterpart:&v14];
  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v10;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSHashTable)anyRequiredPlacements
{
  return self->_anyRequiredPlacements;
}

- (NSSet)excludedRegionIdentifiers
{
  return self->_excludedRegionIdentifiers;
}

- (NSHashTable)excludedPlacements
{
  return self->_excludedPlacements;
}

- (NSHashTable)allRequiredPlacements
{
  return self->_allRequiredPlacements;
}

- (NSHashTable)includedPlacements
{
  return self->_includedPlacements;
}

- (NSDictionary)itemInfo
{
  return self->_itemInfo;
}

+ (STUIStatusBarDisplayItemPlacement)placementWithIdentifier:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  id v8 = (void *)v7[3];
  v7[3] = v6;

  v7[2] = a4;
  *((unsigned char *)v7 + 8) = 1;
  return (STUIStatusBarDisplayItemPlacement *)v7;
}

- (id)requiringAllPlacements:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!--v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
  if (!self->_allRequiredPlacements)
  {
    id v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    allRequiredPlacements = self->_allRequiredPlacements;
    self->_allRequiredPlacements = v8;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSHashTable addObject:](self->_allRequiredPlacements, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * v14++), (void)v16);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  return self;
}

+ (id)spacerPlacementWithSize:(CGSize)a3 priority:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[STUIStatusBarSpacerItem randomDisplayIdentifier];
  id v8 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v7 priority:a4];
  uint64_t v13 = @"size";
  id v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v11 = [v8 withItemInfo:v10];

  return v11;
}

- (id)withItemInfo:(id)a3
{
  return self;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendPointer:self->_identifier];
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarDisplayItemPlacement priority](self, "priority"));
  unint64_t v6 = [v3 hash];

  return v6;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemInfo, 0);
  objc_storeStrong((id *)&self->_anyRequiredPlacements, 0);
  objc_storeStrong((id *)&self->_allRequiredPlacements, 0);
  objc_storeStrong((id *)&self->_includedPlacements, 0);
  objc_storeStrong((id *)&self->_excludedRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_excludedPlacements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)requiringAnyPlacements:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!--v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
  if (!self->_anyRequiredPlacements)
  {
    id v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    anyRequiredPlacements = self->_anyRequiredPlacements;
    self->_anyRequiredPlacements = v8;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSHashTable addObject:](self->_anyRequiredPlacements, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * v14++), (void)v16);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  return self;
}

- (id)excludingPlacements:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!--v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
  if (!self->_excludedPlacements)
  {
    id v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    excludedPlacements = self->_excludedPlacements;
    self->_excludedPlacements = v8;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSHashTable addObject:](self->_excludedPlacements, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * v14++), (void)v16);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  return self;
}

- (id)excludingAllPlacementsInRegions:(id)a3 exceptPlacements:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  excludedRegionIdentifiers = self->_excludedRegionIdentifiers;
  if (excludedRegionIdentifiers)
  {
    id v9 = [(NSSet *)excludedRegionIdentifiers setByAddingObjectsFromArray:v6];
    id v10 = self->_excludedRegionIdentifiers;
    self->_excludedRegionIdentifiers = v9;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    uint64_t v12 = self->_excludedRegionIdentifiers;
    self->_excludedRegionIdentifiers = v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    includedPlacements = self->_includedPlacements;
    self->_includedPlacements = v13;

    [(NSHashTable *)self->_includedPlacements addObject:self];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NSHashTable addObject:](self->_includedPlacements, "addObject:", *(void *)(*((void *)&v21 + 1) + 8 * v19++), (void)v21);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }

  return self;
}

- (id)excludingAllPlacementsInRegions:(id)a3
{
  return [(STUIStatusBarDisplayItemPlacement *)self excludingAllPlacementsInRegions:a3 exceptPlacements:MEMORY[0x1E4F1CBF0]];
}

- (id)disabledPlacement
{
  return self;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)description
{
  return [(STUIStatusBarDisplayItemPlacement *)self descriptionWithMultilinePrefix:0];
}

- (id)debugDescription
{
  return [(STUIStatusBarDisplayItemPlacement *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarDisplayItemPlacement *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarDisplayItemPlacement *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarDisplayItemPlacement *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarDisplayItemPlacement *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STUIStatusBarDisplayItemPlacement *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  id v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__STUIStatusBarDisplayItemPlacement__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6AA39F0;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __85__STUIStatusBarDisplayItemPlacement__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"identifier"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), @"enabled");
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "priority"), @"priority");
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) excludedPlacements];
  id v9 = (id)objc_msgSend(v7, "appendInteger:withName:", objc_msgSend(v8, "count"), @"excludedPlacements");

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) allRequiredPlacements];
  id v12 = (id)objc_msgSend(v10, "appendInteger:withName:", objc_msgSend(v11, "count"), @"allRequiredPlacements");

  id v13 = *(void **)(a1 + 32);
  id v15 = [*(id *)(a1 + 40) anyRequiredPlacements];
  id v14 = (id)objc_msgSend(v13, "appendInteger:withName:", objc_msgSend(v15, "count"), @"anyRequiredPlacements");
}

@end
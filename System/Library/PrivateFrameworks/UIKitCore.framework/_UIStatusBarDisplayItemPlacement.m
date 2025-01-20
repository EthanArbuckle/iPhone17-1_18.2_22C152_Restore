@interface _UIStatusBarDisplayItemPlacement
+ (_UIStatusBarDisplayItemPlacement)placementWithIdentifier:(id)a3 priority:(int64_t)a4;
+ (id)spacerPlacementWithSize:(CGSize)a3 priority:(int64_t)a4;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)itemInfo;
- (NSHashTable)allRequiredPlacements;
- (NSHashTable)anyRequiredPlacements;
- (NSHashTable)excludedPlacements;
- (NSHashTable)includedPlacements;
- (NSSet)excludedRegionIdentifiers;
- (_UIStatusBarIdentifier)identifier;
- (id)description;
- (id)disabledPlacement;
- (id)excludingAllPlacementsInRegions:(id)a3;
- (id)excludingAllPlacementsInRegions:(id)a3 exceptPlacements:(id)a4;
- (id)excludingPlacements:(id)a3;
- (id)requiringAllPlacements:(id)a3;
- (id)requiringAnyPlacements:(id)a3;
- (id)withItemInfo:(id)a3;
- (int64_t)priority;
- (unint64_t)hash;
- (void)setEnabled:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation _UIStatusBarDisplayItemPlacement

+ (_UIStatusBarDisplayItemPlacement)placementWithIdentifier:(id)a3 priority:(int64_t)a4
{
  id v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarDisplayItemPlacement.m" lineNumber:21 description:@"identifier must not be nil"];
  }
  v9 = (void *)v8[3];
  v8[3] = v7;

  v8[2] = a4;
  *((unsigned char *)v8 + 8) = 1;
  return (_UIStatusBarDisplayItemPlacement *)v8;
}

- (id)disabledPlacement
{
  return self;
}

- (id)excludingPlacements:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 priority];
        if (v11 >= [(_UIStatusBarDisplayItemPlacement *)self priority])
        {
          v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemPlacement.m", 39, @"Item placement %@ can't exclude item placement with higher priority %@", self, v10 object file lineNumber description];
        }
        v12 = [v10 identifier];
        v13 = [(_UIStatusBarDisplayItemPlacement *)self identifier];

        if (v12 == v13)
        {
          v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemPlacement.m", 40, @"Item placement %@ can't exclude item placement with same identifier %@", self, v10 object file lineNumber description];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  if (!self->_excludedPlacements)
  {
    v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    excludedPlacements = self->_excludedPlacements;
    self->_excludedPlacements = v16;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        [(NSHashTable *)self->_excludedPlacements addObject:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v20);
  }

  return self;
}

- (id)excludingAllPlacementsInRegions:(id)a3
{
  return [(_UIStatusBarDisplayItemPlacement *)self excludingAllPlacementsInRegions:a3 exceptPlacements:MEMORY[0x1E4F1CBF0]];
}

- (id)excludingAllPlacementsInRegions:(id)a3 exceptPlacements:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  excludedRegionIdentifiers = self->_excludedRegionIdentifiers;
  if (excludedRegionIdentifiers)
  {
    v9 = [(NSSet *)excludedRegionIdentifiers setByAddingObjectsFromArray:v6];
    v10 = self->_excludedRegionIdentifiers;
    self->_excludedRegionIdentifiers = v9;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    v12 = self->_excludedRegionIdentifiers;
    self->_excludedRegionIdentifiers = v11;

    v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
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

- (id)requiringAllPlacements:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 priority];
        if (v11 <= [(_UIStatusBarDisplayItemPlacement *)self priority])
        {
          v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemPlacement.m", 80, @"Item placement %@ can't require item placement with lower priority %@", self, v10 object file lineNumber description];
        }
        v12 = [v10 identifier];
        v13 = [(_UIStatusBarDisplayItemPlacement *)self identifier];

        if (v12 == v13)
        {
          id v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemPlacement.m", 81, @"Item placement %@ can't require item placement with same identifier %@", self, v10 object file lineNumber description];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  if (!self->_allRequiredPlacements)
  {
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    allRequiredPlacements = self->_allRequiredPlacements;
    self->_allRequiredPlacements = v16;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        [(NSHashTable *)self->_allRequiredPlacements addObject:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v20);
  }

  return self;
}

- (id)requiringAnyPlacements:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 priority];
        if (v11 <= [(_UIStatusBarDisplayItemPlacement *)self priority])
        {
          v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemPlacement.m", 98, @"Item placement %@ can't require item placement with lower priority %@", self, v10 object file lineNumber description];
        }
        v12 = [v10 identifier];
        v13 = [(_UIStatusBarDisplayItemPlacement *)self identifier];

        if (v12 == v13)
        {
          id v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemPlacement.m", 99, @"Item placement %@ can't require item placement with same identifier %@", self, v10 object file lineNumber description];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  if (!self->_anyRequiredPlacements)
  {
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    anyRequiredPlacements = self->_anyRequiredPlacements;
    self->_anyRequiredPlacements = v16;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        [(NSHashTable *)self->_anyRequiredPlacements addObject:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v20);
  }

  return self;
}

- (id)withItemInfo:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_identifier == (_UIStatusBarIdentifier *)v4[3]
    && self->_priority == v4[2];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(_UIStatusBarDisplayItemPlacement *)self identifier];
  unint64_t v4 = self->_priority ^ [v3 hash];

  return v4;
}

- (id)description
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v18[0] = @"identifier";
  uint64_t v17 = [(_UIStatusBarDisplayItemPlacement *)self identifier];
  v19[0] = v17;
  v18[1] = @"enabled";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[_UIStatusBarDisplayItemPlacement isEnabled](self, "isEnabled"));
  v19[1] = v3;
  v18[2] = @"priority";
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStatusBarDisplayItemPlacement priority](self, "priority"));
  v19[2] = v4;
  v18[3] = @"excludedPlacements";
  BOOL v5 = NSNumber;
  uint64_t v6 = [(_UIStatusBarDisplayItemPlacement *)self excludedPlacements];
  uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v19[3] = v7;
  v18[4] = @"allRequiredPlacements";
  uint64_t v8 = NSNumber;
  v9 = [(_UIStatusBarDisplayItemPlacement *)self allRequiredPlacements];
  v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v19[4] = v10;
  v18[5] = @"anyRequiredPlacements";
  uint64_t v11 = NSNumber;
  v12 = [(_UIStatusBarDisplayItemPlacement *)self anyRequiredPlacements];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v19[5] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  id v15 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:v14];

  return v15;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (NSHashTable)excludedPlacements
{
  return self->_excludedPlacements;
}

- (NSSet)excludedRegionIdentifiers
{
  return self->_excludedRegionIdentifiers;
}

- (NSHashTable)includedPlacements
{
  return self->_includedPlacements;
}

- (NSHashTable)allRequiredPlacements
{
  return self->_allRequiredPlacements;
}

- (NSHashTable)anyRequiredPlacements
{
  return self->_anyRequiredPlacements;
}

- (NSDictionary)itemInfo
{
  return self->_itemInfo;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
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

+ (id)spacerPlacementWithSize:(CGSize)a3 priority:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[_UIStatusBarSpacerItem randomDisplayIdentifier];
  uint64_t v8 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v7 priority:a4];
  v13 = @"size";
  v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v11 = [v8 withItemInfo:v10];

  return v11;
}

@end
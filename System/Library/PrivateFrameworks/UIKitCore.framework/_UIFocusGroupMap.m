@interface _UIFocusGroupMap
- (NSArray)focusGroups;
- (NSArray)focusItems;
- (UICoordinateSpace)coordinateSpace;
- (_UIFocusGroupMap)initWithItems:(id)a3 coordinateSpace:(id)a4;
- (_UIFocusGroupMap)initWithItems:(id)a3 standInItemsMap:(id)a4 coordinateSpace:(id)a5;
- (id)_indexEnvironment:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)focusGroupForItem:(id)a3;
- (id)visualDescription;
- (void)_indexItems:(id)a3;
@end

@implementation _UIFocusGroupMap

- (_UIFocusGroupMap)initWithItems:(id)a3 coordinateSpace:(id)a4
{
  return [(_UIFocusGroupMap *)self initWithItems:a3 standInItemsMap:0 coordinateSpace:a4];
}

- (_UIFocusGroupMap)initWithItems:(id)a3 standInItemsMap:(id)a4 coordinateSpace:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_UIFocusGroupMap.m", 39, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"_UIFocusGroupMap.m", 40, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_UIFocusGroupMap;
  v13 = [(_UIFocusGroupMap *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_coordinateSpace, a5);
    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    environmentToGroupMap = v14->_environmentToGroupMap;
    v14->_environmentToGroupMap = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    identifierToGroupMap = v14->_identifierToGroupMap;
    v14->_identifierToGroupMap = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    identifierToPrimaryItemMap = v14->_identifierToPrimaryItemMap;
    v14->_identifierToPrimaryItemMap = (NSMapTable *)v19;

    uint64_t v21 = +[_UIFocusGroup nullGroupWithCoordinateSpace:v12];
    nullGroup = v14->_nullGroup;
    v14->_nullGroup = (_UIFocusGroup *)v21;

    objc_storeStrong((id *)&v14->_standInItemsMap, a4);
    [(_UIFocusGroupMap *)v14 _indexItems:v9];
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 56), self->_coordinateSpace);
  uint64_t v5 = +[_UIFocusGroup nullGroupWithCoordinateSpace:self->_coordinateSpace];
  v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  uint64_t v7 = [(NSMapTable *)self->_standInItemsMap copy];
  v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  uint64_t v9 = [(NSMapTable *)self->_identifierToPrimaryItemMap copy];
  id v10 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v9;

  id v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v12 = [(NSMapTable *)self->_identifierToGroupMap keyEnumerator];
  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      uint64_t v15 = [(NSMapTable *)self->_identifierToGroupMap objectForKey:v14];
      id v16 = (id)[v15 _deepCopyWithNewIdentifierToGroupMap:v11];

      uint64_t v17 = [v12 nextObject];

      v14 = (void *)v17;
    }
    while (v17);
  }

  objc_storeStrong((id *)(v4 + 16), v11);
  v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v19 = [(NSMapTable *)self->_environmentToGroupMap keyEnumerator];
  uint64_t v20 = [v19 nextObject];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    do
    {
      v22 = [(NSMapTable *)self->_environmentToGroupMap objectForKey:v21];
      v23 = [v22 identifier];
      v24 = [v11 objectForKey:v23];

      [v18 setObject:v24 forKey:v21];
      uint64_t v25 = [v19 nextObject];

      uint64_t v21 = (void *)v25;
    }
    while (v25);
  }

  objc_super v26 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v18;

  return (id)v4;
}

- (void)_indexItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * v8);
        if (!v6)
        {
          v6 = +[UIFocusSystem focusSystemForEnvironment:*(void *)(*((void *)&v20 + 1) + 8 * v8)];
        }
        int has_internal_diagnostics = os_variant_has_internal_diagnostics();
        id v11 = +[UIFocusSystem focusSystemForEnvironment:v9];

        if (has_internal_diagnostics)
        {
          if (v6 != v11)
          {
            v14 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Indexing focus items of different focus systems in a single focus group map is unsupported and leads to undefined behavior. This is a UIKit bug.", buf, 2u);
            }
          }
        }
        else if (v6 != v11)
        {
          uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_indexItems____s_category) + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Indexing focus items of different focus systems in a single focus group map is unsupported and leads to undefined behavior. This is a UIKit bug.", buf, 2u);
          }
        }
        v12 = [(_UIFocusGroupMap *)self _indexEnvironment:v9];
        uint64_t v13 = [(NSMapTable *)self->_standInItemsMap objectForKey:v9];

        if (!v13) {
          [v12 _insertItem:v9];
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v17 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v5 = v17;
    }
    while (v17);
  }
  else
  {
    v6 = 0;
  }
}

- (id)_indexEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_UIFocusGroupMap.m", 124, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  if (self->_focusGroups)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"_UIFocusGroupMap.m" lineNumber:125 description:@"This map has already calculated its focus groups. Later changes in this map are not allowed. This is a UIKit bug."];
  }
  v6 = [(NSMapTable *)self->_environmentToGroupMap objectForKey:v5];
  if (!v6)
  {
    unsigned __int8 v7 = objc_msgSend(v5, sel_allowsWeakReference);
    if (!v5 || (v7 & 1) == 0)
    {
      v6 = self->_nullGroup;
      goto LABEL_24;
    }
    uint64_t v8 = _UIFocusGroupUnresolvedIdentifierForEnvironment(v5);
    if (v8)
    {
      uint64_t v9 = [(NSMapTable *)self->_identifierToGroupMap objectForKey:v8];
      if (v9)
      {
        id v10 = (_UIFocusGroup *)v9;
        [(NSMapTable *)self->_environmentToGroupMap setObject:v9 forKey:v5];
LABEL_23:
        [(_UIFocusGroup *)v10 _updateWithEnvironment:v5];
        v6 = v10;

        goto LABEL_24;
      }
    }
    id v11 = [v5 parentFocusEnvironment];
    if (!v11)
    {
      if (!v8)
      {
        id v10 = self->_nullGroup;
        goto LABEL_22;
      }
      id v16 = [_UIFocusGroup alloc];
      v12 = [(_UIFocusGroupMap *)self coordinateSpace];
      uint64_t v15 = [(_UIFocusGroup *)v16 initWithIdentifier:v8 parentGroup:0 coordinateSpace:v12];
      goto LABEL_19;
    }
    v12 = [(_UIFocusGroupMap *)self _indexEnvironment:v11];
    if (v12)
    {
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"_UIFocusGroupMap.m" lineNumber:165 description:@"Found a parent environment but could not create a parent group. This is a UIKit bug."];

      if (v8)
      {
LABEL_15:
        uint64_t v13 = [v12 identifier];
        int v14 = [v8 isEqualToString:v13];

        if (!v14)
        {
          uint64_t v17 = [_UIFocusGroup alloc];
          v18 = [(_UIFocusGroupMap *)self coordinateSpace];
          id v10 = [(_UIFocusGroup *)v17 initWithIdentifier:v8 parentGroup:v12 coordinateSpace:v18];

          goto LABEL_21;
        }
      }
    }
    uint64_t v15 = v12;
LABEL_19:
    id v10 = v15;
LABEL_21:

LABEL_22:
    [(NSMapTable *)self->_environmentToGroupMap setObject:v10 forKey:v5];
    identifierToGroupMap = self->_identifierToGroupMap;
    long long v20 = [(_UIFocusGroup *)v10 identifier];
    [(NSMapTable *)identifierToGroupMap setObject:v10 forKey:v20];

    goto LABEL_23;
  }
LABEL_24:

  return v6;
}

- (NSArray)focusGroups
{
  focusGroups = self->_focusGroups;
  if (!focusGroups)
  {
    uint64_t v4 = objc_opt_new();
    __addChildFocusGroupsRecursively(self->_nullGroup, v4);
    id v5 = (NSArray *)[v4 copy];
    v6 = self->_focusGroups;
    self->_focusGroups = v5;

    focusGroups = self->_focusGroups;
  }
  return focusGroups;
}

- (NSArray)focusItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(_UIFocusGroupMap *)self focusGroups];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "primaryItem", (void)v14);
        if (!v10)
        {
          id v11 = [v9 items];
          id v10 = [v11 firstObject];

          if (!v10) {
            continue;
          }
        }
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];
  return (NSArray *)v12;
}

- (id)focusGroupForItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIFocusGroupMap.m", 226, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  uint64_t v6 = [(NSMapTable *)self->_environmentToGroupMap objectForKey:v5];

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(_UIFocusGroupMap *)self focusGroups];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p; focusGroups: %@>", v5, self, v6];

  return v7;
}

- (id)visualDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(_UIFocusGroupMap *)self focusGroups];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(*((void *)&v14 + 1) + 8 * i) boundingBox];
        id v10 = objc_msgSend(v9, "valueWithCGRect:");
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v11 = [[_UIASCIIArtFramesRenderer alloc] initWithFrames:v3];
  v12 = [(_UIASCIIArtFramesRenderer *)v11 visualDescription];

  return v12;
}

- (UICoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_focusGroups, 0);
  objc_storeStrong((id *)&self->_standInItemsMap, 0);
  objc_storeStrong((id *)&self->_nullGroup, 0);
  objc_storeStrong((id *)&self->_identifierToPrimaryItemMap, 0);
  objc_storeStrong((id *)&self->_identifierToGroupMap, 0);
  objc_storeStrong((id *)&self->_environmentToGroupMap, 0);
}

@end
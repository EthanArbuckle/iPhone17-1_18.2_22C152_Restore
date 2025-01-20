@interface _UIMenuBuilder
- (BOOL)_isInternallyConsistent;
- (NSArray)_keyCommands;
- (UIMenuSystem)system;
- (_UIMenuBuilder)initWithRootMenu:(id)a3;
- (_UIMenuBuilder)initWithSystem:(id)a3 analysis:(id *)a4;
- (id)_firstValidMenuWithinIdentifiers:(id)a3;
- (id)_internalDiffForDiffv1:(id)a3;
- (id)_parentOfMenuForIdentifier:(id)a3 commandForIdentifier:(id)a4;
- (id)actionForIdentifier:(id)a3;
- (id)commandForAction:(SEL)a3 propertyList:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)menuForIdentifier:(id)a3;
- (unint64_t)_actualChangeCount;
- (unint64_t)_changeCount;
- (void)_insertMenu:(id)a3 intoParentMenu:(id)a4 newParentMenu:(id)a5;
- (void)_patch:(id)a3;
- (void)_patchInternalDiff:(id)a3;
- (void)_recacheCommandsIfNeeded;
- (void)_replaceMenu:(id)a3 withMenu:(id)a4;
- (void)_setNeedsRecacheCommands;
- (void)insertChildMenu:(id)a3 atEndOfMenuForIdentifier:(id)a4;
- (void)insertChildMenu:(id)a3 atStartOfMenuForIdentifier:(id)a4;
- (void)insertSiblingMenu:(id)a3 afterMenuForIdentifier:(id)a4;
- (void)insertSiblingMenu:(id)a3 beforeMenuForIdentifier:(id)a4;
- (void)removeMenuForIdentifier:(id)a3;
- (void)replaceChildrenOfMenuForIdentifier:(id)a3 fromChildrenBlock:(id)a4;
- (void)replaceMenuForIdentifier:(id)a3 withMenu:(id)a4;
- (void)setSystem:(id)a3;
@end

@implementation _UIMenuBuilder

- (void)setSystem:(id)a3
{
}

- (_UIMenuBuilder)initWithRootMenu:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  char v7 = [v6 isEqualToString:@"com.apple.menu.root"];

  if ((v7 & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:201 description:@"initial root menu needs root identifier"];
  }
  memset(v12, 0, sizeof(v12));
  _UIAnalyzeMenu((uint64_t)v12, v5);
  if (!*((void *)&v12[0] + 1))
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:205 description:@"initial root menu inconsistent"];
  }
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(v11, (id *)v12);
  if (self) {
    self = [(_UIMenuBuilder *)self initWithSystem:0 analysis:v11];
  }
  else {
    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)v11);
  }
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)v12);

  return self;
}

- (_UIMenuBuilder)initWithSystem:(id)a3 analysis:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIMenuBuilder;
  char v7 = [(_UIMenuBuilder *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_system, v6);
    objc_storeStrong((id *)&v8->_analysis.keyCommands, a4->var0);
    objc_storeStrong((id *)&v8->_analysis.menus, a4->var1);
    objc_storeStrong((id *)&v8->_analysis.actions, a4->var2);
    objc_storeStrong((id *)&v8->_analysis.commands, a4->var3);
    objc_storeStrong((id *)&v8->_analysis.parentMenuIdentifiers, a4->var4);
    objc_storeStrong((id *)&v8->_analysis.commandParentMenuIdentifiers, a4->var5);
    keyCommandsCache = v8->_keyCommandsCache;
    v8->_keyCommandsCache = 0;
  }
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)a4);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_UIMenuBuilder alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_system);
  v7[1] = [(NSMutableDictionary *)self->_analysis.menus mutableCopy];
  v7[2] = [(NSMutableDictionary *)self->_analysis.actions mutableCopy];
  v7[3] = [(_UICommandIdentifierDictionary *)self->_analysis.commands copy];
  v7[4] = [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers mutableCopy];
  v7[5] = [(_UICommandIdentifierDictionary *)self->_analysis.commandParentMenuIdentifiers copy];
  if (v4) {
    v4 = [(_UIMenuBuilder *)v4 initWithSystem:WeakRetained analysis:v7];
  }
  else {
    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)v7);
  }

  return v4;
}

- (id)menuForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_analysis.menus objectForKeyedSubscript:a3];
}

- (id)actionForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_analysis.actions objectForKey:a3];
}

- (id)commandForAction:(SEL)a3 propertyList:(id)a4
{
  return [(_UICommandIdentifierDictionary *)self->_analysis.commands objectForAction:a3 propertyList:a4];
}

- (void)_setNeedsRecacheCommands
{
  keyCommandsCache = self->_keyCommandsCache;
  self->_keyCommandsCache = 0;
}

- (void)_recacheCommandsIfNeeded
{
  if (!self->_keyCommandsCache)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = [(_UIMenuBuilder *)self menuForIdentifier:@"com.apple.menu.root"];
    _UIRecursivelyCacheCommandsInMenu(v4, v3);

    keyCommandsCache = self->_keyCommandsCache;
    self->_keyCommandsCache = v3;
  }
}

- (NSArray)_keyCommands
{
  [(_UIMenuBuilder *)self _recacheCommandsIfNeeded];
  keyCommandsCache = self->_keyCommandsCache;
  return keyCommandsCache;
}

- (id)_parentOfMenuForIdentifier:(id)a3 commandForIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    commandParentMenuIdentifiers = self->_analysis.commandParentMenuIdentifiers;
    uint64_t v11 = [v8 action];
    v12 = [v9 propertyList];
    v13 = [(_UICommandIdentifierDictionary *)commandParentMenuIdentifiers objectForAction:v11 propertyList:v12];
  }
  else if (v7)
  {
    v13 = [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers objectForKeyedSubscript:v7];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:262 description:@"no identifier"];

    v13 = 0;
  }

  return v13;
}

- (id)_firstValidMenuWithinIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v9, (void)v13);

        if (v10)
        {
          id v11 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_isInternallyConsistent
{
  v3 = [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers objectForKeyedSubscript:@"com.apple.menu.root"];

  if (v3) {
    return 0;
  }
  uint64_t v5 = [(_UIMenuBuilder *)self menuForIdentifier:@"com.apple.menu.root"];
  if (v5)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    _UIAnalyzeMenu((uint64_t)&v7, v5);
    BOOL v4 = *((void *)&v7 + 1)
      && [(NSMutableSet *)self->_analysis.keyCommands isEqualToSet:(void)v7]
      && [(NSMutableDictionary *)self->_analysis.menus isEqualToDictionary:*((void *)&v7 + 1)]&& [(NSMutableDictionary *)self->_analysis.actions isEqualToDictionary:(void)v8]&& [(_UICommandIdentifierDictionary *)self->_analysis.commands isEqual:*((void *)&v8 + 1)]&& [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers isEqualToDictionary:(void)v9]&& [(_UICommandIdentifierDictionary *)self->_analysis.commandParentMenuIdentifiers isEqual:*((void *)&v9 + 1)];
    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)&v7);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_replaceMenu:(id)a3 withMenu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  menus = self->_analysis.menus;
  long long v9 = [v7 identifier];
  [(NSMutableDictionary *)menus setObject:v7 forKeyedSubscript:v9];

  id v23 = v6;
  id v10 = v7;
  id v11 = 0;
  v12 = v10;
  for (uint64_t i = v23; ; uint64_t i = v11)
  {
    parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
    long long v15 = [i identifier];
    long long v16 = [(NSMutableDictionary *)parentMenuIdentifiers objectForKeyedSubscript:v15];
    v17 = [(_UIMenuBuilder *)self menuForIdentifier:v16];

    if (!v17) {
      break;
    }
    uint64_t v18 = [v17 children];
    v19 = (void *)[v18 mutableCopy];

    objc_msgSend(v19, "setObject:atIndexedSubscript:", v12, objc_msgSend(v19, "indexOfObject:", i));
    id v11 = v17;

    v20 = [v11 menuByReplacingChildren:v19];

    v21 = self->_analysis.menus;
    v22 = [v20 identifier];
    [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:v22];

    v12 = v20;
  }
}

- (void)replaceMenuForIdentifier:(id)a3 withMenu:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.menu.root"])
  {
    long long v8 = [v7 identifier];
    char v9 = [v8 isEqualToString:@"com.apple.menu.root"];

    if ((v9 & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:321 description:@"cannot replace root with non-root"];
    }
  }
  ++self->__changeCount;
  *(_OWORD *)v68 = 0u;
  *(_OWORD *)v69 = 0u;
  *(_OWORD *)obuint64_t j = 0u;
  _UIAnalyzeMenu((uint64_t)obj, v7);
  if (!obj[1])
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"UIMenuBuilder.m", 327, @"replacement menu has duplicate submenu, command or key command, or a key command is missing input or action" object file lineNumber description];
  }
  if ([v6 isEqualToString:@"com.apple.menu.root"])
  {
    objc_storeStrong((id *)&self->_analysis.keyCommands, obj[0]);
    objc_storeStrong((id *)&self->_analysis.menus, obj[1]);
    objc_storeStrong((id *)&self->_analysis.actions, v68[0]);
    objc_storeStrong((id *)&self->_analysis.commands, v68[1]);
    objc_storeStrong((id *)&self->_analysis.parentMenuIdentifiers, v69[0]);
    objc_storeStrong((id *)&self->_analysis.commandParentMenuIdentifiers, v69[1]);
LABEL_8:
    [(_UIMenuBuilder *)self _setNeedsRecacheCommands];
    ++self->__actualChangeCount;
    goto LABEL_38;
  }
  id v11 = [(_UIMenuBuilder *)self menuForIdentifier:v6];
  if (v11)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v64 = 0u;
    _UIAnalyzeMenu((uint64_t)&v64, v11);
    if (!*((void *)&v64 + 1))
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      [v48 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:346 description:@"old menu inconsistent"];
    }
    v12 = (void *)[(NSMutableSet *)self->_analysis.keyCommands mutableCopy];
    [v12 minusSet:(void)v64];
    v53 = v11;
    if ([v12 intersectsSet:obj[0]])
    {
      _UILogSetDuplicatesExisting(obj[0], v12);
      int v13 = 1;
    }
    else
    {
      id v52 = v12;
      long long v14 = (void *)[(NSMutableDictionary *)self->_analysis.menus mutableCopy];
      long long v15 = [*((id *)&v64 + 1) allKeys];
      [v14 removeObjectsForKeys:v15];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v16 = obj[1];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v61;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v61 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = [v14 objectForKey:*(void *)(*((void *)&v60 + 1) + 8 * i)];

            if (v20)
            {
              v28 = (void *)MEMORY[0x1E4F1CAD0];
              id v54 = [obj[1] allKeys];
              v26 = [v28 setWithArray:v54];
              v29 = (void *)MEMORY[0x1E4F1CAD0];
              v30 = [v14 allKeys];
              v31 = [v29 setWithArray:v30];
              _UILogSetDuplicatesExisting(v26, v31);

              goto LABEL_35;
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v16 = (id)[(NSMutableDictionary *)self->_analysis.actions mutableCopy];
      v21 = [(id)v65 allKeys];
      [v16 removeObjectsForKeys:v21];

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v54 = v68[0];
      uint64_t v22 = [v54 countByEnumeratingWithState:&v56 objects:v70 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v57;
        while (2)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v57 != v23) {
              objc_enumerationMutation(v54);
            }
            v25 = [v16 objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * j)];

            if (v25)
            {
              v32 = (void *)MEMORY[0x1E4F1CAD0];
              v26 = [v68[0] allKeys];
              v33 = [v32 setWithArray:v26];
              v34 = (void *)MEMORY[0x1E4F1CAD0];
              v35 = [v16 allKeys];
              v36 = [v34 setWithArray:v35];
              _UILogSetDuplicatesExisting(v33, v36);

              goto LABEL_35;
            }
          }
          uint64_t v22 = [v54 countByEnumeratingWithState:&v56 objects:v70 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      id v54 = (id)[(_UICommandIdentifierDictionary *)self->_analysis.commands copy];
      [v54 removeEntriesFromDictionary:*((void *)&v65 + 1)];
      if ([v54 intersectsEntriesFromDictionary:v68[1]])
      {
        v26 = [v68[1] intersectingIdentifiersFromDictionary:v54];
        v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("MenuBuilder", &_UILogCommandIdentifierDictionaryDuplicatesExisting___s_category)+ 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v26;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Duplicates existing -- \n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", buf, 0xCu);
        }
LABEL_35:
        int v13 = 1;
      }
      else
      {
        [v52 unionSet:obj[0]];
        [v14 addEntriesFromDictionary:obj[1]];
        [v16 addEntriesFromDictionary:v68[0]];
        [v54 addEntriesFromDictionary:v68[1]];
        objc_storeStrong((id *)&self->_analysis.keyCommands, v52);
        objc_storeStrong((id *)&self->_analysis.menus, v14);
        objc_storeStrong((id *)&self->_analysis.actions, v16);
        objc_storeStrong((id *)&self->_analysis.commands, v54);
        v26 = [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers objectForKeyedSubscript:v6];
        if (!v26)
        {
          v49 = [MEMORY[0x1E4F28B00] currentHandler];
          [v49 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:397 description:@"no such parent"];
        }
        [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers removeObjectForKey:v6];
        parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
        v38 = [(id)v66 allKeys];
        [(NSMutableDictionary *)parentMenuIdentifiers removeObjectsForKeys:v38];

        [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers addEntriesFromDictionary:v69[0]];
        v39 = self->_analysis.parentMenuIdentifiers;
        v40 = [v7 identifier];
        [(NSMutableDictionary *)v39 setObject:v26 forKeyedSubscript:v40];

        [(_UICommandIdentifierDictionary *)self->_analysis.commandParentMenuIdentifiers removeEntriesFromDictionary:*((void *)&v66 + 1)];
        [(_UICommandIdentifierDictionary *)self->_analysis.commandParentMenuIdentifiers addEntriesFromDictionary:v69[1]];
        v41 = [v7 identifier];
        LODWORD(v39) = [v41 isEqualToString:v6];

        if (v39)
        {
          [(_UIMenuBuilder *)self _replaceMenu:v53 withMenu:v7];
        }
        else
        {
          v42 = [(_UIMenuBuilder *)self menuForIdentifier:v26];
          if (!v42)
          {
            v50 = [MEMORY[0x1E4F28B00] currentHandler];
            [v50 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:414 description:@"no such parent menu"];
          }
          v43 = [v42 children];
          v44 = (void *)[v43 mutableCopy];

          uint64_t v45 = [v44 indexOfObject:v53];
          if (v45 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v51 = [MEMORY[0x1E4F28B00] currentHandler];
            [v51 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:417 description:@"menu not found in parent"];
          }
          [v44 setObject:v7 atIndexedSubscript:v45];
          v46 = [v42 menuByReplacingChildren:v44];
          [(_UIMenuBuilder *)self _replaceMenu:v42 withMenu:v46];
        }
        int v13 = 0;
      }

      v12 = v52;
    }

    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)&v64);
    if (!v13) {
      goto LABEL_8;
    }
  }
LABEL_38:
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)obj);
}

- (void)replaceChildrenOfMenuForIdentifier:(id)a3 fromChildrenBlock:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(_UIMenuBuilder *)self menuForIdentifier:v12];
  long long v8 = v7;
  if (v7)
  {
    char v9 = [v7 children];
    id v10 = v6[2](v6, v9);
    id v11 = [v8 menuByReplacingChildren:v10];
    [(_UIMenuBuilder *)self replaceMenuForIdentifier:v12 withMenu:v11];
  }
}

- (void)_insertMenu:(id)a3 intoParentMenu:(id)a4 newParentMenu:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  _UIAnalyzeMenu((uint64_t)&v49, v9);
  if (!*((void *)&v49 + 1))
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"UIMenuBuilder.m", 443, @"inserted menu has duplicate submenu, command or key command, or a key command is missing input or action" object file lineNumber description];
  }
  if ([(NSMutableSet *)self->_analysis.keyCommands intersectsSet:(void)v49])
  {
    _UILogSetDuplicatesExisting((void *)v49, self->_analysis.keyCommands);
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = *((id *)&v49 + 1);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v46;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = [(NSMutableDictionary *)self->_analysis.menus objectForKey:*(void *)(*((void *)&v45 + 1) + 8 * v15)];

          if (v16)
          {
            v24 = (void *)MEMORY[0x1E4F1CAD0];
            v25 = [*((id *)&v49 + 1) allKeys];
            v26 = [v24 setWithArray:v25];
            v27 = (void *)MEMORY[0x1E4F1CAD0];
            v28 = [(NSMutableDictionary *)self->_analysis.menus allKeys];
            v29 = [v27 setWithArray:v28];
            _UILogSetDuplicatesExisting(v26, v29);

            goto LABEL_28;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v17 = (id)v50;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v42;
      while (2)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = -[NSMutableDictionary objectForKey:](self->_analysis.actions, "objectForKey:", *(void *)(*((void *)&v41 + 1) + 8 * v20), (void)v41);

          if (v21)
          {
            v30 = (void *)MEMORY[0x1E4F1CAD0];
            v31 = [(id)v50 allKeys];
            v32 = [v30 setWithArray:v31];
            v33 = (void *)MEMORY[0x1E4F1CAD0];
            v34 = [(NSMutableDictionary *)self->_analysis.actions allKeys];
            v35 = [v33 setWithArray:v34];
            _UILogSetDuplicatesExisting(v32, v35);

            goto LABEL_28;
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v52 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    if ([(_UICommandIdentifierDictionary *)self->_analysis.commands intersectsEntriesFromDictionary:*((void *)&v50 + 1)])
    {
      uint64_t v22 = [*((id *)&v50 + 1) intersectingIdentifiersFromDictionary:self->_analysis.commands];
      uint64_t v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("MenuBuilder", &_UILogCommandIdentifierDictionaryDuplicatesExisting___s_category)+ 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v22;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Duplicates existing -- \n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", buf, 0xCu);
      }
    }
    else
    {
      [(NSMutableSet *)self->_analysis.keyCommands unionSet:(void)v49];
      [(NSMutableDictionary *)self->_analysis.menus addEntriesFromDictionary:*((void *)&v49 + 1)];
      [(NSMutableDictionary *)self->_analysis.actions addEntriesFromDictionary:(void)v50];
      [(_UICommandIdentifierDictionary *)self->_analysis.commands addEntriesFromDictionary:*((void *)&v50 + 1)];
      [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers addEntriesFromDictionary:(void)v51];
      v36 = [v10 identifier];
      parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
      v38 = [v9 identifier];
      [(NSMutableDictionary *)parentMenuIdentifiers setObject:v36 forKeyedSubscript:v38];

      [(_UICommandIdentifierDictionary *)self->_analysis.commandParentMenuIdentifiers addEntriesFromDictionary:*((void *)&v51 + 1)];
      v39 = v11[2](v11);
      [(_UIMenuBuilder *)self _replaceMenu:v10 withMenu:v39];

      [(_UIMenuBuilder *)self _setNeedsRecacheCommands];
      ++self->__actualChangeCount;
    }
  }
LABEL_28:
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)&v49);
}

- (void)insertSiblingMenu:(id)a3 beforeMenuForIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEqualToString:@"com.apple.menu.root"])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:492 description:@"cannot insert before root menu"];
  }
  ++self->__changeCount;
  id v9 = [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers objectForKeyedSubscript:v8];
  if (v9)
  {
    id v10 = [(_UIMenuBuilder *)self menuForIdentifier:v9];
    if (!v10)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:501 description:@"no such parent menu"];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke;
    v14[3] = &unk_1E5303CF0;
    id v15 = v10;
    SEL v19 = a2;
    id v16 = v8;
    id v17 = self;
    id v18 = v7;
    id v11 = v10;
    [(_UIMenuBuilder *)self _insertMenu:v18 intoParentMenu:v11 newParentMenu:v14];
  }
}

- (void)insertSiblingMenu:(id)a3 afterMenuForIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEqualToString:@"com.apple.menu.root"])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:518 description:@"cannot insert after root menu"];
  }
  ++self->__changeCount;
  id v9 = [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers objectForKeyedSubscript:v8];
  if (v9)
  {
    id v10 = [(_UIMenuBuilder *)self menuForIdentifier:v9];
    if (!v10)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:527 description:@"no such parent menu"];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke;
    v14[3] = &unk_1E5303CF0;
    id v15 = v10;
    SEL v19 = a2;
    id v16 = v8;
    id v17 = self;
    id v18 = v7;
    id v11 = v10;
    [(_UIMenuBuilder *)self _insertMenu:v18 intoParentMenu:v11 newParentMenu:v14];
  }
}

- (void)insertChildMenu:(id)a3 atStartOfMenuForIdentifier:(id)a4
{
  id v6 = a3;
  ++self->__changeCount;
  id v7 = [(_UIMenuBuilder *)self menuForIdentifier:a4];
  id v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61___UIMenuBuilder_insertChildMenu_atStartOfMenuForIdentifier___block_invoke;
    v9[3] = &unk_1E5303D18;
    id v10 = v7;
    id v11 = v6;
    [(_UIMenuBuilder *)self _insertMenu:v11 intoParentMenu:v10 newParentMenu:v9];
  }
}

- (void)insertChildMenu:(id)a3 atEndOfMenuForIdentifier:(id)a4
{
  id v6 = a3;
  ++self->__changeCount;
  id v7 = [(_UIMenuBuilder *)self menuForIdentifier:a4];
  id v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59___UIMenuBuilder_insertChildMenu_atEndOfMenuForIdentifier___block_invoke;
    v9[3] = &unk_1E5303D18;
    id v10 = v7;
    id v11 = v6;
    [(_UIMenuBuilder *)self _insertMenu:v11 intoParentMenu:v10 newParentMenu:v9];
  }
}

- (void)removeMenuForIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"com.apple.menu.root"])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:576 description:@"cannot remove root menu"];
  }
  ++self->__changeCount;
  id v6 = [(_UIMenuBuilder *)self menuForIdentifier:v5];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers objectForKeyedSubscript:v5];
    if (!v7)
    {
      SEL v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:587 description:@"no such parent identifier"];
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    _UIAnalyzeMenu((uint64_t)&v22, v6);
    if (!*((void *)&v22 + 1))
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:591 description:@"old menu inconsistent"];
    }
    [(NSMutableSet *)self->_analysis.keyCommands minusSet:(void)v22];
    menus = self->_analysis.menus;
    id v9 = [*((id *)&v22 + 1) allKeys];
    [(NSMutableDictionary *)menus removeObjectsForKeys:v9];

    actions = self->_analysis.actions;
    id v11 = [(id)v23 allKeys];
    [(NSMutableDictionary *)actions removeObjectsForKeys:v11];

    [(_UICommandIdentifierDictionary *)self->_analysis.commands removeEntriesFromDictionary:*((void *)&v23 + 1)];
    parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
    uint64_t v13 = [(id)v24 allKeys];
    [(NSMutableDictionary *)parentMenuIdentifiers removeObjectsForKeys:v13];

    [(NSMutableDictionary *)self->_analysis.parentMenuIdentifiers removeObjectForKey:v5];
    [(_UICommandIdentifierDictionary *)self->_analysis.commandParentMenuIdentifiers removeEntriesFromDictionary:*((void *)&v24 + 1)];
    uint64_t v14 = [(_UIMenuBuilder *)self menuForIdentifier:v7];
    if (!v14)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"UIMenuBuilder.m" lineNumber:603 description:@"no such parent menu"];
    }
    id v15 = [v14 children];
    id v16 = (void *)[v15 mutableCopy];

    [v16 removeObject:v6];
    id v17 = [v14 menuByReplacingChildren:v16];
    [(_UIMenuBuilder *)self _replaceMenu:v14 withMenu:v17];

    [(_UIMenuBuilder *)self _setNeedsRecacheCommands];
    ++self->__actualChangeCount;

    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)&v22);
  }
}

- (UIMenuSystem)system
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_system);
  return (UIMenuSystem *)WeakRetained;
}

- (unint64_t)_changeCount
{
  return self->__changeCount;
}

- (unint64_t)_actualChangeCount
{
  return self->__actualChangeCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_system);
  objc_storeStrong((id *)&self->_keyCommandsCache, 0);
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)&self->_analysis);
}

- (id)_internalDiffForDiffv1:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(_UICommandInternalDiff);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke;
  aBlock[3] = &unk_1E53051C8;
  aBlock[4] = self;
  id v6 = v5;
  long long v43 = v6;
  long long v22 = _Block_copy(aBlock);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_2;
  v40[3] = &unk_1E53051F0;
  v40[4] = self;
  id v7 = v6;
  long long v41 = v7;
  v21 = _Block_copy(v40);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_3;
  v38[3] = &unk_1E5305218;
  v38[4] = self;
  id v8 = v7;
  v39 = v8;
  uint64_t v20 = _Block_copy(v38);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_4;
  v36[3] = &unk_1E5305240;
  v36[4] = self;
  id v18 = v8;
  v37 = v18;
  id v9 = _Block_copy(v36);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [v4 changes];
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_5;
        v30[3] = &unk_1E5305268;
        id v15 = v22;
        id v31 = v15;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_6;
        v28[3] = &unk_1E5305290;
        id v29 = v20;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_7;
        v25[3] = &unk_1E53052B8;
        id v26 = v15;
        id v27 = v21;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_8;
        v23[3] = &unk_1E53052E0;
        id v24 = v9;
        [v14 acceptItemInsertionVisit:v30 itemDeletionVisit:v28 menuInsertionVisit:v25 menuDeletionVisit:v23];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v11);
  }

  id v16 = v18;
  return v16;
}

- (void)_patchInternalDiff:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = [v4 menuDeletes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_UIMenuBuilder *)self removeMenuForIdentifier:*(void *)(*((void *)&v55 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v7);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = [v4 itemDeletes];
  uint64_t v10 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8 * v13);
        id v15 = [v4 itemDeletes];
        id v16 = [v15 objectForKeyedSubscript:v14];

        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke;
        v49[3] = &unk_1E52DAF40;
        id v50 = v16;
        id v17 = v16;
        [(_UIMenuBuilder *)self replaceChildrenOfMenuForIdentifier:v14 fromChildrenBlock:v49];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v11);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obja = [v4 inserts];
  uint64_t v18 = [obja countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v46;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(obja);
        }
        uint64_t v22 = *(void *)(*((void *)&v45 + 1) + 8 * v21);
        long long v23 = [v4 inserts];
        id v24 = [v23 objectForKeyedSubscript:v22];

        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4;
        v43[3] = &unk_1E52DAF40;
        id v44 = v24;
        id v25 = v24;
        [(_UIMenuBuilder *)self replaceChildrenOfMenuForIdentifier:v22 fromChildrenBlock:v43];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obja countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v19);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id objb = [v4 replacements];
  uint64_t v26 = [objb countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(objb);
        }
        uint64_t v30 = *(void *)(*((void *)&v39 + 1) + 8 * v29);
        id v31 = [v4 replacements];
        long long v32 = [v31 objectForKeyedSubscript:v30];

        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3_16;
        v37[3] = &unk_1E52DAF40;
        id v38 = v32;
        id v33 = v32;
        [(_UIMenuBuilder *)self replaceChildrenOfMenuForIdentifier:v30 fromChildrenBlock:v37];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [objb countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v27);
  }
}

- (void)_patch:(id)a3
{
  id v4 = [(_UIMenuBuilder *)self _internalDiffForDiffv1:a3];
  [(_UIMenuBuilder *)self _patchInternalDiff:v4];
}

@end
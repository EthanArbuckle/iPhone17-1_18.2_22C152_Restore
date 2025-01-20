@interface _UIKeyShortcutHUDModel
+ (BOOL)supportsSecureCoding;
+ (id)modelForCurrentMenu;
- (BOOL)_isKeyCommandPerformable:(id)a3 outTarget:(id *)a4;
- (BOOL)isEmpty;
- (NSMapTable)modelKeyCommandToModelShortcutMap;
- (NSMutableDictionary)modelKeyCommandToAppKeyCommandMap;
- (NSMutableSet)modelKeyCommands;
- (_UIKeyShortcutHUDMenu)menu;
- (_UIKeyShortcutHUDModel)init;
- (_UIKeyShortcutHUDModel)initWithCoder:(id)a3;
- (id)_finalizedHUDMenuFromValidatedHUDMenu:(id)a3;
- (id)_menuByOmittingNonKeyCommandsInMenu:(id)a3;
- (id)_responderBasedKeyCommandsStartingAtResponder:(id)a3;
- (id)_sanitizedMainMenu;
- (id)_validatedHUDMenuFromUIMenu:(id)a3;
- (id)appKeyCommandForSelectedKeyCommand:(id)a3;
- (id)menuWithAlternatesForModifierFlags:(int64_t)a3;
- (id)modelKeyCommandsExcludingHUDCommands:(id)a3;
- (id)modelShortcutForModelKeyCommand:(id)a3;
- (id)originalTargetForSelectedKeyCommand:(id)a3;
- (id)searchMenuWithSearchText:(id)a3 maxSearchResultEntries:(unint64_t)a4;
- (void)_addShortcutsFromHUDMenu:(id)a3 toShortcutsArray:(id)a4;
- (void)_buildMenu;
- (void)_enumerateKeyCommandsInMenu:(id)a3 block:(id)a4;
- (void)_validateBaseKeyCommand:(id)a3 usingAlternate:(id)a4;
- (void)_validateKeyCommandAndAlternates:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setModelKeyCommandToAppKeyCommandMap:(id)a3;
- (void)setModelKeyCommandToModelShortcutMap:(id)a3;
- (void)setModelKeyCommands:(id)a3;
@end

@implementation _UIKeyShortcutHUDModel

+ (id)modelForCurrentMenu
{
  v2 = objc_opt_new();
  [v2 _buildMenu];
  return v2;
}

- (_UIKeyShortcutHUDModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyShortcutHUDModel;
  v2 = [(_UIKeyShortcutHUDModel *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    modelKeyCommands = v2->_modelKeyCommands;
    v2->_modelKeyCommands = (NSMutableSet *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:10];
    modelKeyCommandToModelShortcutMap = v2->_modelKeyCommandToModelShortcutMap;
    v2->_modelKeyCommandToModelShortcutMap = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    modelKeyCommandToAppKeyCommandMap = v2->_modelKeyCommandToAppKeyCommandMap;
    v2->_modelKeyCommandToAppKeyCommandMap = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (BOOL)isEmpty
{
  return [(_UIKeyShortcutHUDMenu *)self->_menu isEmpty];
}

- (id)modelKeyCommandsExcludingHUDCommands:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_modelKeyCommands;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v12, (void)v14) & 1) == 0) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)searchMenuWithSearchText:(id)a3 maxSearchResultEntries:(unint64_t)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  v31 = [v5 array];
  uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  v41 = v8;
  if ([v8 length])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v29 = self;
    id obj = [(_UIKeyShortcutHUDMenu *)self->_menu children];
    uint64_t v33 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v33)
    {
      uint64_t v9 = 0;
      uint64_t v32 = *(void *)v52;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(obj);
        }
        if (v9 + 1 >= a4) {
          break;
        }
        uint64_t v35 = v10;
        v11 = *(void **)(*((void *)&v51 + 1) + 8 * v10);
        v40 = [MEMORY[0x1E4F1CA48] array];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v34 = v11;
        id v36 = [v11 children];
        uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v38)
        {
          uint64_t v37 = *(void *)v48;
LABEL_10:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v48 != v37) {
              objc_enumerationMutation(v36);
            }
            if (v9 + 1 >= a4) {
              break;
            }
            uint64_t v39 = v12;
            v13 = *(void **)(*((void *)&v47 + 1) + 8 * v12);
            long long v14 = [v13 hudTitle];
            int v15 = [v14 localizedCaseInsensitiveContainsString:v41];

            if (v15)
            {
              [v40 addObject:v13];
              ++v9;
            }
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v16 = [v13 displayableAlternates];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v44;
LABEL_18:
              uint64_t v20 = 0;
              while (1)
              {
                if (*(void *)v44 != v19) {
                  objc_enumerationMutation(v16);
                }
                if (v9 + 1 >= a4) {
                  break;
                }
                uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * v20);
                v22 = [v13 alternatesMap];
                v23 = [v22 objectForKeyedSubscript:v21];

                v24 = [v23 hudTitle];
                int v25 = [v24 localizedCaseInsensitiveContainsString:v41];

                if (v25)
                {
                  [v40 addObject:v23];
                  ++v9;
                }

                if (v18 == ++v20)
                {
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
                  if (v18) {
                    goto LABEL_18;
                  }
                  break;
                }
              }
            }

            uint64_t v12 = v39 + 1;
            if (v39 + 1 == v38)
            {
              uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v56 count:16];
              if (v38) {
                goto LABEL_10;
              }
              break;
            }
          }
        }

        if ([v40 count])
        {
          v26 = [v34 menuByReplacingChildren:v40];
          [v31 addObject:v26];
          ++v9;
        }
        uint64_t v10 = v35 + 1;
        if (v35 + 1 == v33)
        {
          uint64_t v33 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
          if (v33) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    self = v29;
  }
  v27 = [(_UIKeyShortcutHUDMenu *)self->_menu menuByReplacingChildren:v31];

  return v27;
}

- (id)menuWithAlternatesForModifierFlags:(int64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v27 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = [(_UIKeyShortcutHUDMenu *)self->_menu children];
  uint64_t v28 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v28)
  {

    goto LABEL_23;
  }
  v24 = self;
  id obj = v5;
  char v6 = 0;
  uint64_t v26 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v36 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v10 = [v8 children];
      v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v12 = [v8 children];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        v29 = v8;
        uint64_t v30 = i;
        char v15 = 0;
        uint64_t v16 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            uint64_t v19 = [v18 shortcutToDisplayForModifierFlags:a3];
            v15 |= v19 != v18;
            v6 |= v19 != v18;
            [v11 addObject:v19];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v14);

        if (v15)
        {
          uint64_t v20 = [v29 menuByReplacingChildren:v11];
          [v27 addObject:v20];

          uint64_t i = v30;
          goto LABEL_18;
        }
        uint64_t v8 = v29;
        uint64_t i = v30;
      }
      else
      {
      }
      [v27 addObject:v8];
LABEL_18:
    }
    uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  }
  while (v28);

  self = v24;
  if (v6)
  {
    uint64_t v21 = [(_UIKeyShortcutHUDMenu *)v24->_menu menuByReplacingChildren:v27];
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v21 = self->_menu;
LABEL_24:
  v22 = v21;

  return v22;
}

- (id)modelShortcutForModelKeyCommand:(id)a3
{
  return [(NSMapTable *)self->_modelKeyCommandToModelShortcutMap objectForKey:a3];
}

- (id)appKeyCommandForSelectedKeyCommand:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_modelKeyCommandToAppKeyCommandMap objectForKey:a3];
}

- (id)originalTargetForSelectedKeyCommand:(id)a3
{
  id v4 = [(NSMutableSet *)self->_modelKeyCommands member:a3];
  uint64_t v5 = [(_UIKeyShortcutHUDModel *)self modelShortcutForModelKeyCommand:v4];
  char v6 = [v5 originalTarget];

  return v6;
}

- (void)_buildMenu
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (([(id)UIApp _disableLayoutAwareShortcuts] & 1) == 0)
  {
    uint64_t v3 = +[UIDevice currentDevice];
    int v4 = [v3 _isHardwareKeyboardAvailable];

    if (v4) {
      self->_gsKeyboard = (__GSKeyboard *)[(id)UIApp _hardwareKeyboard];
    }
  }
  uint64_t v5 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:10];
  displayableAppKeyCommandToModelShortcutMap = self->_displayableAppKeyCommandToModelShortcutMap;
  self->_displayableAppKeyCommandToModelShortcutMap = v5;

  uint64_t v7 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:10];
  appKeyCommandToModelKeyCommandMap = self->_appKeyCommandToModelKeyCommandMap;
  self->_appKeyCommandToModelKeyCommandMap = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  performableAppKeyCommands = self->_performableAppKeyCommands;
  self->_performableAppKeyCommands = v9;

  v11 = (_UIMenuLeafValidation *)objc_opt_new();
  validatiouint64_t n = self->_validation;
  self->_validatiouint64_t n = v11;

  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
  equivalentKeyCommandsInPriorityAlreadyEnumerated = self->_equivalentKeyCommandsInPriorityAlreadyEnumerated;
  self->_equivalentKeyCommandsInPriorityAlreadyEnumerated = v14;

  uint64_t v16 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  uint64_t v17 = [(id)UIApp _responderForKeyEvents];
  uint64_t v18 = [(_UIKeyShortcutHUDModel *)self _responderBasedKeyCommandsStartingAtResponder:v17];

  v68 = [(_UIKeyShortcutHUDModel *)self _sanitizedMainMenu];
  uint64_t v19 = [v68 children];
  uint64_t v66 = [v19 indexOfObjectPassingTest:&__block_literal_global_310];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___UIKeyShortcutHUDModel__buildMenu__block_invoke_2;
  aBlock[3] = &unk_1E52F3720;
  id v67 = v16;
  id v92 = v67;
  id v70 = v13;
  id v93 = v70;
  uint64_t v20 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v21 = v18;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v88 != v24) {
          objc_enumerationMutation(v21);
        }
        v20[2](v20, *(void *)(*((void *)&v87 + 1) + 8 * i));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v87 objects:v99 count:16];
    }
    while (v23);
  }

  [(_UIKeyShortcutHUDModel *)self _enumerateKeyCommandsInMenu:v68 block:v20];
  uint64_t v26 = [v70 allKeys];
  v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  v98 = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
  v29 = [v26 sortedArrayUsingDescriptors:v28];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v29;
  uint64_t v30 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v84 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v83 + 1) + 8 * j);
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v35 = [v70 objectForKeyedSubscript:v34];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v79 objects:v96 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v80;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v80 != v38) {
                objc_enumerationMutation(v35);
              }
              [(_UIKeyShortcutHUDModel *)self _validateKeyCommandAndAlternates:*(void *)(*((void *)&v79 + 1) + 8 * k)];
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v79 objects:v96 count:16];
          }
          while (v37);
        }

        [(NSMutableSet *)self->_equivalentKeyCommandsInPriorityAlreadyEnumerated removeAllObjects];
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
    }
    while (v31);
  }

  v40 = [MEMORY[0x1E4F1CA48] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v41 = v21;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v75 objects:v95 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v76;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v76 != v44) {
          objc_enumerationMutation(v41);
        }
        long long v46 = [(NSMapTable *)self->_displayableAppKeyCommandToModelShortcutMap objectForKey:*(void *)(*((void *)&v75 + 1) + 8 * m)];
        if (v46) {
          [v40 addObject:v46];
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v75 objects:v95 count:16];
    }
    while (v43);
  }

  long long v47 = [MEMORY[0x1E4F1CA48] array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v48 = [v68 children];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v71 objects:v94 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v72;
    do
    {
      for (uint64_t n = 0; n != v50; ++n)
      {
        if (*(void *)v72 != v51) {
          objc_enumerationMutation(v48);
        }
        long long v53 = [(_UIKeyShortcutHUDModel *)self _validatedHUDMenuFromUIMenu:*(void *)(*((void *)&v71 + 1) + 8 * n)];
        [v47 addObject:v53];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v71 objects:v94 count:16];
    }
    while (v50);
  }

  if (v66 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v54 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.application" children:MEMORY[0x1E4F1CBF0]];
    v55 = +[_UIKeyShortcutHUDMenu menuWithUIMenu:v54 children:v40];
  }
  else
  {
    v56 = [v47 objectAtIndexedSubscript:v66];
    [v47 removeObjectAtIndex:v66];
    v57 = [v56 children];
    long long v54 = [v57 arrayByAddingObjectsFromArray:v40];

    v55 = [v56 menuByReplacingChildren:v54];
  }
  [v47 insertObject:v55 atIndex:0];
  uint64_t v58 = +[_UIKeyShortcutHUDMenu menuWithUIMenu:v68 children:v47];
  v59 = [(_UIKeyShortcutHUDModel *)self _finalizedHUDMenuFromValidatedHUDMenu:v58];
  menu = self->_menu;
  self->_menu = v59;

  [(NSMapTable *)self->_displayableAppKeyCommandToModelShortcutMap removeAllObjects];
  v61 = self->_displayableAppKeyCommandToModelShortcutMap;
  self->_displayableAppKeyCommandToModelShortcutMap = 0;

  [(NSMutableSet *)self->_performableAppKeyCommands removeAllObjects];
  v62 = self->_performableAppKeyCommands;
  self->_performableAppKeyCommands = 0;

  v63 = self->_equivalentKeyCommandsInPriorityAlreadyEnumerated;
  self->_equivalentKeyCommandsInPriorityAlreadyEnumerated = 0;

  [(NSMapTable *)self->_appKeyCommandToModelKeyCommandMap removeAllObjects];
  v64 = self->_appKeyCommandToModelKeyCommandMap;
  self->_appKeyCommandToModelKeyCommandMap = 0;

  v65 = self->_validation;
  self->_gsKeyboard = 0;
  self->_validatiouint64_t n = 0;
}

- (id)_responderBasedKeyCommandsStartingAtResponder:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72___UIKeyShortcutHUDModel__responderBasedKeyCommandsStartingAtResponder___block_invoke;
  v8[3] = &unk_1E52F3880;
  id v6 = v5;
  id v9 = v6;
  [v4 _enumerateKeyCommandsInChainWithOptions:27 usingBlock:v8];

  return v6;
}

- (id)_sanitizedMainMenu
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[UIMenuSystem mainSystem];
  id v4 = [v3 _rootMenu];

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v4 children];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44___UIKeyShortcutHUDModel__sanitizedMainMenu__block_invoke;
        v14[3] = &unk_1E52F3748;
        v14[4] = self;
        id v15 = v5;
        [v10 _acceptMenuVisit:v14 leafVisit:&__block_literal_global_21_2];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v11 = [v4 menuByReplacingChildren:v5];

  return v11;
}

- (id)_menuByOmittingNonKeyCommandsInMenu:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v4 children];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke;
        v16[3] = &unk_1E52F3748;
        v16[4] = self;
        id v17 = v5;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke_2;
        v14[3] = &unk_1E52E4C08;
        id v15 = v17;
        [v10 _acceptMenuVisit:v16 leafVisit:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v11 = [v4 menuByReplacingChildren:v5];

  return v11;
}

- (void)_enumerateKeyCommandsInMenu:(id)a3 block:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [a3 children];
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke;
        v15[3] = &unk_1E52F37B8;
        v15[4] = self;
        id v16 = v6;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_3;
        v13[3] = &unk_1E52F37E0;
        id v14 = v16;
        [v11 _acceptMenuVisit:v15 leafVisit:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)_validateKeyCommandAndAlternates:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_UIKeyShortcutHUDModel *)self _validateBaseKeyCommand:v4 usingAlternate:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(v4, "alternates", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_UIKeyShortcutHUDModel *)self _validateBaseKeyCommand:v4 usingAlternate:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_validateBaseKeyCommand:(id)a3 usingAlternate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 _keyCommandUsingAlternate:v7];
  }
  else
  {
    id v8 = v6;
  }
  uint64_t v9 = v8;
  if (([(NSMutableSet *)self->_performableAppKeyCommands containsObject:v8] & 1) == 0
    && ([(NSMutableSet *)self->_equivalentKeyCommandsInPriorityAlreadyEnumerated containsObject:v9] & 1) == 0)
  {
    [(NSMutableSet *)self->_equivalentKeyCommandsInPriorityAlreadyEnumerated addObject:v9];
    [v9 _localizeWithGSKeyboard:self->_gsKeyboard automatically:_UIGetEnableLayoutAwareShortcutsAutomatic() force:0];
    id v28 = 0;
    BOOL v10 = [(_UIKeyShortcutHUDModel *)self _isKeyCommandPerformable:v9 outTarget:&v28];
    id v11 = v28;
    if (v10)
    {
      [(NSMutableSet *)self->_performableAppKeyCommands addObject:v9];
      long long v12 = [v9 _immutableCopy];
      [(NSMapTable *)self->_appKeyCommandToModelKeyCommandMap setObject:v12 forKey:v9];
      [(NSMutableDictionary *)self->_modelKeyCommandToAppKeyCommandMap setObject:v9 forKey:v12];
      long long v13 = +[_UIKeyShortcutHUDShortcut shortcutWithUIKeyCommand:v12];
      id v27 = v11;
      [v13 setOriginalTarget:v11];
      [(NSMapTable *)self->_modelKeyCommandToModelShortcutMap setObject:v13 forKey:v12];
      [(NSMutableSet *)self->_modelKeyCommands addObject:v12];
      id v14 = [v13 uiKeyCommand];
      uint64_t v15 = [v14 discoverabilityTitle];
      if ([v15 length])
      {
        BOOL v16 = 1;
      }
      else
      {
        long long v17 = [v14 title];
        BOOL v16 = [v17 length] != 0;
      }
      char v18 = [v14 attributes];
      char v19 = [v14 attributes];
      BOOL v20 = (v18 & 1) == 0 && v16;
      BOOL v21 = (v19 & 4) == 0 && v20;

      if (v21) {
        [(NSMapTable *)self->_displayableAppKeyCommandToModelShortcutMap setObject:v13 forKey:v9];
      }
      [v13 setBaseShortcutForAlternate:v13];
      id v11 = v27;
      if (v7)
      {
        uint64_t v22 = [(NSMapTable *)self->_appKeyCommandToModelKeyCommandMap objectForKey:v6];
        uint64_t v23 = [(NSMapTable *)self->_modelKeyCommandToModelShortcutMap objectForKey:v22];
        uint64_t v24 = v23;
        if (v23)
        {
          int v25 = [v23 alternatesMap];
          [v25 setObject:v13 forKeyedSubscript:v7];

          [v13 setAlternateForBaseShortcut:v7];
          [v13 setBaseShortcutForAlternate:v24];
          if (v21)
          {
            uint64_t v26 = [v24 displayableAlternates];
            [v26 addObject:v7];
          }
        }
      }
    }
  }
}

- (BOOL)_isKeyCommandPerformable:(id)a3 outTarget:(id *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend((id)UIApp, "_unswizzledTargetInChainForAction:sender:", objc_msgSend(v6, "action"), v6);
  id v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  id v9 = [(_UIMenuLeafValidation *)self->_validation validatedCommandForTarget:v8 command:v6 alternate:0 sender:0];
  BOOL v10 = v9;
  if (v9) {
    BOOL v11 = v9 == v6;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    long long v12 = [v9 title];
    [v6 setTitle:v12];

    long long v13 = [v10 discoverabilityTitle];
    [v6 setDiscoverabilityTitle:v13];

    objc_msgSend(v6, "setAttributes:", objc_msgSend(v10, "attributes"));
  }
  if (v8) {
    BOOL v14 = ([v6 attributes] & 1) == 0;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_validatedHUDMenuFromUIMenu:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v4 children];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke;
        v16[3] = &unk_1E52F3748;
        v16[4] = self;
        id v17 = v5;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke_2;
        v14[3] = &unk_1E52F3808;
        void v14[4] = self;
        id v15 = v17;
        [v10 _acceptMenuVisit:v16 leafVisit:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  BOOL v11 = +[_UIKeyShortcutHUDMenu menuWithUIMenu:v4 children:v5];

  return v11;
}

- (id)_finalizedHUDMenuFromValidatedHUDMenu:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend(v4, "children", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = objc_opt_new();
        [(_UIKeyShortcutHUDModel *)self _addShortcutsFromHUDMenu:v11 toShortcutsArray:v12];
        if ([v12 count])
        {
          long long v13 = [v11 menuByReplacingChildren:v12];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  BOOL v14 = [v4 menuByReplacingChildren:v5];

  return v14;
}

- (void)_addShortcutsFromHUDMenu:(id)a3 toShortcutsArray:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [a3 children];
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke;
        v15[3] = &unk_1E52F3830;
        v15[4] = self;
        id v16 = v6;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke_2;
        v13[3] = &unk_1E52F3858;
        id v14 = v16;
        [v11 _acceptMenuVisit:v15 shortcutVisit:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_modelKeyCommandToModelShortcutMap objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v4 encodeObject:v5 forKey:@"activeShortcuts"];
  [v4 encodeObject:self->_menu forKey:@"menu"];
}

- (_UIKeyShortcutHUDModel)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UIKeyShortcutHUDModel *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = self;
    uint64_t v8 = self;
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"activeShortcuts"];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v35 + 1) + 8 * v15);
          long long v17 = [v16 uiKeyCommand];
          long long v18 = [(_UIKeyShortcutHUDModel *)v5 modelKeyCommands];
          [v18 addObject:v17];

          long long v19 = [(_UIKeyShortcutHUDModel *)v5 modelKeyCommandToModelShortcutMap];
          [v19 setObject:v16 forKey:v17];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v13);
    }

    long long v20 = self;
    uint64_t v21 = [v4 decodeObjectOfClass:v20 forKey:@"menu"];
    menu = v5->_menu;
    v5->_menu = (_UIKeyShortcutHUDMenu *)v21;

    if (([(id)UIApp _disableLayoutAwareShortcuts] & 1) == 0)
    {
      uint64_t v23 = +[UIDevice currentDevice];
      int v24 = [v23 _isHardwareKeyboardAvailable];

      if (v24) {
        v5->_gsKeyboard = (__GSKeyboard *)[(id)UIApp _hardwareKeyboard];
      }
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    int v25 = v5->_modelKeyCommands;
    uint64_t v26 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v32;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v29++) _localizeWithGSKeyboard:v5->_gsKeyboard automatically:_UIGetEnableLayoutAwareShortcutsAutomatic() force:0];
        }
        while (v27 != v29);
        uint64_t v27 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v27);
    }

    v5->_gsKeyboard = 0;
  }

  return v5;
}

- (_UIKeyShortcutHUDMenu)menu
{
  return self->_menu;
}

- (NSMutableSet)modelKeyCommands
{
  return self->_modelKeyCommands;
}

- (void)setModelKeyCommands:(id)a3
{
}

- (NSMapTable)modelKeyCommandToModelShortcutMap
{
  return self->_modelKeyCommandToModelShortcutMap;
}

- (void)setModelKeyCommandToModelShortcutMap:(id)a3
{
}

- (NSMutableDictionary)modelKeyCommandToAppKeyCommandMap
{
  return self->_modelKeyCommandToAppKeyCommandMap;
}

- (void)setModelKeyCommandToAppKeyCommandMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelKeyCommandToAppKeyCommandMap, 0);
  objc_storeStrong((id *)&self->_modelKeyCommandToModelShortcutMap, 0);
  objc_storeStrong((id *)&self->_modelKeyCommands, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_validation, 0);
  objc_storeStrong((id *)&self->_appKeyCommandToModelKeyCommandMap, 0);
  objc_storeStrong((id *)&self->_equivalentKeyCommandsInPriorityAlreadyEnumerated, 0);
  objc_storeStrong((id *)&self->_performableAppKeyCommands, 0);
  objc_storeStrong((id *)&self->_displayableAppKeyCommandToModelShortcutMap, 0);
}

@end
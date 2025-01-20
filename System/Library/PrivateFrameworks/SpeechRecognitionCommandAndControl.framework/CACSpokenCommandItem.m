@interface CACSpokenCommandItem
+ (id)newCommandItemWithLocale:(id)a3 scope:(id)a4;
- (AXReplayableGesture)customGesture;
- (BOOL)conflictsWithItem:(id)a3;
- (BOOL)evaluateCommandPredicate:(id)a3;
- (BOOL)isCollapsed;
- (BOOL)isEdited;
- (BOOL)isGroup;
- (BOOL)isVisible;
- (CACRecordedUserActionFlow)customUserActionFlow;
- (CACSpokenCommandItem)initWithIdentifier:(id)a3;
- (CACSpokenCommandItem)initWithIdentifier:(id)a3 properties:(id)a4 locale:(id)a5;
- (NSArray)customPasteBoard;
- (NSArray)searchAlternates;
- (NSString)customAppName;
- (NSString)customScope;
- (NSString)customShortcutsWorkflowIdentifier;
- (NSString)customTextToInsert;
- (NSString)customType;
- (NSString)locale;
- (NSString)untranslatedDisplayString;
- (NSString)untranslatedLocale;
- (id)_customCommandStringsWithLocale:(id)a3;
- (id)cloneWithoutCommands;
- (id)commandInfo;
- (id)commandsArray;
- (id)copy;
- (id)description;
- (id)dictionaryForSavingToPreferences;
- (id)displayString;
- (id)primaryBuiltinCommandForLocale:(id)a3;
- (id)sortString;
- (id)untranslatedDisplayStringAndLocale:(id *)a3;
- (id)valueForKey:(id)a3 locale:(id)a4;
- (void)_reloadFromProperties:(id)a3;
- (void)_saveKey:(id)a3 toDictionary:(id)a4;
- (void)_setCustomCommandStrings:(id)a3 withLocale:(id)a4;
- (void)_updateBuiltInCommandsWithLocale:(id)a3;
- (void)customGesture;
- (void)customUserActionFlow;
- (void)refreshDataFromPreferences;
- (void)removeFromPreferences;
- (void)saveToPreferences;
- (void)setCommandInfo:(id)a3;
- (void)setCustomAppName:(id)a3;
- (void)setCustomGesture:(id)a3;
- (void)setCustomPasteBoard:(id)a3;
- (void)setCustomScope:(id)a3;
- (void)setCustomShortcutsWorkflowIdentifier:(id)a3;
- (void)setCustomTextToInsert:(id)a3;
- (void)setCustomType:(id)a3;
- (void)setCustomUserActionFlow:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setIsCollapsed:(BOOL)a3;
- (void)setIsConfirmationRequired:(BOOL)a3;
- (void)setIsEdited:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setSearchAlternates:(id)a3;
- (void)setUntranslatedDisplayString:(id)a3;
- (void)setUntranslatedLocale:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4 locale:(id)a5;
@end

@implementation CACSpokenCommandItem

+ (id)newCommandItemWithLocale:(id)a3 scope:(id)a4
{
  v5 = (__CFString *)a4;
  id v6 = a3;
  v7 = +[CACPreferences sharedPreferences];
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = @"com.apple.speech.SystemWideScope";
  }
  v9 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v8, @"CustomScope", *MEMORY[0x263EFFB40], @"Enabled", 0);

  v10 = [v7 uniqueCustomCommandIdentifier];
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v10 properties:v9 locale:v6];

  [v11 setIsEdited:1];
  return v11;
}

- (CACSpokenCommandItem)initWithIdentifier:(id)a3 properties:(id)a4 locale:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CACSpokenCommandItem;
  v10 = [(CACSpokenCommandGroup *)&v15 initWithIdentifier:a3];
  v11 = v10;
  if (v10)
  {
    [(CACSpokenCommandItem *)v10 setLocale:v9];
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    customDictionary = v11->_customDictionary;
    v11->_customDictionary = v12;

    [(CACSpokenCommandItem *)v11 _reloadFromProperties:v8];
    v11->_isEdited = 0;
  }

  return v11;
}

- (CACSpokenCommandItem)initWithIdentifier:(id)a3
{
  return [(CACSpokenCommandItem *)self initWithIdentifier:a3 properties:0 locale:0];
}

- (id)cloneWithoutCommands
{
  v5.receiver = self;
  v5.super_class = (Class)CACSpokenCommandItem;
  v3 = [(CACSpokenCommandGroup *)&v5 cloneWithoutCommands];
  [v3 setLocale:self->_locale];
  return v3;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isVisible
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = +[CACSpokenCommandManager commandPropertiesForIdentifier:self->super._identifier];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = [v2 objectForKey:@"VisibilityEvaluation"];
  v3 = [v2 objectForKey:@"ContextEvaluation"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __33__CACSpokenCommandItem_isVisible__block_invoke;
  v20[3] = &unk_264D128C8;
  v20[4] = &v21;
  [v3 enumerateKeysAndObjectsUsingBlock:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(id)v22[5] allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [(id)v22[5] objectForKey:v8];
        BOOL v10 = +[CACSpokenCommandManager doesEvaluatorKey:v8 matchValue:v9];

        if (!v10)
        {
          v12 = CACLogAccessibility();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            identifier = self->super._identifier;
            *(_DWORD *)buf = 138412546;
            v28 = identifier;
            __int16 v29 = 2112;
            uint64_t v30 = v8;
            _os_log_impl(&dword_238377000, v12, OS_LOG_TYPE_INFO, "Hiding command %@ for failing evaluator %@", buf, 0x16u);
          }

          BOOL v11 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v31 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_13:

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __33__CACSpokenCommandItem_isVisible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = +[CACSpokenCommandManager hardwareEvaluatorKeys];
  if ([v6 containsObject:v14])
  {
    v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v14];

    if (!v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = *(void **)(v8 + 40);
      if (v9)
      {
        id v10 = v9;
        BOOL v11 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v10;
      }
      else
      {
        uint64_t v12 = objc_opt_new();
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
        BOOL v11 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }

      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKey:v14];
    }
  }
  else
  {
  }
}

- (BOOL)conflictsWithItem:(id)a3
{
  id v4 = a3;
  if (-[CACSpokenCommandGroup isEnabled](self, "isEnabled") && [v4 isEnabled])
  {
    id v5 = [(CACSpokenCommandItem *)self commandsArray];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__CACSpokenCommandItem_conflictsWithItem___block_invoke;
    v9[3] = &unk_264D128F0;
    id v10 = v4;
    BOOL v11 = self;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v9];

    BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __42__CACSpokenCommandItem_conflictsWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a2 lowercaseString];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v7 = [*(id *)(a1 + 32) commandsArray];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v27;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ([v12 length])
      {
        uint64_t v13 = [v12 lowercaseString];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          *a4 = 1;
          long long v16 = [*(id *)(a1 + 40) identifier];
          if ([v16 hasPrefix:@"Custom."])
          {
            long long v17 = [*(id *)(a1 + 32) identifier];
            if ([v17 hasPrefix:@"Custom."])
            {
              long long v18 = [*(id *)(a1 + 40) customScope];
              if (![v18 isEqualToString:@"com.apple.speech.SystemWideScope"])
              {
                v20 = [*(id *)(a1 + 40) customScope];
                if (v20)
                {
                  uint64_t v21 = [*(id *)(a1 + 32) customScope];
                  if ([v21 isEqualToString:@"com.apple.speech.SystemWideScope"])
                  {
                    int v22 = 0;
                  }
                  else
                  {
                    uint64_t v23 = [*(id *)(a1 + 32) customScope];
                    if (v23)
                    {
                      v25 = [*(id *)(a1 + 40) customScope];
                      v24 = [*(id *)(a1 + 32) customScope];
                      int v22 = [v25 isEqualToString:v24] ^ 1;
                    }
                    else
                    {
                      int v22 = 0;
                    }
                  }
                }
                else
                {
                  int v22 = 0;
                }

                uint64_t v15 = v22 ^ 1u;
                goto LABEL_17;
              }
            }
          }

          uint64_t v15 = 1;
          goto LABEL_17;
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_10:
  uint64_t v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)evaluateCommandPredicate:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(CACSpokenCommandItem *)self commandsArray];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([v4 evaluateWithObject:*(void *)(*((void *)&v18 + 1) + 8 * v9)]) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CACSpokenCommandItem *)self searchAlternates];
  uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
LABEL_11:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v5);
      }
      if ([v4 evaluateWithObject:*(void *)(*((void *)&v14 + 1) + 8 * v12)]) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v10) = 1;
  }
LABEL_19:

  return v10;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEdited = 1;
  v3.receiver = self;
  v3.super_class = (Class)CACSpokenCommandItem;
  [(CACSpokenCommandGroup *)&v3 setIsEnabled:a3];
}

- (void)setIsConfirmationRequired:(BOOL)a3
{
  self->_isEdited = 1;
  v3.receiver = self;
  v3.super_class = (Class)CACSpokenCommandItem;
  [(CACSpokenCommandGroup *)&v3 setIsConfirmationRequired:a3];
}

- (void)setCustomScope:(id)a3
{
  self->_isEdited = 1;
  [(NSMutableDictionary *)self->_customDictionary setValue:a3 forKey:@"CustomScope"];
}

- (NSString)customScope
{
  return (NSString *)[(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomScope"];
}

- (void)setCustomAppName:(id)a3
{
  self->_isEdited = 1;
  [(NSMutableDictionary *)self->_customDictionary setValue:a3 forKey:@"CustomAppName"];
}

- (NSString)customAppName
{
  return (NSString *)[(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomAppName"];
}

- (void)setCustomGesture:(id)a3
{
  id v4 = a3;
  self->_isEdited = 1;
  if (v4)
  {
    id v8 = 0;
    id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v8];
    id v6 = v8;
    if (!v5)
    {
      uint64_t v7 = CACLogPreferences();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CACSpokenCommandItem setCustomGesture:]();
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  [(NSMutableDictionary *)self->_customDictionary setValue:v5 forKey:@"CustomGesture"];
}

- (AXReplayableGesture)customGesture
{
  v2 = [(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomGesture"];
  if (v2)
  {
    id v7 = 0;
    objc_super v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      id v5 = CACLogPreferences();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CACSpokenCommandItem customGesture]();
      }
    }
  }
  else
  {
    objc_super v3 = 0;
  }

  return (AXReplayableGesture *)v3;
}

- (void)setCustomUserActionFlow:(id)a3
{
  id v4 = a3;
  self->_isEdited = 1;
  if (v4)
  {
    id v8 = 0;
    id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v8];
    id v6 = v8;
    if (!v5)
    {
      id v7 = CACLogPreferences();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CACSpokenCommandItem setCustomUserActionFlow:]();
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  [(NSMutableDictionary *)self->_customDictionary setValue:v5 forKey:@"CustomUserActionFlow"];
}

- (CACRecordedUserActionFlow)customUserActionFlow
{
  v2 = [(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomUserActionFlow"];
  if (v2)
  {
    id v7 = 0;
    objc_super v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      id v5 = CACLogPreferences();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CACSpokenCommandItem customUserActionFlow]();
      }
    }
  }
  else
  {
    objc_super v3 = 0;
  }

  return (CACRecordedUserActionFlow *)v3;
}

- (void)setCustomTextToInsert:(id)a3
{
  self->_isEdited = 1;
  [(NSMutableDictionary *)self->_customDictionary setValue:a3 forKey:@"CustomTextToInsert"];
}

- (NSString)customTextToInsert
{
  return (NSString *)[(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomTextToInsert"];
}

- (void)setCustomType:(id)a3
{
  self->_isEdited = 1;
  [(NSMutableDictionary *)self->_customDictionary setValue:a3 forKey:@"CustomType"];
}

- (NSString)customType
{
  return (NSString *)[(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomType"];
}

- (void)setCustomPasteBoard:(id)a3
{
  self->_isEdited = 1;
  [(NSMutableDictionary *)self->_customDictionary setValue:a3 forKey:@"CustomPasteBoard"];
}

- (NSArray)customPasteBoard
{
  return (NSArray *)[(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomPasteBoard"];
}

- (void)setCustomShortcutsWorkflowIdentifier:(id)a3
{
  self->_isEdited = 1;
  [(NSMutableDictionary *)self->_customDictionary setValue:a3 forKey:@"CustomShortcutsWorkflow"];
}

- (NSString)customShortcutsWorkflowIdentifier
{
  return (NSString *)[(NSMutableDictionary *)self->_customDictionary valueForKey:@"CustomShortcutsWorkflow"];
}

- (void)_setCustomCommandStrings:(id)a3 withLocale:(id)a4
{
  id v10 = a4;
  self->_isEdited = 1;
  customDictionary = self->_customDictionary;
  id v7 = a3;
  id v8 = [(NSMutableDictionary *)customDictionary objectForKey:@"CustomCommands"];
  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    [(NSMutableDictionary *)self->_customDictionary setObject:v8 forKey:@"CustomCommands"];
  }
  uint64_t v9 = +[CACLocaleUtilities normalizedLocaleIdentifier:v10];
  [v8 setValue:v7 forKey:v9];

  [(CACSpokenCommandGroup *)self setCommandsArray:0];
  [(CACSpokenCommandItem *)self setDisplayString:0];
  [(CACSpokenCommandItem *)self setUntranslatedDisplayString:0];
}

- (id)_customCommandStringsWithLocale:(id)a3
{
  customDictionary = self->_customDictionary;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)customDictionary objectForKey:@"CustomCommands"];
  id v6 = +[CACLocaleUtilities normalizedLocaleIdentifier:v4];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (id)primaryBuiltinCommandForLocale:(id)a3
{
  id v4 = a3;
  id v5 = +[CACPreferences sharedPreferences];
  id v6 = [v5 propertiesForCommandIdentifier:self->super._identifier localeIdentifier:v4];

  id v7 = [v6 objectForKey:@"BuiltInStrings"];
  if ([v7 count])
  {
    id v8 = [v7 objectAtIndex:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_updateBuiltInCommandsWithLocale:(id)a3
{
  id v24 = a3;
  uint64_t v23 = +[CACPreferences sharedPreferences];
  id v4 = [v23 propertiesForCommandIdentifier:self->super._identifier localeIdentifier:v24];
  id v5 = [v4 objectForKey:@"BuiltInStrings"];
  id v6 = [MEMORY[0x263EFF980] arrayWithArray:v5];
  [(CACSpokenCommandGroup *)self setCommandsArray:v6];

  id v7 = (__CFString *)objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v5 count])
  {
    int v22 = v4;
    long long v21 = v5;
    id v8 = [v5 objectAtIndex:0];
    v26.length = [(__CFString *)v8 length];
    v26.location = 0;
    uint64_t v9 = CFStringTokenizerCreate(0, v8, v26, 0, 0);
    while (CFStringTokenizerAdvanceToNextToken(v9))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v9);
      id v10 = (__CFString *)CFStringCreateWithSubstring(0, v8, CurrentTokenRange);
      uint64_t v11 = [v23 builtInCommandsStringsTableForLocaleIdentifier:v24];
      uint64_t v12 = NSString;
      uint64_t v13 = [(__CFString *)v10 lowercaseString];
      long long v14 = [v12 stringWithFormat:@"CommandSynonym.%@", v13];
      long long v15 = [v11 objectForKey:v14];

      if (v15) {
        [(__CFString *)v7 appendFormat:@"%@ ", v15];
      }
      CFRelease(v10);
    }
    CFRelease(v9);

    id v4 = v22;
    id v5 = v21;
  }
  [(CACSpokenCommandItem *)self setSearchAlternates:0];
  long long v16 = [v4 objectForKey:@"SearchAlternates"];
  if (v16) {
    [(__CFString *)v7 appendString:v16];
  }
  if ([(__CFString *)v7 length])
  {
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    v28.length = [(__CFString *)v7 length];
    v28.location = 0;
    long long v18 = CFStringTokenizerCreate(0, v7, v28, 0, 0);
    long long v19 = v18;
    while (CFStringTokenizerAdvanceToNextToken(v18))
    {
      CFRange v29 = CFStringTokenizerGetCurrentTokenRange(v19);
      CFStringRef v20 = CFStringCreateWithSubstring(0, v7, v29);
      [v17 addObject:v20];
      CFRelease(v20);
      long long v18 = v19;
    }
    CFRelease(v19);
    if ([v17 count]) {
      [(CACSpokenCommandItem *)self setSearchAlternates:v17];
    }
  }
}

- (void)_reloadFromProperties:(id)a3
{
  id v4 = a3;
  p_identifier = &self->super._identifier;
  if (self->super._identifier)
  {
    id v6 = +[CACPreferences sharedPreferences];
    id v7 = v6;
    locale = self->_locale;
    if (locale)
    {
      uint64_t v9 = locale;
    }
    else
    {
      uint64_t v9 = [v6 bestLocaleIdentifier];
    }
    id v10 = v9;
    uint64_t v11 = [(NSString *)*p_identifier length];
    if (v4
      || !v11
      || ([v7 propertiesForCommandIdentifier:*p_identifier localeIdentifier:v10], (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [v4 objectForKey:@"Enabled"];
      -[CACSpokenCommandItem setIsEnabled:](self, "setIsEnabled:", [v12 BOOLValue]);

      uint64_t v13 = [v4 objectForKey:@"ConfirmationRequired"];
      -[CACSpokenCommandItem setIsConfirmationRequired:](self, "setIsConfirmationRequired:", [v13 BOOLValue]);

      if (self->super._isCustom)
      {
        uint64_t v14 = [v4 objectForKey:@"CustomCommands"];
        if (v14)
        {
          long long v15 = [(NSMutableDictionary *)self->_customDictionary objectForKey:@"CustomCommands"];
          long long v16 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v15];
          [v16 addEntriesFromDictionary:v14];
          [(NSMutableDictionary *)self->_customDictionary setObject:v16 forKey:@"CustomCommands"];
        }
        uint64_t v32 = (void *)v14;
        [(CACSpokenCommandGroup *)self setCommandsArray:0];
        [(CACSpokenCommandItem *)self setDisplayString:0];
        [(CACSpokenCommandItem *)self setUntranslatedDisplayString:0];
        id v17 = [v4 objectForKey:@"CustomScope"];
        [(CACSpokenCommandItem *)self setCustomScope:v17];

        long long v18 = [v4 objectForKey:@"CustomType"];
        [(CACSpokenCommandItem *)self setCustomType:v18];

        long long v19 = [v4 objectForKey:@"CustomGesture"];
        if (v19)
        {
          id v34 = 0;
          CFStringRef v20 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v19 error:&v34];
          id v21 = v34;
          if (!v20)
          {
            int v22 = CACLogPreferences();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[CACSpokenCommandItem customGesture]();
            }
          }
        }
        else
        {
          CFStringRef v20 = 0;
        }
        [(CACSpokenCommandItem *)self setCustomGesture:v20];
        uint64_t v23 = [v4 objectForKey:@"CustomTextToInsert"];
        [(CACSpokenCommandItem *)self setCustomTextToInsert:v23];

        id v24 = [v4 valueForKey:@"CustomUserActionFlow"];
        if (v24)
        {
          id v33 = 0;
          v25 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v24 error:&v33];
          id v26 = v33;
          if (!v25)
          {
            long long v27 = CACLogPreferences();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[CACSpokenCommandItem customUserActionFlow]();
            }
          }
        }
        else
        {
          v25 = 0;
        }
        [(CACSpokenCommandItem *)self setCustomUserActionFlow:v25];
        CFRange v28 = [v4 objectForKey:@"CustomAppName"];
        [(CACSpokenCommandItem *)self setCustomAppName:v28];

        CFRange v29 = [v4 objectForKey:@"CustomPasteBoard"];
        [(CACSpokenCommandItem *)self setCustomPasteBoard:v29];

        uint64_t v30 = [v4 objectForKey:@"CustomShortcutsWorkflow"];
        [(CACSpokenCommandItem *)self setCustomShortcutsWorkflowIdentifier:v30];
      }
      else
      {
        [(CACSpokenCommandItem *)self _updateBuiltInCommandsWithLocale:v10];
      }
      self->_isEdited = 0;
    }
    else
    {
      uint64_t v31 = CACLogGeneral();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CACSpokenCommandItem _reloadFromProperties:]((uint64_t *)&self->super._identifier, v31);
      }

      id v4 = 0;
    }
  }
  else
  {
    id v7 = CACLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CACSpokenCommandItem _reloadFromProperties:](v7);
    }
  }
}

- (void)refreshDataFromPreferences
{
}

- (void)_saveKey:(id)a3 toDictionary:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_customDictionary objectForKey:v9];
  if (v7)
  {
    [v6 setObject:v7 forKey:v9];
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9D0] null];
    [v6 setObject:v8 forKey:v9];
  }
}

- (void)removeFromPreferences
{
  if (self->super._isCustom)
  {
    id v3 = +[CACPreferences sharedPreferences];
    [v3 removePropertiesForCommandIdentifier:self->super._identifier];
  }
}

- (id)dictionaryForSavingToPreferences
{
  if (self->_isEdited)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CACSpokenCommandGroup isEnabled](self, "isEnabled"));
    [v3 setObject:v4 forKey:@"Enabled"];

    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CACSpokenCommandGroup isConfirmationRequired](self, "isConfirmationRequired"));
    [v3 setObject:v5 forKey:@"ConfirmationRequired"];

    if ([(CACSpokenCommandGroup *)self isCustom])
    {
      [v3 addEntriesFromDictionary:self->_customDictionary];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__CACSpokenCommandItem_dictionaryForSavingToPreferences__block_invoke;
      v10[3] = &unk_264D12510;
      id v3 = v3;
      id v11 = v3;
      [&unk_26EB4D238 enumerateKeysAndObjectsUsingBlock:v10];
      id v6 = [(CACSpokenCommandItem *)self customType];

      if (v6)
      {
        id v7 = [(CACSpokenCommandItem *)self customType];
        id v8 = [&unk_26EB4D238 objectForKeyedSubscript:v7];

        if (v8) {
          [(CACSpokenCommandItem *)self _saveKey:v8 toDictionary:v3];
        }
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void __56__CACSpokenCommandItem_dictionaryForSavingToPreferences__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)MEMORY[0x263EFF9D0];
  id v5 = a3;
  id v6 = [v4 null];
  [v3 setObject:v6 forKey:v5];
}

- (void)saveToPreferences
{
  id v4 = [(CACSpokenCommandItem *)self dictionaryForSavingToPreferences];
  if (v4)
  {
    id v3 = +[CACPreferences sharedPreferences];
    [v3 setProperties:v4 forCommandIdentifier:self->super._identifier];

    self->_isEdited = 0;
  }
}

- (void)setValue:(id)a3 forKey:(id)a4 locale:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  id v9 = a3;
  if ([v10 isEqualToString:@"CustomCommands"]) {
    [(CACSpokenCommandItem *)self _setCustomCommandStrings:v9 withLocale:v8];
  }
  else {
    [(CACSpokenCommandItem *)self setValue:v9 forKey:v10];
  }
}

- (id)valueForKey:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"CustomCommands"]) {
    [(CACSpokenCommandItem *)self _customCommandStringsWithLocale:v7];
  }
  else {
  id v8 = [(CACSpokenCommandItem *)self valueForKey:v6];
  }

  return v8;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  [(CACSpokenCommandGroup *)self setCommandsArray:0];
  [(CACSpokenCommandItem *)self setDisplayString:0];
  [(CACSpokenCommandItem *)self setUntranslatedDisplayString:0];
}

- (id)commandsArray
{
  if (!self->super._commandsArray)
  {
    locale = self->_locale;
    if (self->super._isCustom)
    {
      id v4 = [(CACSpokenCommandItem *)self _customCommandStringsWithLocale:locale];
      id v5 = (NSString *)[v4 mutableCopy];

      if (v5)
      {
        [(CACSpokenCommandGroup *)self setCommandsArray:v5];
      }
      else
      {
        id v6 = [MEMORY[0x263EFF980] array];
        [(CACSpokenCommandGroup *)self setCommandsArray:v6];
      }
    }
    else
    {
      if (locale)
      {
        id v5 = locale;
      }
      else
      {
        id v7 = +[CACPreferences sharedPreferences];
        id v5 = [v7 bestLocaleIdentifier];
      }
      [(CACSpokenCommandItem *)self _updateBuiltInCommandsWithLocale:v5];
    }
  }
  commandsArray = self->super._commandsArray;
  return commandsArray;
}

- (void)setDisplayString:(id)a3
{
  self->_isEdited = 1;
  v3.receiver = self;
  v3.super_class = (Class)CACSpokenCommandItem;
  [(CACSpokenCommandGroup *)&v3 setDisplayString:a3];
}

- (id)displayString
{
  displayString = self->super._displayString;
  if (!displayString)
  {
    id v4 = [(CACSpokenCommandItem *)self commandsArray];
    if ([v4 count])
    {
      id v5 = [v4 objectAtIndex:0];
      id v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      id v7 = [v5 stringByTrimmingCharactersInSet:v6];

      if ([v7 length]) {
        [(CACSpokenCommandItem *)self setDisplayString:v7];
      }
    }
    displayString = self->super._displayString;
    if (!displayString)
    {
      [(CACSpokenCommandItem *)self setDisplayString:&stru_26EB332F0];
      displayString = self->super._displayString;
    }
  }
  return displayString;
}

- (id)untranslatedDisplayStringAndLocale:(id *)a3
{
  id v4 = self;
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (!self->_untranslatedDisplayString)
  {
    id v5 = +[CACPreferences sharedPreferences];
    id v6 = [v5 userSelectableLocaleIdentifiers];
    if (v6
      && ([(CACSpokenCommandItem *)v4 locale],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v46 = a3;
      id v8 = (void *)MEMORY[0x263EFF980];
      id v9 = [(NSMutableDictionary *)v4->_customDictionary objectForKey:@"CustomCommands"];
      id v10 = [v9 allKeys];
      id v11 = [v8 arrayWithArray:v10];

      uint64_t v12 = [(CACSpokenCommandItem *)v4 locale];
      uint64_t v13 = [v11 indexOfObject:v12];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
        [v11 removeObjectAtIndex:v13];
      }
      v44 = v6;
      v45 = v5;
      v52 = v4;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v14 = v6;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v17 = 0;
        long long v18 = 0;
        uint64_t v19 = *(void *)v54;
        id v49 = v14;
        v51 = v11;
        uint64_t v47 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v54 != v19) {
              objc_enumerationMutation(v14);
            }
            id v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (v21 && [v11 containsObject:*(void *)(*((void *)&v53 + 1) + 8 * i)])
            {
              int v22 = v17;
              uint64_t v23 = [(CACSpokenCommandItem *)v52 _customCommandStringsWithLocale:v21];
              if ([v23 count])
              {
                id v24 = [v23 objectAtIndex:0];
              }
              else
              {
                id v24 = 0;
              }
              v25 = objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet", v44, v45);
              id v26 = [v24 stringByTrimmingCharactersInSet:v25];
              uint64_t v27 = [v26 length];

              if (v27)
              {
                id v28 = v24;

                id v29 = v21;
                uint64_t v30 = [(CACSpokenCommandItem *)v52 locale];
                BOOL v31 = +[CACLocaleUtilities isSameLangaugeFromLocaleIdentifier:v29 secondLocaleIdentifier:v30];

                id v14 = v49;
                if (v31)
                {
                  id v32 = v28;
                  id v4 = v52;
                  a3 = v46;
                  id v6 = v44;
                  id v5 = v45;
                  goto LABEL_35;
                }
              }
              else
              {
                id v29 = v22;
                id v28 = v18;
                id v14 = v49;
              }

              id v17 = v29;
              long long v18 = v28;
              id v11 = v51;
              uint64_t v19 = v47;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v16);
      }
      else
      {
        long long v18 = 0;
        id v17 = 0;
      }
      v48 = v18;

      id v28 = v17;
      id v4 = v52;
      a3 = v46;
      id v6 = v44;
      id v5 = v45;
    }
    else
    {
      v48 = 0;
      id v28 = 0;
    }
    id v33 = objc_msgSend(v5, "bestLocaleIdentifier", v44, v45);
    uint64_t v34 = [(CACSpokenCommandItem *)v4 locale];
    if (v34
      && (v35 = (void *)v34,
          [(CACSpokenCommandItem *)v4 locale],
          v36 = objc_claimAutoreleasedReturnValue(),
          char v37 = [v33 isEqualToString:v36],
          v36,
          v35,
          (v37 & 1) != 0))
    {
      id v32 = v48;
    }
    else
    {
      v51 = v33;
      v38 = [(CACSpokenCommandItem *)v4 _customCommandStringsWithLocale:v33];
      v50 = v38;
      if ([v38 count])
      {
        uint64_t v23 = [v38 objectAtIndex:0];
      }
      else
      {
        uint64_t v23 = 0;
      }
      v39 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v40 = [v23 stringByTrimmingCharactersInSet:v39];
      uint64_t v41 = [v40 length];

      if (v41)
      {
        id v32 = v23;

        id v29 = v51;
        id v14 = v50;
LABEL_35:

        id v28 = v29;
      }
      else
      {
        id v32 = v48;
        id v14 = v50;
      }

      id v33 = v51;
    }

    if (v32 && v28)
    {
      [(CACSpokenCommandItem *)v4 setUntranslatedDisplayString:v32];
      [(CACSpokenCommandItem *)v4 setUntranslatedLocale:v28];
    }
  }
  if (a3) {
    *a3 = v4->_untranslatedLocale;
  }
  untranslatedDisplayString = v4->_untranslatedDisplayString;
  return untranslatedDisplayString;
}

- (id)sortString
{
  objc_super v3 = [(CACSpokenCommandItem *)self displayString];
  if (![v3 length])
  {
    uint64_t v4 = [(CACSpokenCommandItem *)self untranslatedDisplayStringAndLocale:0];

    objc_super v3 = (void *)v4;
  }
  return v3;
}

- (void)setIsCollapsed:(BOOL)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFFA80];
  if (a3) {
    uint64_t v4 = (void *)MEMORY[0x263EFFA88];
  }
  id v13 = v4;
  id v5 = +[CACPreferences sharedPreferences];
  id v6 = v5;
  locale = self->_locale;
  if (locale)
  {
    id v8 = locale;
  }
  else
  {
    id v8 = [v5 bestLocaleIdentifier];
  }
  id v9 = v8;
  id v10 = [v6 propertiesForCommandIdentifier:self->super._identifier localeIdentifier:v8];
  id v11 = (void *)[v10 mutableCopy];

  if (v11)
  {
    [v11 setValue:v13 forKey:@"Collapsed"];
    uint64_t v12 = +[CACPreferences sharedPreferences];
    [v12 setProperties:v11 forCommandIdentifier:self->super._identifier];
  }
}

- (BOOL)isCollapsed
{
  objc_super v3 = +[CACPreferences sharedPreferences];
  uint64_t v4 = v3;
  locale = self->_locale;
  if (locale)
  {
    id v6 = locale;
  }
  else
  {
    id v6 = [v3 bestLocaleIdentifier];
  }
  id v7 = v6;
  id v8 = +[CACPreferences sharedPreferences];
  id v9 = [v8 propertiesForCommandIdentifier:self->super._identifier localeIdentifier:v7];

  id v10 = [v9 objectForKey:@"Collapsed"];
  char v11 = [v10 BOOLValue];

  return v11;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = [(NSMutableDictionary *)self->_customDictionary allKeys];
  id v5 = [v3 stringWithFormat:@"Keys: %@, Dictionary: %@", v4, self->_customDictionary];

  return v5;
}

- (id)copy
{
  objc_super v3 = [CACSpokenCommandItem alloc];
  uint64_t v4 = [(CACSpokenCommandGroup *)self identifier];
  uint64_t v5 = [(CACSpokenCommandItem *)v3 initWithIdentifier:v4];

  objc_storeStrong((id *)(v5 + 48), self->_customDictionary);
  objc_storeStrong((id *)(v5 + 56), self->_searchAlternates);
  objc_storeStrong((id *)(v5 + 64), self->_locale);
  objc_storeStrong((id *)(v5 + 72), self->_untranslatedDisplayString);
  objc_storeStrong((id *)(v5 + 80), self->_untranslatedLocale);
  objc_storeStrong((id *)(v5 + 88), self->_commandInfo);
  *(unsigned char *)(v5 + 96) = self->_isEdited;
  id v6 = [(CACSpokenCommandItem *)self searchAlternates];
  id v7 = (void *)[v6 copy];
  [(id)v5 setSearchAlternates:v7];

  id v8 = [(CACSpokenCommandItem *)self customScope];
  id v9 = (void *)[v8 copy];
  [(id)v5 setCustomScope:v9];

  id v10 = [(CACSpokenCommandItem *)self customAppName];
  char v11 = (void *)[v10 copy];
  [(id)v5 setCustomAppName:v11];

  uint64_t v12 = [(CACSpokenCommandItem *)self customTextToInsert];
  id v13 = (void *)[v12 copy];
  [(id)v5 setCustomTextToInsert:v13];

  id v14 = [(CACSpokenCommandItem *)self customType];
  uint64_t v15 = (void *)[v14 copy];
  [(id)v5 setCustomType:v15];

  uint64_t v16 = [(CACSpokenCommandItem *)self customPasteBoard];
  id v17 = (void *)[v16 copy];
  [(id)v5 setCustomPasteBoard:v17];

  long long v18 = [(CACSpokenCommandItem *)self customShortcutsWorkflowIdentifier];
  uint64_t v19 = (void *)[v18 copy];
  [(id)v5 setCustomShortcutsWorkflowIdentifier:v19];

  CFStringRef v20 = [(CACSpokenCommandItem *)self locale];
  id v21 = (void *)[v20 copy];
  [(id)v5 setLocale:v21];

  int v22 = [(CACSpokenCommandItem *)self untranslatedDisplayString];
  uint64_t v23 = (void *)[v22 copy];
  [(id)v5 setUntranslatedDisplayString:v23];

  id v24 = [(CACSpokenCommandItem *)self untranslatedLocale];
  v25 = (void *)[v24 copy];
  [(id)v5 setUntranslatedLocale:v25];

  id v26 = [(CACSpokenCommandItem *)self customUserActionFlow];
  [(id)v5 setCustomUserActionFlow:v26];

  uint64_t v27 = [(CACSpokenCommandItem *)self customGesture];
  [(id)v5 setCustomGesture:v27];

  id v28 = [(CACSpokenCommandItem *)self commandInfo];
  [(id)v5 setCommandInfo:v28];

  objc_msgSend((id)v5, "setIsEdited:", -[CACSpokenCommandItem isEdited](self, "isEdited"));
  return (id)v5;
}

- (NSArray)searchAlternates
{
  return self->_searchAlternates;
}

- (void)setSearchAlternates:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)untranslatedDisplayString
{
  return self->_untranslatedDisplayString;
}

- (void)setUntranslatedDisplayString:(id)a3
{
}

- (NSString)untranslatedLocale
{
  return self->_untranslatedLocale;
}

- (void)setUntranslatedLocale:(id)a3
{
}

- (id)commandInfo
{
  return self->_commandInfo;
}

- (void)setCommandInfo:(id)a3
{
}

- (BOOL)isEdited
{
  return self->_isEdited;
}

- (void)setIsEdited:(BOOL)a3
{
  self->_isEdited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commandInfo, 0);
  objc_storeStrong((id *)&self->_untranslatedLocale, 0);
  objc_storeStrong((id *)&self->_untranslatedDisplayString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_searchAlternates, 0);
  objc_storeStrong((id *)&self->_customDictionary, 0);
}

- (void)setCustomGesture:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_238377000, v0, v1, "Unable to serialize gesture %@: %@");
}

- (void)customGesture
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_238377000, v0, v1, "Unable to deserialize gesture %@: %@");
}

- (void)setCustomUserActionFlow:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_238377000, v0, v1, "Unable to serialize user action flow %@: %@");
}

- (void)customUserActionFlow
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_238377000, v0, v1, "Unable to deserialize user action flow %@: %@");
}

- (void)_reloadFromProperties:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "No Identifier", v1, 2u);
}

- (void)_reloadFromProperties:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "No Properties for %@", (uint8_t *)&v3, 0xCu);
}

@end
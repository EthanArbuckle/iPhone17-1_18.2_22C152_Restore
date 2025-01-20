@interface CACSpokenCommandCustom
- (BOOL)isCustomCommand;
- (CACSpokenCommandCustom)initWithCommandIdentifier:(id)a3;
- (NSDictionary)customProperties;
- (NSString)primaryCommand;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_setCustomProperties:(id)a3;
- (void)handleSpokenCommand:(id)a3;
- (void)setPrimaryCommand:(id)a3;
@end

@implementation CACSpokenCommandCustom

- (CACSpokenCommandCustom)initWithCommandIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CACSpokenCommand *)self initWithProperties:0];
  if (v5)
  {
    p_isa = (id *)&v5->super.super.isa;
    v7 = +[CACPreferences sharedPreferences];
    uint64_t v8 = [v7 propertiesForCommandIdentifier:v4];
    id v9 = p_isa[11];
    p_isa[11] = (id)v8;

    v10 = [p_isa[11] objectForKey:@"CustomCommands"];
    v11 = [v7 bestLocaleIdentifier];
    v12 = [v10 objectForKey:v11];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        if (objc_msgSend(v18, "length", (void)v28)) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v20 = v18;

      if (!v20)
      {
        v26 = 0;
        goto LABEL_23;
      }
      [p_isa setIdentifier:v4];
      [p_isa setStrings:v13];
      [p_isa setPrimaryCommand:v20];
      [p_isa setAction:sel_handleSpokenCommand_];
      v19 = [p_isa[11] objectForKey:@"CustomType"];
      if (([v19 isEqualToString:@"PasteText"] & 1) != 0
        || [v19 isEqualToString:@"PasteBoard"])
      {
        v21 = [p_isa contextEvaluation];
        v22 = [NSNumber numberWithBool:1];
        [v21 setObject:v22 forKey:kCACCommandContextRequiresFocusedEditableText];
      }
      v23 = [p_isa[11] objectForKey:@"CustomScope"];
      if (v23
        && (objc_opt_respondsToSelector() & 1) != 0
        && ([v23 isEqualToString:@"com.apple.speech.SystemWideScope"] & 1) == 0)
      {
        v24 = [p_isa contextEvaluation];
        v25 = [MEMORY[0x263EFF8C0] arrayWithObject:v23];
        [v24 setObject:v25 forKey:kCACCommandContextRequiresOneOfAppIdentifiers];
      }
    }
    else
    {
LABEL_10:
      v19 = v13;
      v20 = p_isa;
      p_isa = 0;
    }
    v26 = (CACSpokenCommandCustom *)p_isa;

    p_isa = v20;
LABEL_23:
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)handleSpokenCommand:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = [(CACSpokenCommandCustom *)self customProperties];
  v5 = [v4 objectForKey:@"CustomType"];
  if ([v5 isEqualToString:@"PasteText"])
  {
    [(CACSpokenCommand *)self setCompletionDeterminedManually:1];
    BOOL v6 = [(CACSpokenCommand *)self isRestrictedForAAC];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke;
    block[3] = &unk_264D12CB8;
    BOOL v45 = v6;
    v43 = v4;
    v44 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v7 = v43;
  }
  else if ([v5 isEqualToString:@"RunShortcutsWorkflow"])
  {
    [(CACSpokenCommand *)self setCompletionDeterminedManually:1];
    v7 = [v4 objectForKey:@"CustomShortcutsWorkflow"];
    uint64_t v8 = [MEMORY[0x263F22958] sharedManager];
    id v9 = [v8 shortcutForIdentifier:v7];

    if (v9)
    {
      v10 = [MEMORY[0x263F22958] sharedManager];
      [v10 performShortcut:v9];
    }
    else
    {
      v23 = CACLogShortcuts();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CACSpokenCommandCustom handleSpokenCommand:]((uint64_t)v7, v23);
      }
    }
    dispatch_time_t v24 = dispatch_time(0, 3000000000);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_37;
    v41[3] = &unk_264D115D0;
    v41[4] = self;
    dispatch_after(v24, MEMORY[0x263EF83A0], v41);
  }
  else if ([v5 isEqualToString:@"PasteBoard"])
  {
    v11 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    v7 = [v11 focusedElement];

    if (v7)
    {
      v26 = v5;
      [(CACSpokenCommand *)self setCompletionDeterminedManually:1];
      v25 = [MEMORY[0x263F82A18] generalPasteboard];
      v12 = objc_opt_new();
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v27 = v4;
      id v13 = [v4 objectForKey:@"CustomPasteBoard"];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v19 = objc_msgSend(v18, "objectForKey:", @"CustomPasteBoardType", v25);
            v20 = [v18 objectForKey:@"CustomPasteBoardData"];
            if (v20) {
              BOOL v21 = v19 == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (!v21) {
              [v12 setObject:v20 forKey:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
        }
        while (v15);
      }

      v46 = v12;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
      [v25 setItems:v22];

      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2;
      v34[3] = &unk_264D117C0;
      v7 = v7;
      v35 = v7;
      v36 = self;
      dispatch_async(MEMORY[0x263EF83A0], v34);

      v5 = v26;
      id v4 = v27;
    }
  }
  else if ([v5 isEqualToString:@"RunGesture"])
  {
    [(CACSpokenCommand *)self setCompletionDeterminedManually:1];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3;
    v31[3] = &unk_264D117C0;
    v32 = v4;
    uint64_t v33 = self;
    dispatch_async(MEMORY[0x263EF83A0], v31);
    v7 = v32;
  }
  else if ([v5 isEqualToString:@"RunUserActionFlow"])
  {
    [(CACSpokenCommand *)self setCompletionDeterminedManually:1];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_61;
    v28[3] = &unk_264D117C0;
    long long v29 = v4;
    long long v30 = self;
    dispatch_async(MEMORY[0x263EF83A0], v28);
    v7 = v29;
  }
  else
  {
    v7 = CACLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CACSpokenCommandCustom handleSpokenCommand:]((uint64_t)v5, v7);
    }
  }
}

uint64_t __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = +[CACDisplayManager sharedManager];
    v3 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.PasteNotAllowedForAAC"];
    [v2 displayMessageString:v3 type:1];
  }
  else
  {
    v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    v3 = [*(id *)(a1 + 32) objectForKey:@"CustomTextToInsert"];
    [v2 insertDictatedString:v3];
  }

  id v4 = *(void **)(a1 + 40);
  return [v4 setExecuting:0];
}

uint64_t __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_37(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExecuting:0];
}

uint64_t __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cacPerformTextPaste];
  v2 = *(void **)(a1 + 40);
  return [v2 setExecuting:0];
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F08928];
  uint64_t v3 = objc_opt_class();
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CustomGesture"];
  id v8 = 0;
  v5 = [v2 unarchivedObjectOfClass:v3 fromData:v4 error:&v8];
  id v6 = v8;

  if (v5)
  {
    v7 = +[CACSpokenCommandGestureManager mainScreenGestureManager];
    [v7 performGesture:v5];
  }
  else
  {
    v7 = CACLogAccessibility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3_cold_1((uint64_t)v6, (id *)(a1 + 32));
    }
  }

  [*(id *)(a1 + 40) setExecuting:0];
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_61(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F08928];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(a1 + 32);
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CustomUserActionFlow"];
  id v11 = 0;
  id v6 = [v2 unarchivedObjectOfClass:v3 fromData:v5 error:&v11];
  id v7 = v11;

  if (v6)
  {
    id v8 = +[CACRecordedUserActionManager sharedManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2_67;
    v10[3] = &unk_264D11CD0;
    v10[4] = *(void *)(a1 + 40);
    [v8 beginExecutingRecordedUserActionFlow:v6 completionBlock:v10];
  }
  else
  {
    [*(id *)(a1 + 40) setExecuting:0];
    id v9 = CACLogAccessibility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_61_cold_1((uint64_t)v7, v4);
    }
  }
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2_67(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) setExecuting:0];
  if ([v7 code])
  {
    uint64_t v3 = [v7 localizedDescription];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      v5 = +[CACDisplayManager sharedManager];
      id v6 = [v7 localizedDescription];
      [v5 displayMessageString:v6 type:1];
    }
  }
}

- (void)_setCustomProperties:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSpokenCommand:", self);
  v5 = [(CACSpokenCommandCustom *)self customProperties];
  [v4 _setCustomProperties:v5];

  id v6 = [(CACSpokenCommandCustom *)self primaryCommand];
  [v4 setPrimaryCommand:v6];

  return v4;
}

- (BOOL)isCustomCommand
{
  return 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(CACSpokenCommand *)self strings];
  v5 = [v3 stringWithFormat:@"%@, %@", v4, self->_customProperties];

  return v5;
}

- (NSDictionary)customProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)primaryCommand
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPrimaryCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCommand, 0);
  objc_storeStrong((id *)&self->_customProperties, 0);
}

- (void)handleSpokenCommand:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Unable to perform shortcut with identifier: %@. No longer exists?", (uint8_t *)&v2, 0xCu);
}

- (void)handleSpokenCommand:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Unhandled custom spoken command type: %@", (uint8_t *)&v2, 0xCu);
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3_cold_1(uint64_t a1, id *a2)
{
  int v2 = [*a2 objectForKeyedSubscript:@"CustomGesture"];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_238377000, v3, v4, "Unable to unarchive gesture. Error: %@, data: %@", v5, v6, v7, v8, v9);
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_61_cold_1(uint64_t a1, id *a2)
{
  int v2 = [*a2 objectForKeyedSubscript:@"CustomUserActionFlow"];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_238377000, v3, v4, "Unable to unarchive user action flow. Error: %@, data: %@", v5, v6, v7, v8, v9);
}

@end
@interface CACCustomCommandEditorPresentationManager
+ (int)axNotification;
+ (int64_t)remoteViewType;
- (BOOL)showCustomCommandEditorWithGesture:(id)a3;
- (BOOL)showCustomCommandEditorWithRecordedUserActionFlow:(id)a3;
- (BOOL)showCustomCommandEditorWithShortcutsWorkflow:(id)a3;
- (BOOL)showCustomCommandEditorWithTextToInsert:(id)a3;
- (void)_showCustomCommandEditorWithContextKey:(id)a3 contextValue:(id)a4;
- (void)handleAXNotificationData:(void *)a3;
@end

@implementation CACCustomCommandEditorPresentationManager

- (BOOL)showCustomCommandEditorWithGesture:(id)a3
{
  id v8 = 0;
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  if (v4)
  {
    [(CACCustomCommandEditorPresentationManager *)self _showCustomCommandEditorWithContextKey:*MEMORY[0x263F225B0] contextValue:v4];
  }
  else
  {
    v6 = CACLogPreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CACCustomCommandEditorPresentationManager showCustomCommandEditorWithGesture:]();
    }
  }
  return v4 != 0;
}

- (BOOL)showCustomCommandEditorWithTextToInsert:(id)a3
{
  return 1;
}

- (BOOL)showCustomCommandEditorWithRecordedUserActionFlow:(id)a3
{
  id v8 = 0;
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  if (v4)
  {
    [(CACCustomCommandEditorPresentationManager *)self _showCustomCommandEditorWithContextKey:*MEMORY[0x263F225C0] contextValue:v4];
  }
  else
  {
    v6 = CACLogPreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CACCustomCommandEditorPresentationManager showCustomCommandEditorWithGesture:]();
    }
  }
  return v4 != 0;
}

- (BOOL)showCustomCommandEditorWithShortcutsWorkflow:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F22958] sharedManager];
  v6 = [v5 shortcutForIdentifier:v4];

  if (v6)
  {
    [(CACCustomCommandEditorPresentationManager *)self _showCustomCommandEditorWithContextKey:@"ShortcutWorkflow" contextValue:v4];
  }
  else
  {
    v7 = CACLogShortcuts();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CACCustomCommandEditorPresentationManager showCustomCommandEditorWithShortcutsWorkflow:](v7);
    }
  }
  return v6 != 0;
}

- (void)_showCustomCommandEditorWithContextKey:(id)a3 contextValue:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a4;
  id v7 = a3;
  id v11 = [v5 dictionary];
  [v11 setObject:v6 forKeyedSubscript:v7];

  id v8 = [MEMORY[0x263F22968] server];
  v9 = [v8 installedApps];
  [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x263F225A8]];

  v10 = [MEMORY[0x263F22968] server];
  [v10 showRemoteView:3 withData:v11];
}

+ (int64_t)remoteViewType
{
  return 3;
}

+ (int)axNotification
{
  return 2028;
}

- (void)handleAXNotificationData:(void *)a3
{
  v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F219C8]];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F219C0]];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = +[CACPreferences sharedPreferences];
    [v8 setProperties:v6 forCommandIdentifier:v4];
  }
  else
  {
    id v8 = CACLogPreferences();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CACCustomCommandEditorPresentationManager handleAXNotificationData:]((uint64_t)v3, v8);
    }
  }
}

- (void)showCustomCommandEditorWithGesture:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_238377000, v0, OS_LOG_TYPE_ERROR, "Unable to serialize %@: %@", v1, 0x16u);
}

- (void)showCustomCommandEditorWithShortcutsWorkflow:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "Unable to find shortcut with identifier", v1, 2u);
}

- (void)handleAXNotificationData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Unexpected data from command editor: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
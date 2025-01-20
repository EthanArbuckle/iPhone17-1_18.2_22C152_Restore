@interface SHSheetClientToHostAction
- (void)performActionForSceneController:(id)a3;
@end

@implementation SHSheetClientToHostAction

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = [v4 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 delegate];
    [v7 receivedAction:self];
  }
  else
  {
    v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(SHSheetClientToHostAction *)(uint64_t)self performActionForSceneController:v7];
    }
  }
}

- (void)performActionForSceneController:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "received action %@ on hosting controller %@ but found no scene to handle it", (uint8_t *)&v3, 0x16u);
}

@end
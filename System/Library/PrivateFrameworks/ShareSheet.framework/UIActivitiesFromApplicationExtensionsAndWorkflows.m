@interface UIActivitiesFromApplicationExtensionsAndWorkflows
@end

@implementation UIActivitiesFromApplicationExtensionsAndWorkflows

uint64_t ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = _UIActivityFromApplicationExtension(a2);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

void ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [[UIShortcutActivity alloc] initWithPartial:v4];
    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    uint64_t v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2_cold_1((uint64_t)v3, v6);
    }
  }
}

void ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Activity is not an expected UIShortcutActivity:%@", (uint8_t *)&v2, 0xCu);
}

@end
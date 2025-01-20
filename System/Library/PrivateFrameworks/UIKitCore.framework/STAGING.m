@interface STAGING
@end

@implementation STAGING

void __keyboardui_system_get_log_STAGING_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextInput", "KeyboardUISignpostsSystem");
  v1 = (void *)qword_1EB2604D8;
  qword_1EB2604D8 = (uint64_t)v0;
}

@end
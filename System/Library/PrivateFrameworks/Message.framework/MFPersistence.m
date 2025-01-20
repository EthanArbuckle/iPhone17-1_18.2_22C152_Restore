@interface MFPersistence
@end

@implementation MFPersistence

void __24__MFPersistence_iOS_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_27;
  log_log_27 = (uint64_t)v1;
}

@end
@interface NSString
@end

@implementation NSString

void __55__NSString_PosterFoundation__pf_bootInstanceIdentifier__block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  size_t v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", &_block_invoke_uuid_str, &v5, 0, 0) < 0)
  {
    v0 = PFLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __55__NSString_PosterFoundation__pf_bootInstanceIdentifier__block_invoke_cold_1(v0);
    }
  }
  id v1 = [NSString alloc];
  uint64_t v2 = [v1 initWithBytesNoCopy:&_block_invoke_uuid_str length:v5 - 1 encoding:4 freeWhenDone:0];
  v3 = (void *)pf_bootInstanceIdentifier_uuid;
  pf_bootInstanceIdentifier_uuid = v2;

  v4 = PFLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = pf_bootInstanceIdentifier_uuid;
    _os_log_impl(&dword_25A085000, v4, OS_LOG_TYPE_INFO, "Got boot session uuid: %@", buf, 0xCu);
  }
}

void __55__NSString_PosterFoundation__pf_bootInstanceIdentifier__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_25A085000, log, OS_LOG_TYPE_ERROR, "could not get kern.bootsessionuuid", v1, 2u);
}

@end
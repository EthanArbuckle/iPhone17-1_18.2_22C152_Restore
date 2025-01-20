@interface NSString
@end

@implementation NSString

void __52__NSString_PBFUtilities__pbf_bootInstanceIdentifier__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  size_t v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", &_block_invoke_uuid_str, &v5, 0, 0) < 0)
  {
    v0 = PBFLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_DEFAULT, "could not get kern.bootsessionuuid", buf, 2u);
    }
  }
  id v1 = [NSString alloc];
  uint64_t v2 = [v1 initWithBytesNoCopy:&_block_invoke_uuid_str length:v5 - 1 encoding:4 freeWhenDone:0];
  v3 = (void *)pbf_bootInstanceIdentifier_uuid;
  pbf_bootInstanceIdentifier_uuid = v2;

  v4 = PBFLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = pbf_bootInstanceIdentifier_uuid;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_INFO, "Got boot session uuid: %@", buf, 0xCu);
  }
}

@end
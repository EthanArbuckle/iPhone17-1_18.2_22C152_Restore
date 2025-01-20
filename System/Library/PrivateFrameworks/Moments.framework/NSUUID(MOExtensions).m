@interface NSUUID(MOExtensions)
+ (id)uuidFromString:()MOExtensions;
@end

@implementation NSUUID(MOExtensions)

+ (id)uuidFromString:()MOExtensions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0xC)
  {
    v5 = [NSString stringWithFormat:@"%@%@%@%@", v3, v3, v3, v3];
    v4 = [v5 dataUsingEncoding:4];
  }
  else
  {
    v4 = [v3 dataUsingEncoding:4];
  }
  if ((unint64_t)[v4 length] < 0xC)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v3;
      LOWORD(v11[0]) = 2112;
      *(void *)((char *)v11 + 2) = v6;
      _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_INFO, "Input string is not valid, string, %@, UUID, %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v4, "getBytes:range:", buf, 0, 12);
    v11[0] = [v3 hash];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:buf];
  }

  return v6;
}

@end
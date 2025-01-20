@interface BYWarranty
+ (BOOL)shouldDisplay;
+ (void)acknowledge;
@end

@implementation BYWarranty

+ (BOOL)shouldDisplay
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

  return v3;
}

+ (void)acknowledge
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  uint64_t v3 = [v2 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty" error:&v9];
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (_BYIsInternalInstall())
      {
        int v6 = 0;
        v7 = v4;
      }
      else if (v4)
      {
        v8 = NSString;
        uint64_t v3 = [v4 domain];
        v7 = [v8 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v4, "code")];
        int v6 = 1;
      }
      else
      {
        int v6 = 0;
        v7 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_error_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_ERROR, "Failed to remove warranty sentinel: %{public}@", buf, 0xCu);
      if (v6)
      {
      }
    }
  }
}

@end
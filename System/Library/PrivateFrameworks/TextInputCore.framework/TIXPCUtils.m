@interface TIXPCUtils
+ (id)obtainApplicationIdentifierFromConnection:(id)a3;
+ (id)obtainBundleIdentifierFromConnection:(id)a3;
@end

@implementation TIXPCUtils

+ (id)obtainBundleIdentifierFromConnection:(id)a3
{
  if (a3
    && ([a3 _xpcConnection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)xpc_connection_copy_bundle_id(),
        v3,
        v4))
  {
    v5 = [NSString stringWithUTF8String:v4];
    free(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)obtainApplicationIdentifierFromConnection:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 && ([a3 auditToken], (v3 = SecTaskCreateWithAuditToken(0, &token)) != 0))
  {
    v4 = v3;
    CFErrorRef error = 0;
    v5 = (void *)SecTaskCopyValueForEntitlement(v3, @"application-identifier", &error);
    if (error)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      v6 = TIOSLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v8 = [NSString stringWithFormat:@"%s Cannot obtain application identifier: %@", "+[TIXPCUtils obtainApplicationIdentifierFromConnection:]", error];
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      CFRelease(error);
    }
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
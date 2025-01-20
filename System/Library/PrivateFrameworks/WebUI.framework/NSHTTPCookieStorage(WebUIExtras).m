@interface NSHTTPCookieStorage(WebUIExtras)
- (BOOL)webui_trackerProtectionEnabled;
- (__CFString)webui_safariCookieAcceptPolicy;
- (float)_safariCookieAcceptPolicyFloatValue;
- (uint64_t)webui_safariCookieAcceptPolicyEnumValue;
- (void)_safariCookieAcceptPolicyFloatValue;
- (void)webui_applySafariCookieAcceptPolicy;
@end

@implementation NSHTTPCookieStorage(WebUIExtras)

- (void)webui_applySafariCookieAcceptPolicy
{
  v2 = objc_msgSend(a1, "webui_safariCookieAcceptPolicy");
  id v4 = v2;
  if (!v2 || ([v2 isEqualToString:@"only from main document domain"] & 1) != 0)
  {
    uint64_t v3 = 2;
LABEL_4:
    [a1 setCookieAcceptPolicy:v3];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"always"])
  {
    uint64_t v3 = 0;
    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"never"])
  {
    uint64_t v3 = 1;
    goto LABEL_4;
  }
LABEL_5:
}

- (__CFString)webui_safariCookieAcceptPolicy
{
  [a1 _safariCookieAcceptPolicyFloatValue];
  v2 = @"only from main document domain";
  uint64_t v3 = @"never";
  if (v1 == 1.0) {
    uint64_t v3 = @"only from main document domain";
  }
  if (v1 != 1.5) {
    v2 = v3;
  }
  if (v1 == 2.0) {
    return @"always";
  }
  else {
    return v2;
  }
}

- (BOOL)webui_trackerProtectionEnabled
{
  return objc_msgSend(a1, "webui_safariCookieAcceptPolicyEnumValue") != 0;
}

- (uint64_t)webui_safariCookieAcceptPolicyEnumValue
{
  [a1 _safariCookieAcceptPolicyFloatValue];
  if (v1 == 2.0) {
    return 0;
  }
  uint64_t v3 = 2;
  if (v1 != 1.0) {
    uint64_t v3 = 1;
  }
  if (v1 == 1.5) {
    return 2;
  }
  else {
    return v3;
  }
}

- (float)_safariCookieAcceptPolicyFloatValue
{
  v0 = [MEMORY[0x263F53C50] sharedConnection];
  float v1 = [v0 effectiveValueForSetting:*MEMORY[0x263F53A20]];
  v2 = v1;
  if (v1)
  {
    [v1 floatValue];
    float v4 = v3;
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCookiePolicy();
    float v4 = 1.5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NSHTTPCookieStorage(WebUIExtras) _safariCookieAcceptPolicyFloatValue](v5);
    }
  }

  return v4;
}

- (void)_safariCookieAcceptPolicyFloatValue
{
  *(_WORD *)float v1 = 0;
  _os_log_error_impl(&dword_21C355000, log, OS_LOG_TYPE_ERROR, "Profile connection had no effective value for safariAcceptCookies setting; using default cookie accept policy",
    v1,
    2u);
}

@end
@interface NSBundle(PDUExtras)
- (id)pdu_aboutPrivacyBundleID;
- (void)pdu_aboutPrivacyBundleID;
@end

@implementation NSBundle(PDUExtras)

- (id)pdu_aboutPrivacyBundleID
{
  v1 = [a1 infoDictionary];
  v2 = [v1 objectForKeyedSubscript:@"NSRegulatoryPrivacyDisclosure"];
  v3 = [v2 objectForKeyedSubscript:@"NSRegulatoryPrivacyDisclosureOBKPrivacyBundle"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  v4 = [v3 lowercaseString];
  v5 = v4;
  if (v4)
  {
    if (([v4 isEqualToString:v3] & 1) == 0)
    {
      v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(NSBundle(PDUExtras) *)(uint64_t)v3 pdu_aboutPrivacyBundleID];
      }
    }
  }

  return v5;
}

- (void)pdu_aboutPrivacyBundleID
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A65C000, a2, OS_LOG_TYPE_ERROR, "OnBoardingKit bundle '%@' should be lower case only, please file a radar.", (uint8_t *)&v2, 0xCu);
}

@end
@interface NSURL(WebPrivacyExtras)
- (id)_wp_urlByRemovingTrackingInformation;
- (void)_wp_removeTrackingInformation:()WebPrivacyExtras;
@end

@implementation NSURL(WebPrivacyExtras)

- (id)_wp_urlByRemovingTrackingInformation
{
  v2 = [a1 query];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    v4 = +[WPResources sharedInstance];
    [v4 _waitForCachedLinkFilteringData];

    WebPrivacy::filterUsingCachedParameters((WebPrivacy *)a1, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (void)_wp_removeTrackingInformation:()WebPrivacyExtras
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setAfterUpdates:0];
  id v6 = +[WPResources sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke;
  v8[3] = &unk_265585F58;
  id v7 = v4;
  v8[4] = a1;
  id v9 = v7;
  [v6 requestLinkFilteringData:v5 completionHandler:v8];
}

@end
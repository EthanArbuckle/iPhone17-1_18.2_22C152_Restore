@interface NSURL(NewsUI)
+ (id)nu_sanitizedURLForWebView:()NewsUI navigationAction:;
- (id)nu_deepLinkURL;
- (uint64_t)nu_handleExternalURLWithPrompt;
@end

@implementation NSURL(NewsUI)

- (id)nu_deepLinkURL
{
  v2 = [MEMORY[0x263F01880] defaultWorkspace];
  v3 = [v2 URLOverrideForURL:a1];

  v4 = [MEMORY[0x263F01880] defaultWorkspace];
  v5 = [v4 applicationsAvailableForOpeningURL:v3];

  if ([v5 count])
  {
    v6 = [v5 objectAtIndex:0];
    v7 = [v6 localizedName];
    uint64_t v8 = [v7 length];

    if (v8) {
      a1 = v3;
    }
  }
  id v9 = a1;

  return v9;
}

+ (id)nu_sanitizedURLForWebView:()NewsUI navigationAction:
{
  id v5 = a4;
  v6 = [v5 request];
  v7 = [v6 URL];

  id v8 = v7;
  id v9 = [v5 targetFrame];
  if ([v9 isMainFrame])
  {
  }
  else
  {
    uint64_t v10 = [v5 navigationType];

    v11 = v8;
    if (v10) {
      goto LABEL_5;
    }
  }
  v11 = objc_msgSend(v8, "nu_deepLinkURL");

LABEL_5:
  if ([v11 isEqual:v8])
  {
    if ((objc_msgSend(a1, "nu_canHandleNavigationAction:", v5) & 1) == 0
      && [v8 isSpringboardHandledURL]
      && (([v8 hasTelephonyScheme] & 1) != 0
       || ([v8 isFaceTimeURL] & 1) != 0
       || [v8 isFaceTimeAudioURL]))
    {
      v12 = (void *)[objc_alloc(MEMORY[0x263F7E230]) initWithURL:v8];
      [v12 setShowUIPrompt:1];
      v13 = [v12 URL];

      id v8 = v13;
    }
    else
    {
      v13 = v8;
    }
  }
  else
  {
    v13 = v11;
  }
  id v14 = v13;

  return v14;
}

- (uint64_t)nu_handleExternalURLWithPrompt
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = [a1 scheme];
  if (objc_msgSend(a1, "fc_isStoreURL")) {
    goto LABEL_2;
  }
  if (objc_msgSend(a1, "fc_isHTTPScheme"))
  {
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  id v5 = [a1 absoluteString];
  char v6 = [v5 isEqualToString:@"about:blank"];

  uint64_t v4 = 0;
  if ((v6 & 1) == 0 && v2)
  {
    if (objc_msgSend(a1, "nss_isNewsURL"))
    {
      v7 = [MEMORY[0x263F1C408] sharedApplication];
      id v8 = [v7 delegate];
      uint64_t v19 = *MEMORY[0x263F1D098];
      id v9 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v10 = [v9 bundleIdentifier];
      v20[0] = v10;
      v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v4 = [v8 application:v7 openURL:a1 options:v11];
    }
    else
    {
      if (([a1 hasTelephonyScheme] & 1) != 0
        || ([a1 isFaceTimeAudioURL] & 1) != 0
        || [a1 isFaceTimeURL])
      {
LABEL_2:
        v3 = [MEMORY[0x263F1C408] sharedApplication];
        [v3 openURL:a1 options:MEMORY[0x263EFFA78] completionHandler:0];

        uint64_t v4 = 1;
        goto LABEL_11;
      }
      v13 = [MEMORY[0x263F01880] defaultWorkspace];
      v7 = [v13 applicationsAvailableForOpeningURL:a1];

      if (![v7 count])
      {
        uint64_t v4 = 0;
        goto LABEL_10;
      }
      id v8 = [v7 objectAtIndex:0];
      id v14 = [v8 localizedName];
      uint64_t v15 = [v14 length];
      uint64_t v4 = v15 != 0;

      if (v15)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke;
        block[3] = &unk_2645FE470;
        id v17 = v8;
        v18 = a1;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }

LABEL_10:
  }
LABEL_11:

  return v4;
}

@end
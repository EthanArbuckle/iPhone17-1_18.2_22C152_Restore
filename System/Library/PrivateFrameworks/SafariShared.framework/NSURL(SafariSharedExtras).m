@interface NSURL(SafariSharedExtras)
+ (id)safari_URLForReadingListItemWithUUIDString:()SafariSharedExtras;
+ (id)safari_URLWithDataAsString:()SafariSharedExtras;
+ (id)safari_URLWithDataAsString:()SafariSharedExtras relativeToURL:;
+ (id)safari_URLWithUserTypedString:()SafariSharedExtras;
+ (uint64_t)safari_aboutBlankURL;
+ (uint64_t)safari_readingListURL;
- (BOOL)_safari_isWithinQuirkedNavigationScope:()SafariSharedExtras;
- (BOOL)safari_hasCharactersBeyondPath;
- (BOOL)safari_hasUserOrPassword;
- (BOOL)safari_isURLTooLongToDisplay;
- (__CFString)safari_fileType;
- (__CFString)safari_path;
- (__CFString)safari_relativePathToURL:()SafariSharedExtras;
- (__CFString)safari_userVisibleHost;
- (__CFString)safari_userVisibleScheme;
- (id)safari_URLByDeletingUserAndPassword;
- (id)safari_URLByNormalizingSafariSpecificURL;
- (id)safari_URLByRemovingAllParameters;
- (id)safari_URLByRemovingQuery;
- (id)safari_URLByReplacingHostWithString:()SafariSharedExtras;
- (id)safari_canonicalURLForStartPage;
- (id)safari_composedIdentifierAndProfileIdentifierInSafariWebExtensionURL;
- (id)safari_defaultStatusMessageString;
- (id)safari_displayNameWithTitle:()SafariSharedExtras;
- (id)safari_firstURLQueryValue;
- (id)safari_identityPreferenceDomain;
- (id)safari_mailtoURLStatusMessage;
- (id)safari_originalDataAsString;
- (id)safari_readingListItemUUIDString;
- (id)safari_simplifiedURLStringForDeduping;
- (id)safari_stringForListDisplayWithAdditionalSimplificationOptions:()SafariSharedExtras;
- (id)safari_userVisibleHostOrExtensionDisplayName;
- (id)safari_userVisibleHostWithoutWWWSubdomain;
- (id)safari_userVisibleHostWithoutWWWSubdomainIfSecure;
- (id)safari_userVisibleStringConsideringLongURLs;
- (id)safari_wellKnownResponseCodeReliabilityURL;
- (uint64_t)safari_canQuirkBannerForNavigation;
- (uint64_t)safari_hasCustomScheme;
- (uint64_t)safari_hasFeedScheme;
- (uint64_t)safari_hasLocalScheme;
- (uint64_t)safari_isAboutBlankURL;
- (uint64_t)safari_isBlobURL;
- (uint64_t)safari_isDataURL;
- (uint64_t)safari_isEligibleToBeOpenedByServiceWorkers;
- (uint64_t)safari_isEligibleToShowNotSecureWarning;
- (uint64_t)safari_isEqualOrHasSameHighLevelDomainAsURL:()SafariSharedExtras;
- (uint64_t)safari_isEqualToOrChildOfStartURL:()SafariSharedExtras;
- (uint64_t)safari_isEqualToURL:()SafariSharedExtras;
- (uint64_t)safari_isHTTPSURL;
- (uint64_t)safari_isHTTPURL;
- (uint64_t)safari_isJavaScriptURL;
- (uint64_t)safari_isLocalOrPrivateNetworkURL;
- (uint64_t)safari_isMailtoURL;
- (uint64_t)safari_isMarketplaceKitURL;
- (uint64_t)safari_isOTPAuthMigrationURL;
- (uint64_t)safari_isOTPAuthURL;
- (uint64_t)safari_isReadingListURL;
- (uint64_t)safari_isSafariResourceURL;
- (uint64_t)safari_isSafariSpecificURL;
- (uint64_t)safari_isSafariWebExtensionURL;
- (uint64_t)safari_isSharedTabGroupURL;
- (uint64_t)safari_isSlackRedirectPage;
- (uint64_t)safari_isTelURL;
- (uint64_t)safari_isTopLevelURL;
- (uint64_t)safari_isWithinWebAppNavigationScope:()SafariSharedExtras;
- (uint64_t)safari_isWithinWebAppNavigationScope:()SafariSharedExtras allowingQuirks:;
- (uint64_t)safari_shouldBeAssociatedWithFaviconFromRedirectedURL:()SafariSharedExtras;
- (uint64_t)safari_stringForListDisplay;
@end

@implementation NSURL(SafariSharedExtras)

+ (id)safari_URLWithUserTypedString:()SafariSharedExtras
{
  v3 = WTF::URLWithUserTypedString(this, 0, (NSURL *)this);
  return v3;
}

+ (id)safari_URLWithDataAsString:()SafariSharedExtras
{
  v3 = objc_msgSend(a1, "safari_URLWithDataAsString:relativeToURL:", a3, 0);
  return v3;
}

+ (id)safari_URLWithDataAsString:()SafariSharedExtras relativeToURL:
{
  id v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_msgSend(v5, "safari_stringByTrimmingWhitespace");
    v8 = [v7 dataUsingEncoding:5];
    v10 = WTF::URLWithData(v8, v6, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)safari_isHTTPSURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"https");
}

+ (id)safari_URLForReadingListItemWithUUIDString:()SafariSharedExtras
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [NSString stringWithFormat:@"%@%@", @"reading-list://", a3];
  id v5 = [v3 URLWithString:v4];

  return v5;
}

+ (uint64_t)safari_aboutBlankURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
}

- (__CFString)safari_path
{
  v1 = (__CFString *)CFURLCopyPath(a1);
  return v1;
}

- (__CFString)safari_fileType
{
  if ([a1 isFileURL])
  {
    id v7 = 0;
    char v2 = [a1 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C538] error:0];
    id v3 = v7;
    v4 = v3;
    if (v2)
    {
      id v5 = [v3 identifier];
    }
    else
    {
      id v5 = &stru_1EFBE3CF8;
    }
  }
  else
  {
    id v5 = &stru_1EFBE3CF8;
  }
  return v5;
}

- (id)safari_identityPreferenceDomain
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  id v3 = [v1 scheme];
  [v2 setScheme:v3];

  v4 = [v1 host];
  [v2 setHost:v4];

  id v5 = [v1 port];
  [v2 setPort:v5];

  v6 = [v2 string];

  return v6;
}

- (uint64_t)safari_hasLocalScheme
{
  if ([a1 isFileURL]) {
    return 1;
  }
  return objc_msgSend(a1, "safari_hasScheme:", @"applewebdata");
}

- (uint64_t)safari_hasFeedScheme
{
  if (objc_msgSend(a1, "safari_hasScheme:", @"feed")) {
    return 1;
  }
  return objc_msgSend(a1, "safari_hasScheme:", @"feeds");
}

- (uint64_t)safari_isHTTPURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"http");
}

- (uint64_t)safari_isDataURL
{
  v1 = [a1 absoluteString];
  uint64_t v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", @"data:");

  return v2;
}

- (uint64_t)safari_hasCustomScheme
{
  uint64_t v2 = [a1 scheme];
  if ([v2 length]) {
    uint64_t v3 = objc_msgSend(a1, "safari_isHTTPFamilyURL") ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)safari_isBlobURL
{
  v1 = [a1 absoluteString];
  uint64_t v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", @"blob:");

  return v2;
}

- (uint64_t)safari_isMailtoURL
{
  v1 = [a1 absoluteString];
  uint64_t v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", @"mailto:");

  return v2;
}

- (uint64_t)safari_isSafariResourceURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"safari-resource");
}

- (uint64_t)safari_isAboutBlankURL
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_aboutBlankURL");
  uint64_t v3 = [a1 isEqual:v2];

  return v3;
}

- (uint64_t)safari_isSafariWebExtensionURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"safari-web-extension");
}

- (id)safari_composedIdentifierAndProfileIdentifierInSafariWebExtensionURL
{
  if (objc_msgSend(a1, "safari_isSafariWebExtensionURL"))
  {
    uint64_t v2 = [a1 host];
    uint64_t v3 = [v2 stringByRemovingPercentEncoding];

    uint64_t v4 = objc_msgSend(v3, "safari_indexOfFirstAppearanceOfCharacter:", 41);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = 0;
    }
    else
    {
      uint64_t v6 = v4 + 1;
      id v7 = [v3 substringToIndex:v4 + 1];
      v8 = [v3 substringFromIndex:v6];
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F97EE0]) initWithFirst:v7 second:v8];
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (uint64_t)safari_isMarketplaceKitURL
{
  if (objc_msgSend(a1, "safari_hasScheme:", @"app-distribution")) {
    return 1;
  }
  return objc_msgSend(a1, "safari_hasScheme:", @"marketplace-kit");
}

- (uint64_t)safari_isSafariSpecificURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"x-safari-https");
}

- (id)safari_URLByNormalizingSafariSpecificURL
{
  uint64_t v2 = [a1 host];

  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
    [v3 setScheme:@"https"];
    uint64_t v4 = [v3 URL];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"favorites://"];
  }
  return v4;
}

- (uint64_t)safari_isLocalOrPrivateNetworkURL
{
  v1 = [a1 host];
  if ([v1 isEqualToString:@"localhost"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 cStringUsingEncoding:1];
    if (v2)
    {
      if (inet_pton(2, (const char *)v2, &v10) == 1)
      {
        unsigned int v3 = bswap32(v10);
        uint64_t v2 = 1;
        if ((v3 & 0xFF000000) != 0xA000000 && (v3 & 0xFF000000) != 0x7F000000)
        {
          unsigned int v4 = v3 >> 20;
          unsigned int v5 = v3 & 0xFFFF0000;
          BOOL v7 = v5 == -1062731776 || v5 == -1442971648;
          uint64_t v2 = v4 == 2753 || v7;
        }
      }
      else if (inet_pton(30, (const char *)v2, &v9) == 1)
      {
        uint64_t v2 = 1;
        if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32(v9, (int32x4_t)xmmword_1A6D5F040))))) {
          uint64_t v2 = (v9.i8[0] & 0xFE) == 0xFC || (v9.i16[0] & 0xC0FF) == 33022;
        }
      }
      else
      {
        uint64_t v2 = 0;
      }
    }
  }

  return v2;
}

- (uint64_t)safari_isEligibleToBeOpenedByServiceWorkers
{
  uint64_t result = objc_msgSend(a1, "safari_isHTTPFamilyURL");
  if (result) {
    return objc_msgSend(a1, "safari_isLocalOrPrivateNetworkURL") ^ 1;
  }
  return result;
}

- (uint64_t)safari_isEligibleToShowNotSecureWarning
{
  uint64_t result = objc_msgSend(a1, "safari_isHTTPURL");
  if (result) {
    return objc_msgSend(a1, "safari_isLocalOrPrivateNetworkURL") ^ 1;
  }
  return result;
}

- (uint64_t)safari_isOTPAuthURL
{
  if (objc_msgSend(a1, "safari_hasScheme:", @"otpauth")) {
    return 1;
  }
  return objc_msgSend(a1, "safari_hasScheme:", @"apple-otpauth");
}

- (uint64_t)safari_isOTPAuthMigrationURL
{
  if (objc_msgSend(a1, "safari_hasScheme:", @"otpauth-migration")) {
    return 1;
  }
  return objc_msgSend(a1, "safari_hasScheme:", @"apple-otpauth-migration");
}

- (id)safari_firstURLQueryValue
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(v1, "queryItems", 0);
  unsigned int v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) value];
        if (objc_msgSend(v6, "safari_looksLikeAbsoluteURLString"))
        {
          unsigned int v3 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

          goto LABEL_11;
        }
      }
      unsigned int v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (uint64_t)safari_isEqualToOrChildOfStartURL:()SafariSharedExtras
{
  id v4 = a3;
  unsigned int v5 = objc_msgSend(a1, "safari_URLByRemovingAllParameters");
  uint64_t v6 = [v5 absoluteString];
  BOOL v7 = [v6 lowercaseString];

  long long v8 = objc_msgSend(v4, "safari_URLByRemovingAllParameters");
  long long v9 = [v8 absoluteString];
  long long v10 = [v9 lowercaseString];

  uint64_t v11 = [v7 hasPrefix:v10];
  return v11;
}

- (uint64_t)safari_isWithinWebAppNavigationScope:()SafariSharedExtras
{
  return objc_msgSend(a1, "safari_isWithinWebAppNavigationScope:allowingQuirks:", a3, 1);
}

- (uint64_t)safari_isWithinWebAppNavigationScope:()SafariSharedExtras allowingQuirks:
{
  id v6 = a3;
  if (!v6) {
    goto LABEL_6;
  }
  if (!objc_msgSend(a1, "safari_hasSameOriginAsURL:relaxingWWW:", v6, 1)
    || objc_msgSend(a1, "safari_canQuirkBannerForNavigation"))
  {
    if (a4)
    {
      uint64_t v7 = objc_msgSend(a1, "_safari_isWithinQuirkedNavigationScope:", v6);
      goto LABEL_12;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  long long v8 = [a1 path];
  long long v9 = [v6 path];
  if ([v8 length] && objc_msgSend(v9, "length")) {
    uint64_t v7 = objc_msgSend(v8, "safari_hasPrefix:", v9);
  }
  else {
    uint64_t v7 = 1;
  }

LABEL_12:
  return v7;
}

- (uint64_t)safari_canQuirkBannerForNavigation
{
  v1 = objc_msgSend(a1, "safari_highLevelDomain");
  uint64_t v2 = [&unk_1EFC221D8 containsObject:v1];

  return v2;
}

- (BOOL)_safari_isWithinQuirkedNavigationScope:()SafariSharedExtras
{
  id v4 = a3;
  unsigned int v5 = [v4 host];
  id v6 = [v5 lowercaseString];

  uint64_t v7 = [a1 host];
  long long v8 = [v7 lowercaseString];

  long long v9 = objc_msgSend(v6, "safari_highLevelDomainFromHost");
  long long v10 = objc_msgSend(v8, "safari_highLevelDomainFromHost");
  if (objc_msgSend(a1, "safari_canQuirkBannerForNavigation")
    && ([v9 isEqualToString:v10] & 1) != 0)
  {
    goto LABEL_15;
  }
  if (![v9 isEqualToString:v10])
  {
LABEL_17:
    v19 = objc_msgSend(v6, "safari_stringByRemovingWwwDotPrefix");
    v20 = objc_msgSend(v8, "safari_stringByRemovingWwwDotPrefix");
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__NSURL_SafariSharedExtras___safari_isWithinQuirkedNavigationScope___block_invoke;
    v24[3] = &unk_1E5C9DE70;
    id v21 = v19;
    id v26 = v20;
    v27 = &v28;
    id v25 = v21;
    id v22 = v20;
    [&unk_1EFC22360 enumerateKeysAndObjectsUsingBlock:v24];
    BOOL v18 = *((unsigned char *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
    goto LABEL_18;
  }
  if ([&unk_1EFC221F0 containsObject:v9]) {
    goto LABEL_15;
  }
  uint64_t v11 = [v9 componentsSeparatedByString:@"."];
  v12 = [v11 firstObject];
  char v13 = [&unk_1EFC221F0 containsObject:v12];

  if (v13) {
    goto LABEL_15;
  }
  v14 = [v8 componentsSeparatedByString:@"."];
  v15 = [v14 firstObject];

  v16 = [v6 componentsSeparatedByString:@"."];
  v17 = [v16 firstObject];

  if ((!v17 || ([v15 hasPrefix:v17] & 1) == 0)
    && (!v15 || ([v17 hasPrefix:v15] & 1) == 0)
    && ([v17 isEqualToString:@"www"] & 1) == 0
    && ([v15 isEqualToString:@"www"] & 1) == 0
    && ([v6 isEqualToString:v9] & 1) == 0
    && ([v8 isEqualToString:v10] & 1) == 0)
  {

    goto LABEL_17;
  }

LABEL_15:
  BOOL v18 = 1;
LABEL_18:

  return v18;
}

- (uint64_t)safari_isSlackRedirectPage
{
  uint64_t v2 = objc_msgSend(a1, "safari_highLevelDomain");
  unsigned int v3 = [a1 host];
  char v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [a1 path];
    if (objc_msgSend(v6, "safari_isSubpathOfPath:", @"/archives"))
    {
      int v7 = 1;
    }
    else
    {
      long long v8 = [a1 path];
      int v7 = objc_msgSend(v8, "safari_isSubpathOfPath:", @"/files");
    }
    uint64_t v5 = [v2 isEqualToString:@"slack.com"] & v7;
  }

  return v5;
}

- (id)safari_URLByReplacingHostWithString:()SafariSharedExtras
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  [v5 setHost:v4];
  id v6 = [v5 URL];

  return v6;
}

- (BOOL)safari_hasUserOrPassword
{
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v2 = [v1 user];
  if ([v2 length])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [v1 password];
    BOOL v3 = [v4 length] != 0;
  }
  return v3;
}

- (id)safari_URLByDeletingUserAndPassword
{
  uint64_t v2 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  BOOL v3 = [v2 user];
  if ([v3 length])
  {

LABEL_4:
    [v2 setUser:0];
    [v2 setPassword:0];
    uint64_t v6 = [v2 URL];
    goto LABEL_5;
  }
  id v4 = [v2 password];
  uint64_t v5 = [v4 length];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [a1 copy];
LABEL_5:
  int v7 = (void *)v6;

  return v7;
}

- (id)safari_URLByRemovingAllParameters
{
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  [v1 setQuery:0];
  uint64_t v2 = [v1 URL];

  return v2;
}

- (id)safari_canonicalURLForStartPage
{
  v1 = objc_msgSend(a1, "safari_originalDataAsString");
  uint64_t v2 = objc_msgSend(v1, "safari_bestURLForUserTypedString");
  BOOL v3 = objc_msgSend(v2, "safari_canonicalURL");

  return v3;
}

- (id)safari_simplifiedURLStringForDeduping
{
  v1 = objc_msgSend(a1, "safari_canonicalURL");
  uint64_t v2 = objc_msgSend(v1, "safari_originalDataAsString");
  BOOL v3 = objc_msgSend(v2, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 367, 0, 0);

  return v3;
}

- (BOOL)safari_hasCharactersBeyondPath
{
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  uint64_t v2 = v1;
  if (v1) {
    BOOL v3 = [v1 rangeOfFragment] != 0x7FFFFFFFFFFFFFFFLL
  }
      || [v2 rangeOfQuery] != 0x7FFFFFFFFFFFFFFFLL;
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)safari_displayNameWithTitle:()SafariSharedExtras
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    if ([a1 isFileURL])
    {
      long long v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v9 = [a1 path];
      uint64_t v6 = [v8 displayNameAtPath:v9];

      if (v6) {
        goto LABEL_9;
      }
      goto LABEL_4;
    }
    if (objc_msgSend(a1, "safari_isURLTooLongToDisplay")) {
      [a1 host];
    }
    else {
      objc_msgSend(a1, "safari_userVisibleString");
    }
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;
  if (v5) {
    goto LABEL_9;
  }
LABEL_4:
  int v7 = WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[NSURL(SafariSharedExtras) safari_displayNameWithTitle:]((uint64_t)a1, v7);
  }
  uint64_t v6 = _WBSLocalizedString();
LABEL_9:

  return v6;
}

- (id)safari_originalDataAsString
{
  id v2 = [NSString alloc];
  id v4 = WTF::originalURLData(a1, v3);
  id v5 = (void *)[v2 initWithData:v4 encoding:5];

  return v5;
}

- (__CFString)safari_userVisibleHost
{
  v1 = [a1 host];
  WTF::decodeHostName(v1, v2);
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v3) {
    BOOL v3 = &stru_1EFBE3CF8;
  }
  id v5 = v3;

  return v5;
}

- (id)safari_userVisibleHostOrExtensionDisplayName
{
  id v2 = (SafariShared::ExtensionURLTranslator *)[(NSURL *)a1 safari_isSafariWebExtensionURL];
  if (v2)
  {
    BOOL v3 = (SafariShared::ExtensionURLTranslator *)SafariShared::ExtensionURLTranslator::shared(v2);
    SafariShared::ExtensionURLTranslator::displayNameForExtensionURL(v3, a1);
  }
  else
  {
    [(NSURL *)a1 safari_userVisibleHostWithoutWWWSubdomain];
  id v4 = };
  return v4;
}

- (id)safari_userVisibleHostWithoutWWWSubdomain
{
  v1 = objc_msgSend(a1, "safari_userVisibleHost");
  id v2 = objc_msgSend(v1, "safari_stringByRemovingWwwDotPrefix");

  return v2;
}

- (id)safari_userVisibleHostWithoutWWWSubdomainIfSecure
{
  if (objc_msgSend(a1, "safari_isEligibleToShowNotSecureWarning"))
  {
    id v2 = objc_msgSend(a1, "safari_userVisibleHost");
    BOOL v3 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
    id v4 = NSString;
    id v5 = [v3 scheme];
    uint64_t v6 = [v4 stringWithFormat:@"%@://%@", v5, v2];
  }
  else
  {
    uint64_t v6 = objc_msgSend(a1, "safari_userVisibleHostWithoutWWWSubdomain");
  }
  return v6;
}

- (__CFString)safari_userVisibleScheme
{
  v1 = objc_msgSend(a1, "safari_userVisibleString");
  uint64_t v2 = [v1 rangeOfString:@":"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = &stru_1EFBE3CF8;
  }
  else
  {
    BOOL v3 = [v1 substringToIndex:v2];
  }

  return v3;
}

- (uint64_t)safari_isTopLevelURL
{
  v1 = [a1 path];
  if ([v1 length]) {
    uint64_t v2 = [v1 isEqualToString:@"/"];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

- (uint64_t)safari_shouldBeAssociatedWithFaviconFromRedirectedURL:()SafariSharedExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  uint64_t v6 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:1];
  int v7 = [v5 path];
  if (![v7 length]
    || ([v7 isEqualToString:@"/"] & 1) != 0
    || ([v6 path],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 isEqual:v8],
        v8,
        (v9 & 1) != 0))
  {
    long long v10 = [v6 scheme];
    [v5 setScheme:v10];

    uint64_t v11 = [v6 path];
    [v5 setPath:v11];

    v12 = [v6 fragment];
    [v5 setFragment:v12];

    char v13 = [v5 host];
    v14 = objc_msgSend(v13, "safari_stringByRemovingWwwDotPrefix");
    [v5 setHost:v14];

    v15 = [v6 host];
    v16 = objc_msgSend(v15, "safari_stringByRemovingWwwDotPrefix");
    [v6 setHost:v16];

    uint64_t v17 = [v5 isEqual:v6];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)safari_userVisibleStringConsideringLongURLs
{
  if (objc_msgSend(a1, "safari_isURLTooLongToDisplay"))
  {
    uint64_t v2 = [a1 absoluteString];
    BOOL v3 = [v2 substringToIndex:4096];
  }
  else
  {
    BOOL v3 = objc_msgSend(a1, "safari_userVisibleString");
  }
  return v3;
}

- (BOOL)safari_isURLTooLongToDisplay
{
  v1 = [a1 absoluteString];
  BOOL v2 = (unint64_t)[v1 length] > 0x1000;

  return v2;
}

- (id)safari_wellKnownResponseCodeReliabilityURL
{
  if (objc_msgSend(a1, "safari_isHTTPFamilyURL"))
  {
    BOOL v2 = objc_msgSend(a1, "safari_URLByRemovingUserPasswordPathQueryAndFragment");
    BOOL v3 = [v2 URLByAppendingPathComponent:@".well-known/resource-that-should-not-exist-whose-status-code-should-not-be-200"];
    id v4 = objc_msgSend(v3, "safari_URLByReplacingSchemeWithString:", @"https");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (__CFString)safari_relativePathToURL:()SafariSharedExtras
{
  id v4 = [a3 URLByStandardizingPath];
  id v5 = [v4 pathComponents];

  uint64_t v6 = [a1 URLByStandardizingPath];
  int v7 = [v6 pathComponents];

  long long v8 = 0;
  if (v5 && v7)
  {
    unint64_t v9 = [v5 count];
    unint64_t v10 = [v7 count];
    if (v9 >= v10)
    {
      uint64_t v11 = objc_msgSend(v5, "subarrayWithRange:", 0, v10);
      if ([v11 isEqualToArray:v7])
      {
        if (v9 == v10)
        {
          long long v8 = &stru_1EFBE3CF8;
        }
        else
        {
          v12 = objc_msgSend(v5, "subarrayWithRange:", v10, v9 - v10);
          long long v8 = [NSString pathWithComponents:v12];
        }
      }
      else
      {
        long long v8 = 0;
      }
    }
    else
    {
      long long v8 = 0;
    }
  }

  return v8;
}

- (id)safari_stringForListDisplayWithAdditionalSimplificationOptions:()SafariSharedExtras
{
  id v4 = objc_msgSend(a1, "safari_userVisibleStringConsideringLongURLs");
  if ((unint64_t)[v4 length] >= 0x101)
  {
    uint64_t v5 = objc_msgSend(v4, "substringWithRange:", 0, 256);

    id v4 = (void *)v5;
  }
  uint64_t v6 = objc_msgSend(v4, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3 | 0x14F, 1, 0);

  return v6;
}

- (uint64_t)safari_stringForListDisplay
{
  return objc_msgSend(a1, "safari_stringForListDisplayWithAdditionalSimplificationOptions:", 0);
}

- (id)safari_mailtoURLStatusMessage
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(a1, "safari_isMailtoURL"))
  {
    v12 = 0;
    goto LABEL_22;
  }
  BOOL v2 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  BOOL v3 = [v2 path];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v2 queryItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v9 = [v8 name];
        int v10 = [v9 isEqualToString:@"subject"];

        if (v10)
        {
          uint64_t v11 = [v8 value];
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_13:

  if ([v11 length] && objc_msgSend(v3, "length"))
  {
    char v13 = NSString;
    v14 = _WBSLocalizedString();
    uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", v14, v3, v11);
  }
  else if ([v11 length])
  {
    v16 = NSString;
    v14 = _WBSLocalizedString();
    uint64_t v15 = objc_msgSend(v16, "stringWithFormat:", v14, v11);
  }
  else
  {
    if (![v3 length])
    {
      v12 = 0;
      goto LABEL_21;
    }
    uint64_t v17 = NSString;
    v14 = _WBSLocalizedString();
    uint64_t v15 = objc_msgSend(v17, "stringWithFormat:", v14, v3);
  }
  v12 = (void *)v15;

LABEL_21:
LABEL_22:
  return v12;
}

- (id)safari_defaultStatusMessageString
{
  if (objc_msgSend(a1, "safari_isJavaScriptURL"))
  {
    BOOL v2 = NSString;
    BOOL v3 = _WBSLocalizedString();
    id v4 = objc_msgSend(a1, "safari_userVisibleString");
    uint64_t v5 = [v4 substringFromIndex:11];
    uint64_t v6 = objc_msgSend(v2, "stringWithFormat:", v3, v5);
LABEL_5:

    goto LABEL_7;
  }
  if (objc_msgSend(a1, "safari_isTelURL"))
  {
    int v7 = NSString;
    BOOL v3 = _WBSLocalizedString();
    id v4 = [a1 absoluteString];
    uint64_t v5 = [v4 substringFromIndex:objc_msgSend(@"tel:", "length")];
    long long v8 = [v5 stringByRemovingPercentEncoding];
    uint64_t v6 = objc_msgSend(v7, "stringWithFormat:", v3, v8);

    goto LABEL_5;
  }
  uint64_t v6 = objc_msgSend(a1, "safari_mailtoURLStatusMessage");
LABEL_7:
  return v6;
}

- (uint64_t)safari_isJavaScriptURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"javascript");
}

- (uint64_t)safari_isTelURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"tel");
}

- (uint64_t)safari_isSharedTabGroupURL
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [v1 hasPrefix:@"https://www.icloud.com/safari-tab-groups"];

  return v2;
}

- (uint64_t)safari_isEqualToURL:()SafariSharedExtras
{
  id v4 = a3;
  if objc_msgSend(a1, "safari_isHTTPFamilyURL") && (objc_msgSend(v4, "safari_isHTTPFamilyURL"))
  {
    id v5 = a1;
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = [v6 length];

    if (!v7)
    {
      uint64_t v8 = [v5 URLByAppendingPathComponent:@"/"];

      id v5 = (id)v8;
    }
    unint64_t v9 = [v4 lastPathComponent];
    uint64_t v10 = [v9 length];

    if (!v10)
    {
      uint64_t v11 = [v4 URLByAppendingPathComponent:@"/"];

      id v4 = (id)v11;
    }
    uint64_t v12 = [v5 isEqual:v4];
  }
  else
  {
    uint64_t v12 = [a1 isEqual:v4];
  }

  return v12;
}

- (uint64_t)safari_isEqualOrHasSameHighLevelDomainAsURL:()SafariSharedExtras
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = [v5 host];
  uint64_t v7 = [v4 host];
  int v8 = [v6 isEqualToString:v7];

  unint64_t v9 = [v5 host];
  uint64_t v10 = objc_msgSend(v9, "safari_highLevelDomainFromHost");
  uint64_t v11 = [v4 host];
  uint64_t v12 = objc_msgSend(v11, "safari_highLevelDomainFromHost");
  int v13 = [v10 isEqualToString:v12];

  if ((v8 | v13)) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = objc_msgSend(v5, "safari_isEqualToURL:", v4);
  }

  return v14;
}

- (uint64_t)safari_isReadingListURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"reading-list");
}

+ (uint64_t)safari_readingListURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"reading-list://"];
}

- (id)safari_readingListItemUUIDString
{
  if (objc_msgSend(a1, "safari_isReadingListURL"))
  {
    uint64_t v2 = [a1 host];
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];

    if (v3) {
      id v4 = 0;
    }
    else {
      id v4 = v2;
    }
    if (!v3) {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)safari_URLByRemovingQuery
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  [v1 setQuery:0];
  uint64_t v2 = [v1 URL];

  return v2;
}

- (void)safari_displayNameWithTitle:()SafariSharedExtras .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 141558275;
  uint64_t v3 = 1752392040;
  __int16 v4 = 2117;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "(probably a bug in NS/CFURL): unable to create title from %{sensitive, mask.hash}@", (uint8_t *)&v2, 0x16u);
}

@end
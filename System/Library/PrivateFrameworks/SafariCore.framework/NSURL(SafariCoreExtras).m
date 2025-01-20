@interface NSURL(SafariCoreExtras)
+ (id)safari_URLWithUserTypedString:()SafariCoreExtras;
+ (uint64_t)safari_hostAndPortRangeFromUserTypedString:()SafariCoreExtras;
+ (void)safari_enumeratePossibleURLsForUserTypedString:()SafariCoreExtras withBlock:;
- (BOOL)safari_hasSameOriginAsURL:()SafariCoreExtras relaxingWWW:;
- (NSURL)safari_URLWithUniqueFilename;
- (id)safari_URLByRemovingUserPasswordPathQueryAndFragment;
- (id)safari_URLByReplacingScheme:()SafariCoreExtras withScheme:;
- (id)safari_URLByReplacingSchemeWithString:()SafariCoreExtras;
- (id)safari_absoluteStringWithoutFragment;
- (id)safari_canonicalURL;
- (id)safari_highLevelDomain;
- (id)safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString;
- (id)safari_wellKnownChangePasswordURL;
- (uint64_t)safari_displayNameForFile;
- (uint64_t)safari_hasSameOriginAsURL:()SafariCoreExtras;
- (uint64_t)safari_hasSameSiteAsURL:()SafariCoreExtras;
- (uint64_t)safari_hasScheme:()SafariCoreExtras;
- (uint64_t)safari_hostCompare:()SafariCoreExtras;
- (uint64_t)safari_isAppleNewsURL;
- (uint64_t)safari_isAppleOneURL;
- (uint64_t)safari_isEligibleforDirectSSO;
- (uint64_t)safari_isHTTPFamilyURL;
- (uint64_t)safari_isSameAsURLRemovingFragment:()SafariCoreExtras;
- (uint64_t)safari_isSubdomainOfDomain:()SafariCoreExtras;
- (uint64_t)safari_isWellKnownChangePasswordURL;
- (uint64_t)safari_isXWebSearchURL;
- (void)safari_accessingSecurityScopedResource:()SafariCoreExtras;
@end

@implementation NSURL(SafariCoreExtras)

- (uint64_t)safari_isHTTPFamilyURL
{
  v1 = [a1 absoluteString];
  if (objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", @"http:")) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", @"https:");
  }

  return v2;
}

- (uint64_t)safari_hasScheme:()SafariCoreExtras
{
  id v4 = a3;
  v5 = [a1 scheme];
  uint64_t v6 = objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", v4);

  return v6;
}

+ (id)safari_URLWithUserTypedString:()SafariCoreExtras
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "_lp_URLWithUserTypedString:relativeToURL:", a3, 0);
  return v3;
}

- (uint64_t)safari_isSubdomainOfDomain:()SafariCoreExtras
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "safari_hostComponentsEnumerator");
  uint64_t v6 = objc_msgSend(v4, "safari_hostComponentsEnumerator");
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = [v5 nextObject];

    v10 = [v6 nextObject];

    v7 = v9;
    v8 = v10;
  }
  while (([v9 isEqualToString:v10] & 1) != 0);
  if (v10)
  {
    v11 = [v6 nextObject];
    if (v11)
    {
      uint64_t v12 = 0;
    }
    else if (objc_msgSend(v10, "safari_isCaseInsensitiveEqualToString:", @"www"))
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v12 = objc_msgSend(v10, "safari_isCaseInsensitiveEqualToString:", @"m");
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

+ (void)safari_enumeratePossibleURLsForUserTypedString:()SafariCoreExtras withBlock:
{
  id v7 = a3;
  id v5 = a4;
  if ((enumeratePossibleURLsForUserTypedStringWithBlockInternal(v7, v5) & 1) == 0)
  {
    uint64_t v6 = objc_msgSend(v7, "safari_possibleTopLevelDomainCorrectionForUserTypedString");
    enumeratePossibleURLsForUserTypedStringWithBlockInternal(v6, v5);
  }
}

+ (uint64_t)safari_hostAndPortRangeFromUserTypedString:()SafariCoreExtras
{
  id v3 = a3;
  uint64_t v5 = [v3 rangeOfString:@"://" options:2];
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v4;
    {
      v16 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."];
      +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::nonSchemeCharacters = [v16 invertedSet];
    }
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::nonSchemeCharacters, 2, 0, v5) == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [v3 length];
      {
        uint64_t v9 = +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::hostTerminators;
      }
      else
      {
        uint64_t v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/?#"];
        +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::hostTerminators = v9;
      }
      uint64_t v10 = v5 + v7;
      uint64_t v11 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v9, 2, v10, v8 - v10);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v12 = v8;
      }
      else {
        uint64_t v12 = v11;
      }
      uint64_t v13 = objc_msgSend(v3, "rangeOfString:options:range:", @"@", 2, v10, v12 - v10);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v6 = v10;
      }
      else {
        uint64_t v6 = v13 + v14;
      }
    }
  }

  return v6;
}

- (uint64_t)safari_hasSameOriginAsURL:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_hasSameOriginAsURL:relaxingWWW:", a3, 0);
}

- (BOOL)safari_hasSameOriginAsURL:()SafariCoreExtras relaxingWWW:
{
  id v6 = a3;
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = [a1 scheme];
  uint64_t v8 = [v6 scheme];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    if (a4
      && objc_msgSend(a1, "safari_isHTTPFamilyURL")
      && (objc_msgSend(v6, "safari_isHTTPFamilyURL") & 1) != 0)
    {
      goto LABEL_4;
    }
LABEL_8:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  if (!a4)
  {
    uint64_t v11 = [a1 host];
    uint64_t v13 = [v6 host];
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v10 = [a1 host];
  uint64_t v11 = objc_msgSend(v10, "safari_stringByRemovingWwwDotPrefix");

  uint64_t v12 = [v6 host];
  uint64_t v13 = objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");

LABEL_10:
  if ([v11 isEqualToString:v13])
  {
    v15 = [a1 port];
    v16 = [v6 port];
    BOOL v14 = v15 == v16;
  }
  else
  {
    BOOL v14 = 0;
  }

LABEL_14:
  return v14;
}

- (uint64_t)safari_hasSameSiteAsURL:()SafariCoreExtras
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  if ((objc_msgSend(a1, "safari_hasSameOriginAsURL:", v4) & 1) == 0)
  {
    id v6 = [a1 scheme];
    uint64_t v7 = [v4 scheme];
    char v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      char v9 = [a1 host];
      uint64_t v10 = objc_msgSend(v9, "safari_highLevelDomainFromHost");
      uint64_t v11 = [v4 host];
      uint64_t v12 = objc_msgSend(v11, "safari_highLevelDomainFromHost");
      uint64_t v5 = [v10 isEqualToString:v12];

      goto LABEL_7;
    }
LABEL_6:
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = 1;
LABEL_7:

  return v5;
}

- (uint64_t)safari_isSameAsURLRemovingFragment:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "safari_absoluteStringWithoutFragment");
  id v6 = objc_msgSend(v4, "safari_absoluteStringWithoutFragment");
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

- (id)safari_canonicalURL
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:a1];
  if (objc_opt_respondsToSelector()) {
    id v3 = (void *)[MEMORY[0x1E4F18DA0] _protocolClassForRequest:v2 skipAppSSO:1];
  }
  else {
    id v3 = (void *)[MEMORY[0x1E4F18DA0] _protocolClassForRequest:v2];
  }
  if (v3)
  {
    id v4 = [v3 canonicalRequestForRequest:v2];
    id v5 = [v4 URL];
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (uint64_t)safari_displayNameForFile
{
  return 0;
}

- (id)safari_absoluteStringWithoutFragment
{
  uint64_t v2 = [a1 fragment];
  [a1 absoluteString];
  if (v2) {
    id v3 = {;
  }
    id v4 = [@"#" stringByAppendingString:v2];
    id v5 = [v3 stringByReplacingOccurrencesOfString:v4 withString:&stru_1F105D3F0];
  }
  else {
    id v5 = {;
  }
  }

  return v5;
}

- (id)safari_highLevelDomain
{
  v1 = [a1 host];
  uint64_t v2 = objc_msgSend(v1, "safari_highLevelDomainFromHost");

  return v2;
}

- (id)safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString
{
  uint64_t v2 = [a1 host];
  id v3 = objc_msgSend(v2, "safari_highLevelDomainFromHost");
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [a1 host];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [a1 absoluteString];
    }
    id v5 = v8;
  }
  return v5;
}

- (uint64_t)safari_hostCompare:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "safari_hostComponentsEnumerator");
  id v6 = objc_msgSend(v4, "safari_hostComponentsEnumerator");
  uint64_t v7 = [v5 nextObject];
  id v8 = [v6 nextObject];
  if (![v7 length] && objc_msgSend(v8, "length")) {
    goto LABEL_10;
  }
  if ([v7 length] && !objc_msgSend(v8, "length")) {
    goto LABEL_8;
  }
  uint64_t v9 = [v5 kind];
  uint64_t v10 = [v6 kind];
  if (!v9 && v10) {
    goto LABEL_10;
  }
  if (v9 && !v10) {
    goto LABEL_8;
  }
  if (!(v9 | v10))
  {
    unsigned int v13 = [v5 ipv4Address];
    unsigned int v14 = [v6 ipv4Address];
    if (v13 < v14) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = v13 > v14;
    }
    goto LABEL_11;
  }
  if (v9 == 1 && v10 != 1) {
    goto LABEL_10;
  }
  if (v9 != 1 && v10 == 1) {
    goto LABEL_8;
  }
  if (v9 == 1 && v10 == 1)
  {
    v27[0] = [v5 ipv6Address];
    v27[1] = v15;
    uint64_t v16 = [v6 ipv6Address];
    uint64_t v17 = 0;
    v26[0] = v16;
    v26[1] = v18;
    uint64_t v11 = 1;
    while (1)
    {
      unsigned int v19 = *((unsigned __int8 *)v27 + v17);
      unsigned int v20 = *((unsigned __int8 *)v26 + v17);
      if (v19 < v20) {
        goto LABEL_10;
      }
      if (v19 > v20) {
        goto LABEL_11;
      }
      if (++v17 == 16)
      {
        uint64_t v11 = 0;
        goto LABEL_11;
      }
    }
  }
  if (v9 == 2 && v10 != 2)
  {
LABEL_10:
    uint64_t v11 = -1;
    goto LABEL_11;
  }
  if (v9 != 2 && v10 == 2)
  {
LABEL_8:
    uint64_t v11 = 1;
    goto LABEL_11;
  }
  uint64_t v21 = 0;
  BOOL v22 = v8 != 0;
  if (v7 && v8)
  {
    uint64_t v21 = 0;
    do
    {
      uint64_t v11 = [v7 caseInsensitiveCompare:v8];
      if ([v5 kind] == 3 && objc_msgSend(v6, "kind") == 3)
      {
        uint64_t v21 = v11;
      }
      else if (v11)
      {
        goto LABEL_11;
      }
      uint64_t v23 = [v5 nextObject];

      uint64_t v24 = [v6 nextObject];

      BOOL v22 = v24 != 0;
      if (!v23) {
        break;
      }
      id v8 = (void *)v24;
      uint64_t v7 = (void *)v23;
    }
    while (v24);
  }
  else
  {
    uint64_t v23 = (uint64_t)v7;
    uint64_t v24 = (uint64_t)v8;
  }
  if (!v23 || v22)
  {
    BOOL v25 = v23 == 0;
    if (v25 && v22) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = v21;
    }
    if (v25 && v22) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = (void *)v23;
    }
    id v8 = (void *)v24;
  }
  else
  {
    id v8 = 0;
    uint64_t v11 = 1;
    uint64_t v7 = (void *)v23;
  }
LABEL_11:

  return v11;
}

- (uint64_t)safari_isXWebSearchURL
{
  return objc_msgSend(a1, "safari_hasScheme:", @"x-web-search");
}

- (uint64_t)safari_isAppleNewsURL
{
  v1 = [a1 host];
  uint64_t v2 = objc_msgSend(v1, "safari_isCaseInsensitiveEqualToString:", @"apple.news");

  return v2;
}

- (uint64_t)safari_isAppleOneURL
{
  if (!objc_msgSend(a1, "safari_hasScheme:", @"ams-ui")) {
    return 0;
  }
  uint64_t v2 = [a1 host];
  uint64_t v3 = objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", @"one.apple.com");

  return v3;
}

- (id)safari_URLByReplacingScheme:()SafariCoreExtras withScheme:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 scheme];
  char v9 = WBSIsEqual(v8, v6);

  if (v9)
  {
    objc_msgSend(a1, "safari_URLByReplacingSchemeWithString:", v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = a1;
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)safari_URLByReplacingSchemeWithString:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  [v5 setScheme:v4];
  id v6 = [v5 URL];

  return v6;
}

- (uint64_t)safari_isEligibleforDirectSSO
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v26 queryItems];
  uint64_t v1 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v1)
  {

LABEL_22:
    char v24 = 0;
    goto LABEL_23;
  }
  int v2 = 0;
  char v27 = 0;
  char v30 = 0;
  int v3 = 0;
  int v4 = 0;
  uint64_t v29 = *(void *)v34;
  do
  {
    uint64_t v31 = v1;
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (*(void *)v34 != v29) {
        objc_enumerationMutation(obj);
      }
      id v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v7 = [v6 name];
      id v8 = [v7 lowercaseString];
      if ([v8 isEqualToString:@"client_id"])
      {
        char v9 = [v6 value];
        BOOL v32 = [v9 length] != 0;
      }
      else
      {
        BOOL v32 = 0;
      }

      id v10 = [v6 name];
      uint64_t v11 = [v10 lowercaseString];
      if ([v11 isEqualToString:@"response_type"])
      {
        uint64_t v12 = [v6 value];
        int v13 = [v12 isEqualToString:@"code"];
      }
      else
      {
        int v13 = 0;
      }

      unsigned int v14 = [v6 name];
      uint64_t v15 = [v14 lowercaseString];
      if ([v15 isEqualToString:@"redirect_uri"])
      {
        uint64_t v16 = [v6 value];
        int v17 = [v16 hasPrefix:@"http"];

        int v18 = v17 ^ 1;
      }
      else
      {
        int v18 = 0;
      }

      unsigned int v19 = [v6 name];
      unsigned int v20 = [v19 lowercaseString];
      int v21 = [v20 isEqualToString:@"response_mode"];

      if (v21)
      {
        BOOL v22 = [v6 value];
        char v23 = [v22 isEqualToString:@"query"];

        v30 |= v23;
        char v27 = 1;
      }
      v4 |= v32;
      v3 |= v13;
      v2 |= v18;
    }
    uint64_t v1 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v1);

  if ((v4 & v3 & v2 & 1) == 0) {
    goto LABEL_22;
  }
  char v24 = v27 ^ 1 | v30;
LABEL_23:

  return v24 & 1;
}

- (id)safari_URLByRemovingUserPasswordPathQueryAndFragment
{
  uint64_t v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  [v1 setUser:0];
  [v1 setPassword:0];
  [v1 setPath:0];
  [v1 setQuery:0];
  [v1 setFragment:0];
  int v2 = [v1 URL];
  int v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F105D3F0];
  }
  id v5 = v4;

  return v5;
}

- (uint64_t)safari_isWellKnownChangePasswordURL
{
  int v2 = objc_msgSend(a1, "safari_wellKnownChangePasswordURL");
  uint64_t v3 = [a1 isEqual:v2];

  return v3;
}

- (id)safari_wellKnownChangePasswordURL
{
  if (objc_msgSend(a1, "safari_isHTTPFamilyURL"))
  {
    id v2 = a1;
    uint64_t v3 = [v2 host];
    id v4 = objc_msgSend(v3, "safari_highLevelDomainFromHost");
    int v5 = objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", @"google.com");

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://accounts.google.com/"];

      id v2 = (id)v6;
    }
    id v7 = objc_msgSend(v2, "safari_URLByRemovingUserPasswordPathQueryAndFragment");
    id v8 = [v7 URLByAppendingPathComponent:@".well-known/change-password"];
    char v9 = objc_msgSend(v8, "safari_URLByReplacingSchemeWithString:", @"https");
  }
  else
  {
    char v9 = 0;
  }
  return v9;
}

- (NSURL)safari_URLWithUniqueFilename
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (fileExists(a1))
  {
    id v2 = [(NSURL *)a1 URLByDeletingLastPathComponent];
    uint64_t v3 = [WBSUniqueFilenameEnumerator alloc];
    id v4 = [(NSURL *)a1 lastPathComponent];
    int v5 = [(WBSUniqueFilenameEnumerator *)v3 initWithFilename:v4];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = v5;
    uint64_t v7 = [(WBSUniqueFilenameEnumerator *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *(void *)(*((void *)&v15 + 1) + 8 * v9), 0, (void)v15);
        id v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
        BOOL v11 = fileExists(v10);
        BOOL v12 = v11;
        int v13 = v11 ? v10 : 0;

        if (!v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(WBSUniqueFilenameEnumerator *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      id v10 = 0;
    }
  }
  else
  {
    id v10 = a1;
  }
  return v10;
}

- (void)safari_accessingSecurityScopedResource:()SafariCoreExtras
{
  int v5 = a3;
  int v4 = [a1 startAccessingSecurityScopedResource];
  v5[2]();
  if (v4) {
    [a1 stopAccessingSecurityScopedResource];
  }
}

@end
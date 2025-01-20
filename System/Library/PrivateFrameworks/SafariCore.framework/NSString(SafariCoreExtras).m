@interface NSString(SafariCoreExtras)
+ (id)safari_stringAsHexWithBuffer:()SafariCoreExtras length:;
+ (id)safari_stringAsHexWithData:()SafariCoreExtras;
- (BOOL)_safari_hasLocalizedPrefix:()SafariCoreExtras withOptions:;
- (BOOL)safari_allowsLooserMatchingInSearch;
- (BOOL)safari_containsInteriorWhitespace;
- (BOOL)safari_containsPeriodOrHomoglyphForPeriod;
- (BOOL)safari_hasCaseInsensitivePrefix:()SafariCoreExtras;
- (BOOL)safari_hasCaseInsensitiveSuffix:()SafariCoreExtras;
- (BOOL)safari_isCaseAndDiacriticInsensitiveEqualToString:()SafariCoreExtras;
- (BOOL)safari_isCaseInsensitiveEqualToString:()SafariCoreExtras;
- (BOOL)safari_isSubpathOfPath:()SafariCoreExtras;
- (BOOL)safari_isVersionStringBetweenVersionString:()SafariCoreExtras andVersionString:;
- (BOOL)safari_isVersionStringGreaterThanOrEqualToVersionString:()SafariCoreExtras;
- (BOOL)safari_isVersionStringGreaterThanVersionString:()SafariCoreExtras;
- (BOOL)safari_localizedCaseAndDiacriticInsensitiveContainsString:()SafariCoreExtras;
- (BOOL)safari_looksLikeEmailAddress;
- (BOOL)safari_mightContainURLScheme;
- (__CFString)safari_monogramString;
- (__CFString)safari_stringByRedactingBookmarkDAVServerID;
- (__CFString)safari_stringByRemovingTopLevelDomainFromHost;
- (__CFString)safari_stringByRepeatingWithCount:()SafariCoreExtras joinedByString:;
- (__CFString)safari_stringByTrimmingWhitespace;
- (id)_safari_stringByTruncatingToFilenameLength:()SafariCoreExtras preservePathExtension:;
- (id)safari_base64DecodedData;
- (id)safari_bestURLForUserTypedString;
- (id)safari_bundleIdentifierFromApplicationIdentifier:()SafariCoreExtras;
- (id)safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString;
- (id)safari_domainFromHost;
- (id)safari_effectiveTopLevelDomainForHost;
- (id)safari_filenameByFixingIllegalCharacters;
- (id)safari_fixedStringByExpandingTildeInPathToUserHomeDirectory;
- (id)safari_highLevelDomainForPasswordManager;
- (id)safari_highLevelDomainForUserTypedStringWhenAddingPasswordInPasswordManager;
- (id)safari_highLevelDomainFromHost;
- (id)safari_possibleTopLevelDomainCorrectionForUserTypedString;
- (id)safari_separateResourceForkPath;
- (id)safari_setOfAllSubstringsWithMinimumLength:()SafariCoreExtras;
- (id)safari_simplifiedSiteNameForCredentialLookup;
- (id)safari_simplifiedUserVisibleURLStringWithSimplifications:()SafariCoreExtras forDisplayOnly:simplifiedStringOffset:;
- (id)safari_stringByDeletingAllPathExtensions;
- (id)safari_stringByDeletingStartingSlash;
- (id)safari_stringByDeletingTrailingSlash;
- (id)safari_stringByNormalizingVersionString;
- (id)safari_stringByRemovingCharactersInSet:()SafariCoreExtras;
- (id)safari_stringByRemovingExcessWhitespace;
- (id)safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString;
- (id)safari_stringByRemovingWrappingParenthesis;
- (id)safari_stringByRemovingWrappingSingleQuotes;
- (id)safari_stringByRemovingWwwAndWildcardDotPrefixes;
- (id)safari_stringByRemovingWwwDotPrefix;
- (id)safari_stringByReplacingCharactersInSet:()SafariCoreExtras withString:;
- (id)safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:()SafariCoreExtras;
- (id)safari_substringFromPrefix:()SafariCoreExtras;
- (id)safari_suggestedFilenameFromTitleString;
- (id)safari_teamIdentifierFromApplicationIdentifier:()SafariCoreExtras;
- (id)safari_userVisibleSafariBundleVersionFromFullVersion;
- (uint64_t)_safari_looksLikeWillRedirectToURLStringAfterAuthentication:()SafariCoreExtras orHostAfterLogin:;
- (uint64_t)safari_anyComponentSeparatedByString:()SafariCoreExtras hasLocalizedCaseInsensitivePrefix:;
- (uint64_t)safari_caseAndDiacriticInsensitiveStandardRangeOfString:()SafariCoreExtras additionalOptions:;
- (uint64_t)safari_containsAllCharactersInString:()SafariCoreExtras;
- (uint64_t)safari_containsCJKCharacters;
- (uint64_t)safari_countOfString:()SafariCoreExtras;
- (uint64_t)safari_firstLocationOfPeriodOrHomoglyphForPeriod;
- (uint64_t)safari_hasLocalizedCaseAndDiacriticInsensitivePrefix:()SafariCoreExtras;
- (uint64_t)safari_hasLocalizedCaseInsensitivePrefix:()SafariCoreExtras;
- (uint64_t)safari_hasPrefix:()SafariCoreExtras;
- (uint64_t)safari_indexOfFirstAppearanceOfCharacter:()SafariCoreExtras;
- (uint64_t)safari_isHostOrSubdomainOfHost:()SafariCoreExtras;
- (uint64_t)safari_isPathExtensionAllowedForAnalytics;
- (uint64_t)safari_isPrefixOfWwwDot;
- (uint64_t)safari_localizedCompareSortingEmptyStringAndNumericPrefixToEnd:()SafariCoreExtras;
- (uint64_t)safari_looksLikeWillRedirectToHostAfterAuthentication:()SafariCoreExtras;
- (uint64_t)safari_looksLikeWillRedirectToURLStringAfterAuthentication:()SafariCoreExtras;
- (uint64_t)safari_numberOfComposedCharacters;
- (uint64_t)safari_simplifiedUserVisibleURLString;
- (uint64_t)safari_stringByReplacingHomoglyphForSpaceWithSpace;
- (uint64_t)safari_stringByTruncatingToMaximumFilenameLengthPreservingExtension;
- (uint64_t)safari_urlStringForCompletionDeduplication;
- (uint64_t)safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain;
@end

@implementation NSString(SafariCoreExtras)

+ (id)safari_stringAsHexWithBuffer:()SafariCoreExtras length:
{
  uint64_t v4 = a4;
  uint64_t v6 = 2 * a4;
  v7 = (char *)malloc_type_malloc((2 * a4) | 1, 0x3F6F056BuLL);
  v8 = v7;
  if (v4)
  {
    v9 = v7;
    do
    {
      int v10 = *a3++;
      snprintf(v9, 3uLL, "%02hhX", v10);
      v9 += 2;
      --v4;
    }
    while (v4);
  }
  v11 = (void *)[[NSString alloc] initWithBytesNoCopy:v8 length:v6 encoding:4 freeWhenDone:1];
  return v11;
}

- (id)safari_stringByNormalizingVersionString
{
  v1 = [a1 stringByReplacingOccurrencesOfString:@"+" withString:&stru_1F105D3F0];
  v2 = objc_msgSend(v1, "safari_userVisibleSafariBundleVersionFromFullVersion");

  return v2;
}

- (id)safari_userVisibleSafariBundleVersionFromFullVersion
{
  v2 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v3 = [v2 invertedSet];
  unint64_t v4 = [a1 rangeOfCharacterFromSet:v3];

  if (v4 < 4) {
    goto LABEL_2;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((unint64_t)[a1 length] < 4)
    {
LABEL_2:
      id v5 = a1;
      goto LABEL_8;
    }
    uint64_t v6 = [a1 length] - 3;
  }
  else
  {
    uint64_t v6 = v4 - 3;
  }
  id v5 = [a1 substringFromIndex:v6];
LABEL_8:
  return v5;
}

- (BOOL)safari_hasCaseInsensitivePrefix:()SafariCoreExtras
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 rangeOfString:v4 options:9] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)safari_isCaseInsensitiveEqualToString:()SafariCoreExtras
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 compare:v4 options:3] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (__CFString)safari_stringByTrimmingWhitespace
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringTrimWhitespace(v1);
  return v1;
}

- (__CFString)safari_monogramString
{
  v2 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  v3 = objc_msgSend(a1, "safari_stringByRemovingCharactersInSet:", v2);

  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  BOOL v5 = [v3 capitalizedStringWithLocale:v4];

  uint64_t v6 = objc_msgSend(v5, "safari_stringByRemovingExcessWhitespace");

  if ([v6 length])
  {
    uint64_t v7 = [v6 rangeOfComposedCharacterSequenceAtIndex:0];
    objc_msgSend(v6, "substringWithRange:", v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1F105D3F0;
  }

  return v9;
}

- (id)safari_stringByRemovingCharactersInSet:()SafariCoreExtras
{
  v3 = objc_msgSend(a1, "safari_stringByReplacingCharactersInSet:withString:", a3, &stru_1F105D3F0);
  return v3;
}

- (id)safari_stringByReplacingCharactersInSet:()SafariCoreExtras withString:
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (uint64_t v9 = [a1 rangeOfCharacterFromSet:v6 options:0], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v11 = v8;
    int v10 = (void *)[a1 mutableCopy];
    uint64_t v12 = [v10 length];
    uint64_t v13 = [v7 length];
    do
    {
      if (v13)
      {
        objc_msgSend(v10, "replaceCharactersInRange:withString:", v9, v11, v7);
        uint64_t v12 = v12 - v11 + v13;
        v9 += v13;
      }
      else
      {
        objc_msgSend(v10, "deleteCharactersInRange:", v9, v11);
        v12 -= v11;
      }
      uint64_t v9 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v6, 0, v9, v12 - v9);
      uint64_t v11 = v14;
    }
    while (v9 != 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    int v10 = (void *)[a1 copy];
  }

  return v10;
}

- (id)safari_stringByRemovingExcessWhitespace
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [a1 componentsSeparatedByCharactersInSet:v2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__NSString_SafariCoreExtras__safari_stringByRemovingExcessWhitespace__block_invoke;
  v8[3] = &unk_1E615AB60;
  id v4 = v2;
  id v9 = v4;
  BOOL v5 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v8);

  id v6 = [v5 componentsJoinedByString:@" "];

  return v6;
}

- (id)safari_effectiveTopLevelDomainForHost
{
  id v1 = [a1 dataUsingEncoding:4];
  uint64_t v2 = [v1 bytes];
  uint64_t v3 = [v1 length];
  uint64_t TopLevelDomain = _CFHostGetTopLevelDomain();
  if (TopLevelDomain) {
    BOOL v5 = (void *)[[NSString alloc] initWithBytes:TopLevelDomain length:v2 + v3 - TopLevelDomain encoding:4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (__CFString)safari_stringByRemovingTopLevelDomainFromHost
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "safari_hostDomainsEnumerator");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    id v4 = &stru_1F105D3F0;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v1, "kind", (void)v9) == 3)
        {
          [v1 clearAccumulatedDomains];
        }
        else
        {
          id v7 = v6;

          id v4 = v7;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v2);
  }
  else
  {
    id v4 = &stru_1F105D3F0;
  }

  return v4;
}

- (BOOL)safari_containsInteriorWhitespace
{
  id v1 = objc_msgSend(a1, "safari_stringByTrimmingWhitespace");
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  BOOL v3 = [v1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)safari_filenameByFixingIllegalCharacters
{
  id v1 = (void *)[a1 mutableCopy];
  __int16 v4 = 0;
  uint64_t v2 = [NSString stringWithCharacters:&v4 length:0];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", v2, &stru_1F105D3F0, 0, 0, objc_msgSend(v1, "length"));

  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"/", @"-", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @":", @"-", 0, 0, objc_msgSend(v1, "length"));
  while ([v1 hasPrefix:@"."])
    objc_msgSend(v1, "deleteCharactersInRange:", 0, 1);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\u202E", @"-", 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

- (id)_safari_stringByTruncatingToFilenameLength:()SafariCoreExtras preservePathExtension:
{
  unint64_t v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v25 = 0;
  memset(v24, 0, sizeof(v24));
  char v7 = [a1 getFileSystemRepresentation:v24 maxLength:a3];
  id v8 = a1;
  long long v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (a4)
    {
      long long v10 = [v8 stringByDeletingPathExtension];

      uint64_t v11 = [v10 length];
      if (v11 == [v9 length])
      {
        long long v12 = &stru_1F105D3F0;
      }
      else
      {
        uint64_t v13 = [v9 substringFromIndex:v11];
        long long v12 = [@"…" stringByAppendingString:v13];

        if (([(__CFString *)v12 getFileSystemRepresentation:v24 maxLength:v5 >> 1] & 1) == 0)
        {
          long long v9 = objc_msgSend(v9, "_safari_stringByTruncatingToFilenameLength:preservePathExtension:", v5, 0);
LABEL_20:

          goto LABEL_21;
        }
        v5 -= strnlen((const char *)v24, v5 >> 1);
      }
      long long v9 = v10;
    }
    else
    {
      long long v12 = &stru_1F105D3F0;
    }
    if (![(__CFString *)v12 length])
    {

      long long v12 = @"…";
      [@"…" getFileSystemRepresentation:v24 maxLength:20];
      v5 -= strnlen((const char *)v24, 0x14uLL);
    }
    unint64_t v14 = [v9 length];
    if (v14)
    {
      unint64_t v15 = 0;
      uint64_t v16 = 0;
      do
      {
        uint64_t v17 = [v9 rangeOfComposedCharacterSequenceAtIndex:(v14 + v15) >> 1];
        uint64_t v19 = v18;
        v20 = [v9 substringToIndex:v17];
        if ([v20 getFileSystemRepresentation:v24 maxLength:v5])
        {
          uint64_t v16 = v17;
          unint64_t v15 = v17 + v19;
        }
        else
        {
          unint64_t v14 = v17;
        }
      }
      while (v15 < v14);
    }
    else
    {
      uint64_t v16 = 0;
    }
    v21 = [v9 substringToIndex:v16];
    uint64_t v22 = [v21 stringByAppendingString:v12];

    long long v10 = v9;
    long long v9 = (void *)v22;
    goto LABEL_20;
  }
LABEL_21:
  return v9;
}

- (uint64_t)safari_stringByTruncatingToMaximumFilenameLengthPreservingExtension
{
  return objc_msgSend(a1, "_safari_stringByTruncatingToFilenameLength:preservePathExtension:", 255, 1);
}

- (id)safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:()SafariCoreExtras
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  LOBYTE(v9) = 0;
  if (objc_msgSend(v4, "length", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         v9,
         v10)
    && ([v4 getFileSystemRepresentation:&v8 maxLength:255] & 1) == 0)
  {
    id v6 = a1;
  }
  else
  {
    unint64_t v5 = objc_msgSend(a1, "_safari_stringByTruncatingToFilenameLength:preservePathExtension:", 255 - strnlen((const char *)&v8, 0xFFuLL), 1);
    id v6 = [v5 stringByAppendingString:v4];
  }
  return v6;
}

- (id)safari_highLevelDomainFromHost
{
  id v1 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "safari_hostDomainsEnumerator");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v12 != v4) {
        objc_enumerationMutation(v2);
      }
      id v6 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
      if (objc_msgSend(v2, "isSpeculative", (void)v11)) {
        break;
      }
      uint64_t v7 = [v2 kind];
      char v8 = v7 + 1;
      if ((unint64_t)(v7 + 1) <= 7)
      {
        if (((1 << v8) & 0xC9) != 0) {
          break;
        }
        if (((1 << v8) & 6) != 0) {
          goto LABEL_16;
        }
        if (v7 == 4)
        {
          id v1 = v6;
LABEL_16:
          id v9 = v1;
          goto LABEL_17;
        }
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        id v9 = 0;
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
  }
  id v9 = 0;
LABEL_17:

  return v9;
}

- (id)safari_base64DecodedData
{
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:a1 options:0];
  return v1;
}

+ (id)safari_stringAsHexWithData:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "safari_stringAsHexWithBuffer:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));

  return v5;
}

- (id)safari_simplifiedUserVisibleURLStringWithSimplifications:()SafariCoreExtras forDisplayOnly:simplifiedStringOffset:
{
  uint64_t v7 = (void *)[a1 copy];
  int v8 = objc_msgSend(v7, "safari_hasCaseInsensitivePrefix:", @"blob:") ^ 1;
  if ((a3 & 0x80) == 0) {
    LOBYTE(v8) = 1;
  }
  if ((v8 & 1) == 0)
  {
    id v9 = [v7 substringFromIndex:5];

    uint64_t v10 = [MEMORY[0x1E4F29088] componentsWithString:v9];
    long long v11 = [v10 user];
    if (v11)
    {
    }
    else
    {
      char v25 = [v10 password];

      if (!v25)
      {
        unint64_t v55 = 0;
        uint64_t v7 = objc_msgSend(v9, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3 & 0xFFFFFFFFFFFFFF7FLL, a4, &v55);

        if (a5) {
          *a5 = v55 + 5;
        }
        goto LABEL_23;
      }
    }
    unint64_t location = [v10 rangeOfUser];
    NSUInteger length = v27;
    v30.unint64_t location = [v10 rangeOfPassword];
    if (v30.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30.NSUInteger length = v29;
      v57.unint64_t location = location;
      v57.NSUInteger length = length;
      NSRange v31 = NSUnionRange(v57, v30);
      unint64_t location = v31.location;
      NSUInteger length = v31.length;
    }
    NSUInteger v32 = length + 1;
    v33 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", location, length + 1, &stru_1F105D3F0);

    unint64_t v55 = 0;
    uint64_t v7 = objc_msgSend(v33, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3 & 0xFFFFFFFFFFFFFF7FLL, a4, &v55);

    if (a5)
    {
      if (v55 >= location) {
        NSUInteger v34 = v32;
      }
      else {
        NSUInteger v34 = 0;
      }
      *a5 = v55 + v34 + 5;
    }
LABEL_23:

    goto LABEL_67;
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_hostAndPortRangeFromUserTypedString:", v7);
  uint64_t v14 = v13;
  int v15 = objc_msgSend(v7, "safari_hasCaseInsensitivePrefix:", @"http://");
  int v16 = objc_msgSend(v7, "safari_hasCaseInsensitivePrefix:", @"https://");
  int v17 = v16;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v18 = v15 | v16;
    if ((a3 & 0x20) != 0)
    {
      if (v18)
      {
        uint64_t v19 = objc_msgSend(a1, "rangeOfString:options:range:", @":", 4, v12, v14);
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = a1;
          uint64_t v21 = v12 + v14 - v19;
          if (objc_msgSend(v20, "rangeOfString:options:range:", @"]", 0, v19, v21) == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v22 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v19, v12 + v14 - v19, &stru_1F105D3F0);

            v14 -= v21;
            uint64_t v7 = (void *)v22;
          }
        }
      }
    }
    if ((v18 & (a3 >> 4)) == 1)
    {
      uint64_t v23 = v14 + v12;
    }
    else
    {
      if ((a3 & 4) == 0) {
        goto LABEL_26;
      }
      uint64_t v23 = v14 + v12;
      v35 = [v7 substringFromIndex:v14 + v12];
      int v36 = [v35 isEqualToString:@"/"];

      if (!v36) {
        goto LABEL_26;
      }
    }
    uint64_t v24 = [v7 substringToIndex:v23];

    uint64_t v7 = (void *)v24;
  }
LABEL_26:
  if ((v17 & (a3 >> 1)) != 0) {
    v37 = @"https://";
  }
  else {
    v37 = 0;
  }
  if (a3 & v15) {
    char v38 = 0;
  }
  else {
    char v38 = v17 & (a3 >> 1) ^ 1;
  }
  if (a3 & v15) {
    v39 = @"http://";
  }
  else {
    v39 = v37;
  }
  if ((a3 & 0x148) == 0) {
    goto LABEL_38;
  }
  if ((v15 & 1) == 0)
  {
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      char v44 = 0;
    }
    else {
      char v44 = v17;
    }
    if (v44) {
      goto LABEL_45;
    }
LABEL_38:
    if (v39) {
      goto LABEL_39;
    }
    goto LABEL_63;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_38;
  }
LABEL_45:
  v45 = objc_msgSend(v7, "substringWithRange:", v12, v14);
  v46 = v45;
  if (a3 & 8) != 0 && (objc_msgSend(v45, "safari_hasCaseInsensitivePrefix:", @"www."))
  {
    v47 = @"www.";
  }
  else if (a3 & 0x40) != 0 && (objc_msgSend(v46, "safari_hasCaseInsensitivePrefix:", @"m."))
  {
    v47 = @"m.";
  }
  else
  {
    if ((a3 & 0x100) == 0 || !objc_msgSend(v46, "safari_hasCaseInsensitivePrefix:", @"mobile.")) {
      goto LABEL_62;
    }
    v47 = @"mobile.";
  }
  v49 = objc_msgSend(v46, "safari_highLevelDomainFromHost");
  char v50 = [v46 isEqualToString:v49];

  if ((v50 & 1) == 0)
  {
    if ((v38 & 1) != 0 || v12 != [(__CFString *)v39 length])
    {
      uint64_t v51 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v12, -[__CFString length](v47, "length"), &stru_1F105D3F0);

      uint64_t v7 = (void *)v51;
    }
    else
    {
      v39 = [(__CFString *)v39 stringByAppendingString:v47];
    }
  }
LABEL_62:

  if (v39)
  {
LABEL_39:
    uint64_t v40 = [(__CFString *)v39 length];
    if (a4)
    {
      v41 = NSString;
      v42 = [v7 substringFromIndex:v40];
      uint64_t v43 = [v41 stringWithFormat:@"%C%@", 8206, v42];

      --v40;
      uint64_t v7 = (void *)v43;
    }
    else
    {
      uint64_t v48 = [v7 substringFromIndex:v40];

      uint64_t v7 = (void *)v48;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v40 = 0;
LABEL_64:
  if (a5) {
    *a5 = v40;
  }

LABEL_67:
  return v7;
}

- (uint64_t)safari_simplifiedUserVisibleURLString
{
  return objc_msgSend(a1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 1, 0);
}

- (id)safari_simplifiedSiteNameForCredentialLookup
{
  id v1 = [@"https://" stringByAppendingString:a1];
  id v2 = objc_msgSend(v1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);

  return v2;
}

- (id)safari_separateResourceForkPath
{
  id v2 = [a1 lastPathComponent];
  if ([v2 length] && (objc_msgSend(v2, "isEqualToString:", @"/") & 1) == 0)
  {
    id v4 = [a1 stringByDeletingLastPathComponent];
    uint64_t v5 = [@"._" stringByAppendingString:v2];
    uint64_t v3 = [v4 stringByAppendingPathComponent:v5];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)safari_hasPrefix:()SafariCoreExtras
{
  id v4 = a3;
  if (v4) {
    uint64_t v5 = [a1 hasPrefix:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)safari_substringFromPrefix:()SafariCoreExtras
{
  id v4 = a3;
  if ([v4 length] && objc_msgSend(a1, "hasPrefix:", v4))
  {
    uint64_t v5 = objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)safari_caseAndDiacriticInsensitiveStandardRangeOfString:()SafariCoreExtras additionalOptions:
{
  id v6 = a3;
  if ([v6 length]) {
    uint64_t v7 = [a1 rangeOfString:v6 options:a4 | 0x181];
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (uint64_t)safari_isHostOrSubdomainOfHost:()SafariCoreExtras
{
  id v4 = a3;
  if ([a1 isEqualToString:v4])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [@"." stringByAppendingString:v4];
    uint64_t v5 = [a1 hasSuffix:v6];
  }
  return v5;
}

- (BOOL)safari_isCaseAndDiacriticInsensitiveEqualToString:()SafariCoreExtras
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 compare:v4 options:131] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)safari_hasCaseInsensitiveSuffix:()SafariCoreExtras
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 rangeOfString:v4 options:13] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)safari_hasLocalizedCaseInsensitivePrefix:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_hasLocalizedPrefix:withOptions:", a3, 1);
}

- (uint64_t)safari_hasLocalizedCaseAndDiacriticInsensitivePrefix:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_hasLocalizedPrefix:withOptions:", a3, 129);
}

- (BOOL)_safari_hasLocalizedPrefix:()SafariCoreExtras withOptions:
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && (unint64_t v8 = [v6 length], v8 <= objc_msgSend(a1, "length")))
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    BOOL v9 = objc_msgSend(a1, "compare:options:range:locale:", v7, a4, 0, v8, v10) == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (uint64_t)safari_anyComponentSeparatedByString:()SafariCoreExtras hasLocalizedCaseInsensitivePrefix:
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = [a1 length];
    uint64_t v9 = 0;
    while (v8 >= [v7 length])
    {
      uint64_t v10 = [v7 length];
      long long v11 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v12 = objc_msgSend(a1, "compare:options:range:locale:", v7, 1, v9, v10, v11);

      if (!v12)
      {
        uint64_t v15 = 1;
        goto LABEL_9;
      }
      uint64_t v14 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 0, v9, v8);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v9 = v14 + v13;
      unint64_t v8 = [a1 length] - (v14 + v13);
    }
  }
  uint64_t v15 = 0;
LABEL_9:

  return v15;
}

- (BOOL)safari_localizedCaseAndDiacriticInsensitiveContainsString:()SafariCoreExtras
{
  return [a1 rangeOfString:a3 options:385] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)safari_isSubpathOfPath:()SafariCoreExtras
{
  id v4 = a3;
  if ([a1 hasPrefix:v4])
  {
    uint64_t v5 = [a1 length];
    uint64_t v6 = [v4 length];
    uint64_t v7 = v5 - v6;
    BOOL v8 = !v7
      || ([v4 hasSuffix:@"/"] & 1) != 0
      || objc_msgSend(a1, "rangeOfString:options:range:", @"/", 8, v6, v7) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)safari_containsPeriodOrHomoglyphForPeriod
{
  if (-[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::once != -1) {
    dispatch_once(&-[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::once, &__block_literal_global_6);
  }
  return [a1 rangeOfCharacterFromSet:-[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod] != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)safari_firstLocationOfPeriodOrHomoglyphForPeriod
{
  if (-[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::once != -1) {
    dispatch_once(&-[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::once, &__block_literal_global_57);
  }
  uint64_t v2 = -[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod;
  return [a1 rangeOfCharacterFromSet:v2];
}

- (uint64_t)safari_stringByReplacingHomoglyphForSpaceWithSpace
{
  if (-[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::once != -1) {
    dispatch_once(&-[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::once, &__block_literal_global_59);
  }
  uint64_t v2 = -[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::homoglyphsForSpace;
  return objc_msgSend(a1, "safari_stringByReplacingCharactersInSet:withString:", v2, @" ");
}

- (id)safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.0"];
  if ([a1 length])
  {
    uint64_t v2 = [a1 componentsSeparatedByString:@"."];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __105__NSString_SafariCoreExtras__safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString__block_invoke;
    v5[3] = &unk_1E615AB38;
    v5[4] = &v6;
    [v2 enumerateObjectsUsingBlock:v5];
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)safari_isVersionStringGreaterThanVersionString:()SafariCoreExtras
{
  return [a1 compare:a3 options:64] == 1;
}

- (BOOL)safari_isVersionStringGreaterThanOrEqualToVersionString:()SafariCoreExtras
{
  return [a1 compare:a3 options:64] != -1;
}

- (BOOL)safari_isVersionStringBetweenVersionString:()SafariCoreExtras andVersionString:
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [a1 compare:v6 options:64] != -1 && objc_msgSend(a1, "compare:options:", v7, 64) == -1;

  return v8;
}

- (uint64_t)safari_containsAllCharactersInString:()SafariCoreExtras
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([a1 length])
    {
      uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:a1];
      id v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v4];
      uint64_t v7 = [v5 isSupersetOfSet:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)safari_setOfAllSubstringsWithMinimumLength:()SafariCoreExtras
{
  unint64_t v5 = [a1 length];
  id v6 = 0;
  if (v5)
  {
    unint64_t v7 = v5;
    if (v5 >= a3)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      do
      {
        unint64_t v8 = 0;
        do
        {
          uint64_t v9 = objc_msgSend(a1, "substringWithRange:", v8, a3);
          [v6 addObject:v9];

          ++v8;
        }
        while (v8 <= v7 - a3);
        ++a3;
      }
      while (a3 <= v7);
    }
  }
  return v6;
}

- (__CFString)safari_stringByRepeatingWithCount:()SafariCoreExtras joinedByString:
{
  id v6 = a4;
  if (a3)
  {
    if (a3 == 1)
    {
      unint64_t v7 = a1;
    }
    else
    {
      uint64_t v8 = [a1 length];
      uint64_t v9 = [v6 length];
      uint64_t v10 = [v6 stringByAppendingString:a1];
      unint64_t v7 = [a1 stringByPaddingToLength:v8 * a3 + v9 * (a3 - 1) withString:v10 startingAtIndex:0];
    }
  }
  else
  {
    unint64_t v7 = &stru_1F105D3F0;
  }

  return v7;
}

- (BOOL)safari_looksLikeEmailAddress
{
  uint64_t v2 = [a1 length];
  if (v2 < 6) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v6 = [a1 rangeOfString:@"@"];
  BOOL result = 0;
  if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = objc_msgSend(a1, "rangeOfString:options:range:", @".", 4, v6 + v5, v4 - (v6 + v5));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 + v7 + 2 > v4) {
      return 0;
    }
    return v7 != v6 + 1;
  }
  return result;
}

- (BOOL)safari_mightContainURLScheme
{
  uint64_t v2 = [a1 rangeOfString:@":"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v4 = v2;
  unint64_t v5 = [a1 rangeOfString:@" "];
  return v5 == 0x7FFFFFFFFFFFFFFFLL || v4 < v5;
}

- (__CFString)safari_stringByRedactingBookmarkDAVServerID
{
  uint64_t v2 = [MEMORY[0x1E4F29088] componentsWithString:a1];
  id v3 = [v2 user];
  if (v3)
  {
  }
  else
  {
    unint64_t v4 = [v2 password];

    if (!v4)
    {
      uint64_t v8 = a1;
      goto LABEL_7;
    }
  }
  [v2 setUser:0];
  [v2 setPassword:0];
  uint64_t v5 = [v2 string];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"Nil redacted server ID";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

LABEL_7:
  return v8;
}

- (uint64_t)safari_countOfString:()SafariCoreExtras
{
  id v4 = a3;
  LODWORD(v5) = 0;
  uint64_t v6 = 0;
  unint64_t v7 = [a1 length];
  unint64_t v8 = v7;
  do
  {
    uint64_t v9 = objc_msgSend(a1, "rangeOfString:options:range:", v4, 2, v6, v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = v5;
    }
    else
    {
      unint64_t v8 = v7 - (v9 + v10);
      uint64_t v5 = (v5 + 1);
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v6 = v9 + v10;
  }
  while (v9 + v10 < v7);

  return v5;
}

- (id)safari_domainFromHost
{
  id v2 = (id)[a1 length];
  if (v2)
  {
    if (!objc_msgSend(a1, "_web_looksLikeIPAddress"))
    {
      int v3 = objc_msgSend(a1, "_web_hasCountryCodeTLD");
      unint64_t v4 = objc_msgSend(a1, "safari_countOfString:", @".");
      if (v3)
      {
        if (v4 > 2)
        {
          uint64_t v5 = objc_msgSend(a1, "rangeOfString:options:range:", @".", 4, 0, objc_msgSend(a1, "rangeOfString:options:", @".", 4));
LABEL_9:
          objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "rangeOfString:options:range:", @".", 4, 0, v5) + 1);
          id v2 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
      else if (v4 > 1)
      {
        uint64_t v5 = [a1 rangeOfString:@"." options:4];
        goto LABEL_9;
      }
    }
    id v2 = a1;
  }
LABEL_10:
  return v2;
}

- (uint64_t)safari_localizedCompareSortingEmptyStringAndNumericPrefixToEnd:()SafariCoreExtras
{
  id v4 = a3;
  if (![a1 length] || !objc_msgSend(v4, "length")) {
    goto LABEL_13;
  }
  uint64_t v5 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v6 = [a1 rangeOfCharacterFromSet:v5 options:8];

  unint64_t v7 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v8 = [v4 rangeOfCharacterFromSet:v7 options:8];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    uint64_t v9 = 1;
    goto LABEL_14;
  }
  uint64_t v10 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v11 = [a1 rangeOfCharacterFromSet:v10 options:8];

  uint64_t v12 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v13 = [v4 rangeOfCharacterFromSet:v12 options:8];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11 == 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v9 = [a1 localizedCaseInsensitiveCompare:v4];
    goto LABEL_14;
  }
LABEL_5:
  uint64_t v9 = -1;
LABEL_14:

  return v9;
}

- (id)safari_stringByRemovingWwwDotPrefix
{
  if (objc_msgSend(a1, "safari_hasCaseInsensitivePrefix:", @"www."))
  {
    id v2 = [a1 substringFromIndex:objc_msgSend(@"www.", "length")];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)safari_stringByRemovingWwwAndWildcardDotPrefixes
{
  if ([a1 hasPrefix:@"*."])
  {
    id v2 = [a1 substringFromIndex:objc_msgSend(@"*.", "length")];
    int v3 = objc_msgSend(v2, "safari_stringByRemovingWwwDotPrefix");
  }
  else
  {
    int v3 = objc_msgSend(a1, "safari_stringByRemovingWwwDotPrefix");
  }
  return v3;
}

- (id)safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  int v3 = [a1 stringByTrimmingCharactersInSet:v2];

  id v4 = (void *)[v3 mutableCopy];
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\n", &stru_1F105D3F0, 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\r", &stru_1F105D3F0, 0, 0, objc_msgSend(v4, "length"));
  if ([v4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 60)
  {
    objc_msgSend(v4, "deleteCharactersInRange:", 0, 1);
    uint64_t v5 = [@"URL:" length];
    unint64_t v6 = [v4 length];
    if (v6 >= [@"URL:" length]
      && !objc_msgSend(v4, "compare:options:range:", @"URL:", 1, 0, v5))
    {
      objc_msgSend(v4, "deleteCharactersInRange:", 0, v5);
    }
    uint64_t v7 = [v4 length];
    if (v7)
    {
      uint64_t v8 = v7 - 1;
      if ([v4 characterAtIndex:v7 - 1] == 62) {
        objc_msgSend(v4, "deleteCharactersInRange:", v8, 1);
      }
    }
  }

  return v4;
}

- (id)safari_possibleTopLevelDomainCorrectionForUserTypedString
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  {
    -[NSString(SafariCoreExtras) safari_possibleTopLevelDomainCorrectionForUserTypedString]::suffixTypoCorrectionsMap = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @".cmo", @".com", @"c.om", @".com", @".xom", @".net", @".ent", @".net", @".nte", @".org", @".ogr", @".org", @".rog", @".info", @".ifno", @".info", @".ifnp", 0);
  }
  unsigned int v2 = [a1 hasSuffix:@"."];
  uint64_t v3 = [a1 length];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)-[NSString(SafariCoreExtras) safari_possibleTopLevelDomainCorrectionForUserTypedString]::suffixTypoCorrectionsMap;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v3 - v2;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(a1, "rangeOfString:options:range:", v9, 13, 0, v6);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = v10;
          uint64_t v14 = [(id)-[NSString(SafariCoreExtras) safari_possibleTopLevelDomainCorrectionForUserTypedString]::suffixTypoCorrectionsMap objectForKeyedSubscript:v9];
          uint64_t v12 = objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v11, v13, v14);

          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_13:

  return v12;
}

- (id)safari_suggestedFilenameFromTitleString
{
  if ((unint64_t)[a1 length] > 0x64)
  {
    id v2 = [a1 substringToIndex:100];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (uint64_t)safari_looksLikeWillRedirectToURLStringAfterAuthentication:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:", a3, 0);
}

- (uint64_t)safari_looksLikeWillRedirectToHostAfterAuthentication:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:", 0, a3);
}

- (uint64_t)_safari_looksLikeWillRedirectToURLStringAfterAuthentication:()SafariCoreExtras orHostAfterLogin:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::onceToken != -1) {
    dispatch_once(&-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::onceToken, &__block_literal_global_132);
  }
  v35 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:a1];
  int v36 = v8;
  uint64_t v9 = [v8 host];
  uint64_t v10 = [v9 lowercaseString];

  if (([&unk_1F10866A8 containsObject:v10] & 1) == 0)
  {
    uint64_t v12 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern;
    v33 = v10;
    uint64_t v13 = [a1 lowercaseString];
    BOOL v32 = objc_msgSend(v12, "numberOfMatchesInString:options:range:", v13, 0, 0, objc_msgSend(a1, "length")) != 0;

    NSUInteger v34 = [v6 lowercaseString];

    uint64_t v14 = [v7 lowercaseString];
    uint64_t v15 = objc_msgSend(v14, "safari_highLevelDomainFromHost");

    long long v16 = objc_msgSend(v10, "safari_highLevelDomainFromHost");
    if ([v15 isEqualToString:v16])
    {
      long long v17 = [v8 path];
      long long v18 = [v17 lowercaseString];

      if ([v18 length]
        && objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length"))|| objc_msgSend(v18, "length")&& objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")))
      {
        goto LABEL_13;
      }
      long long v19 = [v10 stringByReplacingOccurrencesOfString:v16 withString:&stru_1F105D3F0];
      if ([v19 length]
        && objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length")))
      {

LABEL_13:
        uint64_t v11 = 1;
LABEL_26:

        id v6 = v34;
        uint64_t v10 = v33;
        goto LABEL_27;
      }
    }
    NSRange v31 = v16;
    [v8 pathComponents];
    NSRange v30 = a1;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "lowercaseString", v30);
          uint64_t v45 = 0;
          v46 = &v45;
          uint64_t v47 = 0x2020000000;
          char v48 = 0;
          uint64_t v24 = -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern;
          uint64_t v25 = [v23 length];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_2;
          v42[3] = &unk_1E615AB88;
          id v26 = v23;
          id v43 = v26;
          char v44 = &v45;
          objc_msgSend((id)v24, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v25, v42);
          LOBYTE(v24) = *((unsigned char *)v46 + 24) == 0;

          _Block_object_dispose(&v45, 8);
          if ((v24 & 1) == 0)
          {
            uint64_t v11 = 1;
            NSUInteger v27 = obj;
            goto LABEL_25;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    NSUInteger v27 = [MEMORY[0x1E4F29088] componentsWithString:v30];
    v28 = [v27 percentEncodedQueryItems];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_3;
    v38[3] = &unk_1E615ABB0;
    BOOL v41 = v32;
    id v39 = v34;
    id v40 = v15;
    uint64_t v11 = objc_msgSend(v28, "safari_containsObjectPassingTest:", v38);

LABEL_25:
    long long v16 = v31;
    goto LABEL_26;
  }
  uint64_t v11 = 1;
LABEL_27:

  return v11;
}

- (uint64_t)safari_numberOfComposedCharacters
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__NSString_SafariCoreExtras__safari_numberOfComposedCharacters__block_invoke;
  v5[3] = &unk_1E615ABD8;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)safari_bundleIdentifierFromApplicationIdentifier:()SafariCoreExtras
{
  uint64_t v3 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:a1 error:a3];
  id v4 = [v3 bundleIdentifier];

  return v4;
}

- (id)safari_teamIdentifierFromApplicationIdentifier:()SafariCoreExtras
{
  uint64_t v3 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:a1 error:a3];
  id v4 = [v3 teamIdentifier];

  return v4;
}

- (id)safari_highLevelDomainForPasswordManager
{
  objc_msgSend(a1, "safari_highLevelDomainForUserTypedStringWhenAddingPasswordInPasswordManager");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    id v2 = a1;
  }
  return v2;
}

- (id)safari_highLevelDomainForUserTypedStringWhenAddingPasswordInPasswordManager
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "safari_hostDomainsEnumerator");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        unint64_t v7 = objc_msgSend(v2, "kind", (void)v11);
        unint64_t v8 = v7;
        if (v7 <= 4 && ((1 << v7) & 0x13) != 0) {
          id v1 = v6;
        }
        if (v8 <= 4 && ((1 << v8) & 0x13) != 0)
        {
          uint64_t v9 = v1;
          goto LABEL_16;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v9 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_16:

  return v9;
}

- (id)safari_bestURLForUserTypedString
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = __Block_byref_object_copy__2;
  unint64_t v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__NSString_SafariCoreExtras__safari_bestURLForUserTypedString__block_invoke;
  v3[3] = &unk_1E615AC00;
  v3[4] = &v4;
  objc_msgSend(MEMORY[0x1E4F1CB10], "safari_enumeratePossibleURLsForUserTypedString:withBlock:", a1, v3);
  id v1 = objc_msgSend((id)v5[5], "safari_canonicalURL");
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)safari_isPrefixOfWwwDot
{
  return objc_msgSend(@"www.", "safari_hasCaseInsensitivePrefix:", a1);
}

- (BOOL)safari_allowsLooserMatchingInSearch
{
  if (![a1 length]) {
    return 0;
  }
  unint64_t v2 = 0;
  do
  {
    unsigned int v3 = [a1 characterAtIndex:v2];
    BOOL v5 = v3 > 0x24F && v3 - 880 < 0xFFFFFF90;
    if (v5) {
      break;
    }
    ++v2;
  }
  while (v2 < [a1 length]);
  return v5;
}

- (uint64_t)safari_urlStringForCompletionDeduplication
{
  return objc_msgSend(a1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 335, 0, 0);
}

- (uint64_t)safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain
{
  return objc_msgSend(a1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);
}

- (uint64_t)safari_containsCJKCharacters
{
  if (([a1 _containsIdeographicCharacters] & 1) != 0
    || ([a1 _containsHiraganaKatakanaOrBopomofo] & 1) != 0)
  {
    return 1;
  }
  return [a1 _containsKorean];
}

- (uint64_t)safari_indexOfFirstAppearanceOfCharacter:()SafariCoreExtras
{
  if (![a1 length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = 0;
  while ([a1 characterAtIndex:v5] != a3)
  {
    if (++v5 >= (unint64_t)[a1 length]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (id)safari_stringByRemovingWrappingSingleQuotes
{
  uint64_t v2 = [a1 length];
  if ([a1 characterAtIndex:0] == 39
    && [a1 characterAtIndex:v2 - 1] == 39)
  {
    objc_msgSend(a1, "substringWithRange:", 1, v2 - 2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (id)safari_stringByRemovingWrappingParenthesis
{
  uint64_t v2 = [a1 length];
  if ([a1 characterAtIndex:0] == 40
    && [a1 characterAtIndex:v2 - 1] == 41)
  {
    objc_msgSend(a1, "substringWithRange:", 1, v2 - 2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (id)safari_stringByDeletingStartingSlash
{
  if ([a1 hasPrefix:@"/"])
  {
    id v2 = [a1 substringFromIndex:1];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)safari_stringByDeletingTrailingSlash
{
  if ([a1 hasSuffix:@"/"])
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)safari_stringByDeletingAllPathExtensions
{
  id v1 = a1;
  id v2 = 0;
  do
  {
    id v3 = v2;
    id v2 = v1;

    id v1 = [v2 stringByDeletingPathExtension];
  }
  while (![v1 isEqualToString:v2]);

  return v1;
}

- (id)safari_fixedStringByExpandingTildeInPathToUserHomeDirectory
{
  id v2 = [a1 stringByExpandingTildeInPath];
  if ([a1 hasSuffix:@"/"] && (objc_msgSend(v2, "hasSuffix:", @"/") & 1) == 0)
  {
    uint64_t v3 = [v2 stringByAppendingString:@"/"];

    id v2 = (void *)v3;
  }
  return v2;
}

- (uint64_t)safari_isPathExtensionAllowedForAnalytics
{
  {
    id v1 = (void *)-[NSString(SafariCoreExtras) safari_isPathExtensionAllowedForAnalytics]::allowedMIMETypes;
  }
  else
  {
    uint64_t v5 = a1;
    id v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F10866C0];
    a1 = v5;
    -[NSString(SafariCoreExtras) safari_isPathExtensionAllowedForAnalytics]::allowedMIMETypes = (uint64_t)v1;
  }
  id v2 = [a1 lowercaseString];
  uint64_t v3 = [v1 containsObject:v2];

  return v3;
}

@end
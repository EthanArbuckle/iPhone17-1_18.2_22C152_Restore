@interface _WKApplicationManifest(SafariSharedUIExtras)
+ (id)_manifestWithInfoDictionary:()SafariSharedUIExtras withSynthesizedProperties:;
+ (id)safari_manifestWithName:()SafariSharedUIExtras URL:;
+ (uint64_t)safari_manifestWithInfoDictionary:()SafariSharedUIExtras;
- (BOOL)safari_isStandalone;
- (id)_safari_quirkedNameFrom:()SafariSharedUIExtras;
- (id)safari_applicationCategoryType;
- (id)safari_dictionaryRepresentation;
- (id)safari_enforcedStartURLPrefix;
- (id)safari_iconKind;
- (id)safari_images;
- (id)safari_name;
- (id)safari_scope;
- (id)safari_startURL;
- (uint64_t)safari_displayMode;
- (uint64_t)safari_respectsHasOpener;
- (void)safari_dictionaryRepresentation;
- (void)safari_setIconKind:()SafariSharedUIExtras;
- (void)safari_setImages:()SafariSharedUIExtras;
- (void)safari_setName:()SafariSharedUIExtras;
- (void)safari_setStartURL:()SafariSharedUIExtras;
@end

@implementation _WKApplicationManifest(SafariSharedUIExtras)

+ (id)safari_manifestWithName:()SafariSharedUIExtras URL:
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionary];
  [v8 setObject:v7 forKeyedSubscript:@"name"];

  v9 = objc_msgSend(v6, "safari_originalDataAsString");
  [v8 setObject:v9 forKeyedSubscript:@"start_url"];

  v10 = (void *)MEMORY[0x1E4F46748];
  v11 = objc_msgSend(v8, "safari_jsonRepresentation");
  v12 = [v10 applicationManifestFromJSON:v11 manifestURL:0 documentURL:v6];

  return v12;
}

+ (uint64_t)safari_manifestWithInfoDictionary:()SafariSharedUIExtras
{
  return [a1 _manifestWithInfoDictionary:a3 withSynthesizedProperties:1];
}

+ (id)_manifestWithInfoDictionary:()SafariSharedUIExtras withSynthesizedProperties:
{
  id v5 = a3;
  objc_msgSend(v5, "safari_dictionaryForKey:", @"Manifest");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"start_url"];
    v9 = (void *)[v7 mutableCopy];
    if (a4)
    {
      v10 = [v7 objectForKeyedSubscript:@"display"];
      v11 = [v10 lowercaseString];
      if ([v11 isEqualToString:@"fullscreen"])
      {
        unint64_t v12 = 3;
      }
      else if ([v11 isEqualToString:@"standalone"])
      {
        unint64_t v12 = 2;
      }
      else
      {
        unint64_t v12 = [v11 isEqualToString:@"minimal-ui"];
      }

      v13 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
      unint64_t v14 = resolvedDisplayModeForURL(v12, v13);

      if (v14 > 3) {
        v15 = 0;
      }
      else {
        v15 = off_1E5E46D90[v14 - 1];
      }
      [v9 setObject:v15 forKeyedSubscript:@"display"];
    }
  }
  else
  {
    v9 = 0;
  }

  v16 = (void *)MEMORY[0x1E4F1CB10];
  v17 = [v5 objectForKeyedSubscript:@"WKManifestURL"];
  v18 = [v16 URLWithString:v17];

  v19 = (void *)MEMORY[0x1E4F1CB10];
  v20 = [v9 objectForKeyedSubscript:@"start_url"];
  v21 = [v19 URLWithString:v20];

  if (a4 && objc_msgSend(v5, "safari_BOOLForKey:", @"WKManifestIsSynthesized")) {
    [v9 setObject:0 forKeyedSubscript:@"scope"];
  }
  v22 = (void *)MEMORY[0x1E4F46748];
  v23 = objc_msgSend(v9, "safari_jsonRepresentation");
  v24 = [v22 applicationManifestFromJSON:v23 manifestURL:v18 documentURL:v21];

  if (!v24)
  {
    v25 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[_WKApplicationManifest(SafariSharedUIExtras) _manifestWithInfoDictionary:withSynthesizedProperties:](v25);
    }
  }
  v26 = objc_msgSend(v5, "safari_stringForKey:", @"WKManifestIconKind");
  objc_msgSend(v24, "safari_setIconKind:", v26);

  return v24;
}

- (id)safari_dictionaryRepresentation
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 rawJSON];
  }
  else
  {
    v2 = 0;
  }
  v3 = [v2 dataUsingEncoding:4];
  if (!v3) {
    goto LABEL_9;
  }
  id v18 = 0;
  v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v18];
  id v5 = v18;
  id v6 = (void *)[v4 mutableCopy];

  if (v5)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(_WKApplicationManifest(SafariSharedUIExtras) *)v7 safari_dictionaryRepresentation];
    }
  }

  if (!v6)
  {
LABEL_9:
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v8 = [a1 name];
  v9 = objc_msgSend(a1, "_safari_quirkedNameFrom:", v8);
  [v6 setObject:v9 forKeyedSubscript:@"name"];

  v10 = objc_getAssociatedObject(a1, (const void *)safariNameKey);
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"short_name"];
  }
  else
  {
    v11 = [a1 shortName];
    unint64_t v12 = objc_msgSend(a1, "_safari_quirkedNameFrom:", v11);
    [v6 setObject:v12 forKeyedSubscript:@"short_name"];
  }
  v13 = objc_msgSend(a1, "safari_startURL");
  unint64_t v14 = objc_msgSend(v13, "safari_originalDataAsString");
  [v6 setObject:v14 forKeyedSubscript:@"start_url"];

  v15 = objc_msgSend(v6, "safari_dictionaryByRemovingNullObjects");
  v16 = (void *)[v15 mutableCopy];

  return v16;
}

- (uint64_t)safari_respectsHasOpener
{
  v1 = [a1 startURL];
  v2 = [v1 host];
  v3 = objc_msgSend(v2, "safari_highLevelDomainFromHost");
  int v4 = objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", @"pinterest.");

  return v4 ^ 1u;
}

- (BOOL)safari_isStandalone
{
  v2 = [a1 startURL];
  char v3 = objc_msgSend(v2, "safari_isEligibleToShowNotSecureWarning");

  return (v3 & 1) == 0 && (objc_msgSend(a1, "safari_displayMode") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)safari_applicationCategoryType
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 categories];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  char v3 = +[_WBSWKApplicationManifestExtrasUtilities applicationCategoryTypeForCategories:v2];

  return v3;
}

- (id)safari_enforcedStartURLPrefix
{
  v1 = objc_msgSend(a1, "safari_scope");
  v2 = [v1 absoluteString];

  char v3 = objc_msgSend(v2, "safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain");
  int v4 = [v3 containsString:@"/"];

  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = [v2 stringByAppendingString:@"/"];
  }
  id v6 = v5;

  return v6;
}

- (id)_safari_quirkedNameFrom:()SafariSharedUIExtras
{
  id v4 = a3;
  if ([v4 isEqualToString:@"webhp"]
    && ([a1 startURL],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain"),
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"google."),
        v6,
        v5,
        (v7 & 1) != 0)
    || ([&unk_1F0342158 containsObject:v4] & 1) != 0)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (uint64_t)safari_displayMode
{
  unint64_t v2 = [a1 displayMode];
  char v3 = objc_msgSend(a1, "safari_scope");
  uint64_t v4 = resolvedDisplayModeForURL(v2, v3);

  return v4;
}

- (id)safari_name
{
  unint64_t v2 = objc_getAssociatedObject(a1, (const void *)safariNameKey);
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [a1 shortName];
    id v5 = objc_msgSend(a1, "_safari_quirkedNameFrom:", v4);

    if ([v5 length])
    {
      id v3 = v5;
    }
    else
    {
      id v6 = [a1 name];
      char v7 = objc_msgSend(a1, "_safari_quirkedNameFrom:", v6);

      if ([v7 length]) {
        id v3 = v7;
      }
      else {
        id v3 = 0;
      }
    }
  }

  return v3;
}

- (void)safari_setName:()SafariSharedUIExtras
{
  id value = a3;
  uint64_t v4 = objc_msgSend(a1, "safari_name");
  char v5 = [value isEqualToString:v4];

  if ((v5 & 1) == 0) {
    objc_setAssociatedObject(a1, (const void *)safariNameKey, value, (void *)1);
  }
}

- (id)safari_images
{
  return objc_getAssociatedObject(a1, (const void *)safariImagesKey);
}

- (void)safari_setStartURL:()SafariSharedUIExtras
{
  id value = a3;
  uint64_t v4 = [value absoluteString];
  char v5 = objc_msgSend(a1, "safari_startURL");
  id v6 = [v5 absoluteString];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0) {
    objc_setAssociatedObject(a1, (const void *)safariStartURLKey, value, (void *)1);
  }
}

- (id)safari_startURL
{
  unint64_t v2 = objc_getAssociatedObject(a1, (const void *)safariStartURLKey);
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [a1 startURL];
  }
  char v5 = v4;

  return v5;
}

- (void)safari_setImages:()SafariSharedUIExtras
{
}

- (void)safari_setIconKind:()SafariSharedUIExtras
{
}

- (id)safari_iconKind
{
  return objc_getAssociatedObject(a1, (const void *)safariIconKindKey);
}

- (id)safari_scope
{
  if (objc_opt_respondsToSelector() & 1) != 0 && ([a1 isDefaultScope])
  {
    uint64_t v2 = objc_getAssociatedObject(a1, (const void *)safariScopeKey);
  }
  else
  {
    uint64_t v2 = [a1 scope];
  }
  id v3 = (void *)v2;
  if (!v2)
  {
    id v4 = [a1 startURL];
    char v5 = objc_msgSend(v4, "safari_originalDataAsString");
    id v6 = [v5 componentsSeparatedByString:@"/"];

    if ((unint64_t)[v6 count] <= 3) {
      uint64_t v7 = [v6 count];
    }
    else {
      uint64_t v7 = 3;
    }
    id v8 = objc_msgSend(v6, "subarrayWithRange:", 0, v7);

    v9 = [v8 componentsJoinedByString:@"/"];
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    objc_setAssociatedObject(a1, (const void *)safariScopeKey, v3, (void *)1);
  }
  return v3;
}

+ (void)_manifestWithInfoDictionary:()SafariSharedUIExtras withSynthesizedProperties:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Unable to read manifest.", v1, 2u);
}

- (void)safari_dictionaryRepresentation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Unable to serialize manifest with %{public}@", (uint8_t *)&v5, 0xCu);
}

@end
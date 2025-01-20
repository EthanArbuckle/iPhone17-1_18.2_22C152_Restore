@interface WBSPasswordManagerURL
+ (BOOL)BOOLForPasswordManagerResourceDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5;
+ (BOOL)_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:(id)a3;
+ (BOOL)_urlIsPasswordManagerURL:(id)a3 resourceSpecifierDictionary:(id)a4;
+ (BOOL)isOtpauthMigrationResourceDictionary:(id)a3;
+ (BOOL)isOtpauthResourceDictionary:(id)a3;
+ (BOOL)isPasswordManagerFamilySharingGroupSetupURL:(id)a3;
+ (BOOL)isPasswordManagerGeneratedPasswordsResourceDictionary:(id)a3;
+ (BOOL)isPasswordManagerPasskeysResourceDictionary:(id)a3;
+ (BOOL)isPasswordManagerPasswordOptionsResourceDictionary:(id)a3;
+ (BOOL)isPasswordManagerRecentlyDeletedResourceDictionary:(id)a3;
+ (BOOL)isPasswordManagerSecurityRecommendationsResourceDictionary:(id)a3;
+ (BOOL)isPasswordManagerVerificationCodesResourceDictionary:(id)a3;
+ (BOOL)isPasswordManagerVerificationCodesURL:(id)a3;
+ (BOOL)urlIsPasswordManagerURL:(id)a3;
+ (NSURL)passwordManagerSecurityRecommendationsURL;
+ (NSURL)passwordManagerURL;
+ (NSURL)passwordManagerURLForGeneratedPasswords;
+ (NSURL)passwordManagerURLForRecentlyDeleted;
+ (id)_resourceSpecifierDictionaryForURL:(id)a3;
+ (id)dictionaryWithPasswordManagerURL:(id)a3;
+ (id)passwordManagerURLForGroupWithID:(id)a3;
+ (id)passwordManagerURLWithDictionary:(id)a3;
+ (id)passwordManagerURLWithOtpauthURL:(id)a3;
+ (id)passwordManagerURLWithPrefsURL:(id)a3;
+ (id)resourceSpecifierEncodedKey:(id)a3 value:(id)a4;
+ (id)urlForDetailViewOfSavedAccount:(id)a3;
+ (id)valueForPasswordManagerResourceDictionary:(id)a3 key:(id)a4;
+ (id)valueForPasswordManagerURL:(id)a3 key:(id)a4;
@end

@implementation WBSPasswordManagerURL

+ (id)resourceSpecifierEncodedKey:(id)a3 value:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28B88];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 URLQueryAllowedCharacterSet];
  v9 = (void *)[v8 mutableCopy];

  [v9 removeCharactersInString:@"&="];
  v10 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v9];

  v11 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v9];

  v12 = [NSString stringWithFormat:@"%@=%@", v10, v11];

  return v12;
}

+ (NSURL)passwordManagerURL
{
  return (NSURL *)[a1 passwordManagerURLWithDictionary:MEMORY[0x1E4F1CC08]];
}

+ (id)passwordManagerURLWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setScheme:@"https"];
  [v4 setHost:@"passwords.apple.com"];
  [v4 setPath:@"/app"];
  if ([v3 count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4F290C8]);
          v13 = [v6 objectForKeyedSubscript:v11];
          v14 = (void *)[v12 initWithName:v11 value:v13];
          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v15 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v15 setQueryItems:v5];
    v16 = [v15 string];
    [v4 setPercentEncodedFragment:v16];

    id v3 = v19;
  }
  v17 = [v4 URL];

  return v17;
}

+ (id)passwordManagerURLWithPrefsURL:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = [a1 passwordManagerURLWithDictionary:0];
  uint64_t v7 = [v4 componentsWithURL:v6 resolvingAgainstBaseURL:0];

  uint64_t v8 = [v5 absoluteString];

  [v7 setPercentEncodedFragment:v8];
  uint64_t v9 = [v7 URL];

  return v9;
}

+ (NSURL)passwordManagerURLForRecentlyDeleted
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"recentlyDeleted";
  v7[0] = @"true";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [a1 passwordManagerURLWithDictionary:v3];

  return (NSURL *)v4;
}

+ (id)urlForDetailViewOfSavedAccount:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 stableID];

  uint64_t v8 = (void *)[v6 initWithData:v7 encoding:4];
  if (v8)
  {
    id v12 = @"showDetails";
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = [a1 passwordManagerURLWithDictionary:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)passwordManagerURLForGroupWithID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"sharingGroupID";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = [a1 passwordManagerURLWithDictionary:v6];

  return v7;
}

+ (NSURL)passwordManagerURLForGeneratedPasswords
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"generatedPasswords";
  v7[0] = @"true";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [a1 passwordManagerURLWithDictionary:v3];

  return (NSURL *)v4;
}

+ (id)passwordManagerURLWithOtpauthURL:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"path";
  v8[1] = @"url";
  v9[0] = @"OTPAUTH_URL";
  id v4 = [a3 absoluteString];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [a1 passwordManagerURLWithDictionary:v5];

  return v6;
}

+ (BOOL)_urlIsPasswordManagerURL:(id)a3 resourceSpecifierDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 scheme];
  uint64_t v9 = [v8 lowercaseString];

  if (([v9 isEqualToString:@"http"] & 1) != 0
    || [v9 isEqualToString:@"https"])
  {
    v10 = [v6 host];
    int v11 = [v10 isEqualToString:@"passwords.apple.com"];

    if (v11)
    {
      id v12 = [v6 path];
      char v13 = [v12 isEqualToString:@"/app"];

      if (v13) {
        goto LABEL_5;
      }
    }
LABEL_7:
    char v14 = 0;
    goto LABEL_8;
  }
  id v15 = [v6 scheme];
  int v16 = [v15 isEqualToString:@"prefs"];

  if (!v16) {
    goto LABEL_7;
  }
LABEL_5:
  char v14 = [a1 _resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:v7];
LABEL_8:

  return v14;
}

+ (BOOL)_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:(id)a3
{
  id v3 = objc_msgSend(a3, "safari_stringForKey:", @"root");
  BOOL v4 = ![v3 length]
    || ([v3 isEqualToString:@"PASSWORDS"] & 1) != 0
    || [v3 isEqualToString:@"ACCOUNTS_AND_PASSWORDS"];

  return v4;
}

+ (BOOL)urlIsPasswordManagerURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _resourceSpecifierDictionaryForURL:v4];
  LOBYTE(a1) = [a1 _urlIsPasswordManagerURL:v4 resourceSpecifierDictionary:v5];

  return (char)a1;
}

+ (id)_resourceSpecifierDictionaryForURL:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 scheme];
  id v5 = [v4 lowercaseString];

  if (([v5 isEqualToString:@"http"] & 1) != 0
    || (id v6 = v3, [v5 isEqualToString:@"https"]))
  {
    id v7 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    uint64_t v8 = [v7 fragment];
    uint64_t v9 = [v8 length];

    if (!v9)
    {

      id v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_30:
      v40 = v3;
      goto LABEL_31;
    }
    v10 = (void *)MEMORY[0x1E4F29088];
    int v11 = [v7 percentEncodedFragment];
    id v12 = [v10 componentsWithString:v11];

    char v13 = [v12 queryItems];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      v43 = v5;
      id v45 = v3;
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      int v16 = [v12 percentEncodedQueryItems];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            long long v22 = [v21 value];
            long long v23 = [v22 stringByRemovingPercentEncoding];
            v24 = [v21 name];
            [v15 setObject:v23 forKeyedSubscript:v24];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v18);
      }

      id v5 = v43;
      id v3 = v45;
      goto LABEL_29;
    }
    uint64_t v25 = [v12 scheme];
    int v26 = [v25 isEqualToString:@"prefs"];

    if (!v26)
    {
      id v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_29:

      goto LABEL_30;
    }
    v27 = [v12 URL];
    v28 = v27;
    id v6 = v3;
    if (v27)
    {
      id v6 = v27;
    }
  }
  v44 = v5;
  id v46 = v3;
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  id v42 = v6;
  v29 = [v6 resourceSpecifier];
  v30 = [v29 componentsSeparatedByString:@"&"];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = [*(id *)(*((void *)&v47 + 1) + 8 * j) componentsSeparatedByString:@"="];
        if ([v36 count] == 2)
        {
          v37 = [v36 objectAtIndexedSubscript:0];
          v38 = [v36 objectAtIndexedSubscript:1];
          v39 = [v38 stringByRemovingPercentEncoding];

          [v15 setObject:v39 forKeyedSubscript:v37];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v33);
  }

  id v5 = v44;
  id v3 = v46;
  v40 = v42;
LABEL_31:

  return v15;
}

+ (id)dictionaryWithPasswordManagerURL:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _resourceSpecifierDictionaryForURL:v4];
  LODWORD(a1) = [a1 _urlIsPasswordManagerURL:v4 resourceSpecifierDictionary:v5];

  if (a1)
  {
    id v6 = (void *)[v5 mutableCopy];
    v9[0] = @"root";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 removeObjectsForKeys:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)valueForPasswordManagerURL:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = [a1 dictionaryWithPasswordManagerURL:a3];
  uint64_t v8 = objc_msgSend(v7, "safari_stringForKey:", v6);

  return v8;
}

+ (id)valueForPasswordManagerResourceDictionary:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:v6])
  {
    uint64_t v8 = objc_msgSend(v6, "safari_stringForKey:", v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)BOOLForPasswordManagerResourceDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  int v5 = a5;
  id v6 = [a1 valueForPasswordManagerResourceDictionary:a3 key:a4];
  if (v6)
  {
    if ([@"true" isEqualToString:v6]) {
      LOBYTE(v5) = 1;
    }
    else {
      v5 &= ~[@"false" isEqualToString:v6];
    }
  }

  return v5;
}

+ (BOOL)isPasswordManagerPasswordOptionsResourceDictionary:(id)a3
{
  id v4 = a3;
  if ([a1 _resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:v4])
  {
    int v5 = objc_msgSend(v4, "safari_stringForKey:", @"path");
    char v6 = [v5 isEqualToString:@"PASSWORD_OPTIONS"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (NSURL)passwordManagerSecurityRecommendationsURL
{
  v7[1] = *MEMORY[0x1E4F143B8];
  char v6 = @"path";
  v7[0] = @"SECURITY_RECOMMENDATIONS";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [a1 passwordManagerURLWithDictionary:v3];

  return (NSURL *)v4;
}

+ (BOOL)isPasswordManagerSecurityRecommendationsResourceDictionary:(id)a3
{
  id v4 = a3;
  if ([a1 _resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:v4])
  {
    int v5 = objc_msgSend(v4, "safari_stringForKey:", @"path");
    char v6 = [v5 isEqualToString:@"SECURITY_RECOMMENDATIONS"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isOtpauthResourceDictionary:(id)a3
{
  id v4 = a3;
  if ([a1 _resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:v4])
  {
    int v5 = objc_msgSend(v4, "safari_stringForKey:", @"path");
    char v6 = [v5 isEqualToString:@"OTPAUTH_URL"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isOtpauthMigrationResourceDictionary:(id)a3
{
  id v4 = a3;
  if ([a1 _resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:v4])
  {
    int v5 = objc_msgSend(v4, "safari_stringForKey:", @"path");
    char v6 = [v5 isEqualToString:@"OTPAUTH_MIGRATION_URL"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isPasswordManagerRecentlyDeletedResourceDictionary:(id)a3
{
  return [a1 BOOLForPasswordManagerResourceDictionary:a3 key:@"recentlyDeleted" defaultValue:0];
}

+ (BOOL)isPasswordManagerVerificationCodesURL:(id)a3
{
  id v3 = [a1 dictionaryWithPasswordManagerURL:a3];
  id v4 = objc_msgSend(v3, "safari_stringForKey:", @"path");
  char v5 = [v4 isEqualToString:@"VERIFICATION_CODES"];

  return v5;
}

+ (BOOL)isPasswordManagerVerificationCodesResourceDictionary:(id)a3
{
  id v4 = a3;
  if ([a1 _resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:v4])
  {
    char v5 = objc_msgSend(v4, "safari_stringForKey:", @"path");
    char v6 = [v5 isEqualToString:@"VERIFICATION_CODES"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isPasswordManagerPasskeysResourceDictionary:(id)a3
{
  id v3 = objc_msgSend(a3, "safari_stringForKey:", @"path");
  char v4 = [v3 isEqualToString:@"PASSKEYS"];

  return v4;
}

+ (BOOL)isPasswordManagerFamilySharingGroupSetupURL:(id)a3
{
  id v3 = a1;
  char v4 = [a1 dictionaryWithPasswordManagerURL:a3];
  LOBYTE(v3) = [v3 BOOLForPasswordManagerResourceDictionary:v4 key:@"familySharingGroupSetup" defaultValue:0];

  return (char)v3;
}

+ (BOOL)isPasswordManagerGeneratedPasswordsResourceDictionary:(id)a3
{
  return [a1 BOOLForPasswordManagerResourceDictionary:a3 key:@"generatedPasswords" defaultValue:0];
}

@end
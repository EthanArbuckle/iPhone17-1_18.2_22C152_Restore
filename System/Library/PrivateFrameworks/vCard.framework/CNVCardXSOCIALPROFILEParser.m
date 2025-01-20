@interface CNVCardXSOCIALPROFILEParser
+ (BOOL)propertyLooksLikeDOSAttackString:(id)a3;
+ (id)adjust:(id)a3 withParameters:(id)a4;
+ (id)os_log;
+ (id)parametersForSocialProperty:(id)a3;
+ (id)profileFromURL:(id)a3;
+ (id)rawForSocialProperty:(id)a3;
+ (id)typeForSocialProperty:(id)a3;
+ (id)unfold:(id)a3;
+ (id)unwrapDoubleQuotedProperty:(id)a3;
+ (id)urlSuffixForSocialProperty:(id)a3;
+ (id)valueWithParser:(id)a3;
+ (void)handleBundleIndentifiersAsList:(id)a3 socialProfile:(id)a4;
+ (void)handleSpecialCaseUpdateForService:(id)a3 socialProfile:(id)a4;
+ (void)processExtensionValuesForLines:(id)a3 parser:(id)a4;
@end

@implementation CNVCardXSOCIALPROFILEParser

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1) {
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_4);
  }
  v2 = (void *)os_log_cn_once_object_1_0;
  return v2;
}

uint64_t __37__CNVCardXSOCIALPROFILEParser_os_log__block_invoke()
{
  os_log_cn_once_object_1_0 = (uint64_t)os_log_create("com.apple.contacts.vcard", "socialprofile");
  return MEMORY[0x1F41817F8]();
}

+ (id)valueWithParser:(id)a3
{
  v4 = [a3 unparsedStringForCurrentProperty];
  v5 = [a1 unfold:v4];
  if ([a1 propertyLooksLikeDOSAttackString:v5])
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v7 = [a1 typeForSocialProperty:v5];
    v8 = [v7 first];
    v9 = [a1 urlSuffixForSocialProperty:v8];

    v10 = [v9 second];
    v11 = [a1 profileFromURL:v10];

    v12 = [v9 first];
    v13 = [a1 parametersForSocialProperty:v12];

    v6 = [a1 adjust:v11 withParameters:v13];
    v14 = [v7 second];
    [a1 handleSpecialCaseUpdateForService:v14 socialProfile:v11];
  }
  return v6;
}

+ (id)profileFromURL:(id)a3
{
  v3 = [MEMORY[0x1E4F5A500] parseSocialProfileURL:a3];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [v3 urlString];
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v5, @"urlString");

  v6 = [v3 username];
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v6, @"username");

  v7 = [v3 userIdentifier];
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v7, @"userIdentifier");

  v8 = [v3 service];
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v8, @"service");

  v9 = [v3 displayName];
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v9, @"displayname");

  return v4;
}

+ (void)processExtensionValuesForLines:(id)a3 parser:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v20 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v22;
    uint64_t v7 = *MEMORY[0x1E4F5A298];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = [v9 grouping];
        v11 = [v6 firstValueForKey:@"X-USERID" inExtensionGroup:v10];

        v12 = [v9 grouping];
        v13 = [v6 firstValueForKey:@"X-USER" inExtensionGroup:v12];

        v14 = [v9 grouping];
        v15 = [v6 firstValueForKey:@"X-DISPLAYNAME" inExtensionGroup:v14];

        if (!(*(unsigned int (**)(uint64_t, void *))(v7 + 16))(v7, v11)
          || !(*(unsigned int (**)(uint64_t, void *))(v7 + 16))(v7, v13)
          || ((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v15) & 1) == 0)
        {
          v16 = [v9 value];
          v17 = (void *)[v16 mutableCopy];

          objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v11, @"userIdentifier");
          objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v13, @"username");
          objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v15, @"displayname");
          [v9 setValue:v17];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v20);
  }
}

+ (id)urlSuffixForSocialProperty:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(X-SOCIALPROFILE[;:].*?)[:]*(http[s]*:.*?)$",
    17,
  v4 = &v24);
  id v5 = v24;
  id v6 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  uint64_t v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      v12 = [MEMORY[0x1E4F5A490] pairWithFirst:v3 second:0];
      goto LABEL_6;
    }
    *(_DWORD *)buf = 138412546;
    id v26 = v3;
    __int16 v27 = 2114;
    id v28 = v5;
    v9 = "Error: could not extract url suffix from %@: error %{public}@";
    v10 = v8;
    uint32_t v11 = 22;
LABEL_4:
    _os_log_impl(&dword_1DC18F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    goto LABEL_5;
  }
  if ([v6 count]) {
    goto LABEL_10;
  }
  id v23 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(X-SOCIALPROFILE[;:].*?)[:]*(x-apple:.*?)$",
    17,
  uint64_t v20 = &v23);
  id v5 = v23;
  long long v21 = objc_msgSend(v20, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

  if (v5)
  {
    long long v22 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v3;
      __int16 v27 = 2114;
      id v28 = v5;
      _os_log_impl(&dword_1DC18F000, v22, OS_LOG_TYPE_DEFAULT, "Error: could not extract url suffix from %@: error %{public}@", buf, 0x16u);
    }

    goto LABEL_16;
  }
  if (![v21 count])
  {
LABEL_16:
    v12 = [MEMORY[0x1E4F5A490] pairWithFirst:v3 second:0];

    uint64_t v7 = v21;
    goto LABEL_6;
  }

  uint64_t v7 = v21;
LABEL_10:
  id v5 = [v7 objectAtIndexedSubscript:0];
  if ([v5 numberOfRanges] != 3)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    id v26 = v3;
    v9 = "Error: could not extract url from %@: too few matched ranges";
    v10 = v8;
    uint32_t v11 = 12;
    goto LABEL_4;
  }
  uint64_t v14 = [v5 rangeAtIndex:1];
  v16 = objc_msgSend(v3, "substringWithRange:", v14, v15);
  uint64_t v17 = [v5 rangeAtIndex:2];
  uint64_t v19 = objc_msgSend(v3, "substringWithRange:", v17, v18);
  v12 = [MEMORY[0x1E4F5A490] pairWithFirst:v16 second:v19];

LABEL_6:
  return v12;
}

+ (id)typeForSocialProperty:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(X-SOCIALPROFILE[;:].*?)type=(\\w+)[:;](.*$)",
    17,
  v4 = &v23);
  id v5 = v23;
  id v6 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  uint64_t v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v3;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl(&dword_1DC18F000, v8, OS_LOG_TYPE_DEFAULT, "Error: could not extract type from %@: error %{public}@", buf, 0x16u);
    }

    goto LABEL_5;
  }
  if (![v6 count])
  {
LABEL_5:
    v9 = [MEMORY[0x1E4F5A490] pairWithFirst:v3 second:0];
    goto LABEL_13;
  }
  v10 = [v7 objectAtIndexedSubscript:0];
  if ([v10 numberOfRanges] == 4)
  {
    uint64_t v11 = [v10 rangeAtIndex:1];
    v13 = objc_msgSend(v3, "substringWithRange:", v11, v12);
    uint64_t v14 = [v10 rangeAtIndex:2];
    v16 = objc_msgSend(v3, "substringWithRange:", v14, v15);
    uint64_t v17 = [v10 rangeAtIndex:3];
    uint64_t v19 = objc_msgSend(v3, "substringWithRange:", v17, v18);
    uint64_t v20 = [v13 stringByAppendingString:v19];
    v9 = [MEMORY[0x1E4F5A490] pairWithFirst:v20 second:v16];
  }
  else
  {
    long long v21 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_1DC18F000, v21, OS_LOG_TYPE_DEFAULT, "Error: could not extract type from %@: too few matched ranges", buf, 0xCu);
    }

    v9 = [MEMORY[0x1E4F5A490] pairWithFirst:v3 second:0];
  }

LABEL_13:
  return v9;
}

+ (void)handleSpecialCaseUpdateForService:(id)a3 socialProfile:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    id v6 = [v5 objectForKeyedSubscript:@"service"];

    if (v6)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:@"service"];
      if ((CNSocialProfileIsStandardServiceName() & 1) == 0) {
        [v5 setObject:v8 forKeyedSubscript:@"service"];
      }
    }
    else
    {
      [v5 setObject:v8 forKeyedSubscript:@"service"];
    }
  }
}

+ (void)handleBundleIndentifiersAsList:(id)a3 socialProfile:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = [a3 componentsSeparatedByString:@","];
    [v5 setObject:v6 forKeyedSubscript:@"bundleIdentifiers"];
  }
}

+ (id)adjust:(id)a3 withParameters:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"RAW"];
  if (v8)
  {
    v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1DC18F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: falling back to extracting social profile from %@", (uint8_t *)&v17, 0xCu);
    }

    v10 = [a1 profileFromURL:v8];
    [v6 addEntriesFromDictionary:v10];
  }
  uint64_t v11 = [v7 objectForKeyedSubscript:@"X-USER"];
  if (v11) {
    [v6 setObject:v11 forKeyedSubscript:@"username"];
  }
  uint64_t v12 = [v7 objectForKeyedSubscript:@"X-DISPLAYNAME"];
  if (v12) {
    [v6 setObject:v12 forKeyedSubscript:@"displayname"];
  }
  v13 = [v7 objectForKeyedSubscript:@"X-USERID"];
  if (v13) {
    [v6 setObject:v13 forKeyedSubscript:@"userIdentifier"];
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"X-BUNDLEIDENTIFIERS"];
  [a1 handleBundleIndentifiersAsList:v14 socialProfile:v6];
  uint64_t v15 = [v7 objectForKeyedSubscript:@"X-TEAMIDENTIFIER"];
  if (v15) {
    [v6 setObject:v15 forKeyedSubscript:@"teamIdentifier"];
  }

  return v6;
}

+ (id)parametersForSocialProperty:(id)a3
{
  id v4 = a3;
  id v28 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(X-SOCIALPROFILE[;:].*)(x-\\w+)=(.*?)[;]*$",
    17,
  id v5 = &v28);
  id v6 = v28;
  id v7 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  id v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:]();
    }

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    goto LABEL_5;
  }
  if (![v7 count])
  {
    uint64_t v10 = [a1 rawForSocialProperty:v4];
LABEL_5:
    id v11 = (id)v10;
    goto LABEL_14;
  }
  uint64_t v12 = [v8 objectAtIndexedSubscript:0];
  if ([v12 numberOfRanges] == 4)
  {
    uint64_t v13 = [v12 rangeAtIndex:1];
    id v27 = objc_msgSend(v4, "substringWithRange:", v13, v14);
    id v25 = [a1 parametersForSocialProperty:v27];
    uint64_t v15 = [v12 rangeAtIndex:2];
    __int16 v26 = objc_msgSend(v4, "substringWithRange:", v15, v16);
    int v17 = [v26 uppercaseString];
    uint64_t v18 = [v12 rangeAtIndex:3];
    uint64_t v20 = objc_msgSend(v4, "substringWithRange:", v18, v19);
    long long v21 = [a1 unwrapDoubleQuotedProperty:v20];
    long long v22 = +[CNVCardParameterDecoder decodeParameterValue:v21];
    [v25 setObject:v22 forKeyedSubscript:v17];
    id v11 = v25;
  }
  else
  {
    id v23 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:]((uint64_t)v4, v23);
    }

    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  }

LABEL_14:
  return v11;
}

+ (id)rawForSocialProperty:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v21 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(X-SOCIALPROFILE[;:])(.*?)[;]*$",
    17,
  id v6 = &v21);
  id v7 = v21;
  id v8 = objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v9 = v8;
  if (v7)
  {
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:]();
    }

    goto LABEL_5;
  }
  if (![v8 count])
  {
LABEL_5:
    id v11 = v5;
    goto LABEL_15;
  }
  uint64_t v12 = [v9 objectAtIndexedSubscript:0];
  if ([v12 numberOfRanges] == 3)
  {
    uint64_t v13 = [v12 rangeAtIndex:2];
    uint64_t v15 = objc_msgSend(v4, "substringWithRange:", v13, v14);
    if ([v15 length])
    {
      uint64_t v16 = [a1 unwrapDoubleQuotedProperty:v15];
      [v5 setObject:v16 forKeyedSubscript:@"RAW"];
    }
    id v17 = v5;
  }
  else
  {
    uint64_t v18 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:]((uint64_t)v4, v18);
    }

    id v19 = v5;
  }

LABEL_15:
  return v5;
}

+ (id)unwrapDoubleQuotedProperty:(id)a3
{
  id v3 = (__CFString *)a3;
  if (([(__CFString *)v3 isEqualToString:@"\""] & 1) != 0
    || ([(__CFString *)v3 isEqualToString:@"\"\""] & 1) != 0)
  {
    id v4 = &stru_1F362EAE0;
LABEL_4:

    id v3 = v4;
    goto LABEL_5;
  }
  if ([(__CFString *)v3 hasPrefix:@"\""]
    && [(__CFString *)v3 hasSuffix:@"\""])
  {
    -[__CFString substringWithRange:](v3, "substringWithRange:", 1, [(__CFString *)v3 length] - 2);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_5:
  return v3;
}

+ (id)unfold:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@"\r\n " withString:&stru_1F362EAE0];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"\r\nt" withString:&stru_1F362EAE0];

  return v4;
}

+ (BOOL)propertyLooksLikeDOSAttackString:(id)a3
{
  return (unint64_t)[a3 length] > 0x1046;
}

+ (void)parametersForSocialProperty:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC18F000, a2, OS_LOG_TYPE_ERROR, "Error: could not extract parameters from %@: too few matched ranges", (uint8_t *)&v2, 0xCu);
}

+ (void)parametersForSocialProperty:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1DC18F000, v0, v1, "Error: could not extract parameters from %@: error %@");
}

@end
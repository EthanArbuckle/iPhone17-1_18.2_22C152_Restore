@interface WBSWebExtensionLocalization
+ (BOOL)supportsSecureCoding;
- (WBSWebExtensionLocalization)initWithBundleURL:(id)a3 defaultLocale:(id)a4 uniqueIdentifier:(id)a5 extensionIdentifier:(id)a6;
- (WBSWebExtensionLocalization)initWithCoder:(id)a3;
- (WBSWebExtensionLocalization)initWithRegionalLocalization:(id)a3 languageLocalization:(id)a4 defaultLocalization:(id)a5 withBestLocale:(id)a6 uniqueIdentifier:(id)a7;
- (id)_localizedArrayForArray:(id)a3;
- (id)_predefinedMessagesForLocale:(id)a3;
- (id)_stringByReplacingNamedPlaceholdersInString:(id)a3 withNamedPlaceholders:(id)a4;
- (id)_stringByReplacingPositionalPlaceholdersInString:(id)a3 withValues:(id)a4;
- (id)localizedDictionaryForDictionary:(id)a3;
- (id)localizedStringForKey:(id)a3 withPlaceholders:(id)a4;
- (id)localizedStringForString:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSWebExtensionLocalization

- (WBSWebExtensionLocalization)initWithBundleURL:(id)a3 defaultLocale:(id)a4 uniqueIdentifier:(id)a5 extensionIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  if ([v11 length])
  {
    v39 = self;
    v14 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v15 = [v14 languageCode];
    v38 = v14;
    v37 = [v14 countryCode];
    uint64_t v16 = [NSString stringWithFormat:@"%@_%@", v15, v37];
    v17 = [NSString stringWithFormat:@"_locales/%@/messages.json", v11];
    uint64_t v18 = [v10 URLByAppendingPathComponent:v17];

    v19 = [NSString stringWithFormat:@"_locales/%@/messages.json", v15];
    v42 = [v10 URLByAppendingPathComponent:v19];

    v40 = (void *)v16;
    v20 = [NSString stringWithFormat:@"_locales/%@/messages.json", v16];
    v21 = [v10 URLByAppendingPathComponent:v20];

    v36 = (void *)v18;
    v22 = localizationDictionaryAtURL(v18);
    id v41 = v12;
    if (v22)
    {
      id v23 = v11;
    }
    else
    {
      v27 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:]();
      }
      id v23 = 0;
    }
    v28 = localizationDictionaryAtURL((uint64_t)v42);
    if (v28)
    {
      id v29 = v15;

      id v23 = v29;
    }
    else
    {
      v30 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:]();
      }
    }
    v31 = localizationDictionaryAtURL((uint64_t)v21);
    if (v31)
    {
      id v32 = v11;

      id v23 = v32;
    }
    else
    {
      v33 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:]();
      }
    }
    v34 = [(WBSWebExtensionLocalization *)v39 initWithRegionalLocalization:v31 languageLocalization:v28 defaultLocalization:v22 withBestLocale:v23 uniqueIdentifier:v13];

    v26 = v34;
    id v12 = v41;
  }
  else
  {
    v24 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:]((uint64_t)v12, v24);
    }
    v25 = [(WBSWebExtensionLocalization *)self initWithRegionalLocalization:0 languageLocalization:0 defaultLocalization:0 withBestLocale:0 uniqueIdentifier:v13];

    v26 = v25;
  }

  return v26;
}

- (WBSWebExtensionLocalization)initWithRegionalLocalization:(id)a3 languageLocalization:(id)a4 defaultLocalization:(id)a5 withBestLocale:(id)a6 uniqueIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSWebExtensionLocalization;
  v17 = [(WBSWebExtensionLocalization *)&v30 init];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v15];
    locale = v17->_locale;
    v17->_locale = (NSLocale *)v18;

    objc_storeStrong((id *)&v17->_localeString, a6);
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a7);
    v20 = [(WBSWebExtensionLocalization *)v17 _predefinedMessagesForLocale:v17->_locale];
    v21 = objc_msgSend(v12, "safari_dictionaryWithLowercaseKeys");
    v22 = objc_msgSend(v20, "safari_dictionaryByMergingWithDictionary:", v21);

    id v23 = objc_msgSend(v13, "safari_dictionaryWithLowercaseKeys");
    v24 = objc_msgSend(v22, "safari_dictionaryByMergingWithDictionary:", v23);

    v25 = objc_msgSend(v14, "safari_dictionaryWithLowercaseKeys");
    uint64_t v26 = objc_msgSend(v24, "safari_dictionaryByMergingWithDictionary:", v25);

    localizationDictionary = v17->_localizationDictionary;
    v17->_localizationDictionary = (NSDictionary *)v26;

    v28 = v17;
  }

  return v17;
}

- (id)localizedDictionaryForDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->_localizationDictionary)
  {
    id v17 = v4;
    id v6 = (id)[v4 mutableCopy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = [v6 allKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v6 objectForKeyedSubscript:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [(WBSWebExtensionLocalization *)self localizedStringForString:v13];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = [(WBSWebExtensionLocalization *)self _localizedArrayForArray:v13];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_14;
            }
            uint64_t v14 = [(WBSWebExtensionLocalization *)self localizedDictionaryForDictionary:v13];
          }
        }
        id v15 = (void *)v14;
        [v6 setObject:v14 forKeyedSubscript:v12];

LABEL_14:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v9)
      {
LABEL_16:

        v5 = v17;
        goto LABEL_18;
      }
    }
  }
  id v6 = v4;
LABEL_18:

  return v6;
}

- (id)localizedStringForKey:(id)a3 withPlaceholders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] <= 9)
  {
    localizationDictionary = self->_localizationDictionary;
    uint64_t v10 = [v6 lowercaseString];
    id v11 = [(NSDictionary *)localizationDictionary safari_dictionaryForKey:v10];

    objc_msgSend(v11, "safari_stringForKey:", @"message");
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(__CFString *)v12 length])
    {
      id v13 = objc_msgSend(v11, "safari_dictionaryForKey:", @"placeholders");
      uint64_t v14 = objc_msgSend(v13, "safari_dictionaryWithLowercaseKeys");

      id v15 = [(WBSWebExtensionLocalization *)self _stringByReplacingNamedPlaceholdersInString:v12 withNamedPlaceholders:v14];

      id v16 = [(WBSWebExtensionLocalization *)self _stringByReplacingPositionalPlaceholdersInString:v15 withValues:v7];

      id v17 = [v16 stringByReplacingOccurrencesOfString:@"$$" withString:@"$"];

      uint64_t v12 = v17;
      uint64_t v8 = v12;
    }
    else
    {
      uint64_t v8 = &stru_1F031A860;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_localizedArrayForArray:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__WBSWebExtensionLocalization__localizedArrayForArray___block_invoke;
  v5[3] = &unk_1E5E467C0;
  v5[4] = self;
  v3 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v5);
  return v3;
}

id __55__WBSWebExtensionLocalization__localizedArrayForArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [*(id *)(a1 + 32) localizedStringForString:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [*(id *)(a1 + 32) _localizedArrayForArray:v3];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [*(id *)(a1 + 32) localizedDictionaryForDictionary:v3];
      }
      else
      {
        id v4 = v3;
      }
    }
  }
  v5 = v4;

  return v5;
}

- (id)localizedStringForString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"__MSG_([A-Za-z0-9_@]+)__" options:0 error:0];
  uint64_t v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  id v7 = v4;
  if (v6)
  {
    uint64_t v8 = (void *)v6;
    uint64_t v9 = v4;
    do
    {
      uint64_t v10 = [v8 rangeAtIndex:1];
      uint64_t v12 = objc_msgSend(v9, "substringWithRange:", v10, v11);
      id v13 = [(WBSWebExtensionLocalization *)self localizedStringForKey:v12 withPlaceholders:0];
      uint64_t v14 = [v8 range];
      id v16 = objc_msgSend(v9, "substringWithRange:", v14, v15);
      id v7 = [v9 stringByReplacingOccurrencesOfString:v16 withString:v13];

      uint64_t v17 = objc_msgSend(v5, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));

      uint64_t v9 = v7;
      uint64_t v8 = (void *)v17;
    }
    while (v17);
  }

  return v7;
}

- (id)_predefinedMessagesForLocale:(id)a3
{
  v48[6] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F42678];
  v5 = [(NSLocale *)self->_locale languageCode];
  uint64_t v6 = [v4 defaultWritingDirectionForLanguage:v5];

  if (v6)
  {
    v33[0] = @"@@ui_locale";
    localeString = &stru_1F031A860;
    if (self->_localeString) {
      localeString = (__CFString *)self->_localeString;
    }
    v31 = @"message";
    id v32 = localeString;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v34[0] = v8;
    v33[1] = @"@@extension_id";
    id v29 = @"message";
    uint64_t v9 = [(NSUUID *)self->_uniqueIdentifier UUIDString];
    objc_super v30 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v34[1] = v10;
    v33[2] = @"@@bidi_dir";
    v27 = @"message";
    v28 = @"rtl";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v34[2] = v11;
    v33[3] = @"@@bidi_reversed_dir";
    v25 = @"message";
    uint64_t v26 = @"ltr";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v34[3] = v12;
    v33[4] = @"@@bidi_start_edge";
    uint64_t v23 = @"message";
    v24 = @"right";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v34[4] = v13;
    v33[5] = @"@@bidi_end_edge";
    long long v21 = @"message";
    v22 = @"left";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v34[5] = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = v34;
    uint64_t v17 = v33;
  }
  else
  {
    v47[0] = @"@@ui_locale";
    long long v18 = &stru_1F031A860;
    if (self->_localeString) {
      long long v18 = (__CFString *)self->_localeString;
    }
    v45 = @"message";
    v46 = v18;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v48[0] = v8;
    v47[1] = @"@@extension_id";
    v43 = @"message";
    uint64_t v9 = [(NSUUID *)self->_uniqueIdentifier UUIDString];
    v44 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v48[1] = v10;
    v47[2] = @"@@bidi_dir";
    id v41 = @"message";
    v42 = @"ltr";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v48[2] = v11;
    v47[3] = @"@@bidi_reversed_dir";
    v39 = @"message";
    v40 = @"rtl";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v48[3] = v12;
    v47[4] = @"@@bidi_start_edge";
    v37 = @"message";
    v38 = @"left";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v48[4] = v13;
    v47[5] = @"@@bidi_end_edge";
    v35 = @"message";
    v36 = @"right";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v48[5] = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = v48;
    uint64_t v17 = v47;
  }
  long long v19 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:6];

  return v19;
}

- (id)_stringByReplacingNamedPlaceholdersInString:(id)a3 withNamedPlaceholders:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:[^$]|^)(\\$([A-Za-z0-9_@]+)\\$)" options:0 error:0];
  uint64_t v8 = objc_msgSend(v7, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    do
    {
      uint64_t v10 = [v9 rangeAtIndex:2];
      uint64_t v12 = objc_msgSend(v5, "substringWithRange:", v10, v11);
      id v13 = [v12 lowercaseString];

      uint64_t v14 = objc_msgSend(v6, "safari_dictionaryForKey:", v13);
      uint64_t v15 = objc_msgSend(v14, "safari_stringForKey:", @"content");
      id v16 = (void *)v15;
      if (v15) {
        uint64_t v17 = (__CFString *)v15;
      }
      else {
        uint64_t v17 = &stru_1F031A860;
      }
      long long v18 = v17;

      uint64_t v19 = [v9 rangeAtIndex:1];
      long long v21 = objc_msgSend(v5, "substringWithRange:", v19, v20);
      v22 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v21, v18, 1, 0, objc_msgSend(v5, "length"));

      uint64_t v23 = objc_msgSend(v7, "firstMatchInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length"));

      id v5 = v22;
      uint64_t v9 = (void *)v23;
    }
    while (v23);
  }
  else
  {
    v22 = v5;
  }

  return v22;
}

- (id)_stringByReplacingPositionalPlaceholdersInString:(id)a3 withValues:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  uint64_t v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:[^$]|^)(\\$([0-9]))" options:0 error:0];
  uint64_t v9 = objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    do
    {
      uint64_t v11 = [v10 rangeAtIndex:2];
      id v13 = objc_msgSend(v5, "substringWithRange:", v11, v12);
      uint64_t v14 = [v13 integerValue];

      BOOL v15 = v14 >= 1 && v14 <= v7;
      id v16 = &stru_1F031A860;
      if (v15)
      {
        id v16 = [v6 objectAtIndexedSubscript:v14 - 1];
      }
      uint64_t v17 = [v10 rangeAtIndex:1];
      uint64_t v19 = objc_msgSend(v5, "substringWithRange:", v17, v18);
      uint64_t v20 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v19, v16, 1, 0, objc_msgSend(v5, "length"));

      uint64_t v21 = objc_msgSend(v8, "firstMatchInString:options:range:", v20, 0, 0, objc_msgSend(v20, "length"));

      id v5 = v20;
      uint64_t v10 = (void *)v21;
    }
    while (v21);
  }
  else
  {
    uint64_t v20 = v5;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  localizationDictionary = self->_localizationDictionary;
  id v5 = a3;
  [v5 encodeObject:localizationDictionary forKey:@"localizationDictionary"];
  [v5 encodeObject:self->_localeString forKey:@"localeString"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
}

- (WBSWebExtensionLocalization)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WBSWebExtensionLocalization;
  id v5 = [(WBSWebExtensionLocalization *)&v30 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"localizationDictionary"];
    localizationDictionary = v5->_localizationDictionary;
    v5->_localizationDictionary = (NSDictionary *)v13;

    BOOL v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"localeString"];
    localeString = v5->_localeString;
    v5->_localeString = (NSString *)v18;

    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v26;

    v28 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localeString, 0);
  objc_storeStrong((id *)&self->_localizationDictionary, 0);
}

- (void)initWithBundleURL:(uint64_t)a1 defaultLocale:(NSObject *)a2 uniqueIdentifier:extensionIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "Not loading localization for extension %{private}@. No default locale provided.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_5(&dword_1ABB70000, v0, v1, "Could not find localization for %{public}@ in extension %{private}@");
}

@end
@interface _ICQXMLSpecification
- (_ICQXMLSpecification)initWithPlaceholderInfo:(id)a3;
- (id)placeholderReplacementsWithDeviceInfo:(id)a3;
- (id)stringForPlaceholder:(id)a3;
- (id)stringForPlaceholder:(id)a3 withDeviceInfo:(id)a4;
@end

@implementation _ICQXMLSpecification

- (_ICQXMLSpecification)initWithPlaceholderInfo:(id)a3
{
  id v5 = a3;
  v6 = [(_ICQXMLSpecification *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_placeholderInfo, a3);
  }

  return v7;
}

- (id)stringForPlaceholder:(id)a3
{
  return [(_ICQXMLSpecification *)self stringForPlaceholder:a3 withDeviceInfo:0];
}

- (id)stringForPlaceholder:(id)a3 withDeviceInfo:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] > 2)
  {
    placeholderInfo = self->_placeholderInfo;
    v11 = [v6 substringFromIndex:2];
    v8 = [(NSDictionary *)placeholderInfo objectForKeyedSubscript:v11];

    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      v31 = v8;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "placeholderDict = %@", (uint8_t *)&v30, 0xCu);
    }

    if (!v8
      || ([v8 objectForKeyedSubscript:@"appId"],
          (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v14 = (void *)v13,
          [v8 objectForKeyedSubscript:@"replacementStrings"],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          !v15))
    {
      v16 = _ICQGetLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138412290;
        v31 = v6;
        _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "No placeholder info found for %@ in offer", (uint8_t *)&v30, 0xCu);
      }
      v9 = 0;
      goto LABEL_22;
    }
    v16 = [v8 objectForKeyedSubscript:@"replacementStrings"];
    v17 = [v8 objectForKeyedSubscript:@"appId"];
    int v18 = [v17 isEqualToString:@"com.apple.quota.photoLibrary"];

    if (v18)
    {
      v19 = [v16 objectForKeyedSubscript:@"placeholderKey"];
      v20 = [v16 objectForKeyedSubscript:@"default"];
      v9 = +[ICQOfferManager stringWithPlaceholderFormat:v19 alternateString:v20];
    }
    else
    {
      v19 = v7;
      if (!v19)
      {
        uint64_t v21 = [v8 objectForKeyedSubscript:@"appId"];
        if (!v21)
        {
          v19 = _ICQGetLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v30) = 0;
            _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "placeHolderDict is missing 'appID'", (uint8_t *)&v30, 2u);
          }
          v9 = 0;
          goto LABEL_21;
        }
        v22 = (void *)v21;
        v19 = +[_ICQDeviceInfo getInfoWithBundleId:v21];
      }
      v23 = _ICQGetLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v19 key];
        v25 = [v19 wordsToReplace];
        int v30 = 138412546;
        v31 = v24;
        __int16 v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_1D5851000, v23, OS_LOG_TYPE_DEFAULT, "key = %@  wordsToReplace = %@", (uint8_t *)&v30, 0x16u);
      }
      v26 = [v19 key];
      v27 = +[_ICQHelperFunctions stringFromTemplates:v16 key:v26];

      v28 = [v19 wordsToReplace];
      v9 = +[_ICQHelperFunctions replaceWordsIn:v27 with:v28];
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_ICQXMLSpecification stringForPlaceholder:withDeviceInfo:]((uint64_t)v6, v8);
  }
  v9 = 0;
LABEL_23:

  return v9;
}

- (id)placeholderReplacementsWithDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  placeholderInfo = self->_placeholderInfo;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __62___ICQXMLSpecification_placeholderReplacementsWithDeviceInfo___block_invoke;
  v14 = &unk_1E6A53510;
  id v15 = v5;
  id v16 = v4;
  id v7 = v4;
  id v8 = v5;
  [(NSDictionary *)placeholderInfo enumerateKeysAndObjectsUsingBlock:&v11];
  v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

- (void).cxx_destruct
{
}

- (void)stringForPlaceholder:(uint64_t)a1 withDeviceInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "Unable to look up placeholder for key %@, becuase it is too short", (uint8_t *)&v2, 0xCu);
}

@end
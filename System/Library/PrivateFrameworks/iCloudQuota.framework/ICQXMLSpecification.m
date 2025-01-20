@interface ICQXMLSpecification
@end

@implementation ICQXMLSpecification

void __62___ICQXMLSpecification_placeholderReplacementsWithDeviceInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"replacementStrings"];
  v8 = [v6 objectForKeyedSubscript:@"appId"];
  int v9 = [v8 isEqualToString:@"com.apple.quota.photoLibrary"];

  if (v9)
  {
    v10 = [v7 objectForKeyedSubscript:@"placeholderKey"];
    v11 = [v7 objectForKeyedSubscript:@"default"];
    v12 = +[ICQOfferManager stringWithPlaceholderFormat:v10 alternateString:v11];
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v5];

    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      *(_DWORD *)buf = 138412546;
      id v41 = v5;
      __int16 v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "photos substitution used for placeholdeer string %@, replacement: %@", buf, 0x16u);
    }
    goto LABEL_17;
  }
  v13 = *(id *)(a1 + 40);
  if (v13) {
    goto LABEL_7;
  }
  uint64_t v15 = [v6 objectForKeyedSubscript:@"appId"];
  if (v15)
  {
    v16 = (void *)v15;
    v13 = +[_ICQDeviceInfo getInfoWithBundleId:v15];

LABEL_7:
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v13 key];
      v19 = [v13 wordsToReplace];
      *(_DWORD *)buf = 138412546;
      id v41 = v18;
      __int16 v42 = 2112;
      v43 = v19;
      _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "key = %@  wordsToReplace = %@", buf, 0x16u);
    }
    v20 = [v13 key];
    v34 = v7;
    uint64_t v21 = +[_ICQHelperFunctions stringFromTemplates:v7 key:v20];

    v22 = [v13 wordsToReplace];
    v33 = (void *)v21;
    v23 = +[_ICQHelperFunctions replaceWordsIn:v21 with:v22];
    [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:v5];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v24 = [v13 wordsToReplace];
    v25 = [v24 allKeys];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v29 = 0;
        v30 = v5;
        do
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          id v5 = *(id *)(*((void *)&v35 + 1) + 8 * v29);

          v31 = [v13 wordsToReplace];
          v32 = [v31 objectForKeyedSubscript:v5];
          [*(id *)(a1 + 32) setObject:v32 forKeyedSubscript:v5];

          ++v29;
          v30 = v5;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v27);
    }

    id v5 = 0;
    v7 = v34;
    goto LABEL_17;
  }
  v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "placeHolderDict is missing 'appID'", buf, 2u);
  }
LABEL_17:
}

@end
@interface WBSPasswordPickerHintStringGenerator
+ (void)getHintStringsForAppID:(id)a3 appNames:(id)a4 matchedSites:(id)a5 urlString:(id)a6 outServiceNameHintStrings:(id *)a7 outDomainHintStrings:(id *)a8;
@end

@implementation WBSPasswordPickerHintStringGenerator

+ (void)getHintStringsForAppID:(id)a3 appNames:(id)a4 matchedSites:(id)a5 urlString:(id)a6 outServiceNameHintStrings:(id *)a7 outDomainHintStrings:(id *)a8
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void *)MEMORY[0x1E4F1CBF0];
  v44 = a7;
  *a7 = (id)MEMORY[0x1E4F1CBF0];
  *a8 = v17;
  v18 = (void *)MEMORY[0x1E4F1CB10];
  v19 = objc_msgSend(v16, "safari_stringByTrimmingWhitespace");
  v20 = [v19 dataUsingEncoding:5];
  v21 = objc_msgSend(v18, "_lp_URLWithData:baseURL:", v20, 0);
  v22 = [v21 host];

  if (v22)
  {
    id v23 = v22;
  }
  else
  {
    v24 = objc_msgSend(MEMORY[0x1E4F1CB10], "_lp_URLWithUserTypedString:relativeToURL:", v16, 0);
    id v23 = [v24 host];
  }
  uint64_t v25 = objc_msgSend(v23, "safari_highLevelDomainFromHost");
  v26 = (void *)v25;
  if (v25)
  {
    v50[0] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
LABEL_6:
    *a8 = v27;
    goto LABEL_8;
  }
  if (v23) {
    goto LABEL_8;
  }
  if ([v15 count])
  {
    v27 = objc_msgSend(v15, "safari_mapObjectsUsingBlock:", &__block_literal_global_47);
    goto LABEL_6;
  }
  if (([v13 hasPrefix:@"com.apple."] & 1) == 0)
  {
    v38 = 0;
    v39 = 0;
    v40 = v22;
    id v41 = v16;
    id v42 = v15;
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v43 = v14;
    id v29 = v14;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (objc_msgSend(v34, "length", v38, v39, v40, v41, v42))
          {
            [v28 addObject:v34];
            v35 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
            v36 = [v35 invertedSet];
            v37 = objc_msgSend(v34, "safari_stringByRemovingCharactersInSet:", v36);

            if (([v34 isEqualToString:v37] & 1) == 0) {
              [v28 addObject:v37];
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v31);
    }

    id *v44 = [v28 allObjects];

    id v14 = v43;
    id v16 = v41;
    id v15 = v42;
    id v23 = v39;
    v22 = v40;
    v26 = v38;
  }
LABEL_8:
}

id __142__WBSPasswordPickerHintStringGenerator_getHintStringsForAppID_appNames_matchedSites_urlString_outServiceNameHintStrings_outDomainHintStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

@end
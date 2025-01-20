@interface _PSContentFeatures
+ (id)numberOfContentFromPredictionContext:(id)a3 contentType:(int)a4 candidates:(id)a5;
+ (id)preservePrivacySourceBundleID:(id)a3;
+ (id)preservePrivacyTopLevelDomain:(id)a3;
+ (id)preservePrivacyUTIMapping:(id)a3;
+ (id)sourceAppFromPredictionContext:(id)a3 candidates:(id)a4;
+ (id)urlTopLevelDomainFromPredictionContext:(id)a3 candidates:(id)a4;
+ (id)utiTypesFromPredictionContext:(id)a3 candidates:(id)a4;
@end

@implementation _PSContentFeatures

+ (id)preservePrivacyUTIMapping:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1A6243860]();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"public.file-url", @"public.url", @"public.image", @"public.jpeg,public.heic", @"public.jpeg", @"com.apple.live-photo,public.heic,public.jpeg", @"com.apple.avfoundation.urlasset,com.apple.quicktime-movie", @"public.plain-text", @"public.png", @"public.vcard", @"com.apple.active-webpage,public.url", @"public.url,com.apple.active-webpage", 0);
  if ([v5 containsObject:v3]) {
    v6 = (__CFString *)v3;
  }
  else {
    v6 = @"NotInTopAllowedUTIStrings";
  }

  return v6;
}

+ (id)preservePrivacySourceBundleID:(id)a3
{
  id v17 = a3;
  v18 = (void *)MEMORY[0x1A6243860]();
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v3 = +[_PSConstants mobilePhotosBundleId];
  v15 = +[_PSConstants mobileScreenshotsBundleId];
  v4 = +[_PSConstants mobileCameraBundleId];
  v5 = +[_PSConstants twitterBundleId];
  v6 = +[_PSConstants mobileSafariBundleId];
  v7 = +[_PSConstants whatsappBundleId];
  v8 = +[_PSConstants mobileMessagesBundleId];
  v9 = +[_PSConstants mobilePhoneBundleId];
  v10 = +[_PSConstants mobileMailBundleId];
  v11 = +[_PSConstants instagramBundleId];
  v12 = objc_msgSend(v16, "initWithObjects:", v3, v15, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  if ([v12 containsObject:v17]) {
    v13 = (__CFString *)v17;
  }
  else {
    v13 = @"NotInTopAllowedsourceBundleIDStrings";
  }

  return v13;
}

+ (id)preservePrivacyTopLevelDomain:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 length];
  uint64_t v5 = objc_msgSend(v3, "rangeOfString:options:range:", @"www.", 11, 0, v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = v4 - (v5 + v6);
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v5 + v6;
  }
  uint64_t v9 = objc_msgSend(v3, "rangeOfString:options:range:", @".", 2, v8, v7);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [&unk_1EF675F48 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = v7;
    }
    else {
      uint64_t v12 = v9 - v8;
    }
    uint64_t v13 = *(void *)v19;
    v14 = @"NotInTopAllowedTopLevelDomains";
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(&unk_1EF675F48);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (!objc_msgSend(v3, "compare:options:range:", v16, 3, v8, v12))
        {
          v14 = v16;
          goto LABEL_21;
        }
      }
      uint64_t v11 = [&unk_1EF675F48 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    v14 = @"NotInTopAllowedTopLevelDomains";
  }
LABEL_21:

  return v14;
}

+ (id)utiTypesFromPredictionContext:(id)a3 candidates:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v5 attachments];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v14 = [v13 UTI];

        if (v14)
        {
          v15 = [v13 UTI];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    id v16 = [v7 allObjects];
    id v17 = [v16 sortedArrayUsingSelector:sel_compare_];

    long long v18 = [v17 componentsJoinedByString:@","];
    long long v19 = [v6 allObjects];
    long long v20 = [_PSFeatureDictionary alloc];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63___PSContentFeatures_utiTypesFromPredictionContext_candidates___block_invoke;
    v25[3] = &unk_1E5ADF680;
    id v26 = v18;
    id v21 = v18;
    v22 = objc_msgSend(v19, "_pas_mappedArrayWithTransform:", v25);
    uint64_t v23 = [(_PSFeatureDictionary *)v20 initWithObjects:v22 forKeys:v19];
  }
  else
  {
    uint64_t v23 = (_PSFeatureDictionary *)MEMORY[0x1E4F1CC08];
  }

  return v23;
}

+ (id)sourceAppFromPredictionContext:(id)a3 candidates:(id)a4
{
  id v5 = a3;
  id v6 = [a4 allObjects];
  id v7 = [v5 bundleID];

  if (v7)
  {
    uint64_t v8 = [_PSFeatureDictionary alloc];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64___PSContentFeatures_sourceAppFromPredictionContext_candidates___block_invoke;
    v12[3] = &unk_1E5ADF680;
    id v13 = v5;
    uint64_t v9 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
    uint64_t v10 = [(_PSFeatureDictionary *)v8 initWithObjects:v9 forKeys:v6];
  }
  else
  {
    uint64_t v10 = (_PSFeatureDictionary *)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

+ (id)numberOfContentFromPredictionContext:(id)a3 contentType:(int)a4 candidates:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v25 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = [v7 attachments];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        switch(a4)
        {
          case 3:
            long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"%li", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "hash"));
            [v8 addObject:v18];
            goto LABEL_15;
          case 1:
            id v17 = [*(id *)(*((void *)&v28 + 1) + 8 * i) peopleInPhoto];

            if (!v17) {
              continue;
            }
            uint64_t v16 = [v14 photoSceneDescriptors];
LABEL_13:
            long long v18 = (void *)v16;
            [v8 addObjectsFromArray:v16];
LABEL_15:

            continue;
          case 0:
            v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) peopleInPhoto];

            if (v15)
            {
              uint64_t v16 = [v14 peopleInPhoto];
              goto LABEL_13;
            }
            break;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  long long v19 = [v25 allObjects];
  long long v20 = [_PSFeatureDictionary alloc];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82___PSContentFeatures_numberOfContentFromPredictionContext_contentType_candidates___block_invoke;
  v26[3] = &unk_1E5ADF680;
  id v27 = v8;
  id v21 = v8;
  v22 = objc_msgSend(v19, "_pas_mappedArrayWithTransform:", v26);
  uint64_t v23 = [(_PSFeatureDictionary *)v20 initWithObjects:v22 forKeys:v19];

  return v23;
}

+ (id)urlTopLevelDomainFromPredictionContext:(id)a3 candidates:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [a3 attachments];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    uint64_t v10 = (_PSFeatureDictionary *)MEMORY[0x1E4F1CC08];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 contentURL];

        if (v13)
        {
          v14 = [v12 contentURL];
          v15 = [v14 host];

          if (v15)
          {

            uint64_t v16 = [v5 allObjects];
            id v17 = [_PSFeatureDictionary alloc];
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __72___PSContentFeatures_urlTopLevelDomainFromPredictionContext_candidates___block_invoke;
            v20[3] = &unk_1E5ADF680;
            id v21 = v15;
            id v6 = v15;
            long long v18 = objc_msgSend(v16, "_pas_mappedArrayWithTransform:", v20);
            uint64_t v10 = [(_PSFeatureDictionary *)v17 initWithObjects:v18 forKeys:v16];

            goto LABEL_13;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = (_PSFeatureDictionary *)MEMORY[0x1E4F1CC08];
  }
LABEL_13:

  return v10;
}

@end
@interface PNPersonSuggester
+ (BOOL)_isMePersonWithLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5;
+ (id)_logger;
+ (id)_meContactIdentifierWithError:(id *)a3;
+ (id)fetchAutonamingSuggestionForPerson:(id)a3 checkIsMe:(BOOL)a4 withError:(id *)a5;
+ (void)_logIntelligencePlatformUserFeedback:(int64_t)a3 forSuggestion:(id)a4;
+ (void)logUserFeedback:(int64_t)a3 forSuggestion:(id)a4;
@end

@implementation PNPersonSuggester

+ (void)_logIntelligencePlatformUserFeedback:(int64_t)a3 forSuggestion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [a1 _logger];
  v8 = [getGDViewServiceClass() clientService];
  v9 = getGDAutonamingViewPhotosAutonamingViewName();
  id v16 = 0;
  v10 = [v8 autonamingViewWithViewName:v9 error:&v16];
  id v11 = v16;

  if (v10)
  {
    v12 = [v6 personLocalIdentifier];
    v13 = [v10 personForIdentifier:v12];

    if (v13)
    {
      if (a3 == 1)
      {
        v14 = [v6 personLocalIdentifier];
        [v10 rejectWithIdentifier:v14 person:v13 confirmationType:1];
      }
      else
      {
        if (a3)
        {
LABEL_12:

          goto LABEL_13;
        }
        v14 = [v6 personLocalIdentifier];
        [v10 confirmWithIdentifier:v14 person:v13 confirmationType:1];
      }
    }
    else
    {
      v14 = v7;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [v6 personLocalIdentifier];
        *(_DWORD *)buf = 138543362;
        id v18 = v15;
        _os_log_error_impl(&dword_25934C000, v14, OS_LOG_TYPE_ERROR, "Failed to get graph person view for logging user action on suggestion for person %{public}@", buf, 0xCu);
      }
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v11;
    _os_log_error_impl(&dword_25934C000, v7, OS_LOG_TYPE_ERROR, "Failed to get autonaming view with error %@", buf, 0xCu);
  }
LABEL_13:
}

+ (void)logUserFeedback:(int64_t)a3 forSuggestion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [a1 _logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    int64_t v9 = a3;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_25934C000, v7, OS_LOG_TYPE_DEFAULT, "Logging feedback %ld for suggestion %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ([v6 suggestionSource] == 1) {
    [a1 _logIntelligencePlatformUserFeedback:a3 forSuggestion:v6];
  }
}

+ (id)_meContactIdentifierWithError:(id *)a3
{
  v4 = [MEMORY[0x263F14E98] sharedContactStore];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__562;
  v22 = __Block_byref_object_dispose__563;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__562;
  id v16 = __Block_byref_object_dispose__563;
  id v17 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__PNPersonSuggester__meContactIdentifierWithError___block_invoke;
  v8[3] = &unk_26544EDC8;
  id v5 = v4;
  id v9 = v5;
  __int16 v10 = &v18;
  id v11 = &v12;
  [v5 requestAccessForEntityType:0 completionHandler:v8];
  if (a3) {
    *a3 = (id) v13[5];
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __51__PNPersonSuggester__meContactIdentifierWithError___block_invoke(void *a1, int a2, void *a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a2)
  {
    v7 = (void *)a1[4];
    v17[0] = *MEMORY[0x263EFDFE0];
    int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v16 = 0;
    id v9 = [v7 _crossPlatformUnifiedMeContactWithKeysToFetch:v8 error:&v16];
    id v10 = v16;

    if (v9)
    {
      uint64_t v11 = [v9 identifier];
      uint64_t v12 = *(void *)(a1[5] + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    else
    {
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v14 = *(void *)(a1[6] + 8);
      id v15 = v10;
      v13 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v15;
    }

    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
LABEL_9:
}

+ (BOOL)_isMePersonWithLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = [a4 suggestedMePersonIdentifierWithError:a5];
  id v9 = v8;
  if (v8) {
    char v10 = [v8 isEqualToString:v7];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

+ (id)fetchAutonamingSuggestionForPerson:(id)a3 checkIsMe:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [a1 _logger];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  uint64_t v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "fetchAutonamingSuggestionForPerson", "", buf, 2u);
  }
  os_signpost_id_t spid = v10;

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v6) {
    goto LABEL_10;
  }
  id v15 = objc_msgSend(v8, "localIdentifier", spid);
  id v16 = [v8 photoLibrary];
  id v37 = 0;
  int v17 = [a1 _isMePersonWithLocalIdentifier:v15 inPhotoLibrary:v16 error:&v37];
  id v18 = v37;

  if (v18) {
    [v14 addObject:v18];
  }

  if (!v17)
  {
LABEL_10:
    v22 = [getGDViewServiceClass() clientService];
    id v23 = getGDAutonamingViewPhotosAutonamingViewName();
    id v35 = 0;
    uint64_t v19 = [v22 autonamingViewWithViewName:v23 error:&v35];
    id v21 = v35;

    if (v19)
    {
      v24 = [v8 localIdentifier];
      v25 = [v19 personForIdentifier:v24];

      if (v25)
      {
        v26 = [v8 localIdentifier];
        v27 = +[PNPersonSuggestion suggestionWithPersonLocalIdentifier:v26 personView:v25];

        goto LABEL_18;
      }
    }
    else
    {
      if (v21)
      {
        [v14 addObject:v21];
      }
      else
      {
        v28 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithLocalizedDescription:", @"Autonaming view is nil");
        [v14 addObject:v28];
      }
      uint64_t v19 = 0;
    }
    goto LABEL_17;
  }
  id v36 = 0;
  uint64_t v19 = [a1 _meContactIdentifierWithError:&v36];
  id v20 = v36;
  if (v20)
  {
    id v21 = v20;
    [v14 addObject:v20];
LABEL_17:
    v27 = 0;
    goto LABEL_18;
  }
  if (!v19)
  {
    id v21 = 0;
    goto LABEL_17;
  }
  v33 = [v8 localIdentifier];
  v27 = +[PNPersonSuggestion suggestionWithPersonLocalIdentifier:v33 meContactIdentifier:v19];

  id v21 = 0;
LABEL_18:

  if (a5)
  {
    if ([v14 count] == 1)
    {
      v29 = [v14 firstObject];
LABEL_23:
      *a5 = v29;
      goto LABEL_24;
    }
    if ((unint64_t)[v14 count] >= 2)
    {
      v29 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithMultipleUnderlyingErrors:localizedDescription:", v14, @"Multiple errors occured during autonaming suggestion");
      goto LABEL_23;
    }
  }
LABEL_24:
  v30 = v12;
  v31 = v30;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v31, OS_SIGNPOST_INTERVAL_END, spid, "fetchAutonamingSuggestionForPerson", "", buf, 2u);
  }

  return v27;
}

+ (id)_logger
{
  if (_logger_onceToken != -1) {
    dispatch_once(&_logger_onceToken, &__block_literal_global_571);
  }
  v2 = (void *)_logger__log;
  return v2;
}

uint64_t __28__PNPersonSuggester__logger__block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F5DBE0], "PersonSuggester");
  uint64_t v2 = _logger__log;
  _logger__log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v2, v1);
}

@end
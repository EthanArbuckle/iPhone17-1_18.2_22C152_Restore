@interface SearchUIPlayAudioButtonItemGenerator
+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3;
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUIPlayAudioButtonItemGenerator

+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 audioData];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [v3 mediaMetadata];
    BOOL v5 = [v6 mediaType] != 100;
  }
  return v5;
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 mediaMetadata];
  v8 = [v7 mediaIdentifier];
  unsigned int v9 = [v7 mediaType];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  aBlock[3] = &unk_1E6E73EC0;
  id v10 = v5;
  id v36 = v10;
  id v11 = v7;
  id v37 = v11;
  id v12 = v6;
  id v38 = v12;
  v13 = _Block_copy(aBlock);
  v14 = [v10 audioData];

  if (!v14)
  {
    if (+[SearchUIMediaUtilities isCoreSpotlightMedia:v8])
    {
      v19 = SearchUIButtonItemLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E45B5000, v19, OS_LOG_TYPE_DEFAULT, "Generating a button item with core spotlight media metadata", buf, 2u);
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_14;
      v32[3] = &unk_1E6E73F10;
      id v33 = v8;
      id v34 = v13;
      +[SearchUIMediaUtilities getMusicUserDisclosureApprovalStatusWithCompletionHandler:v32];

      v20 = v33;
      goto LABEL_10;
    }
    if (v8 && v9 == 100)
    {
      v15 = SearchUIButtonItemLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 138412290;
      v40 = v8;
      v16 = "Generating a button for voicemail: %@";
      v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_4;
    }
    if (v11 && ([MEMORY[0x1E4FAE198] isMacOS] & 1) == 0)
    {
      v23 = SearchUIButtonItemLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v11 bundleIdentifiersToExclude];
        *(_DWORD *)buf = 138412290;
        v40 = v24;
        _os_log_impl(&dword_1E45B5000, v23, OS_LOG_TYPE_DEFAULT, "Figuring out best play button path with SAAudioAppPrediction with bundleIDs to exclude: %@", buf, 0xCu);
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_18;
      v27[3] = &unk_1E6E73F38;
      id v30 = v13;
      id v28 = v11;
      id v31 = v12;
      id v29 = v10;
      +[SearchUIMediaUtilities predictionForMediaMetadata:v28 completion:v27];

      v20 = v30;
      goto LABEL_10;
    }
    v21 = SearchUIButtonItemLog();
    v22 = v21;
    if (v8)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v8;
        _os_log_impl(&dword_1E45B5000, v22, OS_LOG_TYPE_DEFAULT, "Generating a button for media identifier: %@", buf, 0xCu);
      }

      if (v9 <= 5 && ((1 << v9) & 0x2E) != 0)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_31;
        v25[3] = &unk_1E6E72E90;
        id v26 = v13;
        +[SearchUIMediaUtilities canPlayAppleMusicWithCompletionHandler:v25];
        v20 = v26;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SearchUIPlayAudioButtonItemGenerator generateSearchUIButtonItemsWithSFButtonItem:completion:](v22);
      }
    }
    (*((void (**)(void *, void))v13 + 2))(v13, 0);
    goto LABEL_11;
  }
  v15 = SearchUIButtonItemLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v16 = "Generating a button item with audio data";
    v17 = v15;
    uint32_t v18 = 2;
LABEL_4:
    _os_log_impl(&dword_1E45B5000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
  }
LABEL_5:

  (*((void (**)(void *, uint64_t))v13 + 2))(v13, 1);
LABEL_11:
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(void *a1, int a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [[SearchUIPlayAudioButtonItem alloc] initWithSFButtonItem:a1[4]];
    [(SearchUIButtonItem *)v3 setStatus:+[SearchUIMediaUtilities isNowPlayingMedia:a1[5]]];
    uint64_t v4 = a1[6];
    v7[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, 1);
  }
  else
  {
    id v6 = *(void (**)(void))(a1[6] + 16);
    v6();
  }
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_14(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = +[SearchUIMediaUtilities localAudioCache];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2;
    v6[3] = &unk_1E6E73EE8;
    uint64_t v4 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v3 getObjectForKey:v4 completionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = SearchUIButtonItemLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = [v4 count];
      _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Fetched the collection with count: %lu", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v4 count] != 0);
  }
  else
  {
    id v6 = SearchUIButtonItemLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = (uint64_t)v3;
      _os_log_impl(&dword_1E45B5000, v6, OS_LOG_TYPE_DEFAULT, "Fetched the media entity for corespotlight media identifier: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 != 0);
  }
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SearchUIButtonItemLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 selectedBundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v50 = v5;
    _os_log_impl(&dword_1E45B5000, v4, OS_LOG_TYPE_DEFAULT, "Siri predicted app bundle: %@", buf, 0xCu);
  }
  id v6 = [v3 selectedBundleIdentifier];
  BOOL v7 = +[SearchUIUtilities isAppInstalledWithBundleId:v6];

  if (!v7) {
    goto LABEL_26;
  }
  uint64_t v8 = [v3 selectedBundleIdentifier];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [*(id *)(a1 + 32) bundleIdentifiersToExclude];
    id v11 = [v3 selectedBundleIdentifier];
    char v12 = [v10 containsObject:v11];

    if ((v12 & 1) == 0)
    {
      v14 = [v3 selectedBundleIdentifier];
      v15 = +[SearchUIUtilities bundleIdentifierForApp:11];
      int v16 = [v14 isEqual:v15];

      if (v16)
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_20;
        v44[3] = &unk_1E6E72E90;
        id v45 = *(id *)(a1 + 48);
        +[SearchUIMediaUtilities getMusicUserDisclosureApprovalStatusWithCompletionHandler:v44];
      }
      else
      {
        uint64_t v36 = *(void *)(a1 + 56);
        id v37 = [[SearchUIPlayAudioButtonItem alloc] initWithSFButtonItem:*(void *)(a1 + 40)];
        v48 = v37;
        id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
        (*(void (**)(uint64_t, void *, uint64_t))(v36 + 16))(v36, v38, 1);
      }
      goto LABEL_30;
    }
  }
  v13 = +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:*(void *)(a1 + 32)];
  if (![v13 count])
  {
    v17 = [v3 disambiguateBundleIdentifiers];
    uint64_t v18 = [v17 count];

    if (v18) {
      goto LABEL_11;
    }
LABEL_26:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_30;
  }

LABEL_11:
  v19 = SearchUIButtonItemLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v3 disambiguateBundleIdentifiers];
    *(_DWORD *)buf = 138412290;
    v50 = v20;
    _os_log_impl(&dword_1E45B5000, v19, OS_LOG_TYPE_DEFAULT, "siri audo predicated disambiguate identifiers: %@", buf, 0xCu);
  }
  v21 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v39 = v3;
  v22 = [v3 disambiguateBundleIdentifiers];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * v26);
        id v28 = [*(id *)(a1 + 32) bundleIdentifiersToExclude];
        char v29 = [v28 containsObject:v27];

        if ((v29 & 1) == 0)
        {
          id v30 = objc_opt_new();
          [v30 setAppBundleIdentifier:v27];
          [v30 setMediaMetadata:*(void *)(a1 + 32)];
          [v21 addObject:v30];
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v24);
  }

  id v31 = +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:*(void *)(a1 + 32)];
  [v21 addObjectsFromArray:v31];

  v32 = SearchUIButtonItemLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v21;
    _os_log_impl(&dword_1E45B5000, v32, OS_LOG_TYPE_DEFAULT, "final media destinations: %@", buf, 0xCu);
  }

  id v3 = v39;
  if ([v21 count])
  {
    uint64_t v33 = *(void *)(a1 + 56);
    id v34 = [[SearchUIPlayAudioButtonItem alloc] initWithSFButtonItem:*(void *)(a1 + 40)];
    v46 = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    (*(void (**)(uint64_t, void *, uint64_t))(v33 + 16))(v33, v35, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_30:
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_20(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2_21;
    v3[3] = &unk_1E6E72E90;
    id v4 = *(id *)(a1 + 32);
    +[SearchUIMediaUtilities canPlayAppleMusicWithCompletionHandler:v3];
  }
  else
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
}

uint64_t __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2_21(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = SearchUIButtonItemLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"NO";
    if (a2) {
      id v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1E45B5000, v4, OS_LOG_TYPE_DEFAULT, "Siri predicted apple music and can play: %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_31(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = SearchUIButtonItemLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"NO";
    if (a2) {
      id v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1E45B5000, v4, OS_LOG_TYPE_DEFAULT, "Media Metadata can play apple music! %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Could not generate audio button item", v1, 2u);
}

@end
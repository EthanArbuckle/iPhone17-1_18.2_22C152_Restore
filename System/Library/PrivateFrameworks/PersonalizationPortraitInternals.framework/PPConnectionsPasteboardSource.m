@interface PPConnectionsPasteboardSource
+ (PPConnectionsPasteboardSource)sharedInstance;
- (PPConnectionsPasteboardSource)init;
- (id)_mostRecentPasteboardItem;
- (id)addressPasteboardTextItemFromNotification:(BOOL)a3;
- (id)fetchedPasteboardItem;
- (id)identifier;
- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8;
- (id)supportedSemanticTags;
- (id)validUTTypes;
- (void)_setMostRecentPasteboardItem:(id)a3;
- (void)dealloc;
- (void)refreshMostRecentPasteboardItemFromNotification:(BOOL)a3 explanationSet:(id)a4;
- (void)setTestLocale:(id)a3;
@end

@implementation PPConnectionsPasteboardSource

void __58__PPConnectionsPasteboardSource__mostRecentPasteboardItem__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    a2 = (void *)a2[1];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

- (id)identifier
{
  return @"pasteboard";
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a8;
  v15 = [(PPConnectionsPasteboardSource *)self _mostRecentPasteboardItem];
  if (!v15)
  {
    double v19 = 0.04;
    if (a7 != 1) {
      double v19 = 1.0;
    }
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:self->_init_sem timeoutSeconds:v19] == 1)
    {
      v15 = pp_connections_log_handle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v20 = "PPConnectionsPasteboardSource: timed out waiting for pasteboard source initialization.";
    }
    else
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_init_sem);
      v15 = [(PPConnectionsPasteboardSource *)self _mostRecentPasteboardItem];
      if (v15) {
        goto LABEL_2;
      }
      [v14 push:26];
      v15 = pp_connections_log_handle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v20 = "PPConnectionsPasteboardSource: pasteboard is empty";
    }
    _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    goto LABEL_28;
  }
LABEL_2:
  v16 = [v15 createdAt];
  uint64_t v17 = [v13 compare:v16];

  if (v17 == 1)
  {
    [v14 push:6];
    v18 = pp_connections_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: pasteboard is too old", buf, 2u);
    }

    goto LABEL_28;
  }
  v21 = [(PPConnectionsPasteboardSource *)self supportedSemanticTags];
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v12, "locationField"));
  int v23 = [v21 containsObject:v22];

  if (!v23)
  {
LABEL_28:
    v30 = 0;
    goto LABEL_29;
  }
  v24 = [(PPConnectionsPasteboardSource *)self _mostRecentPasteboardItem];
  v25 = pp_connections_log_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v24 text];
    uint64_t v27 = [v26 length];
    v28 = [v24 bundleIdentifier];
    *(_DWORD *)buf = 134218242;
    uint64_t v54 = v27;
    __int16 v55 = 2112;
    v56 = v28;
    _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: most recent pasteboard item has text length %tu from bundle %@", buf, 0x16u);
  }
  v29 = [v24 text];
  if (![v29 length]) {
    goto LABEL_35;
  }
  v30 = [v24 bundleIdentifier];

  if (v30)
  {
    uint64_t v31 = [v12 locationField];
    v32 = [v24 text];
    v33 = [v24 addressComponents];
    v34 = +[PPConnectionsDataDetectors addressComponentValueWithLocationField:v31 forDataDetectorsMatch:v32 addressComponents:v33];
    v29 = PPCollapseWhitespaceAndStrip();

    if (v29 && [v29 length])
    {
      v35 = [v24 addressComponents];
      v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F28958]];
      PPCollapseWhitespaceAndStrip();
      id v37 = (id)objc_claimAutoreleasedReturnValue();

      if (!v37) {
        id v37 = v29;
      }
      id v38 = objc_alloc(MEMORY[0x1E4F89DC0]);
      v39 = [v24 bundleIdentifier];
      v40 = (void *)[v38 initWithOriginatingBundleID:v39];

      [v40 setName:v37];
      v51 = v37;
      [v40 setLabel:v37];
      [v40 setValue:v29];
      [v40 setShortValue:v29];
      [v40 setShouldAggregate:0];
      v41 = [v24 createdAt];
      v42 = (void *)[v41 copy];
      [v40 setCreatedAt:v42];

      [v40 setSource:@"pasteboard"];
      [v40 setCopiedToPasteboard:1];
      v43 = NSNumber;
      v44 = +[PPConnectionsParameters sharedInstance];
      [v44 pasteboardItemExpirySeconds];
      v45 = objc_msgSend(v43, "numberWithDouble:");
      [v40 setLifetime:v45];

      v46 = pp_connections_log_handle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = [v40 originatingBundleID];
        v48 = [v40 createdAt];
        *(_DWORD *)buf = 138412546;
        uint64_t v54 = (uint64_t)v47;
        __int16 v55 = 2112;
        v56 = v48;
        _os_log_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: returning location item from %@ created at %@", buf, 0x16u);
      }
      if (!v40)
      {
        v30 = 0;
        goto LABEL_37;
      }
      v52 = v40;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      v29 = v40;
      goto LABEL_36;
    }
    v50 = pp_connections_log_handle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: no address value", buf, 2u);
    }

LABEL_35:
    v30 = 0;
LABEL_36:
  }
LABEL_37:

LABEL_29:
  return v30;
}

- (id)_mostRecentPasteboardItem
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18697;
  v10 = __Block_byref_object_dispose__18698;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PPConnectionsPasteboardSource__mostRecentPasteboardItem__block_invoke;
  v5[3] = &unk_1E65D9900;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testLocale, 0);
  objc_storeStrong((id *)&self->_pbQueue, 0);
  objc_storeStrong((id *)&self->_init_sem, 0);
  objc_storeStrong(&self->_pasteboardObserver, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)supportedSemanticTags
{
  if (supportedSemanticTags_onceToken != -1) {
    dispatch_once(&supportedSemanticTags_onceToken, &__block_literal_global_36_18685);
  }
  v2 = (void *)supportedSemanticTags_supportedSemanticTags;
  return v2;
}

void __54__PPConnectionsPasteboardSource_supportedSemanticTags__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F25694B8, &unk_1F25694D0, &unk_1F25694E8, &unk_1F2569500, &unk_1F2569518, &unk_1F2569530, &unk_1F2569548, &unk_1F2569560, 0);
  v2 = (void *)supportedSemanticTags_supportedSemanticTags;
  supportedSemanticTags_supportedSemanticTags = v1;
}

- (id)validUTTypes
{
  if (validUTTypes_onceToken != -1) {
    dispatch_once(&validUTTypes_onceToken, &__block_literal_global_33_18693);
  }
  v2 = (void *)validUTTypes__stringPasteboardUTTypes;
  return v2;
}

void __45__PPConnectionsPasteboardSource_validUTTypes__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [(id)*MEMORY[0x1E4F44510] identifier];
  uint64_t v1 = objc_msgSend((id)*MEMORY[0x1E4F44508], "identifier", v0);
  v5[1] = v1;
  v2 = [(id)*MEMORY[0x1E4F444F0] identifier];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v4 = (void *)validUTTypes__stringPasteboardUTTypes;
  validUTTypes__stringPasteboardUTTypes = v3;
}

- (id)addressPasteboardTextItemFromNotification:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(PPConnectionsPasteboardSource *)self fetchedPasteboardItem];
  v5 = [v4 text];
  if (![v5 length])
  {

    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = [v4 bundleIdentifier];

  if (!v6)
  {
LABEL_9:
    uint64_t v8 = 0;
LABEL_11:
    id v11 = 0;
    goto LABEL_12;
  }
  v7 = [v4 text];
  id v14 = 0;
  uint64_t v8 = +[PPDataDetectors addressComponentsFromString:v7 extractedAddress:&v14];
  id v6 = v14;

  if (!v6 || !v8)
  {

    v4 = 0;
    goto LABEL_11;
  }
  [v4 setText:v6];
  [v4 setAddressComponents:v8];
  if (v3)
  {
    v9 = +[PPConnectionsMetricsTracker sharedInstance];
    v10 = [v4 bundleIdentifier];
    [v9 trackPasteboardItemFromBundleId:v10 hasAddress:1 isEligible:1];
  }
  id v11 = v4;
LABEL_12:
  id v12 = v11;

  return v12;
}

- (id)fetchedPasteboardItem
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__18697;
  v61 = __Block_byref_object_dispose__18698;
  id v62 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__18697;
  __int16 v55 = __Block_byref_object_dispose__18698;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__18697;
  v49 = __Block_byref_object_dispose__18698;
  id v50 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [MEMORY[0x1E4F881F0] defaultConnection];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke;
  v41[3] = &unk_1E65D9958;
  v43 = &v51;
  v44 = &v45;
  v5 = v3;
  v42 = v5;
  [v4 localGeneralPasteboardCompletionBlock:v41];

  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:5.0] == 1)
  {
    id v6 = pp_connections_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "PPConnectionsPasteboardSource: local general pasteboard fetch timed out";
      uint64_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_1CA9A8000, v8, v9, v7, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([(id)v46[5] isEqualToString:*MEMORY[0x1E4F8A100]])
  {
    id v6 = pp_connections_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "PPConnectionsPasteboardSource: Rejecting item copied in SpringBoard!";
      uint64_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
LABEL_8:
    id v10 = 0;
    goto LABEL_20;
  }
  id v11 = [(id)v52[5] items];
  id v6 = [v11 firstObject];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = [(PPConnectionsPasteboardSource *)self validUTTypes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v63 count:16];
  if (v13)
  {
    id obj = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v17 = (void *)MEMORY[0x1CB79D060]();
        if ([v6 hasRepresentationConformingToType:v16]
          && !v58[5])
        {
          v18 = [v6 representationConformingToType:v16];
          double v19 = (void *)MEMORY[0x1E4F442D8];
          v20 = [v18 typeIdentifier];
          v21 = [v19 typeWithIdentifier:v20];

          dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke_26;
          v28[3] = &unk_1E65D9980;
          id v23 = v21;
          v33 = &v57;
          v34 = &v51;
          v35 = &v45;
          id v29 = v23;
          uint64_t v30 = v16;
          id v24 = v18;
          id v31 = v24;
          v5 = v22;
          v32 = v5;
          id v25 = (id)[v24 loadDataWithCompletion:v28];
          [MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:5.0];
        }
      }
      id v12 = obj;
      uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v63 count:16];
    }
    while (v13);
  }

  id v10 = (id)v58[5];
LABEL_20:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v10;
}

void __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) originatorBundleID];
  uint64_t v8 = [v7 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v6) {
    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", @"PB", [v6 code]);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    goto LABEL_23;
  }
  if (!v5) {
    goto LABEL_20;
  }
  if ([*(id *)(a1 + 32) conformsToType:*MEMORY[0x1E4F44510]])
  {
    v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text type resolves to UTF-8", (uint8_t *)&v24, 2u);
    }

    uint64_t v8 = NSString;
    id v9 = v5;
    uint64_t v10 = 4;
LABEL_11:
    uint64_t v12 = objc_msgSend(v8, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v9, v10, 0);
    goto LABEL_12;
  }
  if ([*(id *)(a1 + 32) conformsToType:*MEMORY[0x1E4F44508]])
  {
    id v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text type resolves to UTF-16", (uint8_t *)&v24, 2u);
    }

    uint64_t v8 = NSString;
    id v9 = v5;
    uint64_t v10 = 10;
    goto LABEL_11;
  }
  if (![*(id *)(a1 + 32) conformsToType:*MEMORY[0x1E4F444F0]]) {
    goto LABEL_20;
  }
  double v19 = pp_default_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v24) = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text type does not resolve to UTF-8 or UTF-16", (uint8_t *)&v24, 2u);
  }

  uint64_t v12 = [[NSString alloc] initWithData:v5 usedEncoding:0];
LABEL_12:
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) creationDate];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setCreatedAt:v17];

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setBundleIdentifier:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setText:v13];
    v18 = pp_connections_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) text];
      int v24 = 138739971;
      id v25 = v23;
      _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text: %{sensitive}@", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_23;
  }
LABEL_20:
  v20 = pp_connections_log_handle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(void **)(a1 + 40);
    dispatch_semaphore_t v22 = [*(id *)(a1 + 48) typeIdentifier];
    int v24 = 138412802;
    id v25 = v21;
    __int16 v26 = 2112;
    uint64_t v27 = v22;
    __int16 v28 = 2112;
    uint64_t v29 = 0;
    _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: Could not load text representation from pasteboard. Type = %@, resolved type = %@, Error: %@", (uint8_t *)&v24, 0x20u);
  }
  +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", @"PB", [0 code]);
LABEL_23:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)refreshMostRecentPasteboardItemFromNotification:(BOOL)a3 explanationSet:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(PPConnectionsPasteboardSource *)self addressPasteboardTextItemFromNotification:v4];
  [(PPConnectionsPasteboardSource *)self _setMostRecentPasteboardItem:v7];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_init_sem);
  uint64_t v8 = pp_connections_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: initial pasteboard fetch completed", v16, 2u);
  }

  id v9 = (void *)os_transaction_create();
  uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
  id v11 = [(PPConnectionsPasteboardSource *)self _mostRecentPasteboardItem];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10.0];
    uint64_t v13 = [(PPConnectionsPasteboardSource *)self locationItemsWithCriteria:0 earliest:v12 latest:0 limit:1 consumer:0 explanationSet:v6];
    uint64_t v14 = [v13 firstObject];

    uint64_t v15 = [(PPConnectionsSource *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v15 source:self updatedLocation:v14];
    }
  }
}

- (void)_setMostRecentPasteboardItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 memoryFootprintEstimate];
  if (v5 >= 0x4000)
  {
    unint64_t v6 = v5;
    v7 = pp_connections_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = v6;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: dropping pasteboard item because it uses too much memory (estimated footprint %tu)", buf, 0xCu);
    }

    id v4 = 0;
  }
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PPConnectionsPasteboardSource__setMostRecentPasteboardItem___block_invoke;
  v10[3] = &unk_1E65D9928;
  id v11 = v4;
  id v9 = v4;
  [(_PASLock *)lock runWithLockAcquired:v10];
}

void __62__PPConnectionsPasteboardSource__setMostRecentPasteboardItem___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_storeStrong((id *)(a2 + 8), *(id *)(a1 + 32));
  }
}

- (void)dealloc
{
  if (self->_pasteboardObserver)
  {
    dispatch_semaphore_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_pasteboardObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)PPConnectionsPasteboardSource;
  [(PPConnectionsPasteboardSource *)&v4 dealloc];
}

- (PPConnectionsPasteboardSource)init
{
  v23.receiver = self;
  v23.super_class = (Class)PPConnectionsPasteboardSource;
  v2 = [(PPConnectionsPasteboardSource *)&v23 init];
  if (v2)
  {
    id location = 0;
    objc_initWeak(&location, v2);
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    objc_super v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    init_sem = v2->_init_sem;
    v2->_init_sem = (OS_dispatch_semaphore *)v7;

    uint64_t v9 = objc_opt_new();
    pbQueue = v2->_pbQueue;
    v2->_pbQueue = (NSOperationQueue *)v9;

    [(NSOperationQueue *)v2->_pbQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_pbQueue setSuspended:1];
    id v11 = v2->_pbQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __37__PPConnectionsPasteboardSource_init__block_invoke;
    v20[3] = &unk_1E65DC540;
    objc_copyWeak(&v21, &location);
    [(NSOperationQueue *)v11 addOperationWithBlock:v20];
    v2->_pasteboardNotificationState = [MEMORY[0x1E4F881F0] beginListeningToPasteboardChangeNotifications];
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F88238];
    uint64_t v14 = v2->_pbQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__PPConnectionsPasteboardSource_init__block_invoke_12;
    v18[3] = &unk_1E65DA5B0;
    objc_copyWeak(&v19, &location);
    uint64_t v15 = [v12 addObserverForName:v13 object:0 queue:v14 usingBlock:v18];
    id pasteboardObserver = v2->_pasteboardObserver;
    v2->_id pasteboardObserver = (id)v15;

    [(NSOperationQueue *)v2->_pbQueue setSuspended:0];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__PPConnectionsPasteboardSource_init__block_invoke(uint64_t a1)
{
  v2 = pp_connections_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: fetching from pasteboard asynchronously after initialization.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshMostRecentPasteboardItemFromNotification:0 explanationSet:0];
}

void __37__PPConnectionsPasteboardSource_init__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unint64_t v6 = pp_connections_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: handling PBPasteboardChangedNotification", buf, 2u);
    }

    dispatch_semaphore_t v7 = [v3 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F88248]];
    int v9 = [v8 intValue];

    if (WeakRetained[2] != v9)
    {
      WeakRetained[2] = v9;
      uint64_t v10 = (void *)WeakRetained[6];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __37__PPConnectionsPasteboardSource_init__block_invoke_13;
      v11[3] = &unk_1E65DC540;
      objc_copyWeak(&v12, v4);
      [v10 addOperationWithBlock:v11];
      objc_destroyWeak(&v12);
    }
  }
}

void __37__PPConnectionsPasteboardSource_init__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshMostRecentPasteboardItemFromNotification:1 explanationSet:0];
}

+ (PPConnectionsPasteboardSource)sharedInstance
{
  if (sharedInstance_once_18732 != -1) {
    dispatch_once(&sharedInstance_once_18732, &__block_literal_global_18733);
  }
  v2 = (void *)sharedInstance_shared_18734;
  return (PPConnectionsPasteboardSource *)v2;
}

uint64_t __47__PPConnectionsPasteboardSource_sharedInstance__block_invoke()
{
  sharedInstance_shared_18734 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)setTestLocale:(id)a3
{
}

@end
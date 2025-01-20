@interface NMSKeepLocalRequestValidator
- (NMSKeepLocalRequestValidator)initWithItemSize:(unint64_t)a3;
- (NMSKeepLocalRequestValidator)initWithModelObject:(id)a3;
- (id)_predicateForKeepLocalStatusDownloadingOrWaiting;
- (unint64_t)_fetchSizeOfPendingDownloadsWithPowerConstraintCheck:(BOOL)a3;
- (unint64_t)_resolvedValidatorException:(unint64_t)a3 options:(id)a4;
- (void)_continueWithOptions:(id)a3 validatorException:(unint64_t)a4 cellularNetwork:(BOOL)a5 completion:(id)a6;
- (void)_finishWithOptions:(id)a3 validatorException:(unint64_t)a4 constraints:(unint64_t)a5 error:(id)a6 completion:(id)a7;
- (void)performWithOptions:(id)a3 completion:(id)a4;
@end

@implementation NMSKeepLocalRequestValidator

- (NMSKeepLocalRequestValidator)initWithModelObject:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    uint64_t v27 = (uint64_t)v4;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] _fetchSizeOfModelObjectItems - (begin) model-object: %@", (uint8_t *)&v26, 0xCu);
  }

  v6 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  v7 = (void *)MEMORY[0x263EFFA08];
  v8 = NSNumber;
  v9 = [v4 originalIdentifierSet];
  v10 = [v9 library];
  v11 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v10, "persistentID"));
  v12 = [v7 setWithObject:v11];

  v13 = (void *)MEMORY[0x263F573F8];
  v14 = (void *)MEMORY[0x263F57420];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v16 = (void *)MEMORY[0x263F573A8];
  if ((isKindOfClass & 1) == 0) {
    v16 = (void *)MEMORY[0x263F573B0];
  }
  v17 = [v14 predicateWithProperty:*v16 values:v12];
  v30[0] = v17;
  v18 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57380] value:&unk_26D51CF68 comparison:2];
  v30[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  v20 = [v13 predicateMatchingPredicates:v19];

  v21 = [MEMORY[0x263F57470] allItemsQueryWithLibrary:v6 predicate:v20 orderingTerms:0 usingSections:0];
  uint64_t v22 = _aggregatedFetchOfFileSizeForQuery(v21, v6);
  v23 = NMLogForCategory(5);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134218242;
    uint64_t v27 = v22;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_2228FD000, v23, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] _fetchSizeOfModelObjectItems (finish) - size: %llu for model-object: %@", (uint8_t *)&v26, 0x16u);
  }

  v24 = [(NMSKeepLocalRequestValidator *)self initWithItemSize:v22];
  return v24;
}

- (NMSKeepLocalRequestValidator)initWithItemSize:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NMSKeepLocalRequestValidator;
  id v4 = [(NMSKeepLocalRequestValidator *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_itemSize = a3;
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    validationQueue = v5->_validationQueue;
    v5->_validationQueue = v6;

    [(NSOperationQueue *)v5->_validationQueue setName:@"com.apple.NanoMusicSync.KeepLocalRequestValidator"];
  }
  return v5;
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F086D0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke;
  v12[3] = &unk_264633C68;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [v8 blockOperationWithBlock:v12];
  objc_msgSend(v11, "setQualityOfService:", objc_msgSend(v10, "qualityOfService"));
  [(NSOperationQueue *)self->_validationQueue addOperation:v11];
}

void __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v2 = [MEMORY[0x263F89110] sharedMonitor];
  uint64_t v3 = [v2 networkType];

  int IsCellular = ICEnvironmentNetworkTypeIsCellular();
  v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v3;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] Current network connection type: %ld.", buf, 0xCu);
  }

  if (v3)
  {
    if (IsCellular)
    {
      id v6 = objc_alloc(MEMORY[0x263F02D30]);
      intptr_t v7 = [a1[5] qualityOfService];
      if ((unint64_t)(v7 + 1) > 0x22 || ((1 << (v7 + 1)) & 0x404040400) == 0) {
        intptr_t v7 = 0;
      }
      v8 = dispatch_get_global_queue(v7, 0);
      id v9 = (void *)[v6 initWithQueue:v8];

      id v10 = [a1[5] cellularBundleIdentifier];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_24;
      v12[3] = &unk_2646342B0;
      id v11 = a1[5];
      v12[4] = a1[4];
      id v13 = v11;
      v15 = &v17;
      id v14 = a1[6];
      char v16 = IsCellular;
      [v9 performNetworkAccessFlowIfAllowed:v10 ignoreForeground:0 completion:v12];
    }
    else
    {
      [a1[4] _continueWithOptions:a1[5] validatorException:v18[3] cellularNetwork:0 completion:a1[6]];
    }
  }
  else
  {
    [a1[4] _finishWithOptions:a1[5] validatorException:16 constraints:0 error:0 completion:a1[6]];
  }
  _Block_object_dispose(&v17, 8);
}

void __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    if ([a2 cellular])
    {
      intptr_t v7 = [MEMORY[0x263F120E8] sharedNetworkObserver];
      char v8 = [v7 isMusicCellularDownloadingAllowed];

      if (v8)
      {
LABEL_10:
        [*(id *)(a1 + 32) _continueWithOptions:*(void *)(a1 + 40) validatorException:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) cellularNetwork:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 48)];
        goto LABEL_11;
      }
      uint64_t v9 = 8;
    }
    else
    {
      uint64_t v9 = 64;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v9;
    goto LABEL_10;
  }
  id v6 = NMLogForCategory(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_24_cold_1((uint64_t)v5, v6);
  }

  [*(id *)(a1 + 32) _finishWithOptions:*(void *)(a1 + 40) validatorException:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) constraints:0 error:v5 completion:*(void *)(a1 + 48)];
LABEL_11:
}

- (void)_continueWithOptions:(id)a3 validatorException:(unint64_t)a4 cellularNetwork:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = (void *)MEMORY[0x263F11F38];
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_msgSend(v10, "nms_defaultKeepLocalConstraints");
  unint64_t itemSize = self->_itemSize;
  unint64_t v33 = [(NMSKeepLocalRequestValidator *)self _fetchSizeOfPendingDownloadsWithPowerConstraintCheck:0];
  unint64_t v15 = [(NMSKeepLocalRequestValidator *)self _fetchSizeOfPendingDownloadsWithPowerConstraintCheck:1];
  char v16 = [MEMORY[0x263F89110] sharedMonitor];
  int v17 = [v16 isCharging];

  v18 = NMLogForCategory(5);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = @"Off-charger";
    *(_DWORD *)buf = 134218754;
    unint64_t v35 = v15;
    uint64_t v20 = 499999999;
    if (v6) {
      uint64_t v20 = 99999999;
    }
    if (v17) {
      uint64_t v19 = @"On-charger";
    }
    __int16 v36 = 2048;
    unint64_t v37 = itemSize;
    __int16 v38 = 2048;
    uint64_t v39 = v20 + 1;
    __int16 v40 = 2112;
    v41 = v19;
    _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] There are presently %llu bytes pending download off charger. The current model-object size is %llu bytes. The current pending threshold has a max of %llu bytes. The watch charging state is: %@", buf, 0x2Au);
  }

  unint64_t v21 = v15 + itemSize;
  unint64_t v22 = a4 | 4;
  if (v17) {
    unint64_t v23 = v13 & 0xFFFFFFFFFFFFFFFDLL;
  }
  else {
    unint64_t v23 = v13;
  }
  if (v17) {
    unint64_t v22 = a4;
  }
  if (!v6)
  {
    unint64_t v23 = v13;
    unint64_t v22 = a4;
  }
  if (v21 > 0x5F5E0FF) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = v13 & 0xFFFFFFFFFFFFFFFDLL;
  }
  if (v21 > 0x5F5E0FF) {
    unint64_t v25 = v22;
  }
  else {
    unint64_t v25 = a4;
  }
  int v26 = [MEMORY[0x263F89308] sharedManager];
  uint64_t v27 = [v26 storageSpaceAvailable];

  __int16 v28 = NMLogForCategory(5);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v35 = v33 + itemSize;
    __int16 v36 = 2048;
    unint64_t v37 = v27;
    _os_log_impl(&dword_2228FD000, v28, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] Calculated size(pending+new item): %llu with available storage of: %llu.", buf, 0x16u);
  }
  uint64_t v29 = v25 | 2;
  if (v17) {
    uint64_t v29 = v25;
  }
  if (v21 <= 0x1DCD64FF) {
    uint64_t v30 = v25;
  }
  else {
    uint64_t v30 = v29;
  }
  if (v21 <= 0x1DCD64FF) {
    unint64_t v31 = v24 & 0xFFFFFFFFFFFFFFFBLL;
  }
  else {
    unint64_t v31 = v24;
  }

  if (v27 - v33 >= 0x6ACFC1) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = v30 | 0x20;
  }
  [(NMSKeepLocalRequestValidator *)self _finishWithOptions:v12 validatorException:v32 constraints:v31 error:0 completion:v11];
}

- (void)_finishWithOptions:(id)a3 validatorException:(unint64_t)a4 constraints:(unint64_t)a5 error:(id)a6 completion:(id)a7
{
  v30[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = (void (**)(id, uint64_t, void *))a7;
  if (v13)
  {
    unint64_t v15 = NMLogForCategory(5);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NMSKeepLocalRequestValidator _finishWithOptions:validatorException:constraints:error:completion:]((uint64_t)v13, v15);
    }

    char v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08608];
    v30[0] = v13;
    int v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v18 = [v16 errorWithDomain:@"NMSKeepLocalRequestErrorDomain" code:0 userInfo:v17];
    uint64_t v19 = v13;
  }
  else
  {
    unint64_t v20 = [(NMSKeepLocalRequestValidator *)self _resolvedValidatorException:a4 options:v12];
    if (!v20)
    {
      v18 = 0;
      goto LABEL_10;
    }
    uint64_t v21 = v20;
    unint64_t v22 = NMLogForCategory(5);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = NMSKeepLocalRequestValidatorExceptionString(v21);
      *(_DWORD *)buf = 138412290;
      __int16 v28 = v23;
      _os_log_impl(&dword_2228FD000, v22, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] Cannot proceed with KeepLocal request due to validatorException: %@", buf, 0xCu);
    }
    unint64_t v24 = (void *)MEMORY[0x263F087E8];
    int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v21, @"NMSKeepLocalRequestErrorValidatorExceptionKey");
    int v26 = v17;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v18 = [v24 errorWithDomain:@"NMSKeepLocalRequestErrorDomain" code:1 userInfo:v19];
  }

LABEL_10:
  v14[2](v14, [v12 resolvedConstraints:a5], v18);
}

- (unint64_t)_resolvedValidatorException:(unint64_t)a3 options:(id)a4
{
  if ([a4 powerPolicy]) {
    return a3 & 0xFFFFFFFFFFFFFFF9;
  }
  else {
    return a3;
  }
}

- (id)_predicateForKeepLocalStatusDownloadingOrWaiting
{
  v10[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F57400];
  uint64_t v3 = *MEMORY[0x263F57380];
  id v4 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57380] value:&unk_26D51CEF0 comparison:1];
  id v5 = objc_msgSend(MEMORY[0x263F57410], "predicateWithProperty:value:comparison:", v3, &unk_26D51CF08, 1, v4);
  v10[1] = v5;
  BOOL v6 = [MEMORY[0x263F57410] predicateWithProperty:v3 value:&unk_26D51CF20 comparison:1];
  v10[2] = v6;
  intptr_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];
  char v8 = [v2 predicateMatchingPredicates:v7];

  return v8;
}

- (unint64_t)_fetchSizeOfPendingDownloadsWithPowerConstraintCheck:(BOOL)a3
{
  BOOL v3 = a3;
  v55[2] = *MEMORY[0x263EF8340];
  id v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      BOOL v6 = @"YES";
    }
    else {
      BOOL v6 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v48 = (uint64_t)v6;
    __int16 v49 = 2112;
    v50 = self;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] (begin) _fetchSizeOfPendingDownloadsWithPowerConstraintCheck - checkConstraint: %@ - self: %@", buf, 0x16u);
  }

  v44 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  BOOL v41 = v3;
  if (v3)
  {
    intptr_t v7 = (void *)MEMORY[0x263F573F8];
    char v8 = (void *)MEMORY[0x263F57458];
    uint64_t v9 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57348] value:&unk_26D51CF38 comparison:10];
    id v10 = [v8 predicateWithPredicate:v9];
    v55[0] = v10;
    id v11 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57340] equalToInt64:1];
    v55[1] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    uint64_t v13 = [v7 predicateMatchingPredicates:v12];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57340] equalToInt64:1];
  }
  v43 = (void *)v13;
  id v14 = [MEMORY[0x263F57418] allItemsQueryWithLibrary:v44 predicate:v13 orderingTerms:0 usingSections:0];
  unint64_t v15 = [MEMORY[0x263EFF9C0] set];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __85__NMSKeepLocalRequestValidator__fetchSizeOfPendingDownloadsWithPowerConstraintCheck___block_invoke;
  v45[3] = &unk_2646342D8;
  char v16 = v15;
  v46 = v16;
  uint64_t v42 = v14;
  [v14 enumeratePersistentIDsUsingBlock:v45];
  int v17 = NMLogForCategory(5);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [(NMSKeepLocalRequestValidator *)v16 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v48 = v18;
    __int16 v49 = 2112;
    v50 = v16;
    _os_log_impl(&dword_2228FD000, v17, OS_LOG_TYPE_INFO, "[NMSKeepLocalRequestValidator] _fetchSizeOfPendingDownloadsWithPowerConstraintCheck - containerIDs count: %lu - %@", buf, 0x16u);
  }

  uint64_t v19 = (void *)MEMORY[0x263F573F8];
  unint64_t v20 = [MEMORY[0x263F57420] predicateWithProperty:*MEMORY[0x263F573B0] values:v16];
  v54[0] = v20;
  [(NMSKeepLocalRequestValidator *)self _predicateForKeepLocalStatusDownloadingOrWaiting];
  uint64_t v21 = v40 = self;
  v54[1] = v21;
  unint64_t v22 = (void *)MEMORY[0x263F57458];
  unint64_t v23 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57378] equalToInt64:-1];
  unint64_t v24 = [v22 predicateWithPredicate:v23];
  v54[2] = v24;
  uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:3];
  int v26 = [v19 predicateMatchingPredicates:v25];

  uint64_t v27 = [MEMORY[0x263F57470] allItemsQueryWithLibrary:v44 predicate:v26 orderingTerms:0 usingSections:0];
  uint64_t v28 = _aggregatedFetchOfFileSizeForQuery(v27, v44);
  uint64_t v29 = (void *)MEMORY[0x263F573F8];
  v53[0] = v26;
  uint64_t v30 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F573D8] value:&unk_26D51CF50 comparison:1];
  v53[1] = v30;
  unint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
  uint64_t v32 = [v29 predicateMatchingPredicates:v31];

  unint64_t v33 = (void *)MEMORY[0x263F57470];
  v34 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  unint64_t v35 = [v33 allItemsQueryWithLibrary:v34 predicate:v32 orderingTerms:0 usingSections:0];

  unint64_t v36 = v28 + 7000000 * [v35 countOfEntities];
  unint64_t v37 = NMLogForCategory(5);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v38 = @"NO";
    if (v41) {
      __int16 v38 = @"YES";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v48 = (uint64_t)v38;
    __int16 v49 = 2048;
    v50 = (NMSKeepLocalRequestValidator *)v36;
    __int16 v51 = 2112;
    v52 = v40;
    _os_log_impl(&dword_2228FD000, v37, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] (finished) _fetchSizeOfPendingDownloadsWithPowerConstraintCheck - checkConstraint: %@ - total size in bytes: %llu - self: %@", buf, 0x20u);
  }

  return v36;
}

void __85__NMSKeepLocalRequestValidator__fetchSizeOfPendingDownloadsWithPowerConstraintCheck___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (void).cxx_destruct
{
}

void __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "[NMSKeepLocalRequestValidator] Failed to get cellular policy. Error: %@.", (uint8_t *)&v2, 0xCu);
}

- (void)_finishWithOptions:(uint64_t)a1 validatorException:(NSObject *)a2 constraints:error:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "[NMSKeepLocalRequestValidator] Cannot proceed with KeepLocal request due to error: %@", (uint8_t *)&v2, 0xCu);
}

@end
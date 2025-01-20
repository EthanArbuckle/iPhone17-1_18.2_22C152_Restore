@interface PKDiagnostics
+ (id)_allPasses;
+ (id)_metadataForCardAtURL:(id)a3;
+ (id)_secureElementData;
+ (id)generateUbiquityDiagnosticsFile:(BOOL)a3;
+ (void)_createDiagnosticJsonWithDictionary:(id)a3 hasLibrary:(BOOL)a4 completion:(id)a5;
+ (void)generateDiagnosticsPackageWithPassLibrary:(BOOL)a3 completion:(id)a4;
+ (void)generateZippedDiagnosticsPackageWithPassLibrary:(BOOL)a3 completion:(id)a4;
+ (void)saveTransitState:(id)a3 forPaymentApplication:(id)a4;
@end

@implementation PKDiagnostics

+ (void)generateDiagnosticsPackageWithPassLibrary:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke;
  v8[3] = &unk_1E56D8680;
  BOOL v10 = a3;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:&unk_1EE22C0B0 forKey:@"diagnosticsVersion"];
  if (*(unsigned char *)(a1 + 40))
  {
    v3 = +[PKDiagnostics _allPasses];
    [v2 setObject:v3 forKey:@"passes"];
  }
  if (PKSecureElementIsAvailable())
  {
    v4 = +[PKDiagnostics _secureElementData];
    [v2 setObject:v4 forKey:@"secureElement"];
  }
  id v5 = PKCurrentRegion();
  [v2 setObject:v5 forKey:@"PKCurrentRegion"];

  v6 = objc_alloc_init(PKPaymentService);
  id v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_38;
  v32[3] = &unk_1E56E9040;
  id v8 = v2;
  id v33 = v8;
  [(PKAsyncUnaryOperationComposer *)v7 addOperation:v32];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_3;
  v29[3] = &unk_1E56E1DD0;
  id v9 = v6;
  v30 = v9;
  id v10 = v8;
  id v31 = v10;
  [(PKAsyncUnaryOperationComposer *)v7 addOperation:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_5;
  v27[3] = &unk_1E56E9040;
  id v11 = v10;
  id v28 = v11;
  [(PKAsyncUnaryOperationComposer *)v7 addOperation:v27];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_7;
  v24[3] = &unk_1E56E1DD0;
  v25 = v9;
  id v12 = v11;
  id v26 = v12;
  v13 = v9;
  [(PKAsyncUnaryOperationComposer *)v7 addOperation:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_9;
  v22[3] = &unk_1E56E9040;
  id v14 = v12;
  id v23 = v14;
  [(PKAsyncUnaryOperationComposer *)v7 addOperation:v22];
  v15 = [MEMORY[0x1E4F1CA98] null];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_12;
  v18[3] = &unk_1E56ED360;
  id v19 = v14;
  char v21 = *(unsigned char *)(a1 + 40);
  id v20 = *(id *)(a1 + 32);
  id v16 = v14;
  id v17 = [(PKAsyncUnaryOperationComposer *)v7 evaluateWithInput:v15 completion:v18];
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_38(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = +[PKAccountService sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_2;
  v14[3] = &unk_1E56ED270;
  id v15 = v8;
  id v10 = *(id *)(a1 + 32);
  id v17 = v6;
  id v18 = v7;
  id v16 = v10;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  [v9 accountsWithCompletion:v14];
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v9 = [v7 accountIdentifier];
        if (v9)
        {
          [v8 setObject:v9 forKeyedSubscript:@"identifier"];
        }
        else
        {
          id v10 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v10 forKeyedSubscript:@"identifier"];
        }
        id v11 = PKFeatureIdentifierToString([v7 feature]);
        if (v11)
        {
          [v8 setObject:v11 forKeyedSubscript:@"feature"];
        }
        else
        {
          id v12 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v12 forKeyedSubscript:@"feature"];
        }
        id v13 = PKAccountTypeToString([v7 type]);
        if (v13)
        {
          [v8 setObject:v13 forKeyedSubscript:@"type"];
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v14 forKeyedSubscript:@"type"];
        }
        id v15 = PKAccountStateToString([v7 state]);
        if (v15)
        {
          [v8 setObject:v15 forKeyedSubscript:@"state"];
        }
        else
        {
          id v16 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v16 forKeyedSubscript:@"state"];
        }
        id v17 = [v7 accountBaseURL];
        id v18 = [v17 absoluteString];
        if (v18)
        {
          [v8 setObject:v18 forKeyedSubscript:@"accountBaseURL"];
        }
        else
        {
          id v19 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v19 forKeyedSubscript:@"accountBaseURL"];
        }
        [*(id *)(a1 + 32) addObject:v8];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 40) setObject:*(void *)(a1 + 32) forKey:@"accounts"];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_4;
  v14[3] = &unk_1E56ED298;
  id v15 = v8;
  id v9 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v7;
  id v16 = v10;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  [v9 featureApplicationsWithCompletion:v14];
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v9 = [v7 applicationIdentifier];
        if (v9)
        {
          [v8 setObject:v9 forKeyedSubscript:@"identifier"];
        }
        else
        {
          id v10 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v10 forKeyedSubscript:@"identifier"];
        }
        id v11 = PKFeatureIdentifierToString([v7 feature]);
        if (v11)
        {
          [v8 setObject:v11 forKeyedSubscript:@"feature"];
        }
        else
        {
          id v12 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v12 forKeyedSubscript:@"feature"];
        }
        id v13 = PKFeatureApplicationStateToString([v7 applicationState]);
        if (v13)
        {
          [v8 setObject:v13 forKeyedSubscript:@"state"];
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v14 forKeyedSubscript:@"state"];
        }
        id v15 = PKFeatureApplicationStateReasonToString([v7 applicationStateReason]);
        if (v15)
        {
          [v8 setObject:v15 forKeyedSubscript:@"stateReason"];
        }
        else
        {
          id v16 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v16 forKeyedSubscript:@"stateReason"];
        }
        if ([v7 applicationStateReason]) {
          uint64_t v17 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v17 = MEMORY[0x1E4F1CC28];
        }
        [v8 setObject:v17 forKeyedSubscript:@"stateDirty"];
        id v18 = [v7 coreIDVServiceProviderName];
        if (v18)
        {
          [v8 setObject:v18 forKeyedSubscript:@"coreIDVServiceProviderName"];
        }
        else
        {
          id v19 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v19 forKeyedSubscript:@"coreIDVServiceProviderName"];
        }
        [*(id *)(a1 + 32) addObject:v8];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 40) setObject:*(void *)(a1 + 32) forKey:@"applications"];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PKPassLibrary sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_6;
  v12[3] = &unk_1E56ED2C0;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v7;
  id v13 = v9;
  id v10 = v6;
  id v11 = v7;
  [v8 spotlightStatusWithCompletion:v12];
}

uint64_t __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_6(uint64_t a1, __CFString *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = @"Error retrieving diagnostics";
  }
  [v3 setObject:v4 forKey:@"spotlight"];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_8;
  v12[3] = &unk_1E56ED2E8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v7;
  id v13 = v9;
  id v10 = v6;
  id v11 = v7;
  [v8 generateUnderlyingKeyReportWithCompletion:v12];
}

uint64_t __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_8(uint64_t a1, __CFString *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = @"Error retrieving diagnostics";
  }
  [v3 setObject:v4 forKey:@"underlyingKeys"];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(PKSearchService);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_10;
  v13[3] = &unk_1E56ED338;
  id v14 = v8;
  id v9 = *(id *)(a1 + 32);
  id v16 = v6;
  id v17 = v7;
  id v15 = v9;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  [(PKSearchService *)v12 transactionsMissingRegionsWithCompletion:v13];
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_11;
    v7[3] = &unk_1E56ED310;
    id v8 = v5;
    id v6 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    [*(id *)(a1 + 40) setObject:v6 forKey:@"transactionsMissingRegions"];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 description];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

uint64_t __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_12(uint64_t a1)
{
  return +[PKDiagnostics _createDiagnosticJsonWithDictionary:*(void *)(a1 + 32) hasLibrary:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

+ (void)generateZippedDiagnosticsPackageWithPassLibrary:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PKDiagnostics_generateZippedDiagnosticsPackageWithPassLibrary_completion___block_invoke;
  v7[3] = &unk_1E56ED388;
  id v8 = v5;
  id v6 = v5;
  +[PKDiagnostics generateDiagnosticsPackageWithPassLibrary:v4 completion:v7];
}

void __76__PKDiagnostics_generateZippedDiagnosticsPackageWithPassLibrary_completion___block_invoke(uint64_t a1, NSURL *a2)
{
  if (a2)
  {
    PKArchiverZipData(a2);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = NSString;
    BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSince1970];
    id v6 = objc_msgSend(v3, "stringWithFormat:", @"WalletDiagnostics-%f.zip", v5);

    id v7 = PKLibraryDirectoryPath();
    id v8 = [v7 stringByAppendingPathComponent:@"Logs/CrashReporter/DiagnosticLogs/Wallet"];

    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    id v10 = [v8 stringByAppendingPathComponent:v6];
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 createFileAtPath:v10 contents:v14 attributes:0];

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

+ (id)generateUbiquityDiagnosticsFile:(BOOL)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v4 URLForUbiquityContainerIdentifier:@"com.apple.shoebox"];
  if (!v5)
  {
    id v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Could not resolve ubiquity container. This may be a bug.", buf, 2u);
    }
  }
  id v7 = [v5 URLByAppendingPathComponent:@"UbiquitousCards"];

  if (v7)
  {
    id v8 = [v7 path];
    id v9 = [v4 contentsOfDirectoryAtPath:v8 error:0];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v16 hasSuffix:@".pkpass"]) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v13);
  }

  id v17 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v10 count])
  {
    [v17 appendString:@"\n-------\n\n"];
    objc_msgSend(v17, "appendFormat:", @"Passes count: %lu \n", objc_msgSend(v10, "count"));
    id v18 = [v7 path];
    [v17 appendFormat:@"Passes path: %@ \n", v18];

    [v17 appendString:@"\n-------\n\n"];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__PKDiagnostics_generateUbiquityDiagnosticsFile___block_invoke;
    v25[3] = &unk_1E56ED3B0;
    id v26 = v17;
    id v27 = v7;
    id v28 = a1;
    BOOL v29 = a3;
    [v10 enumerateObjectsUsingBlock:v25];
  }
  else
  {
    [v17 appendString:@"No passes"];
  }
  id v19 = NSTemporaryDirectory();
  id v20 = [v19 stringByAppendingPathComponent:@"wallet_ubiquity.txt"];

  long long v21 = [v17 dataUsingEncoding:4];
  [v4 createFileAtPath:v20 contents:v21 attributes:0];

  long long v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20];

  return v22;
}

void __49__PKDiagnostics_generateUbiquityDiagnosticsFile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 appendFormat:@"%@ \n", v4];
  id v17 = [*(id *)(a1 + 40) URLByAppendingPathComponent:v4];

  uint64_t v5 = [*(id *)(a1 + 48) _metadataForCardAtURL:v17];
  id v6 = v5;
  id v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    id v8 = [v5 debugDescription];
    [v7 appendFormat:@"\t %@ \n", v8];
  }
  else
  {
    id v9 = [v5 objectForKey:@"serialNumber"];
    [v7 appendFormat:@"\t Serial Number: %@ \n", v9];

    id v10 = *(void **)(a1 + 32);
    id v11 = [v6 objectForKey:@"passTypeIdentifier"];
    [v10 appendFormat:@"\t Path Type Identifier: %@ \n", v11];

    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v6 objectForKey:@"description"];
    [v12 appendFormat:@"\t Description: %@ \n", v13];

    uint64_t v14 = *(void **)(a1 + 32);
    id v15 = [v6 objectForKey:@"organizationName"];
    [v14 appendFormat:@"\t Organization Name: %@ \n", v15];

    id v16 = *(void **)(a1 + 32);
    id v8 = [v6 objectForKey:@"expirationDate"];
    [v16 appendFormat:@"\t Expiration Date: %@ \n", v8];
  }

  [*(id *)(a1 + 32) appendString:@"\n"];
}

+ (id)_secureElementData
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v18 = objc_alloc_init(PKSecureElement);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v2 = [(PKSecureElement *)v18 secureElementIdentifiers];
  [v19 setObject:v2 forKey:@"seid"];

  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[PKSecureElement isProductionSigned](v18, "isProductionSigned"));
  [v19 setObject:v3 forKey:@"prodSigned"];

  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PKSecureElement isInRestrictedMode](v18, "isInRestrictedMode"));
  [v19 setObject:v4 forKey:@"restrictedMode"];

  uint64_t v5 = [(PKSecureElement *)v18 primaryRegionTopic];
  [v19 setObject:v5 forKey:@"primaryRegionTopic"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__50;
  long long v31 = __Block_byref_object_dispose__50;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __35__PKDiagnostics__secureElementData__block_invoke;
  v24[3] = &unk_1E56DD778;
  id v26 = &v27;
  dispatch_semaphore_t dsema = v7;
  dispatch_semaphore_t v25 = dsema;
  [(PKSecureElement *)v18 allAppletsWithCompletion:v24];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = (id)v28[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v33 = @"state";
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "lifecycleState"));
        v34 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v15 = [v12 identifier];
        [v6 setObject:v14 forKey:v15];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v35 count:16];
    }
    while (v9);
  }

  [v19 setObject:v6 forKey:@"applets"];
  _Block_object_dispose(&v27, 8);

  return v19;
}

void __35__PKDiagnostics__secureElementData__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_allPasses
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = PKHomeDirectoryPath();
  id v4 = [v3 stringByAppendingPathComponent:@"Cards"];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v5 contentsOfDirectoryAtPath:v4 error:0];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "pathExtension", (void)v20);
        int v14 = [v13 isEqualToString:@"pkpass"];

        if (v14)
        {
          id v15 = [v4 stringByAppendingPathComponent:v12];
          id v16 = [v15 stringByAppendingPathComponent:@"pass.json"];

          id v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v16];
          id v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:0];
          [v2 addObject:v18];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v2;
}

+ (id)_metadataForCardAtURL:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  uint64_t v5 = [v3 defaultManager];
  id v6 = [v4 URLByAppendingPathComponent:@"pass.json" isDirectory:0];

  id v7 = [v6 path];

  uint64_t v8 = 0;
  if ([v5 fileExistsAtPath:v7 isDirectory:0])
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:4 error:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

+ (void)saveTransitState:(id)a3 forPaymentApplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKDiagnostics_saveTransitState_forPaymentApplication___block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __56__PKDiagnostics_saveTransitState_forPaymentApplication___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v22 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v22];
  id v4 = v22;
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v5 setLocale:v6];

    [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    id v7 = PKPaymentNetworkNameForPaymentCredentialType([*(id *)(a1 + 40) paymentNetworkIdentifier]);
    if (v7)
    {
      uint64_t v8 = PKSharedCacheDirectoryPath();
      id v9 = [v8 stringByAppendingPathComponent:@"TransitState"];

      id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v21 = 0;
      int v11 = [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v21];
      id v12 = v21;
      id v13 = v12;
      if (v11)
      {
        id v20 = v12;
        id v14 = NSString;
        id v15 = [*(id *)(a1 + 40) applicationIdentifier];
        id v16 = [v5 stringFromDate:*(void *)(a1 + 48)];
        id v17 = [v14 stringWithFormat:@"%@_%@_%@.state", v7, v15, v16];

        id v18 = [v9 stringByAppendingPathComponent:v17];
        [v10 createFileAtPath:v18 contents:v3 attributes:0];
        id v19 = PKLogFacilityTypeGetObject(0xCuLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v18;
          _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Saved transit state to %@", buf, 0xCu);
        }

        id v13 = v20;
      }
    }
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Unable to archive transit state. Error %@", buf, 0xCu);
    }
  }
}

+ (void)_createDiagnosticJsonWithDictionary:(id)a3 hasLibrary:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = NSString;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = (void (**)(id, void *))a5;
  id v10 = a3;
  int v11 = [v8 date];
  [v11 timeIntervalSince1970];
  objc_msgSend(v7, "stringWithFormat:", @"WalletDiagnostics-%f", v12);
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  id v13 = NSTemporaryDirectory();
  id v14 = [v13 stringByAppendingPathComponent:v32];

  id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v15 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:0];

  id v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:1 error:0];

  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = [v14 stringByAppendingPathComponent:@"diagnostics.json"];
  [v17 createFileAtPath:v18 contents:v16 attributes:0];

  if (v5)
  {
    id v19 = PKHomeDirectoryPath();
    id v20 = [v19 stringByAppendingPathComponent:@"passes23.sqlite"];

    id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = [v14 stringByAppendingPathComponent:@"passes.sqlite"];
    [v21 copyItemAtPath:v20 toPath:v22 error:0];
  }
  long long v23 = PKPayLaterFinancingPlanUpdatesDirectory();
  id v24 = [v23 path];

  uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v26 = [v25 fileExistsAtPath:v24];

  if (v26)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24];
    id v28 = PKArchiverZipData(v27);

    uint64_t v29 = [v14 stringByAppendingPathComponent:@"PayLaterPlanUpdates.zip"];
    long long v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v30 createFileAtPath:v29 contents:v28 attributes:0];
  }
  long long v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
  v9[2](v9, v31);
}

@end
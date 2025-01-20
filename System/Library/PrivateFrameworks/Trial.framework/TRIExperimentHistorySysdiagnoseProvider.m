@interface TRIExperimentHistorySysdiagnoseProvider
+ (id)defaultProvider;
- (NSError)xpcError;
- (TRIXPCStatusServiceProtocol)syncStatusProvider;
- (id)_allHistoryRecordsWithError:(id *)a3;
- (id)_experimentHistoryRecordsForEnvironment:(int)a3 error:(id *)a4;
- (id)filename;
- (id)initIncompleteProvider;
- (id)sysdiagnoseLinesWithError:(id *)a3;
- (void)setSyncStatusProvider:(id)a3;
- (void)setXpcError:(id)a3;
@end

@implementation TRIExperimentHistorySysdiagnoseProvider

- (id)initIncompleteProvider
{
  v3.receiver = self;
  v3.super_class = (Class)TRIExperimentHistorySysdiagnoseProvider;
  return [(TRIExperimentHistorySysdiagnoseProvider *)&v3 init];
}

+ (id)defaultProvider
{
  id v2 = [[TRIExperimentHistorySysdiagnoseProvider alloc] initIncompleteProvider];
  objc_initWeak(&location, v2);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __58__TRIExperimentHistorySysdiagnoseProvider_defaultProvider__block_invoke;
  v9 = &unk_1E596BAD8;
  objc_copyWeak(&v10, &location);
  objc_super v3 = (void *)MEMORY[0x19F3AD290](&v6);
  v4 = +[TRIAllocationStatus syncProxyWithErrorHandler:](TRIAllocationStatus, "syncProxyWithErrorHandler:", v3, v6, v7, v8, v9);
  [v2 setSyncStatusProvider:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v2;
}

void __58__TRIExperimentHistorySysdiagnoseProvider_defaultProvider__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setXpcError:v5];
  }
}

- (id)filename
{
  return @"trial-experiment-history.log";
}

- (id)sysdiagnoseLinesWithError:(id *)a3
{
  objc_super v3 = [(TRIExperimentHistorySysdiagnoseProvider *)self _allHistoryRecordsWithError:a3];
  if (v3)
  {
    v4 = +[TRISysdiagnoseOutputFormatter formatRecords:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_allHistoryRecordsWithError:(id *)a3
{
  id v5 = [(TRIExperimentHistorySysdiagnoseProvider *)self _experimentHistoryRecordsForEnvironment:0 error:a3];
  if (!v5)
  {
    v9 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = [(TRIExperimentHistorySysdiagnoseProvider *)self _experimentHistoryRecordsForEnvironment:2 error:a3];
  if (v6)
  {
    uint64_t v7 = [(TRIExperimentHistorySysdiagnoseProvider *)self _experimentHistoryRecordsForEnvironment:3 error:a3];
    if (!v7) {
      goto LABEL_9;
    }
    v8 = [(TRIExperimentHistorySysdiagnoseProvider *)self xpcError];

    if (!v8)
    {
      id v10 = objc_opt_new();
      [v10 addObjectsFromArray:v5];
      [v10 addObjectsFromArray:v6];
      [v10 addObjectsFromArray:v7];
      v9 = (void *)[v10 copy];

      goto LABEL_11;
    }
    if (a3)
    {
      [(TRIExperimentHistorySysdiagnoseProvider *)self xpcError];
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:
      v9 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

LABEL_13:
  return v9;
}

- (id)_experimentHistoryRecordsForEnvironment:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  id v16 = 0;
  uint64_t v6 = [(TRIExperimentHistorySysdiagnoseProvider *)self syncStatusProvider];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__TRIExperimentHistorySysdiagnoseProvider__experimentHistoryRecordsForEnvironment_error___block_invoke;
  v10[3] = &unk_1E596BB00;
  v10[4] = &v11;
  v10[5] = &v17;
  [v6 experimentHistoryRecordsWithLimit:0x7FFFFFFFFFFFFFFFLL newerThanDate:v7 privacyFilterPolicy:1 deploymentEnvironment:v5 completion:v10];

  if (a4) {
    *a4 = (id) v12[5];
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __89__TRIExperimentHistorySysdiagnoseProvider__experimentHistoryRecordsForEnvironment_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v13 = v7;
  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = v7;
    id v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [a3 copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (TRIXPCStatusServiceProtocol)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (void)setSyncStatusProvider:(id)a3
{
}

- (NSError)xpcError
{
  return self->_xpcError;
}

- (void)setXpcError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcError, 0);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
}

@end
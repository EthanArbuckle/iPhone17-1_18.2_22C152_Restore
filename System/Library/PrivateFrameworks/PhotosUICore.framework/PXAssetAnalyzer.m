@interface PXAssetAnalyzer
- (BOOL)canAnalyzeAsset:(id)a3 forWorkerType:(int64_t)a4;
- (PXAssetAnalyzer)init;
- (id)_keyForAssetUUID:(id)a3 forWorkerType:(int64_t)a4;
- (void)_handleResultForRequest:(id)a3 success:(BOOL)a4;
- (void)analyzeAsset:(id)a3 forWorkerType:(int64_t)a4;
@end

@implementation PXAssetAnalyzer

- (void).cxx_destruct
{
}

- (id)_keyForAssetUUID:(id)a3 forWorkerType:(int64_t)a4
{
  return (id)objc_msgSend(a3, "stringByAppendingFormat:", @"-%ld", a4);
}

- (void)_handleResultForRequest:(id)a3 success:(BOOL)a4
{
  id v5 = a3;
  v6 = [v5 asset];
  id v9 = [v6 uuid];

  uint64_t v7 = [v5 workerType];
  v8 = [(PXAssetAnalyzer *)self _keyForAssetUUID:v9 forWorkerType:v7];
  [(NSMutableDictionary *)self->_analyzerUUIDToRequest removeObjectForKey:v8];
}

- (void)analyzeAsset:(id)a3 forWorkerType:(int64_t)a4
{
  id v4 = a3;
  px_dispatch_on_main_queue();
}

void __46__PXAssetAnalyzer_analyzeAsset_forWorkerType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [v2 _keyForAssetUUID:v3 forWorkerType:*(void *)(a1 + 48)];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v4];
  if (!v5)
  {
    if ([*(id *)(a1 + 32) canAnalyzeAsset:*(void *)(a1 + 40) forWorkerType:*(void *)(a1 + 48)])
    {
      v6 = [[_PXAssetAnalyzerRequest alloc] initWithAsset:*(void *)(a1 + 40) workerType:*(void *)(a1 + 48)];
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKeyedSubscript:v4];
      objc_initWeak(&location, *(id *)(a1 + 32));
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__PXAssetAnalyzer_analyzeAsset_forWorkerType___block_invoke_2;
      v7[3] = &unk_1E5DD21B0;
      objc_copyWeak(&v9, &location);
      id v5 = v6;
      v8 = v5;
      [(_PXAssetAnalyzerRequest *)v5 runWithResultHandler:v7];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else
    {
      id v5 = 0;
    }
  }
}

void __46__PXAssetAnalyzer_analyzeAsset_forWorkerType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleResultForRequest:*(void *)(a1 + 32) success:a2];
}

- (BOOL)canAnalyzeAsset:(id)a3 forWorkerType:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4
    || ![v5 canPlayPhotoIris]
    || ([v6 isCloudSharedAsset] & 1) != 0
    || [v6 playbackVariation])
  {
    char v7 = 0;
  }
  else
  {
    char v7 = [v6 isVariationSuggestionStatesUnknown];
  }

  return v7;
}

- (PXAssetAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXAssetAnalyzer;
  v2 = [(PXAssetAnalyzer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    analyzerUUIDToRequest = v2->_analyzerUUIDToRequest;
    v2->_analyzerUUIDToRequest = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end
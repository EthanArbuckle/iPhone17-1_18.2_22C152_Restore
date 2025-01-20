@interface PGTripHighlightTitleGenerator
- (BOOL)_useSplitTimeTitlesIfNeeded;
- (PGEventEnrichment)collection;
- (PGTripHighlightTitleGenerator)initWithCollection:(id)a3 titleGenerationContext:(id)a4;
- (id)_locationTitle;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGTripHighlightTitleGenerator

- (void).cxx_destruct
{
}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 0;
}

- (id)_locationTitle
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__64467;
  v14 = __Block_byref_object_dispose__64468;
  id v15 = 0;
  v3 = [(PGTitleGenerator *)self momentNodes];
  unint64_t v4 = [(PGTitleGenerator *)self lineBreakBehavior];
  v5 = [(PGTitleGenerator *)self titleGenerationContext];
  v6 = [v5 locationHelper];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PGTripHighlightTitleGenerator__locationTitle__block_invoke;
  v9[3] = &unk_1E68EE790;
  v9[4] = self;
  v9[5] = &v10;
  +[PGLocationTitleUtility generateHighlightLocationTitleForTripWithMomentNodes:v3 lineBreakBehavior:v4 locationHelper:v6 result:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__PGTripHighlightTitleGenerator__locationTitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) setUsedLocationNodes:v7];
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  unint64_t v4 = (void (**)(id, void *, void))a3;
  v5 = [(PGTripHighlightTitleGenerator *)self collection];
  int v6 = [v5 isTrip];

  if (v6)
  {
    id v7 = [(PGTripHighlightTitleGenerator *)self _locationTitle];
    if (v7)
    {
      v8 = +[PGTitle titleWithString:v7 category:4];
      if (!v4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v8 = 0;
    if (v4) {
LABEL_11:
    }
      v4[2](v4, v8, 0);
  }
  else
  {
    v9 = +[PGLogging sharedLogging];
    uint64_t v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 0;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Collection is not a trip, can't use trip collection title generator", (uint8_t *)v11, 2u);
    }

    if (v4) {
      v4[2](v4, 0, 0);
    }
    id v7 = 0;
    v8 = 0;
  }
LABEL_12:
}

- (PGTripHighlightTitleGenerator)initWithCollection:(id)a3 titleGenerationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 eventEnrichmentMomentNodes];
  uint64_t v10 = [v9 temporarySet];

  v13.receiver = self;
  v13.super_class = (Class)PGTripHighlightTitleGenerator;
  v11 = [(PGTitleGenerator *)&v13 initWithMomentNodes:v10 type:0 titleGenerationContext:v8];

  if (v11) {
    objc_storeStrong((id *)&v11->_collection, a3);
  }

  return v11;
}

@end
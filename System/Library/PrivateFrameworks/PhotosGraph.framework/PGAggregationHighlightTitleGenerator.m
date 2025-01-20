@interface PGAggregationHighlightTitleGenerator
- (BOOL)_useSplitTimeTitlesIfNeeded;
- (PGAggregationHighlightTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6;
- (PGAggregationHighlightTitleGenerator)initWithMomentNodes:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6;
- (id)_locationTitleUsingKeyAssetAddressNode:(id)a3 curationAddressNodes:(id)a4;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGAggregationHighlightTitleGenerator

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 0;
}

- (id)_locationTitleUsingKeyAssetAddressNode:(id)a3 curationAddressNodes:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PGTitleGenerator *)self titleGenerationContext];
  v9 = [v8 locationHelper];

  if (v6
    && ([v9 cityNodeFromAddressNode:v6],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 anyNode],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v32 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [v9 cityNodeFromAddressNode:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          v18 = [v17 anyNode];

          LODWORD(v17) = [v11 isSameNodeAsNode:v18];
          if (!v17)
          {
            int v19 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    int v19 = 0;
LABEL_14:

    v21 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v11 locationHelper:v9];
    v22 = NSString;
    v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v24 = v23;
    if (v19) {
      v25 = @"PGAggregationHighlightTitleFormatOneLocationAndMore %@";
    }
    else {
      v25 = @"PGAggregationHighlightTitleFormatOneLocation %@";
    }
    v26 = [v23 localizedStringForKey:v25 value:v25 table:@"Localizable"];
    v27 = objc_msgSend(v22, "localizedStringWithFormat:", v26, v21);

    unint64_t v28 = [(PGTitleGenerator *)self lineBreakBehavior];
    v37 = v21;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v30 = +[PGLocationTitleUtility _titleWithLineBreakBehavior:v28 forTitle:v27 titleComponents:v29];

    id v20 = v30;
    id v7 = v32;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  id v12 = (void (**)(id, void *, void))a3;
  uint64_t v4 = [(PGTitleGenerator *)self keyAsset];
  if (v4
    && (v5 = (void *)v4,
        [(PGTitleGenerator *)self curatedAssetCollection],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [(PGTitleGenerator *)self _addressNodeFromKeyAsset];
    v8 = [(PGTitleGenerator *)self _addressNodesFromCuratedAssetCollection];
    v9 = [(PGAggregationHighlightTitleGenerator *)self _locationTitleUsingKeyAssetAddressNode:v7 curationAddressNodes:v8];

    if (v9)
    {
      v10 = +[PGTitle titleWithString:v9 category:4];
    }
    else
    {
      v10 = 0;
    }
    if (v12) {
      v12[2](v12, v10, 0);
    }
  }
  else
  {
    v11 = v12;
    if (!v12) {
      goto LABEL_12;
    }
    v12[2](v12, 0, 0);
  }
  v11 = v12;
LABEL_12:
}

- (PGAggregationHighlightTitleGenerator)initWithMomentNodes:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PGAggregationHighlightTitleGenerator;
  return [(PGTitleGenerator *)&v7 initWithMomentNodes:a3 referenceDateInterval:0 keyAsset:a4 curatedAssetCollection:a5 assetCollection:a5 type:0 titleGenerationContext:a6];
}

- (PGAggregationHighlightTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isAggregation])
  {
    uint64_t v14 = [v10 eventEnrichmentMomentNodes];
    uint64_t v15 = [v14 temporarySet];

    self = [(PGAggregationHighlightTitleGenerator *)self initWithMomentNodes:v15 keyAsset:v11 curatedAssetCollection:v12 titleGenerationContext:v13];
    v16 = self;
  }
  else
  {
    v17 = +[PGLogging sharedLogging];
    v18 = [v17 loggingConnection];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v20 = 0;
      _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Collection is not an aggregation, can't use aggregation collection title generator", v20, 2u);
    }

    v16 = 0;
  }

  return v16;
}

@end
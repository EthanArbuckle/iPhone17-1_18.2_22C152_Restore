@interface PGEnrichableEventSuggestion
- (BOOL)containsUnverifiedPersons;
- (NSArray)keyAssets;
- (NSArray)representativeAssets;
- (NSArray)suggestedPersonLocalIdentifiers;
- (NSDate)creationDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSSet)features;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (PGEnrichableEventSuggestion)initWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 enrichableEvent:(id)a5 sharingSuggestionResults:(id)a6 photoLibrary:(id)a7 curationManager:(id)a8 curationContext:(id)a9 loggingConnection:(id)a10 titleGenerationContext:(id)a11;
- (id)_whitelistedMeaningLabels;
- (id)assetCollectionToShareForAssetCollection:(id)a3 loggingConnection:(id)a4;
- (id)recipe;
- (int64_t)version;
- (unint64_t)availableFeatures;
- (unint64_t)relevanceDurationInDays;
- (unsigned)notificationQuality;
- (unsigned)notificationState;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
- (void)setNotificationQuality:(unsigned __int8)a3;
- (void)setNotificationState:(unsigned __int16)a3;
@end

@implementation PGEnrichableEventSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_representativeAssets, 0);
  objc_storeStrong((id *)&self->_keyAssets, 0);
  objc_storeStrong((id *)&self->_suggestedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

- (unint64_t)availableFeatures
{
  return self->_availableFeatures;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (NSArray)representativeAssets
{
  return self->_representativeAssets;
}

- (NSArray)keyAssets
{
  return self->_keyAssets;
}

- (void)setNotificationQuality:(unsigned __int8)a3
{
  self->_notificationQuality = a3;
}

- (unsigned)notificationQuality
{
  return self->_notificationQuality;
}

- (BOOL)containsUnverifiedPersons
{
  return self->_containsUnverifiedPersons;
}

- (NSArray)suggestedPersonLocalIdentifiers
{
  return self->_suggestedPersonLocalIdentifiers;
}

- (NSSet)features
{
  return self->_features;
}

- (void)setNotificationState:(unsigned __int16)a3
{
  self->_notificationState = a3;
}

- (unsigned)notificationState
{
  return self->_notificationState;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)PGEnrichableEventSuggestion;
  v3 = [(PGEnrichableEventSuggestion *)&v10 description];
  v4 = PHSuggestionStringWithType();
  v5 = PHSuggestionStringWithSubtype();
  v6 = [(PGEnrichableEventSuggestion *)self keyAssets];
  v7 = [(PGEnrichableEventSuggestion *)self representativeAssets];
  v8 = [v3 stringByAppendingFormat:@": type=%@, subtype=%@, keyAssets=%@, representativeAssets=%lu, features=%@", v4, v5, v6, objc_msgSend(v7, "count"), self->_features];

  return (NSString *)v8;
}

- (unint64_t)relevanceDurationInDays
{
  return 0;
}

- (id)recipe
{
  return 0;
}

- (unsigned)state
{
  return 0;
}

- (NSDate)creationDate
{
  return 0;
}

- (int64_t)version
{
  return 3;
}

- (id)_whitelistedMeaningLabels
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Performance", @"Concert", @"Birthday", @"Restaurant", @"Breakfast", @"Lunch", @"Dinner", 0);
}

- (id)assetCollectionToShareForAssetCollection:(id)a3 loggingConnection:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = a4;
  v7 = [v5 photoLibrary];
  v8 = [v7 librarySpecificFetchOptions];

  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v36[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v36[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [v8 setSortDescriptors:v11];

  v12 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(additionalAttributes.importedBy != %d) && kindSubtype != %d && kindSubtype != %d", 7, 10, 103);
  v14 = (void *)MEMORY[0x1E4F28BA0];
  v35[0] = v13;
  v35[1] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v16 = [v14 andPredicateWithSubpredicates:v15];
  [v8 setInternalPredicate:v16];

  v17 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v8];
  if ([v17 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      double v22 = *MEMORY[0x1E4F8E750];
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) curationScore];
          if (v24 > v22)
          {

            v26 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v18 title:0];
            goto LABEL_17;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      v25 = "Asset collection %@ only contains junk assets.";
LABEL_15:
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v5;
    v25 = "Asset collection %@ only contains received assets from moment share(s).";
    goto LABEL_15;
  }
  v26 = 0;
LABEL_17:

  return v26;
}

- (PGEnrichableEventSuggestion)initWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 enrichableEvent:(id)a5 sharingSuggestionResults:(id)a6 photoLibrary:(id)a7 curationManager:(id)a8 curationContext:(id)a9 loggingConnection:(id)a10 titleGenerationContext:(id)a11
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v17 = a5;
  id v68 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v21 = a10;
  id v22 = a11;
  v69.receiver = self;
  v69.super_class = (Class)PGEnrichableEventSuggestion;
  v23 = [(PGEnrichableEventSuggestion *)&v69 init];
  double v24 = v23;
  if (!v23)
  {
LABEL_22:
    v36 = v24;
    goto LABEL_23;
  }
  id v67 = v20;
  v23->_type = a3;
  v23->_subtype = a4;
  uint64_t v25 = [v17 universalStartDate];
  universalStartDate = v24->_universalStartDate;
  v24->_universalStartDate = (NSDate *)v25;

  uint64_t v27 = [v17 universalEndDate];
  universalEndDate = v24->_universalEndDate;
  v24->_universalEndDate = (NSDate *)v27;

  long long v29 = [v17 fetchAssetCollectionInPhotoLibrary:v18];
  uint64_t v30 = [(PGEnrichableEventSuggestion *)v24 assetCollectionToShareForAssetCollection:v29 loggingConnection:v21];
  if (v30)
  {
    long long v31 = (void *)v30;
    v32 = [v18 librarySpecificFetchOptions];
    [v32 setIncludeGuestAssets:0];
    v33 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"additionalAttributes.syndicationIdentifier");
    [v32 setInternalPredicate:v33];

    id v34 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v31 options:v32];
    if ((unint64_t)[v34 count] <= 0x100) {
      [v34 fetchedObjects];
    }
    else {
    uint64_t v35 = +[PGCurationManager representativeAssetsForAssetCollection:v31 curationContext:v67 progressBlock:0];
    }
    representativeAssets = v24->_representativeAssets;
    v24->_representativeAssets = (NSArray *)v35;

    uint64_t v66 = [(NSArray *)v24->_representativeAssets count];
    if (v66)
    {
      uint64_t v38 = [v19 curatedKeyAssetForAssetCollection:v31 curatedAssetCollection:0 options:0 criteria:0 curationContext:v67];
      if (!v38)
      {
        uint64_t v64 = [(NSArray *)v24->_representativeAssets firstObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v72 = v17;
          __int16 v73 = 2112;
          uint64_t v74 = v64;
          _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "No key asset found for creating suggestions with enrichableEvent %@. Taking the first representative asset %@.", buf, 0x16u);
        }
        uint64_t v38 = v64;
      }
      v60 = v34;
      v61 = v29;
      v65 = (void *)v38;
      uint64_t v70 = v38;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
      keyAssets = v24->_keyAssets;
      v24->_keyAssets = (NSArray *)v39;

      v41 = [PGCollectionTitleGenerator alloc];
      v42 = [(PGEnrichableEventSuggestion *)v24 _whitelistedMeaningLabels];
      v43 = [(PGCollectionTitleGenerator *)v41 initWithCollection:v17 whitelistedMeaningLabels:v42 titleGenerationContext:v22];

      v59 = v43;
      v44 = [(PGCollectionTitleGenerator *)v43 titleTuple];
      v45 = v44;
      id v62 = v22;
      id v63 = v19;
      if (v44)
      {
        v46 = [v44 title];
        uint64_t v47 = [v46 stringValue];
        title = v24->_title;
        v24->_title = (NSString *)v47;

        v49 = [v45 subtitle];
        uint64_t v50 = [v49 stringValue];
        subtitle = v24->_subtitle;
        v24->_subtitle = (NSString *)v50;
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v17;
        _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Failed to generate title/subtitle for %@.", buf, 0xCu);
      }
      uint64_t v52 = [MEMORY[0x1E4F1CAD0] set];
      features = v24->_features;
      v24->_features = (NSSet *)v52;

      buf[0] = 0;
      v54 = [v17 eventEnrichmentMomentNodes];
      v55 = [v54 array];
      uint64_t v56 = +[PGAbstractSuggester suggestedPersonLocalIdentifiersFromSharingSuggestionResults:v68 forMomentNodes:v55 containsUnverifiedPersons:buf];

      suggestedPersonLocalIdentifiers = v24->_suggestedPersonLocalIdentifiers;
      v24->_suggestedPersonLocalIdentifiers = (NSArray *)v56;

      v24->_containsUnverifiedPersons = buf[0];
      id v22 = v62;
      id v19 = v63;
      id v34 = v60;
      long long v29 = v61;
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v17;
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "No representative assets for creating suggestions with enrichableEvent %@", buf, 0xCu);
    }

    id v20 = v67;
    if (!v66)
    {
      v36 = 0;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v72 = v17;
    _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_DEFAULT, "No shareable assets found in %@", buf, 0xCu);
  }

  v36 = 0;
LABEL_23:

  return v36;
}

@end
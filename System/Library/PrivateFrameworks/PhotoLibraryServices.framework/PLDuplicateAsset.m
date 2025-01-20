@interface PLDuplicateAsset
+ (BOOL)isDuplicateAssetSortChangedObject:(id)a3;
+ (id)relationshipKeyPathsForMergePrefetching;
+ (id)relationshipKeyPathsForPrefetching;
- (BOOL)_validCPLAssetsWithAssets:(id)a3;
- (BOOL)dateUpdated;
- (BOOL)enableEXIFDataAccess;
- (BOOL)facesUpdated;
- (BOOL)hasModifiedUserDateCreated;
- (BOOL)hasModifiedUserLocation;
- (BOOL)hasModifiedUserTimezone;
- (BOOL)hasModifiedUserTitle;
- (BOOL)iptcUpdated;
- (BOOL)isCPLEnabled;
- (BOOL)isMergeReady;
- (BOOL)locationUpdated;
- (BOOL)resourceComparisonPropertyUpdateLocation;
- (BOOL)resourceSwapDisabled;
- (BOOL)timezoneUpdated;
- (BOOL)titleUpdated;
- (NSDictionary)jsonDescriptionData;
- (NSManagedObjectID)assetObjectID;
- (NSString)assetCloudScopedIdentifier;
- (NSString)assetObjectIDDescription;
- (NSString)assetUUID;
- (NSString)privateDescription;
- (NSString)resourceSwapAssetUUID;
- (PLDuplicateAsset)initWithAsset:(id)a3;
- (PLDuplicateAsset)initWithAsset:(id)a3 cloudScopedIdentifier:(id)a4 enableEXIFDataAccess:(BOOL)a5;
- (PLDuplicateAssetScoreTuple)_compareResourcesAdditionalChecksFromOther:(id)a3;
- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingKindSubtypeCheckFromOther:(id)a3 error:(id *)a4;
- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingPlaybackStyleAndKindSubTypeCheckFromOther:(id)a3;
- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingPlaybackStyleCheckFromOther:(id)a3 error:(id *)a4;
- (PLDuplicateAssetScoreTuple)_compareResourcesNotMatchingPlaybackStyleAndKindSubTypeCheckFromOther:(id)a3 error:(id *)a4;
- (PLManagedAsset)asset;
- (id)_additionalDescriptionDictionaryWithPIIDetails:(BOOL)a3;
- (id)_additionalDescriptionState:(id)a3;
- (id)_additionalDescriptionWithPIIDetails:(BOOL)a3;
- (id)debugDescription;
- (id)description;
- (id)duplicateAssetVisibilityStateString;
- (int64_t)_buildBaseScore;
- (int64_t)_buildUserModifiedScore;
- (int64_t)_correctedCompareDate:(id)a3 otherDate:(id)a4;
- (int64_t)compare:(id)a3;
- (int64_t)compare:(id)a3 enabledMergeComparison:(BOOL)a4;
- (int64_t)compareResource:(id)a3 error:(id *)a4;
- (int64_t)mergeStatus;
- (int64_t)originalResolution;
- (int64_t)score;
- (signed)_calculateDuplicateAssetVisibilityState;
- (signed)duplicateAssetVisibilityState;
- (void)_compareResourceReverseCheckFromOther:(id)a3 score:(PLDuplicateAssetScoreTuple *)a4;
- (void)_compareResourceTIFFCheckFromAsset:(id)a3 other:(id)a4 scoreProperty:(signed __int16 *)a5;
- (void)_compareResourcesResetPropertiesWithOther:(id)a3;
- (void)_compareUTICheckFromOther:(id)a3 scoreTuple:(PLDuplicateAssetScoreTuple *)a4;
- (void)_configureInitPropertiesWithAsset:(id)a3;
- (void)_fileFormatIncrementScore:(int64_t *)a3;
- (void)_mergeComparisonScoreModifierWithOtherAsset:(id)a3 score:(int64_t *)a4 otherScore:(int64_t *)a5;
- (void)_tieBreakerComparisonScoreWithOtherAsset:(id)a3 score:(int64_t *)a4 otherScore:(int64_t *)a5;
- (void)_updateScoreOnCondition:(BOOL)a3 incrementOtherScore:(BOOL)a4 scoreTuple:(PLDuplicateAssetScoreTuple *)a5 other:(id)a6 propertyName:(id)a7 additionalLogString:(id)a8;
- (void)_updateScoresUsingLatestDateWithDate:(id)a3 otherDate:(id)a4 score:(int64_t *)a5 otherScore:(int64_t *)a6;
- (void)setAsset:(id)a3;
- (void)setAssetCloudScopedIdentifier:(id)a3;
- (void)setAssetObjectID:(id)a3;
- (void)setAssetObjectIDDescription:(id)a3;
- (void)setAssetUUID:(id)a3;
- (void)setDateUpdated:(BOOL)a3;
- (void)setDuplicateAssetVisibilityState:(signed __int16)a3;
- (void)setEnableEXIFDataAccess:(BOOL)a3;
- (void)setFacesUpdated:(BOOL)a3;
- (void)setIptcUpdated:(BOOL)a3;
- (void)setLocationUpdated:(BOOL)a3;
- (void)setMergeStatus:(int64_t)a3;
- (void)setOriginalResolution:(int64_t)a3;
- (void)setResourceComparisonPropertyUpdateLocation:(BOOL)a3;
- (void)setResourceSwapAssetUUID:(id)a3;
- (void)setResourceSwapDisabled:(BOOL)a3;
- (void)setTimezoneUpdated:(BOOL)a3;
- (void)setTitleUpdated:(BOOL)a3;
@end

@implementation PLDuplicateAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetObjectIDDescription, 0);
  objc_storeStrong((id *)&self->_resourceSwapAssetUUID, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetCloudScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_isCPLEnabled, 0);
  objc_storeStrong((id *)&self->_hasUserModifiedLocation, 0);
  objc_storeStrong((id *)&self->_hasUserModifiedTimezone, 0);
  objc_storeStrong((id *)&self->_hasUserModifiedDateCreated, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
}

- (void)setEnableEXIFDataAccess:(BOOL)a3
{
  self->_enableEXIFDataAccess = a3;
}

- (BOOL)enableEXIFDataAccess
{
  return self->_enableEXIFDataAccess;
}

- (int64_t)mergeStatus
{
  return self->_mergeStatus;
}

- (void)setAssetObjectIDDescription:(id)a3
{
}

- (NSString)assetObjectIDDescription
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFacesUpdated:(BOOL)a3
{
  self->_facesUpdated = a3;
}

- (BOOL)facesUpdated
{
  return self->_facesUpdated;
}

- (void)setIptcUpdated:(BOOL)a3
{
  self->_iptcUpdated = a3;
}

- (BOOL)iptcUpdated
{
  return self->_iptcUpdated;
}

- (void)setTimezoneUpdated:(BOOL)a3
{
  self->_timezoneUpdated = a3;
}

- (BOOL)timezoneUpdated
{
  return self->_timezoneUpdated;
}

- (void)setLocationUpdated:(BOOL)a3
{
  self->_locationUpdated = a3;
}

- (BOOL)locationUpdated
{
  return self->_locationUpdated;
}

- (void)setDateUpdated:(BOOL)a3
{
  self->_dateUpdated = a3;
}

- (BOOL)dateUpdated
{
  return self->_dateUpdated;
}

- (void)setTitleUpdated:(BOOL)a3
{
  self->_titleUpdated = a3;
}

- (BOOL)titleUpdated
{
  return self->_titleUpdated;
}

- (void)setResourceSwapAssetUUID:(id)a3
{
}

- (NSString)resourceSwapAssetUUID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setResourceComparisonPropertyUpdateLocation:(BOOL)a3
{
  self->_resourceComparisonPropertyUpdateLocation = a3;
}

- (BOOL)resourceComparisonPropertyUpdateLocation
{
  return self->_resourceComparisonPropertyUpdateLocation;
}

- (void)setResourceSwapDisabled:(BOOL)a3
{
  self->_resourceSwapDisabled = a3;
}

- (BOOL)resourceSwapDisabled
{
  return self->_resourceSwapDisabled;
}

- (void)setOriginalResolution:(int64_t)a3
{
  self->_originalResolution = a3;
}

- (int64_t)originalResolution
{
  return self->_originalResolution;
}

- (void)setAsset:(id)a3
{
}

- (PLManagedAsset)asset
{
  return (PLManagedAsset *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDuplicateAssetVisibilityState:(signed __int16)a3
{
  self->_duplicateAssetVisibilityState = a3;
}

- (signed)duplicateAssetVisibilityState
{
  return self->_duplicateAssetVisibilityState;
}

- (void)setAssetCloudScopedIdentifier:(id)a3
{
}

- (NSString)assetCloudScopedIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAssetUUID:(id)a3
{
}

- (NSString)assetUUID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAssetObjectID:(id)a3
{
}

- (NSManagedObjectID)assetObjectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 72, 1);
}

- (void)_fileFormatIncrementScore:(int64_t *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = [(PLDuplicateAsset *)self asset];
  if (([v5 isJPEG] & 1) == 0)
  {
    if ([v5 isHEIF])
    {
      ++*a3;
      v6 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = [(PLDuplicateAsset *)self shortDescription];
        v8 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v7, *a3];
        v9 = _PLDuplicateAssetLogString((uint64_t)v8, @"uniformTypeIdentifier", @"HEIF");

        *(_DWORD *)buf = 138543362;
        v25 = v9;
LABEL_8:
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_9:
      }
    }
    else
    {
      v10 = [(PLDuplicateAsset *)self asset];
      int v11 = [v10 RAWBadgeAttribute];

      if (!v11)
      {
        v13 = (void *)MEMORY[0x1E4F8CDF8];
        v14 = [v5 uniformTypeIdentifier];
        v6 = [v13 typeWithIdentifier:v14];

        v15 = [MEMORY[0x1E4F8CDF8] canonTIFFRAWImageType];
        int v16 = [v6 isEqual:v15];

        if (v16)
        {
          *a3 += 2;
          v9 = PLDuplicateDetectionGetLog();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_9;
          }
          v17 = [(PLDuplicateAsset *)self shortDescription];
          v18 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v17, *a3];
          v19 = _PLDuplicateAssetLogString((uint64_t)v18, @"uniformTypeIdentifier", @"TIFFRaw");

          *(_DWORD *)buf = 138543362;
          v25 = v19;
        }
        else
        {
          v20 = [MEMORY[0x1E4F8CDF8] adobePhotoshopType];
          if ([v6 isEqual:v20])
          {
          }
          else
          {
            v21 = [MEMORY[0x1E4F8CDF8] adobeIllustratorType];
            int v22 = [v6 isEqual:v21];

            if (!v22) {
              goto LABEL_10;
            }
          }
          *a3 += 3;
          v9 = PLDuplicateDetectionGetLog();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_9;
          }
          v17 = [(PLDuplicateAsset *)self shortDescription];
          v23 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v17, *a3];
          v19 = _PLDuplicateAssetLogString((uint64_t)v23, @"uniformTypeIdentifier", @"Adobe");

          *(_DWORD *)buf = 138543362;
          v25 = v19;
        }
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        goto LABEL_9;
      }
      *a3 += 4;
      v6 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = [(PLDuplicateAsset *)self shortDescription];
        v12 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v7, *a3];
        v9 = _PLDuplicateAssetLogString((uint64_t)v12, @"packedBadgeAttributes", @"RAWBadgeAttributes");

        *(_DWORD *)buf = 138543362;
        v25 = v9;
        goto LABEL_8;
      }
    }
LABEL_10:
  }
}

- (int64_t)_buildUserModifiedScore
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(PLDuplicateAsset *)self asset];
  v4 = [v3 additionalAttributes];
  if ([(PLDuplicateAsset *)self hasModifiedUserTitle])
  {
    v5 = [v4 title];
    v6 = [v4 originalFilename];
    if ([v5 isEqualToString:v6]) {
      int64_t v7 = 5;
    }
    else {
      int64_t v7 = 10;
    }

    v8 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = [(PLDuplicateAsset *)self shortDescription];
      v10 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v9, v7];
      int v11 = _PLDuplicateAssetLogString((uint64_t)v10, @"title", 0);

      *(_DWORD *)buf = 138543362;
      v38 = v11;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    int64_t v7 = 0;
  }
  v12 = [v4 assetDescription];
  v13 = [v12 longDescription];

  if (v13)
  {
    v7 += 5;
    v14 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = [(PLDuplicateAsset *)self shortDescription];
      int v16 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v15, v7];
      v17 = _PLDuplicateAssetLogString((uint64_t)v16, @"longDescription", 0);

      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  v18 = [v4 keywords];
  uint64_t v19 = [v18 count];

  if (v19 >= 1)
  {
    v7 += 5 * v19;
    v20 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = [(PLDuplicateAsset *)self shortDescription];
      int v22 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v21, v7];
      v23 = _PLDuplicateAssetLogString((uint64_t)v22, @"keywords", 0);

      *(_DWORD *)buf = 138543362;
      v38 = v23;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  if ([(PLDuplicateAsset *)self hasModifiedUserLocation])
  {
    v7 += 10;
    v24 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = [(PLDuplicateAsset *)self shortDescription];
      uint64_t v26 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v25, v7];
      v27 = _PLDuplicateAssetLogString((uint64_t)v26, @"location", 0);

      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  if ([(PLDuplicateAsset *)self hasModifiedUserDateCreated])
  {
    v7 += 10;
    v28 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(PLDuplicateAsset *)self shortDescription];
      v30 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v29, v7];
      v31 = _PLDuplicateAssetLogString((uint64_t)v30, @"dateCreated", 0);

      *(_DWORD *)buf = 138543362;
      v38 = v31;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  if ([(PLDuplicateAsset *)self hasModifiedUserTimezone])
  {
    v7 += 10;
    v32 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = [(PLDuplicateAsset *)self shortDescription];
      v34 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v33, v7];
      v35 = _PLDuplicateAssetLogString((uint64_t)v34, @"timeZoneOffset", 0);

      *(_DWORD *)buf = 138543362;
      v38 = v35;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }

  return v7;
}

- (int64_t)_buildBaseScore
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PLDuplicateAsset *)self _buildUserModifiedScore];
  int64_t v51 = v3;
  v4 = [(PLDuplicateAsset *)self asset];
  int v5 = [v4 hasAdjustments];

  if (v5)
  {
    v3 += 15;
    int64_t v51 = v3;
    v6 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int64_t v7 = [(PLDuplicateAsset *)self shortDescription];
      v8 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v7, v3];
      v9 = _PLDuplicateAssetLogString((uint64_t)v8, @"adjustmentsState", 0);

      *(_DWORD *)buf = 138543362;
      v53 = v9;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  v10 = [(PLDuplicateAsset *)self asset];
  int v11 = [v10 favorite];

  if (v11)
  {
    v3 += 20;
    int64_t v51 = v3;
    v12 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [(PLDuplicateAsset *)self shortDescription];
      v14 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v13, v3];
      v15 = _PLDuplicateAssetLogString((uint64_t)v14, @"favorite", 0);

      *(_DWORD *)buf = 138543362;
      v53 = v15;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  int v16 = [(PLDuplicateAsset *)self asset];
  v17 = [v16 additionalAttributes];
  unsigned int v18 = [v17 importedBy];

  if (v18 <= 0xD)
  {
    if (((1 << v18) & 0x2360) != 0)
    {
      v3 += 10;
      int64_t v51 = v3;
      uint64_t v19 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    if (((1 << v18) & 0x16) != 0)
    {
      v3 += 15;
      int64_t v51 = v3;
      uint64_t v19 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    if (((1 << v18) & 0x88) != 0)
    {
      v3 += 5;
      int64_t v51 = v3;
      uint64_t v19 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
LABEL_18:
        v20 = [(PLDuplicateAsset *)self shortDescription];
        v21 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v20, v3];
        int v22 = _PLDuplicateAssetLogString((uint64_t)v21, @"importedBy", 0);

        *(_DWORD *)buf = 138543362;
        v53 = v22;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
LABEL_19:
    }
  }
  v23 = [(PLDuplicateAsset *)self asset];
  int v24 = [v23 playbackStyle];

  switch(v24)
  {
    case 1:
      [(PLDuplicateAsset *)self _fileFormatIncrementScore:&v51];
      v51 += 10;
      v25 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_29;
      }
      goto LABEL_27;
    case 2:
      int64_t v51 = v3 + 5;
      v25 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_29;
      }
      uint64_t v26 = [(PLDuplicateAsset *)self shortDescription];
      v27 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v26, v51];
      v28 = _PLDuplicateAssetLogString((uint64_t)v27, @"playbackStyle", 0);

      *(_DWORD *)buf = 138543362;
      v53 = v28;
      goto LABEL_28;
    case 3:
      [(PLDuplicateAsset *)self _fileFormatIncrementScore:&v51];
      int64_t v3 = v51;
      goto LABEL_26;
    case 4:
    case 5:
LABEL_26:
      int64_t v51 = v3 + 15;
      v25 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_29;
      }
LABEL_27:
      uint64_t v26 = [(PLDuplicateAsset *)self shortDescription];
      v29 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v26, v51];
      v28 = _PLDuplicateAssetLogString((uint64_t)v29, @"playbackStyle", 0);

      *(_DWORD *)buf = 138543362;
      v53 = v28;
LABEL_28:
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_29:
LABEL_30:
      v30 = [(PLDuplicateAsset *)self asset];
      int v31 = [v30 hdrType];

      if (v31 >= 1)
      {
        v51 += 5;
        v32 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = [(PLDuplicateAsset *)self shortDescription];
          v34 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v33, v51];
          v35 = _PLDuplicateAssetLogString((uint64_t)v34, @"hdrType", 0);

          *(_DWORD *)buf = 138543362;
          v53 = v35;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
      }
      v36 = [(PLDuplicateAsset *)self asset];
      unsigned int v37 = [v36 kindSubtype];

      if (v37 - 101 <= 3 && v37 != 103 || v37 < 3)
      {
        v51 += 5;
        v38 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = [(PLDuplicateAsset *)self shortDescription];
          v40 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v39, v51];
          v41 = _PLDuplicateAssetLogString((uint64_t)v40, @"kindSubtype", 0);

          *(_DWORD *)buf = 138543362;
          v53 = v41;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
      }
      v42 = [(PLDuplicateAsset *)self asset];
      [v42 savedAssetType];

      [MEMORY[0x1E4F8BA10] maskForFinderSyncedAsset];
      if ((PLValidatedSavedAssetTypeApplies() & 1) != 0
        || ([MEMORY[0x1E4F8BA10] maskForReferencedAsset], PLValidatedSavedAssetTypeApplies()))
      {
        int64_t v51 = 0;
        v43 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v44 = [(PLDuplicateAsset *)self shortDescription];
          v45 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v44, v51];
          v46 = _PLDuplicateAssetLogString((uint64_t)v45, @"savedAssetType", @"Score was invalidated");

          *(_DWORD *)buf = 138543362;
          v53 = v46;
          _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        v47 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = PLValidatedSavedAssetTypeDescription();
          v49 = [(PLDuplicateAsset *)self shortDescription];
          *(_DWORD *)buf = 138543618;
          v53 = v48;
          __int16 v54 = 2114;
          v55 = v49;
          _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_INFO, "Duplicate Asset: reset score to 0 based on savedAssetType: %{public}@ [%{public}@]", buf, 0x16u);
        }
      }
      return v51;
    default:
      goto LABEL_30;
  }
}

- (void)_compareResourcesResetPropertiesWithOther:(id)a3
{
  id v4 = a3;
  [(PLDuplicateAsset *)self setResourceComparisonPropertyUpdateLocation:0];
  [v4 setResourceComparisonPropertyUpdateLocation:0];
}

- (void)_compareResourceReverseCheckFromOther:(id)a3 score:(PLDuplicateAssetScoreTuple *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [v6 asset];
  v8 = [(PLDuplicateAsset *)self asset];
  v9 = [v8 additionalAttributes];
  v10 = [v9 originatingAssetIdentifier];

  int v11 = [v7 additionalAttributes];
  v12 = [v11 originatingAssetIdentifier];

  if ((v10 == 0) == (v12 != 0))
  {
    v13 = [v8 additionalAttributes];
    v14 = [v13 originalStableHash];

    v15 = [v7 additionalAttributes];
    int v16 = [v15 originalStableHash];

    if (([v10 isEqualToString:v16] & 1) == 0
      && ![v12 isEqualToString:v14])
    {
      goto LABEL_20;
    }
    v40 = v16;
    v41 = v14;
    PLDuplicateAssetScoreTuple v17 = *a4;
    unsigned int v18 = [NSNumber numberWithShort:a4->var0];
    uint64_t v19 = [NSNumber numberWithShort:(*(int *)&v17 >> 16)];
    uint64_t v20 = [v18 compare:v19];

    if (v20 == -1)
    {
      int v16 = v40;
      v14 = v41;
      if (v12)
      {
        a4->uint64_t var0 = a4->var1 + 5;
        v25 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
LABEL_11:
          uint64_t v26 = [(PLDuplicateAsset *)self shortDescription];
          v27 = [v6 shortDescription];
          uint64_t var0 = a4->var0;
          uint64_t v29 = (*(_DWORD *)a4 >> 16);
          v30 = (void *)v26;
          int v31 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", var0, v29, v26, v27];
          v32 = _PLDuplicateAssetLogString((uint64_t)v31, @"originatingAssetIdentifier", @"reversed");

          v14 = v41;
          *(_DWORD *)buf = 138543362;
          v43 = v32;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_18:
          int v16 = v40;
        }
LABEL_19:
      }
LABEL_20:

      goto LABEL_21;
    }
    PLDuplicateAssetScoreTuple v21 = *a4;
    int v22 = [NSNumber numberWithShort:a4->var0];
    v23 = [NSNumber numberWithShort:(*(int *)&v21 >> 16)];
    uint64_t v24 = [v22 compare:v23];

    if (v24)
    {
      int v16 = v40;
      v14 = v41;
      if (v10)
      {
        a4->var1 = a4->var0 + 5;
        v25 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v12)
    {
      a4->uint64_t var0 = a4->var1 + 5;
      v25 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
    }
    else
    {
      a4->var1 = a4->var0 + 5;
      v25 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        uint64_t v33 = [(PLDuplicateAsset *)self shortDescription];
        v34 = [v6 shortDescription];
        uint64_t v35 = a4->var0;
        uint64_t v36 = (*(_DWORD *)a4 >> 16);
        unsigned int v37 = (void *)v33;
        v38 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", v35, v36, v33, v34];
        uint64_t v39 = _PLDuplicateAssetLogString((uint64_t)v38, @"originatingAssetIdentifier", @"reversed");

        *(_DWORD *)buf = 138543362;
        v43 = v39;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
    }
    v14 = v41;
    goto LABEL_18;
  }
LABEL_21:
}

- (void)_compareResourceTIFFCheckFromAsset:(id)a3 other:(id)a4 scoreProperty:(signed __int16 *)a5
{
  id v7 = a4;
  id v21 = [a3 asset];
  v8 = [v7 asset];

  v9 = [v8 additionalAttributes];
  uint64_t v10 = (int)[v9 dateCreatedSource];

  if ((unint64_t)(v10 - 1) <= 1)
  {
    int v11 = [v8 extendedAttributes];
    v12 = [v11 dateCreated];

    if (v12)
    {
      v13 = [v21 extendedAttributes];
      v14 = [v13 dateCreated];

      if (v14)
      {
        v15 = [v8 extendedAttributes];
        int v16 = [v15 dateCreated];
        PLDuplicateAssetScoreTuple v17 = [v21 extendedAttributes];
        unsigned int v18 = [v17 dateCreated];
        [v16 timeIntervalSinceDate:v18];
        if (v19 >= 0.0) {
          signed __int16 v20 = 0;
        }
        else {
          signed __int16 v20 = 5;
        }
        *a5 = v20;
      }
      else
      {
        *a5 = 5;
      }
    }
  }
}

- (void)_updateScoreOnCondition:(BOOL)a3 incrementOtherScore:(BOOL)a4 scoreTuple:(PLDuplicateAssetScoreTuple *)a5 other:(id)a6 propertyName:(id)a7 additionalLogString:(id)a8
{
  BOOL v11 = a4;
  BOOL v12 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  PLDuplicateAssetScoreTuple v17 = *a5;
  unsigned int v18 = [NSNumber numberWithShort:a5->var0];
  double v19 = [NSNumber numberWithShort:(*(int *)&v17 >> 16)];
  uint64_t v20 = [v18 compare:v19];

  if (v20) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = !v12;
  }
  if (!v21)
  {
    uint64_t v22 = 2;
    if (!v11) {
      uint64_t v22 = 0;
    }
    *(signed __int16 *)((char *)&a5->var0 + v22) = 5;
    v23 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = [(PLDuplicateAsset *)self shortDescription];
      [v14 shortDescription];
      v25 = id v34 = v14;
      PLDuplicateAssetScoreTuple v26 = *a5;
      v27 = NSString;
      uint64_t var0 = v26.var0;
      uint64_t v29 = (*(int *)&v26 >> 16);
      id v30 = v16;
      id v31 = v15;
      v32 = [v27 stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", var0, v29, v24, v25];
      uint64_t v33 = _PLDuplicateAssetLogString((uint64_t)v32, v31, v30);

      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v33;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      id v14 = v34;
    }
  }
}

- (void)_compareUTICheckFromOther:(id)a3 scoreTuple:(PLDuplicateAssetScoreTuple *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v33 = 0;
  id v7 = [v6 asset];
  v8 = [(PLDuplicateAsset *)self asset];
  v9 = (void *)MEMORY[0x1E4F8CDF8];
  uint64_t v10 = [v7 uniformTypeIdentifier];
  BOOL v11 = [v9 typeWithIdentifier:v10];

  BOOL v12 = (void *)MEMORY[0x1E4F8CDF8];
  v13 = [v8 uniformTypeIdentifier];
  id v14 = [v12 typeWithIdentifier:v13];

  if ([v11 isEqual:v14]) {
    goto LABEL_19;
  }
  if ([v7 isHEIF]) {
    uint64_t v15 = [v8 isJPEG];
  }
  else {
    uint64_t v15 = 0;
  }
  [(PLDuplicateAsset *)self _updateScoreOnCondition:v15 incrementOtherScore:1 scoreTuple:&v33 other:v6 propertyName:@"UTI" additionalLogString:@"JPG:HEIF format"];
  if ([v8 isHEIF]) {
    uint64_t v16 = [v7 isJPEG];
  }
  else {
    uint64_t v16 = 0;
  }
  [(PLDuplicateAsset *)self _updateScoreOnCondition:v16 incrementOtherScore:0 scoreTuple:&v33 other:v6 propertyName:@"UTI" additionalLogString:@"HEIF:JPG format"];
  PLDuplicateAssetScoreTuple v17 = [MEMORY[0x1E4F8CDF8] canonTIFFRAWImageType];
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", [v11 isEqual:v17], 1, &v33, v6, @"UTI", @"??:TIFF format");

  unsigned int v18 = [MEMORY[0x1E4F8CDF8] canonTIFFRAWImageType];
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", [v14 isEqual:v18], 0, &v33, v6, @"UTI", @"TIFF:?? format");

  double v19 = [MEMORY[0x1E4F8CDF8] adobePhotoshopType];
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", [v11 isEqual:v19], 1, &v33, v6, @"UTI", @"??:Photoshop format");

  uint64_t v20 = [MEMORY[0x1E4F8CDF8] adobePhotoshopType];
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", [v14 isEqual:v20], 0, &v33, v6, @"UTI", @"Photoshop:?? format");

  BOOL v21 = [MEMORY[0x1E4F8CDF8] adobeIllustratorType];
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", [v11 isEqual:v21], 1, &v33, v6, @"UTI", @"??:Illustrator format");

  uint64_t v22 = [MEMORY[0x1E4F8CDF8] adobeIllustratorType];
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", [v14 isEqual:v22], 0, &v33, v6, @"UTI", @"Illustrator:?? format");

  LODWORD(v22) = v33;
  v23 = [NSNumber numberWithShort:(__int16)v33];
  uint64_t v24 = [NSNumber numberWithShort:((int)v22 >> 16)];
  uint64_t v25 = [v23 compare:v24];

  if (!v25)
  {
    uint64_t v26 = *MEMORY[0x1E4F444E0];
    if ([v11 isEqual:*MEMORY[0x1E4F444E0]])
    {
      [(PLDuplicateAsset *)self _compareResourceTIFFCheckFromAsset:self other:v6 scoreProperty:(char *)&v33 + 2];
      v27 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:

        goto LABEL_17;
      }
      v32 = [(PLDuplicateAsset *)self shortDescription];
      v28 = [v6 shortDescription];
      uint64_t v29 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v33, (v33 >> 16), v32, v28];
      id v30 = _PLDuplicateAssetLogString((uint64_t)v29, @"??:TIFF format", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v30;
    }
    else
    {
      if (![v14 isEqual:v26]) {
        goto LABEL_17;
      }
      [(PLDuplicateAsset *)self _compareResourceTIFFCheckFromAsset:v6 other:self scoreProperty:&v33];
      v27 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      v32 = [(PLDuplicateAsset *)self shortDescription];
      v28 = [v6 shortDescription];
      id v31 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v33, (v33 >> 16), v32, v28];
      id v30 = _PLDuplicateAssetLogString((uint64_t)v31, @"TIFF:?? format", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v30;
    }
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    goto LABEL_16;
  }
LABEL_17:
  if (a4)
  {
    a4->var0 += v33;
    a4->var1 += HIWORD(v33);
  }
LABEL_19:
}

- (PLDuplicateAssetScoreTuple)_compareResourcesAdditionalChecksFromOther:(id)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v118 = 0;
  int v5 = [v4 asset];
  id v6 = [(PLDuplicateAsset *)self asset];
  uint64_t v7 = [v4 originalResolution];
  int v8 = 0;
  if (v7 != [(PLDuplicateAsset *)self originalResolution])
  {
    uint64_t v9 = [v4 originalResolution];
    if (v9 <= [(PLDuplicateAsset *)self originalResolution]) {
      LOWORD(v118) = 5;
    }
    else {
      HIWORD(v118) = 5;
    }
    uint64_t v10 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v11 = [(PLDuplicateAsset *)self shortDescription];
      BOOL v12 = [v4 shortDescription];
      v13 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v11, v12];
      id v14 = _PLDuplicateAssetLogString((uint64_t)v13, @"resolution", 0);

      *(_DWORD *)buf = 138543362;
      v120 = v14;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    int v8 = v118;
  }
  uint64_t v15 = [NSNumber numberWithShort:(__int16)v8];
  uint64_t v16 = [NSNumber numberWithShort:(v8 >> 16)];
  uint64_t v17 = [v15 compare:v16];

  if (!v17)
  {
    int v18 = [v5 kind];
    if (v18 == [v6 kind] && !objc_msgSend(v6, "kind"))
    {
      int v19 = [v5 kindSubtype];
      if (v19 == [v6 kindSubtype] && objc_msgSend(v6, "kindSubtype") == 2)
      {
        uint64_t v20 = [v5 firstPersistedResourceMatching:&__block_literal_global_217];
        BOOL v21 = [v6 firstPersistedResourceMatching:&__block_literal_global_219_45567];
        uint64_t v22 = [v20 unorientedWidth];
        uint64_t v23 = [v20 unorientedHeight] * v22;
        uint64_t v24 = [v21 unorientedWidth];
        uint64_t v25 = [v21 unorientedHeight];
        if (v23 != v25 * v24)
        {
          if (v23 <= v25 * v24) {
            LOWORD(v118) = 5;
          }
          else {
            HIWORD(v118) = 5;
          }
          uint64_t v26 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v116 = [(PLDuplicateAsset *)self shortDescription];
            v114 = [v4 shortDescription];
            v27 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v116, v114];
            v28 = _PLDuplicateAssetLogString((uint64_t)v27, @"videoComplementResolution", 0);

            *(_DWORD *)buf = 138543362;
            v120 = v28;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
  uint64_t v29 = [NSNumber numberWithShort:(__int16)v118];
  id v30 = [NSNumber numberWithShort:(v118 >> 16)];
  uint64_t v31 = [v29 compare:v30];

  if (!v31)
  {
    v32 = [v5 additionalAttributes];
    int v33 = [v32 originalStableHash];
    id v34 = [v6 additionalAttributes];
    uint64_t v35 = [v34 originatingAssetIdentifier];
    int v36 = [v33 isEqualToString:v35];

    if (v36)
    {
      HIWORD(v118) = 5;
      uint64_t v37 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = [(PLDuplicateAsset *)self shortDescription];
        uint64_t v39 = [v4 shortDescription];
        v40 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v38, v39];
        v41 = _PLDuplicateAssetLogString((uint64_t)v40, @"originatingAssetIdentifier", 0);

        *(_DWORD *)buf = 138543362;
        v120 = v41;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
    }
  }
  v42 = [NSNumber numberWithShort:(__int16)v118];
  v43 = [NSNumber numberWithShort:(v118 >> 16)];
  uint64_t v44 = [v42 compare:v43];

  if (!v44)
  {
    v45 = (void *)MEMORY[0x1E4F8CDF8];
    v46 = [v6 uniformTypeIdentifier];
    v47 = [v45 typeWithIdentifier:v46];

    uint64_t v48 = [v4 originalResolution];
    if (v48 != [(PLDuplicateAsset *)self originalResolution]) {
      goto LABEL_94;
    }
    if ([v47 conformsToType:*MEMORY[0x1E4F44498]]) {
      goto LABEL_94;
    }
    [(PLDuplicateAsset *)self _compareUTICheckFromOther:v4 scoreTuple:&v118];
    int v49 = v118;
    v50 = [NSNumber numberWithShort:(__int16)v118];
    int64_t v51 = [NSNumber numberWithShort:(v49 >> 16)];
    uint64_t v52 = [v50 compare:v51];

    if (v52)
    {
LABEL_94:

      goto LABEL_95;
    }
    if ([(PLDuplicateAsset *)self locationUpdated])
    {
LABEL_53:
      int v77 = [v6 hasAdjustments];
      if (v77 != [v5 hasAdjustments])
      {
        if ([v6 hasAdjustments]) {
          __int16 v78 = 5;
        }
        else {
          __int16 v78 = 0;
        }
        LOWORD(v118) = v78 + v118;
        if ([v5 hasAdjustments]) {
          __int16 v79 = 5;
        }
        else {
          __int16 v79 = 0;
        }
        HIWORD(v118) += v79;
        v80 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v81 = [(PLDuplicateAsset *)self shortDescription];
          v82 = [v4 shortDescription];
          v83 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v81, v82];
          v84 = _PLDuplicateAssetLogString((uint64_t)v83, @"adjustments", 0);

          *(_DWORD *)buf = 138543362;
          v120 = v84;
          _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
      }
      int v85 = [v6 hdrType];
      if (v85 != [v5 hdrType])
      {
        int v86 = [v6 hdrType];
        if (v86 <= (int)[v5 hdrType]) {
          __int16 v87 = 0;
        }
        else {
          __int16 v87 = 5;
        }
        LOWORD(v118) = v87 + v118;
        int v88 = [v5 hdrType];
        if (v88 <= (int)[v6 hdrType]) {
          __int16 v89 = 0;
        }
        else {
          __int16 v89 = 5;
        }
        HIWORD(v118) += v89;
        v90 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          v91 = [(PLDuplicateAsset *)self shortDescription];
          v92 = [v4 shortDescription];
          v93 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v91, v92];
          v94 = _PLDuplicateAssetLogString((uint64_t)v93, @"HDR", 0);

          *(_DWORD *)buf = 138543362;
          v120 = v94;
          _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
      }
      int v95 = [v6 depthType];
      if (v95 != [v5 depthType])
      {
        if ([v5 depthType]) {
          __int16 v96 = 0;
        }
        else {
          __int16 v96 = 5;
        }
        LOWORD(v118) = v96 + v118;
        if ([v6 depthType]) {
          __int16 v97 = 0;
        }
        else {
          __int16 v97 = 5;
        }
        HIWORD(v118) += v97;
        v98 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
        {
          v99 = [(PLDuplicateAsset *)self shortDescription];
          v100 = [v4 shortDescription];
          v101 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v99, v100];
          v102 = _PLDuplicateAssetLogString((uint64_t)v101, @"Depth Data", 0);

          *(_DWORD *)buf = 138543362;
          v120 = v102;
          _os_log_impl(&dword_19B3C7000, v98, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
      }
      int v103 = [v5 playbackVariation];
      if (v103 != [v6 playbackVariation])
      {
        int v104 = [v5 playbackVariation];
        if ((v104 - 1) >= 3)
        {
          if (!v104) {
            LOWORD(v118) = v118 + 5;
          }
        }
        else
        {
          if ([v6 playbackVariation]) {
            __int16 v105 = 0;
          }
          else {
            __int16 v105 = 5;
          }
          HIWORD(v118) += v105;
        }
        v106 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
        {
          v107 = [(PLDuplicateAsset *)self shortDescription];
          v108 = [v4 shortDescription];
          v109 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v107, v108];
          v110 = _PLDuplicateAssetLogString((uint64_t)v109, @"Variation", 0);

          *(_DWORD *)buf = 138543362;
          v120 = v110;
          _os_log_impl(&dword_19B3C7000, v106, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
      }
      goto LABEL_94;
    }
    uint64_t v53 = [v6 location];
    uint64_t v54 = [v5 location];
    if (v53) {
      BOOL v55 = +[PLLocationUtils locationIsCoarse:v53];
    }
    else {
      BOOL v55 = 0;
    }
    BOOL v113 = v55;
    if (v54) {
      BOOL v112 = +[PLLocationUtils locationIsCoarse:v54];
    }
    else {
      BOOL v112 = 0;
    }
    v117 = (void *)v54;
    uint64_t v56 = [v6 extendedAttributes];
    v57 = [v56 latitude];
    if (v57)
    {
      v58 = [v6 extendedAttributes];
      v59 = [v58 longitude];
      BOOL v60 = v59 != 0;
    }
    else
    {
      BOOL v60 = 0;
    }
    v115 = (void *)v53;

    v61 = [v5 extendedAttributes];
    v62 = [v61 latitude];
    if (v62)
    {
      v63 = [v5 extendedAttributes];
      v64 = [v63 longitude];
      BOOL v65 = v64 != 0;
    }
    else
    {
      BOOL v65 = 0;
    }

    int v66 = v65 || !v60;
    if (((v113 && !v112) & v66) == 1 || !v60 && v65)
    {
      HIWORD(v118) += 5;
      [v4 setResourceComparisonPropertyUpdateLocation:1];
      v68 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v73 = [(PLDuplicateAsset *)self shortDescription];
        v74 = [v4 shortDescription];
        v75 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v73, v74];
        v76 = _PLDuplicateAssetLogString((uint64_t)v75, @"location", 0);

        *(_DWORD *)buf = 138543362;
        v120 = v76;
        _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      v67 = v117;
    }
    else
    {
      v67 = v117;
      if ((!v112 || v113) & v66)
      {
LABEL_52:

        goto LABEL_53;
      }
      LOWORD(v118) = v118 + 5;
      v68 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v69 = [(PLDuplicateAsset *)self shortDescription];
        v70 = [v4 shortDescription];
        v71 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", (__int16)v118, (v118 >> 16), v69, v70];
        v72 = _PLDuplicateAssetLogString((uint64_t)v71, @"location", 0);

        *(_DWORD *)buf = 138543362;
        v120 = v72;
        _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        v67 = v117;
      }
    }

    goto LABEL_52;
  }
LABEL_95:

  return (PLDuplicateAssetScoreTuple)v118;
}

BOOL __63__PLDuplicateAsset__compareResourcesAdditionalChecksFromOther___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 cplType] == 18;
  }

  return v3;
}

BOOL __63__PLDuplicateAsset__compareResourcesAdditionalChecksFromOther___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 cplType] == 18;
  }

  return v3;
}

- (PLDuplicateAssetScoreTuple)_compareResourcesNotMatchingPlaybackStyleAndKindSubTypeCheckFromOther:(id)a3 error:(id *)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 asset];
  int v8 = [(PLDuplicateAsset *)self asset];
  int v9 = [v8 kindSubtype];
  int v10 = [v7 kindSubtype];
  BOOL v11 = 0;
  signed int v12 = 0;
  if (v10 > 9)
  {
    if ((v10 - 100) < 5)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F8C500];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      v47 = @"Unexpected processing video kindSubtype";
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      BOOL v11 = [v13 errorWithDomain:v14 code:49407 userInfo:v15];

      uint64_t v16 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        unsigned __int16 var0 = -1;
        signed int v12 = -65536;
        goto LABEL_7;
      }
      uint64_t v17 = [v6 shortDescription];
      int v18 = [(PLDuplicateAsset *)self shortDescription];
      *(_DWORD *)buf = 138543618;
      int64_t v51 = v17;
      __int16 v52 = 2114;
      uint64_t v53 = v18;
      int v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
LABEL_5:
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);

      goto LABEL_6;
    }
    unsigned __int16 var0 = 0;
    if (v10 != 10) {
      goto LABEL_7;
    }
    if (v9)
    {
      if ((unsigned __int16)v9 != 2)
      {
        v43 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v44 = *MEMORY[0x1E4F8C500];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        int v49 = @"Unexpected processing kindSubtype";
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        BOOL v11 = [v43 errorWithDomain:v44 code:49407 userInfo:v45];

        uint64_t v16 = PLDuplicateDetectionGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_6;
        }
        uint64_t v17 = [v6 shortDescription];
        int v18 = [(PLDuplicateAsset *)self shortDescription];
        *(_DWORD *)buf = 138543618;
        int64_t v51 = v17;
        __int16 v52 = 2114;
        uint64_t v53 = v18;
        int v19 = "Duplicate Asset: Resource matching error, unexpected processing of kindSubtype [%{public}@ -> %{public}@]";
        goto LABEL_5;
      }
      v32 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        int v33 = [(PLDuplicateAsset *)self shortDescription];
        id v34 = [v6 shortDescription];
        v38 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v33, v34];
        int v36 = _PLDuplicateAssetLogString((uint64_t)v38, @"live photo/screenshot", @"no matching");

        *(_DWORD *)buf = 138543362;
        int64_t v51 = v36;
        goto LABEL_34;
      }
LABEL_35:

      signed int v12 = 0;
      BOOL v11 = 0;
      unsigned __int16 var0 = 5;
      goto LABEL_7;
    }
LABEL_38:
    PLDuplicateAssetScoreTuple v39 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesAdditionalChecksFromOther:v6];
    unsigned __int16 var0 = v39.var0;
    BOOL v11 = 0;
    signed int v12 = *(_DWORD *)&v39 & 0xFFFF0000;
    goto LABEL_7;
  }
  if (!v10)
  {
    if (v9 == 10) {
      goto LABEL_21;
    }
    if ((unsigned __int16)v9 == 2)
    {
LABEL_23:
      v32 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_35;
      }
      int v33 = [(PLDuplicateAsset *)self shortDescription];
      id v34 = [v6 shortDescription];
      uint64_t v35 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v33, v34];
      int v36 = _PLDuplicateAssetLogString((uint64_t)v35, @"live photo over image", @"no matching");

      *(_DWORD *)buf = 138543362;
      int64_t v51 = v36;
LABEL_34:
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      goto LABEL_35;
    }
    if ((unsigned __int16)v9 == 1)
    {
LABEL_21:
      if ([v7 playbackStyle] == 2) {
        goto LABEL_38;
      }
      if (v9 == 2) {
        goto LABEL_23;
      }
    }
    signed int v12 = 0;
    unsigned __int16 var0 = 0;
    BOOL v11 = 0;
    goto LABEL_7;
  }
  if (v10 == 1)
  {
    if (v9)
    {
      if ((unsigned __int16)v9 == 2)
      {
        v32 = PLDuplicateDetectionGetLog();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        int v33 = [(PLDuplicateAsset *)self shortDescription];
        id v34 = [v6 shortDescription];
        uint64_t v37 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v33, v34];
        int v36 = _PLDuplicateAssetLogString((uint64_t)v37, @"live photo over pano", @"no matching");

        *(_DWORD *)buf = 138543362;
        int64_t v51 = v36;
        goto LABEL_34;
      }
    }
    else if ([v8 playbackStyle] == 2)
    {
      goto LABEL_38;
    }
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F8C500];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v55[0] = @"Unexpected processing kindSubtype";
    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    BOOL v11 = [v40 errorWithDomain:v41 code:49407 userInfo:v42];

    uint64_t v16 = PLDuplicateDetectionGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v17 = [v6 shortDescription];
    int v18 = [(PLDuplicateAsset *)self shortDescription];
    *(_DWORD *)buf = 138543618;
    int64_t v51 = v17;
    __int16 v52 = 2114;
    uint64_t v53 = v18;
    int v19 = "Duplicate Asset: Resource matching error, unexpected processing of kindSubtype [%{public}@ -> %{public}@]";
    goto LABEL_5;
  }
  unsigned __int16 var0 = 0;
  if (v10 == 2)
  {
    v27 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = [(PLDuplicateAsset *)self shortDescription];
      uint64_t v29 = [v6 shortDescription];
      id v30 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 0, 5, v28, v29];
      uint64_t v31 = _PLDuplicateAssetLogString((uint64_t)v30, @"live photo", @"no matching");

      *(_DWORD *)buf = 138543362;
      int64_t v51 = v31;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    unsigned __int16 var0 = 0;
    BOOL v11 = 0;
    signed int v12 = 327680;
  }
LABEL_7:
  BOOL v21 = [NSNumber numberWithShort:(__int16)var0];
  uint64_t v22 = [NSNumber numberWithShort:(v12 >> 16)];
  uint64_t v23 = [v21 compare:v22];

  id v24 = v11;
  uint64_t v25 = v24;
  if (var0 == 0xFFFF && !v23 && a4) {
    *a4 = v24;
  }

  return (PLDuplicateAssetScoreTuple)(var0 | v12);
}

- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingPlaybackStyleCheckFromOther:(id)a3 error:(id *)a4
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 asset];
  int v8 = [(PLDuplicateAsset *)self asset];
  int v9 = [v7 kindSubtype];
  int v10 = 0;
  unsigned int v11 = 0;
  if (v9 <= 99)
  {
    if ((v9 - 1) < 2)
    {
      int v23 = [v7 kindSubtype];
      unsigned int v11 = 5;
      if (v23 <= (int)[v8 kindSubtype])
      {
        int v28 = [v8 kindSubtype];
        if (v28 == 10) {
          unsigned int v12 = 0;
        }
        else {
          unsigned int v12 = 5;
        }
        if (v28 == 10) {
          int v29 = 5;
        }
        else {
          int v29 = 0;
        }
        unsigned int v11 = v29;
      }
      else
      {
        unsigned int v12 = 0;
      }
      uint64_t v16 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v30 = [(PLDuplicateAsset *)self shortDescription];
        uint64_t v31 = [v6 shortDescription];
        v32 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", v12, v11, v30, v31];
        _PLDuplicateAssetLogString((uint64_t)v32, @"pano/live photo", @"matching playbackStyle");
        id v61 = v6;
        int v33 = v7;
        id v34 = v8;
        v36 = uint64_t v35 = a4;

        *(_DWORD *)buf = 138543362;
        v69 = v36;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        a4 = v35;
        int v8 = v34;
        uint64_t v7 = v33;
        id v6 = v61;
      }
    }
    else
    {
      if (v9)
      {
        unsigned int v12 = 0;
        if (v9 != 10) {
          goto LABEL_30;
        }
        if ([v8 kindSubtype] == 10)
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v21 = *MEMORY[0x1E4F8C500];
          uint64_t v64 = *MEMORY[0x1E4F28568];
          BOOL v65 = @"Unexpected processing kindSubtype PLAssetSubtypeScreenshot";
          uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
          int v10 = [v20 errorWithDomain:v21 code:49407 userInfo:v22];

          uint64_t v16 = PLDuplicateDetectionGetLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_6;
          }
          uint64_t v17 = [v6 shortDescription];
          int v18 = [(PLDuplicateAsset *)self shortDescription];
          *(_DWORD *)buf = 138543618;
          v69 = v17;
          __int16 v70 = 2114;
          v71 = v18;
          int v19 = "Duplicate Asset: Resource matching error, unexpected processing kind subtype PLAssetSubtypeScreenshot [%"
                "{public}@ -> %{public}@]";
          goto LABEL_5;
        }
        uint64_t v16 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v43 = [(PLDuplicateAsset *)self shortDescription];
          uint64_t v44 = [v6 shortDescription];
          unsigned int v12 = 5;
          v45 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v43, v44];
          _PLDuplicateAssetLogString((uint64_t)v45, @"screenshot", @"matching playbackStyle");
          v47 = uint64_t v46 = a4;

          *(_DWORD *)buf = 138543362;
          v69 = v47;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

          a4 = v46;
          unsigned int v11 = 0;
          int v10 = 0;
          goto LABEL_29;
        }
LABEL_44:
        unsigned int v11 = 0;
        int v10 = 0;
        unsigned int v12 = 5;
        goto LABEL_29;
      }
      int v24 = [v8 kindSubtype];
      int v10 = 0;
      unsigned int v11 = 0;
      if (v24 > 99)
      {
        unsigned int v12 = 0;
        if ((v24 - 100) < 5)
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = *MEMORY[0x1E4F8C500];
          uint64_t v66 = *MEMORY[0x1E4F28568];
          v67 = @"Unexpected processing video kindSubtype";
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          int v10 = [v25 errorWithDomain:v26 code:49407 userInfo:v27];

          uint64_t v16 = PLDuplicateDetectionGetLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_6;
          }
          uint64_t v17 = [v6 shortDescription];
          int v18 = [(PLDuplicateAsset *)self shortDescription];
          *(_DWORD *)buf = 138543618;
          v69 = v17;
          __int16 v70 = 2114;
          v71 = v18;
          int v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
          goto LABEL_5;
        }
        goto LABEL_30;
      }
      if ((v24 - 1) < 2)
      {
        uint64_t v16 = PLDuplicateDetectionGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_44;
        }
        uint64_t v53 = [(PLDuplicateAsset *)self shortDescription];
        uint64_t v54 = [v6 shortDescription];
        unsigned int v12 = 5;
        BOOL v55 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v53, v54];
        _PLDuplicateAssetLogString((uint64_t)v55, @"pano/live photo", @"matching playbackStyle");
        v57 = uint64_t v56 = a4;

        *(_DWORD *)buf = 138543362;
        v69 = v57;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        a4 = v56;
        unsigned int v11 = 0;
      }
      else
      {
        if (!v24)
        {
          v58 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v59 = *MEMORY[0x1E4F8C500];
          uint64_t v72 = *MEMORY[0x1E4F28568];
          v73[0] = @"Unexpected processing kindSubtype PLAssetSubtypeNone";
          BOOL v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
          int v10 = [v58 errorWithDomain:v59 code:49407 userInfo:v60];

          uint64_t v16 = PLDuplicateDetectionGetLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_6;
          }
          uint64_t v17 = [v6 shortDescription];
          int v18 = [(PLDuplicateAsset *)self shortDescription];
          *(_DWORD *)buf = 138543618;
          v69 = v17;
          __int16 v70 = 2114;
          v71 = v18;
          int v19 = "Duplicate Asset: Resource matching error, unexpected processing kind subtype PLAssetSubtypeNone [%{publi"
                "c}@ -> %{public}@]";
          goto LABEL_5;
        }
        unsigned int v12 = 0;
        if (v24 != 10) {
          goto LABEL_30;
        }
        uint64_t v16 = PLDuplicateDetectionGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v12 = 0;
          int v10 = 0;
          unsigned int v11 = 5;
          goto LABEL_29;
        }
        uint64_t v48 = [(PLDuplicateAsset *)self shortDescription];
        int v49 = [v6 shortDescription];
        unsigned int v11 = 5;
        v50 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 0, 5, v48, v49];
        _PLDuplicateAssetLogString((uint64_t)v50, @"screenshot", @"matching playbackStyle");
        v52 = int64_t v51 = a4;

        *(_DWORD *)buf = 138543362;
        v69 = v52;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        a4 = v51;
        unsigned int v12 = 0;
      }
    }
    int v10 = 0;
    goto LABEL_29;
  }
  unsigned int v12 = 0;
  if ((v9 - 100) < 5)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    v63 = @"Unexpected processing video kindSubtype";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    int v10 = [v13 errorWithDomain:v14 code:49407 userInfo:v15];

    uint64_t v16 = PLDuplicateDetectionGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_6:
      unsigned int v11 = 0xFFFF;
      unsigned int v12 = 0xFFFF;
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v17 = [v6 shortDescription];
    int v18 = [(PLDuplicateAsset *)self shortDescription];
    *(_DWORD *)buf = 138543618;
    v69 = v17;
    __int16 v70 = 2114;
    v71 = v18;
    int v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
LABEL_5:
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);

    goto LABEL_6;
  }
LABEL_30:
  uint64_t v37 = [NSNumber numberWithShort:(__int16)v12];
  v38 = [NSNumber numberWithShort:(__int16)v11];
  uint64_t v39 = [v37 compare:v38];

  id v40 = v10;
  uint64_t v41 = v40;
  if (v12 == 0xFFFF && !v39 && a4) {
    *a4 = v40;
  }

  return (PLDuplicateAssetScoreTuple)(v12 | (v11 << 16));
}

- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingKindSubtypeCheckFromOther:(id)a3 error:(id *)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 asset];
  int v8 = [(PLDuplicateAsset *)self asset];
  int v9 = [v7 kindSubtype];
  int v10 = 0;
  LODWORD(v11) = 0;
  unint64_t v12 = 0x1E4F28000uLL;
  if (v9 > 99)
  {
    int var0 = 0;
    if ((v9 - 100) < 5)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F8C500];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      uint64_t v44 = @"Unexpected processing a video kindSubtype";
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      int v10 = [v14 errorWithDomain:v15 code:49407 userInfo:v16];

      uint64_t v11 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v6 shortDescription];
        int v18 = [(PLDuplicateAsset *)self shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v17;
        __int16 v47 = 2114;
        uint64_t v48 = v18;
        int v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
LABEL_5:
        _os_log_impl(&dword_19B3C7000, (os_log_t)v11, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);
      }
LABEL_6:

      LODWORD(v11) = 0xFFFF;
      int var0 = 0xFFFF;
    }
    goto LABEL_11;
  }
  if (v9 < 2)
  {
LABEL_10:
    PLDuplicateAssetScoreTuple v20 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesAdditionalChecksFromOther:v6];
    int v10 = 0;
    LODWORD(v11) = HIWORD(*(unsigned int *)&v20);
    int var0 = (unsigned __int16)v20.var0;
    goto LABEL_11;
  }
  if (v9 != 2)
  {
    int var0 = 0;
    if (v9 != 10) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  switch([v7 playbackStyle])
  {
    case 0u:
      uint64_t v11 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
      {
        int v36 = [(PLDuplicateAsset *)self shortDescription];
        uint64_t v37 = [v6 shortDescription];
        v38 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v36, v37];
        uint64_t v39 = _PLDuplicateAssetLogString((uint64_t)v38, @"playbackStyle", @"matching kindSubtype");

        *(_DWORD *)buf = 138543362;
        uint64_t v46 = v39;
        _os_log_impl(&dword_19B3C7000, (os_log_t)v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        unint64_t v12 = 0x1E4F28000uLL;
      }

      LODWORD(v11) = 0;
      int v10 = 0;
      int var0 = 5;
      break;
    case 1u:
    case 2u:
    case 3u:
    case 5u:
      unsigned int v27 = [v7 playbackStyle];
      if (v27 <= [v8 playbackStyle]) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 5;
      }
      int v28 = [NSNumber numberWithShort:0];
      int v29 = [NSNumber numberWithShort:v11];
      uint64_t v30 = [v28 compare:v29];

      if (v30)
      {
        uint64_t v31 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v32 = [(PLDuplicateAsset *)self shortDescription];
          int v33 = [v6 shortDescription];
          id v34 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 0, v11, v32, v33];
          uint64_t v35 = _PLDuplicateAssetLogString((uint64_t)v34, @"playbackStyle", @"matching kindSubtype");

          *(_DWORD *)buf = 138543362;
          uint64_t v46 = v35;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
      }
      int var0 = 0;
      int v10 = 0;
      unint64_t v12 = 0x1E4F28000;
      break;
    case 4u:
      id v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F8C500];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50[0] = @"Unexpected processing a video playbackStyle";
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
      int v10 = [v40 errorWithDomain:v41 code:49407 userInfo:v42];

      uint64_t v11 = PLDuplicateDetectionGetLog();
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      uint64_t v17 = [v6 shortDescription];
      int v18 = [(PLDuplicateAsset *)self shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v17;
      __int16 v47 = 2114;
      uint64_t v48 = v18;
      int v19 = "Duplicate Asset: Resource matching error, unexpected processing a video playbackStyle [%{public}@ -> %{public}@]";
      goto LABEL_5;
    default:
      LODWORD(v11) = 0;
      int var0 = 0;
      int v10 = 0;
      break;
  }
LABEL_11:
  uint64_t v21 = [*(id *)(v12 + 3792) numberWithShort:(__int16)var0];
  uint64_t v22 = [*(id *)(v12 + 3792) numberWithShort:(__int16)v11];
  uint64_t v23 = [v21 compare:v22];

  id v24 = v10;
  uint64_t v25 = v24;
  if (var0 == 0xFFFF && !v23 && a4) {
    *a4 = v24;
  }

  return (PLDuplicateAssetScoreTuple)(var0 | (v11 << 16));
}

- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingPlaybackStyleAndKindSubTypeCheckFromOther:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 asset];
  id v6 = [(PLDuplicateAsset *)self asset];
  int v7 = [v5 RAWBadgeAttribute];
  if (v7 == [v6 RAWBadgeAttribute]) {
    goto LABEL_2;
  }
  int v10 = [v5 RAWBadgeAttribute];
  if ((v10 - 1) < 2)
  {
    int v16 = [v6 RAWBadgeAttribute];
    if (v16 != 3 && v16) {
      goto LABEL_2;
    }
    uint64_t v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [(PLDuplicateAsset *)self shortDescription];
      int v18 = [v4 shortDescription];
      uint64_t v8 = 5;
      int v19 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 0, 5, v17, v18];
      PLDuplicateAssetScoreTuple v20 = _PLDuplicateAssetLogString((uint64_t)v19, @"R+J vs non-R+J", 0);

      *(_DWORD *)buf = 138543362;
      int v36 = v20;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      uint64_t v9 = 0;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v10 == 3)
  {
    int v21 = [v6 RAWBadgeAttribute];
    if ((v21 - 1) < 2)
    {
      uint64_t v11 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [(PLDuplicateAsset *)self shortDescription];
        uint64_t v23 = [v4 shortDescription];
        id v24 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v22, v23];
        uint64_t v25 = _PLDuplicateAssetLogString((uint64_t)v24, @"non-R+J vs R+J", 0);

        *(_DWORD *)buf = 138543362;
        int v36 = v25;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        uint64_t v8 = 0;
        uint64_t v9 = 5;
        goto LABEL_20;
      }
LABEL_15:
      uint64_t v8 = 0;
      uint64_t v9 = 5;
      goto LABEL_20;
    }
    if (v21)
    {
LABEL_2:
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      goto LABEL_21;
    }
    uint64_t v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = [(PLDuplicateAsset *)self shortDescription];
      unsigned int v27 = [v4 shortDescription];
      int v28 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 0, 5, v26, v27];
      int v29 = _PLDuplicateAssetLogString((uint64_t)v28, @"RAW vs non-RAW", 0);

      *(_DWORD *)buf = 138543362;
      int v36 = v29;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      uint64_t v9 = 0;
      uint64_t v8 = 5;
      goto LABEL_20;
    }
LABEL_19:
    uint64_t v9 = 0;
    uint64_t v8 = 5;
    goto LABEL_20;
  }
  if (v10) {
    goto LABEL_2;
  }
  uint64_t v11 = PLDuplicateDetectionGetLog();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_15;
  }
  unint64_t v12 = [(PLDuplicateAsset *)self shortDescription];
  v13 = [v4 shortDescription];
  uint64_t v9 = 5;
  uint64_t v14 = [NSString stringWithFormat:@"Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]", 5, 0, v12, v13];
  uint64_t v15 = _PLDuplicateAssetLogString((uint64_t)v14, @"non-RAW vs RAW", 0);

  *(_DWORD *)buf = 138543362;
  int v36 = v15;
  _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

  uint64_t v8 = 0;
LABEL_20:

LABEL_21:
  uint64_t v30 = [NSNumber numberWithShort:v9];
  uint64_t v31 = [NSNumber numberWithShort:v8];
  uint64_t v32 = [v30 compare:v31];

  if (!v32)
  {
    PLDuplicateAssetScoreTuple v33 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesAdditionalChecksFromOther:v4];
    LOWORD(v9) = v33.var0;
    LODWORD(v8) = HIWORD(*(unsigned int *)&v33);
  }

  return (PLDuplicateAssetScoreTuple)((unsigned __int16)v9 | ((unsigned __int16)v8 << 16));
}

- (int64_t)compareResource:(id)a3 error:(id *)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 asset];
  uint64_t v8 = [(PLDuplicateAsset *)self asset];
  int v55 = 0;
  [(PLDuplicateAsset *)self _compareResourcesResetPropertiesWithOther:v6];
  int64_t v51 = v8;
  if ([v7 isReferencedAsset] & 1) != 0 || (objc_msgSend(v8, "isReferencedAsset"))
  {
    int v9 = 0;
    id v10 = 0;
    goto LABEL_4;
  }
  int v33 = [v7 kind];
  if (v33 != [v8 kind])
  {
    id v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F8C500];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    id v61 = @"Resource comparison skipped asset has incompatible asset kind";
    v42 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v43 = &v61;
    uint64_t v44 = &v60;
LABEL_24:
    v45 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
    id v10 = [v40 errorWithDomain:v41 code:49407 userInfo:v45];

    int v55 = -1;
    goto LABEL_35;
  }
  int v34 = [v7 kind];
  if ((v34 - 1) < 2)
  {
    PLDuplicateAssetScoreTuple v39 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesAdditionalChecksFromOther:v6];
    goto LABEL_26;
  }
  if (v34 == 3)
  {
    id v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F8C500];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    v63[0] = @"Resource comparison skipped asset has unknown asset kind";
    v42 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v43 = (__CFString **)v63;
    uint64_t v44 = &v62;
    goto LABEL_24;
  }
  if (v34)
  {
    id v10 = 0;
    goto LABEL_35;
  }
  int v35 = [v7 kindSubtype];
  int v36 = [v8 kindSubtype];
  int v37 = [v7 playbackStyle];
  int v38 = [v8 playbackStyle];
  if (v37 == v38 && v35 == v36)
  {
    PLDuplicateAssetScoreTuple v39 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesMatchingPlaybackStyleAndKindSubTypeCheckFromOther:v6];
LABEL_26:
    id v10 = 0;
    int v55 = (int)v39;
    goto LABEL_35;
  }
  if (v35 == v36)
  {
    uint64_t v54 = 0;
    PLDuplicateAssetScoreTuple v46 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesMatchingKindSubtypeCheckFromOther:v6 error:&v54];
    __int16 v47 = v54;
  }
  else if (v37 == v38)
  {
    uint64_t v53 = 0;
    PLDuplicateAssetScoreTuple v46 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesMatchingPlaybackStyleCheckFromOther:v6 error:&v53];
    __int16 v47 = v53;
  }
  else
  {
    __int16 v52 = 0;
    PLDuplicateAssetScoreTuple v46 = (PLDuplicateAssetScoreTuple)[(PLDuplicateAsset *)self _compareResourcesNotMatchingPlaybackStyleAndKindSubTypeCheckFromOther:v6 error:&v52];
    __int16 v47 = v52;
  }
  id v10 = v47;
  int v55 = (int)v46;
LABEL_35:
  int v9 = v55;
  uint64_t v48 = [NSNumber numberWithShort:(__int16)v55];
  uint64_t v49 = [NSNumber numberWithShort:(v9 >> 16)];
  uint64_t v50 = [v48 compare:v49];

  if ((_WORD)v9 != 0xFFFF || v50)
  {
    [(PLDuplicateAsset *)self _compareResourceReverseCheckFromOther:v6 score:&v55];
    int v9 = v55;
  }
LABEL_4:
  uint64_t v11 = [NSNumber numberWithShort:(__int16)v9];
  unint64_t v12 = [NSNumber numberWithShort:(v9 >> 16)];
  uint64_t v13 = [v11 compare:v12];

  id v14 = v10;
  uint64_t v15 = v14;
  if ((_WORD)v9 == 0xFFFF && !v13 && a4) {
    *a4 = v14;
  }

  int v16 = v55;
  uint64_t v17 = [NSNumber numberWithShort:(__int16)v55];
  int v18 = [NSNumber numberWithShort:(v16 >> 16)];
  uint64_t v19 = [v17 compare:v18];

  if ((_WORD)v16 == 0xFFFF && !v19)
  {
    PLDuplicateAssetScoreTuple v20 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = [v6 shortDescription];
      uint64_t v22 = [(PLDuplicateAsset *)self shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)v57 = v21;
      *(_WORD *)&v57[8] = 2114;
      *(void *)v58 = v22;
      *(_WORD *)&v58[8] = 2112;
      v59[0] = v15;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Duplicate Asset: Resource matching error for assets [%{public}@ -> %{public}@]. Error: %@", buf, 0x20u);
    }
  }
  uint64_t v23 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    int v24 = (__int16)v55;
    int v25 = SHIWORD(v55);
    uint64_t v26 = [(PLDuplicateAsset *)self shortDescription];
    unsigned int v27 = [v6 shortDescription];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v57 = v24;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v25;
    *(_WORD *)v58 = 2114;
    *(void *)&v58[2] = v26;
    LOWORD(v59[0]) = 2114;
    *(void *)((char *)v59 + 2) = v27;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "Duplicate Asset: Resource comparisonScore [%d:%d][%{public}@:%{public}@] (Final)", buf, 0x22u);
  }
  int v28 = v55;
  int v29 = [NSNumber numberWithShort:(__int16)v55];
  uint64_t v30 = [NSNumber numberWithShort:(v28 >> 16)];
  int64_t v31 = [v29 compare:v30];

  return v31;
}

- (void)_updateScoresUsingLatestDateWithDate:(id)a3 otherDate:(id)a4 score:(int64_t *)a5 otherScore:(int64_t *)a6
{
  if (a3 && a4)
  {
    uint64_t v8 = [a3 compare:a4];
    if (v8 == 1)
    {
      a6 = a5;
      if (!a5) {
        return;
      }
    }
    else if (v8 != -1 || !a6)
    {
      return;
    }
    *a6 += 5;
  }
}

- (BOOL)_validCPLAssetsWithAssets:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PLDuplicateAsset__validCPLAssetsWithAssets___block_invoke;
  v6[3] = &unk_1E586A420;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__PLDuplicateAsset__validCPLAssetsWithAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 asset];
  uint64_t v7 = [v6 objectIDsForRelationshipNamed:@"master"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 count] != 0;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
}

- (void)_mergeComparisonScoreModifierWithOtherAsset:(id)a3 score:(int64_t *)a4 otherScore:(int64_t *)a5
{
  v66[2] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (PLDuplicateAsset *)a3;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_67:
    uint64_t v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"PLDuplicateAsset.m", 508, @"Invalid parameter not satisfying: %@", @"score" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_68;
  }
  __int16 v52 = [MEMORY[0x1E4F28B00] currentHandler];
  [v52 handleFailureInMethod:a2, self, @"PLDuplicateAsset.m", 507, @"Invalid parameter not satisfying: %@", @"other" object file lineNumber description];

  if (!a4) {
    goto LABEL_67;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_68:
  uint64_t v54 = [MEMORY[0x1E4F28B00] currentHandler];
  [v54 handleFailureInMethod:a2, self, @"PLDuplicateAsset.m", 509, @"Invalid parameter not satisfying: %@", @"otherScore" object file lineNumber description];

LABEL_4:
  [(PLDuplicateAsset *)self setResourceSwapDisabled:0];
  [(PLDuplicateAsset *)v9 setResourceSwapDisabled:0];
  if (![(PLDuplicateAsset *)self isCPLEnabled])
  {
    int v18 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Duplicate Asset: iCPL not enabled, skipping further comparison score updates", buf, 2u);
    }
    goto LABEL_19;
  }
  char v10 = [(PLDuplicateAsset *)self asset];
  int v11 = [v10 activeLibraryScopeParticipationState];

  unint64_t v12 = [(PLDuplicateAsset *)v9 asset];
  int v13 = [v12 activeLibraryScopeParticipationState];

  BOOL v14 = v11 == 1;
  BOOL v15 = v13 == 1 && v11 == 1;
  if (v13 == 1) {
    BOOL v14 = 1;
  }
  if (v11 == v13 || !v14)
  {
    if (v15)
    {
LABEL_22:
      PLDuplicateAssetScoreTuple v20 = [(PLDuplicateAsset *)self assetCloudScopedIdentifier];
      uint64_t v21 = [(PLDuplicateAsset *)v9 assetCloudScopedIdentifier];
      uint64_t v22 = (void *)v21;
      if (!v20 || !v21)
      {
        if (v20) {
          id v40 = v9;
        }
        else {
          id v40 = self;
        }
        [(PLDuplicateAsset *)v40 setMergeStatus:2];
        int v24 = PLDuplicateDetectionGetLog();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
LABEL_53:

          if (v15) {
            goto LABEL_20;
          }
          goto LABEL_54;
        }
        unsigned int v27 = [(PLDuplicateAsset *)self shortDescription];
        int v29 = [(PLDuplicateAsset *)v9 shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v63 = (uint64_t)v27;
        __int16 v64 = 2114;
        id v65 = v29;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Duplicate Asset: CPL assets missing cloud identifiers: [%{public}@ : %{public}@]", buf, 0x16u);
        goto LABEL_51;
      }
      v61[0] = v20;
      v61[1] = v21;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
      int v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_45701];

      int v25 = [v24 objectAtIndexedSubscript:0];
      int v26 = [v25 isEqualToString:v20];

      if (v26)
      {
        *a4 = *a5 + 1;
        unsigned int v27 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v57 = [(PLDuplicateAsset *)self shortDescription];
          int v28 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v57, *a4];
          uint64_t v55 = _PLDuplicateAssetLogString((uint64_t)v28, @"cloudScopedIdentifier", 0);

          *(_DWORD *)buf = 138543362;
          int v29 = (void *)v55;
          uint64_t v63 = v55;
LABEL_50:
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_51:
        }
      }
      else
      {
        *a5 = *a4 + 1;
        unsigned int v27 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v57 = [(PLDuplicateAsset *)v9 shortDescription];
          __int16 v47 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v57, *a5];
          uint64_t v56 = _PLDuplicateAssetLogString((uint64_t)v47, @"cloudScopedIdentifier", 0);

          *(_DWORD *)buf = 138543362;
          int v29 = (void *)v56;
          uint64_t v63 = v56;
          goto LABEL_50;
        }
      }

      goto LABEL_53;
    }
    v66[0] = self;
    v66[1] = v9;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
    BOOL v31 = [(PLDuplicateAsset *)self _validCPLAssetsWithAssets:v30];

    if (!v31)
    {
      uint64_t v60 = self;
      uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      BOOL v42 = [(PLDuplicateAsset *)self _validCPLAssetsWithAssets:v41];

      if (v42)
      {
        *a4 = *a5 + 1;
        [(PLDuplicateAsset *)self setResourceSwapDisabled:1];
        int v18 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v43 = [(PLDuplicateAsset *)self shortDescription];
          uint64_t v44 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v43, *a4];
          v45 = _PLDuplicateAssetLogString((uint64_t)v44, @"master", 0);

          *(_DWORD *)buf = 138543362;
          uint64_t v63 = (uint64_t)v45;
LABEL_47:
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v59 = v9;
      uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      BOOL v50 = [(PLDuplicateAsset *)self _validCPLAssetsWithAssets:v49];

      if (!v50) {
        goto LABEL_20;
      }
      *a5 = *a4 + 1;
      [(PLDuplicateAsset *)v9 setResourceSwapDisabled:1];
      int v36 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        int v37 = [(PLDuplicateAsset *)v9 shortDescription];
        int64_t v51 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v37, *a5];
        PLDuplicateAssetScoreTuple v39 = _PLDuplicateAssetLogString((uint64_t)v51, @"master", 0);

        *(_DWORD *)buf = 138543362;
        uint64_t v63 = (uint64_t)v39;
        goto LABEL_35;
      }
LABEL_36:

      goto LABEL_20;
    }
    id v58 = 0;
    int64_t v32 = [(PLDuplicateAsset *)self compareResource:v9 error:&v58];
    id v33 = v58;
    if (v33)
    {
      [(PLDuplicateAsset *)self setMergeStatus:2];
      [(PLDuplicateAsset *)v9 setMergeStatus:2];
      int v34 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v35 = [(PLDuplicateAsset *)v9 shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v63 = (uint64_t)v35;
        __int16 v64 = 2112;
        id v65 = v33;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Duplicate Asset: Resource comparison failure for duplicate asset: %{public}@. Error: %@", buf, 0x16u);
      }
    }
    else
    {
      switch(v32)
      {
        case 1:
          *a4 = *a5 + 1;
          break;
        case 0:
          goto LABEL_22;
        case -1:
          *a5 = *a4 + 1;
          break;
      }
    }

LABEL_54:
    if (*a4 <= *a5) {
      uint64_t v48 = v9;
    }
    else {
      uint64_t v48 = self;
    }
    [(PLDuplicateAsset *)v48 setResourceSwapDisabled:1];
    goto LABEL_20;
  }
  int v16 = [(PLDuplicateAsset *)self asset];
  int v17 = [v16 duplicateAssetVisibilityState];

  if ((v17 - 1) < 2)
  {
    *a5 = *a4 + 1;
    int v36 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      int v37 = [(PLDuplicateAsset *)v9 shortDescription];
      int v38 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v37, *a5];
      PLDuplicateAssetScoreTuple v39 = _PLDuplicateAssetLogString((uint64_t)v38, @"duplicateAssetVisibilityState", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v63 = (uint64_t)v39;
LABEL_35:
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      goto LABEL_36;
    }
    goto LABEL_36;
  }
  if (v17 == 100)
  {
    *a4 = *a5 + 1;
    int v18 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = [(PLDuplicateAsset *)self shortDescription];
      PLDuplicateAssetScoreTuple v46 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v43, *a4];
      v45 = _PLDuplicateAssetLogString((uint64_t)v46, @"duplicateAssetVisibilityState", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v63 = (uint64_t)v45;
      goto LABEL_47;
    }
    goto LABEL_19;
  }
  if (!v17)
  {
    [(PLDuplicateAsset *)self setMergeStatus:2];
    int v18 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(PLDuplicateAsset *)v9 shortDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v63 = (uint64_t)v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Duplicate Asset: Invalid visibility state PLDuplicateAssetVisibilityStateNotDuplicate for duplicate asset: %{public}@", buf, 0xCu);
    }
    goto LABEL_19;
  }
LABEL_20:
}

uint64_t __81__PLDuplicateAsset__mergeComparisonScoreModifierWithOtherAsset_score_otherScore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_tieBreakerComparisonScoreWithOtherAsset:(id)a3 score:(int64_t *)a4 otherScore:(int64_t *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![(PLDuplicateAsset *)self hasModifiedUserDateCreated]
    && ([v8 hasModifiedUserDateCreated] & 1) == 0)
  {
    uint64_t v9 = [(PLDuplicateAsset *)self asset];
    uint64_t v10 = [v9 dateCreated];

    int v11 = [v8 asset];
    uint64_t v12 = [v11 dateCreated];

    if (v10 && v12)
    {
      int64_t v13 = [(PLDuplicateAsset *)self _correctedCompareDate:v10 otherDate:v12];
      BOOL v14 = a4;
      if (v13 != -1)
      {
        BOOL v14 = a5;
        if (v13 != 1) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      if (v10) {
        BOOL v14 = a4;
      }
      else {
        BOOL v14 = a5;
      }
      if (!(v10 | v12)) {
        goto LABEL_13;
      }
    }
    *v14 += 5;
LABEL_13:
  }
  if (*a4 != *a5)
  {
    BOOL v15 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int64_t v16 = *a4;
      int64_t v17 = *a5;
      int v18 = [(PLDuplicateAsset *)self shortDescription];
      uint64_t v19 = [v8 shortDescription];
      int v20 = 134218754;
      int64_t v21 = v16;
      __int16 v22 = 2048;
      int64_t v23 = v17;
      __int16 v24 = 2114;
      int v25 = v18;
      __int16 v26 = 2114;
      unsigned int v27 = v19;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Duplicate Asset: tie breaker comparisonScore [%tu:%tu][%{public}@:%{public}@]", (uint8_t *)&v20, 0x2Au);
    }
  }
}

- (int64_t)_correctedCompareDate:(id)a3 otherDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToDate:v6])
  {
    int64_t v7 = 0;
  }
  else
  {
    [v5 timeIntervalSinceDate:v6];
    double v9 = fabs(v8);
    uint64_t v10 = -1;
    if (v8 >= 0.0) {
      uint64_t v10 = 1;
    }
    if (v9 >= 1.0) {
      int64_t v7 = v10;
    }
    else {
      int64_t v7 = 0;
    }
  }

  return v7;
}

- (int64_t)compare:(id)a3 enabledMergeComparison:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(PLDuplicateAsset *)self score];
  int64_t v58 = v7;
  uint64_t v8 = [v6 score];
  uint64_t v57 = v8;
  double v9 = [(PLDuplicateAsset *)self asset];
  int v10 = [v9 hasAdjustments];

  int v11 = [v6 asset];
  int v12 = [v11 hasAdjustments];

  if (!v10 || !v12) {
    goto LABEL_12;
  }
  int64_t v13 = [(PLDuplicateAsset *)self asset];
  BOOL v14 = [v13 additionalAttributes];
  BOOL v15 = [v14 unmanagedAdjustment];
  int64_t v16 = [v15 adjustmentTimestamp];

  int64_t v17 = [v6 asset];
  int v18 = [v17 additionalAttributes];
  uint64_t v19 = [v18 unmanagedAdjustment];
  int v20 = [v19 adjustmentTimestamp];

  [(PLDuplicateAsset *)self _updateScoresUsingLatestDateWithDate:v16 otherDate:v20 score:&v58 otherScore:&v57];
  if (v7 != v58)
  {
    int64_t v21 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      __int16 v22 = [(PLDuplicateAsset *)self shortDescription];
      int v25 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v22, v58];
      __int16 v24 = _PLDuplicateAssetLogString((uint64_t)v25, @"latest Adjustment", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v24;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v8 != v57)
  {
    int64_t v21 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      __int16 v22 = [v6 shortDescription];
      int64_t v23 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v22, v57];
      __int16 v24 = _PLDuplicateAssetLogString((uint64_t)v23, @"latest Adjustment", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v24;
LABEL_9:
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  if ([(PLDuplicateAsset *)self hasModifiedUserTitle]
    && ([v6 hasModifiedUserTitle] & 1) != 0
    || [(PLDuplicateAsset *)self hasModifiedUserLocation]
    && [v6 hasModifiedUserLocation])
  {
    __int16 v26 = [(PLDuplicateAsset *)self asset];
    unsigned int v27 = [v26 modificationDate];

    uint64_t v28 = [v6 asset];
    int v29 = [v28 modificationDate];

    uint64_t v30 = v57;
    int64_t v31 = v58;
    [(PLDuplicateAsset *)self _updateScoresUsingLatestDateWithDate:v27 otherDate:v29 score:&v58 otherScore:&v57];
    if (v31 == v58)
    {
      if (v30 == v57)
      {
LABEL_24:

        goto LABEL_25;
      }
      int64_t v32 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        id v33 = [v6 shortDescription];
        int v34 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v33, v57];
        int v35 = _PLDuplicateAssetLogString((uint64_t)v34, @"latest user modification", 0);

        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v35;
LABEL_22:
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
    }
    else
    {
      int64_t v32 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        id v33 = [(PLDuplicateAsset *)self shortDescription];
        int v36 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v33, v58];
        int v35 = _PLDuplicateAssetLogString((uint64_t)v36, @"latest user modification", 0);

        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v35;
        goto LABEL_22;
      }
    }

    goto LABEL_24;
  }
LABEL_25:
  uint64_t v37 = [(PLDuplicateAsset *)self originalResolution];
  if (v37 <= [v6 originalResolution])
  {
    uint64_t v42 = [(PLDuplicateAsset *)self originalResolution];
    if (v42 >= [v6 originalResolution]) {
      goto LABEL_33;
    }
    v57 += 25;
    int v38 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      PLDuplicateAssetScoreTuple v39 = [v6 shortDescription];
      uint64_t v43 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v39, v57];
      uint64_t v41 = _PLDuplicateAssetLogString((uint64_t)v43, @"originalResolution", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v41;
      goto LABEL_31;
    }
  }
  else
  {
    v58 += 25;
    int v38 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      PLDuplicateAssetScoreTuple v39 = [(PLDuplicateAsset *)self shortDescription];
      id v40 = [NSString stringWithFormat:@"Duplicate Asset: [%@] score incremented to %td", v39, v58];
      uint64_t v41 = _PLDuplicateAssetLogString((uint64_t)v40, @"originalResolution", 0);

      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v41;
LABEL_31:
      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }

LABEL_33:
  if (v58 == v57) {
    [(PLDuplicateAsset *)self _tieBreakerComparisonScoreWithOtherAsset:v6 score:&v58 otherScore:&v57];
  }
  uint64_t v44 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    uint64_t v46 = v57;
    v45 = (void *)v58;
    __int16 v47 = [(PLDuplicateAsset *)self shortDescription];
    uint64_t v48 = [v6 shortDescription];
    *(_DWORD *)buf = 134218754;
    uint64_t v60 = v45;
    __int16 v61 = 2048;
    uint64_t v62 = v46;
    __int16 v63 = 2114;
    __int16 v64 = v47;
    __int16 v65 = 2114;
    uint64_t v66 = v48;
    _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_INFO, "Duplicate Asset: comparisonScore [%tu:%tu][%{public}@:%{public}@]", buf, 0x2Au);
  }
  if (v4)
  {
    [(PLDuplicateAsset *)self _mergeComparisonScoreModifierWithOtherAsset:v6 score:&v58 otherScore:&v57];
    uint64_t v49 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      uint64_t v51 = v57;
      BOOL v50 = (void *)v58;
      __int16 v52 = [(PLDuplicateAsset *)self shortDescription];
      uint64_t v53 = [v6 shortDescription];
      *(_DWORD *)buf = 134218754;
      uint64_t v60 = v50;
      __int16 v61 = 2048;
      uint64_t v62 = v51;
      __int16 v63 = 2114;
      __int16 v64 = v52;
      __int16 v65 = 2114;
      uint64_t v66 = v53;
      _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_INFO, "Duplicate Asset: post-mergeComparisonScore [%tu:%tu][%{public}@:%{public}@]", buf, 0x2Au);
    }
  }
  uint64_t v54 = 1;
  if (v58 >= v57) {
    uint64_t v54 = -1;
  }
  if (v58 == v57) {
    int64_t v55 = 0;
  }
  else {
    int64_t v55 = v54;
  }

  return v55;
}

- (int64_t)compare:(id)a3
{
  return [(PLDuplicateAsset *)self compare:a3 enabledMergeComparison:0];
}

- (BOOL)hasModifiedUserTitle
{
  id v2 = [(PLDuplicateAsset *)self asset];
  id v3 = [v2 additionalAttributes];
  BOOL v4 = [v3 title];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)hasModifiedUserDateCreated
{
  hasUserModifiedDateCreated = self->_hasUserModifiedDateCreated;
  if (hasUserModifiedDateCreated)
  {
    return [(NSNumber *)hasUserModifiedDateCreated BOOLValue];
  }
  else
  {
    BOOL v5 = [(PLDuplicateAsset *)self asset];
    id v6 = [v5 dateCreated];

    if (v6)
    {
      int64_t v7 = [(PLDuplicateAsset *)self asset];
      uint64_t v8 = [v7 extendedAttributes];
      double v9 = [v8 dateCreated];

      if (v9) {
        goto LABEL_7;
      }
      if (![(PLDuplicateAsset *)self enableEXIFDataAccess]) {
        goto LABEL_11;
      }
      int v11 = [(PLDuplicateAsset *)self asset];
      int v12 = [v11 metadataFromMediaPropertiesOrOriginalResource];

      double v9 = [v12 utcCreationDate];

      if (v9)
      {
LABEL_7:
        BOOL v10 = [(PLDuplicateAsset *)self _correctedCompareDate:v6 otherDate:v9] != 0;
      }
      else
      {
LABEL_11:
        BOOL v10 = 1;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
    int64_t v13 = [NSNumber numberWithBool:v10];
    BOOL v14 = self->_hasUserModifiedDateCreated;
    self->_hasUserModifiedDateCreated = v13;

    return v10;
  }
}

- (BOOL)hasModifiedUserTimezone
{
  hasUserModifiedTimezone = self->_hasUserModifiedTimezone;
  if (hasUserModifiedTimezone)
  {
    return [(NSNumber *)hasUserModifiedTimezone BOOLValue];
  }
  else
  {
    BOOL v5 = [(PLDuplicateAsset *)self asset];
    id v6 = [v5 additionalAttributes];
    int64_t v7 = [v6 timeZoneOffset];

    if (v7)
    {
      uint64_t v8 = [(PLDuplicateAsset *)self asset];
      double v9 = [v8 extendedAttributes];
      BOOL v10 = [v9 timezoneOffset];

      if (v10) {
        goto LABEL_7;
      }
      if (![(PLDuplicateAsset *)self enableEXIFDataAccess]) {
        goto LABEL_11;
      }
      int v12 = [(PLDuplicateAsset *)self asset];
      int64_t v13 = [v12 metadataFromMediaPropertiesOrOriginalResource];

      BOOL v10 = [v13 timeZoneOffset];

      if (v10)
      {
LABEL_7:
        uint64_t v11 = [v7 isEqualToNumber:v10] ^ 1;
      }
      else
      {
LABEL_11:
        uint64_t v11 = 1;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    BOOL v14 = [NSNumber numberWithBool:v11];
    BOOL v15 = self->_hasUserModifiedTimezone;
    self->_hasUserModifiedTimezone = v14;

    return v11;
  }
}

- (BOOL)hasModifiedUserLocation
{
  hasUserModifiedLocation = self->_hasUserModifiedLocation;
  if (hasUserModifiedLocation)
  {
    return [(NSNumber *)hasUserModifiedLocation BOOLValue];
  }
  else
  {
    BOOL v5 = [(PLDuplicateAsset *)self asset];
    id v6 = [v5 extendedAttributes];

    int64_t v7 = [v6 latitude];
    uint64_t v8 = [v6 longitude];
    double v9 = [(PLDuplicateAsset *)self asset];
    [v9 latitude];
    double v11 = v10;

    int v12 = [(PLDuplicateAsset *)self asset];
    [v12 longitude];
    double v14 = v13;

    if (v11 == -180.0 && v14 == -180.0)
    {
      BOOL v15 = 0;
    }
    else
    {
      BOOL v15 = 1;
      if (v7 && v8)
      {
        [v7 doubleValue];
        double v17 = v16;
        [v8 doubleValue];
        BOOL v15 = vabdd_f64(v17 + v18, v11 + v14) > 2.22044605e-16;
      }
    }
    uint64_t v19 = [NSNumber numberWithBool:v15];
    int v20 = self->_hasUserModifiedLocation;
    self->_hasUserModifiedLocation = v19;

    return v15;
  }
}

- (int64_t)score
{
  int64_t result = self->_score;
  if (result == -100)
  {
    int64_t result = [(PLDuplicateAsset *)self _buildBaseScore];
    self->_score = result;
  }
  return result;
}

- (BOOL)isCPLEnabled
{
  isCPLEnabled = self->_isCPLEnabled;
  if (!isCPLEnabled)
  {
    BOOL v4 = NSNumber;
    BOOL v5 = [(PLDuplicateAsset *)self asset];
    id v6 = [v5 photoLibrary];
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));
    int64_t v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = self->_isCPLEnabled;
    self->_isCPLEnabled = v7;

    isCPLEnabled = self->_isCPLEnabled;
  }
  return [(NSNumber *)isCPLEnabled BOOLValue];
}

- (BOOL)isMergeReady
{
  return self->_mergeStatus == 1;
}

- (void)setMergeStatus:(int64_t)a3
{
  unint64_t mergeStatus = self->_mergeStatus;
  if (mergeStatus < 2) {
    goto LABEL_2;
  }
  if (mergeStatus == 2 && a3 == 0)
  {
    a3 = 0;
LABEL_2:
    self->_unint64_t mergeStatus = a3;
  }
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)PLDuplicateAsset;
  id v3 = [(PLDuplicateAsset *)&v7 description];
  BOOL v4 = [(PLDuplicateAsset *)self _additionalDescriptionWithPIIDetails:1];
  BOOL v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return v5;
}

- (NSString)privateDescription
{
  return (NSString *)[(PLDuplicateAsset *)self _additionalDescriptionWithPIIDetails:0];
}

- (id)description
{
  return [(PLDuplicateAsset *)self _additionalDescriptionWithPIIDetails:1];
}

- (NSDictionary)jsonDescriptionData
{
  return (NSDictionary *)[(PLDuplicateAsset *)self _additionalDescriptionDictionaryWithPIIDetails:1];
}

- (id)_additionalDescriptionState:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 objectForKeyedSubscript:@"mergeStatus"];
  [v5 appendFormat:@"m%@:", v6];

  objc_super v7 = [v4 objectForKeyedSubscript:@"visibility"];
  uint64_t v8 = [v7 substringToIndex:1];
  [v5 appendFormat:@"v%@:", v8];

  double v9 = [v4 objectForKeyedSubscript:@"resourceSwapDisabled"];
  double v10 = [v9 substringToIndex:1];
  [v5 appendFormat:@"rd%@:", v10];

  double v11 = [v4 objectForKeyedSubscript:@"hasModifiedUserLocation"];
  int v12 = [v11 substringToIndex:1];
  [v5 appendFormat:@"ul%@:", v12];

  double v13 = [v4 objectForKeyedSubscript:@"hasModifiedUserTimezone"];
  double v14 = [v13 substringToIndex:1];
  [v5 appendFormat:@"utz%@:", v14];

  BOOL v15 = [v4 objectForKeyedSubscript:@"hasModifiedUserDateCreated"];

  double v16 = [v15 substringToIndex:1];
  [v5 appendFormat:@"ud%@:", v16];

  return v5;
}

- (id)_additionalDescriptionWithPIIDetails:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[PLDuplicateAsset _additionalDescriptionDictionaryWithPIIDetails:](self, "_additionalDescriptionDictionaryWithPIIDetails:");
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_super v7 = [v5 objectForKeyedSubscript:@"objectIDDescription"];
  [v6 appendFormat:@"[%@", v7];

  uint64_t v8 = [v5 objectForKeyedSubscript:@"uuid"];
  [v6 appendFormat:@"/%@]", v8];

  double v9 = [v5 objectForKeyedSubscript:@"score"];
  [v6 appendFormat:@" score:[%@]", v9];

  double v10 = [(PLDuplicateAsset *)self _additionalDescriptionState:v5];
  [v6 appendFormat:@" state:[%@]", v10];

  if (v3)
  {
    double v11 = [v5 objectForKeyedSubscript:@"filename"];
    [v6 appendFormat:@" filename:[%@]", v11];
  }
  return v6;
}

- (id)_additionalDescriptionDictionaryWithPIIDetails:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [(PLDuplicateAsset *)self veryShortDescription];
  [v5 setObject:v6 forKeyedSubscript:@"objectIDDescription"];

  objc_super v7 = [(PLDuplicateAsset *)self assetUUID];
  [v5 setObject:v7 forKeyedSubscript:@"uuid"];

  if (v3) {
    [v5 setObject:self->_originalFilename forKeyedSubscript:@"filename"];
  }
  uint64_t v8 = [(PLDuplicateAsset *)self duplicateAssetVisibilityStateString];
  [v5 setObject:v8 forKeyedSubscript:@"visibility"];

  double v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLDuplicateAsset score](self, "score"));
  [v5 setObject:v9 forKeyedSubscript:@"score"];

  double v10 = [NSNumber numberWithInteger:self->_mergeStatus];
  [v5 setObject:v10 forKeyedSubscript:@"mergeStatus"];

  double v11 = [NSNumber numberWithInteger:self->_originalResolution];
  [v5 setObject:v11 forKeyedSubscript:@"originalResolution"];

  if ([(PLDuplicateAsset *)self hasModifiedUserLocation]) {
    int v12 = @"YES";
  }
  else {
    int v12 = @"NO";
  }
  [v5 setObject:v12 forKeyedSubscript:@"hasModifiedUserLocation"];
  if ([(PLDuplicateAsset *)self hasModifiedUserTimezone]) {
    double v13 = @"YES";
  }
  else {
    double v13 = @"NO";
  }
  [v5 setObject:v13 forKeyedSubscript:@"hasModifiedUserTimezone"];
  if ([(PLDuplicateAsset *)self hasModifiedUserDateCreated]) {
    double v14 = @"YES";
  }
  else {
    double v14 = @"NO";
  }
  [v5 setObject:v14 forKeyedSubscript:@"hasModifiedUserDateCreated"];
  if ([(PLDuplicateAsset *)self resourceSwapDisabled]) {
    BOOL v15 = @"YES";
  }
  else {
    BOOL v15 = @"NO";
  }
  [v5 setObject:v15 forKeyedSubscript:@"resourceSwapDisabled"];
  return v5;
}

- (id)duplicateAssetVisibilityStateString
{
  int v2 = [(PLDuplicateAsset *)self duplicateAssetVisibilityState];
  BOOL v3 = @"R";
  id v4 = @"H";
  if (v2 != 100) {
    id v4 = 0;
  }
  if (v2 != 2) {
    BOOL v3 = v4;
  }
  id v5 = @"X";
  id v6 = @"V";
  if (v2 != 1) {
    id v6 = 0;
  }
  if (v2) {
    id v5 = v6;
  }
  if (v2 <= 1) {
    return v5;
  }
  else {
    return v3;
  }
}

- (signed)_calculateDuplicateAssetVisibilityState
{
  int v2 = [(PLDuplicateAsset *)self asset];
  int v3 = [v2 activeLibraryScopeParticipationState];

  if (v3 == 1) {
    return 100;
  }
  else {
    return 1;
  }
}

- (void)_configureInitPropertiesWithAsset:(id)a3
{
  id v4 = a3;
  id v19 = [v4 additionalAttributes];
  id v5 = [v4 objectID];
  assetObjectID = self->_assetObjectID;
  self->_assetObjectID = v5;

  objc_super v7 = [(NSManagedObjectID *)self->_assetObjectID URIRepresentation];
  uint64_t v8 = [v7 relativePath];
  assetObjectIDDescription = self->_assetObjectIDDescription;
  self->_assetObjectIDDescription = v8;

  double v10 = [v19 originalWidth];
  uint64_t v11 = [v10 integerValue];
  int v12 = [v19 originalHeight];
  self->_originalResolution = [v12 integerValue] * v11;

  double v13 = [v4 uuid];

  double v14 = (NSString *)[v13 copy];
  assetUUID = self->_assetUUID;
  self->_assetUUID = v14;

  double v16 = [v19 originalFilename];
  double v17 = (NSString *)[v16 copy];
  originalFilename = self->_originalFilename;
  self->_originalFilename = v17;

  self->_score = [(PLDuplicateAsset *)self _buildBaseScore];
  self->_duplicateAssetVisibilityState = [(PLDuplicateAsset *)self _calculateDuplicateAssetVisibilityState];
}

- (PLDuplicateAsset)initWithAsset:(id)a3 cloudScopedIdentifier:(id)a4 enableEXIFDataAccess:(BOOL)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    int64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLDuplicateAsset.m", 145, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PLDuplicateAsset;
  int v12 = [(PLDuplicateAsset *)&v22 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_asset, a3);
    if (v11)
    {
      uint64_t v14 = [v11 copy];
      assetCloudScopedIdentifier = v13->_assetCloudScopedIdentifier;
      v13->_assetCloudScopedIdentifier = (NSString *)v14;
    }
    else
    {
      assetCloudScopedIdentifier = [v10 cloudAssetGUID];
      uint64_t v16 = [assetCloudScopedIdentifier copy];
      double v17 = v13->_assetCloudScopedIdentifier;
      v13->_assetCloudScopedIdentifier = (NSString *)v16;
    }
    int v18 = [(PLManagedAsset *)v13->_asset duplicateAssetVisibilityState];
    uint64_t v19 = 1;
    if (!v18) {
      uint64_t v19 = 2;
    }
    v13->_unint64_t mergeStatus = v19;
    v13->_enableEXIFDataAccess = a5;
    v13->_resourceSwapDisabled = 0;
    [(PLDuplicateAsset *)v13 _configureInitPropertiesWithAsset:v10];
  }

  return v13;
}

- (PLDuplicateAsset)initWithAsset:(id)a3
{
  return [(PLDuplicateAsset *)self initWithAsset:a3 cloudScopedIdentifier:0 enableEXIFDataAccess:0];
}

+ (BOOL)isDuplicateAssetSortChangedObject:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 changedValues];
  if ([v4 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = [v3 duplicateSortPropertyNamesSkip];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];

          if (v10)
          {
            LOBYTE(v11) = 0;
            goto LABEL_22;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = objc_msgSend(v3, "duplicateSortPropertyNames", 0);
    uint64_t v11 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v5);
          }
          uint64_t v14 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * j)];

          if (v14)
          {
            LOBYTE(v11) = 1;
            goto LABEL_22;
          }
        }
        uint64_t v11 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (id)relationshipKeyPathsForMergePrefetching
{
  v6[2] = *MEMORY[0x1E4F143B8];
  int v2 = [a1 relationshipKeyPathsForPrefetching];
  v6[0] = @"albums";
  v6[1] = @"libraryScope";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)relationshipKeyPathsForPrefetching
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"additionalAttributes";
  v4[1] = @"additionalAttributes.assetDescription";
  v4[2] = @"additionalAttributes.unmanagedAdjustment";
  v4[3] = @"additionalAttributes.keywords";
  v4[4] = @"additionalAttributes.editedIPTCAttributes";
  v4[5] = @"extendedAttributes";
  int v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

@end
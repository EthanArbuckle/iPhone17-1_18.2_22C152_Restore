@interface PGGraphInfoNode
+ (id)assetPropertiesWithNumberOfUtilityAssets:(unint64_t)a3 numberOfDefaultAssets:(unint64_t)a4 numberOfImprovedAssets:(unint64_t)a5 numberOfBetterAssets:(unint64_t)a6;
+ (id)deserializeLanguageIdentifiers:(id)a3;
+ (id)genericPropertiesWithCreationDate:(id)a3 localeIdentifier:(id)a4 languageIdentifiers:(id)a5 geoServiceProviderID:(id)a6 curationAlgorithmsVersion:(unint64_t)a7 contactsStoreAccess:(BOOL)a8;
+ (id)locationPropertiesWithCanUseLocationDomain:(BOOL)a3;
+ (id)numberOfSelfies:(unint64_t)a3;
+ (id)personalAestheticsPropertiesWithHighAestheticsThreshold:(double)a3 goodAestheticsThreshold:(double)a4;
+ (id)propertiesWithLastIncrementalUpdateInvocationOnDate:(id)a3;
+ (id)routineInfoPropertiesWithServiceManager:(id)a3;
+ (id)serializeLanguageIdentifiers:(id)a3;
+ (id)topTierScorePropertiesWithAestheticScore:(double)a3 aestheticScoreForTripKeyAsset:(double)a4;
- (BOOL)canAccessContactsStore;
- (BOOL)canUseLocationDomain;
- (BOOL)hasProperties:(id)a3;
- (NSArray)languageIdentifiers;
- (NSDate)creationDate;
- (NSDate)dateOfLastIncrementalUpdateInvocation;
- (NSLocale)locale;
- (NSString)geoServiceProviderID;
- (NSString)localeIdentifier;
- (PGGraphInfoNode)initWithCreationDate:(id)a3 localeIdentifier:(id)a4 languageIdentifiers:(id)a5 geoServiceProviderID:(id)a6 curationAlgorithmsVersion:(unint64_t)a7 contactsStoreAccess:(BOOL)a8;
- (PGGraphInfoNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGRoutineInfoStruct)routineInfo;
- (double)intelligencePlatformVersion;
- (double)mergeCandidateConfidenceThreshold;
- (double)personalGoodAestheticsThreshold;
- (double)personalHighAestheticsThreshold;
- (double)topTierAestheticScore;
- (double)topTierAestheticScoreForTripKeyAsset;
- (id)label;
- (id)propertyDictionary;
- (int64_t)eventLabelingV2ModelVersion;
- (int64_t)personalTraitsEntityNamesVersion;
- (unint64_t)ageCategoryAlgorithmsVersion;
- (unint64_t)autonamingAlgorithmsVersion;
- (unint64_t)businessItemAlgorithmsVersion;
- (unint64_t)curationAlgorithmsVersion;
- (unint64_t)featuredPhotoAlgorithmsVersion;
- (unint64_t)frequentLocationAlgorithmsVersion;
- (unint64_t)holidayAlgorithmsVersion;
- (unint64_t)locationRepresentativeAssetAlgorithmsVersion;
- (unint64_t)longTailFeaturedPhotoAlgorithmsVersion;
- (unint64_t)meaningAlgorithmsVersion;
- (unint64_t)memoriesAlgorithmsVersion;
- (unint64_t)memoryQualityAlgorithmsVersion;
- (unint64_t)numberOfAssets;
- (unint64_t)numberOfBetterAssets;
- (unint64_t)numberOfDefaultAssets;
- (unint64_t)numberOfImprovedAssets;
- (unint64_t)numberOfSelfies;
- (unint64_t)numberOfUtilityAssets;
- (unint64_t)personActivityMeaningAlgorithmsVersion;
- (unint64_t)petAlgorithmsVersion;
- (unint64_t)publicEventAlgorithmsVersion;
- (unint64_t)questionsVersion;
- (unint64_t)relatedAlgorithmsVersion;
- (unint64_t)relationshipAlgorithmsVersion;
- (unint64_t)sharedLibraryCameraLibrarySwitchAlgorithmsVersion;
- (unint64_t)sharedLibraryStartAlgorithmsVersion;
- (unint64_t)sharedLibrarySuggestionsAlgorithmsVersion;
- (unint64_t)tripKeyAssetAlgorithmsVersion;
- (unint64_t)wallpaperAlgorithmsVersion;
- (unsigned)domain;
- (void)setLocalProperties:(id)a3;
@end

@implementation PGGraphInfoNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoServiceProviderID, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_flattenedLanguageIdentifiers, 0);
}

- (double)intelligencePlatformVersion
{
  return self->_intelligencePlatformVersion;
}

- (double)mergeCandidateConfidenceThreshold
{
  return self->_mergeCandidateConfidenceThreshold;
}

- (BOOL)canAccessContactsStore
{
  return self->_canAccessContactsStore;
}

- (unint64_t)numberOfBetterAssets
{
  return self->_numberOfBetterAssets;
}

- (unint64_t)numberOfImprovedAssets
{
  return self->_numberOfImprovedAssets;
}

- (unint64_t)numberOfDefaultAssets
{
  return self->_numberOfDefaultAssets;
}

- (unint64_t)numberOfUtilityAssets
{
  return self->_numberOfUtilityAssets;
}

- (unint64_t)numberOfSelfies
{
  return self->_numberOfSelfies;
}

- (double)personalHighAestheticsThreshold
{
  return self->_personalHighAestheticsThreshold;
}

- (double)personalGoodAestheticsThreshold
{
  return self->_personalGoodAestheticsThreshold;
}

- (PGRoutineInfoStruct)routineInfo
{
  objc_copyStruct(retstr, &self->_routineInfo, 64, 1, 0);
  return result;
}

- (BOOL)canUseLocationDomain
{
  return self->_canUseLocationDomain;
}

- (unint64_t)locationRepresentativeAssetAlgorithmsVersion
{
  return self->_locationRepresentativeAssetAlgorithmsVersion;
}

- (unint64_t)wallpaperAlgorithmsVersion
{
  return self->_wallpaperAlgorithmsVersion;
}

- (unint64_t)sharedLibraryCameraLibrarySwitchAlgorithmsVersion
{
  return self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion;
}

- (unint64_t)sharedLibraryStartAlgorithmsVersion
{
  return self->_sharedLibraryStartAlgorithmsVersion;
}

- (unint64_t)sharedLibrarySuggestionsAlgorithmsVersion
{
  return self->_sharedLibrarySuggestionsAlgorithmsVersion;
}

- (unint64_t)longTailFeaturedPhotoAlgorithmsVersion
{
  return self->_longTailFeaturedPhotoAlgorithmsVersion;
}

- (unint64_t)featuredPhotoAlgorithmsVersion
{
  return self->_featuredPhotoAlgorithmsVersion;
}

- (unint64_t)petAlgorithmsVersion
{
  return self->_petAlgorithmsVersion;
}

- (unint64_t)memoryQualityAlgorithmsVersion
{
  return self->_memoryQualityAlgorithmsVersion;
}

- (unint64_t)ageCategoryAlgorithmsVersion
{
  return self->_ageCategoryAlgorithmsVersion;
}

- (unint64_t)tripKeyAssetAlgorithmsVersion
{
  return self->_tripKeyAssetAlgorithmsVersion;
}

- (unint64_t)questionsVersion
{
  return self->_questionsVersion;
}

- (unint64_t)autonamingAlgorithmsVersion
{
  return self->_autonamingAlgorithmsVersion;
}

- (unint64_t)frequentLocationAlgorithmsVersion
{
  return self->_frequentLocationAlgorithmsVersion;
}

- (unint64_t)holidayAlgorithmsVersion
{
  return self->_holidayAlgorithmsVersion;
}

- (unint64_t)publicEventAlgorithmsVersion
{
  return self->_publicEventAlgorithmsVersion;
}

- (unint64_t)businessItemAlgorithmsVersion
{
  return self->_businessItemAlgorithmsVersion;
}

- (unint64_t)relationshipAlgorithmsVersion
{
  return self->_relationshipAlgorithmsVersion;
}

- (unint64_t)personActivityMeaningAlgorithmsVersion
{
  return self->_personActivityMeaningAlgorithmsVersion;
}

- (int64_t)personalTraitsEntityNamesVersion
{
  return self->_personalTraitsEntityNamesVersion;
}

- (int64_t)eventLabelingV2ModelVersion
{
  return self->_eventLabelingV2ModelVersion;
}

- (unint64_t)meaningAlgorithmsVersion
{
  return self->_meaningAlgorithmsVersion;
}

- (unint64_t)memoriesAlgorithmsVersion
{
  return self->_memoriesAlgorithmsVersion;
}

- (unint64_t)relatedAlgorithmsVersion
{
  return self->_relatedAlgorithmsVersion;
}

- (unint64_t)curationAlgorithmsVersion
{
  return self->_curationAlgorithmsVersion;
}

- (NSString)geoServiceProviderID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (double)topTierAestheticScoreForTripKeyAsset
{
  double result = self->_topTierAestheticScoreForTripKeyAsset;
  if (result < 0.52) {
    return 0.52;
  }
  return result;
}

- (double)topTierAestheticScore
{
  double result = self->_topTierAestheticScore;
  if (result < 0.52) {
    return 0.52;
  }
  return result;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfDefaultAssets
       + self->_numberOfUtilityAssets
       + self->_numberOfImprovedAssets
       + self->_numberOfBetterAssets;
}

- (NSArray)languageIdentifiers
{
  v3 = objc_opt_class();
  flattenedLanguageIdentifiers = self->_flattenedLanguageIdentifiers;
  return (NSArray *)[v3 deserializeLanguageIdentifiers:flattenedLanguageIdentifiers];
}

- (NSLocale)locale
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:self->_localeIdentifier];
  return (NSLocale *)v2;
}

- (NSDate)dateOfLastIncrementalUpdateInvocation
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_dateOfLastIncrementalUpdateInvocationTimeInterval];
}

- (NSDate)creationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_creationDateTimeInterval];
}

- (unsigned)domain
{
  return 21;
}

- (id)label
{
  v2 = @"Info";
  return @"Info";
}

- (id)propertyDictionary
{
  v58[51] = *MEMORY[0x1E4F143B8];
  v57[0] = @"creationDate";
  v56 = [NSNumber numberWithDouble:self->_creationDateTimeInterval];
  v58[0] = v56;
  v57[1] = @"dateOfLastIncrementalUpdateInvocation";
  uint64_t v3 = [NSNumber numberWithDouble:self->_dateOfLastIncrementalUpdateInvocationTimeInterval];
  v55 = (void *)v3;
  localeIdentifier = self->_localeIdentifier;
  geoServiceProviderID = (NSString *)&stru_1F283BC78;
  if (!localeIdentifier) {
    localeIdentifier = (NSString *)&stru_1F283BC78;
  }
  v58[1] = v3;
  v58[2] = localeIdentifier;
  v57[2] = @"localeIdentifier";
  v57[3] = @"languageIdentifiers";
  flattenedLanguageIdentifiers = self->_flattenedLanguageIdentifiers;
  if (!flattenedLanguageIdentifiers) {
    flattenedLanguageIdentifiers = (NSString *)&stru_1F283BC78;
  }
  if (self->_geoServiceProviderID) {
    geoServiceProviderID = self->_geoServiceProviderID;
  }
  v58[3] = flattenedLanguageIdentifiers;
  v58[4] = geoServiceProviderID;
  v57[4] = @"geoServiceProviderID";
  v57[5] = @"curationAlgorithmsVersion";
  v54 = [NSNumber numberWithUnsignedInteger:self->_curationAlgorithmsVersion];
  v58[5] = v54;
  v57[6] = @"relatedAlgorithmsVersion";
  v53 = [NSNumber numberWithUnsignedInteger:self->_relatedAlgorithmsVersion];
  v58[6] = v53;
  v57[7] = @"memoriesAlgorithmsVersion";
  v52 = [NSNumber numberWithUnsignedInteger:self->_memoriesAlgorithmsVersion];
  v58[7] = v52;
  v57[8] = @"meaningAlgorithmsVersion";
  v51 = [NSNumber numberWithUnsignedInteger:self->_meaningAlgorithmsVersion];
  v58[8] = v51;
  v57[9] = @"eventLabelingV2ModelVersion";
  v50 = [NSNumber numberWithInteger:self->_eventLabelingV2ModelVersion];
  v58[9] = v50;
  v57[10] = @"personalTraitsEntityNamesVersion";
  v49 = [NSNumber numberWithInteger:self->_personalTraitsEntityNamesVersion];
  v58[10] = v49;
  v57[11] = @"personActivityMeaningAlgorithmsVersion";
  v48 = [NSNumber numberWithUnsignedInteger:self->_personActivityMeaningAlgorithmsVersion];
  v58[11] = v48;
  v57[12] = @"relationshipAlgorithmsVersion";
  v47 = [NSNumber numberWithUnsignedInteger:self->_relationshipAlgorithmsVersion];
  v58[12] = v47;
  v57[13] = @"businessitemAlgorithmsVersion";
  v46 = [NSNumber numberWithUnsignedInteger:self->_businessItemAlgorithmsVersion];
  v58[13] = v46;
  v57[14] = @"publiceventAlgorithmsVersion";
  v45 = [NSNumber numberWithUnsignedInteger:self->_publicEventAlgorithmsVersion];
  v58[14] = v45;
  v57[15] = @"holidayAlgorithmsVersion";
  v44 = [NSNumber numberWithUnsignedInteger:self->_holidayAlgorithmsVersion];
  v58[15] = v44;
  v57[16] = @"frequentlocationAlgorithmsVersion";
  v43 = [NSNumber numberWithUnsignedInteger:self->_frequentLocationAlgorithmsVersion];
  v58[16] = v43;
  v57[17] = @"autonamingAlgorithmsVersion";
  v42 = [NSNumber numberWithUnsignedInteger:self->_autonamingAlgorithmsVersion];
  v58[17] = v42;
  v57[18] = @"questionsVersion";
  v41 = [NSNumber numberWithUnsignedInteger:self->_questionsVersion];
  v58[18] = v41;
  v57[19] = @"tripKeyAssetAlgorithmsVersion";
  v40 = [NSNumber numberWithUnsignedInteger:self->_tripKeyAssetAlgorithmsVersion];
  v58[19] = v40;
  v57[20] = @"ageCategoryAlgorithmsVersion";
  v39 = [NSNumber numberWithUnsignedInteger:self->_ageCategoryAlgorithmsVersion];
  v58[20] = v39;
  v57[21] = @"memoryQualityAlgorithmsVersion";
  v38 = [NSNumber numberWithUnsignedInteger:self->_memoryQualityAlgorithmsVersion];
  v58[21] = v38;
  v57[22] = @"petAlgorithmsVersion";
  v37 = [NSNumber numberWithUnsignedInteger:self->_petAlgorithmsVersion];
  v58[22] = v37;
  v57[23] = @"featuredPhotoAlgorithmsVersion";
  v36 = [NSNumber numberWithUnsignedInteger:self->_featuredPhotoAlgorithmsVersion];
  v58[23] = v36;
  v57[24] = @"longTailFeaturedPhotoAlgorithmsVersion";
  v35 = [NSNumber numberWithUnsignedInteger:self->_longTailFeaturedPhotoAlgorithmsVersion];
  v58[24] = v35;
  v57[25] = @"sharedLibrarySuggestionsAlgorithmsVersion";
  v34 = [NSNumber numberWithUnsignedInteger:self->_sharedLibrarySuggestionsAlgorithmsVersion];
  v58[25] = v34;
  v57[26] = @"sharedLibraryStartAlgorithmsVersion";
  v33 = [NSNumber numberWithUnsignedInteger:self->_sharedLibraryStartAlgorithmsVersion];
  v58[26] = v33;
  v57[27] = @"sharedLibraryCameraLibrarySwitchAlgorithmsVersion";
  v32 = [NSNumber numberWithUnsignedInteger:self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion];
  v58[27] = v32;
  v57[28] = @"wallpaperAlgorithmsVersion";
  v31 = [NSNumber numberWithUnsignedInteger:self->_wallpaperAlgorithmsVersion];
  v58[28] = v31;
  v57[29] = @"locationRepresentativeAssetAlgorithmsVersion";
  v30 = [NSNumber numberWithUnsignedInteger:self->_locationRepresentativeAssetAlgorithmsVersion];
  v58[29] = v30;
  v57[30] = @"canUseLocationDomain";
  v29 = [NSNumber numberWithBool:self->_canUseLocationDomain];
  v58[30] = v29;
  v57[31] = @"routineAvailable";
  v28 = [NSNumber numberWithBool:self->_routineInfo.routineAvailable];
  v58[31] = v28;
  v57[32] = @"routineNumberOfLocationsOfInterest";
  v27 = [NSNumber numberWithUnsignedInteger:self->_routineInfo.numberOfLocationsOfInterest];
  v58[32] = v27;
  v57[33] = @"routineNumberOfVisits";
  v26 = [NSNumber numberWithUnsignedInteger:self->_routineInfo.numberOfVisits];
  v58[33] = v26;
  v57[34] = @"routineNumberOfTimeMatches";
  v25 = [NSNumber numberWithUnsignedInteger:self->_routineInfo.numberOfTimeMatches];
  v58[34] = v25;
  v57[35] = @"routineNumberOfClosebyLocationMatches";
  v24 = [NSNumber numberWithUnsignedInteger:self->_routineInfo.numberOfCloseByLocationMatches];
  v58[35] = v24;
  v57[36] = @"routineNumberOfRemoteLocationMatches";
  v23 = [NSNumber numberWithUnsignedInteger:self->_routineInfo.numberOfRemoteLocationMatches];
  v58[36] = v23;
  v57[37] = @"routineNumberofMatchRequests";
  v22 = [NSNumber numberWithUnsignedInteger:self->_routineInfo.numberOfMatchRequests];
  v58[37] = v22;
  v57[38] = @"routinePinningVisitsRatio";
  v21 = [NSNumber numberWithDouble:self->_routineInfo.pinningVisitsRatio];
  v58[38] = v21;
  v57[39] = @"personalGoodAestheticsThreshold";
  v20 = [NSNumber numberWithDouble:self->_personalGoodAestheticsThreshold];
  v58[39] = v20;
  v57[40] = @"personalHighAestheticsThreshold";
  v19 = [NSNumber numberWithDouble:self->_personalHighAestheticsThreshold];
  v58[40] = v19;
  v57[41] = @"numberOfSelfies";
  v18 = [NSNumber numberWithUnsignedInteger:self->_numberOfSelfies];
  v58[41] = v18;
  v57[42] = @"topTierAestheticScore";
  v7 = [NSNumber numberWithDouble:self->_topTierAestheticScore];
  v58[42] = v7;
  v57[43] = @"topTierAestheticScoreForTripKeyAsset";
  v8 = [NSNumber numberWithDouble:self->_topTierAestheticScoreForTripKeyAsset];
  v58[43] = v8;
  v57[44] = @"numberOfUtilityAssets";
  v9 = [NSNumber numberWithUnsignedInteger:self->_numberOfUtilityAssets];
  v58[44] = v9;
  v57[45] = @"numberOfDefaultAssets";
  v10 = [NSNumber numberWithUnsignedInteger:self->_numberOfDefaultAssets];
  v58[45] = v10;
  v57[46] = @"numberOfImprovedAssets";
  v11 = [NSNumber numberWithUnsignedInteger:self->_numberOfImprovedAssets];
  v58[46] = v11;
  v57[47] = @"numberOfBetterAssets";
  v12 = [NSNumber numberWithUnsignedInteger:self->_numberOfBetterAssets];
  v58[47] = v12;
  v57[48] = @"canAccessContactsStore";
  v13 = [NSNumber numberWithBool:self->_canAccessContactsStore];
  v58[48] = v13;
  v57[49] = @"mergeCandidateConfidenceThreshold";
  v14 = [NSNumber numberWithDouble:self->_mergeCandidateConfidenceThreshold];
  v58[49] = v14;
  v57[50] = @"IntelligencePlatformVersion";
  v15 = [NSNumber numberWithDouble:self->_intelligencePlatformVersion];
  v58[50] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:51];

  return v16;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"creationDate"];
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_creationDateTimeInterval) {
        goto LABEL_105;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"dateOfLastIncrementalUpdateInvocation"];
    v7 = v9;
    if (v9)
    {
      [v9 doubleValue];
      if (v10 != self->_dateOfLastIncrementalUpdateInvocationTimeInterval) {
        goto LABEL_105;
      }
    }

    v11 = [v5 objectForKeyedSubscript:@"localeIdentifier"];
    v7 = v11;
    if (v11)
    {
      if (![v11 isEqual:self->_localeIdentifier]) {
        goto LABEL_105;
      }
    }

    v12 = [v5 objectForKeyedSubscript:@"languageIdentifiers"];
    v7 = v12;
    if (v12)
    {
      if (![v12 isEqual:self->_flattenedLanguageIdentifiers]) {
        goto LABEL_105;
      }
    }

    v13 = [v5 objectForKeyedSubscript:@"geoServiceProviderID"];
    v7 = v13;
    if (v13)
    {
      if (![v13 isEqual:self->_geoServiceProviderID]) {
        goto LABEL_105;
      }
    }

    v14 = [v5 objectForKeyedSubscript:@"curationAlgorithmsVersion"];
    v7 = v14;
    if (v14)
    {
      if ([v14 unsignedIntegerValue] != self->_curationAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v15 = [v5 objectForKeyedSubscript:@"relatedAlgorithmsVersion"];
    v7 = v15;
    if (v15)
    {
      if ([v15 unsignedIntegerValue] != self->_relatedAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v16 = [v5 objectForKeyedSubscript:@"memoriesAlgorithmsVersion"];
    v7 = v16;
    if (v16)
    {
      if ([v16 unsignedIntegerValue] != self->_memoriesAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v17 = [v5 objectForKeyedSubscript:@"meaningAlgorithmsVersion"];
    v7 = v17;
    if (v17)
    {
      if ([v17 unsignedIntegerValue] != self->_meaningAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v18 = [v5 objectForKeyedSubscript:@"personActivityMeaningAlgorithmsVersion"];
    v7 = v18;
    if (v18)
    {
      if ([v18 unsignedIntegerValue] != self->_personActivityMeaningAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v19 = [v5 objectForKeyedSubscript:@"relationshipAlgorithmsVersion"];
    v7 = v19;
    if (v19)
    {
      if ([v19 unsignedIntegerValue] != self->_relationshipAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v20 = [v5 objectForKeyedSubscript:@"businessitemAlgorithmsVersion"];
    v7 = v20;
    if (v20)
    {
      if ([v20 unsignedIntegerValue] != self->_businessItemAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v21 = [v5 objectForKeyedSubscript:@"publiceventAlgorithmsVersion"];
    v7 = v21;
    if (v21)
    {
      if ([v21 unsignedIntegerValue] != self->_publicEventAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v22 = [v5 objectForKeyedSubscript:@"holidayAlgorithmsVersion"];
    v7 = v22;
    if (v22)
    {
      if ([v22 unsignedIntegerValue] != self->_holidayAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v23 = [v5 objectForKeyedSubscript:@"frequentlocationAlgorithmsVersion"];
    v7 = v23;
    if (v23)
    {
      if ([v23 unsignedIntegerValue] != self->_frequentLocationAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v24 = [v5 objectForKeyedSubscript:@"autonamingAlgorithmsVersion"];
    v7 = v24;
    if (v24)
    {
      if ([v24 unsignedIntegerValue] != self->_autonamingAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v25 = [v5 objectForKeyedSubscript:@"questionsVersion"];
    v7 = v25;
    if (v25)
    {
      if ([v25 unsignedIntegerValue] != self->_questionsVersion) {
        goto LABEL_105;
      }
    }

    v26 = [v5 objectForKeyedSubscript:@"tripKeyAssetAlgorithmsVersion"];
    v7 = v26;
    if (v26)
    {
      if ([v26 unsignedIntegerValue] != self->_tripKeyAssetAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v27 = [v5 objectForKeyedSubscript:@"ageCategoryAlgorithmsVersion"];
    v7 = v27;
    if (v27)
    {
      if ([v27 unsignedIntegerValue] != self->_ageCategoryAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v28 = [v5 objectForKeyedSubscript:@"memoryQualityAlgorithmsVersion"];
    v7 = v28;
    if (v28)
    {
      if ([v28 unsignedIntegerValue] != self->_memoryQualityAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v29 = [v5 objectForKeyedSubscript:@"petAlgorithmsVersion"];
    v7 = v29;
    if (v29)
    {
      if ([v29 unsignedIntegerValue] != self->_petAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v30 = [v5 objectForKeyedSubscript:@"featuredPhotoAlgorithmsVersion"];
    v7 = v30;
    if (v30)
    {
      if ([v30 unsignedIntegerValue] != self->_featuredPhotoAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v31 = [v5 objectForKeyedSubscript:@"longTailFeaturedPhotoAlgorithmsVersion"];
    v7 = v31;
    if (v31)
    {
      if ([v31 unsignedIntegerValue] != self->_longTailFeaturedPhotoAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v32 = [v5 objectForKeyedSubscript:@"sharedLibrarySuggestionsAlgorithmsVersion"];
    v7 = v32;
    if (v32)
    {
      if ([v32 unsignedIntegerValue] != self->_sharedLibrarySuggestionsAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v33 = [v5 objectForKeyedSubscript:@"sharedLibraryStartAlgorithmsVersion"];
    v7 = v33;
    if (v33)
    {
      if ([v33 unsignedIntegerValue] != self->_sharedLibraryStartAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v34 = [v5 objectForKeyedSubscript:@"sharedLibraryCameraLibrarySwitchAlgorithmsVersion"];
    v7 = v34;
    if (v34)
    {
      if ([v34 unsignedIntegerValue] != self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v35 = [v5 objectForKeyedSubscript:@"wallpaperAlgorithmsVersion"];
    v7 = v35;
    if (v35)
    {
      if ([v35 unsignedIntegerValue] != self->_wallpaperAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v36 = [v5 objectForKeyedSubscript:@"locationRepresentativeAssetAlgorithmsVersion"];
    v7 = v36;
    if (v36)
    {
      if ([v36 unsignedIntegerValue] != self->_locationRepresentativeAssetAlgorithmsVersion) {
        goto LABEL_105;
      }
    }

    v37 = [v5 objectForKeyedSubscript:@"eventLabelingV2ModelVersion"];
    v7 = v37;
    if (v37)
    {
      if ([v37 integerValue] != self->_eventLabelingV2ModelVersion) {
        goto LABEL_105;
      }
    }

    v38 = [v5 objectForKeyedSubscript:@"personalTraitsEntityNamesVersion"];
    v7 = v38;
    if (v38)
    {
      if ([v38 integerValue] != self->_personalTraitsEntityNamesVersion) {
        goto LABEL_105;
      }
    }

    v39 = [v5 objectForKeyedSubscript:@"canUseLocationDomain"];
    v7 = v39;
    if (v39)
    {
      if (self->_canUseLocationDomain != [v39 BOOLValue]) {
        goto LABEL_105;
      }
    }

    v40 = [v5 objectForKeyedSubscript:@"routineAvailable"];
    v7 = v40;
    if (v40)
    {
      if (self->_routineInfo.routineAvailable != [v40 BOOLValue]) {
        goto LABEL_105;
      }
    }

    v41 = [v5 objectForKeyedSubscript:@"routineNumberOfLocationsOfInterest"];
    v7 = v41;
    if (v41)
    {
      if ([v41 unsignedIntegerValue] != self->_routineInfo.numberOfLocationsOfInterest) {
        goto LABEL_105;
      }
    }

    v42 = [v5 objectForKeyedSubscript:@"routineNumberOfVisits"];
    v7 = v42;
    if (v42)
    {
      if ([v42 unsignedIntegerValue] != self->_routineInfo.numberOfVisits) {
        goto LABEL_105;
      }
    }

    v43 = [v5 objectForKeyedSubscript:@"routineNumberOfTimeMatches"];
    v7 = v43;
    if (v43)
    {
      if ([v43 unsignedIntegerValue] != self->_routineInfo.numberOfTimeMatches) {
        goto LABEL_105;
      }
    }

    v44 = [v5 objectForKeyedSubscript:@"routineNumberOfClosebyLocationMatches"];
    v7 = v44;
    if (v44)
    {
      if ([v44 unsignedIntegerValue] != self->_routineInfo.numberOfCloseByLocationMatches) {
        goto LABEL_105;
      }
    }

    v45 = [v5 objectForKeyedSubscript:@"routineNumberOfRemoteLocationMatches"];
    v7 = v45;
    if (v45)
    {
      if ([v45 unsignedIntegerValue] != self->_routineInfo.numberOfRemoteLocationMatches) {
        goto LABEL_105;
      }
    }

    v46 = [v5 objectForKeyedSubscript:@"routineNumberofMatchRequests"];
    v7 = v46;
    if (v46)
    {
      if ([v46 unsignedIntegerValue] != self->_routineInfo.numberOfMatchRequests) {
        goto LABEL_105;
      }
    }

    v47 = [v5 objectForKeyedSubscript:@"routinePinningVisitsRatio"];
    v7 = v47;
    if (v47)
    {
      if (self->_routineInfo.pinningVisitsRatio != (double)(unint64_t)[v47 unsignedIntegerValue]) {
        goto LABEL_105;
      }
    }

    v48 = [v5 objectForKeyedSubscript:@"personalGoodAestheticsThreshold"];
    v7 = v48;
    if (v48)
    {
      [v48 doubleValue];
      if (v49 != self->_personalGoodAestheticsThreshold) {
        goto LABEL_105;
      }
    }

    v50 = [v5 objectForKeyedSubscript:@"personalHighAestheticsThreshold"];
    v7 = v50;
    if (v50)
    {
      [v50 doubleValue];
      if (v51 != self->_personalHighAestheticsThreshold) {
        goto LABEL_105;
      }
    }

    v52 = [v5 objectForKeyedSubscript:@"numberOfSelfies"];
    v7 = v52;
    if (v52)
    {
      if ([v52 unsignedIntegerValue] != self->_numberOfSelfies) {
        goto LABEL_105;
      }
    }

    v53 = [v5 objectForKeyedSubscript:@"topTierAestheticScore"];
    v7 = v53;
    if (v53)
    {
      [v53 doubleValue];
      if (v54 != self->_topTierAestheticScore) {
        goto LABEL_105;
      }
    }

    v55 = [v5 objectForKeyedSubscript:@"topTierAestheticScoreForTripKeyAsset"];
    v7 = v55;
    if (v55)
    {
      [v55 doubleValue];
      if (v56 != self->_topTierAestheticScoreForTripKeyAsset) {
        goto LABEL_105;
      }
    }

    v57 = [v5 objectForKeyedSubscript:@"numberOfUtilityAssets"];
    v7 = v57;
    if (v57)
    {
      if ([v57 unsignedIntegerValue] != self->_numberOfUtilityAssets) {
        goto LABEL_105;
      }
    }

    v58 = [v5 objectForKeyedSubscript:@"numberOfDefaultAssets"];
    v7 = v58;
    if (v58)
    {
      if ([v58 unsignedIntegerValue] != self->_numberOfDefaultAssets) {
        goto LABEL_105;
      }
    }

    v59 = [v5 objectForKeyedSubscript:@"numberOfImprovedAssets"];
    v7 = v59;
    if (v59)
    {
      if ([v59 unsignedIntegerValue] != self->_numberOfImprovedAssets) {
        goto LABEL_105;
      }
    }

    v60 = [v5 objectForKeyedSubscript:@"numberOfBetterAssets"];
    v7 = v60;
    if (v60)
    {
      if ([v60 unsignedIntegerValue] != self->_numberOfBetterAssets) {
        goto LABEL_105;
      }
    }

    v61 = [v5 objectForKeyedSubscript:@"canAccessContactsStore"];
    v7 = v61;
    if (v61)
    {
      if (self->_canAccessContactsStore != [v61 BOOLValue]) {
        goto LABEL_105;
      }
    }

    v62 = [v5 objectForKeyedSubscript:@"mergeCandidateConfidenceThreshold"];
    v7 = v62;
    if (v62)
    {
      [v62 doubleValue];
      if (v63 != self->_mergeCandidateConfidenceThreshold) {
        goto LABEL_105;
      }
    }

    v64 = [v5 objectForKeyedSubscript:@"IntelligencePlatformVersion"];
    v7 = v64;
    if (!v64 || ([v64 doubleValue], v65 == self->_intelligencePlatformVersion)) {
      BOOL v66 = 1;
    }
    else {
LABEL_105:
    }
      BOOL v66 = 0;
  }
  else
  {
    BOOL v66 = 1;
  }

  return v66;
}

- (void)setLocalProperties:(id)a3
{
  id v71 = a3;
  id v4 = [v71 objectForKeyedSubscript:@"creationDate"];
  [v4 doubleValue];
  self->_creationDateTimeInterval = v5;

  v6 = [v71 objectForKeyedSubscript:@"dateOfLastIncrementalUpdateInvocation"];
  [v6 doubleValue];
  self->_dateOfLastIncrementalUpdateInvocationTimeInterval = v7;

  double v8 = [v71 objectForKeyedSubscript:@"localeIdentifier"];
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v8;

  double v10 = [v71 objectForKeyedSubscript:@"languageIdentifiers"];
  flattenedLanguageIdentifiers = self->_flattenedLanguageIdentifiers;
  self->_flattenedLanguageIdentifiers = v10;

  v12 = [v71 objectForKeyedSubscript:@"geoServiceProviderID"];
  geoServiceProviderID = self->_geoServiceProviderID;
  self->_geoServiceProviderID = v12;

  v14 = [v71 objectForKeyedSubscript:@"curationAlgorithmsVersion"];
  self->_curationAlgorithmsVersion = [v14 unsignedIntegerValue];

  v15 = [v71 objectForKeyedSubscript:@"relatedAlgorithmsVersion"];
  self->_relatedAlgorithmsVersion = [v15 unsignedIntegerValue];

  v16 = [v71 objectForKeyedSubscript:@"memoriesAlgorithmsVersion"];
  self->_memoriesAlgorithmsVersion = [v16 unsignedIntegerValue];

  v17 = [v71 objectForKeyedSubscript:@"meaningAlgorithmsVersion"];
  self->_meaningAlgorithmsVersion = [v17 unsignedIntegerValue];

  v18 = [v71 objectForKeyedSubscript:@"personActivityMeaningAlgorithmsVersion"];
  self->_personActivityMeaningAlgorithmsVersion = [v18 unsignedIntegerValue];

  v19 = [v71 objectForKeyedSubscript:@"relationshipAlgorithmsVersion"];
  self->_relationshipAlgorithmsVersion = [v19 unsignedIntegerValue];

  v20 = [v71 objectForKeyedSubscript:@"businessitemAlgorithmsVersion"];
  self->_businessItemAlgorithmsVersion = [v20 unsignedIntegerValue];

  v21 = [v71 objectForKeyedSubscript:@"publiceventAlgorithmsVersion"];
  self->_publicEventAlgorithmsVersion = [v21 unsignedIntegerValue];

  v22 = [v71 objectForKeyedSubscript:@"holidayAlgorithmsVersion"];
  self->_holidayAlgorithmsVersion = [v22 unsignedIntegerValue];

  v23 = [v71 objectForKeyedSubscript:@"frequentlocationAlgorithmsVersion"];
  self->_frequentLocationAlgorithmsVersion = [v23 unsignedIntegerValue];

  v24 = [v71 objectForKeyedSubscript:@"autonamingAlgorithmsVersion"];
  self->_autonamingAlgorithmsVersion = [v24 unsignedIntegerValue];

  v25 = [v71 objectForKeyedSubscript:@"questionsVersion"];
  self->_questionsVersion = [v25 unsignedIntegerValue];

  v26 = [v71 objectForKeyedSubscript:@"tripKeyAssetAlgorithmsVersion"];
  self->_tripKeyAssetAlgorithmsVersion = [v26 unsignedIntegerValue];

  v27 = [v71 objectForKeyedSubscript:@"ageCategoryAlgorithmsVersion"];
  self->_ageCategoryAlgorithmsVersion = [v27 unsignedIntegerValue];

  v28 = [v71 objectForKeyedSubscript:@"memoryQualityAlgorithmsVersion"];
  self->_memoryQualityAlgorithmsVersion = [v28 unsignedIntegerValue];

  v29 = [v71 objectForKeyedSubscript:@"petAlgorithmsVersion"];
  self->_petAlgorithmsVersion = [v29 unsignedIntegerValue];

  v30 = [v71 objectForKeyedSubscript:@"featuredPhotoAlgorithmsVersion"];
  self->_featuredPhotoAlgorithmsVersion = [v30 unsignedIntegerValue];

  v31 = [v71 objectForKeyedSubscript:@"longTailFeaturedPhotoAlgorithmsVersion"];
  self->_longTailFeaturedPhotoAlgorithmsVersion = [v31 unsignedIntegerValue];

  v32 = [v71 objectForKeyedSubscript:@"sharedLibrarySuggestionsAlgorithmsVersion"];
  self->_sharedLibrarySuggestionsAlgorithmsVersion = [v32 unsignedIntegerValue];

  v33 = [v71 objectForKeyedSubscript:@"sharedLibraryStartAlgorithmsVersion"];
  self->_sharedLibraryStartAlgorithmsVersion = [v33 unsignedIntegerValue];

  v34 = [v71 objectForKeyedSubscript:@"sharedLibraryCameraLibrarySwitchAlgorithmsVersion"];
  self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion = [v34 unsignedIntegerValue];

  v35 = [v71 objectForKeyedSubscript:@"wallpaperAlgorithmsVersion"];
  self->_wallpaperAlgorithmsVersion = [v35 unsignedIntegerValue];

  v36 = [v71 objectForKeyedSubscript:@"locationRepresentativeAssetAlgorithmsVersion"];
  self->_locationRepresentativeAssetAlgorithmsVersion = [v36 unsignedIntegerValue];

  v37 = [v71 objectForKeyedSubscript:@"eventLabelingV2ModelVersion"];
  self->_eventLabelingV2ModelVersion = [v37 integerValue];

  v38 = [v71 objectForKeyedSubscript:@"personalTraitsEntityNamesVersion"];
  self->_personalTraitsEntityNamesVersion = [v38 integerValue];

  v39 = [v71 objectForKeyedSubscript:@"canUseLocationDomain"];
  v40 = v39;
  if (v39) {
    char v41 = [v39 BOOLValue];
  }
  else {
    char v41 = 1;
  }
  self->_canUseLocationDomain = v41;
  v42 = [v71 objectForKeyedSubscript:@"routineAvailable"];
  self->_routineInfo.routineAvailable = [v42 BOOLValue];

  v43 = [v71 objectForKeyedSubscript:@"routineNumberOfLocationsOfInterest"];
  self->_routineInfo.numberOfLocationsOfInterest = [v43 unsignedIntegerValue];

  v44 = [v71 objectForKeyedSubscript:@"routineNumberOfVisits"];
  self->_routineInfo.numberOfVisits = [v44 unsignedIntegerValue];

  v45 = [v71 objectForKeyedSubscript:@"routineNumberOfTimeMatches"];
  self->_routineInfo.numberOfTimeMatches = [v45 unsignedIntegerValue];

  v46 = [v71 objectForKeyedSubscript:@"routineNumberOfClosebyLocationMatches"];
  self->_routineInfo.numberOfCloseByLocationMatches = [v46 unsignedIntegerValue];

  v47 = [v71 objectForKeyedSubscript:@"routineNumberOfRemoteLocationMatches"];
  self->_routineInfo.numberOfRemoteLocationMatches = [v47 unsignedIntegerValue];

  v48 = [v71 objectForKeyedSubscript:@"routineNumberofMatchRequests"];
  self->_routineInfo.numberOfMatchRequests = [v48 unsignedIntegerValue];

  double v49 = [v71 objectForKeyedSubscript:@"routinePinningVisitsRatio"];
  [v49 doubleValue];
  self->_routineInfo.pinningVisitsRatio = v50;

  double v51 = [v71 objectForKeyedSubscript:@"personalGoodAestheticsThreshold"];
  [v51 doubleValue];
  self->_personalGoodAestheticsThreshold = v52;

  v53 = [v71 objectForKeyedSubscript:@"personalHighAestheticsThreshold"];
  [v53 doubleValue];
  self->_personalHighAestheticsThreshold = v54;

  v55 = [v71 objectForKeyedSubscript:@"numberOfSelfies"];
  self->_numberOfSelfies = [v55 unsignedIntegerValue];

  double v56 = [v71 objectForKeyedSubscript:@"topTierAestheticScore"];
  [v56 doubleValue];
  self->_topTierAestheticScore = v57;

  v58 = [v71 objectForKeyedSubscript:@"topTierAestheticScoreForTripKeyAsset"];
  [v58 doubleValue];
  self->_topTierAestheticScoreForTripKeyAsset = v59;

  v60 = [v71 objectForKeyedSubscript:@"numberOfUtilityAssets"];
  self->_numberOfUtilityAssets = [v60 unsignedIntegerValue];

  v61 = [v71 objectForKeyedSubscript:@"numberOfDefaultAssets"];
  self->_numberOfDefaultAssets = [v61 unsignedIntegerValue];

  v62 = [v71 objectForKeyedSubscript:@"numberOfImprovedAssets"];
  self->_numberOfImprovedAssets = [v62 unsignedIntegerValue];

  double v63 = [v71 objectForKeyedSubscript:@"numberOfBetterAssets"];
  self->_numberOfBetterAssets = [v63 unsignedIntegerValue];

  v64 = [v71 objectForKeyedSubscript:@"canAccessContactsStore"];
  double v65 = v64;
  if (v64) {
    char v66 = [v64 BOOLValue];
  }
  else {
    char v66 = 1;
  }
  self->_canAccessContactsStore = v66;
  v67 = [v71 objectForKeyedSubscript:@"mergeCandidateConfidenceThreshold"];
  [v67 doubleValue];
  self->_mergeCandidateConfidenceThreshold = v68;

  v69 = [v71 objectForKeyedSubscript:@"IntelligencePlatformVersion"];
  [v69 doubleValue];
  self->_intelligencePlatformVersion = v70;
}

- (PGGraphInfoNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  double v7 = [(PGGraphNode *)self init];
  double v8 = v7;
  if (v7) {
    [(PGGraphInfoNode *)v7 setLocalProperties:v6];
  }

  return v8;
}

- (PGGraphInfoNode)initWithCreationDate:(id)a3 localeIdentifier:(id)a4 languageIdentifiers:(id)a5 geoServiceProviderID:(id)a6 curationAlgorithmsVersion:(unint64_t)a7 contactsStoreAccess:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PGGraphInfoNode;
  v18 = [(PGGraphNode *)&v21 init];
  if (v18)
  {
    v19 = [(id)objc_opt_class() genericPropertiesWithCreationDate:v14 localeIdentifier:v15 languageIdentifiers:v16 geoServiceProviderID:v17 curationAlgorithmsVersion:a7 contactsStoreAccess:v8];
    [(PGGraphInfoNode *)v18 setLocalProperties:v19];
  }
  return v18;
}

+ (id)deserializeLanguageIdentifiers:(id)a3
{
  return (id)[a3 componentsSeparatedByString:@","];
}

+ (id)serializeLanguageIdentifiers:(id)a3
{
  return (id)[a3 componentsJoinedByString:@","];
}

+ (id)numberOfSelfies:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"numberOfSelfies";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a3];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)personalAestheticsPropertiesWithHighAestheticsThreshold:(double)a3 goodAestheticsThreshold:(double)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"personalHighAestheticsThreshold";
  double v5 = [NSNumber numberWithDouble:a3];
  v9[1] = @"personalGoodAestheticsThreshold";
  v10[0] = v5;
  id v6 = [NSNumber numberWithDouble:a4];
  v10[1] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)topTierScorePropertiesWithAestheticScore:(double)a3 aestheticScoreForTripKeyAsset:(double)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"topTierAestheticScore";
  double v5 = [NSNumber numberWithDouble:a3];
  v9[1] = @"topTierAestheticScoreForTripKeyAsset";
  v10[0] = v5;
  id v6 = [NSNumber numberWithDouble:a4];
  v10[1] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)assetPropertiesWithNumberOfUtilityAssets:(unint64_t)a3 numberOfDefaultAssets:(unint64_t)a4 numberOfImprovedAssets:(unint64_t)a5 numberOfBetterAssets:(unint64_t)a6
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"numberOfUtilityAssets";
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v16[0] = v9;
  v15[1] = @"numberOfDefaultAssets";
  double v10 = [NSNumber numberWithUnsignedInteger:a4];
  v16[1] = v10;
  v15[2] = @"numberOfImprovedAssets";
  v11 = [NSNumber numberWithUnsignedInteger:a5];
  v16[2] = v11;
  v15[3] = @"numberOfBetterAssets";
  v12 = [NSNumber numberWithUnsignedInteger:a6];
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v13;
}

+ (id)routineInfoPropertiesWithServiceManager:(id)a3
{
  v19[8] = *MEMORY[0x1E4F143B8];
  v18[0] = @"routineAvailable";
  uint64_t v3 = NSNumber;
  id v4 = a3;
  double v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "routineIsAvailable"));
  v19[0] = v5;
  v18[1] = @"routineNumberOfLocationsOfInterest";
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfLocationsOfInterest"));
  v19[1] = v6;
  v18[2] = @"routineNumberOfVisits";
  double v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfVisits"));
  v19[2] = v7;
  v18[3] = @"routineNumberOfTimeMatches";
  BOOL v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfTimeMatches"));
  v19[3] = v8;
  v18[4] = @"routineNumberOfClosebyLocationMatches";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfCloseByLocationMatches"));
  v19[4] = v9;
  v18[5] = @"routineNumberOfRemoteLocationMatches";
  double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfRemoteLocationMatches"));
  v19[5] = v10;
  v18[6] = @"routineNumberofMatchRequests";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfMatchRequests"));
  v19[6] = v11;
  v18[7] = @"routinePinningVisitsRatio";
  v12 = NSNumber;
  [v4 pinningVisitsRatio];
  double v14 = v13;

  id v15 = [v12 numberWithDouble:v14];
  v19[7] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:8];

  return v16;
}

+ (id)locationPropertiesWithCanUseLocationDomain:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"canUseLocationDomain";
  uint64_t v3 = [NSNumber numberWithBool:a3];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)propertiesWithLastIncrementalUpdateInvocationOnDate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v7 = @"dateOfLastIncrementalUpdateInvocation";
  uint64_t v3 = NSNumber;
  [a3 timeIntervalSinceReferenceDate];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v8[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)genericPropertiesWithCreationDate:(id)a3 localeIdentifier:(id)a4 languageIdentifiers:(id)a5 geoServiceProviderID:(id)a6 curationAlgorithmsVersion:(unint64_t)a7 contactsStoreAccess:(BOOL)a8
{
  BOOL v35 = a8;
  v42[33] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = [(id)objc_opt_class() serializeLanguageIdentifiers:v13];

  v40 = objc_alloc_init(PGEventLabelingConfiguration);
  uint64_t v16 = [(PGEventLabelingConfiguration *)v40 modelVersion];
  if (_os_feature_enabled_impl())
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F8E848]);
    uint64_t v18 = [v17 configurationVersion];
  }
  else
  {
    uint64_t v18 = 0;
  }
  double v19 = *MEMORY[0x1E4F70650];
  v41[0] = @"creationDate";
  v20 = NSNumber;
  [v14 timeIntervalSinceReferenceDate];
  v39 = objc_msgSend(v20, "numberWithDouble:");
  v42[0] = v39;
  v41[1] = @"dateOfLastIncrementalUpdateInvocation";
  objc_super v21 = NSNumber;
  [v14 timeIntervalSinceReferenceDate];
  double v23 = v22;

  v24 = [v21 numberWithDouble:v23];
  v42[1] = v24;
  v42[2] = v11;
  v38 = v11;
  v41[2] = @"localeIdentifier";
  v41[3] = @"languageIdentifiers";
  v42[3] = v15;
  v42[4] = v12;
  v41[4] = @"geoServiceProviderID";
  v41[5] = @"canAccessContactsStore";
  v25 = [NSNumber numberWithBool:v35];
  v42[5] = v25;
  v41[6] = @"eventLabelingV2ModelVersion";
  v26 = [NSNumber numberWithInteger:v16];
  v42[6] = v26;
  v41[7] = @"personalTraitsEntityNamesVersion";
  v27 = [NSNumber numberWithInteger:v18];
  v42[7] = v27;
  v41[8] = @"curationAlgorithmsVersion";
  v28 = [NSNumber numberWithUnsignedInteger:a7];
  v42[8] = v28;
  v42[9] = &unk_1F28D2BE0;
  v41[9] = @"relatedAlgorithmsVersion";
  v41[10] = @"memoriesAlgorithmsVersion";
  v42[10] = &unk_1F28D2BF8;
  v42[11] = &unk_1F28D2C10;
  v37 = (void *)v15;
  v41[11] = @"meaningAlgorithmsVersion";
  v41[12] = @"personActivityMeaningAlgorithmsVersion";
  v42[12] = &unk_1F28D2C28;
  v42[13] = &unk_1F28D2BE0;
  v41[13] = @"relationshipAlgorithmsVersion";
  v41[14] = @"businessitemAlgorithmsVersion";
  v42[14] = &unk_1F28D2C28;
  v42[15] = &unk_1F28D2C28;
  v41[15] = @"publiceventAlgorithmsVersion";
  v41[16] = @"holidayAlgorithmsVersion";
  v42[16] = &unk_1F28D2C40;
  v42[17] = &unk_1F28D2C40;
  v41[17] = @"frequentlocationAlgorithmsVersion";
  v41[18] = @"autonamingAlgorithmsVersion";
  v42[18] = &unk_1F28D2C28;
  v42[19] = &unk_1F28D2C58;
  v41[19] = @"questionsVersion";
  v41[20] = @"tripKeyAssetAlgorithmsVersion";
  v42[20] = &unk_1F28D2C28;
  v42[21] = &unk_1F28D2C28;
  v41[21] = @"ageCategoryAlgorithmsVersion";
  v41[22] = @"memoryQualityAlgorithmsVersion";
  v42[22] = &unk_1F28D2C28;
  v41[23] = @"petAlgorithmsVersion";
  v29 = [NSNumber numberWithInt:201];
  v42[23] = v29;
  v42[24] = &unk_1F28D2C28;
  v41[24] = @"featuredPhotoAlgorithmsVersion";
  v41[25] = @"longTailFeaturedPhotoAlgorithmsVersion";
  v42[25] = &unk_1F28D2C28;
  v42[26] = &unk_1F28D2C28;
  v41[26] = @"sharedLibrarySuggestionsAlgorithmsVersion";
  v41[27] = @"sharedLibraryStartAlgorithmsVersion";
  v42[27] = &unk_1F28D2C28;
  v42[28] = &unk_1F28D2C40;
  v41[28] = @"sharedLibraryCameraLibrarySwitchAlgorithmsVersion";
  v41[29] = @"wallpaperAlgorithmsVersion";
  v42[29] = &unk_1F28D2C28;
  v42[30] = &unk_1F28D2C40;
  v41[30] = @"locationRepresentativeAssetAlgorithmsVersion";
  v41[31] = @"mergeCandidateConfidenceThreshold";
  v30 = NSNumber;
  [MEMORY[0x1E4F8E768] mergeCandidateConfidenceThreshold];
  v31 = objc_msgSend(v30, "numberWithDouble:");
  v42[31] = v31;
  v41[32] = @"IntelligencePlatformVersion";
  v32 = [NSNumber numberWithDouble:v19];
  v42[32] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:33];

  return v33;
}

@end
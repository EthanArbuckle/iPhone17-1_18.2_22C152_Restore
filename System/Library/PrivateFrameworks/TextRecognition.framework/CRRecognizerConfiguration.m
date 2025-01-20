@interface CRRecognizerConfiguration
+ (id)languageSetFromInputLanguages:(id)a3 supportedLanguages:(id)a4;
+ (id)supportedLanguagesForVersion:(int64_t)a3;
- (BOOL)falsePositiveFilteringDisabled;
- (BOOL)optimizeGroupsForStability;
- (BOOL)rectifyPolygons;
- (BOOL)scriptDetectionDisabled;
- (BOOL)skipRecognition;
- (CRRecognizerConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4;
- (CRTextFeatureOrdering)cachedTextFeatureOrder;
- (CRTextFeatureOrdering)textFeatureOrder;
- (CRTextFeaturesFiltering)cachedTextFeatureFilter;
- (CRTextFeaturesFiltering)textFeatureFilter;
- (MTLDevice)metalDevice;
- (double)angleThresholdForRotatedCrops;
- (id)initV2DefaultConfigWithOptions:(id)a3;
- (id)initV3DefaultConfigWithOptions:(id)a3;
- (int)colorSpace;
- (int64_t)numTopStringCandidates;
- (unint64_t)computeDeviceType;
- (unint64_t)revision;
- (void)setCachedTextFeatureFilter:(id)a3;
- (void)setCachedTextFeatureOrder:(id)a3;
- (void)setOptimizeGroupsForStability:(BOOL)a3;
@end

@implementation CRRecognizerConfiguration

- (CRRecognizerConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];
    uint64_t v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    uint64_t v9 = +[CRImageReader defaultRevisionNumber];
  }

  if (v9 == 3)
  {
    v11 = [(CRRecognizerConfiguration *)self initV3DefaultConfigWithOptions:v6];
  }
  else
  {
    if (v9 != 2)
    {
      if (v9 != 1)
      {
        if (a4)
        {
          +[CRImageReader errorWithErrorCode:-4];
          v28 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v28 = 0;
        }
        goto LABEL_29;
      }
      v10 = CROSLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "Unexpected attempt to access V1 recognizer configuration", buf, 2u);
      }
    }
    v11 = [(CRRecognizerConfiguration *)self initV2DefaultConfigWithOptions:v6];
  }
  v12 = (id *)v11;
  if (v11)
  {
    v11[3] = v9;
    id v30 = 0;
    unint64_t v13 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:v6 mtlDevice:&v30];
    id v14 = v30;
    id v15 = v30;
    v12[7] = (id)v13;
    if (v15) {
      objc_storeStrong(v12 + 6, v14);
    }
    v16 = [v6 objectForKeyedSubscript:@"CRImageReaderNumTopStringCandidates"];

    if (v16)
    {
      v17 = [v6 objectForKeyedSubscript:@"CRImageReaderNumTopStringCandidates"];
      v12[4] = (id)[v17 integerValue];
    }
    v18 = [v6 objectForKeyedSubscript:@"CRImageReaderDisableFalsePositivePostFilter"];

    if (v18)
    {
      v19 = [v6 objectForKeyedSubscript:@"CRImageReaderDisableFalsePositivePostFilter"];
      *((unsigned char *)v12 + 8) = [v19 BOOLValue];
    }
    v20 = [v6 objectForKeyedSubscript:@"CRImageReaderDisableScriptDetection"];

    if (v20)
    {
      v21 = [v6 objectForKeyedSubscript:@"CRImageReaderDisableScriptDetection"];
      *((unsigned char *)v12 + 9) = [v21 BOOLValue];
    }
    v22 = [v6 objectForKeyedSubscript:@"CRImageReaderOptimizeGroupsForStability"];

    if (v22)
    {
      v23 = [v6 objectForKeyedSubscript:@"CRImageReaderOptimizeGroupsForStability"];
      *((unsigned char *)v12 + 12) = [v23 BOOLValue];
    }
    v24 = [v6 objectForKeyedSubscript:@"CRImageReaderSkipRecognition"];
    int v25 = [v24 BOOLValue];

    if (v25) {
      *((unsigned char *)v12 + 10) = 1;
    }
    v26 = [v6 objectForKeyedSubscript:@"CRImageReaderRectifyPolygons"];
    int v27 = [v26 BOOLValue];

    if (v27) {
      *((unsigned char *)v12 + 11) = 1;
    }
  }
  self = v12;
  v28 = self;
LABEL_29:

  return v28;
}

- (id)initV2DefaultConfigWithOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRRecognizerConfiguration;
  id result = [(CRRecognizerConfiguration *)&v4 init];
  if (result)
  {
    *((void *)result + 4) = 1;
    *((void *)result + 5) = 0;
    *((unsigned char *)result + 12) = 0;
    *((_DWORD *)result + 4) = 0;
    *((_DWORD *)result + 2) = 257;
  }
  return result;
}

- (id)initV3DefaultConfigWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRRecognizerConfiguration;
  v3 = [(CRRecognizerConfiguration *)&v6 init];
  objc_super v4 = v3;
  if (v3)
  {
    v3->_numTopStringCandidates = 1;
    v3->_angleThresholdForRotatedCrops = 0.0;
    *(_WORD *)&v3->_falsePositiveFilteringDisabled = 0;
    v3->_optimizeGroupsForStability = 0;
    v3->_skipRecognition = 0;
    v3->_colorSpace = 0;
    v3->_rectifyPolygons = _os_feature_enabled_impl();
  }
  return v4;
}

- (CRTextFeatureOrdering)textFeatureOrder
{
  v3 = [(CRRecognizerConfiguration *)self cachedTextFeatureOrder];

  if (!v3)
  {
    unint64_t v4 = [(CRRecognizerConfiguration *)self revision];
    [(CRRecognizerConfiguration *)self angleThresholdForRotatedCrops];
    objc_super v6 = +[CRTextFeatureOrderingUtilities textFeatureOrderWithRevision:v4 angleThresholdForRotatedCrops:[(CRRecognizerConfiguration *)self optimizeGroupsForStability] optimizeGroupsForStability:v5];
    [(CRRecognizerConfiguration *)self setCachedTextFeatureOrder:v6];
  }
  return [(CRRecognizerConfiguration *)self cachedTextFeatureOrder];
}

- (CRTextFeaturesFiltering)textFeatureFilter
{
  v3 = [(CRRecognizerConfiguration *)self cachedTextFeatureFilter];

  if (!v3)
  {
    unint64_t v4 = objc_opt_new();
    [(CRRecognizerConfiguration *)self setCachedTextFeatureFilter:v4];
  }
  return [(CRRecognizerConfiguration *)self cachedTextFeatureFilter];
}

+ (id)supportedLanguagesForVersion:(int64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 3:
      v11[0] = @"en-US";
      v11[1] = @"fr-FR";
      v11[2] = @"it-IT";
      v11[3] = @"de-DE";
      v11[4] = @"es-ES";
      v11[5] = @"pt-BR";
      v11[6] = @"zh-Hans";
      v11[7] = @"zh-Hant";
      v11[8] = @"yue-Hans";
      v11[9] = @"yue-Hant";
      v11[10] = @"ko-KR";
      v11[11] = @"ja-JP";
      v11[12] = @"ru-RU";
      v11[13] = @"uk-UA";
      v11[14] = @"th-TH";
      v11[15] = @"vi-VT";
      v11[16] = @"ar-SA";
      v11[17] = @"ars-SA";
      objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:18];
      if (_os_feature_enabled_impl())
      {
        v10[0] = @"tr-TR";
        v10[1] = @"id-ID";
        v10[2] = @"cs-CZ";
        v10[3] = @"da-DK";
        v10[4] = @"nl-NL";
        v10[5] = @"no-NO";
        v10[6] = @"nn-NO";
        v10[7] = @"nb-NO";
        v10[8] = @"ms-MY";
        v10[9] = @"pl-PL";
        v10[10] = @"ro-RO";
        v10[11] = @"sv-SE";
        v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:12];
        uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

        objc_super v6 = (void *)v8;
      }
      break;
    case 2:
      v12[0] = @"en-US";
      v12[1] = @"fr-FR";
      v12[2] = @"it-IT";
      v12[3] = @"de-DE";
      v12[4] = @"es-ES";
      v12[5] = @"pt-BR";
      v12[6] = @"zh-Hans";
      v12[7] = @"zh-Hant";
      v3 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v4 = v12;
      uint64_t v5 = 8;
      goto LABEL_8;
    case 1:
      v13[0] = @"en-US";
      v3 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v4 = v13;
      uint64_t v5 = 1;
LABEL_8:
      objc_super v6 = [v3 arrayWithObjects:v4 count:v5];
      break;
    default:
      objc_super v6 = 0;
      break;
  }
  return v6;
}

+ (id)languageSetFromInputLanguages:(id)a3 supportedLanguages:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  uint64_t v8 = v7;
  if (v5)
  {
    objc_opt_class();
    unint64_t v9 = 0x1E4F1C000uLL;
    if (objc_opt_isKindOfClass())
    {
      v40[0] = v5;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
      v11 = v5;
      id v5 = (id)v10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v29 = v8;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v5 = v5;
      uint64_t v33 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v33)
      {
        uint64_t v32 = *(void *)v35;
        id obj = v5;
        uint64_t v31 = *MEMORY[0x1E4F1C438];
        unint64_t v12 = 0x1E4F1C000uLL;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v35 != v32) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(v12 + 2592);
            id v15 = *(id *)(*((void *)&v34 + 1) + 8 * i);
            v16 = [v14 componentsFromLocaleIdentifier:v15];
            v17 = (void *)[v16 mutableCopy];

            v18 = (void *)MEMORY[0x1E4F28B50];
            id v38 = v15;
            v19 = [*(id *)(v9 + 2424) arrayWithObjects:&v38 count:1];

            v20 = [v18 preferredLocalizationsFromArray:v6 forPreferences:v19];

            if ([v20 count])
            {
              id v21 = v6;
              v22 = [v20 firstObject];
              unint64_t v23 = v12;
              v24 = [*(id *)(v12 + 2592) localeWithLocaleIdentifier:v22];
              int v25 = [v24 languageCode];
              v26 = [v17 objectForKeyedSubscript:v31];
              int v27 = [v25 isEqualToString:v26];

              if (v27) {
                [v29 addObject:v22];
              }

              id v6 = v21;
              unint64_t v9 = 0x1E4F1C000;
              unint64_t v12 = v23;
            }
          }
          id v5 = obj;
          uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v33);
      }

      uint64_t v8 = v29;
    }
  }
  else
  {
    [v7 addObjectsFromArray:v6];
  }
  if (![v8 count]) {
    [v8 addObjectsFromArray:v6];
  }

  return v8;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (int64_t)numTopStringCandidates
{
  return self->_numTopStringCandidates;
}

- (double)angleThresholdForRotatedCrops
{
  return self->_angleThresholdForRotatedCrops;
}

- (BOOL)falsePositiveFilteringDisabled
{
  return self->_falsePositiveFilteringDisabled;
}

- (BOOL)scriptDetectionDisabled
{
  return self->_scriptDetectionDisabled;
}

- (BOOL)skipRecognition
{
  return self->_skipRecognition;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)rectifyPolygons
{
  return self->_rectifyPolygons;
}

- (MTLDevice)metalDevice
{
  return (MTLDevice *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)computeDeviceType
{
  return self->_computeDeviceType;
}

- (CRTextFeatureOrdering)cachedTextFeatureOrder
{
  return (CRTextFeatureOrdering *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCachedTextFeatureOrder:(id)a3
{
}

- (CRTextFeaturesFiltering)cachedTextFeatureFilter
{
  return (CRTextFeaturesFiltering *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedTextFeatureFilter:(id)a3
{
}

- (BOOL)optimizeGroupsForStability
{
  return self->_optimizeGroupsForStability;
}

- (void)setOptimizeGroupsForStability:(BOOL)a3
{
  self->_optimizeGroupsForStability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTextFeatureFilter, 0);
  objc_storeStrong((id *)&self->_cachedTextFeatureOrder, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
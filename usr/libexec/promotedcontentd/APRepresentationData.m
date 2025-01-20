@interface APRepresentationData
- (id)_frequencyCapDataFromAdData:(id)a3;
- (id)_policyDataFromAdData:(id)a3;
- (id)_targetingDimensionsFromAdData:(id)a3;
- (id)initWithAdData:(id)a3 placementType:(int64_t)a4 maxSize:(id)a5 mediaAsset:(id)a6 error:(id *)a7;
@end

@implementation APRepresentationData

- (id)initWithAdData:(id)a3 placementType:(int64_t)a4 maxSize:(id)a5 mediaAsset:(id)a6 error:(id *)a7
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v13 = a3;
  id v14 = a6;
  v15 = [(APRepresentationData *)self init];
  v16 = v15;
  if (!v15)
  {
LABEL_41:
    v38 = v16;
    goto LABEL_42;
  }
  [(APRepresentationData *)v15 setPlacementType:a4];
  if (a4 == 4 && [v13 hasDesiredPosition]) {
    uint64_t v17 = (int)[v13 desiredPosition];
  }
  else {
    uint64_t v17 = 0;
  }
  [(APRepresentationData *)v16 setDesiredPosition:v17];
  v18 = [v13 actions];
  v19 = [v18 firstObject];

  if (v19)
  {
    v20 = [v13 actions];
    v21 = [v20 firstObject];

    v22 = [v13 iTunesMetadatas];
    v23 = +[APTapAction makeTapActionWithLegacyAction:v21 iTunesMetadata:v22 error:a7];
    [(APRepresentationData *)v16 setTapAction:v23];
  }
  if ([v13 hasSpecification])
  {
    v24 = [v13 specification];
    unsigned int v25 = [v24 hasType];

    if (v25)
    {
      v26 = [v13 specification];
      -[APRepresentationData setPlacementType:](v16, "setPlacementType:", +[APLegacyTypeTranslator creativeTypeToPlacementType:](APLegacyTypeTranslator, "creativeTypeToPlacementType:", [v26 type]));
    }
  }
  if ([v13 hasAdType])
  {
    v27 = [v13 adType];
    [(APRepresentationData *)v16 setRawAdType:v27];
  }
  if ([v13 hasAdFormatType])
  {
    v28 = [v13 adFormatType];
    [(APRepresentationData *)v16 setRawAdFormatType:v28];
  }
  [(APRepresentationData *)v16 setPrivacyMarkerPosition:3];
  if ([v13 hasAdPrivacyMarkPosition]) {
    -[APRepresentationData setPrivacyMarkerPosition:](v16, "setPrivacyMarkerPosition:", +[APLegacyTypeTranslator adPrivacyMarkPositionToAdPrivacyMarkerPosition:](APLegacyTypeTranslator, "adPrivacyMarkPositionToAdPrivacyMarkerPosition:", [v13 adPrivacyMarkPosition]));
  }
  if (v14)
  {
    v29 = [v14 mediaURL];
    v30 = +[NSURL URLWithString:v29];
    [(APRepresentationData *)v16 setVideoURL:v30];

    v31 = [v13 mediaFiles];
    [v31 duration];
    -[APRepresentationData setDuration:](v16, "setDuration:");

    -[APRepresentationData setSize:](v16, "setSize:", (double)(int)[v14 width], (double)(int)objc_msgSend(v14, "height"));
    [v13 skipThreshold];
    -[APRepresentationData setSkipThreshold:](v16, "setSkipThreshold:");
    [v14 bitrate];
    -[APRepresentationData setBitrate:](v16, "setBitrate:");
  }
  v32 = [v13 actions];
  if (![v32 count])
  {

LABEL_25:
    if ([(APRepresentationData *)v16 placementType] != (id)3)
    {
      +[APLegacyTypeTranslator adSizeForContainerSize:adData:](APLegacyTypeTranslator, "adSizeForContainerSize:adData:", v13, var0, var1);
      -[APRepresentationData setSize:](v16, "setSize:");
    }
    v39 = [v13 nativeMetadatas];

    if (v39)
    {
      v40 = [v13 nativeMetadatas];
      v41 = +[APLegacyTypeTranslator parameterArrayToDictionary:v40];

      v42 = [v41 objectForKeyedSubscript:@"nativeAdArticleId"];
      [(APRepresentationData *)v16 setArticleID:v42];

      v43 = [v41 objectForKeyedSubscript:@"nativeAdTitle"];
      [(APRepresentationData *)v16 setArticleTitle:v43];

      v44 = [v41 objectForKeyedSubscript:@"nativeAdSponsoredBy"];
      [(APRepresentationData *)v16 setAdvertiserName:v44];

      v45 = [v41 objectForKeyedSubscript:@"nativeAdCampaignData"];
      [(APRepresentationData *)v16 setCampaignData:v45];

      v46 = [v41 objectForKeyedSubscript:@"videoSkipEnabled"];
      -[APRepresentationData setSkipEnabled:](v16, "setSkipEnabled:", [v46 BOOLValue]);

      v47 = [v41 objectForKeyedSubscript:@"unbranded"];
      -[APRepresentationData setUnbranded:](v16, "setUnbranded:", [v47 BOOLValue]);
    }
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"), v48 = objc_claimAutoreleasedReturnValue(), [v48 adTag], v49 = objc_claimAutoreleasedReturnValue(), v49, v48, v49))
    {
      v50 = +[APMockAdServerSettings settings];
      v51 = [v50 adTag];
      v52 = +[APLegacyTypeTranslator base64Decode:v51];
      [(APRepresentationData *)v16 setAdTag:v52];
    }
    else
    {
      if (![v13 hasAdTagContentString])
      {
LABEL_35:
        if ([v13 hasAdFrequencyCapData])
        {
          v53 = [(APRepresentationData *)v16 _frequencyCapDataFromAdData:v13];
          [(APRepresentationData *)v16 setFrequencyCapData:v53];
        }
        if ([v13 hasPolicyData])
        {
          v54 = [(APRepresentationData *)v16 _policyDataFromAdData:v13];
          [(APRepresentationData *)v16 setPolicyData:v54];
        }
        if ([v13 hasTargetingDimensions])
        {
          v55 = [(APRepresentationData *)v16 _targetingDimensionsFromAdData:v13];
          [(APRepresentationData *)v16 setTargetingDimensions:v55];
        }
        goto LABEL_41;
      }
      v50 = [v13 adTagContentString];
      v51 = +[APLegacyTypeTranslator base64Decode:v50];
      [(APRepresentationData *)v16 setAdTag:v51];
    }

    goto LABEL_35;
  }
  v33 = [v13 actions];
  v34 = [v33 objectAtIndexedSubscript:0];
  unsigned int v35 = [v34 hasAppStoreViewTemplate];

  if (!v35) {
    goto LABEL_25;
  }
  -[APRepresentationData setSize:](v16, "setSize:", var0, var1);
  v36 = APLogForCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = [(APRepresentationData *)v16 identifier];
    int v57 = 138543362;
    v58 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "We are turning off NAAN ads. Following content is being dropped: %{public}@", (uint8_t *)&v57, 0xCu);
  }
  v38 = 0;
LABEL_42:

  return v38;
}

- (id)_frequencyCapDataFromAdData:(id)a3
{
  id v4 = a3;
  v5 = [v4 adFrequencyCapData];

  if (v5)
  {
    v6 = [v4 adFrequencyCapData];
    id v7 = objc_alloc_init((Class)APFrequencyCapData);
    [v7 setRelevantIdentifier:+[APLegacyTypeTranslator RelevantIdentifierToRelevantIdentifierType:](APLegacyTypeTranslator, "RelevantIdentifierToRelevantIdentifierType:", [v6 relevantIdentifier])];
    [v7 setValue:[v6 adFrequencyValue]];
    [v7 setDuration:[v6 adFrequencyDuration]];
  }
  else
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(APRepresentationData *)self identifier];
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Content %{public}@ has no frequency cap data.", (uint8_t *)&v11, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_policyDataFromAdData:(id)a3
{
  id v4 = a3;
  v5 = [v4 policyData];

  if (v5)
  {
    v6 = [v4 policyData];
    id v7 = objc_alloc_init((Class)APPolicyData);
    v8 = [v6 identifier];
    [v7 setCreativeIdentifier:v8];

    v9 = [v6 policyValues];
    v10 = +[APLegacyTypeTranslator numericParameterArrayToDictionary:v9];
    [v7 setPolicyValue:v10];
  }
  else
  {
    int v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [(APRepresentationData *)self identifier];
      int v14 = 138543362;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Content %{public}@ has no policy data.", (uint8_t *)&v14, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_targetingDimensionsFromAdData:(id)a3
{
  id v4 = a3;
  v5 = [v4 targetingDimensions];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = [v4 targetingDimensions];
    v8 = [v7 inclusionCriterias];

    id v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v14 = objc_alloc_init((Class)APTargetingCriteria);
          v15 = [v13 criteriaIdentifier];
          [v14 setIdentifier:v15];

          v16 = [v13 criteriaValues];
          [v14 setValues:v16];

          [v6 addObject:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    id v17 = objc_alloc_init((Class)NSMutableArray);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v4;
    v18 = [v4 targetingDimensions];
    v19 = [v18 exclusionCriterias];

    id v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
          id v25 = objc_alloc_init((Class)APTargetingCriteria);
          v26 = [v24 criteriaIdentifier];
          [v25 setIdentifier:v26];

          v27 = [v24 criteriaValues];
          [v25 setValues:v27];

          [v17 addObject:v25];
        }
        id v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);
    }

    id v28 = objc_alloc_init((Class)APTargetingDimensions);
    [v28 setInclusionCriteria:v6];
    [v28 setExclusionCriteria:v17];

    id v4 = v32;
  }
  else
  {
    v29 = APLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = [(APRepresentationData *)self identifier];
      *(_DWORD *)buf = 138543362;
      v44 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Content %{public}@ has no targeting dimensions data.", buf, 0xCu);
    }
    id v28 = objc_alloc_init((Class)APTargetingDimensions);
    [v28 setInclusionCriteria:&__NSArray0__struct];
    [v28 setExclusionCriteria:&__NSArray0__struct];
  }

  return v28;
}

@end
@interface APContentData
- (APContentData)initWithAdData:(id)a3 identifier:(id)a4 contextIdentifier:(id)a5 placementType:(int64_t)a6 maxSize:(id)a7;
- (APContentData)initWithUnfilledReason:(int64_t)a3 error:(id)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 containerSize:(id)a7 placementType:(int64_t)a8;
- (id)_createInstallAttributionFromAdData:(id)a3;
- (id)_createRepresentationsFromAdData:(id)a3 placementType:(int64_t)a4 maxSize:(id)a5 mediaAssets:(id)a6;
- (id)initRateLimitedForContextId:(id)a3 containerSize:(id)a4 placementType:(int64_t)a5;
- (void)addRepresentationWithSize:(id)a3 andPlacementType:(int64_t)a4;
@end

@implementation APContentData

- (APContentData)initWithAdData:(id)a3 identifier:(id)a4 contextIdentifier:(id)a5 placementType:(int64_t)a6 maxSize:(id)a7
{
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = [(APContentData *)self init];
  v17 = v16;
  if (!v16)
  {
LABEL_61:
    v96 = v17;
    goto LABEL_62;
  }
  [(APContentData *)v16 setIdentifier:v14];
  [(APContentData *)v17 setContextIdentifier:v15];
  if ([v13 hasUniqueIdentifier])
  {
    v18 = [v13 uniqueIdentifier];
    [(APContentData *)v17 setUniqueIdentifier:v18];
  }
  v19 = [v13 mediaFiles];
  v20 = [v19 mediaAssets];
  v21 = -[APContentData _createRepresentationsFromAdData:placementType:maxSize:mediaAssets:](v17, "_createRepresentationsFromAdData:placementType:maxSize:mediaAssets:", v13, a6, v20, var0, var1);

  if ([v13 hasMediaFiles])
  {
    v22 = [v13 mediaFiles];
    v23 = [v22 mediaAssets];
    id v24 = [v23 count];

    if (v24)
    {
      int64_t v98 = a6;
      id v99 = v14;
      id v101 = v15;
      v25 = +[APDeviceInfo current];
      v26 = [v25 signalStrength];
      id v27 = [v26 unsignedIntegerValue];

      v28 = +[APDeviceInfo current];
      id v29 = [v28 connectionType];

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v30 = v21;
      id v31 = v21;
      id v32 = [v31 countByEnumeratingWithState:&v104 objects:v116 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v105;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v105 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v104 + 1) + 8 * i);
            [v36 setSignalStrength:v27];
            [v36 setConnectionType:v29];
          }
          id v33 = [v31 countByEnumeratingWithState:&v104 objects:v116 count:16];
        }
        while (v33);
      }

      id v14 = v99;
      id v15 = v101;
      v21 = v30;
      a6 = v98;
    }
  }
  [(APContentData *)v17 addRepresentations:v21];
  if ([v13 hasInstallAttribution])
  {
    v37 = [v13 installAttribution];
    v38 = [(APContentData *)v17 _createInstallAttributionFromAdData:v37];
    [(APContentData *)v17 setInstallAttribution:v38];
  }
  if ([v13 hasUnfilledReasonCode])
  {
    -[APContentData setServerUnfilledReason:](v17, "setServerUnfilledReason:", +[APLegacyTypeTranslator AdDataUnfilledReasonCodeToUnfilledReasonCode:](APLegacyTypeTranslator, "AdDataUnfilledReasonCodeToUnfilledReasonCode:", [v13 unfilledReasonCode]));
    v39 = APLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = v21;
      v41 = (void *)(int)[v13 unfilledReasonCode];
      id v42 = [v13 unfilledReasonCode];
      if ((v42 - 201) >= 5)
      {
        v43 = +[NSString stringWithFormat:@"(unknown: %i)", v42];
      }
      else
      {
        v43 = *(&off_1002353E0 + (int)v42 - 201);
      }
      v77 = [v13 unfilledReasonInfo];
      *(_DWORD *)buf = 138544130;
      id v109 = v14;
      __int16 v110 = 2048;
      id v111 = v41;
      __int16 v112 = 2114;
      v113 = v43;
      __int16 v114 = 2114;
      v115 = v77;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Ad %{public}@ returned unfilled with code %ld (%{public}@) and reason %{public}@", buf, 0x2Au);

      v21 = v40;
    }

    v78 = v17;
    goto LABEL_47;
  }
  v100 = v21;
  id v102 = v15;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v44 = +[APMockAdServerSettings settings];
    v45 = [v44 statusConditionExpression];

    if (v45)
    {
      v46 = +[APMockAdServerSettings settings];
      v47 = [v46 statusConditionExpression];
      v48 = +[NSString stringWithFormat:@"%@", v47];
      [v13 setExpressionToEvaluate:v48];

      v49 = APLogForCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = [v13 expressionToEvaluate];
        *(_DWORD *)buf = 138412290;
        id v109 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Forcing status condition expression from defaults write: %@", buf, 0xCu);
      }
    }
  }
  if ([v13 hasExpressionToEvaluate])
  {
    v51 = +[PCStatusConditionsService sharedInstance];
    v52 = [v13 expressionToEvaluate];
    id v103 = 0;
    unsigned int v53 = [v51 evaluate:v52 error:&v103];
    id v54 = v103;

    if (v54)
    {
      v55 = APLogForCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v109 = v14;
        __int16 v110 = 2114;
        id v111 = v54;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Error in status condition for content %{public}@: %{public}@", buf, 0x16u);
      }

      v56 = [v54 localizedDescription];
      v57 = +[APLegacyInterfaceError validationErrorWithCode:4507 andReason:v56];
      [(APContentData *)v17 setError:v57];

      [(APContentData *)v17 setServerUnfilledReason:1021];
    }
    if (v53)
    {
      v58 = APLogForCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = [v13 expressionToEvaluate];
        *(_DWORD *)buf = 138543618;
        id v109 = v14;
        __int16 v110 = 2112;
        id v111 = v59;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Discarding content %{public}@ for status condition %@", buf, 0x16u);
      }
      v60 = +[APLegacyInterfaceError discardedErrorWithCode:2600 andReason:@"Status condition hit"];
      [(APContentData *)v17 setError:v60];

      [(APContentData *)v17 setServerUnfilledReason:1020];
    }
  }
  if (![v13 hasExpirationDate])
  {
    v72 = [v13 adDataResponseIdentifier];
    v73 = [(APContentData *)v17 identifier];
    v74 = +[NSString stringWithFormat:@"Ad %@ with adOpID %@ has no expiration date set.", v72, v73];
    v75 = +[APLegacyInterfaceError validationErrorWithCode:4502 andReason:v74];
    [(APContentData *)v17 setError:v75];

    [(APContentData *)v17 setServerUnfilledReason:1021];
    v76 = v17;
    goto LABEL_43;
  }
  [v13 expirationDate];
  v61 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& +[APMockAdServerSettings isAdResponseMockedForPlacementType:a6])
  {
    v62 = +[NSDate date];
    uint64_t v63 = [v62 dateByAddingTimeInterval:14400.0];

    v61 = (void *)v63;
  }
  v64 = +[NSDate date];
  v65 = [v64 dateByAddingTimeInterval:2592000.0];
  if ([v61 compare:v64] != (id)-1 && objc_msgSend(v61, "compare:", v65) != (id)1)
  {
    [(APContentData *)v17 setExpirationDate:v61];

    v79 = +[NSMutableDictionary dictionary];
    [(APContentData *)v17 setMetadata:v79];

    v80 = [v13 nativeMetadatas];

    if (v80)
    {
      v81 = [v13 nativeMetadatas];
      v82 = +[APLegacyTypeTranslator parameterArrayToDictionaryForMetadata:v81];

      v83 = [(APContentData *)v17 metadata];
      [v83 setValue:v82 forKey:@"nativeMetadata"];
    }
    if ([v13 hasTransparencyDetails])
    {
      v84 = [v13 transparencyDetails];
      v85 = [v84 transparencyRendererURL];
      v86 = +[NSURL URLWithString:v85];
      [(APContentData *)v17 setDisclosureURL:v86];

      v87 = [v13 transparencyDetails];
      v88 = [v87 transparencyRendererPayload];
      [(APContentData *)v17 setDisclosureRendererPayload:v88];

      v89 = [v13 transparencyDetails];
      v90 = [v89 targetingExpressionId];
      [(APContentData *)v17 setTargetingExpressionId:v90];
    }
    if ([v13 hasMinimumIntervalBetweenPresentations])
    {
      [v13 minimumIntervalBetweenPresentations];
      [(APContentData *)v17 setMinimumTimeBetweenPresentation:(unint64_t)v91];
    }
    if ([v13 hasHumanReadableName])
    {
      v92 = [v13 humanReadableName];
      [(APContentData *)v17 setBrandName:v92];

      v93 = [v13 humanReadableName];
      [(APContentData *)v17 setHumanReadableName:v93];
    }
    if ([v13 hasAccessibilityDescription])
    {
      v94 = [v13 accessibilityDescription];
      [(APContentData *)v17 setCampaignText:v94];
    }
    if ([v13 hasBannerImpressionThreshold])
    {
      [v13 bannerImpressionThreshold];
      [(APContentData *)v17 setImpressionThreshold:v95];
    }

    goto LABEL_61;
  }
  [v13 adDataResponseIdentifier];
  v67 = id v66 = v14;
  v68 = [(APContentData *)v17 identifier];
  v69 = +[NSString stringWithFormat:@"Ad %@ with adOpID %@ has an invalid expiration date.", v67, v68];
  v70 = +[APLegacyInterfaceError validationErrorWithCode:4502 andReason:v69];
  [(APContentData *)v17 setError:v70];

  id v14 = v66;
  id v15 = v102;
  [(APContentData *)v17 setServerUnfilledReason:1021];
  v71 = v17;

LABEL_43:
  v21 = v100;
LABEL_47:

LABEL_62:
  return v17;
}

- (id)initRateLimitedForContextId:(id)a3 containerSize:(id)a4 placementType:(int64_t)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v10 = [(APContentData *)self init];
  v11 = v10;
  if (v10)
  {
    [(APContentData *)v10 setContextIdentifier:v9];
    [(APContentData *)v11 setServerUnfilledReason:1000];
    -[APContentData addRepresentationWithSize:andPlacementType:](v11, "addRepresentationWithSize:andPlacementType:", a5, var0, var1);
  }

  return v11;
}

- (APContentData)initWithUnfilledReason:(int64_t)a3 error:(id)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 containerSize:(id)a7 placementType:(int64_t)a8
{
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = [(APContentData *)self init];
  v19 = v18;
  if (v18)
  {
    [(APContentData *)v18 setIdentifier:v16];
    [(APContentData *)v19 setContextIdentifier:v17];
    [(APContentData *)v19 setError:v15];
    [(APContentData *)v19 setServerUnfilledReason:a3];
    -[APContentData addRepresentationWithSize:andPlacementType:](v19, "addRepresentationWithSize:andPlacementType:", a8, var0, var1);
  }

  return v19;
}

- (void)addRepresentationWithSize:(id)a3 andPlacementType:(int64_t)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = objc_alloc_init((Class)APRepresentationData);
  [v8 setPlacementType:a4];
  +[APLegacyTypeTranslator errorAdSizeForContainerSize:](APLegacyTypeTranslator, "errorAdSizeForContainerSize:", var0, var1);
  [v8 setSize:];
  [(APContentData *)self addRepresentation:v8];
}

- (id)_createInstallAttributionFromAdData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)APInstallAttribution);
  [v4 setAdamId:[v3 adamId]];
  v5 = [v3 adNetworkId];
  [v4 setAdNetworkId:v5];

  v6 = [v3 attributionSignature];
  [v4 setAttributionSignature:v6];

  [v4 setCampaignId:[v3 campaignId]];
  id v7 = objc_alloc((Class)NSUUID);
  id v8 = [v3 uuid];
  id v9 = [v7 initWithUUIDString:v8];
  [v4 setContextIdentifier:v9];

  [v4 setSourceAppAdamId:[v3 sourceAppAdamId]];
  [v4 setTimestamp:[v3 timestamp]];
  v10 = [v3 version];

  [v4 setVersion:v10];

  return v4;
}

- (id)_createRepresentationsFromAdData:(id)a3 placementType:(int64_t)a4 maxSize:(id)a5 mediaAssets:(id)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v10 = a3;
  id v11 = a6;
  v12 = +[NSMutableArray array];
  v40 = v12;
  if ([v10 adLayoutDatasCount])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = [v10 adLayoutDatas];
    id v14 = [v13 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v14)
    {
      id v15 = v14;
      id v39 = v11;
      id v16 = 0;
      uint64_t v17 = *(void *)v50;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          v19 = v16;
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          id v21 = objc_alloc((Class)PCNativeRepresentation);
          id v48 = v16;
          id v22 = [v21 initWithAdData:v10 placementType:a4 maxSize:v20 nativeLayout:&v48 error:var0, var1];
          id v16 = v48;

          if (v16)
          {
            [(APContentData *)self setError:v16];
          }
          else if (v22)
          {
            [v12 addObject:v22];
          }
          else
          {
            v23 = APLogForCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v24 = [(APContentData *)self identifier];
              *(_DWORD *)buf = 138543362;
              v55 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Unknown error creating representation for content %{public}@", buf, 0xCu);

              v12 = v40;
            }
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v15);
LABEL_32:
      id v11 = v39;
      goto LABEL_41;
    }
LABEL_33:
    id v16 = 0;
    goto LABEL_41;
  }
  if (v11)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v13 = v11;
    id v25 = [v13 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v25)
    {
      id v26 = v25;
      id v39 = v11;
      id v16 = 0;
      uint64_t v27 = *(void *)v45;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          id v29 = v16;
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v13);
          }
          uint64_t v30 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
          id v31 = objc_alloc((Class)APRepresentationData);
          id v43 = v16;
          id v32 = [v31 initWithAdData:v10 placementType:a4 maxSize:v30 mediaAsset:&v43 error:var0, var1];
          id v16 = v43;

          if (v16)
          {
            [(APContentData *)self setError:v16];
          }
          else if (v32)
          {
            [v12 addObject:v32];
          }
          else
          {
            id v33 = APLogForCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              uint64_t v34 = [(APContentData *)self identifier];
              *(_DWORD *)buf = 138543362;
              v55 = v34;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Unknown error creating representation for content %{public}@", buf, 0xCu);

              v12 = v40;
            }
          }
        }
        id v26 = [v13 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v26);
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  id v42 = 0;
  id v13 = [objc_alloc((Class)APRepresentationData) initWithAdData:v10 placementType:a4 maxSize:0 mediaAsset:&v42 error:var0, var1];
  id v16 = v42;
  if (v16)
  {
    [(APContentData *)self setError:v16];
  }
  else if (v13)
  {
    [v12 addObject:v13];
  }
  else
  {
    v35 = APLogForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = [(APContentData *)self identifier];
      *(_DWORD *)buf = 138543362;
      v55 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unknown error creating representation for content %{public}@", buf, 0xCu);
    }
  }
LABEL_41:

  id v37 = [v12 copy];

  return v37;
}

@end
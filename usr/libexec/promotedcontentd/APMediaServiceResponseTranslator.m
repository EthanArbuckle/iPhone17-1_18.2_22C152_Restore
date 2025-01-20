@interface APMediaServiceResponseTranslator
+ (BOOL)checkForNonWKDiscardOverrides:(BOOL)a3 forAdamID:(id)a4;
+ (id)_translateAd:(id)a3 contextID:(id)a4 iAdID:(id)a5 placement:(unint64_t)a6;
+ (id)_translateAdResult:(id)a3 contextID:(id)a4 iAdID:(id)a5;
+ (id)_translateMediaApiResponseToAds:(id)a3 error:(id *)a4;
+ (id)translateResponse:(id)a3 requestParams:(id)a4 responseReceivedTimestamp:(double)a5 error:(id *)a6;
@end

@implementation APMediaServiceResponseTranslator

+ (id)translateResponse:(id)a3 requestParams:(id)a4 responseReceivedTimestamp:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v64 = 0;
  v12 = [a1 _translateMediaApiResponseToAds:v10 error:&v64];
  id v13 = v64;
  v14 = v13;
  if (!v12 || v13)
  {
    if (a6)
    {
      +[NSError errorWithCode:3007 internalError:v13];
      id v45 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v45 = 0;
    }
  }
  else
  {
    v47 = a6;
    id v49 = v10;
    v51 = +[NSMutableArray array];
    id v15 = objc_alloc_init((Class)NSMutableArray);
    v16 = [v11 context];
    v17 = [v16 current];
    id v54 = [v17 placement];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v48 = v12;
    id obj = v12;
    id v55 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v55)
    {
      uint64_t v53 = *(void *)v61;
      id v50 = v15;
      do
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v61 != v53) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v21 = [v11 context];
          v22 = [v21 identifier];
          v23 = [v11 idAccount];
          v24 = [v23 iAdID];
          v25 = +[APMediaServiceResponseTranslator _translateAd:v19 contextID:v22 iAdID:v24 placement:v54];

          if (!v25)
          {
            v32 = APLogForCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v67 = v19;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Translated content for ad:\n%{public}@\ncannot be nil", buf, 0xCu);
            }

            v31 = 0;
            goto LABEL_17;
          }
          [v25 setServerResponseReceivedTimestamp:a5];
          v26 = [v25 error];

          if (v26)
          {
            v27 = APLogForCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = [v25 error];
              *(_DWORD *)buf = 138412546;
              v67 = v28;
              __int16 v68 = 2114;
              v69 = v19;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error %@ parsing response for ad:\n%{public}@", buf, 0x16u);
            }
            v29 = [v25 error];
            id v30 = [v29 code];

            if (v30 != (id)2203)
            {
              v31 = v25;
LABEL_17:
              v33 = [v31 error];
              v34 = +[NSError errorWithCode:3008 internalError:v33];
              [v15 addObject:v34];
            }
          }
          else
          {
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            v35 = [v25 representations];
            id v36 = [v35 countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v36)
            {
              id v37 = v36;
              uint64_t v38 = *(void *)v57;
              do
              {
                for (j = 0; j != v37; j = (char *)j + 1)
                {
                  if (*(void *)v57 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  v40 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
                  v41 = [v11 storeFront];
                  [v40 setStoreFront:v41];

                  v42 = [v11 storeFrontLocale];
                  [v40 setStoreFrontLocale:v42];
                }
                id v37 = [v35 countByEnumeratingWithState:&v56 objects:v65 count:16];
              }
              while (v37);
            }

            [v51 addObject:v25];
            id v15 = v50;
          }
        }
        id v55 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v55);
    }

    id v43 = [v15 count];
    if (v47 && v43)
    {
      id v44 = [v15 copy];
      id *v47 = +[NSError errorWithBatchParseErrors:v44];
    }
    id v45 = [v51 copy];

    v12 = v48;
    id v10 = v49;
    v14 = 0;
  }

  return v45;
}

+ (id)_translateMediaApiResponseToAds:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  if (_checkClassType(v5, v6, @"Response dictionary", (uint64_t)a4))
  {
    v7 = [v5 objectForKey:@"results"];
    uint64_t v8 = objc_opt_class();
    if (_checkClassType(v7, v8, @"Results dictionary", (uint64_t)a4))
    {
      v9 = [v7 objectForKey:@"ads"];
      uint64_t v10 = objc_opt_class();
      if (_checkClassType(v9, v10, @"Ads array", (uint64_t)a4)) {
        id v11 = v9;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_translateAd:(id)a3 contextID:(id)a4 iAdID:(id)a5 placement:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v77 = 0;
  LODWORD(a5) = _checkClassType(v8, v11, @"ad", (uint64_t)&v77);
  id v12 = v77;
  id v13 = v12;
  if (!a5)
  {
    id v22 = 0;
    id v18 = v12;
    v23 = 0;
    v69 = 0;
    goto LABEL_35;
  }
  id v14 = v8;
  id v15 = [v14 objectForKey:@"id"];
  uint64_t v16 = objc_opt_class();
  id v76 = v13;
  char v17 = _checkClassType(v15, v16, @"adamId (id) is missing.", (uint64_t)&v76);
  id v18 = v76;

  if ((v17 & 1) == 0)
  {

    v69 = 0;
    v23 = 0;
    id v22 = 0;
    goto LABEL_35;
  }
  v65 = v15;
  v19 = [v14 objectForKey:@"attributes"];
  if (v19)
  {
    uint64_t v75 = 0;
    v20 = +[NSJSONSerialization dataWithJSONObject:v19 options:0 error:&v75];
    if (v75)
    {
      v21 = APLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "ERROR: Failed to serialize app attributes data", (uint8_t *)&buf, 2u);
      }
      unsigned int v64 = 0;
    }
    else
    {
      v21 = [objc_alloc((Class)NSString) initWithData:v20 encoding:4];
      if ([v21 containsString:@"uses-non-webkit-browser-engine"]) {
        unsigned int v64 = 1;
      }
      else {
        unsigned int v64 = [v21 containsString:@"is-custom-browser-engine-app"];
      }
    }
  }
  else
  {
    unsigned int v64 = 0;
  }
  v24 = [v14 objectForKey:@"meta"];
  uint64_t v25 = objc_opt_class();
  id v74 = v18;
  int v26 = _checkClassType(v24, v25, @"meta dictionary in ad", (uint64_t)&v74);
  id v27 = v74;

  long long v63 = v24;
  if (v26)
  {
    uint64_t v28 = [v24 objectForKey:@"adResult"];
    v29 = v24;
    id v30 = (void *)v28;
    id v62 = [v29 mutableCopy];
    [v62 removeObjectForKey:@"adResult"];
    uint64_t v31 = objc_opt_class();
    id v73 = v27;
    int v32 = _checkClassType(v30, v31, @"adResult", (uint64_t)&v73);
    id v33 = v73;

    v69 = v30;
    if (!v32)
    {
      v41 = v62;
LABEL_29:
      id v22 = [v41 copy];

      id v27 = v33;
      goto LABEL_30;
    }
    v34 = [v30 dataUsingEncoding:4];
    if (v34)
    {
      id v72 = v33;
      id v35 = +[NSJSONSerialization JSONObjectWithData:v34 options:0 error:&v72];
      id v36 = v72;

      if (v36
        || (uint64_t v37 = objc_opt_class(),
            id v71 = 0,
            int v38 = _checkClassType(v35, v37, @"ad JSON object", (uint64_t)&v71),
            id v36 = v71,
            !v38))
      {
        v41 = v62;
LABEL_28:

        id v33 = v36;
        goto LABEL_29;
      }
      id v35 = v35;

      id v33 = [v35 objectForKey:@"passthroughAdInfo"];
      if (v33)
      {
        uint64_t v39 = objc_opt_class();
        id v70 = v36;
        int v40 = _checkClassType(v33, v39, @"passthroughAdInfo", (uint64_t)&v70);
        id v61 = v70;

        if (v40)
        {
          v41 = v62;
          [v62 setValue:v33 forKey:@"passthroughAdInfo"];
          v69 = v35;
        }
        else
        {
          v69 = v35;
          v41 = v62;
        }
        id v36 = v61;
      }
      else
      {
        v69 = v35;
        v41 = v62;
      }
    }
    else
    {
      CFStringRef v84 = @"reason";
      CFStringRef v85 = @"Cannot convert adResult string to NSData.";
      id v35 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      id v36 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2201 userInfo:v35];
      v41 = v62;
    }

    goto LABEL_28;
  }
  id v22 = 0;
  v69 = 0;
LABEL_30:
  v23 = v65;

  if (v64)
  {
    v83[0] = @"uses-non-webkit-browser-engine";
    v83[1] = @"is-custom-browser-engine-app";
    v42 = +[NSArray arrayWithObjects:v83 count:2];
    unsigned int v43 = +[ASDAppCapabilities isCapableOfAction:4 capabilities:v42];
    uint64_t v44 = v43 ^ 1;
    id v45 = APLogForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x104000200;
      __int16 v81 = 1024;
      unsigned int v82 = v43;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "App discard state: isEntitledApp: %d isDMAEligible: %d", (uint8_t *)&buf, 0xEu);
    }

    v23 = v65;
    goto LABEL_38;
  }
  id v18 = v27;
LABEL_35:
  v42 = APLogForCategory();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 67109120;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "App discard state: isEntitledApp: %d", (uint8_t *)&buf, 8u);
  }
  uint64_t v44 = 0;
  id v27 = v18;
LABEL_38:

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))LODWORD(v44) = [a1 checkForNonWKDiscardOverrides:v44 forAdamID:v23]; {
  if (v27 || !v23)
  }
  {
    id v54 = _contentDataWithContextIDAndError(v9, v27);
  }
  else if (v44)
  {
    CFStringRef v78 = @"reason";
    v46 = +[NSString stringWithFormat:@"Discarding App with AdamID: %@ due to failing eligibility", v23];
    v79 = v46;
    +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    v66 = v23;
    v48 = id v47 = v9;
    id v49 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2203 userInfo:v48];

    uint64_t v50 = 1;
    if (a6 != 7005) {
      uint64_t v50 = -1;
    }
    if (a6 - 7006 >= 3) {
      unint64_t v51 = v50;
    }
    else {
      unint64_t v51 = a6 - 7004;
    }
    v52 = +[NSMutableDictionary dictionary];
    [v52 setValue:&__kCFBooleanFalse forKey:@"wasServed"];
    uint64_t v53 = +[NSNumber numberWithUnsignedInteger:v51];
    [v52 setValue:v53 forKey:@"placement"];

    id v9 = v47;
    v23 = v66;
    AnalyticsSendEvent();
    id v54 = _contentDataWithContextIDAndError(v9, v49);
  }
  else
  {
    id v55 = v9;
    id v54 = [a1 _translateAdResult:v69 contextID:v9 iAdID:v10];
    long long v56 = [v54 representations];
    long long v57 = [v56 anyObject];

    [v57 setAdamID:v23];
    if (v22)
    {
      id v58 = [v8 mutableCopy];
      [v58 setObject:v22 forKeyedSubscript:@"meta"];
      id v59 = [v58 copy];
      [v57 setAppMetadata:v59];
    }
    id v9 = v55;
  }

  return v54;
}

+ (BOOL)checkForNonWKDiscardOverrides:(BOOL)a3 forAdamID:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)NSUserDefaults);
  id v7 = [v6 initWithSuiteName:APDefaultsBundleID];
  if ([v7 BOOLForKey:@"enableNonWKOverrides"])
  {
    id v8 = [v7 stringForKey:@"nonWKAppsPromotedContent"];
    id v9 = [v8 componentsSeparatedByString:@","];
    BOOL v10 = ([v9 containsObject:v5] & 1) != 0 || [v9 count] == 0;
    unsigned int v11 = [v7 BOOLForKey:@"enableDMAEligible"];
    id v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 67109376;
      LODWORD(v17[0]) = v10;
      WORD2(v17[0]) = 1024;
      *(_DWORD *)((char *)v17 + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "App discard state after overrides check: isEntitledApp: %d isDMAEligible: %d", (uint8_t *)&v16, 0xEu);
    }

    char v13 = !v10 | v11;
    if ((v13 & 1) == 0)
    {
      id v14 = APLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        v17[0] = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Discarding ad with adamid: %@ based off overrides.", (uint8_t *)&v16, 0xCu);
      }
    }
    a3 = v13 ^ 1;
  }
  return a3;
}

+ (id)_translateAdResult:(id)a3 contextID:(id)a4 iAdID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _contentDataWithContextID(a4);
  BOOL v10 = +[NSDate date];
  [v9 setReceivedReferenceTime:v10];

  id v11 = objc_alloc_init((Class)APRepresentationData);
  [v11 setPlacementType:5];
  uint64_t v12 = [v9 identifier];
  [v11 setContentDataIdentifier:v12];

  char v13 = [v7 objectForKey:@"impressionId"];
  uint64_t v14 = objc_opt_class();
  id v136 = 0;
  LOBYTE(v12) = _checkClassType(v13, v14, @"impressionId", (uint64_t)&v136);
  id v15 = v136;
  if ((v12 & 1) == 0)
  {
    [v9 setError:v15];
    id v35 = v9;
    goto LABEL_47;
  }
  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
  [v11 setImpressionID:v16];

  char v17 = [v11 impressionID];
  uint64_t v18 = objc_opt_class();
  id v135 = v15;
  char v19 = _checkClassType(v17, v18, @"impressionId type", (uint64_t)&v135);
  id v20 = v135;

  if ((v19 & 1) == 0)
  {
    [v9 setError:v20];
    id v36 = v9;
    id v15 = v20;
    goto LABEL_47;
  }
  v21 = [v7 objectForKey:@"metadata"];

  uint64_t v22 = objc_opt_class();
  id v134 = v20;
  char v23 = _checkClassType(v21, v22, @"metadata", (uint64_t)&v134);
  id v15 = v134;

  if ((v23 & 1) == 0)
  {
    [v9 setError:v15];
    id v37 = v9;
    char v13 = v21;
    goto LABEL_47;
  }
  id v114 = v8;
  [v11 setMetadata:v21];
  char v13 = [v7 objectForKey:@"privacy"];

  uint64_t v24 = objc_opt_class();
  id v133 = v15;
  char v25 = _checkClassType(v13, v24, @"privacy", (uint64_t)&v133);
  id v26 = v133;

  if ((v25 & 1) == 0)
  {
    [v9 setError:v26];
    id v38 = v9;
    id v15 = v26;
    id v8 = v114;
    goto LABEL_47;
  }
  id v27 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
  uint64_t v28 = [[APPBTransparencyDetails alloc] initWithData:v27];
  v29 = [(APPBTransparencyDetails *)v28 transparencyRendererPayload];
  [v9 setDisclosureRendererPayload:v29];

  if ([(APPBTransparencyDetails *)v28 hasTransparencyRendererURL])
  {
    id v30 = [(APPBTransparencyDetails *)v28 transparencyRendererURL];
    uint64_t v31 = +[NSURL URLWithString:v30];
    [v9 setDisclosureURL:v31];
  }
  int v32 = [v7 objectForKey:@"targetingExpressionId"];

  if (!v32)
  {
    id v113 = v27;
    id v15 = v26;
LABEL_15:
    uint64_t v39 = [v7 objectForKey:@"journeyRelay"];
    uint64_t v40 = objc_opt_class();
    id v131 = v15;
    char v41 = _checkClassType(v39, v40, @"journeyRelay", (uint64_t)&v131);
    id v42 = v131;

    if ((v41 & 1) == 0)
    {
      [v9 setError:v42];
      id v60 = v9;
LABEL_45:

      id v15 = v42;
      id v27 = v113;
      id v8 = v114;
      goto LABEL_46;
    }
    v111 = v28;
    v112 = v39;
    id v43 = v39;
    uint64_t v44 = [v43 objectForKey:@"adGroupId"];

    uint64_t v45 = objc_opt_class();
    id v130 = v42;
    char v46 = _checkClassType(v44, v45, @"adGroupId", (uint64_t)&v130);
    id v47 = v130;

    if ((v46 & 1) == 0) {
      goto LABEL_41;
    }
    v48 = [v44 stringValue];
    [v11 setJourneyRelayAdGroupId:v48];

    id v49 = [v43 objectForKey:@"campaignId"];

    uint64_t v50 = objc_opt_class();
    id v129 = v47;
    char v51 = _checkClassType(v49, v50, @"campaignId", (uint64_t)&v129);
    id v52 = v129;

    if (v51)
    {
      uint64_t v53 = [v49 stringValue];
      [v11 setJourneyRelayCampaignId:v53];

      uint64_t v44 = [v7 objectForKey:@"clientRequestId"];

      uint64_t v54 = objc_opt_class();
      id v128 = v52;
      char v55 = _checkClassType(v44, v54, @"clientRequestId", (uint64_t)&v128);
      id v47 = v128;

      if ((v55 & 1) == 0) {
        goto LABEL_41;
      }
      [v11 setClientRequestID:v44];
      long long v56 = [v7 objectForKey:@"parentAppCheckEnabled"];

      if (v56)
      {
        uint64_t v57 = objc_opt_class();
        id v127 = v47;
        char v58 = _checkClassType(v56, v57, @"parentAppCheckEnabled", (uint64_t)&v127);
        id v59 = v127;

        if ((v58 & 1) == 0)
        {
          id v62 = v43;
          [v9 setError:v59];
          id v68 = v9;
          uint64_t v44 = v56;
LABEL_34:
          id v47 = v59;
          goto LABEL_44;
        }
        [v11 setParentAppCheckEnabled:[v56 BOOLValue]];
      }
      else
      {
        id v59 = v47;
      }
      uint64_t v44 = [v7 objectForKey:@"installAttribution"];

      uint64_t v64 = objc_opt_class();
      id v126 = v59;
      char v65 = _checkClassType(v44, v64, @"installAttribution", (uint64_t)&v126);
      id v47 = v126;

      if ((v65 & 1) == 0)
      {
LABEL_41:
        id v62 = v43;
        goto LABEL_42;
      }
      [v11 setInstallAttribution:v44];
      if (+[APSystemInternal isAppleInternalInstall])
      {
        v66 = +[APMediaServiceSettings settings];
        v67 = [v66 responseTTL];

        if (v67)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v67 intValue] > 0)
          {
            uint64_t v44 = v67;
            id v52 = v47;
            goto LABEL_37;
          }
        }
      }
      else
      {

        v67 = 0;
      }
      uint64_t v44 = [v7 objectForKey:@"ttl"];

      uint64_t v69 = objc_opt_class();
      id v125 = v47;
      char v70 = _checkClassType(v44, v69, @"ttl", (uint64_t)&v125);
      id v52 = v125;

      if (v70)
      {
LABEL_37:
        id v71 = v44;
        id v72 = +[NSDate date];
        uint64_t v73 = [v72 dateByAddingTimeInterval:(double)[v71 intValue]];
        [v9 setExpirationDate:v73];

        uint64_t v44 = [v7 objectForKey:@"rank"];

        uint64_t v74 = objc_opt_class();
        id v124 = v52;
        LOBYTE(v73) = _checkClassType(v44, v74, @"rank", (uint64_t)&v124);
        id v47 = v124;

        if (v73)
        {
          [v11 setRank:[v44 intValue]];
          uint64_t v75 = [v7 objectForKey:@"timeToDisplay"];

          if (v75)
          {
            uint64_t v76 = objc_opt_class();
            id v123 = v47;
            char v77 = _checkClassType(v75, v76, @"timeToDisplay", (uint64_t)&v123);
            id v78 = v123;

            if ((v77 & 1) == 0)
            {
              id v62 = v43;
              [v9 setError:v78];
              id v91 = v9;
              uint64_t v44 = v75;
              id v47 = v78;
              goto LABEL_44;
            }
            [v11 setTimeToDisplay:(int)[v75 intValue]];
          }
          else
          {
            id v78 = v47;
          }
          uint64_t v44 = [v7 objectForKey:@"positionInfo"];

          id v62 = v43;
          if (!v44) {
            goto LABEL_66;
          }
          uint64_t v82 = objc_opt_class();
          id v122 = v78;
          char v83 = _checkClassType(v44, v82, @"positionInfo", (uint64_t)&v122);
          id v59 = v122;

          if (v83)
          {
            id v84 = v44;
            if ([v84 count])
            {
              [v11 setPositionInformation:v84];
              CFStringRef v85 = [v11 positionInformation];
              uint64_t v44 = [v85 objectForKey:@"slot"];

              uint64_t v86 = objc_opt_class();
              id v121 = v59;
              char v87 = _checkClassType(v44, v86, @"slot", (uint64_t)&v121);
              id v47 = v121;

              if (v87)
              {
                v88 = (char *)[v44 integerValue];
                v89 = v88;
                if ((unint64_t)(v88 - 1) < 0xA)
                {
                  if ((unint64_t)v88 >= 3)
                  {
                    v90 = APLogForCategory();
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t buf = 134217984;
                      v141 = v89;
                      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Slot number: %ld", buf, 0xCu);
                    }
                  }
                  [v11 setSlotNumber:v89];
                  goto LABEL_65;
                }
                v104 = APLogForCategory();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)uint64_t buf = 134217984;
                  v141 = v89;
                  _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "Unexpected slot: %ld", buf, 0xCu);
                }

                CFStringRef v138 = @"reason";
                v105 = +[NSString stringWithFormat:@"Unexpected slot: %ld", v89];
                v139 = v105;
                v106 = +[NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
                v107 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2201 userInfo:v106];

                [v9 setError:v107];
                id v108 = v9;
              }
              else
              {
                [v9 setError:v47];
                id v103 = v9;
              }

              goto LABEL_44;
            }
            uint64_t v44 = v84;
            id v47 = v59;
LABEL_65:

            id v78 = v47;
LABEL_66:
            uint64_t v44 = [v7 objectForKey:@"cppIds"];
            if (!v44)
            {
              id v47 = v78;
LABEL_78:
              [v11 setIAdID:v114];
              [v9 addRepresentation:v11];
              goto LABEL_43;
            }
            uint64_t v93 = objc_opt_class();
            id v120 = v78;
            char v94 = _checkClassType(v44, v93, @"cppIds", (uint64_t)&v120);
            id v47 = v120;

            if (v94)
            {
              long long v116 = 0u;
              long long v117 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              id obj = v44;
              id v95 = [obj countByEnumeratingWithState:&v116 objects:v137 count:16];
              if (v95)
              {
                id v96 = v95;
                uint64_t v110 = *(void *)v117;
                while (2)
                {
                  v97 = 0;
                  v98 = v47;
                  do
                  {
                    if (*(void *)v117 != v110) {
                      objc_enumerationMutation(obj);
                    }
                    v99 = *(void **)(*((void *)&v116 + 1) + 8 * (void)v97);
                    uint64_t v100 = objc_opt_class();
                    id v115 = v98;
                    int v101 = _checkClassType(v99, v100, @"CPP_ID", (uint64_t)&v115);
                    id v47 = v115;

                    if (!v101)
                    {
                      [v9 setError:v47];
                      id v102 = v9;
                      uint64_t v44 = obj;

                      goto LABEL_44;
                    }
                    v97 = (char *)v97 + 1;
                    v98 = v47;
                  }
                  while (v96 != v97);
                  id v96 = [obj countByEnumeratingWithState:&v116 objects:v137 count:16];
                  if (v96) {
                    continue;
                  }
                  break;
                }
              }

              [v11 setCppIds:obj];
              goto LABEL_78;
            }
LABEL_42:
            [v9 setError:v47];
LABEL_43:
            id v79 = v9;
            goto LABEL_44;
          }
          [v9 setError:v59];
          id v92 = v9;
          goto LABEL_34;
        }
        goto LABEL_41;
      }
      id v62 = v43;
      [v9 setError:v52];
      id v81 = v9;
    }
    else
    {
      id v62 = v43;
      [v9 setError:v52];
      id v63 = v9;
      uint64_t v44 = v49;
    }
    id v47 = v52;
LABEL_44:
    uint64_t v28 = v111;
    uint64_t v39 = v112;

    int v32 = v44;
    id v42 = v47;
    goto LABEL_45;
  }
  uint64_t v33 = objc_opt_class();
  id v132 = v26;
  char v34 = _checkClassType(v32, v33, @"targetingExpressionId", (uint64_t)&v132);
  id v15 = v132;

  if (v34)
  {
    id v113 = v27;
    [v9 setTargetingExpressionId:v32];
    goto LABEL_15;
  }
  [v9 setError:v15];
  id v61 = v9;
  id v8 = v114;
LABEL_46:

  char v13 = v32;
LABEL_47:

  return v9;
}

@end
@interface VUIMetricsMediaEvent
+ (id)_convertToMs:(id)a3;
+ (id)_metricsDataFromPlayable:(id)a3 actionType:(id)a4 canonicalIdOverride:(id)a5;
+ (id)_metricsDataFromPlayable:(id)a3 actionType:(id)a4 canonicalIdOverride:(id)a5 durationOverride:(id)a6 contentType:(id)a7;
+ (id)_metricsDataFromTVPMediaItem:(id)a3 contentPosition:(id)a4 isBackground:(BOOL)a5 isAmbient:(BOOL)a6 actionType:(id)a7;
+ (id)clickMetricsDataFromTVPMediaItem:(id)a3;
+ (id)clickMetricsDataFromTVPMediaItem:(id)a3 targetType:(id)a4;
+ (id)generateSkipImpressionsFromSkipInfo:(id)a3;
+ (id)generateUpNextButtonImpressionsFromPromoInfo:(id)a3;
+ (id)impressionsMetricsDataFromTVPMediaItem:(id)a3;
+ (void)recordBGVideoPlayOfTVPMediaItem:(id)a3 contentPosition:(id)a4 isAmbient:(BOOL)a5 actionType:(id)a6;
+ (void)recordBGVideoPlayOfTVPMediaItem:(id)a3 isAmbient:(BOOL)a4;
+ (void)recordClickOfSkipInfo:(id)a3 onMediaItem:(id)a4 impressionData:(id)a5;
+ (void)recordClickOfUpNextButtonWithPromoInfo:(id)a3 onMediaItem:(id)a4 impressionData:(id)a5;
+ (void)recordClipPlay:(id)a3 canonicalId:(id)a4 duration:(double)a5;
+ (void)recordClipStop:(id)a3 canonicalId:(id)a4 duration:(double)a5;
+ (void)recordImpressionsOfSkipButton:(id)a3 onMediaItem:(id)a4 skipInfo:(id)a5;
+ (void)recordImpressionsOfUpNextButton:(id)a3 onMediaItem:(id)a4 promoInfo:(id)a5;
+ (void)recordPlay:(id)a3 isLaunchingExtras:(BOOL)a4;
+ (void)recordPlayOfTVPMediaItem:(id)a3;
+ (void)recordPunchout:(id)a3 isUrlForPlay:(BOOL)a4;
+ (void)recordStop:(id)a3;
@end

@implementation VUIMetricsMediaEvent

+ (void)recordPlay:(id)a3 isLaunchingExtras:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 metadata];
  int v8 = [v7 isAdultContent];

  if (v8)
  {
    v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "ignore media event for adult content", v12, 2u);
    }
  }
  else
  {
    if (v4) {
      v10 = @"extras";
    }
    else {
      v10 = @"play";
    }
    v9 = [a1 _metricsDataFromPlayable:v6 actionType:v10 canonicalIdOverride:0 durationOverride:0 contentType:0];
    v11 = +[VUIMetricsController sharedInstance];
    [v11 recordMedia:v9];
  }
}

+ (void)recordStop:(id)a3
{
  id v4 = a3;
  v5 = [v4 metadata];
  int v6 = [v5 isAdultContent];

  if (v6)
  {
    v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "ignore media event for adult content", v9, 2u);
    }
  }
  else
  {
    v7 = [a1 _metricsDataFromPlayable:v4 actionType:@"stop" canonicalIdOverride:0 durationOverride:0 contentType:0];
    int v8 = +[VUIMetricsController sharedInstance];
    [v8 recordMedia:v7];
  }
}

+ (void)recordClipPlay:(id)a3 canonicalId:(id)a4 duration:(double)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 metadata];
  int v11 = [v10 isAdultContent];

  v12 = VUIDefaultLogObject();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "ignore media event for adult content", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v13)
    {
      int v16 = 138412546;
      id v17 = v9;
      __int16 v18 = 2048;
      double v19 = a5;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "record clip play %@ - %1.2f", (uint8_t *)&v16, 0x16u);
    }

    v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:a5];
    v12 = [a1 _metricsDataFromPlayable:v8 actionType:@"play" canonicalIdOverride:v9 durationOverride:v14 contentType:@"KeyPlay"];

    v15 = +[VUIMetricsController sharedInstance];
    [v15 recordMedia:v12];
  }
}

+ (void)recordClipStop:(id)a3 canonicalId:(id)a4 duration:(double)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 metadata];
  int v11 = [v10 isAdultContent];

  v12 = VUIDefaultLogObject();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "ignore media event for adult content", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v13)
    {
      int v16 = 138412546;
      id v17 = v9;
      __int16 v18 = 2048;
      double v19 = a5;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "record clip stop %@ - %1.2f", (uint8_t *)&v16, 0x16u);
    }

    v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:a5];
    v12 = [a1 _metricsDataFromPlayable:v8 actionType:@"stop" canonicalIdOverride:v9 durationOverride:v14 contentType:@"KeyPlay"];

    v15 = +[VUIMetricsController sharedInstance];
    [v15 recordMedia:v12];
  }
}

+ (id)_metricsDataFromPlayable:(id)a3 actionType:(id)a4 canonicalIdOverride:(id)a5
{
  return (id)[a1 _metricsDataFromPlayable:a3 actionType:a4 canonicalIdOverride:a5 durationOverride:0 contentType:0];
}

+ (id)_metricsDataFromPlayable:(id)a3 actionType:(id)a4 canonicalIdOverride:(id)a5 durationOverride:(id)a6 contentType:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a4;
  id v17 = objc_opt_new();
  [v17 setObject:v16 forKey:@"actionType"];

  if ([v12 isRental]) {
    [v17 setObject:@"rental" forKey:@"entitlementReason"];
  }
  if (v13)
  {
    [v17 setObject:v13 forKey:@"id"];
    goto LABEL_12;
  }
  __int16 v18 = [v12 canonicalID];

  if (v18)
  {
    uint64_t v19 = [v12 canonicalID];
  }
  else
  {
    uint64_t v20 = [v12 liveStreamServiceID];

    if (v20)
    {
      uint64_t v19 = [v12 liveStreamServiceID];
    }
    else
    {
      v21 = [v12 referenceID];

      if (!v21) {
        goto LABEL_12;
      }
      uint64_t v19 = [v12 referenceID];
    }
  }
  v22 = (void *)v19;
  [v17 setObject:v19 forKey:@"id"];

LABEL_12:
  v23 = [v12 externalID];

  if (v23)
  {
    v24 = [v12 externalID];
    [v17 setObject:v24 forKey:@"externalId"];
  }
  v25 = [v12 referenceID];

  if (v25)
  {
    v26 = [v12 referenceID];
    [v17 setObject:v26 forKey:@"referenceId"];
  }
  v27 = [v12 mediaType];

  if (v27)
  {
    if (v15)
    {
      id v28 = v15;
    }
    else
    {
      v29 = [v12 utsEntityType];
      v30 = v29;
      if (v29)
      {
        id v31 = v29;
      }
      else
      {
        id v31 = [v12 mediaType];
      }
      id v28 = v31;
    }
    [v17 setObject:v28 forKey:@"contentType"];
    v32 = [v17 objectForKey:@"id"];
    if (v32)
    {
    }
    else
    {
      v33 = [v12 mediaType];
      int v34 = [v33 isEqualToString:@"Trailer"];

      if (v34) {
        [v17 setObject:@"trailer" forKey:@"id"];
      }
    }
  }
  v35 = [v12 channelID];

  if (v35)
  {
    v36 = [v12 channelID];
    [v17 setObject:v36 forKey:@"brandId"];
  }
  v37 = [v12 tvAppDeeplinkURL];

  if (v37)
  {
    v38 = [v12 tvAppDeeplinkURL];
    v39 = [v38 absoluteString];

    [v17 setObject:v39 forKey:@"url"];
  }
  v40 = [v12 liveStreamServiceID];
  if (v40) {
    [v17 setObject:v40 forKey:@"serviceId"];
  }
  if (v14)
  {
    id v41 = v14;
  }
  else
  {
    v42 = [v12 metadata];
    id v41 = [v42 duration];

    if (!v41) {
      goto LABEL_38;
    }
  }
  v43 = [a1 _convertToMs:v41];

  [v17 setObject:v43 forKey:@"duration"];
LABEL_38:
  v44 = (void *)[v17 copy];

  return v44;
}

+ (void)recordPunchout:(id)a3 isUrlForPlay:(BOOL)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isAdultContent])
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "ignore media event for adult content", v27, 2u);
    }
  }
  else
  {
    v5 = objc_opt_new();
    [v5 setObject:@"punchout" forKey:@"actionType"];
    id v28 = @"isEntitledToPlay";
    int v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "isEntitledToPlay"));
    v29[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

    [v5 setObject:v7 forKey:@"actionDetails"];
    id v8 = [v4 canonicalID];

    if (v8)
    {
      id v9 = [v4 canonicalID];
      [v5 setObject:v9 forKey:@"id"];
    }
    v10 = [v4 externalID];

    if (v10)
    {
      int v11 = [v4 externalID];
      [v5 setObject:v11 forKey:@"externalId"];
    }
    id v12 = [v4 referenceID];

    if (v12)
    {
      id v13 = [v4 referenceID];
      [v5 setObject:v13 forKey:@"referenceId"];
    }
    id v14 = [v4 mediaType];

    if (v14)
    {
      id v15 = [v4 mediaType];
      [v5 setObject:v15 forKey:@"contentType"];
    }
    id v16 = [v4 channelDetails];
    id v17 = [v16 channelID];

    if (v17)
    {
      __int16 v18 = [v4 channelDetails];
      uint64_t v19 = [v18 channelID];
      [v5 setObject:v19 forKey:@"brandId"];

      uint64_t v20 = [v5 objectForKey:@"id"];

      if (!v20)
      {
        v21 = [v4 channelDetails];
        v22 = [v21 channelID];
        [v5 setObject:v22 forKey:@"id"];
      }
    }
    v23 = [v4 punchoutURL];

    if (v23)
    {
      v24 = [v4 punchoutURL];
      v25 = [v24 absoluteString];

      [v5 setObject:v25 forKey:@"url"];
    }
    v26 = +[VUIMetricsController sharedInstance];
    [v26 recordMedia:v5];
  }
}

+ (void)recordBGVideoPlayOfTVPMediaItem:(id)a3 contentPosition:(id)a4 isAmbient:(BOOL)a5 actionType:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v9 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F70]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    id v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_INFO, "ignore media event for adult content", v16, 2u);
    }
  }
  else
  {
    id v14 = +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:v9 contentPosition:v10 isBackground:1 isAmbient:v7 actionType:v11];
    id v15 = +[VUIMetricsController sharedInstance];
    [v15 recordMedia:v14];
  }
}

+ (void)recordBGVideoPlayOfTVPMediaItem:(id)a3 isAmbient:(BOOL)a4
{
}

+ (void)recordPlayOfTVPMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F70]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    int v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "ignore media event for adult content", v8, 2u);
    }
  }
  else
  {
    int v6 = +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:v3 contentPosition:0 isBackground:0 isAmbient:0 actionType:0];
    BOOL v7 = +[VUIMetricsController sharedInstance];
    [v7 recordMedia:v6];
  }
}

+ (id)clickMetricsDataFromTVPMediaItem:(id)a3
{
  return +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:a3 targetType:@"button"];
}

+ (id)clickMetricsDataFromTVPMediaItem:(id)a3 targetType:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = objc_opt_new();
  id v8 = +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:v6 contentPosition:0 isBackground:0 isAmbient:0 actionType:0];

  [v7 addEntriesFromDictionary:v8];
  id v9 = [v7 valueForKey:@"id"];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [v8 objectForKey:@"contentType"];
    id v11 = @"trailer";
    char v13 = [v12 isEqualToString:@"trailer"];

    if ((v13 & 1) == 0)
    {
      id v14 = VUIDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_INFO, "VUIMetricsMediaEvent: No media ID found for non-trailer TVPMediaItem", v17, 2u);
      }

      id v11 = &stru_1F3E921E0;
    }
  }
  v18[0] = @"targetId";
  v18[1] = @"targetType";
  v19[0] = v11;
  v19[1] = v5;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v7 addEntriesFromDictionary:v15];

  [v7 removeObjectForKey:@"startType"];
  [v7 removeObjectForKey:@"url"];
  [v7 removeObjectForKey:@"id"];

  return v7;
}

+ (id)impressionsMetricsDataFromTVPMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:v3 contentPosition:0 isBackground:0 isAmbient:0 actionType:0];
  [v4 addEntriesFromDictionary:v5];
  [v4 removeObjectForKey:@"startType"];
  [v4 removeObjectForKey:@"url"];
  id v6 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

  if ([v6 length]) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  [v4 setObject:v7 forKeyedSubscript:@"name"];

  return v4;
}

+ (void)recordClickOfSkipInfo:(id)a3 onMediaItem:(id)a4 impressionData:(id)a5
{
  v40[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  id v9 = [v6 promoInfo];

  if (v9)
  {
    id v10 = [v6 promoInfo];
    uint64_t v11 = [v10 canonicalId];

    id v8 = (__CFString *)v11;
  }
  if (!v8)
  {
    id v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  }
  uint64_t v12 = [v6 localizedTitle];
  uint64_t v13 = +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:v7];
  v30 = v6;
  if (v8) {
    id v14 = v8;
  }
  else {
    id v14 = &stru_1F3E921E0;
  }
  v39[0] = @"targetId";
  v39[1] = @"actionType";
  v40[0] = v14;
  v40[1] = @"skip";
  v29 = v7;
  v40[2] = @"preRoll";
  v39[2] = @"actionContext";
  v39[3] = @"actionDetails";
  id v28 = (void *)v12;
  if (v12) {
    id v15 = (__CFString *)v12;
  }
  else {
    id v15 = &stru_1F3E921E0;
  }
  v37 = @"name";
  v38 = v15;
  id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, v13);
  v40[3] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];

  __int16 v18 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v13];
  [v18 addEntriesFromDictionary:v17];
  uint64_t v19 = +[VUIMetricsJetEngine convertClickDataToImpressionsData:v18 index:0 ignoreHosted:0];
  uint64_t v20 = +[VUIMetricsJetEngine convertClickDataToLocationData:v18 index:0];
  v35[0] = @"pageId";
  v35[1] = @"pageType";
  v36[0] = v14;
  v36[1] = @"PreRoll";
  v35[2] = @"pageContext";
  v36[2] = @"preRoll";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v22 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v18];
  v32 = v19;
  v33[0] = @"impressions";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v34[0] = v23;
  v33[1] = @"location";
  id v31 = v20;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v34[1] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  [v22 addEntriesFromDictionary:v25];

  [v22 addEntriesFromDictionary:v21];
  v26 = +[VUIMetricsController sharedInstance];
  [v26 recordClick:v22];
}

+ (void)recordImpressionsOfSkipButton:(id)a3 onMediaItem:(id)a4 skipInfo:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4FA9E28];
  id v10 = a3;
  uint64_t v11 = [v7 mediaItemMetadataForProperty:v9];
  uint64_t v12 = [v8 promoInfo];

  if (v12)
  {
    uint64_t v13 = [v8 promoInfo];
    uint64_t v14 = [v13 canonicalId];

    uint64_t v11 = (__CFString *)v14;
  }
  if (!v11)
  {
    uint64_t v11 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  }
  id v15 = +[VUIMetricsMediaEvent impressionsMetricsDataFromTVPMediaItem:v7];
  id v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v15];
  [v16 addEntriesFromDictionary:v10];

  v25 = @"actionType";
  v26[0] = @"skip";
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  [v16 addEntriesFromDictionary:v17];

  __int16 v18 = &stru_1F3E921E0;
  if (v11) {
    __int16 v18 = v11;
  }
  v23[0] = @"pageId";
  v23[1] = @"pageType";
  v24[0] = v18;
  v24[1] = @"player";
  v23[2] = @"impressions";
  v22 = v16;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v24[2] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  v21 = +[VUIMetricsController sharedInstance];
  [v21 recordImpressions:v20];
}

+ (id)generateSkipImpressionsFromSkipInfo:(id)a3
{
  v21[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  id v8 = [v5 numberWithLong:(uint64_t)(v7 * 1000.0)];

  v20[0] = @"id";
  uint64_t v9 = [v4 promoInfo];
  id v10 = [v9 canonicalId];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v12 = [v4 skipIntroReportingType];
    id v3 = (void *)v12;
    uint64_t v11 = @"intro";
    if (v12) {
      uint64_t v11 = (__CFString *)v12;
    }
  }
  v21[0] = v11;
  v21[1] = @"button";
  v20[1] = @"impressionType";
  v20[2] = @"actionType";
  v21[2] = @"skip";
  v20[3] = @"name";
  uint64_t v13 = [v4 localizedTitle];
  uint64_t v14 = (void *)v13;
  id v15 = &stru_1F3E921E0;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  v21[3] = v15;
  v20[4] = @"impressionTimes";
  uint64_t v19 = v8;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v21[4] = v16;
  v21[5] = &unk_1F3F3C728;
  v20[5] = @"impressionId";
  v20[6] = @"impressionIndex";
  v21[6] = &unk_1F3F3C740;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];

  if (!v10) {
  return v17;
  }
}

+ (id)generateUpNextButtonImpressionsFromPromoInfo:(id)a3
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  double v7 = [v4 numberWithLong:(uint64_t)(v6 * 1000.0)];

  if ([v3 isAddedToUpNext]) {
    [v3 addedToUpNextLabelString];
  }
  else {
  id v8 = [v3 addToUpNextLabelString];
  }
  v17[0] = @"id";
  uint64_t v9 = [v3 canonicalId];
  id v10 = (void *)v9;
  uint64_t v11 = &stru_1F3E921E0;
  if (v9) {
    uint64_t v12 = (__CFString *)v9;
  }
  else {
    uint64_t v12 = &stru_1F3E921E0;
  }
  if (v8) {
    uint64_t v11 = v8;
  }
  v18[0] = v12;
  v18[1] = v11;
  v17[1] = @"name";
  v17[2] = @"impressionTimes";
  id v16 = v7;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  void v18[2] = v13;
  v18[3] = &unk_1F3F3C740;
  v17[3] = @"impressionId";
  v17[4] = @"impressionIndex";
  v18[4] = &unk_1F3F3C758;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  return v14;
}

+ (void)recordImpressionsOfUpNextButton:(id)a3 onMediaItem:(id)a4 promoInfo:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 canonicalId];
  uint64_t v11 = +[VUIMetricsMediaEvent impressionsMetricsDataFromTVPMediaItem:v8];

  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
  [v12 addEntriesFromDictionary:v9];

  v23[0] = @"upNextButton";
  v22[0] = @"impressionType";
  v22[1] = @"actionType";
  LODWORD(v9) = [v7 isAddedToUpNext];

  uint64_t v13 = VUIMetricsActionTypeRemove;
  if (!v9) {
    uint64_t v13 = VUIMetricsActionTypeAdd;
  }
  v23[1] = *v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v12 addEntriesFromDictionary:v14];

  id v15 = &stru_1F3E921E0;
  if (v10) {
    id v15 = v10;
  }
  v20[0] = @"pageId";
  v20[1] = @"pageType";
  v21[0] = v15;
  v21[1] = @"player";
  v20[2] = @"impressions";
  uint64_t v19 = v12;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v21[2] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  __int16 v18 = +[VUIMetricsController sharedInstance];
  [v18 recordImpressions:v17];
}

+ (void)recordClickOfUpNextButtonWithPromoInfo:(id)a3 onMediaItem:(id)a4 impressionData:(id)a5
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 canonicalId];
  if ([v6 isAddedToUpNext]) {
    [v6 addedToUpNextLabelString];
  }
  else {
  uint64_t v9 = [v6 addToUpNextLabelString];
  }
  v26 = (void *)v9;
  uint64_t v10 = +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:v7 targetType:@"upNextButton"];
  v25 = (void *)v10;

  id v27 = v8;
  if (!v8) {
    id v8 = &stru_1F3E921E0;
  }
  v37[0] = v8;
  v36[0] = @"targetId";
  v36[1] = @"actionType";
  int v11 = [v6 isAddedToUpNext];
  uint64_t v12 = VUIMetricsActionTypeRemove;
  if (!v11) {
    uint64_t v12 = VUIMetricsActionTypeAdd;
  }
  v37[1] = *v12;
  v37[2] = @"preRoll";
  v36[2] = @"actionContext";
  void v36[3] = @"actionDetails";
  if (v9) {
    uint64_t v13 = (__CFString *)v9;
  }
  else {
    uint64_t v13 = &stru_1F3E921E0;
  }
  int v34 = @"name";
  v35 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v37[3] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];

  id v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
  [v16 addEntriesFromDictionary:v15];
  id v17 = +[VUIMetricsJetEngine convertClickDataToImpressionsData:v16 index:0 ignoreHosted:0];
  __int16 v18 = +[VUIMetricsJetEngine convertClickDataToLocationData:v16 index:0];
  v32[0] = @"pageId";
  v32[1] = @"pageType";
  v33[0] = v8;
  v33[1] = @"PreRoll";
  v32[2] = @"pageContext";
  void v33[2] = @"preRoll";
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
  v29 = v17;
  v30[0] = @"impressions";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v31[0] = v21;
  v30[1] = @"location";
  id v28 = v18;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v31[1] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v20 addEntriesFromDictionary:v23];

  [v20 addEntriesFromDictionary:v19];
  v24 = +[VUIMetricsController sharedInstance];
  [v24 recordClick:v20];
}

+ (id)_metricsDataFromTVPMediaItem:(id)a3 contentPosition:(id)a4 isBackground:(BOOL)a5 isAmbient:(BOOL)a6 actionType:(id)a7
{
  BOOL v47 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a7;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [v10 mediaItemURL];

  if (v14)
  {
    id v15 = [v10 mediaItemURL];
    id v16 = [v15 absoluteString];

    [v13 setObject:v16 forKey:@"url"];
  }
  v46 = v12;
  if (v12) {
    id v17 = v12;
  }
  else {
    id v17 = @"play";
  }
  [v13 setObject:v17 forKey:@"actionType"];
  __int16 v18 = objc_msgSend(v10, "mediaItemMetadataForProperty:");
  uint64_t v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  }
  v21 = v20;

  uint64_t v22 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  v23 = (void *)v22;
  v24 = v21;
  if (v21 || (v24 = (void *)v22) != 0) {
    [v13 setObject:v24 forKey:@"id"];
  }
  v25 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
  if (v25) {
    [v13 setObject:v25 forKey:@"externalId"];
  }
  v26 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA008]];
  if (v26) {
    [v13 setObject:v26 forKey:@"referenceId"];
  }
  v48 = v23;
  id v27 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
  if (v27) {
    [v13 setObject:v27 forKey:@"brandId"];
  }
  id v28 = [v10 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipDuration"];
  if (v28
    || ([v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EB0]],
        (id v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [a1 _convertToMs:v28];
    v29 = v21;
    id v31 = v30 = a1;

    [v13 setObject:v31 forKey:@"duration"];
    a1 = v30;
    v21 = v29;
  }
  v32 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F80]];
  if (v32) {
    [v13 setObject:v32 forKey:@"serviceId"];
  }
  if (v11)
  {
    v33 = [a1 _convertToMs:v11];

    [v13 setObject:v33 forKey:@"position"];
  }
  if (v47)
  {
    [v13 setObject:@"automatic" forKey:@"startType"];
    int v34 = [v10 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipId"];
    uint64_t v35 = [v34 length];

    if (v35) {
      v36 = @"KeyPlay";
    }
    else {
      v36 = @"ambient";
    }
    if (!v35 && !a6)
    {
      uint64_t v37 = [v10 mediaItemMetadataForProperty:@"utsEntityType"];
      v38 = (void *)v37;
      v39 = @"trailer";
      if (v37) {
        v39 = (__CFString *)v37;
      }
      v36 = v39;
    }
    v40 = v13;
    id v41 = v36;
    goto LABEL_41;
  }
  v42 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  v36 = v42;
  if (!v42) {
    goto LABEL_42;
  }
  if ([(__CFString *)v42 isEqualToString:*MEMORY[0x1E4FAA1E8]]) {
    goto LABEL_39;
  }
  if ([(__CFString *)v36 isEqualToString:*MEMORY[0x1E4FAA1F8]])
  {
    [v13 setObject:@"rental" forKey:@"entitlementReason"];
LABEL_39:
    id v41 = @"movie";
LABEL_40:
    v40 = v13;
LABEL_41:
    [v40 setObject:v41 forKey:@"contentType"];
    goto LABEL_42;
  }
  if ([(__CFString *)v36 isEqualToString:*MEMORY[0x1E4FAA200]])
  {
    id v41 = @"episode";
    goto LABEL_40;
  }
  v44 = VUIDefaultLogObject();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:](v44);
  }

LABEL_42:
  return v13;
}

+ (id)_convertToMs:(id)a3
{
  uint64_t v3 = 1000 * [a3 longValue];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v4 numberWithLong:v3];
}

+ (void)_metricsDataFromTVPMediaItem:(os_log_t)log contentPosition:isBackground:isAmbient:actionType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "unrecognized mediaItem TVPMediaItemMetadataMediaType for contentType", v1, 2u);
}

@end
@interface APLegacyTypeTranslator
+ ($F24F406B2B787EFB06265DBA3D28CBD5)adSizeForContainerSize:(id)a3 adData:(id)a4;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)errorAdSizeForContainerSize:(id)result;
+ (id)base64Decode:(id)a3;
+ (id)numericParameterArrayToDictionary:(id)a3;
+ (id)parameterArrayToDictionary:(id)a3;
+ (id)parameterArrayToDictionaryForMetadata:(id)a3;
+ (id)valueTranslated:(id)a3 forKey:(id)a4;
+ (int)AdDataUnfilledReasonCodeToASECode:(int)a3;
+ (int)connectionTypeToAPPBAdConnection:(int64_t)a3;
+ (int)placementTypeToCreativeType:(int64_t)a3;
+ (int)unfilledReasonCodeToASEStatusCode:(int64_t)a3;
+ (int64_t)AdDataUnfilledReasonCodeToUnfilledReasonCode:(int)a3;
+ (int64_t)AppStoreViewTemplateTypeToTemplateType:(int)a3;
+ (int64_t)RelevantIdentifierToRelevantIdentifierType:(int)a3;
+ (int64_t)clickActionTypeToTapActionType:(int)a3;
+ (int64_t)creativeTypeToPlacementType:(int)a3;
+ (int64_t)directionToGradientOrientation:(int)a3;
+ (unint64_t)adPrivacyMarkPositionToAdPrivacyMarkerPosition:(int)a3;
+ (void)_invalidElementError:(int64_t)a3;
@end

@implementation APLegacyTypeTranslator

+ (void)_invalidElementError:(int64_t)a3
{
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 134217984;
    int64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "LegacyTypeTranslator error - InvalidElement: %ld", (uint8_t *)&v5, 0xCu);
  }
}

+ (int)placementTypeToCreativeType:(int64_t)a3
{
  if (unint64_t)a3 < 8 && ((0x9Fu >> a3)) {
    return dword_1001D71C0[a3];
  }
  [a1 _invalidElementError:];
  return 0;
}

+ (int64_t)creativeTypeToPlacementType:(int)a3
{
  if a3 < 0xC && ((0xF35u >> a3)) {
    return qword_1001D71E0[a3];
  }
  [a1 _invalidElementError:a3];
  return -1;
}

+ (unint64_t)adPrivacyMarkPositionToAdPrivacyMarkerPosition:(int)a3
{
  uint64_t v6 = 0;
  long long v4 = xmmword_1001D71A0;
  long long v5 = xmmword_1001D71B0;
  if (a3 < 5) {
    return *((void *)&v4 + a3);
  }
  [a1 _invalidElementError:a3, v4, v5, v6];
  return 0;
}

+ (int64_t)clickActionTypeToTapActionType:(int)a3
{
  if a3 < 0xE && ((0x3D03u >> a3)) {
    return qword_1001D7240[a3];
  }
  [a1 _invalidElementError:a3];
  return 0;
}

+ (int64_t)RelevantIdentifierToRelevantIdentifierType:(int)a3
{
  if ((a3 - 15001) < 5) {
    return (a3 - 15001) + 15001;
  }
  [a1 _invalidElementError:a3, v3, v4];
  return 0;
}

+ (int)AdDataUnfilledReasonCodeToASECode:(int)a3
{
  if ((a3 - 201) < 5) {
    return dword_1001D72B0[a3 - 201];
  }
  [a1 _invalidElementError:a3];
  return 0;
}

+ (int64_t)AdDataUnfilledReasonCodeToUnfilledReasonCode:(int)a3
{
  uint64_t v5 = (a3 - 201);
  if (v5 < 5) {
    return v5 + 201;
  }
  [a1 _invalidElementError:a3, v3, v4];
  return 0;
}

+ (int64_t)AppStoreViewTemplateTypeToTemplateType:(int)a3
{
  uint64_t v3 = (a3 - 4781);
  if (v3 >= 0xA) {
    return 4780;
  }
  else {
    return v3 + 4781;
  }
}

+ (int)unfilledReasonCodeToASEStatusCode:(int64_t)a3
{
  if (a3 > 1009)
  {
    if (a3 > 1023)
    {
      if (a3 == 1024) {
        return 4;
      }
      if (a3 == 1029) {
        return 360;
      }
    }
    else
    {
      if ((unint64_t)(a3 - 1021) < 3) {
        return 9;
      }
      if (a3 == 1010) {
        return 3001;
      }
    }
LABEL_18:
    uint64_t v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134349056;
      int64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to determine ASE status code with unfilled reason code: %{public}ld.", (uint8_t *)&v6, 0xCu);
    }

    return 0;
  }
  else
  {
    int result = 3;
    switch(a3)
    {
      case 201:
        return result;
      case 202:
        int result = 12;
        break;
      case 203:
        int result = 13;
        break;
      case 204:
        int result = 14;
        break;
      case 205:
        int result = 15;
        break;
      default:
        if (a3 != 1000) {
          goto LABEL_18;
        }
        int result = 2;
        break;
    }
  }
  return result;
}

+ (int)connectionTypeToAPPBAdConnection:(int64_t)a3
{
  if ((unint64_t)a3 < 0xA) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (id)parameterArrayToDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 key:v17];
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [v10 value];

          if (v13)
          {
            v14 = [v10 value];
            v15 = [v10 key];
            [v4 setValue:v14 forKey:v15];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)numericParameterArrayToDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 key:v17];
        if (v11)
        {
          v12 = (void *)v11;
          unsigned int v13 = [v10 value];

          if (v13)
          {
            v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 value]);
            v15 = [v10 key];
            [v4 setValue:v14 forKey:v15];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)parameterArrayToDictionaryForMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 key:v19];
        if (v11)
        {
          v12 = (void *)v11;
          unsigned int v13 = [v10 value];

          if (v13)
          {
            v14 = [v10 value];
            v15 = [v10 key];
            v16 = +[APLegacyTypeTranslator valueTranslated:v14 forKey:v15];

            long long v17 = [v10 key];
            [v4 setValue:v16 forKey:v17];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)valueTranslated:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  v14[0] = @"adCampaignBlacklistedKeywords";
  v14[1] = @"adGloballyBlacklistedKeywords";
  v14[2] = @"adCampaignBlacklistedCategories";
  v14[3] = @"adGloballyBlacklistedCategories";
  id v6 = a4;
  id v7 = +[NSArray arrayWithObjects:v14 count:4];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v11 = +[NSCharacterSet characterSetWithCharactersInString:@"[]"];
    v10 = [v5 stringByTrimmingCharactersInSet:v11];

    id v9 = [v10 componentsSeparatedByString:@", "];
  }
  else
  {
    id v9 = v5;
    v10 = v9;
  }
  v12 = v9;

  return v12;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)errorAdSizeForContainerSize:(id)result
{
  double v3 = 50.0;
  result.var1 = v3;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)adSizeForContainerSize:(id)a3 adData:(id)a4
{
  id v4 = a4;
  id v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double var0 = a3.var0;
    __int16 v40 = 2048;
    double var1 = a3.var1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Attempting to find best fit for container (%.0f, %.0f)", buf, 0x16u);
  }

  id v6 = [v4 creativeSizes];
  id v7 = v6;
  if (v6 && [v6 count])
  {
    v31 = v7;
    id v32 = v4;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v34 objects:v50 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v35;
      double v12 = 0.0;
      double v13 = 0.0;
      double v14 = 0.0;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          double v17 = (double)[v16 width:v31, v32];
          double v18 = (double)(int)[v16 height];
          long long v19 = APLogForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            double var0 = v17;
            __int16 v40 = 2048;
            double var1 = v18;
            __int16 v42 = 2048;
            double v43 = v17 / v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Candidate size: (%.0f, %.0f) Aspect: %.2f", buf, 0x20u);
          }

          if (a3.var0 / v17 >= a3.var1 / v18) {
            double v20 = a3.var1 / v18;
          }
          else {
            double v20 = a3.var0 / v17;
          }
          double v21 = v20 * v17;
          double v22 = v20 * v18;
          v23 = APLogForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134219264;
            double var0 = v20 * v17;
            __int16 v40 = 2048;
            double var1 = v20 * v18;
            __int16 v42 = 2048;
            double v43 = v21 / v22;
            __int16 v44 = 2048;
            double v45 = v20;
            __int16 v46 = 2048;
            double v47 = a3.var0;
            __int16 v48 = 2048;
            double v49 = a3.var1;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Scaling candidate to (%.0f, %.0f) Aspect: %.2f, Scale factor: %.2f, to fit in container (%.0f, %.0f)", buf, 0x3Eu);
          }

          v25 = APLogForCategory();
          float v24 = v21 * v22;
          double v26 = v24;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double var0 = v26 / (a3.var1 * a3.var0);
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Scaled candidate fill ratio: %.2f", buf, 0xCu);
          }

          if (v12 < v26)
          {
            double v12 = v26;
            double v13 = v18;
            double v14 = v17;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v34 objects:v50 count:16];
      }
      while (v10);
    }
    else
    {
      double v13 = 0.0;
      double v14 = 0.0;
    }

    id v7 = v31;
    id v4 = v32;
  }
  else
  {
    double v13 = 0.0;
    double v14 = 0.0;
    if ([v4 hasUnfilledReasonCode])
    {
      +[APLegacyTypeTranslator errorAdSizeForContainerSize:](APLegacyTypeTranslator, "errorAdSizeForContainerSize:", a3.var0, a3.var1);
      double v14 = v27;
      double v13 = v28;
    }
  }

  double v29 = v14;
  double v30 = v13;
  result.double var1 = v30;
  result.double var0 = v29;
  return result;
}

+ (id)base64Decode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];
    if (v4)
    {
      id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
      goto LABEL_10;
    }
    id v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to decode Base64.", v8, 2u);
    }
  }
  else
  {
    id v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "We can't decode a nil string.", buf, 2u);
    }
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

+ (int64_t)directionToGradientOrientation:(int)a3
{
  if (a3 == 90) {
    return 20001;
  }
  else {
    return 20002;
  }
}

@end
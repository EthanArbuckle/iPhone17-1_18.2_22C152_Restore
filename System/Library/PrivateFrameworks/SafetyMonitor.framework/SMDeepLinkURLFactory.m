@interface SMDeepLinkURLFactory
+ (id)_generateCommonQueryItemsWithPayloadType:(int64_t)a3 groupID:(id)a4 data:(id)a5 sessionStartEntryType:(unint64_t)a6;
+ (id)createURLForGroupID:(id)a3 recipientHandles:(id)a4 payloadType:(int64_t)a5;
+ (id)createURLForRecipientHandle:(id)a3 payloadType:(int64_t)a4;
+ (id)createURLForSuggestionsWithRecipientHandle:(id)a3 appPayloadDataString:(id)a4 givenName:(id)a5 payloadType:(int64_t)a6 sessionStartEntryType:(unint64_t)a7;
+ (id)createURLToConversationForGroupID:(id)a3;
+ (id)createURLToConversationForRecipientHandle:(id)a3;
+ (id)createURLToDetailViewForGroupID:(id)a3 recipientHandles:(id)a4;
+ (id)createURLToDetailViewForRecipientHandle:(id)a3;
+ (int64_t)resolvePayloadTypeFromURL:(id)a3;
@end

@implementation SMDeepLinkURLFactory

+ (id)createURLForRecipientHandle:(id)a3 payloadType:(int64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263F08BA0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setScheme:@"sms-private"];
  [v8 setPath:@"open"];
  v9 = [a1 _generateCommonQueryItemsWithPayloadType:a4 groupID:0 data:0 sessionStartEntryType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"recipient" value:v7];

  v15[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v12 = [v9 arrayByAddingObjectsFromArray:v11];

  [v8 setQueryItems:v12];
  v13 = [v8 URL];

  return v13;
}

+ (id)createURLForSuggestionsWithRecipientHandle:(id)a3 appPayloadDataString:(id)a4 givenName:(id)a5 payloadType:(int64_t)a6 sessionStartEntryType:(unint64_t)a7
{
  v27[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  v13 = (objc_class *)MEMORY[0x263F08BA0];
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(v13);
  [v16 setScheme:@"sms-private"];
  [v16 setPath:@"open"];
  v17 = [a1 _generateCommonQueryItemsWithPayloadType:a6 groupID:0 data:v14 sessionStartEntryType:a7];

  v18 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"recipient" value:v15];
  v27[0] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  v20 = [v17 arrayByAddingObjectsFromArray:v19];

  if (v12)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"givenName" value:v12];
    v26 = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    uint64_t v23 = [v20 arrayByAddingObjectsFromArray:v22];

    v20 = (void *)v23;
  }
  [v16 setQueryItems:v20];
  v24 = [v16 URL];

  return v24;
}

+ (id)createURLToDetailViewForRecipientHandle:(id)a3
{
  if (a3)
  {
    v3 = [a1 createURLForRecipientHandle:a3 payloadType:1];
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

+ (id)createURLForGroupID:(id)a3 recipientHandles:(id)a4 payloadType:(int64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x263F08BA0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setScheme:@"sms-private"];
  [v9 setPath:@"open"];
  v10 = [a1 _generateCommonQueryItemsWithPayloadType:a5 groupID:v8 data:0 sessionStartEntryType:0];
  v11 = [MEMORY[0x263EFF980] arrayWithArray:v10];
  id v12 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"groupid" value:v8];

  [v11 addObject:v12];
  [v9 setQueryItems:v11];
  v13 = [v9 URL];

  return v13;
}

+ (id)createURLToDetailViewForGroupID:(id)a3 recipientHandles:(id)a4
{
  if (a3)
  {
    v4 = [a1 createURLForGroupID:a3 recipientHandles:a4 payloadType:1];
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", v7, 2u);
    }

    v4 = 0;
  }
  return v4;
}

+ (id)_generateCommonQueryItemsWithPayloadType:(int64_t)a3 groupID:(id)a4 data:(id)a5 sessionStartEntryType:(unint64_t)a6
{
  v38[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263EFF9A0];
  v37 = @"payloadType";
  id v12 = [NSNumber numberWithInteger:a3];
  v38[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
  id v14 = [v11 dictionaryWithDictionary:v13];

  if (v9) {
    [v14 setObject:v9 forKey:@"groupID"];
  }
  if (v10) {
    [v14 setObject:v10 forKey:@"data"];
  }
  if (a6)
  {
    id v15 = [NSNumber numberWithUnsignedInteger:a6];
    [v14 setObject:v15 forKey:@"sessionStartEntryType"];
  }
  id v31 = 0;
  id v16 = [MEMORY[0x263F08900] dataWithJSONObject:v14 options:8 error:&v31];
  id v17 = v31;
  if (v17)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "+[SMDeepLinkURLFactory _generateCommonQueryItemsWithPayloadType:groupID:data:sessionStartEntryType:]";
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_DEFAULT, "%s, createURLForDetailView, failed to create json payload with error: %@", buf, 0x16u);
    }
    v19 = 0;
  }
  else
  {
    v30 = v16;
    v18 = [[NSString alloc] initWithData:v16 encoding:4];
    int64_t v29 = a3;
    id v20 = objc_alloc(MEMORY[0x263EFF980]);
    v21 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"service" value:@"iMessage"];
    v22 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"appBundleID" value:@"com.apple.SafetyMonitorApp.SafetyMonitorMessages"];
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"launchApp" value:@"yes"];
    v24 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"appPayload" value:v18];
    v25 = objc_msgSend(v20, "initWithObjects:", v21, v22, v23, v24, 0);

    if ((unint64_t)(v29 - 2) < 3)
    {
      v26 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"allowRetargeting" value:@"true"];
      v32 = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      [v25 addObjectsFromArray:v27];
    }
    v19 = (void *)[v25 copy];

    id v16 = v30;
  }

  return v19;
}

+ (id)createURLToConversationForRecipientHandle:(id)a3
{
  if (a3)
  {
    v3 = [NSString stringWithFormat:@"%@%@", @"sms://open?recipient=", a3];
    v4 = [NSURL URLWithString:v3];
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", buf, 2u);
    }

    v4 = 0;
  }
  return v4;
}

+ (id)createURLToConversationForGroupID:(id)a3
{
  if (a3)
  {
    v3 = [NSString stringWithFormat:@"%@%@", @"sms://open?groupid=", a3];
    v4 = [NSURL URLWithString:v3];
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", buf, 2u);
    }

    v4 = 0;
  }
  return v4;
}

+ (int64_t)resolvePayloadTypeFromURL:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    int64_t v37 = 0;
    goto LABEL_45;
  }
  v5 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v4 resolvingAgainstBaseURL:0];
  v6 = v5;
  if (!v5)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      __int16 v35 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v55 = v34;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v35;
      _os_log_error_impl(&dword_25B6E0000, v8, OS_LOG_TYPE_ERROR, "%@,%@,missing url components", buf, 0x16u);
    }
    goto LABEL_41;
  }
  id v7 = [v5 queryItems];
  if (!v7)
  {
    id v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v55 = v40;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v41;
      _os_log_error_impl(&dword_25B6E0000, v36, OS_LOG_TYPE_ERROR, "%@,%@,missing queryItems", buf, 0x16u);
    }
    id v8 = 0;
LABEL_41:
    int64_t v37 = 0;
    goto LABEL_44;
  }
  v45 = v6;
  id v46 = v4;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v9)
  {
    int64_t v48 = 0;
    goto LABEL_43;
  }
  uint64_t v10 = v9;
  aSelector = a2;
  int64_t v48 = 0;
  uint64_t v11 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v51 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      id v14 = objc_msgSend(v13, "value", v42);
      if (!v14)
      {
        v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int64_t v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          id v31 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          v55 = v30;
          __int16 v56 = 2112;
          uint64_t v57 = (uint64_t)v31;
          _os_log_error_impl(&dword_25B6E0000, v24, OS_LOG_TYPE_ERROR, "%@,%@,queryItem missing value", buf, 0x16u);
        }
LABEL_29:

        continue;
      }
      id v15 = [v13 name];
      int v16 = [v15 isEqualToString:@"appPayload"];

      if (!v16) {
        goto LABEL_29;
      }
      id v17 = [v14 dataUsingEncoding:4];
      id v49 = 0;
      v18 = [MEMORY[0x263F08900] JSONObjectWithData:v17 options:0 error:&v49];
      id v19 = v49;
      if (v19 || !v18)
      {
        id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v25 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v25);
          uint64_t v26 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v55 = v43;
          __int16 v56 = 2112;
          uint64_t v57 = v26;
          v27 = (void *)v26;
          __int16 v58 = 2112;
          v59 = v14;
          _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "%@,%@, failure to decode json object %@", buf, 0x20u);
        }
        goto LABEL_25;
      }
      id v20 = [v18 objectForKey:@"payloadType"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v32);
          v42 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v55 = v44;
          __int16 v56 = 2112;
          uint64_t v57 = (uint64_t)v42;
          __int16 v58 = 2112;
          v59 = v20;
          _os_log_error_impl(&dword_25B6E0000, v28, OS_LOG_TYPE_ERROR, "%@,%@, failure to decode type %@", buf, 0x20u);
        }
LABEL_25:
        int v22 = 7;
        goto LABEL_26;
      }
      unint64_t v21 = [v20 unsignedIntegerValue];
      int v22 = v21 > 4;
      unint64_t v23 = v48;
      if (v21 <= 4) {
        unint64_t v23 = v21;
      }
      int64_t v48 = v23;
LABEL_26:

      if (!v22) {
        goto LABEL_29;
      }

      if (v22 != 7)
      {

        int64_t v37 = 0;
        v6 = v45;
        id v4 = v46;
        goto LABEL_44;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
  }
  while (v10);
LABEL_43:

  v6 = v45;
  id v4 = v46;
  int64_t v37 = v48;
LABEL_44:

LABEL_45:
  return v37;
}

@end
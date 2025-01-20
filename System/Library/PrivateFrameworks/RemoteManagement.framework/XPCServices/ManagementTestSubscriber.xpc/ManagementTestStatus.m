@interface ManagementTestStatus
+ (id)supportedStatusKeys;
- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation ManagementTestStatus

+ (id)supportedStatusKeys
{
  v5[0] = RMModelStatusItemTestArrayValue;
  v5[1] = RMModelStatusItemTestBooleanValue;
  v5[2] = RMModelStatusItemTestDictionaryValue;
  v5[3] = RMModelStatusItemTestErrorValue;
  v5[4] = RMModelStatusItemTestIntegerValue;
  v5[5] = RMModelStatusItemTestRealValue;
  v5[6] = RMModelStatusItemTestStringValue;
  v2 = +[NSArray arrayWithObjects:v5 count:7];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v41 = (void (**)(id, id, void))a5;
  v7 = +[RMLog managementTestStatus];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100005E28((uint64_t)v6, v7);
  }

  v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v50;
    uint64_t v13 = RMModelStatusItemTestArrayValue;
    uint64_t v47 = RMModelStatusItemTestBooleanValue;
    uint64_t v45 = RMModelStatusItemTestDictionaryValue;
    uint64_t v14 = RMModelStatusItemTestErrorValue;
    uint64_t v44 = RMModelStatusItemTestIntegerValue;
    uint64_t v43 = RMModelStatusItemTestRealValue;
    uint64_t v42 = RMModelStatusItemTestStringValue;
    uint64_t v48 = RMModelStatusItemTestErrorValue;
    do
    {
      v15 = 0;
      id v46 = v11;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v15);
        if ([v16 isEqualToString:v13])
        {
          v17 = +[NSUserDefaults standardUserDefaults];
          v18 = [v17 objectForKey:@"RMTestArrayErrorValue"];

          if ([v18 BOOLValue])
          {
            v19 = +[RMErrorUtilities createInternalError];
          }
          else
          {
            v54[0] = @"identifier";
            v54[1] = @"key1";
            CFStringRef v55 = @"1";
            v22 = +[NSDateFormatter rmmodel_sharedRFC3339DateFormatter];
            v23 = +[NSDate now];
            [v22 stringFromDate:v23];
            uint64_t v24 = v13;
            uint64_t v25 = v12;
            v26 = v8;
            id v27 = v9;
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

            CFStringRef v56 = v28;
            v29 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:v54 count:2];
            v57 = v29;
            CFStringRef v58 = (const __CFString *)&off_1000086D8;
            v19 = +[NSArray arrayWithObjects:&v57 count:2];

            id v9 = v27;
            v8 = v26;
            uint64_t v12 = v25;
            uint64_t v13 = v24;
            id v11 = v46;
          }

          [v8 setObject:v19 forKeyedSubscript:v16];
          uint64_t v14 = v48;
          goto LABEL_29;
        }
        if ([v16 isEqualToString:v47])
        {
          v20 = +[NSUserDefaults standardUserDefaults];
          v19 = [v20 objectForKey:@"RMTestBooleanValue"];

          if (!v19)
          {
            v33 = v8;
            v34 = &__kCFBooleanFalse;
            goto LABEL_28;
          }
          v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 BOOLValue]);
          [v8 setObject:v21 forKeyedSubscript:v16];

LABEL_29:
          goto LABEL_30;
        }
        if ([v16 isEqualToString:v45])
        {
          CFStringRef v55 = @"key1";
          v30 = +[NSDateFormatter rmmodel_sharedRFC3339DateFormatter];
          v31 = +[NSDate now];
          v32 = [v30 stringFromDate:v31];

          CFStringRef v56 = @"key2";
          v57 = v32;
          CFStringRef v58 = @"value";
          v19 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v55 count:2];

          uint64_t v14 = v48;
          goto LABEL_27;
        }
        if ([v16 isEqualToString:v14])
        {
          v19 = +[RMErrorUtilities createInvalidStatusValueErrorWithKeyPath:v14];
          goto LABEL_27;
        }
        if ([v16 isEqualToString:v44])
        {
          v35 = +[NSDate now];
          [v35 timeIntervalSince1970];
          uint64_t v37 = +[NSNumber numberWithUnsignedInteger:(unint64_t)v36];
LABEL_25:
          v19 = (void *)v37;
          goto LABEL_26;
        }
        if ([v16 isEqualToString:v43])
        {
          v35 = +[NSDate now];
          [v35 timeIntervalSince1970];
          uint64_t v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          goto LABEL_25;
        }
        if ([v16 isEqualToString:v42])
        {
          v35 = +[NSDateFormatter rmmodel_sharedRFC3339DateFormatter];
          v38 = +[NSDate now];
          v19 = [v35 stringFromDate:v38];

          uint64_t v14 = v48;
LABEL_26:

LABEL_27:
          v33 = v8;
          v34 = v19;
LABEL_28:
          [v33 setObject:v34 forKeyedSubscript:v16];
          goto LABEL_29;
        }
LABEL_30:
        v15 = (char *)v15 + 1;
      }
      while (v11 != v15);
      id v39 = [v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
      id v11 = v39;
    }
    while (v39);
  }

  id v40 = [v8 copy];
  v41[2](v41, v40, 0);
}

@end
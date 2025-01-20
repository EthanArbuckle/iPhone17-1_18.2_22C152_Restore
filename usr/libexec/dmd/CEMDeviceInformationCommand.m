@interface CEMDeviceInformationCommand
+ (id)deviceInfoDeviceChannelKeys;
+ (id)deviceInfoKeyFromDMFKey:(id)a3;
+ (id)deviceInfoRMDKeys;
+ (id)deviceInfoSupervisedKeys;
+ (id)deviceInfoUserChannelKeys;
+ (id)dmfKeyFromDeviceInfoKey:(id)a3;
- (BOOL)dmf_requestExecutesWithoutReturning;
- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4;
- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
- (id)filterQueryForScope;
- (void)addRMDSpecificResultsToDictionary:(id)a3 errors:(id)a4;
@end

@implementation CEMDeviceInformationCommand

+ (id)deviceInfoSupervisedKeys
{
  if (qword_1000FB8D0 != -1) {
    dispatch_once(&qword_1000FB8D0, &stru_1000C9A88);
  }
  v2 = (void *)qword_1000FB8D8;

  return v2;
}

+ (id)deviceInfoDeviceChannelKeys
{
  if (qword_1000FB8E0 != -1) {
    dispatch_once(&qword_1000FB8E0, &stru_1000C9AA8);
  }
  v2 = (void *)qword_1000FB8E8;

  return v2;
}

+ (id)deviceInfoUserChannelKeys
{
  if (qword_1000FB8F0 != -1) {
    dispatch_once(&qword_1000FB8F0, &stru_1000C9AC8);
  }
  v2 = (void *)qword_1000FB8F8;

  return v2;
}

+ (id)deviceInfoRMDKeys
{
  if (qword_1000FB900 != -1) {
    dispatch_once(&qword_1000FB900, &stru_1000C9AE8);
  }
  v2 = (void *)qword_1000FB908;

  return v2;
}

+ (id)dmfKeyFromDeviceInfoKey:(id)a3
{
  uint64_t v3 = qword_1000FB910;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000FB910, &stru_1000C9B08);
  }
  v5 = [(id)qword_1000FB918 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)deviceInfoKeyFromDMFKey:(id)a3
{
  uint64_t v3 = qword_1000FB920;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000FB920, &stru_1000C9B28);
  }
  v5 = [(id)qword_1000FB928 objectForKeyedSubscript:v4];

  return v5;
}

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  id v4 = [(CEMDeviceInformationCommand *)self filterQueryForScope];
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[CEMDeviceInformationCommand dmfKeyFromDeviceInfoKey:](CEMDeviceInformationCommand, "dmfKeyFromDeviceInfoKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = objc_opt_new();
  [v12 setPropertyKeys:v5];

  return v12;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 0;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v4;
    id v5 = v4;
    id v6 = [v5 valuesByPropertyKey];
    id v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);

    id v8 = [v5 errorsByPropertyKey];
    uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v49 = v5;
    v10 = [v5 valuesByPropertyKey];
    id v11 = [v10 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v59;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          long long v16 = +[CEMDeviceInformationCommand deviceInfoKeyFromDMFKey:v15];
          long long v17 = [v49 valuesByPropertyKey];
          v18 = [v17 objectForKeyedSubscript:v15];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFStringRef v68 = @"Code";
            CFStringRef v69 = @"Not Supported";
            v19 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
            [v9 setObject:v19 forKeyedSubscript:v16];
          }
          else
          {
            [v7 setObject:v18 forKeyedSubscript:v16];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v12);
    }
    v45 = v7;

    v20 = [(CEMDeviceInformationCommand *)self payloadQueries];
    v21 = +[NSMutableSet setWithArray:v20];

    v22 = [(CEMDeviceInformationCommand *)self filterQueryForScope];
    [v21 minusSet:v22];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v23 = v21;
    id v24 = [v23 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v55;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v55 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
          CFStringRef v65 = @"Code";
          CFStringRef v66 = @"Not Allowed";
          v29 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          [v9 setObject:v29 forKeyedSubscript:v28];
        }
        id v25 = [v23 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v25);
    }
    id v43 = v23;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = [v49 errorsByPropertyKey];
    id v30 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v51;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v51 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v50 + 1) + 8 * (void)k);
          v35 = +[CEMDeviceInformationCommand deviceInfoKeyFromDMFKey:](CEMDeviceInformationCommand, "deviceInfoKeyFromDMFKey:", v34, v43);
          v36 = [v49 errorsByPropertyKey];
          v37 = [v36 objectForKeyedSubscript:v34];

          v62[1] = @"ErrorChain";
          v63[0] = @"Failed";
          v62[0] = @"Code";
          v38 = DMDErrorChainFromError(v37);
          v63[1] = v38;
          v39 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
          [v9 setObject:v39 forKeyedSubscript:v35];
        }
        id v31 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
      }
      while (v31);
    }

    [(CEMDeviceInformationCommand *)self addRMDSpecificResultsToDictionary:v45 errors:v9];
    v40 = +[NSMutableDictionary dictionaryWithCapacity:2];
    [v40 setObject:v45 forKeyedSubscript:@"QueryResponses"];
    id v4 = v46;
    if ([v9 count]) {
      [v40 setObject:v9 forKeyedSubscript:@"ErrorResponses"];
    }
    id v41 = [v40 copy:v43];
  }
  else
  {
    id v41 = 0;
  }

  return v41;
}

- (id)filterQueryForScope
{
  v2 = [(CEMDeviceInformationCommand *)self payloadQueries];
  uint64_t v3 = +[NSMutableSet setWithArray:v2];

  id v4 = +[CEMDeviceInformationCommand deviceInfoDeviceChannelKeys];
  [v3 intersectSet:v4];

  id v5 = +[CEMDeviceInformationCommand deviceInfoRMDKeys];
  [v3 minusSet:v5];

  return v3;
}

- (void)addRMDSpecificResultsToDictionary:(id)a3 errors:(id)a4
{
  id v5 = a4;
  id v6 = [(CEMDeviceInformationCommand *)self payloadQueries];
  id v7 = +[NSMutableSet setWithArray:v6];

  id v8 = +[CEMDeviceInformationCommand deviceInfoRMDKeys];
  [v7 intersectSet:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v13);
        CFStringRef v20 = @"Code";
        CFStringRef v21 = @"Not Supported";
        uint64_t v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1, (void)v16);
        [v5 setObject:v15 forKeyedSubscript:v14];

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }
}

@end
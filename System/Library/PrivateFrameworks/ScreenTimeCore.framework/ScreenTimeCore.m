id sub_100003ED0(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *k;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  unsigned char v48[128];
  unsigned char v49[128];
  unsigned char v50[128];
  uint64_t vars8;

  v1 = a1;
  v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];

  v4 = v3;
  [v4 UTF8String];
  if (os_variant_has_internal_ui())
  {
    v5 = v1;
  }
  else
  {
    v34 = v4;
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v6 = v1;
    v7 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(void *)v45;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          v13 = +[NSString stringWithFormat:@"key-%lu", (char *)i + v9];
          v14 = [v6 objectForKeyedSubscript:v12];
          [v5 setObject:v14 forKeyedSubscript:v13];
        }
        v8 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
        v9 += (uint64_t)i;
      }
      while (v8);
    }

    v4 = v34;
  }
  if (byte_100015990 || (unint64_t)[v5 count] <= 0xA)
  {
    v15 = v5;
  }
  else
  {
    v35 = v4;
    v17 = [v5 keysSortedByValueUsingComparator:&stru_100010398];
    v15 = +[NSMutableDictionary dictionaryWithCapacity:11];
    v18 = objc_msgSend(v17, "subarrayWithRange:", 0, 10);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = [v18 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v19)
    {
      v20 = v19;
      v21 = *(void *)v41;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
          v24 = [v5 objectForKeyedSubscript:v23];
          [v15 setObject:v24 forKeyedSubscript:v23];
        }
        v20 = [v18 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v20);
    }
    v25 = objc_msgSend(v17, "subarrayWithRange:", 10, (char *)objc_msgSend(v17, "count") - 10);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(void *)v37;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v25);
          }
          v31 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * (void)k)];
          v28 += (uint64_t)[v31 unsignedIntegerValue];
        }
        v27 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v27);
    }
    else
    {
      v28 = 0;
    }
    v32 = +[NSNumber numberWithUnsignedLong:v28];
    v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"{%lu additional items}", (char *)[v5 count] - 10);
    [v15 setObject:v32 forKeyedSubscript:v33];

    v4 = v35;
  }

  return v15;
}

int64_t sub_1000042EC(id a1, NSNumber *a2, NSNumber *a3)
{
  return -(uint64_t)[(NSNumber *)a2 compare:a3];
}

id sub_10000430C()
{
  v5[0] = @"historical";
  v0 = objc_opt_new();
  v6[0] = v0;
  v5[1] = @"last7Days";
  v1 = objc_opt_new();
  v6[1] = v1;
  v5[2] = @"today";
  v2 = objc_opt_new();
  v6[2] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

id sub_1000043FC(void *a1)
{
  v10[0] = @"historical";
  id v1 = a1;
  v2 = [v1 objectForKeyedSubscript:@"historical"];
  v3 = sub_100003ED0(v2);
  v11[0] = v3;
  v10[1] = @"last7Days";
  v4 = objc_msgSend(v1, "objectForKeyedSubscript:");
  v5 = sub_100003ED0(v4);
  v11[1] = v5;
  v10[2] = @"today";
  v6 = objc_msgSend(v1, "objectForKeyedSubscript:");

  v7 = sub_100003ED0(v6);
  v11[2] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

void sub_100004544(void *a1, __CFString *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v33 = a1;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = @"<no-identifier>";
  if (a2) {
    v14 = a2;
  }
  v15 = v14;
  id v16 = a4;
  v17 = [v13 objectForKeyedSubscript:@"historical"];
  v18 = [v17 objectForKeyedSubscript:v15];
  v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 intValue] + objc_msgSend(v18, "intValue"));
  v20 = [v13 objectForKeyedSubscript:@"historical"];
  [v20 setObject:v19 forKeyedSubscript:v15];

  v21 = [v33 startDate];
  id v22 = [v21 compare:v16];

  if (v22 == (id)1)
  {
    v23 = [v13 objectForKeyedSubscript:@"last7Days"];
    v24 = [v23 objectForKeyedSubscript:v15];
    v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 intValue] + objc_msgSend(v24, "intValue"));
    v26 = [v13 objectForKeyedSubscript:@"last7Days"];
    [v26 setObject:v25 forKeyedSubscript:v15];

    v27 = [v33 startDate];
    id v28 = [v27 compare:v12];

    if (v28 == (id)1)
    {
      v29 = [v13 objectForKeyedSubscript:@"today"];
      v30 = [v29 objectForKeyedSubscript:v15];
      v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 intValue] + objc_msgSend(v30, "intValue"));
      v32 = [v13 objectForKeyedSubscript:@"today"];
      [v32 setObject:v31 forKeyedSubscript:v15];
    }
  }
}

id sub_1000047EC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v45 = objc_alloc_init((Class)NSMutableDictionary);
  v59 = sub_10000430C();
  v54 = sub_10000430C();
  v60 = sub_10000430C();
  v49 = sub_10000430C();
  v55 = sub_10000430C();
  v53 = sub_10000430C();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v46 = v5;
  id obj = [v5 blocks];
  id v50 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v74;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v74 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v8;
        v9 = *(void **)(*((void *)&v73 + 1) + 8 * v8);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        objc_msgSend(v9, "categories", v45);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        id v57 = [v52 countByEnumeratingWithState:&v69 objects:v79 count:16];
        if (v57)
        {
          uint64_t v56 = *(void *)v70;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v70 != v56) {
                objc_enumerationMutation(v52);
              }
              uint64_t v58 = v10;
              id v11 = *(void **)(*((void *)&v69 + 1) + 8 * v10);
              id v12 = [v11 identifier];
              id v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 totalTimeInSeconds]);
              sub_100004544(v9, v12, v13, v6, v7, v54);

              long long v67 = 0u;
              long long v68 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              v14 = [v11 timedItems];
              id v15 = [v14 countByEnumeratingWithState:&v65 objects:v78 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v66;
                do
                {
                  for (i = 0; i != v16; i = (char *)i + 1)
                  {
                    if (*(void *)v66 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    v19 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                    v20 = [v19 bundleIdentifier];

                    if (v20)
                    {
                      v21 = [v19 bundleIdentifier];
                      id v22 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v19 totalTimeInSeconds]);
                      sub_100004544(v9, v21, v22, v6, v7, v59);
                    }
                    v23 = [v19 domain];

                    if (v23)
                    {
                      v24 = [v19 domain];
                      v25 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v19 totalTimeInSeconds]);
                      sub_100004544(v9, v24, v25, v6, v7, v60);
                    }
                  }
                  id v16 = [v14 countByEnumeratingWithState:&v65 objects:v78 count:16];
                }
                while (v16);
              }

              uint64_t v10 = v58 + 1;
            }
            while ((id)(v58 + 1) != v57);
            id v57 = [v52 countByEnumeratingWithState:&v69 objects:v79 count:16];
          }
          while (v57);
        }

        v26 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v9 screenTimeInSeconds]);
        sub_100004544(v9, @"usage", v26, v6, v7, v49);

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v27 = [v9 countedItems];
        id v28 = [v27 countByEnumeratingWithState:&v61 objects:v77 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v62;
          do
          {
            for (j = 0; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v62 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
              id v33 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v32 numberOfPickups]);
              sub_100004544(v9, @"usage", v33, v6, v7, v55);

              v34 = [v32 bundleIdentifier];
              v35 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v32 numberOfNotifications]);
              sub_100004544(v9, v34, v35, v6, v7, v53);
            }
            id v29 = [v27 countByEnumeratingWithState:&v61 objects:v77 count:16];
          }
          while (v29);
        }

        uint64_t v8 = v51 + 1;
      }
      while ((id)(v51 + 1) != v50);
      id v50 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v50);
  }

  v36 = sub_1000043FC(v59);

  v37 = sub_1000043FC(v54);

  v38 = sub_1000043FC(v60);

  v39 = sub_1000043FC(v53);

  uint64_t v40 = [v46 lastEventDate];
  v41 = (void *)v40;
  if (v40) {
    CFStringRef v42 = (const __CFString *)v40;
  }
  else {
    CFStringRef v42 = @"none";
  }
  v43 = v45;
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v42, @"lastUsageEventDate", v45);

  [v43 setObject:v36 forKeyedSubscript:@"appUsages"];
  [v43 setObject:v37 forKeyedSubscript:@"categoryUsages"];
  [v43 setObject:v38 forKeyedSubscript:@"webusages"];
  [v43 setObject:v49 forKeyedSubscript:@"screenUsage"];
  [v43 setObject:v55 forKeyedSubscript:@"deviceUnlocks"];
  [v43 setObject:v39 forKeyedSubscript:@"appNotifications"];

  return v43;
}

void sub_100005104(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _schemaData];
  v13[0] = @"Type";
  v13[1] = @"users";
  v14[0] = @"Database";
  v14[1] = v1;
  v2 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  if (sub_10000A860() == 2)
  {
    id v12 = 0;
    v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:1 error:&v12];
    id v4 = v12;
    id v5 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    sub_10000A740(__stdoutp, @"%@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  else
  {
    sub_10000ABDC(v2);
  }
}

void sub_100006558(id a1)
{
  qword_1000159A8 = objc_opt_new();
  _objc_release_x1();
}

BOOL sub_1000065C8(id a1, NSString *a2, NSString *a3, NSString *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  uint64_t v8 = a4;
  if ([(NSString *)v7 isEqualToString:@"format"])
  {
    if ([(NSString *)v8 isEqualToString:@"JSON"])
    {
      uint64_t v9 = 2;
    }
    else if ([(NSString *)v8 isEqualToString:@"plist"])
    {
      uint64_t v9 = 1;
    }
    else
    {
      if (![(NSString *)v8 isEqualToString:@"text"]) {
        sub_10000AA50(64, @"invalid option for format", v10, v11, v12, v13, v14, v15, v17);
      }
      uint64_t v9 = 0;
    }
    sub_10000A810(v9);
  }

  return 1;
}

id start()
{
  id v1 = +[CLIProgram sharedProgram];
  v2 = +[screentimediagnose shared];
  [v1 setDelegate:v2];

  id v3 = [v1 main];
  return v3;
}

id sub_100006714(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = +[STCoreUser fetchRequestMatchingAppleID:v1];
  id v67 = 0;
  id v4 = [v3 execute:&v67];
  id v5 = v67;
  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v49 = v3;
    id v50 = v1;
    uint64_t v48 = v4;
    uint64_t v7 = [v4 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 userDeviceStates];
    v53 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v47 = v7;
    id obj = [v7 userDeviceStates];
    id v55 = [obj countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v55)
    {
      uint64_t v54 = *(void *)v64;
      do
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v64 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v11 = [v10 device];
          uint64_t v12 = v11;
          if (v11)
          {
            v72[0] = @"deviceName";
            [v11 name];
            v14 = uint64_t v13 = v12;
            v73[0] = v14;
            v72[1] = @"screenTimeSettings";
            CFStringRef v70 = @"isScreenTimeEnabled";
            uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 screenTimeEnabled]);
            long long v71 = v15;
            id v16 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
            v73[1] = v16;
            v72[2] = @"identifier";
            id v57 = v13;
            uint64_t v17 = [v13 identifier];
            v73[2] = v17;
            v72[3] = @"lastFamilyCheckinDate";
            uint64_t v18 = [v10 lastFamilyCheckinDate];
            v19 = (void *)v18;
            CFStringRef v20 = @"none";
            if (v18) {
              CFStringRef v20 = (const __CFString *)v18;
            }
            v73[3] = v20;
            v21 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:4];
            id v22 = [v21 mutableCopy];

            v23 = +[NSBundle mainBundle];
            v24 = [v23 bundleIdentifier];

            id v25 = v24;
            [v25 UTF8String];
            if ((os_variant_has_internal_ui() & 1) == 0) {
              [v22 setObject:off_100015860 forKeyedSubscript:@"deviceName"];
            }
            v26 = +[NSCalendar currentCalendar];
            v27 = +[NSDate date];
            id v28 = [v26 dateByAddingUnit:16 value:-6 toDate:v27 options:0];
            id v29 = [v26 startOfDayForDate:v28];

            uint64_t v30 = +[NSDate date];
            v31 = [v26 startOfDayForDate:v30];

            memset(v62, 0, sizeof(v62));
            uint64_t v12 = v57;
            v32 = [v57 usages];
            uint64_t v56 = v29;
            if ([v32 countByEnumeratingWithState:v62 objects:v69 count:16])
            {
              uint64_t v33 = sub_1000047EC(**((void ***)&v62[0] + 1), v29, v31);

              id v22 = (id)v33;
            }

            v34 = [v10 installedApps];
            v35 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v34 count]);

            if (byte_100015990)
            {
              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              v36 = [v10 installedApps];
              id v37 = [v36 countByEnumeratingWithState:&v58 objects:v68 count:16];
              if (v37)
              {
                id v38 = v37;
                id v51 = v25;
                uint64_t v39 = *(void *)v59;
                do
                {
                  for (j = 0; j != v38; j = (char *)j + 1)
                  {
                    if (*(void *)v59 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    v41 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) bundleIdentifier];
                    [v35 addObject:v41];
                  }
                  id v38 = [v36 countByEnumeratingWithState:&v58 objects:v68 count:16];
                }
                while (v38);
                uint64_t v12 = v57;
                id v25 = v51;
              }
            }
            else
            {
              v36 = [v10 installedApps];
              CFStringRef v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu apps", [v36 count]);
              [v35 addObject:v42];
            }
            id v43 = [v35 copy];
            [v22 setObject:v43 forKeyedSubscript:@"apps"];

            id v44 = [v22 copy];
            id v45 = [v12 identifier];
            [v53 setObject:v44 forKeyedSubscript:v45];
          }
        }
        id v55 = [obj countByEnumeratingWithState:&v63 objects:v74 count:16];
      }
      while (v55);
    }

    id v2 = v53;
    uint64_t v6 = v2;
    id v3 = v49;
    id v1 = v50;
    id v4 = v48;
    id v5 = 0;
  }

  return v6;
}

id sub_10000727C(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSMutableString stringWithCapacity:a2];
  for (i = +[NSMutableString stringWithCapacity:a2 + 1];
    [v4 appendString:@"\t"];
  [i appendFormat:@"\n%@", v4];
  uint64_t v6 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:i];
  uint64_t v7 = +[NSString stringWithFormat:@"%@%@", v4, v6];

  return v7;
}

void sub_100007380()
{
  v0 = +[CLIProgram sharedProgram];
  id v12 = [v0 programName];

  id v1 = +[NSBundle mainBundle];
  id v2 = [v1 infoDictionary];
  id v3 = [v2 objectForKeyedSubscript:_kCFBundleShortVersionStringKey];
  id v4 = [v2 objectForKeyedSubscript:kCFBundleVersionKey];
  if ([v3 length])
  {
    id v5 = [@" " stringByAppendingString:v3];
  }
  else
  {
    id v5 = &stru_100011060;
  }

  if ([v4 length]) {
    sub_10000A740(__stdoutp, @"%@%@ (%@)\n", v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
  else {
    sub_10000A740(__stdoutp, @"%@%@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
}

void sub_1000074CC(void *a1)
{
  id v1 = a1;
  id v2 = [(id)qword_1000159B0 objectForKeyedSubscript:v1];
  uint64_t v3 = [(id)qword_1000159B8 objectForKey:v2];
  uint64_t v10 = (void *)v3;
  if (v1 && !v2)
  {
    id v67 = (void *)v3;

    sub_10000A740(__stdoutp, @"\n", v11, v12, v13, v14, v15, v16, v63);
    id v68 = 0;
LABEL_8:
    sub_100007834((void *)qword_1000159C0);
    sub_10000A740(__stdoutp, @"Commands:\n", v22, v23, v24, v25, v26, v27, v64);
    id v28 = (void *)qword_1000159C8;
    id v29 = +[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:1];
    long long v74 = v29;
    uint64_t v30 = +[NSArray arrayWithObjects:&v74 count:1];
    v31 = [v28 sortedArrayUsingDescriptors:v30];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v32 = v31;
    id v33 = [v32 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v70;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v70 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          id v38 = __stdoutp;
          uint64_t v39 = [v37 nameSummaryString];
          long long v65 = [v37 shortEnglishDescription];
          sub_10000A740(v38, @"\t%@\n\t%@\n\n", v40, v41, v42, v43, v44, v45, (uint64_t)v39);
        }
        id v34 = [v32 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v34);
    }

    uint64_t v10 = v67;
    id v1 = v68;
    goto LABEL_21;
  }
  sub_10000A740(__stdoutp, @"\n", v4, v5, v6, v7, v8, v9, v63);
  if (!v2)
  {
    id v67 = v10;
    id v68 = v1;
    goto LABEL_8;
  }
  uint64_t v17 = [v2 nameSummaryString];
  uint64_t v18 = [v2 usageLine];

  if (v18)
  {
    v19 = [v2 name];
    CFStringRef v20 = [v2 usageLine];
    v21 = +[NSString stringWithFormat:@"Usage: %@ %@\n\t", v19, v20];
  }
  else
  {
    v21 = &stru_100011060;
  }
  v46 = __stdoutp;
  long long v66 = [v2 shortEnglishDescription];
  sub_10000A740(v46, @"%@\n\t%@%@\n\n", v47, v48, v49, v50, v51, v52, (uint64_t)v17);

  v53 = [v2 longEnglishDescription];
  uint64_t v54 = v53;
  if (v53)
  {
    id v55 = __stdoutp;
    uint64_t v56 = sub_10000727C(v53, 1);
    sub_10000A740(v55, @"%@\n\n", v57, v58, v59, v60, v61, v62, (uint64_t)v56);
  }
  sub_100007834((void *)qword_1000159C0);
  if (v10) {
    sub_100007834(v10);
  }
LABEL_21:
}

void sub_100007834(void *a1)
{
  id v1 = a1;
  if ([v1[1] count])
  {
    if ((id *)qword_1000159C0 == v1) {
      uint64_t v8 = @"Global options:\n";
    }
    else {
      uint64_t v8 = @"Command options:\n";
    }
    sub_10000A740(__stdoutp, v8, v2, v3, v4, v5, v6, v7, v37);
    uint64_t v39 = v1;
    id v9 = v1[1];
    uint64_t v10 = +[NSSortDescriptor sortDescriptorWithKey:@"canonicalName" ascending:1];
    uint64_t v45 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v45 count:1];
    uint64_t v12 = [v9 sortedArrayUsingDescriptors:v11];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v41;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v19 = __stdoutp;
          CFStringRef v20 = [v18 nameSummaryString];
          id v38 = [v18 shortEnglishDescription];
          sub_10000A740(v19, @"\t%@\n\t%@\n\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

          uint64_t v27 = [v18 longEnglishDescription];
          id v28 = v27;
          if (v27)
          {
            id v29 = __stdoutp;
            uint64_t v30 = sub_10000727C(v27, 1);
            sub_10000A740(v29, @"%@\n\n", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v15);
    }

    id v1 = v39;
  }
}

id *sub_100008A18(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)CLIOptionParser;
    uint64_t v7 = (id *)objc_msgSendSuper2(&v17, "init");
    a1 = v7;
    if (v7)
    {
      [v7 setArguments:v5];
      uint64_t v8 = [a1 nextArgument];
      id v9 = a1[4];
      a1[4] = (id)v8;

      if (v6)
      {
        objc_storeStrong(a1 + 5, a3);
        uint64_t v10 = [(id)qword_1000159B8 objectForKey:v6];
        id v11 = v10;
        if (v10) {
          id v12 = v10;
        }
        else {
          id v12 = (id)objc_opt_new();
        }
        id v14 = a1[2];
        a1[2] = v12;
      }
      else
      {
        if (qword_1000159D0 != -1) {
          dispatch_once(&qword_1000159D0, &stru_1000104D0);
        }
        id v13 = (id)qword_1000159C0;
        id v11 = a1[2];
        a1[2] = v13;
      }

      if (!a1[2])
      {
        uint64_t v16 = +[NSAssertionHandler currentHandler];
        [v16 handleFailureInMethod:"initWithArguments:command:" object:a1 file:@"CLIOptionParsing.m" lineNumber:422 description:@"The commands or global options haven't been registered yet!"];
      }
    }
  }

  return a1;
}

void sub_100008B98(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_10000A8A4(@"Unknown option '%@'", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [a1 command];
    sub_10000AAC0(v11);
  }
}

void sub_100008BF8(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_10000A8A4(@"Option '%@' missing an argument", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [a1 command];
    sub_10000AAC0(v11);
  }
}

uint64_t sub_100008EE0(uint64_t result)
{
  if (result)
  {
    --qword_100015998;
    --*(void *)(result + 8);
  }
  return result;
}

void sub_100008F08(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 16), "objectForKeyedSubscript:");
  id v4 = [v3 parameterCount];
  if (!v3)
  {
    sub_100008B98(*(void **)(a1 + 32), v11);
    [(CLIOptionParser *)v9 dictionaryWithOptionsAndValues];
    return;
  }
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [*(id *)(a1 + 32) nextArgument];
  if (!v5)
  {
    sub_100008BF8(*(void **)(a1 + 32), *(void **)(a1 + 40));
LABEL_5:
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [v3 shortName];
  uint64_t v8 = [v3 longName];
  (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v5);
}

uint64_t sub_1000090BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8) {
    SEL v10 = v8;
  }
  else {
    SEL v10 = v7;
  }
  id v11 = v10;
  id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  if (![*(id *)(a1 + 40) preserveMultipleArguments])
  {
    if (v9)
    {
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v11];
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (!v9)
  {
LABEL_10:
    uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v12 unsignedIntegerValue] + 1);
LABEL_12:
    id v14 = (void *)v13;
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v11];

    goto LABEL_13;
  }
  if (!v12)
  {
    uint64_t v13 = +[NSMutableArray arrayWithObject:v9];
    goto LABEL_12;
  }
  [v12 addObject:v9];
LABEL_13:

  return 1;
}

BOOL sub_1000092D8(id a1, NSString *a2, NSString *a3, NSString *a4)
{
  return 1;
}

void sub_100009380(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_1000159C0;
  qword_1000159C0 = v1;

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)qword_1000159C8;
  qword_1000159C8 = v3;

  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)qword_1000159B0;
  qword_1000159B0 = v5;

  qword_1000159B8 = +[NSMapTable strongToStrongObjectsMapTable];
  _objc_release_x1();
}

void sub_1000094D0(id a1)
{
  qword_1000159E0 = objc_opt_new();
  _objc_release_x1();
}

CLIProgram *sub_10000950C()
{
  self;
  return +[CLIProgram sharedProgram];
}

void sub_10000962C(uint64_t a1, void *a2)
{
  id v12 = a2;
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v12 lastObject];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    id v2 = v12;
  }
  id v9 = v2;
  if (!v2) {
LABEL_14:
  }
    sub_10000AA50(64, @"Unrecognized format, valid formats are: text, JSON, plist", v3, v4, v5, v6, v7, v8, v11);
  uint64_t v10 = (uint64_t)[v2 caseInsensitiveCompare:@"text"];
  if (!v10) {
    goto LABEL_11;
  }
  if ([v9 caseInsensitiveCompare:@"plist"])
  {
    if (![v9 caseInsensitiveCompare:@"json"])
    {
      uint64_t v10 = 2;
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v10 = 1;
LABEL_11:
  sub_10000A810(v10);
}

void sub_100009974(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = objc_opt_new();
    [v1 setName:@"help"];
    [v1 setAliases:&off_100011910];
    [v1 setShortEnglishDescription:@"Show help for a command or show all commands."];
    [v1 setExecutionBlock:&stru_100010530];
    [v1 register];
    id v2 = (id)objc_opt_new();

    [v2 setName:@"version"];
    [v2 setShortEnglishDescription:@"Show this program's version."];
    [v2 setExecutionBlock:&stru_100010550];
    [v2 register];
  }
}

BOOL sub_100009A50(id a1, CLIOptionParser *a2)
{
  id v2 = a2;
  sub_100007380();
  uint64_t v3 = [(CLIOptionParser *)v2 nextArgument];

  sub_1000074CC(v3);
  return 1;
}

BOOL sub_100009A9C(id a1, CLIOptionParser *a2)
{
  return 1;
}

void sub_100009EC4(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
  }
}

void sub_10000A048(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_10000A4B0(unint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && !*(void *)(a1 + 8)) {
    a1 = sub_10000A514(v5, v6);
  }

  return a1;
}

unint64_t sub_10000A514(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqual:v4])
  {
    unint64_t v5 = 0;
  }
  else
  {
    id v6 = [v3 length];
    if ((unint64_t)v6 >= 0x20) {
      unint64_t v7 = 32;
    }
    else {
      unint64_t v7 = (unint64_t)v6;
    }
    id v8 = [v4 length];
    if ((unint64_t)v8 >= 0x20) {
      unint64_t v9 = 32;
    }
    else {
      unint64_t v9 = (unint64_t)v8;
    }
    if (v7 && v9)
    {
      uint64_t v30 = &v28;
      __chkstk_darwin();
      uint64_t v11 = (char *)&v28 - v10;
      bzero((char *)&v28 - v10, v12);
      uint64_t v13 = 0;
      uint64_t v14 = v9;
      id v15 = v11;
      do
      {
        void *v15 = v13++;
        v15 += v9 + 1;
      }
      while (v7 + 1 != v13);
      uint64_t v16 = 0;
      do
      {
        *(void *)&v11[8 * v16] = v16;
        ++v16;
      }
      while (v9 + 1 != v16);
      id v28 = v11;
      unint64_t v29 = v9 + 1;
      objc_super v17 = v11 + 8;
      uint64_t v18 = 1;
      unint64_t v31 = v9;
      do
      {
        uint64_t v19 = 0;
        uint64_t v32 = v18;
        uint64_t v20 = v18 - 1;
        uint64_t v21 = v17;
        do
        {
          unsigned int v22 = objc_msgSend(v3, "characterAtIndex:", v19, v28, v29);
          unsigned int v23 = [v4 characterAtIndex:v20];
          uint64_t v24 = *v21 + 1;
          uint64_t v25 = v21[v14];
          if (v24 >= v25 + 1) {
            uint64_t v24 = v25 + 1;
          }
          uint64_t v26 = *(v21 - 1);
          if (v22 != v23) {
            ++v26;
          }
          if (v24 >= v26) {
            uint64_t v24 = v26;
          }
          v21[v14 + 1] = v24;
          ++v19;
          uint64_t v21 = (void *)((char *)v21 + v14 * 8 + 8);
        }
        while (v7 != v19);
        uint64_t v18 = v32 + 1;
        v17 += 8;
      }
      while (v32 != v31);
      unint64_t v5 = *(void *)&v28[8 * v29 * v7 + 8 * v31];
    }
    else if (v7 <= v9)
    {
      unint64_t v5 = v9;
    }
    else
    {
      unint64_t v5 = v7;
    }
  }

  return v5;
}

size_t sub_10000A740(FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:v10 arguments:&a9];

  id v12 = v11;
  size_t v13 = fwrite([v12 UTF8String], 1uLL, (size_t)objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4), a1);

  return v13;
}

size_t sub_10000A7E4(FILE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_10000A740(a1, @"%@", a3, a4, a5, a6, a7, a8, a2);
}

void sub_10000A810(uint64_t a1)
{
  if (qword_1000159F0 != -1) {
    dispatch_once(&qword_1000159F0, &stru_100010580);
  }
  qword_1000159E8 = a1;
}

uint64_t sub_10000A860()
{
  if (qword_1000159F0 != -1) {
    dispatch_once(&qword_1000159F0, &stru_100010580);
  }
  return qword_1000159E8;
}

void sub_10000A8A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000A8DC(const char *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a3];

  if ([v6 length]) {
    BOOL v7 = objc_msgSend(v6, "characterAtIndex:", (char *)objc_msgSend(v6, "length") - 1) != 10;
  }
  else {
    BOOL v7 = 1;
  }
  id v8 = __stderrp;
  unint64_t v9 = +[CLIProgram sharedProgram];
  id v10 = [v9 programName];
  fprintf(v8, "%s: %s: ", (const char *)[v10 UTF8String], a1);

  id v13 = v6;
  id v11 = [v13 UTF8String];
  id v12 = [v13 lengthOfBytesUsingEncoding:4];
  fwrite(v11, 1uLL, (size_t)v12, __stderrp);
  if (v7) {
    fputc(10, __stderrp);
  }
}

void sub_10000AA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AA50(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000AA90(int a1, void *a2)
{
  id v3 = a2;
  sub_10000AA50(a1, @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
}

void sub_10000AAC0(void *a1)
{
  id v1 = a1;
  [v1 usageLine];
  if (!objc_claimAutoreleasedReturnValue()) {
    exit(64);
  }
  uint64_t v2 = [v1 name];
  sub_10000AA50(64, @"Usage: %@ %@\n", v3, v4, v5, v6, v7, v8, v2);
}

void sub_10000AB14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000AB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AB78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000ABB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000ABDC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"Type"];

  if (!v2)
  {
    uint64_t v19 = +[NSAssertionHandler currentHandler];
    uint64_t v20 = +[NSString stringWithUTF8String:"void CLIPrintDictionary(NSDictionary * _Nonnull __strong)"];
    [v19 handleFailureInFunction:v20 file:@"CLITerminal.m" lineNumber:151 description:@"Output dictionaries must have a type"];
  }
  switch(qword_1000159E8)
  {
    case 2:
      id v21 = 0;
      uint64_t v9 = +[NSJSONSerialization dataWithJSONObject:v1 options:0 error:&v21];
      id v15 = v21;
      id v11 = v15;
      if (!v9)
      {
        NSLog(@"Couldn't make JSON for:\n%@\n%@", v1, v15);
        goto LABEL_14;
      }
      id v16 = v9;
      id v17 = [v16 bytes];
      id v18 = [v16 length];
      fwrite(v17, (size_t)v18, 1uLL, __stdoutp);
      goto LABEL_11;
    case 1:
      id v22 = 0;
      uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:v1 format:100 options:0 error:&v22];
      id v10 = v22;
      id v11 = v10;
      if (!v9)
      {
        NSLog(@"Couldn't make plist for:\n%@\n%@", v1, v10);
        goto LABEL_14;
      }
      id v12 = v9;
      id v13 = [v12 bytes];
      id v14 = [v12 length];
      fwrite(v13, (size_t)v14, 1uLL, __stdoutp);
LABEL_11:
      fputc(10, __stdoutp);
LABEL_14:

      break;
    case 0:
      sub_10000A740(__stdoutp, @"%@\n", v3, v4, v5, v6, v7, v8, (uint64_t)v1);
      break;
  }
}

void sub_10000AE70(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    id v28 = +[NSAssertionHandler currentHandler];
    unint64_t v29 = +[NSString stringWithUTF8String:"void CLIPrintNSError(NSError * _Nonnull __strong, NSDictionary * _Nullable __strong)"];
    [v28 handleFailureInFunction:v29, @"CLITerminal.m", 202, @"Invalid parameter not satisfying: %@", @"error != nil" file lineNumber description];
  }
  if (qword_1000159E8)
  {
    v32[0] = @"Error";
    v31[0] = @"Type";
    v31[1] = @"Message";
    uint64_t v5 = [v3 localizedDescription];
    uint64_t v6 = (void *)v5;
    if (v5) {
      CFStringRef v7 = (const __CFString *)v5;
    }
    else {
      CFStringRef v7 = &stru_100011060;
    }
    v32[1] = v7;
    v31[2] = @"Detail";
    uint64_t v8 = [v3 localizedRecoverySuggestion];
    uint64_t v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = &stru_100011060;
    }
    v32[2] = v10;
    v31[3] = @"FailureReason";
    uint64_t v11 = [v3 localizedFailureReason];
    id v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    else {
      CFStringRef v13 = &stru_100011060;
    }
    v32[3] = v13;
    v31[4] = @"Domain";
    uint64_t v14 = [v3 domain];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_100011060;
    }
    v32[4] = v16;
    v31[5] = @"Code";
    id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 code]);
    v32[5] = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:6];
    id v19 = [v18 mutableCopy];

    if (v4) {
      [v19 addEntriesFromDictionary:v4];
    }
    sub_10000ABDC(v19);
  }
  else
  {
    uint64_t v20 = [v3 localizedDescription];
    uint64_t v30 = [v3 domain];
    [v3 code];
    sub_10000A8A4(@"%@\n(Domain: %@ Code: %d)\n\n", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);
  }
}

void sub_10000B108(void *a1, void *a2)
{
}

uint64_t sub_10000B13C()
{
  if (qword_1000159F0 != -1) {
    dispatch_once(&qword_1000159F0, &stru_100010580);
  }
  return byte_100015988;
}

uint64_t sub_10000B180()
{
  return fputc(13, __stdoutp);
}

__CFString *sub_10000B194()
{
  size_t v7 = 0;
  v0 = fgetln(__stdinp, &v7);
  if (v0)
  {
    id v1 = v0;
    id v2 = objc_alloc((Class)NSString);
    id v3 = [v2 initWithBytes:v1 length:v7 encoding:4];
    id v4 = +[NSCharacterSet newlineCharacterSet];
    uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];
  }
  else
  {
    uint64_t v5 = &stru_100011060;
  }
  return v5;
}

NSString *sub_10000B250(void *a1)
{
  id v1 = getpass((const char *)[a1 UTF8String]);
  id v2 = +[NSString stringWithCString:v1 encoding:4];
  size_t v3 = strlen(v1);
  bzero(v1, v3);
  return v2;
}

void sub_10000B2AC(id a1)
{
  qword_1000159E8 = 0;
  byte_100015988 = isatty(1) != 0;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void bzero(void *a1, size_t a2)
{
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

Class class_getSuperclass(Class cls)
{
  return _class_getSuperclass(cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return _fgetln(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl getpass(const char *a1)
{
  return _getpass(a1);
}

int isatty(int a1)
{
  return _isatty(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  return _objc_copyClassList(outCount);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

int objc_getClassList(Class *buffer, int bufferCount)
{
  return _objc_getClassList(buffer, bufferCount);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__copiedSet(void *a1, const char *a2, ...)
{
  return [a1 _copiedSet];
}

id objc_msgSend__finalize(void *a1, const char *a2, ...)
{
  return [a1 _finalize];
}

id objc_msgSend__schemaData(void *a1, const char *a2, ...)
{
  return [a1 _schemaData];
}

id objc_msgSend_aliases(void *a1, const char *a2, ...)
{
  return [a1 aliases];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_blocks(void *a1, const char *a2, ...)
{
  return [a1 blocks];
}

id objc_msgSend_blueprints(void *a1, const char *a2, ...)
{
  return [a1 blueprints];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canSetUpFamily(void *a1, const char *a2, ...)
{
  return [a1 canSetUpFamily];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_commandName(void *a1, const char *a2, ...)
{
  return [a1 commandName];
}

id objc_msgSend_communicationPolicy(void *a1, const char *a2, ...)
{
  return [a1 communicationPolicy];
}

id objc_msgSend_communicationWhileLimitedPolicy(void *a1, const char *a2, ...)
{
  return [a1 communicationWhileLimitedPolicy];
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return [a1 configurations];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countedItems(void *a1, const char *a2, ...)
{
  return [a1 countedItems];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionaryWithOptionsAndValues(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithOptionsAndValues];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_effectivePasscode(void *a1, const char *a2, ...)
{
  return [a1 effectivePasscode];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return [a1 expiration];
}

id objc_msgSend_familyMemberType(void *a1, const char *a2, ...)
{
  return [a1 familyMemberType];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_fetchRequestMatchingLocalUser(void *a1, const char *a2, ...)
{
  return [a1 fetchRequestMatchingLocalUser];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishArguments(void *a1, const char *a2, ...)
{
  return [a1 finishArguments];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_installedApps(void *a1, const char *a2, ...)
{
  return [a1 installedApps];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAppAndWebsiteActivityEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAppAndWebsiteActivityEnabled];
}

id objc_msgSend_isCommunicationSafetyAnalyticsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCommunicationSafetyAnalyticsEnabled];
}

id objc_msgSend_isCommunicationSafetyNotificationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCommunicationSafetyNotificationEnabled];
}

id objc_msgSend_isCommunicationSafetyReceivingRestricted(void *a1, const char *a2, ...)
{
  return [a1 isCommunicationSafetyReceivingRestricted];
}

id objc_msgSend_isCommunicationSafetySendingRestricted(void *a1, const char *a2, ...)
{
  return [a1 isCommunicationSafetySendingRestricted];
}

id objc_msgSend_isEyeReliefEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEyeReliefEnabled];
}

id objc_msgSend_isFamilyOrganizer(void *a1, const char *a2, ...)
{
  return [a1 isFamilyOrganizer];
}

id objc_msgSend_isManaged(void *a1, const char *a2, ...)
{
  return [a1 isManaged];
}

id objc_msgSend_isParent(void *a1, const char *a2, ...)
{
  return [a1 isParent];
}

id objc_msgSend_lastEventDate(void *a1, const char *a2, ...)
{
  return [a1 lastEventDate];
}

id objc_msgSend_lastFamilyCheckinDate(void *a1, const char *a2, ...)
{
  return [a1 lastFamilyCheckinDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localUserDeviceState(void *a1, const char *a2, ...)
{
  return [a1 localUserDeviceState];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return [a1 localizedRecoverySuggestion];
}

id objc_msgSend_longEnglishDescription(void *a1, const char *a2, ...)
{
  return [a1 longEnglishDescription];
}

id objc_msgSend_longName(void *a1, const char *a2, ...)
{
  return [a1 longName];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return [a1 main];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_minimumInstallationDate(void *a1, const char *a2, ...)
{
  return [a1 minimumInstallationDate];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameSummaryString(void *a1, const char *a2, ...)
{
  return [a1 nameSummaryString];
}

id objc_msgSend_needsToSetPasscode(void *a1, const char *a2, ...)
{
  return [a1 needsToSetPasscode];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextArgument(void *a1, const char *a2, ...)
{
  return [a1 nextArgument];
}

id objc_msgSend_nextOptionParser(void *a1, const char *a2, ...)
{
  return [a1 nextOptionParser];
}

id objc_msgSend_numberOfNotifications(void *a1, const char *a2, ...)
{
  return [a1 numberOfNotifications];
}

id objc_msgSend_numberOfPickups(void *a1, const char *a2, ...)
{
  return [a1 numberOfPickups];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_organizationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 organizationIdentifier];
}

id objc_msgSend_parameterCount(void *a1, const char *a2, ...)
{
  return [a1 parameterCount];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return [a1 persistentContainer];
}

id objc_msgSend_preserveMultipleArguments(void *a1, const char *a2, ...)
{
  return [a1 preserveMultipleArguments];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_programName(void *a1, const char *a2, ...)
{
  return [a1 programName];
}

id objc_msgSend_register(void *a1, const char *a2, ...)
{
  return [a1 register];
}

id objc_msgSend_registerAllCLICommands(void *a1, const char *a2, ...)
{
  return [a1 registerAllCLICommands];
}

id objc_msgSend_registerGlobalOptions(void *a1, const char *a2, ...)
{
  return [a1 registerGlobalOptions];
}

id objc_msgSend_registeredCommandNames(void *a1, const char *a2, ...)
{
  return [a1 registeredCommandNames];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_screenTimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 screenTimeEnabled];
}

id objc_msgSend_screenTimeInSeconds(void *a1, const char *a2, ...)
{
  return [a1 screenTimeInSeconds];
}

id objc_msgSend_shareWebUsage(void *a1, const char *a2, ...)
{
  return [a1 shareWebUsage];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedProgram(void *a1, const char *a2, ...)
{
  return [a1 sharedProgram];
}

id objc_msgSend_shortEnglishDescription(void *a1, const char *a2, ...)
{
  return [a1 shortEnglishDescription];
}

id objc_msgSend_shortName(void *a1, const char *a2, ...)
{
  return [a1 shortName];
}

id objc_msgSend_shouldAutomaticallyRegisterCommands(void *a1, const char *a2, ...)
{
  return [a1 shouldAutomaticallyRegisterCommands];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startRunLoop(void *a1, const char *a2, ...)
{
  return [a1 startRunLoop];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_syncingEnabled(void *a1, const char *a2, ...)
{
  return [a1 syncingEnabled];
}

id objc_msgSend_timedItems(void *a1, const char *a2, ...)
{
  return [a1 timedItems];
}

id objc_msgSend_totalTimeInSeconds(void *a1, const char *a2, ...)
{
  return [a1 totalTimeInSeconds];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unmodeledManagingOrganizationSettings(void *a1, const char *a2, ...)
{
  return [a1 unmodeledManagingOrganizationSettings];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_usageLine(void *a1, const char *a2, ...)
{
  return [a1 usageLine];
}

id objc_msgSend_usages(void *a1, const char *a2, ...)
{
  return [a1 usages];
}

id objc_msgSend_userDeviceStates(void *a1, const char *a2, ...)
{
  return [a1 userDeviceStates];
}

id objc_msgSend_validateArguments(void *a1, const char *a2, ...)
{
  return [a1 validateArguments];
}
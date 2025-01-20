id start()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  +[RMBundle setManagementScope:sub_100005088()];
  v1 = +[CLIProgram sharedProgram];
  v2 = objc_opt_new();
  [v1 setDelegate:v2];

  v3 = [v1 main];
  return v3;
}

void sub_100004980(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  v10 = v9;
  if (v8)
  {
    [v9 setObject:v23 forKeyedSubscript:@"Detail"];
    if (v7) {
      [v10 addEntriesFromDictionary:v7];
    }
    sub_100011D40(v8, v10);
  }
  else
  {
    uint64_t v11 = sub_10001181C();
    uint64_t v18 = v11;
    if (v7 || v11)
    {
      [v10 setObject:@"Result" forKeyedSubscript:@"Type"];
      v19 = +[NSNumber numberWithInteger:a1];
      [v10 setObject:v19 forKeyedSubscript:@"Code"];

      [v10 setObject:v23 forKeyedSubscript:@"Message"];
      [v10 setObject:v7 forKeyedSubscript:@"Detail"];
      sub_100011AAC(v10);
      if (v18) {
        goto LABEL_5;
      }
      v20 = __stdoutp;
      v21 = @"\n";
    }
    else
    {
      if (a1)
      {
        sub_100011860(@"%@\n\n", (uint64_t)v23, v12, v13, v14, v15, v16, v17, (uint64_t)v23);
        goto LABEL_5;
      }
      v20 = __stdoutp;
      uint64_t v22 = (uint64_t)v23;
      v21 = @"%@\n\n";
    }
    sub_100011728(v20, v21, v12, v13, v14, v15, v16, v17, v22);
  }
LABEL_5:
}

void sub_100004B74(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)qword_100025388;
  qword_100025388 = v1;

  v3 = (objc_class *)objc_opt_class();
  objc_enumerateClasses(0, 0, 0, v3, &stru_10001C528);
}

void sub_100004BCC(id a1, Class a2, BOOL *a3)
{
  v4 = (void *)qword_100025388;
  id v5 = [(objc_class *)a2 name];
  [v4 setObject:a2 forKeyedSubscript:v5];
}

id sub_100004D04(char a1)
{
  v2 = +[RMLocations persistentStoreURLCreateIfNeeded:0];
  id v3 = 0;
  v4 = v3;
  if (v2)
  {
    id v31 = v3;
    unsigned __int8 v5 = [v2 checkResourceIsReachableAndReturnError:&v31];
    id v6 = v31;

    if (v5)
    {
      id v7 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v2];
      [v7 setType:NSSQLiteStoreType];
      [v7 setShouldMigrateStoreAutomatically:0];
      [v7 setShouldInferMappingModelAutomatically:1];
      [v7 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
      id v8 = objc_alloc((Class)NSManagedObjectModel);
      v9 = +[RMLocations managedObjectModelURL];
      id v10 = [v8 initWithContentsOfURL:v9];

      id v11 = [objc_alloc((Class)NSPersistentContainer) initWithName:@"RemoteManagement" managedObjectModel:v10];
      v32 = v7;
      uint64_t v12 = +[NSArray arrayWithObjects:&v32 count:1];
      [v11 setPersistentStoreDescriptions:v12];

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000500C;
      v28[3] = &unk_10001C550;
      char v30 = a1;
      id v29 = v2;
      [v11 loadPersistentStoresWithCompletionHandler:v28];
    }
    else
    {
      if ((a1 & 1) == 0)
      {
        uint64_t v21 = [v2 path];
        [v6 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_1000119E0(74, @"Missing Core Data store %@: %@", v22, v23, v24, v25, v26, v27, v21);
      }
      id v11 = 0;
    }
    v4 = v6;
  }
  else
  {
    if ((a1 & 1) == 0)
    {
      uint64_t v14 = [v3 localizedDescription];
      sub_1000119E0(74, @"Can't get persistent store URL: %@", v15, v16, v17, v18, v19, v20, v14);
    }
    id v11 = 0;
  }

  return v11;
}

void sub_100004F9C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = +[RMErrorUtilities createInternalError];
    v4 = v3;
    if (v3) {
      id v5 = v3;
    }

    objc_end_catch();
    JUMPOUT(0x100004D54);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000500C(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v5 && !*(unsigned char *)(a1 + 40))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    [v5 localizedDescription];
    objc_claimAutoreleasedReturnValue();
    sub_1000119E0(74, @"Can't open Core Data store %@: %@", v7, v8, v9, v10, v11, v12, v6);
  }
}

BOOL sub_100005088()
{
  return !geteuid() || geteuid() == 277;
}

void sub_100005D54(id a1)
{
  qword_100025398 = (uint64_t)os_log_create("com.apple.remotemanagementd", "httpconduitstate");

  _objc_release_x1();
}

void sub_1000073D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000073E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000073F8(uint64_t a1)
{
}

uint64_t sub_100007400(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[RMReport reportWithContext:*(void *)(a1 + 32) allInformation:0];

  return _objc_release_x1();
}

void sub_1000077F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_100007818(uint64_t a1)
{
  id v2 = +[RMManagementSource fetchRequest];
  id v16 = 0;
  id v3 = [v2 execute:&v16];
  id v4 = v16;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "identifier", (void)v12);
          [v10 addObject:v11];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

void sub_100007974(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&__NSDictionary0__struct forKeyedSubscript:@"Status"];
  uint64_t v14 = a1;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        CFStringRef v20 = @"Error";
        long long v12 = objc_msgSend(v5, "localizedDescription", v14);
        uint64_t v21 = v12;
        long long v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        [v6 setObject:v13 forKeyedSubscript:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  [*(id *)(*(void *)(*(void *)(v14 + 40) + 8) + 40) setObject:v6 forKeyedSubscript:@"Errors"];
}

void sub_100007B48(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    id v22 = v7;
    [v9 setObject:&__NSDictionary0__struct forKeyedSubscript:@"Status"];
    uint64_t v21 = a1;
    id v10 = *(id *)(a1 + 32);
    id v11 = v8;
    id v12 = (id)objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v10;
    id v13 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          CFStringRef v28 = @"Error";
          long long v18 = objc_msgSend(v11, "localizedDescription", v21);
          id v29 = v18;
          long long v19 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          [v12 setObject:v19 forKeyedSubscript:v17];
        }
        id v14 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v14);
    }

    id v7 = v22;
    a1 = v21;
  }
  else
  {
    [v9 setObject:a2 forKeyedSubscript:@"Status"];
    id v20 = v7;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100007DD4;
    v30[3] = &unk_10001C658;
    id v12 = (id)objc_opt_new();
    id v31 = v12;
    [v20 enumerateKeysAndObjectsUsingBlock:v30];
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v12, @"Errors", v21);
}

void sub_100007DD4(uint64_t a1, void *a2, void *a3)
{
  v11[0] = @"Domain";
  id v5 = a3;
  id v6 = a2;
  id v7 = [v5 domain];
  v12[0] = v7;
  v11[1] = @"Code";
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 code]);
  v12[1] = v8;
  v11[2] = @"Description";
  uint64_t v9 = [v5 localizedDescription];

  v12[2] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v6];
}

void sub_100007F5C(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_1000253A8;
  qword_1000253A8 = v1;

  id v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)qword_1000253A8 setLocale:v3];

  [(id)qword_1000253A8 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  id v4 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [(id)qword_1000253A8 setTimeZone:v4];
}

void sub_1000084B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

uint64_t sub_1000084D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000084E0(uint64_t a1)
{
}

void sub_1000084E8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 40);
  id v8 = a3;
  id v13 = [v7 serializeValue:a2];
  uint64_t v9 = [*(id *)(a1 + 40) serializeValue:v8];

  if (v13) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    *a4 = 1;
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:v13];
  }
}

void sub_1000087F4(id a1)
{
  qword_1000253B8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "managementSettings");

  _objc_release_x1();
}

void sub_10000888C(id a1)
{
  uint64_t v1 = +[RMLocations dataVaultDirectoryURLCreateIfNeeded:1];
  id v4 = [v1 URLByAppendingPathComponent:@"ManagementSettings.plist"];

  id v2 = [[RMManagementSettings alloc] initWithURL:v4];
  id v3 = (void *)qword_1000253C8;
  qword_1000253C8 = (uint64_t)v2;
}

void sub_100008AE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008B8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008C48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000906C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009088(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000A34C(id a1)
{
  qword_1000253D8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "mdmconduitstate");

  _objc_release_x1();
}

void sub_10000A52C(id a1)
{
  qword_1000253E8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "predicateDescription");

  _objc_release_x1();
}

void sub_10000AA5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint8_t buf)
{
  if (a2 != 1) {
    _Unwind_Resume(exception_object);
  }
  id v30 = objc_begin_catch(exception_object);
  id v31 = [v30 name];
  unsigned int v32 = [v31 isEqualToString:RMErrorDomain];

  if (v32)
  {
    v33 = [v30 userInfo];
    v34 = [v33 objectForKeyedSubscript:@"error"];
    v35 = v34;
    if (v34)
    {
      id v36 = v34;
    }
    else
    {
      id v36 = +[RMErrorUtilities createUnableToParsePredicateErrorWithFormat:v29 reason:@"Unknown"];
    }
    id v40 = v36;

    v41 = +[RMLog predicateDescription];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100012440(v29, (uint64_t)v40, v41);
    }

    if (!a12) {
      goto LABEL_15;
    }
  }
  else
  {
    v37 = +[RMLog predicateDescription];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = [v30 reason];
      sub_1000124C8(v29, v38, &buf, v37);
    }

    if (!a12)
    {
LABEL_16:

      objc_end_catch();
      JUMPOUT(0x10000A9E8);
    }
    v39 = [v30 reason];
    id v40 = +[RMErrorUtilities createUnableToParsePredicateErrorWithFormat:v29 reason:v39];
  }
  if (v40)
  {
    id v40 = v40;
    *a12 = v40;
  }
LABEL_15:

  goto LABEL_16;
}

void sub_10000B32C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  id v22 = v12;
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(a1);
    id v14 = +[RMLog predicateDescription];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v19 = [v22 predicate];
      id v20 = [v19 predicateFormat];
      uint64_t v21 = [v13 reason];
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to evaluate “%{public}@”: %{public}@", (uint8_t *)&buf, 0x16u);
    }
    if (v11)
    {
      uint64_t v15 = [v22 predicate];
      long long v16 = [v15 predicateFormat];
      uint64_t v17 = [v13 reason];
      long long v18 = +[RMErrorUtilities createUnableToEvaluatePredicateErrorWithFormat:v16 reason:v17];

      if (v18) {
        *uint64_t v11 = v18;
      }
    }
    objc_end_catch();
    JUMPOUT(0x10000B2ECLL);
  }
  _Unwind_Resume(a1);
}

void sub_10000BB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BB3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BB4C(uint64_t a1)
{
}

void sub_10000BB54(uint64_t a1)
{
  v9[0] = @"Management Sources";
  id v2 = +[RMReport managementSources];
  v9[1] = @"Orphaned Entities";
  v10[0] = v2;
  id v3 = +[RMReport orphanedEntities];
  v10[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v5 = [v4 mutableCopy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(unsigned char *)(a1 + 48))
  {
    id v8 = +[RMReport internalStateArchiveWithContext:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:@"Internal Device Status"];
  }
}

void sub_10000D240(id a1)
{
  qword_1000253F8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "storeHelper");

  _objc_release_x1();
}

id sub_10000E2D0(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSMutableString stringWithCapacity:a2];
  for (i = +[NSMutableString stringWithCapacity:a2 + 1];
    [v4 appendString:@"\t"];
  [i appendFormat:@"\n%@", v4];
  uint64_t v6 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:i];
  id v7 = +[NSString stringWithFormat:@"%@%@", v4, v6];

  return v7;
}

void sub_10000E3D4()
{
  v0 = +[CLIProgram sharedProgram];
  id v12 = [v0 programName];

  uint64_t v1 = +[NSBundle mainBundle];
  id v2 = [v1 infoDictionary];
  id v3 = [v2 objectForKeyedSubscript:_kCFBundleShortVersionStringKey];
  id v4 = [v2 objectForKeyedSubscript:kCFBundleVersionKey];
  if ([v3 length])
  {
    id v5 = [@" " stringByAppendingString:v3];
  }
  else
  {
    id v5 = &stru_10001DAE0;
  }

  if ([v4 length]) {
    sub_100011728(__stdoutp, @"%@%@ (%@)\n", v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
  else {
    sub_100011728(__stdoutp, @"%@%@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
}

void sub_10000E520(void *a1)
{
  id v1 = a1;
  id v2 = [(id)qword_100025408 objectForKeyedSubscript:v1];
  uint64_t v3 = [(id)qword_100025410 objectForKey:v2];
  uint64_t v10 = (void *)v3;
  if (v1 && !v2)
  {
    v67 = (void *)v3;

    sub_100011728(__stdoutp, @"\n", v11, v12, v13, v14, v15, v16, v63);
    id v68 = 0;
LABEL_8:
    sub_10000E888((void *)qword_100025418);
    sub_100011728(__stdoutp, @"Commands:\n", v22, v23, v24, v25, v26, v27, v64);
    CFStringRef v28 = (void *)qword_100025420;
    uint64_t v29 = +[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:1];
    v74 = v29;
    id v30 = +[NSArray arrayWithObjects:&v74 count:1];
    id v31 = [v28 sortedArrayUsingDescriptors:v30];

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
          v37 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v38 = __stdoutp;
          v39 = [v37 nameSummaryString];
          v65 = [v37 shortEnglishDescription];
          sub_100011728(v38, @"\t%@\n\t%@\n\n", v40, v41, v42, v43, v44, v45, (uint64_t)v39);
        }
        id v34 = [v32 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v34);
    }

    uint64_t v10 = v67;
    id v1 = v68;
    goto LABEL_21;
  }
  sub_100011728(__stdoutp, @"\n", v4, v5, v6, v7, v8, v9, v63);
  if (!v2)
  {
    v67 = v10;
    id v68 = v1;
    goto LABEL_8;
  }
  uint64_t v17 = [v2 nameSummaryString];
  long long v18 = [v2 usageLine];

  if (v18)
  {
    long long v19 = [v2 name];
    id v20 = [v2 usageLine];
    uint64_t v21 = +[NSString stringWithFormat:@"Usage: %@ %@\n\t", v19, v20];
  }
  else
  {
    uint64_t v21 = &stru_10001DAE0;
  }
  v46 = __stdoutp;
  v66 = [v2 shortEnglishDescription];
  sub_100011728(v46, @"%@\n\t%@%@\n\n", v47, v48, v49, v50, v51, v52, (uint64_t)v17);

  v53 = [v2 longEnglishDescription];
  v54 = v53;
  if (v53)
  {
    v55 = __stdoutp;
    v56 = sub_10000E2D0(v53, 1);
    sub_100011728(v55, @"%@\n\n", v57, v58, v59, v60, v61, v62, (uint64_t)v56);
  }
  sub_10000E888((void *)qword_100025418);
  if (v10) {
    sub_10000E888(v10);
  }
LABEL_21:
}

void sub_10000E888(void *a1)
{
  id v1 = a1;
  if ([v1[1] count])
  {
    if ((id *)qword_100025418 == v1) {
      uint64_t v8 = @"Global options:\n";
    }
    else {
      uint64_t v8 = @"Command options:\n";
    }
    sub_100011728(__stdoutp, v8, v2, v3, v4, v5, v6, v7, v37);
    v39 = v1;
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
          long long v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          long long v19 = __stdoutp;
          id v20 = [v18 nameSummaryString];
          v38 = [v18 shortEnglishDescription];
          sub_100011728(v19, @"\t%@\n\t%@\n\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

          uint64_t v27 = [v18 longEnglishDescription];
          CFStringRef v28 = v27;
          if (v27)
          {
            uint64_t v29 = __stdoutp;
            id v30 = sub_10000E2D0(v27, 1);
            sub_100011728(v29, @"%@\n\n", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v15);
    }

    id v1 = v39;
  }
}

id *sub_10000FA6C(id *a1, void *a2, void *a3)
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
        uint64_t v10 = [(id)qword_100025410 objectForKey:v6];
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
        if (qword_100025428 != -1) {
          dispatch_once(&qword_100025428, &stru_10001C858);
        }
        id v13 = (id)qword_100025418;
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

void sub_10000FBEC(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_100011860(@"Unknown option '%@'", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [a1 command];
    sub_100011A20(v11);
  }
}

void sub_10000FC4C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_100011860(@"Option '%@' missing an argument", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [a1 command];
    sub_100011A20(v11);
  }
}

void sub_10000FF34(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 16), "objectForKeyedSubscript:");
  id v4 = [v3 parameterCount];
  if (!v3)
  {
    sub_10000FBEC(*(void **)(a1 + 32), v11);
    [(CLIOptionParser *)v9 dictionaryWithOptionsAndValues];
    return;
  }
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [*(id *)(a1 + 32) nextArgument];
  if (!v5)
  {
    sub_10000FC4C(*(void **)(a1 + 32), *(void **)(a1 + 40));
LABEL_5:
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [v3 shortName];
  uint64_t v8 = [v3 longName];
  (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v5);
}

uint64_t sub_1000100E8(uint64_t a1, void *a2, void *a3, void *a4)
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

BOOL sub_100010304(id a1, NSString *a2, NSString *a3, NSString *a4)
{
  return 1;
}

void sub_1000103AC(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_100025418;
  qword_100025418 = v1;

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)qword_100025420;
  qword_100025420 = v3;

  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)qword_100025408;
  qword_100025408 = v5;

  qword_100025410 = +[NSMapTable strongToStrongObjectsMapTable];

  _objc_release_x1();
}

void sub_1000104FC(id a1)
{
  qword_100025438 = objc_opt_new();

  _objc_release_x1();
}

void sub_100010628(uint64_t a1, void *a2)
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
    sub_1000119E0(64, @"Unrecognized format, valid formats are: text, JSON, plist", v3, v4, v5, v6, v7, v8, v11);
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
  sub_1000117CC(v10);
}

void sub_100010970(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = objc_opt_new();
    [v1 setName:@"help"];
    [v1 setAliases:&off_10001E960];
    [v1 setShortEnglishDescription:@"Show help for a command or show all commands."];
    [v1 setExecutionBlock:&stru_10001C8B8];
    [v1 register];
    id v2 = (id)objc_opt_new();

    [v2 setName:@"version"];
    [v2 setShortEnglishDescription:@"Show this program's version."];
    [v2 setExecutionBlock:&stru_10001C8D8];
    [v2 register];
  }
}

BOOL sub_100010A4C(id a1, CLIOptionParser *a2)
{
  id v2 = a2;
  sub_10000E3D4();
  uint64_t v3 = [(CLIOptionParser *)v2 nextArgument];

  sub_10000E520(v3);
  return 1;
}

BOOL sub_100010A98(id a1, CLIOptionParser *a2)
{
  return 1;
}

void sub_100011030(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011108(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_100011498(unint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && !*(void *)(a1 + 8)) {
    a1 = sub_1000114FC(v5, v6);
  }

  return a1;
}

unint64_t sub_1000114FC(void *a1, void *a2)
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
      id v30 = &v28;
      __chkstk_darwin();
      uint64_t v11 = (char *)&v28 - v10;
      bzero((char *)&v28 - v10, v12);
      uint64_t v13 = 0;
      uint64_t v14 = v9;
      id v15 = v11;
      do
      {
        *id v15 = v13++;
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
      CFStringRef v28 = v11;
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

size_t sub_100011728(FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:v10 arguments:&a9];

  id v12 = v11;
  size_t v13 = fwrite([v12 UTF8String], 1uLL, (size_t)objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4), a1);

  return v13;
}

void sub_1000117CC(uint64_t a1)
{
  if (qword_100025448 != -1) {
    dispatch_once(&qword_100025448, &stru_10001C900);
  }
  qword_100025440 = a1;
}

uint64_t sub_10001181C()
{
  if (qword_100025448 != -1) {
    dispatch_once(&qword_100025448, &stru_10001C900);
  }
  return qword_100025440;
}

void sub_100011860(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100011898(const char *a1, void *a2, uint64_t a3)
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

void sub_1000119E0(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100011A20(void *a1)
{
  id v1 = a1;
  [v1 usageLine];
  if (!objc_claimAutoreleasedReturnValue()) {
    exit(64);
  }
  uint64_t v2 = [v1 name];
  sub_1000119E0(64, @"Usage: %@ %@\n", v3, v4, v5, v6, v7, v8, v2);
}

void sub_100011A74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100011AAC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"Type"];

  if (!v2)
  {
    uint64_t v19 = +[NSAssertionHandler currentHandler];
    uint64_t v20 = +[NSString stringWithUTF8String:"void CLIPrintDictionary(NSDictionary * _Nonnull __strong)"];
    [v19 handleFailureInFunction:v20 file:@"CLITerminal.m" lineNumber:151 description:@"Output dictionaries must have a type"];
  }
  switch(qword_100025440)
  {
    case 2:
      id v21 = 0;
      unint64_t v9 = +[NSJSONSerialization dataWithJSONObject:v1 options:0 error:&v21];
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
      unint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:v1 format:100 options:0 error:&v22];
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
      sub_100011728(__stdoutp, @"%@\n", v3, v4, v5, v6, v7, v8, (uint64_t)v1);
      break;
  }
}

void sub_100011D40(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    CFStringRef v28 = +[NSAssertionHandler currentHandler];
    unint64_t v29 = +[NSString stringWithUTF8String:"void CLIPrintNSError(NSError * _Nonnull __strong, NSDictionary * _Nullable __strong)"];
    [v28 handleFailureInFunction:v29, @"CLITerminal.m", 202, @"Invalid parameter not satisfying: %@", @"error != nil" file lineNumber description];
  }
  if (qword_100025440)
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
      CFStringRef v7 = &stru_10001DAE0;
    }
    v32[1] = v7;
    v31[2] = @"Detail";
    uint64_t v8 = [v3 localizedRecoverySuggestion];
    unint64_t v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = &stru_10001DAE0;
    }
    v32[2] = v10;
    v31[3] = @"FailureReason";
    uint64_t v11 = [v3 localizedFailureReason];
    id v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    else {
      CFStringRef v13 = &stru_10001DAE0;
    }
    v32[3] = v13;
    v31[4] = @"Domain";
    uint64_t v14 = [v3 domain];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_10001DAE0;
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
    sub_100011AAC(v19);
  }
  else
  {
    uint64_t v20 = [v3 localizedDescription];
    id v30 = [v3 domain];
    [v3 code];
    sub_100011860(@"%@\n(Domain: %@ Code: %d)\n\n", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);
  }
}

void sub_100011FD8(id a1)
{
  qword_100025440 = 0;
  byte_100025380 = isatty(1) != 0;
}

void sub_10001200C()
{
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  sub_100003080();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Could not deserialize data for %{public}@: %{public}@", v2, 0x16u);
}

void sub_1000120A8()
{
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  sub_100003080();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Could not serialize data for %{public}@: %{public}@", v2, 0x16u);
}

void sub_100012144()
{
  sub_100009060();
  sub_10000906C((void *)&_mh_execute_header, v0, v1, "Failed to cache management settings: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000121AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Management settings cache does not currently exist", v1, 2u);
}

void sub_1000121F0(void *a1)
{
  uint64_t v1 = [a1 cachedSettings];
  sub_100009060();
  sub_100009088((void *)&_mh_execute_header, v2, v3, "Cached management settings: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100012274()
{
  sub_100009060();
  sub_10000906C((void *)&_mh_execute_header, v0, v1, "Failed to cache management settings - invalid property list type: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000122DC()
{
  sub_100009060();
  sub_10000906C((void *)&_mh_execute_header, v0, v1, "Failed to write management settings: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100012344(void *a1)
{
  uint64_t v1 = [a1 cachedSettings];
  sub_100009060();
  sub_100009088((void *)&_mh_execute_header, v2, v3, "Wrote management settings: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000123C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to create predicate regular expression: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100012440(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to parse “%{public}@”: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000124C8(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to parse “%{public}@”: %{public}@", buf, 0x16u);
}

void sub_100012530(void *a1, NSObject *a2)
{
  int v3 = [a1 version];
  int v4 = 138543362;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid predicate description version: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000125C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to fetch management source objects with enrollment types: %{public}@", (uint8_t *)&v2, 0xCu);
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uid_t geteuid(void)
{
  return _geteuid();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

int objc_getClassList(Class *buffer, int bufferCount)
{
  return _objc_getClassList(buffer, bufferCount);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__copiedSet(void *a1, const char *a2, ...)
{
  return [a1 _copiedSet];
}

id objc_msgSend__currentLoadState(void *a1, const char *a2, ...)
{
  return [a1 _currentLoadState];
}

id objc_msgSend__finalize(void *a1, const char *a2, ...)
{
  return [a1 _finalize];
}

id objc_msgSend__readCachedSettings(void *a1, const char *a2, ...)
{
  return [a1 _readCachedSettings];
}

id objc_msgSend__switchToRMDUserIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _switchToRMDUserIfNeeded];
}

id objc_msgSend__writeCachedSettings(void *a1, const char *a2, ...)
{
  return [a1 _writeCachedSettings];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_activation(void *a1, const char *a2, ...)
{
  return [a1 activation];
}

id objc_msgSend_activations(void *a1, const char *a2, ...)
{
  return [a1 activations];
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return [a1 active];
}

id objc_msgSend_aliases(void *a1, const char *a2, ...)
{
  return [a1 aliases];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowEvaluation(void *a1, const char *a2, ...)
{
  return [a1 allowEvaluation];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifier];
}

id objc_msgSend_assetReferences(void *a1, const char *a2, ...)
{
  return [a1 assetReferences];
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return [a1 assets];
}

id objc_msgSend_authenticationCredential(void *a1, const char *a2, ...)
{
  return [a1 authenticationCredential];
}

id objc_msgSend_bootstrapURI(void *a1, const char *a2, ...)
{
  return [a1 bootstrapURI];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedSettings(void *a1, const char *a2, ...)
{
  return [a1 cachedSettings];
}

id objc_msgSend_changedValues(void *a1, const char *a2, ...)
{
  return [a1 changedValues];
}

id objc_msgSend_chosenAuthenticationScheme(void *a1, const char *a2, ...)
{
  return [a1 chosenAuthenticationScheme];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
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

id objc_msgSend_conduitConfig(void *a1, const char *a2, ...)
{
  return [a1 conduitConfig];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 configurationIdentifier];
}

id objc_msgSend_configurationReferences(void *a1, const char *a2, ...)
{
  return [a1 configurationReferences];
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

id objc_msgSend_createInternalError(void *a1, const char *a2, ...)
{
  return [a1 createInternalError];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentManagedDevice(void *a1, const char *a2, ...)
{
  return [a1 currentManagedDevice];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 dateFormatter];
}

id objc_msgSend_declarationType(void *a1, const char *a2, ...)
{
  return [a1 declarationType];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionaryWithOptionsAndValues(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithOptionsAndValues];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_enrolled(void *a1, const char *a2, ...)
{
  return [a1 enrolled];
}

id objc_msgSend_enrollmentToken(void *a1, const char *a2, ...)
{
  return [a1 enrollmentToken];
}

id objc_msgSend_enrollmentType(void *a1, const char *a2, ...)
{
  return [a1 enrollmentType];
}

id objc_msgSend_enrollmentURL(void *a1, const char *a2, ...)
{
  return [a1 enrollmentURL];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_errorState(void *a1, const char *a2, ...)
{
  return [a1 errorState];
}

id objc_msgSend_expressionType(void *a1, const char *a2, ...)
{
  return [a1 expressionType];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inactiveReasons(void *a1, const char *a2, ...)
{
  return [a1 inactiveReasons];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return [a1 isSharediPad];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_lastAcknowledgedDate(void *a1, const char *a2, ...)
{
  return [a1 lastAcknowledgedDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastProcessedCommandToken(void *a1, const char *a2, ...)
{
  return [a1 lastProcessedCommandToken];
}

id objc_msgSend_lastProcessedDeclarationsToken(void *a1, const char *a2, ...)
{
  return [a1 lastProcessedDeclarationsToken];
}

id objc_msgSend_lastReceivedCommandToken(void *a1, const char *a2, ...)
{
  return [a1 lastReceivedCommandToken];
}

id objc_msgSend_lastReceivedDate(void *a1, const char *a2, ...)
{
  return [a1 lastReceivedDate];
}

id objc_msgSend_lastReceivedDeclarationsToken(void *a1, const char *a2, ...)
{
  return [a1 lastReceivedDeclarationsToken];
}

id objc_msgSend_lastReceivedPushTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastReceivedPushTimestamp];
}

id objc_msgSend_lastReceivedServerTokensFromServerTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastReceivedServerTokensFromServerTimestamp];
}

id objc_msgSend_lastReceivedServerTokensTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastReceivedServerTokensTimestamp];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadState(void *a1, const char *a2, ...)
{
  return [a1 loadState];
}

id objc_msgSend_localRetryAfterDate(void *a1, const char *a2, ...)
{
  return [a1 localRetryAfterDate];
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

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
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

id objc_msgSend_managedObjectClassName(void *a1, const char *a2, ...)
{
  return [a1 managedObjectClassName];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_managedObjectModelURL(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModelURL];
}

id objc_msgSend_management(void *a1, const char *a2, ...)
{
  return [a1 management];
}

id objc_msgSend_managementScope(void *a1, const char *a2, ...)
{
  return [a1 managementScope];
}

id objc_msgSend_managementSettings(void *a1, const char *a2, ...)
{
  return [a1 managementSettings];
}

id objc_msgSend_managementSource(void *a1, const char *a2, ...)
{
  return [a1 managementSource];
}

id objc_msgSend_managementSources(void *a1, const char *a2, ...)
{
  return [a1 managementSources];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
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

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_nextArgument(void *a1, const char *a2, ...)
{
  return [a1 nextArgument];
}

id objc_msgSend_nextOptionParser(void *a1, const char *a2, ...)
{
  return [a1 nextOptionParser];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfConsecutiveAuthErrors(void *a1, const char *a2, ...)
{
  return [a1 numberOfConsecutiveAuthErrors];
}

id objc_msgSend_numberOfConsecutiveErrors(void *a1, const char *a2, ...)
{
  return [a1 numberOfConsecutiveErrors];
}

id objc_msgSend_numberOfConsecutiveFailures(void *a1, const char *a2, ...)
{
  return [a1 numberOfConsecutiveFailures];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_operatorType(void *a1, const char *a2, ...)
{
  return [a1 operatorType];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_orphanedEntities(void *a1, const char *a2, ...)
{
  return [a1 orphanedEntities];
}

id objc_msgSend_parameterCount(void *a1, const char *a2, ...)
{
  return [a1 parameterCount];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return [a1 predicate];
}

id objc_msgSend_predicateDescription(void *a1, const char *a2, ...)
{
  return [a1 predicateDescription];
}

id objc_msgSend_predicateFormat(void *a1, const char *a2, ...)
{
  return [a1 predicateFormat];
}

id objc_msgSend_predicateStatusKeys(void *a1, const char *a2, ...)
{
  return [a1 predicateStatusKeys];
}

id objc_msgSend_prefetch(void *a1, const char *a2, ...)
{
  return [a1 prefetch];
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

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_pushEnvironment(void *a1, const char *a2, ...)
{
  return [a1 pushEnvironment];
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return [a1 pushTopic];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_referralBaseURL(void *a1, const char *a2, ...)
{
  return [a1 referralBaseURL];
}

id objc_msgSend_referralCount(void *a1, const char *a2, ...)
{
  return [a1 referralCount];
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

id objc_msgSend_reportDetails(void *a1, const char *a2, ...)
{
  return [a1 reportDetails];
}

id objc_msgSend_required(void *a1, const char *a2, ...)
{
  return [a1 required];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serverRetryAfterDate(void *a1, const char *a2, ...)
{
  return [a1 serverRetryAfterDate];
}

id objc_msgSend_serverToken(void *a1, const char *a2, ...)
{
  return [a1 serverToken];
}

id objc_msgSend_settingsURL(void *a1, const char *a2, ...)
{
  return [a1 settingsURL];
}

id objc_msgSend_sharedProgram(void *a1, const char *a2, ...)
{
  return [a1 sharedProgram];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
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

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_startRunLoop(void *a1, const char *a2, ...)
{
  return [a1 startRunLoop];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusKeyPaths(void *a1, const char *a2, ...)
{
  return [a1 statusKeyPaths];
}

id objc_msgSend_statusSubscriptionItems(void *a1, const char *a2, ...)
{
  return [a1 statusSubscriptionItems];
}

id objc_msgSend_statusSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 statusSubscriptions];
}

id objc_msgSend_storeDescription(void *a1, const char *a2, ...)
{
  return [a1 storeDescription];
}

id objc_msgSend_storeHelper(void *a1, const char *a2, ...)
{
  return [a1 storeHelper];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subscribedStatusKeyPaths(void *a1, const char *a2, ...)
{
  return [a1 subscribedStatusKeyPaths];
}

id objc_msgSend_symbol(void *a1, const char *a2, ...)
{
  return [a1 symbol];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_ui(void *a1, const char *a2, ...)
{
  return [a1 ui];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_usageLine(void *a1, const char *a2, ...)
{
  return [a1 usageLine];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validateArguments(void *a1, const char *a2, ...)
{
  return [a1 validateArguments];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return [a1 visible];
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePropertyList:toStream:format:options:error:");
}
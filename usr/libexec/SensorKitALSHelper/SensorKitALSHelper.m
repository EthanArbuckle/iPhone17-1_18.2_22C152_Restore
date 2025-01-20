void sub_100003B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003B7C(id a1)
{
  v1 = qword_10002A9C8;
  if (os_log_type_enabled((os_log_t)qword_10002A9C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Connection to CH Service has been interrupted.", v2, 2u);
  }
}

unsigned char *sub_100003BE0(uint64_t a1)
{
  v2 = qword_10002A9C8;
  if (os_log_type_enabled((os_log_t)qword_10002A9C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection to CH Service has been invalidated.", v4, 2u);
  }
  result = objc_loadWeak((id *)(a1 + 32));
  if (result) {
    result[8] = 1;
  }
  return result;
}

uint64_t sub_100003C5C(uint64_t result)
{
  if (result)
  {
    v1 = (void *)result;
    if (*(unsigned char *)(result + 8))
    {

      v1[3] = [(id)objc_opt_class() _connectionToService];
      [v1 _setupConnection];
    }
    return v1[3];
  }
  return result;
}

void sub_100003E58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id sub_100003E74(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 56) <= 1uLL && [a2 code] == (id)4097) {
    unsigned int v4 = [objc_msgSend(a2, "domain") isEqualToString:NSCocoaErrorDomain];
  }
  else {
    unsigned int v4 = 0;
  }
  v5 = qword_10002A9C8;
  if (os_log_type_enabled((os_log_t)qword_10002A9C8, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v7 = @"not";
    if (v4) {
      CFStringRef v7 = &stru_100025350;
    }
    int v8 = 138543618;
    v9 = a2;
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Couldn't connect to CH service because %{public}@. Will %@ attempt to retry", (uint8_t *)&v8, 0x16u);
    if (v4) {
      return [objc_loadWeak((id *)(a1 + 48)) _fetchCustomCategoriesWithRetryAttempt:*(void *)(a1 + 56) + 1 bundleIdentifiers:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    }
  }
  else if (v4)
  {
    return [objc_loadWeak((id *)(a1 + 48)) _fetchCustomCategoriesWithRetryAttempt:*(void *)(a1 + 56) + 1 bundleIdentifiers:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  return (id)(*(uint64_t (**)(void, void *, SRError *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), &__NSDictionary0__struct, +[SRError errorWithCode:8194]);
}

uint64_t sub_100004070(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = qword_10002A9C8;
  if (os_log_type_enabled((os_log_t)qword_10002A9C8, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Couldn't connect to CH service because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, const __CFString *, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), &stru_100025350, +[SRError errorWithCode:8194]);
}

uint64_t sub_1000041D4(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = qword_10002A9C8;
  if (os_log_type_enabled((os_log_t)qword_10002A9C8, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Couldn't connect to CH service because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100004298(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = sub_1000043A8;
  int v8 = sub_1000043B8;
  CFStringRef v9 = &stru_100025350;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004468;
  v3[3] = &unk_1000248F8;
  v3[4] = &v4;
  [objc_msgSend((id)sub_100003C5C(a1), "synchronousRemoteObjectProxyWithErrorHandler:", &stru_1000248D0) fetchVersion:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100004390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000043A8(uint64_t a1, uint64_t a2)
{
}

void sub_1000043B8(uint64_t a1)
{
}

void sub_1000043C4(id a1, NSError *a2)
{
  v3 = qword_10002A9C8;
  if (os_log_type_enabled((os_log_t)qword_10002A9C8, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    v5 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Couldn't connect to CH service because %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_100004468(uint64_t a1, void *a2)
{
  id result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id sub_1000044EC(id result, void *a2)
{
  if (result)
  {
    v3 = result;
    id v4 = [objc_alloc((Class)SRSensorWriter) initWithIdentifier:SRSensorVisits];
    v5 = sub_100006390([RDLaunchEvents alloc], a2, 0, 0);
    id v6 = objc_alloc_init((Class)RTRoutineManager);
    return [v3 initWithLaunchEvents:v5 sensorWriter:v4 routineManager:v6 q:a2];
  }
  return result;
}

NSDate *sub_1000046B8(NSDate *result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"kCurrentMonitoringLastTimestamp"];
    SRAbsoluteTime v3 = SRAbsoluteTimeGetCurrent() + -604800.0;
    [(NSDate *)v1 visitsQueryWindowShift];
    v5 = +[NSDate dateWithSRAbsoluteTime:fmax(v3 - v4, 0.0)];
    id v6 = v5;
    if (v2) {
      v5 = v2;
    }
    return [(NSDate *)v5 laterDate:v6];
  }
  return result;
}

uint64_t sub_100004878(uint64_t a1, void *a2, NSDate *a3)
{
  Weak = (NSDate *)objc_loadWeak((id *)(a1 + 56));
  id v6 = &selRef_set;
  uint64_t v7 = qword_10002A9D0;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v65 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error fetching LOI: %@", buf, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  int v8 = Weak;
  if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_INFO))
  {
    CFStringRef v9 = sub_1000046B8(v8);
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v65 = v9;
    __int16 v66 = 2112;
    uint64_t v67 = v10;
    __int16 v68 = 2048;
    id v69 = [a2 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fetchLocationsOfInterestVisitedBetweenStartDate: %@ endDate: %@ => got %lu visits", buf, 0x20u);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v44 = [a2 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v44)
  {
    uint64_t v41 = *(void *)v51;
    CFStringRef v11 = &BiomeLibrary_ptr;
    v42 = a2;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(a2);
        }
        v12 = &BiomeLibrary_ptr;
        if (v8)
        {
          v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v48 = *(void **)(a1 + 40);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id obj = [v13 visits];
          id v49 = [obj countByEnumeratingWithState:&v55 objects:buf count:16];
          if (v49)
          {
            uint64_t v47 = *(void *)v56;
            do
            {
              v14 = 0;
              do
              {
                if (*(void *)v56 != v47) {
                  objc_enumerationMutation(obj);
                }
                v15 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v14);
                id v16 = objc_alloc((Class)v11[130]);
                [objc_msgSend(v13, "location") latitude];
                double v18 = v17;
                [objc_msgSend(v13, "location") longitude];
                id v20 = [v16 initWithLatitude:v18 longitude:v19];
                [v48 distanceFromLocation:v20];
                double v22 = v21;
                if ([v15 entryDate])
                {
                  unsigned int v23 = [[v15 entryDate] isEqualToDate:[v12[138] distantPast]];
                  if (![v15 exitDate])
                  {
                    if (v23)
                    {
LABEL_32:
                      v34 = v6[314];
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v60 = 138543362;
                        id v61 = v15;
                        v35 = v34;
                        v36 = "Arrival date is invalid for %{public}@";
                        goto LABEL_42;
                      }
                    }
                    else
                    {
LABEL_34:
                      v37 = v6[314];
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v60 = 138543362;
                        id v61 = v15;
                        v35 = v37;
                        v36 = "Departure date is invalid for %{public}@";
LABEL_42:
                        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v36, v60, 0xCu);
                      }
                    }

                    goto LABEL_36;
                  }
                  char v24 = v23 ^ 1;
                }
                else
                {
                  if (![v15 exitDate]) {
                    goto LABEL_32;
                  }
                  char v24 = 0;
                }
                unsigned int v25 = [[v15 exitDate] isEqualToDate:[v12[138] distantFuture]];
                if ((v24 & 1) == 0) {
                  goto LABEL_32;
                }
                if (v25) {
                  goto LABEL_34;
                }
                id v26 = sub_100012298(900.0, 900.0, (uint64_t)NSDateInterval, [v15 entryDate]);
                v27 = v6;
                id v28 = sub_100012298(900.0, 900.0, (uint64_t)NSDateInterval, [v15 exitDate]);
                id v29 = objc_alloc((Class)SRVisit);
                v30 = (char *)[v13 type];
                if ((unint64_t)v30 < 4) {
                  v31 = v30 + 1;
                }
                else {
                  v31 = 0;
                }
                id v32 = [v29 initWithDistanceFromHome:v26 arrive:v28 depart:v31 category:[v13 identifier] uuid:v22];
                v33 = v27[314];
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v60 = 138543619;
                  id v61 = v32;
                  __int16 v62 = 2113;
                  v63 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "visit collected: %{public}@ from CR visit: %{private}@", v60, 0x16u);
                }
                v54 = 0;
                if ([(objc_class *)v8[3].super.isa provideSample:v32 error:&v54])
                {
                  [[+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults") setObject:objc_msgSend(objc_msgSend(v15, "entryDate"), "dateByAddingTimeInterval:", 1.0) forKey:@"kCurrentMonitoringLastTimestamp"];
                  id v6 = v27;
                  CFStringRef v11 = &BiomeLibrary_ptr;
                }
                else
                {
                  id v6 = v27;
                  v38 = v27[314];
                  CFStringRef v11 = &BiomeLibrary_ptr;
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v60 = 138543362;
                    id v61 = v54;
                    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to write visit data because %{public}@", v60, 0xCu);
                  }
                }

                v12 = &BiomeLibrary_ptr;
LABEL_36:
                v14 = (char *)v14 + 1;
              }
              while (v49 != v14);
              id v39 = [obj countByEnumeratingWithState:&v55 objects:buf count:16];
              id v49 = v39;
            }
            while (v39);
          }
        }
        a2 = v42;
      }
      id v44 = [v42 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v44);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100004F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004FB0(uint64_t a1, void *a2, uint64_t a3)
{
  Weak = (NSDate *)objc_loadWeak((id *)(a1 + 40));
  if (a3)
  {
    uint64_t v7 = qword_10002A9D0;
    if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error fetching LOI for home: %@", buf, 0xCu);
    }
LABEL_4:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    return;
  }
  if (!a2 || (int v8 = Weak, ![a2 count]))
  {
    v27 = qword_10002A9D0;
    if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "No LOIs found for home", buf, 2u);
    }
    goto LABEL_4;
  }
  id v9 = [a2 firstObject];
  uint64_t v10 = qword_10002A9D0;
  if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Home LOI at %@", buf, 0xCu);
  }
  id v11 = objc_alloc((Class)CLLocation);
  [objc_msgSend(v9, "location") latitude];
  double v13 = v12;
  [objc_msgSend(v9, "location") longitude];
  id v15 = [v11 initWithLatitude:v13 longitude:v14];
  if (v8)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    double v17 = sub_1000046B8(v8);
    double Current = SRAbsoluteTimeGetCurrent();
    [(NSDate *)v8 visitsQueryWindowShift];
    id v20 = +[NSDate dateWithSRAbsoluteTime:fmax(Current - v19, 0.0)];
    [(NSDate *)v20 timeIntervalSinceDate:v17];
    double v22 = v21;
    [(NSDate *)v8 visitsQueryWindowShift];
    if (v22 >= v23)
    {
      objc_initWeak(&location, v8);
      Class isa = v8[4].super.isa;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100004878;
      v31 = (NSDate *)&unk_100024920;
      objc_copyWeak(v34, &location);
      *((void *)&v32 + 1) = v15;
      uint64_t v33 = v16;
      *(void *)&long long v32 = v20;
      [(objc_class *)isa fetchLocationsOfInterestVisitedBetweenStartDate:v17 endDate:v20 withHandler:buf];
      objc_destroyWeak(v34);
      objc_destroyWeak(&location);
    }
    else
    {
      char v24 = qword_10002A9D0;
      if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v25 = +[NSDate now];
        [(NSDate *)v8 visitsQueryWindowShift];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2114;
        v31 = v20;
        LOWORD(v32) = 2050;
        *(void *)((char *)&v32 + 2) = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Time before now (%{public}@). Time interval (%{public}@ - %{public}@) is less than interval required for correct LOIs fetching (%{public}f)", buf, 0x2Au);
      }
      (*(void (**)(uint64_t))(v16 + 16))(v16);
    }
  }
}

void sub_100005324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100005580(uint64_t a1)
{
  return [*(id *)(a1 + 32) markCompleted];
}

id sub_100005730(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)ALSRecorder;
  id v3 = [super init];
  if (v3)
  {
    *((void *)v3 + 4) = a2;
    *((void *)v3 + 2) = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    *((void *)v3 + 1) = [objc_alloc((Class)SRSensorWriter) initWithIdentifier:SRSensorAmbientLightSensor];
    double v4 = (id *)sub_100006390([RDLaunchEvents alloc], a2, 0, 0);
    *((void *)v3 + 5) = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
    [*((id *)v3 + 1) setDelegate:v3];
  }
  return v3;
}

void sub_10000599C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000059B8(uint64_t a1, uint64_t a2, __IOHIDServiceClient *a3)
{
  if (a2)
  {
    if (a3)
    {
      if (IOHIDEventGetType() == 12)
      {
        v5 = *(void **)(a2 + 8);
        if (v5)
        {
          if ([v5 isMonitoring])
          {
            objc_super v6 = *(void **)(a2 + 16);
            if (v6)
            {
              uint64_t v34 = 0;
              v35 = &v34;
              uint64_t v36 = 0x4010000000;
              v37 = &unk_10001E761;
              long long v38 = 0u;
              long long v39 = 0u;
              uint64_t v30 = 0;
              v31 = &v30;
              uint64_t v32 = 0x2020000000;
              char v33 = 0;
              v29[0] = _NSConcreteStackBlock;
              v29[1] = 3221225472;
              v29[2] = sub_100005CF4;
              v29[3] = &unk_100024998;
              v29[5] = &v34;
              v29[6] = a3;
              v29[4] = &v30;
              [v6 enumerateObjectsUsingBlock:v29];
              if (!*((unsigned char *)v31 + 24))
              {
                v35[4] = 0;
                CFNumberRef v7 = (const __CFNumber *)IOHIDServiceClientCopyProperty(a3, @"crgb");
                if (v7)
                {
                  CFTypeID TypeID = CFNumberGetTypeID();
                  if (TypeID == CFGetTypeID(v7))
                  {
                    LODWORD(v26) = 0;
                    CFNumberGetValue(v7, kCFNumberIntType, &v26);
                    if ((int)v26 >= 1) {
                      v35[4] = 1;
                    }
                  }
                  CFRelease(v7);
                }
                v35[5] = 0;
                CFNumberRef v9 = (const __CFNumber *)IOHIDServiceClientCopyProperty(a3, @"Orientation");
                CFNumberRef v10 = v9;
                if (v9)
                {
                  CFTypeID v11 = CFGetTypeID(v9);
                  if (v11 == CFNumberGetTypeID())
                  {
                    LODWORD(v26) = 0;
                    CFNumberGetValue(v10, kCFNumberSInt32Type, &v26);
                    v35[5] = (int)v26;
                  }
                  CFRelease(v10);
                }
                long long v12 = *((_OWORD *)v35 + 2);
                long long v28 = *((_OWORD *)v35 + 3);
                long long v27 = v12;
                uint64_t v26 = a3;
                id v13 = [objc_alloc((Class)NSValue) initWithBytes:&v26 objCType:"{?=^{__IOHIDServiceClient}{?=qqf{?=ff}}}"];
                if (v13)
                {
                  [*(id *)(a2 + 16) addObject:v13];
                }
              }
              IOHIDEventGetFloatValue();
              *(float *)&double v14 = v14;
              *((_DWORD *)v35 + 12) = LODWORD(v14);
              IOHIDEventGetDoubleValue();
              double v16 = v15;
              IOHIDEventGetDoubleValue();
              double v18 = v17;
              IOHIDEventGetDoubleValue();
              double v20 = v16 + v18 + v19;
              if (v20 == 0.0)
              {
                float v21 = 0.0;
                float v22 = 0.0;
              }
              else
              {
                float v21 = v16 / v20;
                float v22 = v18 / v20;
              }
              double v23 = (float *)v35;
              *((float *)v35 + 13) = v21;
              v23[14] = v22;
              id v24 = objc_alloc((Class)SRAmbientLightSample);
              id v25 = [v24 initWithSRALSSampleStruct:v35 + 4];
              if (v25)
              {
                [*(id *)(a2 + 8) provideSample:v25];
              }
              _Block_object_dispose(&v30, 8);
              _Block_object_dispose(&v34, 8);
            }
          }
        }
      }
    }
  }
}

void sub_100005CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

__n128 sub_100005CF4(void *a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(v6, 0, 40);
    [a2 getValue:v6];
    if (*(void *)&v6[0] == a1[6])
    {
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
      uint64_t v5 = *(void *)(a1[5] + 8);
      __n128 result = *(__n128 *)((char *)&v6[1] + 8);
      *(_OWORD *)(v5 + 32) = *(_OWORD *)((char *)v6 + 8);
      *(__n128 *)(v5 + 48) = result;
    }
  }
  return result;
}

void sub_100005FC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006310(id a1)
{
  qword_10002A9F8 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogBMEventSession");
}

void *sub_100006390(void *a1, void *a2, void *a3, void *a4)
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)RDLaunchEvents;
  CFNumberRef v7 = [super init];
  if (v7)
  {
    v7[4] = a3;
    v7[3] = a4;
    objc_setProperty_nonatomic(v7, v8, a2, 16);
  }
  return v7;
}

RDXPCActivity *sub_100006494(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.updateCompanionWithSamples"])
  {
    uint64_t v4 = *(void *)(a1 + 24);
    return sub_100009244((uint64_t)RDXPCActivity, v4);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.removeOldData"])
  {
    return sub_1000094DC();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.postMetric"])
  {
    return sub_1000096A4();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.launchAlsRecorder"])
  {
    return sub_100009770();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.launchUsageCollector"])
  {
    return sub_100009850();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.launchInteractionHistoryCollector"])
  {
    return sub_100009900();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.fetchStrideCalibration"])
  {
    return sub_100009998();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.fetchVisits"])
  {
    return sub_100009A48();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.decryptArchives"])
  {
    return sub_100009BA8();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.syncCompanionStateToGizmo"])
  {
    uint64_t v6 = *(void *)(a1 + 24);
    return sub_100009C70((uint64_t)RDXPCActivity, v6);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.syncCompanionStateToGizmoLocked"])
  {
    uint64_t v7 = *(void *)(a1 + 24);
    return sub_100009DB8((uint64_t)RDXPCActivity, v7);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.prepareArchives"])
  {
    SEL v8 = *(id **)(a1 + 24);
    return sub_100009388((uint64_t)RDXPCActivity, v8);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.gcKeys"])
  {
    return sub_1000095A8();
  }
  if (![a2 isEqualToString:@"com.apple.sensorkit.launchMediaEventsRecorder"]) {
    return 0;
  }

  return sub_100009B10();
}

void sub_1000067E0(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_100006864;
  v1[3] = &unk_1000249F0;
  long long v2 = *(_OWORD *)(a1 + 32);
  _os_activity_initiate((void *)&_mh_execute_header, "Running XPC Activity", OS_ACTIVITY_FLAG_DEFAULT, v1);
}

id sub_100006864(uint64_t a1)
{
  return [*(id *)(a1 + 32) launchEventRunActivity:*(void *)(a1 + 40)];
}

void sub_100006AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_100006AFC(uint64_t a1, _xpc_activity_s *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (!Weak) {
    goto LABEL_31;
  }
  uint64_t v6 = (uint64_t)Weak;
  uint64_t v7 = *(void **)(a1 + 32);
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  objc_super v10 = sub_100006494(v6, v7);
  if (!v10)
  {
    CFTypeID v11 = qword_10002AA00;
    if (os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long v27 = 138543362;
      *(void *)&v27[4] = v7;
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to create and activity named %{public}@", v27, 0xCu);
    }
  }
  if (state == 2)
  {
    if (v10) {
      objc_setProperty_nonatomic(v10, v9, a2, 24);
    }
    id v16 = objc_loadWeak((id *)(v6 + 8));
    if (v16)
    {
      id v17 = v16;
      if (objc_opt_respondsToSelector())
      {
        sub_10000A0E8((uint64_t)v10, 4);
        uint64_t v18 = *(NSObject **)(v6 + 16);
        *(void *)long long v27 = _NSConcreteStackBlock;
        *(void *)&v27[8] = 3221225472;
        *(void *)&v27[16] = sub_1000067E0;
        long long v28 = &unk_1000249F0;
        id v29 = v17;
        uint64_t v30 = v10;
        dispatch_async(v18, v27);
        goto LABEL_31;
      }
      uint64_t v26 = qword_10002AA00;
      if (!os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)long long v27 = 0;
      double v23 = "Delegate does not support receiving launch events based on XPC activities";
      id v24 = v26;
      uint32_t v25 = 2;
    }
    else
    {
      uint64_t v21 = qword_10002AA00;
      if (!os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_INFO))
      {
LABEL_30:
        [(RDXPCActivity *)v10 markCompleted];
        goto LABEL_31;
      }
      if (v10) {
        name = v10->_name;
      }
      else {
        name = 0;
      }
      *(_DWORD *)long long v27 = 138543362;
      *(void *)&v27[4] = name;
      double v23 = "No delegate available to run xpc activity %{public}@";
      id v24 = v21;
      uint32_t v25 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v23, v27, v25);
    goto LABEL_30;
  }
  if (state)
  {
    double v19 = qword_10002AA00;
    if (os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_DEBUG))
    {
      if (v10) {
        double v20 = v10->_name;
      }
      else {
        double v20 = 0;
      }
      *(_DWORD *)long long v27 = 134349314;
      *(void *)&v27[4] = state;
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Unexpected xpc activity state %{public}ld for activity %{public}@", v27, 0x16u);
    }
  }
  else
  {
    long long v12 = qword_10002AA00;
    if (os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_DEFAULT))
    {
      if (v10) {
        id v13 = v10->_name;
      }
      else {
        id v13 = 0;
      }
      *(_DWORD *)long long v27 = 138543362;
      *(void *)&v27[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking in for %{public}@", v27, 0xCu);
    }
    sub_100009FA8((uint64_t)v10, a2);
    id v14 = objc_loadWeak((id *)(v6 + 8));
    if (v10)
    {
      double v15 = v14;
      if (objc_opt_respondsToSelector()) {
        [v15 launchEventCheckInActivity:v10];
      }
    }
  }
LABEL_31:
}

void sub_100007074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007098(uint64_t a1, uint64_t a2)
{
  id Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  if (Weak) {
    id v4 = objc_loadWeak(Weak + 1);
  }
  else {
    id v4 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100007158;
    v5[3] = &unk_1000249F0;
    v5[4] = v4;
    v5[5] = a2;
    _os_activity_initiate((void *)&_mh_execute_header, "Running XPC Event Handler", OS_ACTIVITY_FLAG_DEFAULT, v5);
  }
}

void sub_100007158(uint64_t a1)
{
  [*(id *)(a1 + 32) launchEventXPCEventReceived:*(void *)(a1 + 40)];
}

id sub_1000071F4(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)StrideCalibrationRecorder;
  id v3 = [super init];
  if (v3)
  {
    id v4 = objc_alloc((Class)SRSensorWriter);
    *((void *)v3 + 3) = [v4 initWithIdentifier:SRSensorStrideCalibration];
    *((void *)v3 + 1) = a2;
    uint64_t v5 = (id *)sub_100006390([RDLaunchEvents alloc], a2, 0, 0);
    *((void *)v3 + 2) = v5;
    if (v5) {
      objc_storeWeak(v5 + 1, v3);
    }
    [*((id *)v3 + 3) setDelegate:v3];
  }
  return v3;
}

id sub_1000082E0(uint64_t a1, void *a2)
{
  id v4 = [0 componentsSeparatedByString:@"."];
  uint64_t v5 = (char *)[v4 count];
  do
  {
    if (!v5) {
      break;
    }
    id v6 = [[objc_msgSend(v4, "subarrayWithRange:", 0, v5) componentsJoinedByString:@"."];
    id v7 = a2;
    if ([v6 length]) {
      id v7 = [v6 stringByAppendingFormat:@".%@", a2];
    }
    if ([*(id *)(a1 + 24) objectForKey:v7]) {
      return v7;
    }
    --v5;
  }
  while (![[v4 objectAtIndexedSubscript:v5] isEqualToString:@"tombstones"]);
  return a2;
}

uint64_t sub_1000083D0(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = [(uint64_t)[*(id *)(result + 24) integerForKey:sub_1000082E0(result, @"UpdateCompanionIntervalSeconds")];
    return v1 & ~(v1 >> 63);
  }
  return result;
}

uint64_t sub_100008414(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = [(id)[*(id *)(result + 24) integerForKey:sub_1000082E0(result, @"PrepareArchivesIntervalSeconds")];
    return v1 & ~(v1 >> 63);
  }
  return result;
}

id *sub_100008458(id *result)
{
  if (result) {
    return (id *)[result[3] BOOLForKey:@"PrepareArchivesDiskIntensive"];
  }
  return result;
}

id *sub_100008470(id *result)
{
  if (result) {
    return (id *)[result[3] BOOLForKey:@"PrepareArchivesCPUIntensive"];
  }
  return result;
}

uint64_t sub_100008488(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)[*(id *)(result + 24) integerForKey:[sub_1000082E0(result, @"SyncCompanionStateToGizmoInterval")];
    return v1 & ~(v1 >> 63);
  }
  return result;
}

id *sub_100008768(id *a1, void *a2)
{
  long long v2 = a1;
  if (a1)
  {
    id v4 = [objc_alloc((Class)SRSensorWriter) initWithIdentifier:SRSensorMediaEvents];
    uint64_t v5 = sub_100006390([RDLaunchEvents alloc], a2, 0, 0);
    v8.receiver = v2;
    v8.super_class = (Class)MediaEventsRecorder;
    long long v2 = (id *)[super init];
    if (v2)
    {
      v2[3] = v4;
      v2[1] = a2;
      id v6 = v5;
      v2[2] = v6;
      if (v6) {
        objc_storeWeak(v6 + 1, v2);
      }
      [v2[3] setDelegate:v2];
    }
  }
  return v2;
}

uint64_t sub_1000088AC(uint64_t a1, void *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  id v5 = [a2 state];
  id v6 = qword_10002AA18;
  if (v5 == (id)1)
  {
    if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = [a2 error];
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Media events query failed because %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Media events query is completed", (uint8_t *)&v8, 2u);
    }
    if (Weak) {
      [+[NSUserDefaults standardUserDefaults] setObject:*(void *)(a1 + 32) forKey:@"lastMediaEventsCollectingDate"];
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000089EC(uint64_t a1, void *a2)
{
  [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id Weak = objc_loadWeak((id *)(a1 + 32));
    id v5 = [a2 eventBody];
    id v6 = qword_10002AA18;
    if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_INFO))
    {
      int v17 = 138477827;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got media rendered event %{private}@", (uint8_t *)&v17, 0xCu);
    }
    [objc_msgSend(v5, "absoluteTimestamp") srAbsoluteTime];
    double v8 = v7;
    id v9 = [[[v5 mediaAttributes] firstObject] UUID];
    if (v9)
    {
      id v10 = v9;
      if ([v5 isOnScreen]) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      id v12 = [objc_alloc((Class)SRMediaEvent) initWithMediaIdentifier:v10 eventType:v11];
      id v13 = qword_10002AA18;
      if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138477827;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SRMediaEvent: %{private}@", (uint8_t *)&v17, 0xCu);
      }
      if (Weak) {
        id v14 = (void *)Weak[3];
      }
      else {
        id v14 = 0;
      }
      [v14 provideSample:v12 timestamp:v8];
    }
    else
    {
      id v16 = qword_10002AA18;
      if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138477827;
        id v18 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Media identifier is nil for:%{private}@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    double v15 = qword_10002AA18;
    if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_FAULT))
    {
      int v17 = 138477827;
      id v18 = a2;
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Unexpected object received during media events collection: %{private}@", (uint8_t *)&v17, 0xCu);
    }
  }
}

void sub_100009178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000091A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) markCompleted];
}

RDXPCActivity *sub_100009244(uint64_t a1, uint64_t a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  int64_t v4 = sub_1000083D0(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, v4);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  id v5 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.updateCompanionWithSamples", (uint64_t)v3);
  xpc_release(v3);
  return v5;
}

RDXPCActivity *sub_100009338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  self;
  id v5 = [[RDXPCActivity alloc] initWithName:a2 criteria:a3];

  return v5;
}

RDXPCActivity *sub_100009388(uint64_t a1, id *a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  int64_t v4 = (const char *)XPC_ACTIVITY_CPU_INTENSIVE;
  unsigned __int8 v5 = sub_100008470(a2);
  xpc_dictionary_set_BOOL(v3, v4, v5);
  id v6 = (const char *)XPC_ACTIVITY_DISK_INTENSIVE;
  unsigned __int8 v7 = sub_100008458(a2);
  xpc_dictionary_set_BOOL(v3, v6, v7);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  int64_t v8 = sub_100008414((uint64_t)a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, v8);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  id v9 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.prepareArchives", (uint64_t)v3);
  xpc_release(v3);
  return v9;
}

RDXPCActivity *sub_1000094DC()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v0, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.removeOldData", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_1000095A8()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v0, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.gcKeys", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_1000096A4()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v0, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.postMetric", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009770()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_15_MIN);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REPEATING, 1);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.launchAlsRecorder", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009850()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.launchUsageCollector", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009900()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.launchInteractionHistoryCollector", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009998()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.fetchStrideCalibration", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009A48()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.fetchVisits", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009B10()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.launchMediaEventsRecorder", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009BA8()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_8_HOURS);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  uint64_t v1 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.decryptArchives", (uint64_t)v0);
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100009C70(uint64_t a1, uint64_t a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  int64_t v4 = sub_100008488(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, v4);
  uint64_t v5 = sub_100008488(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, 2 * v5);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  id v6 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.syncCompanionStateToGizmo", (uint64_t)v3);
  xpc_release(v3);
  return v6;
}

RDXPCActivity *sub_100009DB8(uint64_t a1, uint64_t a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  uint64_t v4 = sub_100008488(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 2 * v4);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  uint64_t v5 = sub_100009338((uint64_t)RDXPCActivity, @"com.apple.sensorkit.syncCompanionStateToGizmoLocked", (uint64_t)v3);
  xpc_release(v3);
  return v5;
}

uint64_t sub_100009FA8(uint64_t result, xpc_activity_t activity)
{
  if (result)
  {
    uint64_t v3 = result;
    xpc_object_t v4 = xpc_activity_copy_criteria(activity);
    if (!v4 || !xpc_equal(v4, *(xpc_object_t *)(v3 + 16))) {
      xpc_activity_set_criteria(activity, *(xpc_object_t *)(v3 + 16));
    }
    return _objc_release_x2();
  }
  return result;
}

void sub_10000A0E8(uint64_t a1, xpc_activity_state_t a2)
{
  if (a1 && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 24), a2))
  {
    xpc_object_t v4 = qword_10002AA20;
    if (os_log_type_enabled((os_log_t)qword_10002AA20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 8);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2050;
      xpc_activity_state_t v9 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to mark the activity %{public}@ as %{public}ld", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_10000A610(id a1)
{
  qword_10002AA30 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogBMStoreEvent");
}

void sub_10000AF6C(id a1)
{
  qword_10002AA40 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogSRDeviceUsageDefaults");
}

void sub_10000AF9C(id a1)
{
  uint64_t v1 = (void *)MGCopyAnswer();
  if (v1)
  {
    long long v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFStringGetTypeID()) {
      qword_10002AA50 = (uint64_t)[v2 copy];
    }
    CFRelease(v2);
  }
}

void start()
{
  inactive = dispatch_workloop_create_inactive("com.apple.SensorKitALSHelper.main");
  dispatch_set_qos_class_fallback();
  dispatch_activate(inactive);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = sub_10000B2A0;
  v9[4] = sub_10000B2B0;
  v9[5] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = sub_10000B2A0;
  v8[4] = sub_10000B2B0;
  v8[5] = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = sub_10000B2A0;
  v7[4] = sub_10000B2B0;
  v7[5] = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  _OWORD v6[3] = sub_10000B2A0;
  v6[4] = sub_10000B2B0;
  v6[5] = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_10000B2A0;
  v5[4] = sub_10000B2B0;
  v5[5] = 0;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = sub_10000B2A0;
  v4[4] = sub_10000B2B0;
  v4[5] = 0;
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3052000000;
  v3[3] = sub_10000B2A0;
  v3[4] = sub_10000B2B0;
  void v3[5] = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000B2BC;
  v2[3] = &unk_100024B90;
  v2[4] = inactive;
  v2[5] = v5;
  v2[6] = v9;
  v2[7] = v8;
  v2[8] = v7;
  v2[9] = v6;
  v2[10] = v3;
  v2[11] = v4;
  dispatch_async_and_wait(inactive, v2);
  dispatch_main();
}

void sub_10000B240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Block_object_dispose((const void *)(v39 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10000B2A0(uint64_t a1, uint64_t a2)
{
}

void sub_10000B2B0(uint64_t a1)
{
}

id sub_10000B2BC(uint64_t a1)
{
  long long v2 = [SRCHClient alloc];
  if (v2) {
    long long v2 = -[SRCHClient initWithQueue:XPCConnection:](v2, "initWithQueue:XPCConnection:", *(void *)(a1 + 32), [(id)objc_opt_class() _connectionToService]);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = sub_100006390([RDLaunchEvents alloc], *(void **)(a1 + 32), 0, 0);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = sub_100005730([ALSRecorder alloc], *(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = sub_100012A18([UsageReportGenerator alloc], *(void **)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40));
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = sub_1000071F4([StrideCalibrationRecorder alloc], *(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = sub_1000044EC([VisitCollector alloc], *(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = sub_100008768((id *)[MediaEventsRecorder alloc], *(void **)(a1 + 32));
  CFTypeID v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v3 registerForXPCEvent:@"com.apple.notifyd.matching"];
}

void sub_10000BD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BDA4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 64));
  if (a2)
  {
    [Weak cleanUp];
    [*(id *)(a1 + 32) markCompleted];

    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    uint64_t v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error fetching service data from Biome. %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000BEF4;
    v7[3] = &unk_100024BD8;
    v7[4] = Weak;
    int8x16_t v6 = *(int8x16_t *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 32);
    int8x16_t v9 = vextq_s8(v6, v6, 8uLL);
    [Weak queryStreamDataForInterval:v6.i64[0] completionHandler:v7];
  }
}

void sub_10000BEF4(uint64_t a1, void *a2)
{
  CFTypeID v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 cleanUp];
    [*(id *)(a1 + 40) markCompleted];

    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    uint64_t v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error fetching stream data from Biome. %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v3) {
      CFTypeID v3 = (void *)v3[12];
    }
    id v6 = [[objc_msgSend(v3, "allKeys") sortedArrayUsingComparator:&stru_100024BB0];
    uint64_t v30 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v27;
      *(void *)&long long v8 = 138412290;
      long long v25 = v8;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v11);
          uint64_t v14 = *(void *)(a1 + 32);
          if (v14) {
            double v15 = *(void **)(v14 + 96);
          }
          else {
            double v15 = 0;
          }
          id v16 = [v15 objectForKeyedSubscript:v12, v25];
          id v17 = v16;
          uint64_t v18 = *(void *)(a1 + 32);
          if (v18) {
            double v19 = *(void **)(v18 + 104);
          }
          else {
            double v19 = 0;
          }
          [v16 startTime];
          [v19 provideSample:v17 timestamp:&v30];
          if (v30)
          {
            if (qword_10002AA58 != -1) {
              dispatch_once(&qword_10002AA58, &stru_100025058);
            }
            double v20 = qword_10002AA60;
            if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v25;
              id v32 = v30;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to write device usage sample because %@", buf, 0xCu);
            }
            uint64_t v30 = 0;
          }
          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v21 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
        id v9 = v21;
      }
      while (v21);
    }
    [*(id *)(a1 + 32) cleanUp];
    [*(id *)(a1 + 32) setLastDeviceUsageQueryDate:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) markCompleted];

    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    float v22 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [*(id *)(a1 + 64) startDate];
      id v24 = [*(id *)(a1 + 64) endDate];
      *(_DWORD *)buf = 138543618;
      id v32 = v23;
      __int16 v33 = 2114;
      id v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Querying device usage for interval:%{public}@ - %{public}@ is completed", buf, 0x16u);
    }
  }
}

int64_t sub_10000C240(id a1, NSDateInterval *a2, NSDateInterval *a3)
{
  return [(NSDateInterval *)a2 compare:a3];
}

int64_t sub_10000C390(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  [(BMStoreEvent *)a2 sr_eventTimestamp];
  double v5 = v4;
  [(BMStoreEvent *)a3 sr_eventTimestamp];
  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

BOOL sub_10000C60C(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];

  return [v2 starting];
}

BOOL sub_10000C638(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") starting];
}

NSCopying *__cdecl sub_10000C65C(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];

  return (NSCopying *)[v2 bundleID];
}

BOOL sub_10000C688(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") usageState] == 3];
}

BOOL sub_10000C6B0(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") usageState] == 1];
}

NSCopying *__cdecl sub_10000C6D8(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];

  return (NSCopying *)[v2 uniqueID];
}

BOOL sub_10000C704(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];

  return [v2 starting];
}

BOOL sub_10000C730(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") starting];
}

BOOL sub_10000C754(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") backlightLevel] != 0;
}

BOOL sub_10000C77C(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") backlightLevel] == 0;
}

BOOL sub_10000C7A4(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") starting];
}

BOOL sub_10000C7C8(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];

  return [v2 starting];
}

int64_t sub_10000C7F4(id a1, BMEventSession *a2, BMEventSession *a3)
{
  [(BMEventSession *)a2 sr_eventTimestamp];
  double v5 = v4;
  [(BMEventSession *)a3 sr_eventTimestamp];
  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

void sub_10000CAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL sub_10000CB04(id a1, BMStoreEvent *a2)
{
  return [[-[BMStoreEvent eventBody](a2, "eventBody") starting];
}

BOOL sub_10000CB28(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];

  return [v2 starting];
}

uint64_t sub_10000CB54(uint64_t a1, void *a2, uint64_t a3)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  if ([a2 state] == (id)1)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v7 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = [a2 error];
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to query streams for service data because %{public}@", (uint8_t *)&v15, 0xCu);
    }
    return (*(uint64_t (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [a2 error]);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v9 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Query of streams for service data is completed", (uint8_t *)&v15, 2u);
    }
    id v10 = +[BMEventSession openSessionsFromBookmark:a3];
    if ([v10 count])
    {
      id v11 = [[[v10 objectAtIndexedSubscript:0] events] firstObject];
      [v11 eventBody];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = objc_alloc((Class)NSDateInterval);
        [v11 sr_eventTimestamp];
        id v13 = [v12 initWithStartDate:[NSDate dateWithTimeIntervalSinceReferenceDate:] endDate:[*(id *)(a1 + 32) endDate]];
        if (Weak) {
          uint64_t v14 = (void *)Weak[28];
        }
        else {
          uint64_t v14 = 0;
        }
        [v14 addObject:v13];
      }
    }
    [Weak setServiceDataSessionPublisherBookmark:a3];
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
}

void sub_10000CDB8(uint64_t a1, void *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if ((unint64_t)objc_msgSend(objc_msgSend(a2, "events"), "count") > 1)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    double v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = [a2 events];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session events: %@", buf, 0xCu);
    }
    id v21 = a2;
    id v6 = [a2 events:Weak];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v10);
          if (qword_10002AA58 != -1) {
            dispatch_once(&qword_10002AA58, &stru_100025058);
          }
          id v12 = qword_10002AA60;
          if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
          {
            id v13 = [v11 eventBody];
            *(_DWORD *)buf = 138412290;
            id v28 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "###Event: %@", buf, 0xCu);
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }
    id v14 = [v6 firstObject];
    id v15 = [v6 lastObject];
    [v21 sr_data];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = objc_alloc((Class)NSDateInterval);
      [v14 sr_eventTimestamp];
      id v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v15 sr_eventTimestamp];
      id v18 = [v16 initWithStartDate:v17 endDate:[NSDate dateWithTimeIntervalSinceReferenceDate:]];
      if (v20) {
        double v19 = *(void **)(v20 + 224);
      }
      else {
        double v19 = 0;
      }
      [v19 addObject:v18];
    }
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    double v4 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Invalid number of events in event sessions: %@", buf, 0xCu);
    }
  }
}

void sub_10000D408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,char a33)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10000D43C(uint64_t a1, uint64_t a2)
{
}

void sub_10000D44C(uint64_t a1)
{
}

void sub_10000D458(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    double v4 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      uint64_t v6 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to query single event streams because %{public}@", (uint8_t *)&v5, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000D548(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    double v4 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      uint64_t v6 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to query streams with paired events because %{public}@", (uint8_t *)&v5, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_10000D638(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v2 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to query Biome streams", buf, 2u);
    }
    return (id)(*(uint64_t (**)(void, SRError *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), +[SRError errorWithCode:8194]);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    double v4 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Data fetching is completed", buf, 2u);
    }
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000D7E8;
    v5[3] = &unk_100024F20;
    id Weak = objc_loadWeak((id *)(a1 + 72));
    long long v7 = *(_OWORD *)(a1 + 40);
    return [Weak fetchCategoriesWithCompletionHandler:v5];
  }
}

uint64_t sub_10000D7E8(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    [*(id *)(a1 + 32) processPendingEventsForInterval:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) processInProgressEventsForInterval:*(void *)(a1 + 40)];
  }
  CFTypeID v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void sub_10000DB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  long long v23 = v21;
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DB80(uint64_t a1, void *a2)
{
  id Weak = (id *)objc_loadWeak((id *)(a1 + 40));
  if ([a2 state] == (id)1)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    int v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = [a2 error];
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Single event streams query failed because %{public}@", (uint8_t *)&v10, 0xCu);
    }
    return (*(uint64_t (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [a2 error]);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    long long v7 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Single event streams query is completed", (uint8_t *)&v10, 2u);
    }
    if (Weak)
    {
      [Weak[31] setLastDeviceUsageActivityLevelEvent:Weak[30]];
      id v8 = Weak[29];
      id v9 = Weak[31];
    }
    else
    {
      [0 setLastDeviceUsageActivityLevelEvent:0];
      id v8 = 0;
      id v9 = 0;
    }
    [v9 setLastDeviceUsageMotionActivityEvent:v8];
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
  }
}

void sub_10000DD40(uint64_t a1, void *a2)
{
  id Weak = (id *)objc_loadWeak((id *)(a1 + 40));
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  int v5 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (NSString *)[a2 eventBody];
    [a2 sr_eventTimestamp];
    uint64_t v8 = v7;
    [a2 sr_eventTimestamp];
    int v18 = 138412802;
    double v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    long long v23 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Event:%@, timestamp:%f, date:%@", (uint8_t *)&v18, 0x20u);
  }
  [a2 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v10 = [a2 eventBody];
  id v11 = v10;
  if (isKindOfClass)
  {
    if (![v10 bundleID]) {
      return;
    }
    if (Weak)
    {
      [Weak[16] addObject:a2];
      id v12 = Weak[22];
    }
    else
    {
      [0 addObject:a2];
      id v12 = 0;
    }
    id v13 = [v11 bundleID];
    id v14 = v12;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (Weak) {
      id v14 = Weak[24];
    }
    else {
      id v14 = 0;
    }
    id v13 = a2;
LABEL_14:
    [v14 addObject:v13];
    return;
  }
  [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [Weak recordMotionActivityEventsFor:a2 within:*(void *)(a1 + 32)];
  }
  else
  {
    [a2 eventBody];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [Weak recordActivityLevelEventsFor:a2 within:*(void *)(a1 + 32)];
    }
    else
    {
      if (qword_10002AA58 != -1) {
        dispatch_once(&qword_10002AA58, &stru_100025058);
      }
      id v15 = qword_10002AA60;
      if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
      {
        [a2 eventBody];
        id v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        int v18 = 138412290;
        double v19 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Got unexpected data type:%@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

void sub_10000E2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  long long v25 = v23;
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E32C(uint64_t a1, void *a2, uint64_t a3)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if ([a2 state] == (id)1)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    uint64_t v7 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = [a2 error];
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to query streams with paired events because %{public}@", (uint8_t *)&v10, 0xCu);
    }
    return (*(uint64_t (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [a2 error]);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v9 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Query of streams with paired events is completed", (uint8_t *)&v10, 2u);
    }
    [Weak extractInProgressEventsFromSessionBookmark:a3];
    [Weak setSessionPublisherBookmark:a3];
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
  }
}

void sub_10000E4D8(uint64_t a1, void *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  if ((unint64_t)objc_msgSend(objc_msgSend(a2, "events"), "count") <= 1)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    int v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = a2;
      uint64_t v6 = "Invalid number of events in event sessions: %@";
LABEL_6:
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      return;
    }
    return;
  }
  uint64_t v26 = a1;
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  uint64_t v7 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = [a2 events];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Session events: %@", buf, 0xCu);
  }
  long long v27 = a2;
  id v8 = [a2 events];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v12);
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        id v14 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
        {
          id v15 = [v13 eventBody];
          *(_DWORD *)buf = 138412290;
          id v34 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "###Event: %@", buf, 0xCu);
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }
  id v16 = [v8 firstObject];
  id v17 = [v8 lastObject];
  [v27 sr_data];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [v16 eventBody];
    id v19 = [v18 bundleID];
    if (v19)
    {
      id v20 = v19;
      if ((sub_1000168AC(*(void *)(v26 + 32), (uint64_t)v19) & 1) == 0)
      {
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        long long v24 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v34 = v20;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping bundle id %{public}@ because of its application type", buf, 0xCu);
        }
        return;
      }
    }
    if (!sub_100015198(Weak, (uint64_t)[v18 bundleID]))
    {
      if (Weak) {
        uint64_t v21 = (void *)*((void *)Weak + 20);
      }
      else {
        uint64_t v21 = 0;
      }
      [v21 addObject:[v18 bundleID]];
    }
    if (Weak)
    {
      [*((id *)Weak + 21) addObject:[v18 bundleID]];
      __int16 v22 = (void *)*((void *)Weak + 17);
LABEL_34:
      [v22 addObject:v27];
      return;
    }
    id v25 = [v18 bundleID];
    goto LABEL_52;
  }
  [v27 sr_data];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = [v16 eventBody];
    if (Weak)
    {
      [*((id *)Weak + 23) addObject:[v23 webDomain]];
      __int16 v22 = (void *)*((void *)Weak + 18);
      goto LABEL_34;
    }
    id v25 = [v23 webDomain];
LABEL_52:
    [0 addObject:v25];
    __int16 v22 = 0;
    goto LABEL_34;
  }
  [v27 sr_data];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v17 sr_eventTimestamp];
    [Weak recordDevicePluggedInEventsFor:v16 eventEndDate:[NSDate dateWithTimeIntervalSinceReferenceDate:0] within:*(void *)(v26 + 40)];
  }
  else
  {
    [v27 sr_data];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 sr_eventTimestamp];
      [Weak recordDeviceBacklightEventsFor:v16 eventEndDate:[NSDate dateWithTimeIntervalSinceReferenceDate:NSDate] within:*(void *)(v26 + 40)];
    }
    else
    {
      [v27 sr_data];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v17 sr_eventTimestamp];
        [Weak recordDeviceScreenIsLockedEventsFor:v16 eventEndDate:[NSDate dateWithTimeIntervalSinceReferenceDate:] within:*(void *)(v26 + 40)];
      }
      else
      {
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        int v5 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v27;
          uint64_t v6 = "Got unexpected data type in event session:%@";
          goto LABEL_6;
        }
      }
    }
  }
}

uint64_t sub_10000EF54(void *a1)
{
  uint64_t v2 = [a1 unknown];
  if ([a1 stationary]) {
    v2 |= 2uLL;
  }
  if ([a1 walking]) {
    v2 |= 4uLL;
  }
  if ([a1 running]) {
    v2 |= 8uLL;
  }
  if ([a1 cycling]) {
    v2 |= 0x10uLL;
  }
  if ([a1 automotive]) {
    return v2 | 0x20;
  }
  else {
    return v2;
  }
}

void sub_100010C18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 232));
  _Block_object_dispose((const void *)(v2 - 224), 8);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100010C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    int v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      uint64_t v10 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error fetching categories for bundle IDs. %{public}@", (uint8_t *)&v9, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id Weak = objc_loadWeak((id *)(a1 + 48));
    if (Weak) {
      id Weak = (void *)Weak[25];
    }
    [Weak setDictionary:a2];
    id v8 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v8);
  }
}

void sub_100010DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    int v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      uint64_t v10 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error fetching categories for web domains. %{public}@", (uint8_t *)&v9, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id Weak = objc_loadWeak((id *)(a1 + 48));
    if (Weak) {
      id Weak = (void *)Weak[26];
    }
    [Weak setDictionary:a2];
    id v8 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v8);
  }
}

void sub_100010F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    int v5 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      uint64_t v10 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error fetching custom categories. %{public}@", (uint8_t *)&v9, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id Weak = objc_loadWeak((id *)(a1 + 48));
    if (Weak) {
      id Weak = (void *)Weak[27];
    }
    [Weak setDictionary:a2];
    id v8 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v8);
  }
}

uint64_t sub_100011050(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  uint64_t v2 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      uint64_t v3 = *(void *)(v3 + 200);
    }
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Bundle categories: %@", (uint8_t *)&v11, 0xCu);
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
  }
  double v4 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      uint64_t v5 = *(void *)(v5 + 216);
    }
    int v11 = 138412290;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Bundle supplemental categories: %@", (uint8_t *)&v11, 0xCu);
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
  }
  uint64_t v6 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 208);
    }
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "WebDomain categories: %@", (uint8_t *)&v11, 0xCu);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v8 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error fetching categories", (uint8_t *)&v11, 2u);
    }
    return (*(uint64_t (**)(void, SRError *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), +[SRError errorWithCode:8194]);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    uint64_t v10 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Categories fetching is completed", (uint8_t *)&v11, 2u);
    }
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
  }
}

void sub_100012268(id a1)
{
  qword_10002AA60 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogDeviceUsageReportGenerator");
}

id sub_100012298(double a1, double a2, uint64_t a3, void *a4)
{
  self;
  [a4 timeIntervalSinceReferenceDate];
  id v8 = [objc_alloc((Class)NSDateInterval) initWithStartDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", floor(v7 / a1) * a1) duration:a2];

  return v8;
}

id sub_100012318(uint64_t a1)
{
  if (qword_10002AA68 != -1) {
    dispatch_once(&qword_10002AA68, &stru_100025098);
  }
  uint64_t v2 = (void *)qword_10002AA70;

  return [v2 objectForKeyedSubscript:a1];
}

void sub_10001237C(id a1)
{
  v2[0] = @"com.apple.Health";
  v2[1] = @"com.apple.Fitness";
  v3[0] = SRDeviceUsageCategoryHealthAndFitness;
  v3[1] = SRDeviceUsageCategoryHealthAndFitness;
  qword_10002AA70 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  id v1 = (id)qword_10002AA70;
}

id sub_10001240C(void *a1)
{
  id v1 = [[+[CTCategory _DHToAppStoreCategoriesMap](CTCategory, "_DHToAppStoreCategoriesMap") objectForKeyedSubscript:+[CTCategory _DHIDtoCategoryDisplayNameMap](CTCategory, "_DHIDtoCategoryDisplayNameMap") objectForKeyedSubscript:a1 identifier] firstObject];

  return sub_10001246C((uint64_t)v1);
}

id sub_10001246C(uint64_t a1)
{
  if (qword_10002AA80 != -1) {
    dispatch_once(&qword_10002AA80, &stru_1000252D0);
  }
  uint64_t v2 = (void *)qword_10002AA88;

  return [v2 objectForKeyedSubscript:a1];
}

NSArray *sub_100012604(void *a1, void *a2, void *a3, double a4)
{
  id v7 = [a1 laterDate:[a3 startDate]];
  [objc_msgSend(a2, "earlierDate:", objc_msgSend(a3, "endDate")) timeIntervalSinceDate:v7];
  if (v8 < 0.0) {
    return (NSArray *)&__NSArray0__struct;
  }
  double v10 = v8;
  id v11 = +[NSMutableArray array];
  do
  {
    [objc_msgSend(sub_100012298(a4, a4, (uint64_t)NSDateInterval, v7), "endDate") timeIntervalSinceDate:v7];
    double v13 = fmin(v12, v10);
    id v14 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v7 duration:v13];
    [v11 addObject:v14];

    double v10 = v10 - v13;
    id v7 = [v7 dateByAddingTimeInterval:v13];
  }
  while (v10 > 0.0);

  return +[NSArray arrayWithArray:v11];
}

id sub_100012A18(id result, void *a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_100006390([RDLaunchEvents alloc], a2, 0, 0);
    id v7 = objc_msgSend(v5, "initWithLaunchEvents:knowledgeStore:usageReportWriter:messagesUsageReportWriter:phoneUsageReportWriter:chClient:queue:", v6, +[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"), objc_msgSend(objc_alloc((Class)SRSensorWriter), "initWithIdentifier:", SRSensorDeviceUsageReport), objc_msgSend(objc_alloc((Class)SRSensorWriter), "initWithIdentifier:", SRSensorMessagesUsageReport), objc_msgSend(objc_alloc((Class)SRSensorWriter), "initWithIdentifier:", SRSensorPhoneUsageReport),
           a3,
           a2);

    return v7;
  }
  return result;
}

double sub_100012FE8(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  [+[NSUserDefaults standardUserDefaults] doubleForKey:@"phoneUsageReportInterval"];
  double v2 = v1;
  if (v1 >= 0.0)
  {
    [+[NSUserDefaults standardUserDefaults] doubleForKey:@"messagesUsageReportInterval"];
    if ((int)v2 % (int)v4)
    {
      double v5 = v4;
      uint64_t v6 = qword_10002AA78;
      double v2 = 86400.0;
      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134218240;
        double v9 = v5;
        __int16 v10 = 2048;
        uint64_t v11 = 0x40F5180000000000;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Phone usage report interval must be multiple of message usage report interval (%f). Please set up an appropriate value. Default value (%f) will be applied", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v3 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      int v8 = 134218240;
      double v9 = v2;
      __int16 v10 = 2048;
      uint64_t v11 = 0x40F5180000000000;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Negative value (%f) for phone usage report interval is not supported. Valid range [0..n] seconds. Default value (%f) will be applied", (uint8_t *)&v8, 0x16u);
    }
    return 86400.0;
  }
  return v2;
}

double sub_100013180()
{
  [+[NSUserDefaults standardUserDefaults] doubleForKey:@"messagesUsageReportInterval"];
  double v1 = v0;
  if (v0 >= 0.0) {
    return v0;
  }
  double v2 = qword_10002AA78;
  double v3 = 1800.0;
  if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
  {
    int v5 = 134218240;
    double v6 = v1;
    __int16 v7 = 2048;
    uint64_t v8 = 0x409C200000000000;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Negative value (%f) for messages usage report interval is not supported. Valid range [0..n] seconds. Default value (%f) will be applied", (uint8_t *)&v5, 0x16u);
  }
  return v3;
}

NSDate *sub_100013270(void *a1, double a2)
{
  [a1 timeIntervalSinceReferenceDate];
  double v4 = floor(v3 / a2) * a2;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v4];
}

double sub_1000132B8()
{
  [+[NSUserDefaults standardUserDefaults] doubleForKey:@"queryDateShiftSinceNow"];
  double v1 = v0;
  if (v0 >= 0.0) {
    return v0;
  }
  double v2 = qword_10002AA78;
  double v3 = 86400.0;
  if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
  {
    int v5 = 134218240;
    double v6 = v1;
    __int16 v7 = 2048;
    uint64_t v8 = 0x40F5180000000000;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Negative value (%f) for query shift is not supported. Valid range [0..n] seconds. Default value (%f) will be applied", (uint8_t *)&v5, 0x16u);
  }
  return v3;
}

uint64_t sub_1000134A0(uint64_t a1, void *a2, void *a3)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  if (a3)
  {
    __int16 v7 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v50 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error fetching categories for web domains. %{public}@", buf, 0xCu);
    }
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    double v9 = Weak;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    if (Weak) {
      id Property = objc_getProperty(Weak, v6, 32, 1);
    }
    else {
      id Property = 0;
    }
    id v36 = [Property countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v46;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = v11;
          double v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
          v40 = v12;
          id v13 = [objc_msgSend(v12, "metadata") objectForKeyedSubscript:+[_DKDigitalHealthMetadataKey webDomain](_DKDigitalHealthMetadataKey, "webDomain")];
          if (v13)
          {
            id v14 = v13;
            id v15 = [v12 sr_dateIntervalsInBucketsOf:*(void *)(a1 + 32) duringQueryInterval:900.0];
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v39 = v15;
            id v16 = [v15 countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v42;
              do
              {
                for (i = 0; i != v17; i = (char *)i + 1)
                {
                  if (*(void *)v42 != v18) {
                    objc_enumerationMutation(v39);
                  }
                  id v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                  uint64_t v21 = a2;
                  id v22 = [a2 objectForKeyedSubscript:v14];
                  id v23 = v9;
                  id v24 = [v9 deviceUsageReportForDate:[v20 startDate]];
                  if ((unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v40, "metadata"), "objectForKeyedSubscript:", +[_DKDigitalHealthMetadataKey usageType](_DKDigitalHealthMetadataKey, "usageType")), "integerValue") <= 1)
                  {
                    [v20 duration];
                    if (v25 <= 900.0)
                    {
                      long long v27 = +[SRWebUsage webUsageWithTotalUsageTime:](SRWebUsage, "webUsageWithTotalUsageTime:");
                      id v28 = sub_10001240C(v22);
                      if (v28)
                      {
                        id v29 = v28;
                        id v30 = [objc_msgSend(v24, "mutableWebUsageByCategory") objectForKeyedSubscript:v28];
                        if (!v30)
                        {
                          id v30 = +[NSMutableArray array];
                          [objc_msgSend(v24, "mutableWebUsageByCategory") setObject:v30 forKeyedSubscript:v29];
                        }
                        [v30 addObject:v27];
                      }
                      else
                      {
                        long long v31 = qword_10002AA78;
                        if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543362;
                          long long v50 = v14;
                          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "No category found for %{public}@", buf, 0xCu);
                        }
                      }
                    }
                    else
                    {
                      uint64_t v26 = qword_10002AA78;
                      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138543618;
                        long long v50 = v20;
                        __int16 v51 = 2114;
                        long long v52 = v40;
                        _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Duration too long for web usage. %{public}@, %{public}@", buf, 0x16u);
                      }
                    }
                  }
                  a2 = v21;
                  double v9 = v23;
                }
                id v17 = [v39 countByEnumeratingWithState:&v41 objects:v53 count:16];
              }
              while (v17);
            }
          }
          uint64_t v11 = v38 + 1;
        }
        while ((id)(v38 + 1) != v36);
        id v36 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v36);
    }
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v8();
}

uint64_t sub_1000138EC(uint64_t a1, void *a2, void *a3)
{
  if (!a3)
  {
    id Weak = objc_loadWeak((id *)(a1 + 56));
    __int16 v10 = Weak;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v40 = a1;
    if (Weak) {
      id Weak = objc_getProperty(Weak, v9, 32, 1);
    }
    id obj = Weak;
    id v37 = [Weak countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (!v37)
    {
LABEL_50:
      double v6 = *(uint64_t (**)(void))(*(void *)(v40 + 48) + 16);
      return v6();
    }
    uint64_t v36 = *(void *)v50;
LABEL_9:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v50 != v36) {
        objc_enumerationMutation(obj);
      }
      uint64_t v39 = v11;
      double v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = [v12 sr_dateIntervalsInBucketsOf:*(void *)(v40 + 32) duringQueryInterval:900.0];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v25 = [v24 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v42;
          do
          {
            id v28 = 0;
            do
            {
              if (*(void *)v42 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v28);
              id v30 = [v12 bundleID];
              id v31 = sub_10001240C([a2 objectForKeyedSubscript:v30]);
              if (v31 || (id v31 = sub_100012318((uint64_t)v30)) != 0)
              {
                [v10 addTextInputSessionForInterval:v29 event:v12 category:v31];
              }
              else
              {
                id v32 = qword_10002AA78;
                if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  id v57 = v30;
                  _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "No category found for %{public}@", buf, 0xCu);
                }
              }
              id v28 = (char *)v28 + 1;
            }
            while (v26 != v28);
            id v33 = [v24 countByEnumeratingWithState:&v41 objects:v53 count:16];
            id v26 = v33;
          }
          while (v33);
        }
      }
LABEL_48:
      uint64_t v11 = v39 + 1;
      if ((id)(v39 + 1) == v37)
      {
        id v37 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (!v37) {
          goto LABEL_50;
        }
        goto LABEL_9;
      }
    }
    id v13 = [v12 sr_dateIntervalsInBucketsOf:*(void *)(v40 + 32) duringQueryInterval:900.0];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (!v14) {
      goto LABEL_48;
    }
    id v15 = v14;
    uint64_t v16 = *(void *)v46;
LABEL_15:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v46 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
      if (objc_msgSend(objc_msgSend(objc_msgSend(v12, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream"), "name")))
      {
        id v19 = sub_100013E4C((uint64_t)v10, v12);
        id v20 = sub_10001240C([a2 objectForKeyedSubscript:v19]);
        if (!v20)
        {
          id v20 = sub_100012318((uint64_t)v19);
          if (!v20)
          {
            id v22 = qword_10002AA78;
            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR)) {
              goto LABEL_31;
            }
            goto LABEL_26;
          }
        }
        sub_100013F08(*(id *)(v40 + 40), v18, v12, (uint64_t)v20);
      }
      if (objc_msgSend(objc_msgSend(objc_msgSend(v12, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"), "name")))
      {
        id v19 = [[objc_msgSend(v12, "value") stringValue];
        id v21 = sub_10001240C([a2 objectForKeyedSubscript:v19]);
        if (v21 || (id v21 = sub_100012318((uint64_t)v19)) != 0)
        {
          sub_100014050(v10, v18, v12, (uint64_t)v21);
        }
        else
        {
          id v22 = qword_10002AA78;
          if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
          {
LABEL_31:
            *(_DWORD *)buf = 138543362;
            id v57 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "No category found for %{public}@", buf, 0xCu);
          }
        }
      }
LABEL_26:
      if (v15 == (id)++v17)
      {
        id v23 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
        id v15 = v23;
        if (!v23) {
          goto LABEL_48;
        }
        goto LABEL_15;
      }
    }
  }
  int v5 = qword_10002AA78;
  if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v57 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error fetching categories for web domains. %{public}@", buf, 0xCu);
  }
  double v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

id sub_100013E4C(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v4 = [objc_msgSend(a2, "metadata") objectForKeyedSubscript:+[_DKNotificationUsageMetadataKey bundleID](_DKNotificationUsageMetadataKey, "bundleID")];
  id v5 = [[objc_msgSend(a2, "metadata") objectForKeyedSubscript:+[_DKNotificationUsageMetadataKey identifier](_DKNotificationUsageMetadataKey, "identifier")];
  double v6 = *(void **)(a1 + 112);
  if (v4)
  {
    [v6 setObject:v4 forKeyedSubscript:v5];
    return v4;
  }

  return [v6 objectForKeyedSubscript:v5];
}

id sub_100013F08(id result, void *a2, void *a3, uint64_t a4)
{
  if (result)
  {
    __int16 v7 = result;
    id v8 = sub_100013E4C((uint64_t)result, a3);
    if (v8 && !sub_1000169D4((BOOL)v7, (uint64_t)v8)) {
      id v8 = 0;
    }
    id v9 = [v7 deviceUsageReportForDate:[a2 startDate]];
    id v10 = [[objc_msgSend(a3, "value") stringValue];
    if (qword_10002AA98 != -1) {
      dispatch_once(&qword_10002AA98, &stru_1000252F0);
    }
    id v11 = [(id)qword_10002AA90 objectForKeyedSubscript:v10];
    if (v11) {
      id v12 = [v11 integerValue];
    }
    else {
      id v12 = 0;
    }
    id v13 = +[SRNotificationUsage notificationUsageWithBundleIdentifier:v8 eventType:v12];
    id v14 = [objc_msgSend(v9, "mutableNotificationUsageByCategory") objectForKeyedSubscript:a4];
    if (!v14)
    {
      id v14 = +[NSMutableArray array];
      [objc_msgSend(v9, "mutableNotificationUsageByCategory") setObject:v14 forKeyedSubscript:a4];
    }
    return [v14 addObject:v13];
  }
  return result;
}

void sub_100014050(void *a1, void *a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    [a2 duration];
    if (v8 <= 900.0)
    {
      id v10 = [a1 deviceUsageReportForDate:[a2 startDate]];
      id v11 = [objc_msgSend(a3, "value") stringValue];
      id v12 = sub_100017B84((uint64_t)a1, (uint64_t)v11, v10);
      id v13 = qword_10002AA78;
      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEBUG))
      {
        [v10 startTime];
        int v21 = 138478339;
        id v22 = v12;
        __int16 v23 = 2113;
        id v24 = v11;
        __int16 v25 = 2050;
        uint64_t v26 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Using report app id %{private}@ for bundle id %{private}@ in usageReport starting %{public}f", (uint8_t *)&v21, 0x20u);
      }
      id v14 = [v11 copy];
      if (v11 && !sub_1000169D4((BOOL)a1, (uint64_t)v11)) {
        id v11 = 0;
      }
      [a2 duration];
      double v16 = v15;
      [objc_msgSend(a3, "startDate") srAbsoluteTime];
      [a1 relativeAppStartTimeForReport:v10];
      uint64_t v18 = +[SRApplicationUsage applicationUsageWithBundleIdentifier:v11 reportApplicationIdentifier:v12 totalUsageTime:v16 relativeStartTime:v17];
      [a1 addAppUsage:v18 forBundleId:v14];

      id v19 = [objc_msgSend(v10, "mutableApplicationUsageByCategory") objectForKeyedSubscript:a4];
      if (!v19)
      {
        id v19 = +[NSMutableArray array];
        [objc_msgSend(v10, "mutableApplicationUsageByCategory") setObject:v19 forKeyedSubscript:a4];
      }
      [v19 addObject:v18];
    }
    else
    {
      id v9 = qword_10002AA78;
      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
      {
        int v21 = 138543618;
        id v22 = (NSString *)a2;
        __int16 v23 = 2114;
        id v24 = a3;
        _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Interval too long (%{public}@) for event: %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }
  }
}

void sub_1000142B8(id *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v20 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [a1[4] count]);
    id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [a1[4] count]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = a1[4];
    id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v30;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (objc_msgSend(objc_msgSend(objc_msgSend(v9, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams appWebUsageStream](_DKSystemEventStreams, "appWebUsageStream"), "name")))
            {
              -[v20 addObject:objc_msgSend(objc_msgSend(v9, "metadata"), "objectForKeyedSubscript:", +[_DKDigitalHealthMetadataKey webDomain](_DKDigitalHealthMetadataKey, "webDomain"))];
              goto LABEL_19;
            }
            if ((objc_msgSend(objc_msgSend(objc_msgSend(v9, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"), "name")) & 1) != 0|| objc_msgSend(objc_msgSend(objc_msgSend(v9, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream"), "name")))
            {
              -[NSMutableSet addObject:](v4, "addObject:", [objc_msgSend(objc_msgSend(v9, "value"), "stringValue")]);
            }
            else
            {
              uint64_t v13 = qword_10002AA78;
              if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
              {
                id v14 = [objc_msgSend(v9, "stream") name];
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v14;
                id v11 = v13;
                id v12 = "Unexpected DK Event when looking for categories. Event stream %{public}@";
                goto LABEL_14;
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              -[NSMutableSet addObject:](v4, "addObject:", [v9 bundleID]);
              goto LABEL_19;
            }
            uint64_t v10 = qword_10002AA78;
            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v9;
              id v11 = v10;
              id v12 = "Unexpected object pending categories %{public}@";
LABEL_14:
              _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&buf, 0xCu);
            }
          }
LABEL_19:
          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v15 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
        id v6 = v15;
      }
      while (v15);
    }
    objc_initWeak(&location, a1);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    id v22 = sub_100014760;
    __int16 v23 = &unk_1000250E8;
    objc_copyWeak(&v27, &location);
    id v24 = v4;
    uint64_t v25 = a2;
    uint64_t v26 = a3;
    if ([(NSMutableSet *)v20 count])
    {
      objc_initWeak(&from, a1);
      id v16 = +[CTCategories sharedCategories];
      id v17 = [(NSMutableSet *)v20 allObjects];
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      uint64_t v36 = sub_1000134A0;
      id v37 = &unk_100025160;
      objc_copyWeak(&v40, &from);
      uint64_t v39 = v21;
      uint64_t v38 = a2;
      [v16 categoriesForDomainNames:v17 completionHandler:&buf];
      objc_destroyWeak(&v40);
      objc_destroyWeak(&from);
    }
    else
    {
      v22((uint64_t)v21, 0);
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void sub_10001471C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(v35);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_100014760(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to get categories for web domains because %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  id Weak = objc_loadWeak((id *)(a1 + 56));
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014974;
  v10[3] = &unk_100025188;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v10[4] = *(void *)(a1 + 48);
  if (Weak)
  {
    objc_initWeak(&location, Weak);
    id v8 = +[CTCategories sharedCategories];
    id v9 = [v6 allObjects];
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    id v14 = sub_1000138EC;
    id v15 = &unk_1000250C0;
    uint64_t v18 = v10;
    objc_copyWeak(v19, &location);
    uint64_t v16 = v7;
    id v17 = Weak;
    [v8 categoriesForBundleIDs:v9 completionHandler:&buf];
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  objc_destroyWeak(&v11);
}

void sub_100014940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

uint64_t sub_100014974(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    id v6 = Weak;
    [objc_getProperty(Weak, v5, 32, 1) removeAllObjects];
    uint64_t v7 = (void *)v6[14];
  }
  else
  {
    [0 removeAllObjects];
    uint64_t v7 = 0;
  }
  [v7 removeAllObjects];
  if (a2)
  {
    id v8 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      uint64_t v11 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get categories for bundleIds because %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014A70(void *a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    id v6 = [[[BiomeLibrary() Text] InputSession];
    objc_initWeak(&location, a1);
    id v7 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:[a2 startDate] endDate:[a2 endDate] maxEvents:0 lastN:0 reversed:0];
    id v8 = [v6 publisherWithOptions:v7];

    id v9 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v16 = a2;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Querying interval %{public}@ for stream %{public}@", buf, 0x16u);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014CBC;
    v12[3] = &unk_100025110;
    objc_copyWeak(&v13, &location);
    v12[4] = a2;
    v12[5] = a3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014E28;
    v10[3] = &unk_100025138;
    objc_copyWeak(&v11, &location);
    v10[4] = a2;
    void v10[5] = a1;
    [v8 sinkWithCompletion:v12 receiveInput:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void sub_100014C84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_100014CBC(uint64_t a1, void *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  id v5 = [a2 state];
  id v6 = qword_10002AA78;
  if (v5 == (id)1 && os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = [a2 error];
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "text input session query failed because %{public}@", (uint8_t *)&v9, 0xCu);
    id v6 = qword_10002AA78;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "text input session query complete", (uint8_t *)&v9, 2u);
  }
  if (Weak) {
    id Property = objc_getProperty(Weak, v7, 32, 1);
  }
  else {
    id Property = 0;
  }
  if ([Property count]) {
    sub_1000142B8((id *)Weak, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  else {
    (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [a2 error]);
  }
}

void sub_100014E28(uint64_t a1, void *a2)
{
  [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [a2 eventBody];
    id v4 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      id v32 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got text input session event %{public}@", buf, 0xCu);
    }
    id Weak = objc_loadWeak((id *)(a1 + 48));
    id v6 = [v3 sr_dateIntervalsInBucketsOf:*(void *)(a1 + 32) duringQueryInterval:900.0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    id v7 = [v6 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v28;
      *(void *)&long long v8 = 138543362;
      long long v24 = v8;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v11);
          id v13 = [v3 bundleID:v24];
          id v14 = qword_10002AA78;
          if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v3 timestamp];
            [v3 duration];
            *(_DWORD *)long long buf = 138544131;
            id v32 = v15;
            __int16 v33 = 2050;
            uint64_t v34 = v16;
            __int16 v35 = 2114;
            uint64_t v36 = v12;
            __int16 v37 = 2113;
            id v38 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BMTextInputSession with start date: %{public}@, duration: %{public}f; Using date interval: %{public}@ for "
              "bundle id %{private}@",
              buf,
              0x2Au);
          }
          if (v13)
          {
            id v17 = sub_100015198(*(id *)(a1 + 40), (uint64_t)v13);
            if (v17)
            {
              [Weak addTextInputSessionForInterval:v12 event:v3 category:v17];
            }
            else
            {
              id v19 = qword_10002AA78;
              if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = v24;
                id v32 = v13;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[TextInputSession] Couldn't find a primary category for %{public}@, checking with the Categories framework", buf, 0xCu);
              }
              if (Weak) {
                id Property = objc_getProperty(Weak, v20, 32, 1);
              }
              else {
                id Property = 0;
              }
              [Property addObject:v3];
            }
          }
          else
          {
            id v18 = qword_10002AA78;
            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v24;
              id v32 = v3;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No bundle identifier provided in text input session event %{public}@", buf, 0xCu);
            }
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v22 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
        id v9 = v22;
      }
      while (v22);
    }
  }
  else
  {
    __int16 v23 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v32 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "unexpected object received during text input session: %{public}@", buf, 0xCu);
    }
  }
}

id sub_100015198(id result, uint64_t a2)
{
  if (result)
  {
    BOOL v3 = (BOOL)result;
    uint64_t v12 = 0;
    id v4 = +[LSApplicationRecord sr_applicationRecordWithIdentifier:a2 error:&v12];
    uint64_t v5 = v12;
    if (v12)
    {
      id v6 = qword_10002AA78;
      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v14 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to get application record because %{public}@", buf, 0xCu);
      }
      return 0;
    }
    id v7 = v4;
    id v8 = [v4 iTunesMetadata];
    __n128 result = sub_10001246C((uint64_t)[v8 genre]);
    if (!result)
    {
      +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 genreIdentifier]);
      if (qword_10002AAA0 != -1) {
        dispatch_once(&qword_10002AAA0, &stru_100025310);
      }
      __n128 result = [(id)qword_10002AAA8 objectForKeyedSubscript:];
      if (!result)
      {
        if (!sub_1000169D4(v3, a2)) {
          return 0;
        }
        id v9 = [v7 infoDictionary];
        uint64_t v10 = objc_opt_class();
        id v11 = [[objc_msgSend(v9, "objectForKey:ofClass:valuesOfClass:", @"SBMatchingApplicationGenres", v10, objc_opt_class()) firstObject];
        return sub_10001246C((uint64_t)v11);
      }
    }
  }
  return result;
}

void sub_100015340(void *a1, uint64_t a2)
{
  if (a1)
  {
    if (objc_msgSend(objc_getProperty(a1, (SEL)a2, 40, 1), "count"))
    {
      id v4 = +[NSMutableSet set];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id Property = objc_getProperty(a1, v5, 40, 1);
      id v7 = [Property countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v17;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(Property);
            }
            [v4 addObject:[objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "value"), "stringValue"]];
          }
          id v7 = [Property countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v7);
      }
      objc_initWeak(&location, a1);
      uint64_t v10 = qword_10002AA78;
      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138477827;
        id v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Fetching custom categories for %{private}@", buf, 0xCu);
      }
      id v11 = (void *)a1[15];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000155C8;
      v13[3] = &unk_100025160;
      v13[4] = v4;
      objc_copyWeak(&v14, &location);
      v13[5] = a2;
      [v11 fetchCustomCategoriesForBundleIdentifiers:v4 completion:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v12 = *(void (**)(uint64_t, void))(a2 + 16);
      v12(a2, 0);
    }
  }
}

void sub_1000155A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000155C8(uint64_t a1, void *a2, void *a3)
{
  SEL v5 = qword_10002AA78;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      long long v46 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to fetch custom categories because %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138478083;
    long long v46 = a2;
    __int16 v47 = 2113;
    uint64_t v48 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got custom categories %{private}@ for %{private}@", buf, 0x16u);
  }
  uint64_t v26 = a1;
  id Weak = objc_loadWeak((id *)(a1 + 48));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v28 = [a2 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v39;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(a2);
        }
        uint64_t v9 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v8);
        id v10 = [a2 objectForKeyedSubscript:v9];
        id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v12 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v12)
        {
          id v14 = v12;
          uint64_t v15 = *(void *)v35;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v35 != v15) {
                objc_enumerationMutation(v10);
              }
              id v17 = [objc_alloc((Class)SRSupplementalCategory) initWithIdentifier:*(void *)(*((void *)&v34 + 1) + 8 * i)];
              [(NSMutableArray *)v11 addObject:v17];
            }
            id v14 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v14);
        }
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        if (Weak) {
          id Property = objc_getProperty(Weak, v13, 80, 1);
        }
        else {
          id Property = 0;
        }
        id v19 = [Property objectForKeyedSubscript:v9];
        id v20 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v31;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v31 != v22) {
                objc_enumerationMutation(v19);
              }
              [objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)j), "mutableSupplementalCategories") addObjectsFromArray:v11];
            }
            id v21 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v21);
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v8 != v28);
      id v24 = [a2 countByEnumeratingWithState:&v38 objects:v44 count:16];
      id v28 = v24;
    }
    while (v24);
  }
  return (*(uint64_t (**)(void))(*(void *)(v26 + 40) + 16))();
}

void sub_100015BB4(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v69 = [a2 countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (!v69) {
      goto LABEL_83;
    }
    uint64_t v72 = 0;
    id v5 = 0;
    uint64_t v68 = *(void *)v84;
    *(void *)&long long v4 = 138543618;
    long long v66 = v4;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v84 != v68)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(a2);
          uint64_t v6 = v7;
        }
        uint64_t v70 = v6;
        uint64_t v8 = *(void **)(*((void *)&v83 + 1) + 8 * v6);
        if ([v8 startDate] && objc_msgSend(v8, "endDate"))
        {
          if (objc_msgSend(objc_msgSend(v8, "startDate"), "compare:", objc_msgSend(v8, "endDate")) == (id)1)
          {
            uint64_t v9 = qword_10002AA78;
            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
            {
              id v10 = [v8 startDate];
              id v11 = [v8 endDate];
              *(_DWORD *)long long buf = v66;
              id v88 = v10;
              __int16 v89 = 2114;
              id v90 = v11;
              _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Start date after end date. start: %{public}@ end: %{public}@", buf, 0x16u);
            }
            goto LABEL_15;
          }
          id v73 = [v8 sr_dateIntervalsInBucketsOf:*(void *)(a1 + 32) duringQueryInterval:900.0];
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v13 = [v73 countByEnumeratingWithState:&v79 objects:v95 count:16];
          if (!v13) {
            goto LABEL_15;
          }
          uint64_t v74 = *(void *)v80;
          while (2)
          {
            uint64_t v14 = 0;
LABEL_20:
            if (*(void *)v80 != v74) {
              objc_enumerationMutation(v73);
            }
            uint64_t v15 = *(void **)(*((void *)&v79 + 1) + 8 * v14);
            long long v16 = qword_10002AA78;
            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [v8 startDate];
              id v18 = [v8 endDate];
              id v19 = [v15 startDate];
              id v20 = [v15 endDate];
              *(_DWORD *)long long buf = 138544130;
              id v88 = v17;
              __int16 v89 = 2114;
              id v90 = v18;
              __int16 v91 = 2114;
              id v92 = v19;
              __int16 v93 = 2114;
              id v94 = v20;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DKEvent with start date: %{public}@, end date: %{public}@; Using date interval: %{public}@, end date: %{public}@",
                buf,
                0x2Au);
              long long v16 = qword_10002AA78;
            }
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138477827;
              id v88 = v8;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DKEvent: %{private}@", buf, 0xCu);
            }
            if (objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream", v66), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams displayIsBacklit](_DKSystemEventStreams, "displayIsBacklit"), "name")))
            {
              id v21 = [*(id *)(a1 + 40) deviceUsageReportForDate:[v15 startDate]];
              if (v5) {
                BOOL v22 = 0;
              }
              else {
                BOOL v22 = [[[v8 value] integerValue] != 0];
              }
              [v21 setTotalScreenWakes:((char *)[v21 totalScreenWakes] + v22)];
              id v5 = [[objc_msgSend(v8, "value") integerValue];
              if (objc_msgSend(objc_msgSend(v8, "value"), "integerValue"))
              {
                [v15 duration];
                double v40 = v39;
                [v21 totalScreenWakeDuration];
                [v21 setTotalScreenWakeDuration:v40 + v41];
                [v21 totalScreenWakeDuration];
                if (v42 > 900.0)
                {
                  uint64_t v43 = qword_10002AA78;
                  if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    long long v31 = v43;
                    long long v32 = "Wake duration too long";
LABEL_47:
                    _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, v32, buf, 2u);
                  }
                }
              }
            }
            else if (objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 48), "name")))
            {
              id v23 = [*(id *)(a1 + 40) deviceUsageReportForDate:[v15 startDate]];
              id v24 = [[objc_msgSend(v8, "value") integerValue];
              BOOL v25 = v24 != (id)1 && v72 == 0;
              [v23 setTotalUnlocks:[v23 totalUnlocks] + v25];
              if (v24 == (id)1)
              {
                uint64_t v72 = 0;
              }
              else
              {
                [v15 duration];
                double v27 = v26;
                [v23 totalUnlockDuration];
                [v23 setTotalUnlockDuration:v27 + v28];
                [v23 totalUnlockDuration];
                uint64_t v72 = 1 - (void)v24;
                if (v29 > 900.0)
                {
                  uint64_t v30 = qword_10002AA78;
                  if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    long long v31 = v30;
                    long long v32 = "Unlock duration too long";
                    goto LABEL_47;
                  }
                }
              }
            }
            else
            {
              if (!objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream"), "name")))
              {
                if (objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams motionStream](_DKSystemEventStreams, "motionStream"), "name")))
                {
                  id v44 = [*(id *)(a1 + 40) deviceUsageReportForDate:[v15 startDate]];
                  id v45 = [[[v8 value] integerValue];
                  [v15 duration];
                  long long v46 = +[_SRDeviceUsageMotionActivity motionActivityWithActivityType:duration:](_SRDeviceUsageMotionActivity, "motionActivityWithActivityType:duration:", v45);
                  id v47 = [v44 _mutableMotionActivities];
                  if (!v47)
                  {
                    id v47 = +[NSMutableArray array];
                    [v44 set_mutableMotionActivities:v47];
                  }
                }
                else
                {
                  if (!objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream"), "name")))
                  {
                    if ((objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream"), "name")) & 1) == 0&& (objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"), "name")) & 1) == 0&& !objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(
                                            +[_DKSystemEventStreams appWebUsageStream], "name")))
                    {
                      goto LABEL_53;
                    }
                    if (objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream"), "name")))
                    {
                      id v50 = sub_100013E4C(*(void *)(a1 + 40), v8);
                      if (!v50) {
                        goto LABEL_53;
                      }
                    }
                    else
                    {
                      id v50 = [[[v8 value] stringValue];
                      if (!v50) {
                        goto LABEL_53;
                      }
                      if ((sub_1000168AC(*(void *)(a1 + 40), (uint64_t)v50) & 1) == 0)
                      {
                        v54 = qword_10002AA78;
                        if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)long long buf = 138543362;
                          id v88 = v50;
                          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Skipping bundle id %{public}@ because of its application type", buf, 0xCu);
                        }
                        goto LABEL_53;
                      }
                    }
                    if (!objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams appWebUsageStream](_DKSystemEventStreams, "appWebUsageStream"), "name")))
                    {
                      if ([objc_msgSend(objc_msgSend(objc_msgSend(v8, "stream"), "name"), "isEqualToString:", objc_msgSend(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"), "name"))])[*(id *)(*(void *)(a1 + 40) + 40) addObject:v8]; {
                      id v51 = sub_100015198(*(id *)(a1 + 40), (uint64_t)v50);
                      }
                      if (v51)
                      {
                        sub_1000169D4(*(void *)(a1 + 40), (uint64_t)v50);
                        unsigned int v52 = [[[objc_msgSend(objc_msgSend(v8, "stream"), "name") isEqualToString:objc_msgSend(+[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream"), "name")];
                        long long v53 = *(void **)(a1 + 40);
                        if (v52) {
                          sub_100013F08(v53, *(void **)(a1 + 32), v8, (uint64_t)v51);
                        }
                        else {
                          sub_100014050(v53, v15, v8, (uint64_t)v51);
                        }
                        goto LABEL_53;
                      }
                      long long v55 = qword_10002AA78;
                      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)long long buf = 138543362;
                        id v88 = v50;
                        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Couldn't find a primary category for %{public}@, checking with the Categories framework", buf, 0xCu);
                      }
                    }
                    [*(id *)(*(void *)(a1 + 40) + 32) addObject:v8];
                    goto LABEL_53;
                  }
                  id v48 = [*(id *)(a1 + 40) deviceUsageReportForDate:[v15 startDate]];
                  id v49 = [[objc_msgSend(v8, "value") integerValue];
                  [v15 duration];
                  long long v46 = +[_SRDeviceUsageActivityLevel activityLevelWithLevel:duration:](_SRDeviceUsageActivityLevel, "activityLevelWithLevel:duration:", v49);
                  id v47 = [v48 _mutableActivityLevels];
                  if (!v47)
                  {
                    id v47 = +[NSMutableArray array];
                    [v48 set_mutableActivityLevels:v47];
                  }
                }
                [v47 addObject:v46];
                goto LABEL_53;
              }
              id v33 = [*(id *)(a1 + 40) deviceUsageReportForDate:[v15 startDate]];
              if (objc_msgSend(objc_msgSend(v8, "value"), "integerValue") == (id)1)
              {
                [v15 duration];
                double v35 = v34;
                [v33 _totalChargingDuration];
                [v33 set_totalChargingDuration:v35 + v36];
                [v33 _totalChargingDuration];
                if (v37 > 900.0)
                {
                  uint64_t v38 = qword_10002AA78;
                  if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    long long v31 = v38;
                    long long v32 = "Charging duration too long";
                    goto LABEL_47;
                  }
                }
              }
            }
LABEL_53:
            if (v13 == (id)++v14)
            {
              id v56 = [v73 countByEnumeratingWithState:&v79 objects:v95 count:16];
              id v13 = v56;
              if (!v56) {
                goto LABEL_15;
              }
              continue;
            }
            goto LABEL_20;
          }
        }
        id v12 = qword_10002AA78;
        if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
        {
          id v57 = [v8 startDate];
          id v58 = [v8 endDate];
          *(_DWORD *)long long buf = v66;
          id v88 = v57;
          __int16 v89 = 2114;
          id v90 = v58;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid dates. start: %{public}@ end: %{public}@", buf, 0x16u);
        }
LABEL_15:
        uint64_t v6 = v70 + 1;
      }
      while ((id)(v70 + 1) != v69);
      id v59 = [a2 countByEnumeratingWithState:&v83 objects:v96 count:16];
      id v69 = v59;
      if (!v59)
      {
LABEL_83:
        if (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "count", v66))
        {
          objc_initWeak((id *)buf, *(id *)(a1 + 40));
          v60 = *(id **)(a1 + 40);
          uint64_t v61 = *(void *)(a1 + 32);
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472;
          v77[2] = sub_100016AC4;
          v77[3] = &unk_1000251B0;
          uint64_t v62 = *(void *)(a1 + 56);
          v77[4] = v61;
          v77[5] = v62;
          objc_copyWeak(&v78, (id *)buf);
          sub_1000142B8(v60, v61, (uint64_t)v77);
          objc_destroyWeak(&v78);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          objc_initWeak((id *)buf, *(id *)(a1 + 40));
          v64 = *(void **)(a1 + 40);
          v65 = *(void **)(a1 + 32);
          v75[0] = _NSConcreteStackBlock;
          v75[1] = 3221225472;
          v75[2] = sub_100016CA8;
          v75[3] = &unk_100025188;
          v75[4] = *(void *)(a1 + 56);
          objc_copyWeak(&v76, (id *)buf);
          sub_100014A70(v64, v65, (uint64_t)v75);
          objc_destroyWeak(&v76);
          objc_destroyWeak((id *)buf);
        }
        return;
      }
    }
  }
  v63 = *(void (**)(void))(*(void *)(a1 + 56) + 16);

  v63();
}

void sub_100016870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id location)
{
  objc_destroyWeak(v55);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000168AC(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v9 = 0;
    id v3 = +[LSApplicationRecord sr_applicationRecordWithIdentifier:a2 error:&v9];
    if (v3)
    {
      long long v4 = v3;
      unsigned __int8 v5 = [[objc_msgSend(v3, "appTags") containsObject:@"hidden"];
      unsigned __int8 v6 = [[objc_msgSend(v4, "appTags") containsObject:@"SBInternalAppTag"];
      __n128 result = 0;
      if ((v5 & 1) == 0 && (v6 & 1) == 0) {
        return [v4 isLaunchProhibited] ^ 1;
      }
    }
    else
    {
      uint64_t v7 = qword_10002AA78;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT);
      __n128 result = 0;
      if (v8)
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v11 = a2;
        __int16 v12 = 2114;
        uint64_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to find an application record for %{public}@ because %{public}@", buf, 0x16u);
        return 0;
      }
    }
  }
  return result;
}

BOOL sub_1000169D4(BOOL result, uint64_t a2)
{
  if (result)
  {
    uint64_t v5 = 0;
    id v3 = +[LSApplicationRecord sr_applicationRecordWithIdentifier:a2 error:&v5];
    if (!v3)
    {
      long long v4 = qword_10002AA78;
      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v7 = a2;
        __int16 v8 = 2114;
        uint64_t v9 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to find application record for %{public}@ because %{public}@", buf, 0x16u);
      }
    }
    return [v3 developerType] == 1;
  }
  return result;
}

void sub_100016AC4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    long long v4 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to request categories for interval %{public}@ because %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = (id *)(a1 + 48);
    id Weak = objc_loadWeak((id *)(a1 + 48));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100016C40;
    v9[3] = &unk_100025188;
    uint64_t v7 = *(void **)(a1 + 32);
    v9[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v10, v5);
    sub_100014A70(Weak, v7, (uint64_t)v9);
    objc_destroyWeak(&v10);
  }
}

void sub_100016C24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100016C40(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    id Weak = objc_loadWeak((id *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    sub_100015340(Weak, v5);
  }
}

void sub_100016CA8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    id Weak = objc_loadWeak((id *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    sub_100015340(Weak, v5);
  }
}

uint64_t sub_100016D10(uint64_t *a1, void *a2, uint64_t a3)
{
  id v3 = a1;
  if (!a2 || a3)
  {
    v64 = *(uint64_t (**)(void))(a1[6] + 16);
    return v64();
  }
  else
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v68 = [a2 countByEnumeratingWithState:&v87 objects:v102 count:16];
    if (v68)
    {
      uint64_t v67 = *(void *)v88;
      *(void *)&long long v4 = 138543874;
      long long v65 = v4;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v88 != v67) {
            objc_enumerationMutation(a2);
          }
          unsigned __int8 v6 = *(void **)(*((void *)&v87 + 1) + 8 * v5);
          uint64_t v74 = v6;
          uint64_t v70 = v5;
          if ([v6 bundleId] && sub_1000169D4(v3[4], (uint64_t)objc_msgSend(v6, "bundleId")))
          {
            if ([v6 startDate] && objc_msgSend(v6, "endDate"))
            {
              if (objc_msgSend(objc_msgSend(v6, "startDate"), "compare:", objc_msgSend(v6, "endDate")) == (id)1)
              {
                uint64_t v7 = qword_10002AA78;
                if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
                {
                  id v8 = [v6 startDate];
                  id v9 = [v6 endDate];
                  *(_DWORD *)long long buf = 138543618;
                  id v94 = v8;
                  __int16 v95 = 2114;
                  id v96 = v9;
                  _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Start date after end date. start: %{public}@ end: %{public}@", buf, 0x16u);
                }
              }
              else
              {
                unint64_t v13 = (unint64_t)[v6 mechanism];
                if (v13 <= 0x10)
                {
                  if (((1 << v13) & 0x11C00) != 0)
                  {
                    id v14 = [v6 sr_dateIntervalsInBucketsOf:v3[5] duringQueryInterval:sub_100012FE8(v3[4])];
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v85 = 0u;
                    long long v86 = 0u;
                    id v71 = v14;
                    id v73 = [v14 countByEnumeratingWithState:&v83 objects:v101 count:16];
                    if (v73)
                    {
                      uint64_t v72 = *(void *)v84;
                      do
                      {
                        uint64_t v15 = 0;
                        do
                        {
                          if (*(void *)v84 != v72) {
                            objc_enumerationMutation(v71);
                          }
                          long long v16 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v15);
                          id v17 = qword_10002AA78;
                          if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
                          {
                            id v18 = [v74 startDate];
                            id v19 = [v74 endDate];
                            id v20 = [v16 startDate];
                            id v21 = [v16 endDate];
                            *(_DWORD *)long long buf = 138544130;
                            id v94 = v18;
                            __int16 v95 = 2114;
                            id v96 = v19;
                            __int16 v97 = 2114;
                            id v98 = v20;
                            __int16 v99 = 2114;
                            id v100 = v21;
                            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CDInteraction with start date: %{public}@, end date: %{public}@; Using date interval: %{pu"
                              "blic}@, end date: %{public}@",
                              buf,
                              0x2Au);
                            id v17 = qword_10002AA78;
                          }
                          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)long long buf = 138477827;
                            id v94 = v74;
                            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CDInteraction: %{private}@", buf, 0xCu);
                          }
                          uint64_t v22 = v3[4];
                          id v23 = [v16 startDate:v65];
                          if (v22)
                          {
                            id v24 = v23;
                            if ([+[NSUserDefaults standardUserDefaults] BOOLForKey:@"bypassQueryFromMidnightToMidnight"])
                            {
                              double v25 = sub_100012FE8(v22);
                              double v26 = sub_100012FE8(v22);
                              id v27 = sub_100012298(v25, v26, (uint64_t)NSDateInterval, v24);
                            }
                            else
                            {
                              id v27 = [objc_alloc((Class)NSDateInterval) initWithStartDate:+[NSDate sr_localMidnightPriorToDate:](NSDate, "sr_localMidnightPriorToDate:", v24) duration:sub_100012FE8(v22)];
                            }
                            double v28 = v27;
                            double v29 = (SRPhoneUsageReport *)[*(id *)(v22 + 72) objectForKeyedSubscript:v27];
                            if (!v29)
                            {
                              double v29 = +[SRPhoneUsageReport usageReportWithInterval:v28];
                              [*(id *)(v22 + 72) setObject:v29 forKeyedSubscript:v28];
                            }
                          }
                          else
                          {
                            double v29 = 0;
                          }
                          uint64_t v30 = v3;
                          id v31 = [v74 direction];
                          if (v31 == (id)1)
                          {
                            [(SRPhoneUsageReport *)v29 setTotalOutgoingCalls:(char *)[(SRPhoneUsageReport *)v29 totalOutgoingCalls] + 1];
                            long long v81 = 0u;
                            long long v82 = 0u;
                            long long v79 = 0u;
                            long long v80 = 0u;
                            id v32 = [v74 recipients];
                            id v33 = [v32 countByEnumeratingWithState:&v79 objects:v92 count:16];
                            if (v33)
                            {
                              id v34 = v33;
                              uint64_t v35 = *(void *)v80;
                              do
                              {
                                for (i = 0; i != v34; i = (char *)i + 1)
                                {
                                  if (*(void *)v80 != v35) {
                                    objc_enumerationMutation(v32);
                                  }
                                  double v37 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                                  if ([v37 identifier]) {
                                    [[-[SRPhoneUsageReport uniqueContacts](v29, "uniqueContacts") addObject:[v37 identifier]];
                                  }
                                }
                                id v34 = [v32 countByEnumeratingWithState:&v79 objects:v92 count:16];
                              }
                              while (v34);
                            }
                          }
                          else if (!v31)
                          {
                            [(SRPhoneUsageReport *)v29 setTotalIncomingCalls:(char *)[(SRPhoneUsageReport *)v29 totalIncomingCalls] + 1];
                            if (objc_msgSend(objc_msgSend(v74, "sender"), "identifier")) {
                              [[-[SRPhoneUsageReport uniqueContacts](v29, "uniqueContacts") addObject:[objc_msgSend(objc_msgSend(v74, "sender"), "identifier")];
                            }
                          }
                          [v16 duration];
                          double v39 = v38;
                          [(SRPhoneUsageReport *)v29 totalPhoneCallDuration];
                          [(SRPhoneUsageReport *)v29 setTotalPhoneCallDuration:v39 + v40];
                          [(SRPhoneUsageReport *)v29 totalPhoneCallDuration];
                          id v3 = v30;
                          if (v41 > sub_100012FE8(v30[4]))
                          {
                            double v42 = qword_10002AA78;
                            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT))
                            {
                              *(_WORD *)long long buf = 0;
                              _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "Phone usage duration too long", buf, 2u);
                            }
                          }
                          uint64_t v15 = (char *)v15 + 1;
                        }
                        while (v15 != v73);
                        id v43 = [v71 countByEnumeratingWithState:&v83 objects:v101 count:16];
                        id v73 = v43;
                      }
                      while (v43);
                    }
                  }
                  else if (((1 << v13) & 0x1C) != 0)
                  {
                    id v44 = [v6 sr_startDateWithQueryInterval:v3[5]];
                    id v45 = qword_10002AA78;
                    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
                    {
                      id v46 = [v6 startDate];
                      id v47 = [v6 endDate];
                      *(_DWORD *)long long buf = v65;
                      id v94 = v46;
                      __int16 v95 = 2114;
                      id v96 = v47;
                      __int16 v97 = 2114;
                      id v98 = v44;
                      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "CDInteraction with start date: %{public}@, end date: %{public}@; Using start date: %{public}@",
                        buf,
                        0x20u);
                      id v45 = qword_10002AA78;
                    }
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138477827;
                      id v94 = v6;
                      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "CDInteraction: %{private}@", buf, 0xCu);
                    }
                    uint64_t v48 = v3[4];
                    if (v48)
                    {
                      double v49 = sub_100013180();
                      double v50 = sub_100013180();
                      id v51 = sub_100012298(v49, v50, (uint64_t)NSDateInterval, v44);
                      unsigned int v52 = (SRMessagesUsageReport *)[*(id *)(v48 + 64) objectForKeyedSubscript:v51];
                      if (!v52)
                      {
                        unsigned int v52 = +[SRMessagesUsageReport usageReportWithInterval:v51];
                        [*(id *)(v48 + 64) setObject:v52 forKeyedSubscript:v51];
                      }
                    }
                    else
                    {
                      unsigned int v52 = 0;
                    }
                    id v53 = [v6 direction:v65];
                    if (v53 == (id)1)
                    {
                      [(SRMessagesUsageReport *)v52 setTotalOutgoingMessages:(char *)[(SRMessagesUsageReport *)v52 totalOutgoingMessages] + 1];
                      long long v77 = 0u;
                      long long v78 = 0u;
                      long long v75 = 0u;
                      long long v76 = 0u;
                      id v56 = [v6 recipients];
                      id v57 = [v56 countByEnumeratingWithState:&v75 objects:v91 count:16];
                      if (v57)
                      {
                        id v58 = v57;
                        uint64_t v59 = *(void *)v76;
                        do
                        {
                          for (j = 0; j != v58; j = (char *)j + 1)
                          {
                            if (*(void *)v76 != v59) {
                              objc_enumerationMutation(v56);
                            }
                            uint64_t v61 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
                            if ([v61 identifier]) {
                              [[-[SRMessagesUsageReport uniqueContacts](v52, "uniqueContacts") addObject:[v61 identifier]];
                            }
                          }
                          id v58 = [v56 countByEnumeratingWithState:&v75 objects:v91 count:16];
                        }
                        while (v58);
                      }
                    }
                    else if (!v53)
                    {
                      if (objc_msgSend(objc_msgSend(v6, "sender"), "identifier")) {
                        [[-[SRMessagesUsageReport uniqueContacts](v52, "uniqueContacts") addObject:[objc_msgSend(objc_msgSend(v6, "sender"), "identifier")];
                      }
                      [(SRMessagesUsageReport *)v52 setTotalIncomingMessages:(char *)[(SRMessagesUsageReport *)v52 totalIncomingMessages] + 1];
                    }
                  }
                }
              }
            }
            else
            {
              uint64_t v12 = qword_10002AA78;
              if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
              {
                id v54 = [v6 startDate];
                id v55 = [v6 endDate];
                *(_DWORD *)long long buf = 138543618;
                id v94 = v54;
                __int16 v95 = 2114;
                id v96 = v55;
                _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid dates. start: %{public}@ end: %{public}@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v10 = qword_10002AA78;
            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
            {
              id v11 = [v6 bundleId];
              *(_DWORD *)long long buf = 138477827;
              id v94 = v11;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Interaction is not an Apple bundle: %{private}@", buf, 0xCu);
            }
          }
          uint64_t v5 = v70 + 1;
        }
        while ((id)(v70 + 1) != v68);
        id v62 = [a2 countByEnumeratingWithState:&v87 objects:v102 count:16];
        id v68 = v62;
      }
      while (v62);
    }
    return (*(uint64_t (**)(void))(v3[6] + 16))();
  }
}

NSString *sub_100017B84(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = [(NSString *)[a3 _reportApplicationIdentifierByBundleIdentifier] objectForKeyedSubscript:a2];
  if (!v5)
  {
    uint64_t v5 = [+[NSUUID UUID] UUIDString];
    [objc_msgSend(a3, "_reportApplicationIdentifierByBundleIdentifier") setObject:v5 forKeyedSubscript:a2];
  }
  return v5;
}

void sub_100017E70(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 56));
  uint64_t v5 = Weak;
  if (Weak) {
    id Weak = (void *)Weak[12];
  }
  id v6 = [[objc_msgSend(Weak, "allKeys") sortedArrayUsingComparator:&stru_100025220];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v10);
        if (v5)
        {
          id v12 = [(id)v5[12] objectForKeyedSubscript:v11];
          unint64_t v13 = (void *)v5[13];
        }
        else
        {
          id v12 = [0 objectForKeyedSubscript:v11];
          unint64_t v13 = 0;
        }
        [v12 startTime];
        [v13 provideSample:v12];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v14 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      id v8 = v14;
    }
    while (v14);
  }
  if (v5) {
    uint64_t v15 = (void *)v5[12];
  }
  else {
    uint64_t v15 = 0;
  }
  [v15 removeAllObjects];
  [*(id *)(a1 + 32) markCompleted];

  if (a2)
  {
    long long v16 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v24 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error fetching foreground app info from CoreDuet. %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      [+[NSUserDefaults standardUserDefaults] setObject:*(void *)(a1 + 48) forKey:@"lastUsageQueryDate"];
      id Property = objc_getProperty(v5, v17, 80, 1);
    }
    else
    {
      id Property = 0;
    }
    [Property removeAllObjects];
  }
}

int64_t sub_100018080(id a1, NSDateInterval *a2, NSDateInterval *a3)
{
  return [(NSDateInterval *)a2 compare:a3];
}

void sub_100018088(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 56));
  id v6 = Weak;
  if (Weak) {
    id Weak = objc_getProperty(Weak, v5, 64, 1);
  }
  id v7 = [[objc_msgSend(Weak, "allKeys") sortedArrayUsingComparator:&stru_100025268];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v36;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        if (v6)
        {
          id v13 = [objc_getProperty(v6, v9, 64, 1) objectForKeyedSubscript:v35];
          id Property = objc_getProperty(v6, v14, 48, 1);
        }
        else
        {
          id v13 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v35 + 1) + 8 * (void)v12)];
          id Property = 0;
        }
        [v13 startTime];
        [Property provideSample:v13 timestamp:];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v16 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
      id v10 = v16;
    }
    while (v16);
  }
  if (v6)
  {
    [objc_getProperty(v6, v9, 64, 1) removeAllObjects];
    id v18 = objc_getProperty(v6, v17, 72, 1);
  }
  else
  {
    [0 removeAllObjects];
    id v18 = 0;
  }
  id v19 = [[objc_msgSend(v18, "allKeys") sortedArrayUsingComparator:&stru_100025288];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v20)
  {
    id v22 = v20;
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v19);
        }
        if (v6)
        {
          id v25 = [objc_getProperty(v6, v21, 72, 1) objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)v24)];
          id v27 = objc_getProperty(v6, v26, 56, 1);
        }
        else
        {
          id v25 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)v24)];
          id v27 = 0;
        }
        [v25 startTime];
        [v27 provideSample:v25 timestamp:];
        uint64_t v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v28 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
      id v22 = v28;
    }
    while (v28);
  }
  if (v6) {
    id v29 = objc_getProperty(v6, v21, 72, 1);
  }
  else {
    id v29 = 0;
  }
  [v29 removeAllObjects];
  [*(id *)(a1 + 32) markCompleted];

  if (a2)
  {
    uint64_t v30 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v40 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error fetching Interaction History from CoreDuet. %{public}@", buf, 0xCu);
    }
  }
  else if (v6)
  {
    [+[NSUserDefaults standardUserDefaults] setObject:*(void *)(a1 + 48) forKey:@"lastInteractionHistoryQueryDate"];
  }
}

int64_t sub_1000183E0(id a1, NSDateInterval *a2, NSDateInterval *a3)
{
  return [(NSDateInterval *)a2 compare:a3];
}

int64_t sub_1000183E8(id a1, NSDateInterval *a2, NSDateInterval *a3)
{
  return [(NSDateInterval *)a2 compare:a3];
}

void sub_100018C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100018DE0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    long long v4 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v9 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to kick of database download because %{public}@", buf, 0xCu);
    }
  }
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  CFStringRef v7 = @"com.apple.sensorkit.launchUsageCollector";
  return [v5 registerForXPCActivities:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1)];
}

void sub_100018F88(id a1)
{
  v2[0] = @"Book";
  v2[1] = @"Books";
  v3[0] = SRDeviceUsageCategoryBooks;
  v3[1] = SRDeviceUsageCategoryBooks;
  void v2[2] = @"Business";
  v2[3] = @"Catalogs";
  void v3[2] = SRDeviceUsageCategoryBusiness;
  v3[3] = SRDeviceUsageCategoryCatalogs;
  v2[4] = @"Developer Tools";
  v2[5] = @"Education";
  v3[4] = SRDeviceUsageCategoryDeveloperTools;
  void v3[5] = SRDeviceUsageCategoryEducation;
  v2[6] = @"Entertainment";
  v2[7] = @"Finance";
  void v3[6] = SRDeviceUsageCategoryEntertainment;
  v3[7] = SRDeviceUsageCategoryFinance;
  v2[8] = @"Food & Drink";
  v2[9] = @"Food &amp; Drink";
  v3[8] = SRDeviceUsageCategoryFoodAndDrink;
  v3[9] = SRDeviceUsageCategoryFoodAndDrink;
  v2[10] = @"Games";
  v2[11] = @"Graphics & Design";
  v3[10] = SRDeviceUsageCategoryGames;
  v3[11] = SRDeviceUsageCategoryGraphicsAndDesign;
  void v2[12] = @"Graphics &amp; Design";
  v2[13] = @"Health & Fitness";
  v3[12] = SRDeviceUsageCategoryGraphicsAndDesign;
  v3[13] = SRDeviceUsageCategoryHealthAndFitness;
  v2[14] = @"Health &amp; Fitness";
  v2[15] = @"Kids";
  v3[14] = SRDeviceUsageCategoryHealthAndFitness;
  v3[15] = SRDeviceUsageCategoryKids;
  uint8_t v2[16] = @"Lifestyle";
  v2[17] = @"Magazines & Newspapers";
  v3[16] = SRDeviceUsageCategoryLifestyle;
  v3[17] = SRDeviceUsageCategoryNewsstand;
  v2[18] = @"Medical";
  v2[19] = @"Miscellaneous";
  v3[18] = SRDeviceUsageCategoryMedical;
  v3[19] = SRDeviceUsageCategoryMiscellaneous;
  v2[20] = @"Music";
  v2[21] = @"Navigation";
  v3[20] = SRDeviceUsageCategoryMusic;
  v3[21] = SRDeviceUsageCategoryNavigation;
  v2[22] = @"News";
  v2[23] = @"Newsstand";
  v3[22] = SRDeviceUsageCategoryNews;
  v3[23] = SRDeviceUsageCategoryNewsstand;
  v2[24] = @"Photo & Video";
  v2[25] = @"Photo &amp; Video";
  v3[24] = SRDeviceUsageCategoryPhotoAndVideo;
  v3[25] = SRDeviceUsageCategoryPhotoAndVideo;
  v2[26] = @"Photography";
  v2[27] = @"Productivity";
  v3[26] = SRDeviceUsageCategoryPhotoAndVideo;
  v3[27] = SRDeviceUsageCategoryProductivity;
  v2[28] = @"Reference";
  v2[29] = @"Shopping";
  v3[28] = SRDeviceUsageCategoryReference;
  v3[29] = SRDeviceUsageCategoryShopping;
  v2[30] = @"Social Networking";
  v2[31] = @"Sports";
  v3[30] = SRDeviceUsageCategorySocialNetworking;
  v3[31] = SRDeviceUsageCategorySports;
  v2[32] = @"Stickers";
  v2[33] = @"Travel";
  v3[32] = SRDeviceUsageCategoryStickers;
  v3[33] = SRDeviceUsageCategoryTravel;
  v2[34] = @"Utilities";
  v2[35] = @"Weather";
  v3[34] = SRDeviceUsageCategoryUtilities;
  v3[35] = SRDeviceUsageCategoryWeather;
  qword_10002AA88 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:36];
  id v1 = (id)qword_10002AA88;
}

void sub_100019318(id a1)
{
  qword_10002AA90 = (uint64_t)&off_100027008;
  id v1 = &off_100027008;
}

void sub_10001932C(id a1)
{
  v2[0] = &off_100026BF0;
  v2[1] = &off_100026C08;
  v3[0] = SRDeviceUsageCategoryBusiness;
  v3[1] = SRDeviceUsageCategoryWeather;
  void v2[2] = &off_100026C20;
  v2[3] = &off_100026C38;
  void v3[2] = SRDeviceUsageCategoryUtilities;
  v3[3] = SRDeviceUsageCategoryTravel;
  v2[4] = &off_100026C50;
  v2[5] = &off_100026C68;
  v3[4] = SRDeviceUsageCategorySports;
  void v3[5] = SRDeviceUsageCategorySocialNetworking;
  v2[6] = &off_100026C80;
  v2[7] = &off_100026C98;
  void v3[6] = SRDeviceUsageCategoryReference;
  v3[7] = SRDeviceUsageCategoryProductivity;
  v2[8] = &off_100026CB0;
  v2[9] = &off_100026CC8;
  v3[8] = SRDeviceUsageCategoryPhotoAndVideo;
  v3[9] = SRDeviceUsageCategoryNews;
  v2[10] = &off_100026CE0;
  v2[11] = &off_100026CF8;
  v3[10] = SRDeviceUsageCategoryNavigation;
  v3[11] = SRDeviceUsageCategoryMusic;
  void v2[12] = &off_100026D10;
  v2[13] = &off_100026D28;
  v3[12] = SRDeviceUsageCategoryLifestyle;
  v3[13] = SRDeviceUsageCategoryHealthAndFitness;
  v2[14] = &off_100026D40;
  v2[15] = &off_100026D58;
  v3[14] = SRDeviceUsageCategoryGames;
  v3[15] = SRDeviceUsageCategoryFinance;
  uint8_t v2[16] = &off_100026D70;
  v2[17] = &off_100026D88;
  v3[16] = SRDeviceUsageCategoryEntertainment;
  v3[17] = SRDeviceUsageCategoryEducation;
  v2[18] = &off_100026DA0;
  v2[19] = &off_100026DB8;
  v3[18] = SRDeviceUsageCategoryBooks;
  v3[19] = SRDeviceUsageCategoryMedical;
  v2[20] = &off_100026DD0;
  v2[21] = &off_100026DE8;
  v3[20] = SRDeviceUsageCategoryNewsstand;
  v3[21] = SRDeviceUsageCategoryCatalogs;
  qword_10002AAA8 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:22];
  id v1 = (id)qword_10002AAA8;
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return _IOHIDEventGetDoubleValue();
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return _IOHIDEventSystemClientRegisterEventCallback();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return _IOHIDEventSystemClientScheduleWithDispatchQueue();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return _IOHIDEventSystemClientSetMatching();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return _IOHIDEventSystemClientUnregisterEventCallback();
}

uint64_t IOHIDEventSystemClientUnscheduleFromDispatchQueue()
{
  return _IOHIDEventSystemClientUnscheduleFromDispatchQueue();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

SRAbsoluteTime SRAbsoluteTimeGetCurrent(void)
{
  return _SRAbsoluteTimeGetCurrent();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

void free(void *a1)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

void xpc_release(xpc_object_t object)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_Activity(void *a1, const char *a2, ...)
{
  return [a1 Activity];
}

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return [a1 App];
}

id objc_msgSend_Backlight(void *a1, const char *a2, ...)
{
  return [a1 Backlight];
}

id objc_msgSend_BootSession(void *a1, const char *a2, ...)
{
  return [a1 BootSession];
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return [a1 Device];
}

id objc_msgSend_Display(void *a1, const char *a2, ...)
{
  return [a1 Display];
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return [a1 InFocus];
}

id objc_msgSend_InputSession(void *a1, const char *a2, ...)
{
  return [a1 InputSession];
}

id objc_msgSend_Level(void *a1, const char *a2, ...)
{
  return [a1 Level];
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return [a1 Media];
}

id objc_msgSend_Messages(void *a1, const char *a2, ...)
{
  return [a1 Messages];
}

id objc_msgSend_Motion(void *a1, const char *a2, ...)
{
  return [a1 Motion];
}

id objc_msgSend_Notification(void *a1, const char *a2, ...)
{
  return [a1 Notification];
}

id objc_msgSend_PluggedIn(void *a1, const char *a2, ...)
{
  return [a1 PluggedIn];
}

id objc_msgSend_Power(void *a1, const char *a2, ...)
{
  return [a1 Power];
}

id objc_msgSend_Rendered(void *a1, const char *a2, ...)
{
  return [a1 Rendered];
}

id objc_msgSend_ScreenLocked(void *a1, const char *a2, ...)
{
  return [a1 ScreenLocked];
}

id objc_msgSend_Text(void *a1, const char *a2, ...)
{
  return [a1 Text];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_Usage(void *a1, const char *a2, ...)
{
  return [a1 Usage];
}

id objc_msgSend_WebUsage(void *a1, const char *a2, ...)
{
  return [a1 WebUsage];
}

id objc_msgSend__DHIDtoCategoryDisplayNameMap(void *a1, const char *a2, ...)
{
  return [a1 _DHIDtoCategoryDisplayNameMap];
}

id objc_msgSend__DHToAppStoreCategoriesMap(void *a1, const char *a2, ...)
{
  return [a1 _DHToAppStoreCategoriesMap];
}

id objc_msgSend__connectionToService(void *a1, const char *a2, ...)
{
  return [a1 _connectionToService];
}

id objc_msgSend__firstAppLaunchTimeRelativeToInterval(void *a1, const char *a2, ...)
{
  return [a1 _firstAppLaunchTimeRelativeToInterval];
}

id objc_msgSend__mutableActivityLevels(void *a1, const char *a2, ...)
{
  return [a1 _mutableActivityLevels];
}

id objc_msgSend__mutableMotionActivities(void *a1, const char *a2, ...)
{
  return [a1 _mutableMotionActivities];
}

id objc_msgSend__reportApplicationIdentifierByBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _reportApplicationIdentifierByBundleIdentifier];
}

id objc_msgSend__setupConnection(void *a1, const char *a2, ...)
{
  return [a1 _setupConnection];
}

id objc_msgSend__totalChargingDuration(void *a1, const char *a2, ...)
{
  return [a1 _totalChargingDuration];
}

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return [a1 absoluteTimestamp];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appInFocusStream(void *a1, const char *a2, ...)
{
  return [a1 appInFocusStream];
}

id objc_msgSend_appTags(void *a1, const char *a2, ...)
{
  return [a1 appTags];
}

id objc_msgSend_appWebUsageStream(void *a1, const char *a2, ...)
{
  return [a1 appWebUsageStream];
}

id objc_msgSend_applicationUsageByCategory(void *a1, const char *a2, ...)
{
  return [a1 applicationUsageByCategory];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return [a1 automotive];
}

id objc_msgSend_backlightLevel(void *a1, const char *a2, ...)
{
  return [a1 backlightLevel];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_calibrationTracks(void *a1, const char *a2, ...)
{
  return [a1 calibrationTracks];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDeviceUsageQueryDate(void *a1, const char *a2, ...)
{
  return [a1 currentDeviceUsageQueryDate];
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return [a1 cycling];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return [a1 developerType];
}

id objc_msgSend_deviceActivityLevelStream(void *a1, const char *a2, ...)
{
  return [a1 deviceActivityLevelStream];
}

id objc_msgSend_deviceIsLockedStream(void *a1, const char *a2, ...)
{
  return [a1 deviceIsLockedStream];
}

id objc_msgSend_deviceIsPluggedInStream(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPluggedInStream];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_displayIsBacklit(void *a1, const char *a2, ...)
{
  return [a1 displayIsBacklit];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_entryDate(void *a1, const char *a2, ...)
{
  return [a1 entryDate];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_exitDate(void *a1, const char *a2, ...)
{
  return [a1 exitDate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return [a1 genre];
}

id objc_msgSend_genreIdentifier(void *a1, const char *a2, ...)
{
  return [a1 genreIdentifier];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inUseStatus(void *a1, const char *a2, ...)
{
  return [a1 inUseStatus];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionRecorder(void *a1, const char *a2, ...)
{
  return [a1 interactionRecorder];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return [a1 isLaunchProhibited];
}

id objc_msgSend_isMonitoring(void *a1, const char *a2, ...)
{
  return [a1 isMonitoring];
}

id objc_msgSend_isOnScreen(void *a1, const char *a2, ...)
{
  return [a1 isOnScreen];
}

id objc_msgSend_isRoundingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRoundingEnabled];
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStore];
}

id objc_msgSend_lastDeviceUsageActivityLevelEvent(void *a1, const char *a2, ...)
{
  return [a1 lastDeviceUsageActivityLevelEvent];
}

id objc_msgSend_lastDeviceUsageMotionActivityEvent(void *a1, const char *a2, ...)
{
  return [a1 lastDeviceUsageMotionActivityEvent];
}

id objc_msgSend_lastDeviceUsageQueryDate(void *a1, const char *a2, ...)
{
  return [a1 lastDeviceUsageQueryDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_markCompleted(void *a1, const char *a2, ...)
{
  return [a1 markCompleted];
}

id objc_msgSend_mechanism(void *a1, const char *a2, ...)
{
  return [a1 mechanism];
}

id objc_msgSend_mediaAttributes(void *a1, const char *a2, ...)
{
  return [a1 mediaAttributes];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_motionStream(void *a1, const char *a2, ...)
{
  return [a1 motionStream];
}

id objc_msgSend_mutableApplicationUsageByCategory(void *a1, const char *a2, ...)
{
  return [a1 mutableApplicationUsageByCategory];
}

id objc_msgSend_mutableNotificationUsageByCategory(void *a1, const char *a2, ...)
{
  return [a1 mutableNotificationUsageByCategory];
}

id objc_msgSend_mutableSupplementalCategories(void *a1, const char *a2, ...)
{
  return [a1 mutableSupplementalCategories];
}

id objc_msgSend_mutableTextInputSessions(void *a1, const char *a2, ...)
{
  return [a1 mutableTextInputSessions];
}

id objc_msgSend_mutableWebUsageByCategory(void *a1, const char *a2, ...)
{
  return [a1 mutableWebUsageByCategory];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notificationID(void *a1, const char *a2, ...)
{
  return [a1 notificationID];
}

id objc_msgSend_notificationUsageStream(void *a1, const char *a2, ...)
{
  return [a1 notificationUsageStream];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_predicateForEventsWithNullSourceDeviceID(void *a1, const char *a2, ...)
{
  return [a1 predicateForEventsWithNullSourceDeviceID];
}

id objc_msgSend_queryIntervalShift(void *a1, const char *a2, ...)
{
  return [a1 queryIntervalShift];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_relativeStartTime(void *a1, const char *a2, ...)
{
  return [a1 relativeStartTime];
}

id objc_msgSend_remoteInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteInterface];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return [a1 running];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_serviceDataSessionPublisherBookmark(void *a1, const char *a2, ...)
{
  return [a1 serviceDataSessionPublisherBookmark];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_sessionInput(void *a1, const char *a2, ...)
{
  return [a1 sessionInput];
}

id objc_msgSend_sessionPublisherBookmark(void *a1, const char *a2, ...)
{
  return [a1 sessionPublisherBookmark];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedCategories(void *a1, const char *a2, ...)
{
  return [a1 sharedCategories];
}

id objc_msgSend_srAbsoluteTime(void *a1, const char *a2, ...)
{
  return [a1 srAbsoluteTime];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return [a1 starting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return [a1 stationary];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return [a1 stream];
}

id objc_msgSend_strideCalibrationDump(void *a1, const char *a2, ...)
{
  return [a1 strideCalibrationDump];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_totalIncomingCalls(void *a1, const char *a2, ...)
{
  return [a1 totalIncomingCalls];
}

id objc_msgSend_totalIncomingMessages(void *a1, const char *a2, ...)
{
  return [a1 totalIncomingMessages];
}

id objc_msgSend_totalOutgoingCalls(void *a1, const char *a2, ...)
{
  return [a1 totalOutgoingCalls];
}

id objc_msgSend_totalOutgoingMessages(void *a1, const char *a2, ...)
{
  return [a1 totalOutgoingMessages];
}

id objc_msgSend_totalPhoneCallDuration(void *a1, const char *a2, ...)
{
  return [a1 totalPhoneCallDuration];
}

id objc_msgSend_totalScreenWakeDuration(void *a1, const char *a2, ...)
{
  return [a1 totalScreenWakeDuration];
}

id objc_msgSend_totalScreenWakes(void *a1, const char *a2, ...)
{
  return [a1 totalScreenWakes];
}

id objc_msgSend_totalUnlockDuration(void *a1, const char *a2, ...)
{
  return [a1 totalUnlockDuration];
}

id objc_msgSend_totalUnlocks(void *a1, const char *a2, ...)
{
  return [a1 totalUnlocks];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueContacts(void *a1, const char *a2, ...)
{
  return [a1 uniqueContacts];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_upstreams(void *a1, const char *a2, ...)
{
  return [a1 upstreams];
}

id objc_msgSend_usageState(void *a1, const char *a2, ...)
{
  return [a1 usageState];
}

id objc_msgSend_usageTime(void *a1, const char *a2, ...)
{
  return [a1 usageTime];
}

id objc_msgSend_usageType(void *a1, const char *a2, ...)
{
  return [a1 usageType];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_visits(void *a1, const char *a2, ...)
{
  return [a1 visits];
}

id objc_msgSend_visitsQueryWindowShift(void *a1, const char *a2, ...)
{
  return [a1 visitsQueryWindowShift];
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return [a1 walking];
}

id objc_msgSend_webDomain(void *a1, const char *a2, ...)
{
  return [a1 webDomain];
}

id objc_msgSend_writeVisitsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 writeVisitsWithCompletionHandler:];
}
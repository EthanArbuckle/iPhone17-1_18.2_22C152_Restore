void *sub_100001E88(void *a1, void *a2)
{
  void *v3;
  objc_super v5;

  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDWriter;
  v3 = [super init];
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

BOOL sub_100001F54(uint64_t a1, void *a2, const __CFString **a3, double a4)
{
  if (!a1) {
    return 0;
  }
  id v8 = sub_10000B3B0([RDWriteableDatastore alloc], *(id *)(a1 + 8));
  v9 = [(NSURL *)sub_10001BFB4(a4) lastPathComponent];
  v10 = sub_10000BB04((uint64_t)v8, (uint64_t)v9, 0, 0, a3);

  id v11 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:@"samples"];
  if (!v11) {
    return 0;
  }
  v12 = v11;
  v14 = [SRDefaults alloc];
  v15 = *(void **)(a1 + 8);
  if (v15)
  {
    Property = (NSDictionary *)objc_getProperty(v15, v13, 16, 1);
    v18 = *(void **)(a1 + 8);
    if (v18) {
      id v19 = objc_getProperty(v18, v16, 24, 1);
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    Property = 0;
    id v19 = 0;
  }
  v20 = sub_10002B204(Property, v19);
  v21 = sub_100042C68(v14, v20);
  v22 = [SRDatastore alloc];
  if (v22) {
    v23 = sub_1000405A0(v22, v12, 0, 0, 1, (uint64_t)v21);
  }
  else {
    v23 = 0;
  }
  id v24 = [a2 binarySampleRepresentation];
  BOOL v25 = sub_100040784((BOOL)v23, (const char *)[v24 bytes], (z_size_t)[v24 length], (SRError **)a3, a4);

  return v25;
}

void *sub_100002560(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)RDClientInterestCache;
  v3 = [super init];
  if (v3)
  {
    v3[1] = a2;
    id v4 = objc_alloc_init((Class)NSCache);
    v3[2] = v4;
    [v4 setDelegate:v3];
    id v5 = objc_alloc_init((Class)NSCache);
    v3[3] = v5;
    [v5 setDelegate:v3];
  }
  return v3;
}

uint64_t sub_100002678(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a1) {
    return 0;
  }
  id v10 = [[*(id *)(a1 + 16) rd_objectsForSensor:a3 fallbackURL:sub_10001BCE4(*(NSURL **)(a1 + 8), a3)];
  id v11 = [v10 mutableCopy];
  v12 = v11;
  if (!a2)
  {
    [v11 removeObject:a4];
    if (([v10 isEqualToSet:v12] & 1) == 0) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v13 = 1;
    goto LABEL_7;
  }
  [v11 addObject:a4];
  if ([v10 isEqualToSet:v12]) {
    goto LABEL_6;
  }
LABEL_4:
  [*(id *)(a1 + 16) setObject:v12 forKey:a3];
  uint64_t v13 = (uint64_t)[*(id *)(a1 + 16) rd_writeObject:v12 forKey:a3 toURL:sub_10001BCE4(*(NSURL **)(a1 + 8), a3) error:a5];
LABEL_7:

  return v13;
}

uint64_t sub_10000276C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (!a1) {
    return 0;
  }
  id v8 = [[*(id *)(a1 + 24) rd_objectsForSensor:a3 fallbackURL:sub_10001BD2C(*(NSURL **)(a1 + 8), a3)];
  id v9 = [v8 mutableCopy];
  id v10 = [a2 objectForKeyedSubscript:@"_requestingBundleIdentifier"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    v18 = a2;
    uint64_t v19 = a4;
    uint64_t v13 = *(void *)v21;
LABEL_4:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v8);
      }
      v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
      if ([[objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"_requestingBundleIdentifier", v18, v19), "isEqualToString:", v10]) boolValue])break; {
      if (v12 == (id)++v14)
      }
      {
        id v12 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          goto LABEL_4;
        }
        v15 = 0;
        break;
      }
    }
    a2 = v18;
    a4 = v19;
    if (![v15 count]) {
      goto LABEL_13;
    }
  }
  else
  {
    v15 = 0;
    if (![0 count]) {
      goto LABEL_13;
    }
  }
  [v9 removeObject:v15];
LABEL_13:
  if (a2) {
    [v9 addObject:a2];
  }
  if ([v8 isEqualToSet:v9])
  {
    uint64_t v16 = 1;
  }
  else
  {
    [*(id *)(a1 + 24) setObject:v9 forKey:a3];
    uint64_t v16 = (uint64_t)[*(id *)(a1 + 24) rd_writeObject:v9 forKey:a3 toURL:sub_10001BD2C(*(NSURL **)(a1 + 8), a3) error:a4];
  }

  return v16;
}

uint64_t sub_10000298C(uint64_t result, uint64_t a2, void *a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = result;
    id v8 = [NSMutableSet setWithSet:](*(id *)(result + 24), "rd_objectsForSensor:fallbackURL:", a3, sub_10001BD2C(*(NSURL **)(result + 8), a3));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if ([[objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"_requestingBundleIdentifier"), "isEqualToString:", a2]) boolValue])break; {
        if (v10 == (id)++v12)
        }
        {
          id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v13 = 0;
    }
    if ([v13 count])
    {
      [(NSMutableSet *)v8 removeObject:v13];
      [*(id *)(v7 + 24) setObject:v8 forKey:a3];
      return (uint64_t)[*(id *)(v7 + 24) rd_writeObject:v8 forKey:a3 toURL:[*(NSURL **)(v7 + 8) sub_10001BD2C] error:a4];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void *sub_100002C7C(void *a1, void *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)RDIDSMessageEventListener;
  id v5 = [super init];
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

void sub_1000030B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000030C8(uint64_t a1, const char *a2, void *a3)
{
  sub_1000149FC(*(void *)(a1 + 32), a2);
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RDGizmoSyncMessageTypeKey"), "integerValue") != (id)3) {
    goto LABEL_8;
  }
  id v7 = [a3 objectForKeyedSubscript:@"RDGizmoSyncSamplesURLKey"];
  if (!v7)
  {
    long long v14 = qword_10006EAB0;
    if (os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = a3;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "RDGizmoSyncSamplesURLKey in archive transfer status message is nil, %{public}@", buf, 0xCu);
      BOOL v13 = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v8 = v7;
  if ([*(id *)(a1 + 40) containsObject:v7])
  {
LABEL_8:
    BOOL v13 = 1;
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) addObject:v8];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v16 = IDSSendMessageOptionExpectsPeerResponseKey;
  long long v17 = &__kCFBooleanTrue;
  id v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  if (v9) {
    sub_1000250CC(v9, a3, *(void **)(v9 + 24), (uint64_t)v10);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v12 = *(void *)(v11 + 24);
  *(void *)(v11 + 24) = v12 + 1;
  BOOL v13 = v12 < *(void *)(a1 + 64);
LABEL_9:
  return v13;
}

uint64_t sub_10000386C(uint64_t a1, const char *a2, void *a3)
{
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RDGizmoSyncMessageTypeKey"), "integerValue") == (id)9
    && objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RDGizmoSyncSensorIdentifierKey"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"RDGizmoSyncSensorIdentifierKey"))&& objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RDGizmoSyncSamplesURLKey"), "lastPathComponent"), "isEqualToString:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"RDGizmoSyncSamplesURLKey"), "lastPathComponent")))
  {
    sub_1000149FC(*(void *)(a1 + 40), a2);
  }
  return 1;
}

void *sub_10000399C(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)RDCompanionSideSync;
  id v10 = [super init];
  if (v10)
  {
    v10[4] = a5;
    v10[3] = a2;
    v10[7] = a6;
    uint64_t v11 = a3;
    v10[5] = v11;
    if (v11) {
      [v11[7] addObject:v10];
    }
  }
  return v10;
}

id sub_100003F60(uint64_t a1)
{
  return [*(id *)(a1 + 32) deferIfNeeded];
}

uint64_t sub_100004334(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) lastPathComponent];
    if (v5)
    {
      v14[0] = @"RDGizmoSyncMessageTypeKey";
      v14[1] = @"RDGizmoSyncSamplesURLKey";
      uint64_t v7 = *(void *)(a1 + 48);
      v15[0] = &off_100060FA8;
      v15[1] = v6;
      v15[2] = v7;
      v14[2] = @"RDGizmoSyncSensorIdentifierKey";
      v14[3] = @"RDGizmoSyncArchiveTransferStatusKey";
      v15[3] = +[NSNumber numberWithInteger:1];
      id v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
      uint64_t v9 = *(void *)(v5 + 40);
      uint64_t v12 = IDSSendMessageOptionExpectsPeerResponseKey;
      objc_super v13 = &__kCFBooleanTrue;
      id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      if (v9) {
        sub_1000250CC(v9, v8, *(void **)(v9 + 24), (uint64_t)v10);
      }
    }
  }
  return 1;
}

BOOL sub_100005418(id a1, int64_t a2, NSURL *a3)
{
  return 1;
}

uint64_t sub_100005420(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2)
  {
LABEL_7:
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [a3 path];
    if (v9)
    {
      v20[0] = @"RDGizmoSyncMessageTypeKey";
      v20[1] = @"RDGizmoSyncSamplesURLKey";
      uint64_t v11 = *(void *)(a1 + 32);
      *(void *)&long long buf = &off_100060FA8;
      *((void *)&buf + 1) = v10;
      uint64_t v22 = v11;
      v20[2] = @"RDGizmoSyncSensorIdentifierKey";
      v20[3] = @"RDGizmoSyncArchiveTransferStatusKey";
      long long v23 = +[NSNumber numberWithInteger:a2];
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v20 count:4];
      uint64_t v13 = *(void *)(v9 + 40);
      uint64_t v18 = IDSSendMessageOptionExpectsPeerResponseKey;
      uint64_t v19 = &__kCFBooleanTrue;
      long long v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      if (v13) {
        sub_1000250CC(v13, v12, *(void **)(v13 + 24), (uint64_t)v14);
      }
    }
    goto LABEL_12;
  }
  if (a2 != 1)
  {
    if (a2 != 2) {
      goto LABEL_12;
    }
    id v6 = qword_10006EAB8;
    if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to unarchive, removing local file %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v7 = sub_100039FA8(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(void *)(a1 + 48) + 24), *(void **)(*(void *)(a1 + 48) + 32));
    id v8 = sub_10000F800([RDArchiveableDatastore alloc], (void **)&v7->super.isa);
    sub_100011BD8((uint64_t)v8, (uint64_t)a3);

    goto LABEL_7;
  }
  long long v15 = qword_10006EAB8;
  if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No key available to decrypt %{public}@", (uint8_t *)&buf, 0xCu);
  }
LABEL_12:
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    LODWORD(result) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, a2, a3);
  }
  else {
    LODWORD(result) = 1;
  }
  if (a2 == 1) {
    return 0;
  }
  else {
    return result;
  }
}

void sub_10000566C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v7 = sub_100039FA8(a2, a3, *(void **)(a1 + 24), *(void **)(a1 + 32));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v23 = sub_10000E0F0([RDInformingDatastore alloc], v7);
    obj = sub_10000E77C(v23, v8);
    id v9 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (!v9)
    {
LABEL_21:

      return;
    }
    id v10 = v9;
    uint64_t v25 = *(void *)v27;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v27 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(char **)(*((void *)&v26 + 1) + 8 * v11);
      long long v14 = qword_10006EAB8;
      if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        v31 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Attempting to decrypt %{public}@", buf, 0xCu);
      }
      CFStringRef v15 = sub_100024B50(*(void *)(a1 + 40), (char *)[v12 path], a2);
      uint64_t v16 = sub_100012F98([RDEncryptingDatastore alloc], v7);
      long long v17 = (char *)sub_100013C70(v16, [v12 URLByResolvingSymlinksInPath]);
      if (v17)
      {
        uint64_t v18 = v17;
        [objc_loadWeak((id *)(a1 + 16)) gizmoSync:a1 didDecryptArchiveWithKey:v15 sensor:a2];
        uint64_t v19 = qword_10006EAB8;
        if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138543618;
          v31 = v18;
          __int16 v32 = 2114;
          v33 = a2;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Successfully decrypted archive %{public}@ for %{public}@", buf, 0x16u);
        }
        long long v20 = (NSURL *)sub_10000F800([RDArchiveableDatastore alloc], (void **)&v7->super.isa);
        long long v21 = sub_100012438(v20, v18);

        if (!v21)
        {
          uint64_t v22 = qword_10006EAB8;
          if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            v31 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to store decrypted archive %{public}@", buf, 0xCu);
          }
          if (!(*(unsigned int (**)(uint64_t, uint64_t, char *))(a4 + 16))(a4, 2, v12))
          {
LABEL_19:

            return;
          }
        }
      }
      else if (((*(uint64_t (**)(uint64_t, uint64_t, char *))(a4 + 16))(a4, 1, v12) & 1) == 0)
      {
        goto LABEL_19;
      }
      if (v10 == (id)++v11)
      {
        id v10 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (!v10) {
          goto LABEL_21;
        }
        goto LABEL_5;
      }
    }
  }
}

void sub_1000059D4(void **a1, __CFString *a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v7 = sub_100039FA8(a2, a3, a1[3], a1[4]);
    id v8 = sub_10000E0F0([RDInformingDatastore alloc], v7);
    uint64_t v25 = a1;
    id v24 = [a1 analyticsDelegate];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v21 = v8;
    obj = sub_10000E870(v8, v9);
    id v10 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v23 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          CFStringRef v15 = sub_10000F800([RDArchiveableDatastore alloc], (void **)&v7->super.isa);
          uint64_t v16 = (NSString *)sub_100012F98([RDEncryptingDatastore alloc], v7);
          long long v17 = sub_1000132D8(v16, (char *)[v13 lastPathComponent]);

          CFStringRef v26 = 0;
          if (sub_10000F97C((uint64_t)v15, (const char *)v13, &v26))
          {
            uint64_t v18 = qword_10006EAB8;
            if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543618;
              __int16 v32 = v13;
              __int16 v33 = 2114;
              CFStringRef v34 = a2;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully unarchived snapshot %{public}@ for %{public}@", buf, 0x16u);
            }
            [v24 gizmoSync:v25 didUnarchiveWithKey:v17 sensor:a2];
            sub_100011BD8((uint64_t)v15, (uint64_t)v13);

            if (((*(uint64_t (**)(uint64_t, void, void *))(a4 + 16))(a4, 0, v13) & 1) == 0) {
              goto LABEL_23;
            }
          }
          else
          {

            [v24 gizmoSync:v25 failedToUnarchiveWithKey:v17 sensor:a2];
            CFStringRef v19 = v26;
            long long v20 = qword_10006EAB8;
            if (v26)
            {
              if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138543618;
                __int16 v32 = v13;
                __int16 v33 = 2114;
                CFStringRef v34 = v19;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error unarchiving %{public}@ because %{public}@. Will retry when unlocked", buf, 0x16u);
              }
              if (!(*(unsigned int (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, 1, v13)) {
                goto LABEL_23;
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_10006EAB8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138543618;
                __int16 v32 = v13;
                __int16 v33 = 2114;
                CFStringRef v34 = a2;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Decrypted archive but failed to unarchive %{public}@ for %{public}@.", buf, 0x16u);
              }
              if (!(*(unsigned int (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, 2, v13))
              {
LABEL_23:

                return;
              }
            }
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
}

id sub_100005E58(id result, void *a2)
{
  if (result)
  {
    uint64_t v8 = 0;
    id v9 = 0;
    if ([a2 getResourceValue:&v9 forKey:NSURLFileSizeKey error:&v8])
    {
      if (!v9)
      {
        if (qword_10006EAC0 != -1)
        {
          dispatch_once(&qword_10006EAC0, &stru_10005CB68);
          uint64_t v3 = qword_10006EAC8;
          if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
            return [v9 longLongValue];
          }
          goto LABEL_6;
        }
        uint64_t v3 = qword_10006EAC8;
        if (os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR))
        {
LABEL_6:
          *(_DWORD *)long long buf = 138543362;
          id v11 = a2;
          id v4 = "Failed to get file size for %{public}@ with no error";
          uint64_t v5 = v3;
          uint32_t v6 = 12;
LABEL_13:
          _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v4, buf, v6);
        }
      }
      return [v9 longLongValue];
    }
    if (qword_10006EAC0 == -1)
    {
      uint64_t v7 = qword_10006EAC8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
        return [v9 longLongValue];
      }
    }
    else
    {
      dispatch_once(&qword_10006EAC0, &stru_10005CB68);
      uint64_t v7 = qword_10006EAC8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
        return [v9 longLongValue];
      }
    }
    *(_DWORD *)long long buf = 138543618;
    id v11 = a2;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    id v4 = "Failed to get file size for %{public}@. %{public}@";
    uint64_t v5 = v7;
    uint32_t v6 = 22;
    goto LABEL_13;
  }
  return result;
}

id sub_10000600C(uint64_t a1, uint64_t a2, char a3)
{
  if (!a1) {
    return 0;
  }
  NSURLResourceKey v34 = NSURLFileSizeKey;
  id v4 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:a2 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v34 count:1] options:4 errorHandler:0];
  id v5 = +[NSMutableOrderedSet orderedSet];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(NSDirectoryEnumerator *)v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v28;
    if (a3)
    {
      *(void *)&long long v7 = 138543362;
      long long v25 = v7;
      while (1)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v4);
          }
          id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (+[NSFileManager defaultManager])
          {
            uint64_t v31 = 0;
            id v32 = 0;
            if ([v11 getResourceValue:&v32 forKey:NSURLFileSizeKey error:&v31])
            {
              if (v32) {
                goto LABEL_17;
              }
              if (qword_10006EAC0 == -1)
              {
                uint64_t v12 = qword_10006EAC8;
                if (os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_14;
                }
LABEL_17:
                [v32 longLongValue];
                goto LABEL_18;
              }
              dispatch_once(&qword_10006EAC0, &stru_10005CB68);
              uint64_t v12 = qword_10006EAC8;
              if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
                goto LABEL_17;
              }
LABEL_14:
              *(_DWORD *)long long buf = v25;
              v36 = v11;
              uint64_t v13 = v12;
              long long v14 = "Failed to get file size for %{public}@ with no error";
              uint32_t v15 = 12;
            }
            else
            {
              if (qword_10006EAC0 == -1)
              {
                uint64_t v16 = qword_10006EAC8;
                if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_17;
                }
              }
              else
              {
                dispatch_once(&qword_10006EAC0, &stru_10005CB68);
                uint64_t v16 = qword_10006EAC8;
                if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_17;
                }
              }
              *(_DWORD *)long long buf = 138543618;
              v36 = v11;
              __int16 v37 = 2114;
              uint64_t v38 = v31;
              uint64_t v13 = v16;
              long long v14 = "Failed to get file size for %{public}@. %{public}@";
              uint32_t v15 = 22;
            }
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
            goto LABEL_17;
          }
LABEL_18:
          [objc_msgSend(v11, "lastPathComponent") doubleValue];
          [v5 addObject:[NSNumber numberWithDouble:x0]];
        }
        id v8 = [(NSDirectoryEnumerator *)v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (!v8) {
          goto LABEL_46;
        }
      }
    }
    *(void *)&long long v7 = 138543362;
    long long v26 = v7;
LABEL_27:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
      if (!+[NSFileManager defaultManager]) {
        goto LABEL_28;
      }
      uint64_t v31 = 0;
      id v32 = 0;
      if (([v18 getResourceValue:&v32 forKey:NSURLFileSizeKey error:&v31] & 1) == 0) {
        break;
      }
      if (v32) {
        goto LABEL_39;
      }
      if (qword_10006EAC0 == -1)
      {
        uint64_t v19 = qword_10006EAC8;
        if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
LABEL_36:
        *(_DWORD *)long long buf = v26;
        v36 = v18;
        long long v20 = v19;
        long long v21 = "Failed to get file size for %{public}@ with no error";
        uint32_t v22 = 12;
LABEL_43:
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
        goto LABEL_39;
      }
      dispatch_once(&qword_10006EAC0, &stru_10005CB68);
      uint64_t v19 = qword_10006EAC8;
      if (os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
LABEL_39:
      if ([v32 longLongValue])
      {
        [objc_msgSend(v18, "lastPathComponent") doubleValue];
        [v5 addObject:[NSNumber numberWithDouble:x0]];
      }
LABEL_28:
      if (v8 == (id)++v17)
      {
        id v8 = [(NSDirectoryEnumerator *)v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (!v8) {
          goto LABEL_46;
        }
        goto LABEL_27;
      }
    }
    if (qword_10006EAC0 == -1)
    {
      uint64_t v23 = qword_10006EAC8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAC0, &stru_10005CB68);
      uint64_t v23 = qword_10006EAC8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
    }
    *(_DWORD *)long long buf = 138543618;
    v36 = v18;
    __int16 v37 = 2114;
    uint64_t v38 = v31;
    long long v20 = v23;
    long long v21 = "Failed to get file size for %{public}@. %{public}@";
    uint32_t v22 = 22;
    goto LABEL_43;
  }
LABEL_46:
  [v5 sortUsingComparator:&stru_10005CAE8];
  return v5;
}

int64_t sub_100006530(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

id sub_100006538(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  NSURLResourceKey v14 = NSURLFileSizeKey;
  v2 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:a2 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v14 count:1] options:4 errorHandler:0];
  id v3 = +[NSMutableArray array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSDirectoryEnumerator *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      long long v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        [v3 addObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
        long long v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSDirectoryEnumerator *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [v3 sortUsingComparator:&stru_10005CB28];
  return v3;
}

int64_t sub_1000066C0(id a1, NSURL *a2, NSURL *a3)
{
  [[-[NSArray lastObject](-[NSString componentsSeparatedByString:](-[NSURL lastPathComponent](a2, "lastPathComponent"), "componentsSeparatedByString:", @"_"), "lastObject") doubleValue];
  double v7 = v6;
  [[-[NSArray lastObject](-[NSString componentsSeparatedByString:](-[NSURL lastPathComponent](a3, "lastPathComponent"), "componentsSeparatedByString:", @"_"), "lastObject") doubleValue];
  double v9 = v8;
  if (v7 < v9) {
    return -1;
  }
  else {
    return v9 < v7;
  }
}

id sub_100006754(id result, uint64_t a2)
{
  if (result)
  {
    v2 = [+[NSFileManager defaultManager] enumeratorAtURL:a2 includingPropertiesForKeys:&__NSArray0__struct options:0 errorHandler:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = [(NSDirectoryEnumerator *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      id v4 = v3;
      id v5 = 0;
      uint64_t v6 = *(void *)v13;
      double v7 = INFINITY;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v2);
          }
          double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v9, "lastPathComponent"), "componentsSeparatedByString:", @"_"), "lastObject"), "doubleValue");
          if (v10 < v7)
          {
            double v11 = v10;

            id v5 = v9;
            double v7 = v11;
          }
        }
        id v4 = [(NSDirectoryEnumerator *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
    else
    {
      id v5 = 0;
    }
    return v5;
  }
  return result;
}

NSDictionary *sub_1000068CC(NSDictionary *result, void *a2, void *a3, void *a4, int a5, int a6, void *a7)
{
  if (result)
  {
    id v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:sub_10001D32C((uint64_t)NSFileHandle, a2, a5, a6, a7) forKeyedSubscript:@"samples"];
    if (a3) {
      [v13 setObject:sub_10001D32C((uint64_t)NSFileHandle, a3, a5, a6, a7) forKeyedSubscript:@"metadata"];
    }
    if (a4) {
      [v13 setObject:sub_10001D32C((uint64_t)NSFileHandle, a4, a5, a6, a7) forKeyedSubscript:@"sensorConfiguration"];
    }
    return +[NSDictionary dictionaryWithDictionary:v13];
  }
  return result;
}

uint64_t sub_1000069E0(uint64_t result, void *a2, int a3, uint64_t a4, double *a5, double a6, double a7)
{
  if (!result) {
    return result;
  }
  if (qword_10006EAC0 != -1)
  {
    dispatch_once(&qword_10006EAC0, &stru_10005CB68);
    p_cb = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
    double v11 = qword_10006EAC8;
    if (!os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
LABEL_86:
    *(_DWORD *)long long buf = 138544130;
    v64 = a2;
    __int16 v65 = 2050;
    double v66 = a6;
    __int16 v67 = 2050;
    double v68 = a7;
    __int16 v69 = 1026;
    int v70 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Removing files from %{public}@ older than %{public}f, newer than %{public}f, dry run: %{public, BOOL}d", buf, 0x26u);
    goto LABEL_4;
  }
  p_cb = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
  double v11 = qword_10006EAC8;
  if (os_log_type_enabled((os_log_t)qword_10006EAC8, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_86;
  }
LABEL_4:
  v62[0] = NSURLFileSizeKey;
  v62[1] = NSURLIsDirectoryKey;
  long long v12 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager", a4) enumeratorAtURL:a2 includingPropertiesForKeys:+[NSArray arrayWithObjects:v62 count:2] options:0 errorHandler:0];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v13 = [(NSDirectoryEnumerator *)v12 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v52 = 0;
    uint64_t v15 = *(void *)v56;
    double v16 = NAN;
    double v17 = NAN;
    v50 = v12;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v56 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v53 = 0;
        double v54 = 0.0;
        if ([v19 getResourceValue:&v53 forKey:NSURLIsDirectoryKey error:&v54])
        {
LABEL_16:
          if ([v53 BOOLValue]) {
            goto LABEL_10;
          }
          goto LABEL_17;
        }
        if (qword_10006EAC0 == -1)
        {
          long long v21 = *((void *)p_cb + 345);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            goto LABEL_16;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAC0, &stru_10005CB68);
          long long v21 = *((void *)p_cb + 345);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            goto LABEL_16;
          }
        }
        *(_DWORD *)long long buf = 138543618;
        v64 = v19;
        __int16 v65 = 2114;
        double v66 = v54;
        _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Failed to get NSURLIsDirectoryKey resource for %{public}@ because %{public}@", buf, 0x16u);
        if ([v53 BOOLValue]) {
          goto LABEL_10;
        }
LABEL_17:
        id v22 = [[objc_msgSend(v19, "lastPathComponent") componentsSeparatedByString:@"_"];
        [objc_msgSend(v22, "firstObject") doubleValue];
        double v24 = v23;
        [objc_msgSend(v22, "lastObject") doubleValue];
        if (v25 == 0.0)
        {
          if (qword_10006EAC0 == -1)
          {
            long long v26 = *((void *)p_cb + 345);
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              goto LABEL_10;
            }
LABEL_20:
            *(_DWORD *)long long buf = 138543362;
            v64 = v19;
            long long v27 = v26;
            long long v28 = "Unable to determine file age of %{public}@";
LABEL_21:
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
            goto LABEL_10;
          }
          dispatch_once(&qword_10006EAC0, &stru_10005CB68);
          long long v26 = *((void *)p_cb + 345);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          goto LABEL_10;
        }
        double v29 = v25;
        if (v25 >= a6 && v25 <= a7) {
          goto LABEL_10;
        }
        if (+[NSFileManager defaultManager])
        {
          double v59 = 0.0;
          id v60 = 0;
          if ([v19 getResourceValue:&v60 forKey:NSURLFileSizeKey error:&v59])
          {
            if (v60) {
              goto LABEL_34;
            }
            if (qword_10006EAC0 == -1)
            {
              uint64_t v31 = *((void *)p_cb + 345);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                goto LABEL_31;
              }
LABEL_34:
              v36 = p_cb;
              double v37 = COERCE_DOUBLE([v60 longLongValue]);
              if (a3) {
                goto LABEL_8;
              }
              goto LABEL_35;
            }
            dispatch_once(&qword_10006EAC0, &stru_10005CB68);
            uint64_t v31 = *((void *)p_cb + 345);
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              goto LABEL_34;
            }
LABEL_31:
            *(_DWORD *)long long buf = 138543362;
            v64 = v19;
            id v32 = v31;
            __int16 v33 = "Failed to get file size for %{public}@ with no error";
            uint32_t v34 = 12;
          }
          else
          {
            if (qword_10006EAC0 == -1)
            {
              v35 = *((void *)p_cb + 345);
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                goto LABEL_34;
              }
            }
            else
            {
              dispatch_once(&qword_10006EAC0, &stru_10005CB68);
              v35 = *((void *)p_cb + 345);
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                goto LABEL_34;
              }
            }
            *(_DWORD *)long long buf = 138543618;
            v64 = v19;
            __int16 v65 = 2114;
            double v66 = v59;
            id v32 = v35;
            __int16 v33 = "Failed to get file size for %{public}@. %{public}@";
            uint32_t v34 = 22;
          }
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
          goto LABEL_34;
        }
        v36 = p_cb;
        double v37 = 0.0;
        if (a3)
        {
LABEL_8:
          v52 += *(void *)&v37;
LABEL_9:
          p_cb = v36;
          long long v12 = v50;
          goto LABEL_10;
        }
LABEL_35:
        if (v29 >= a6)
        {
          if (qword_10006EAC0 == -1)
          {
            v41 = *((void *)v36 + 345);
            if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_43;
            }
LABEL_41:
            *(_DWORD *)long long buf = 138543874;
            v64 = v19;
            __int16 v65 = 2050;
            double v66 = v37;
            __int16 v67 = 2050;
            double v68 = a7;
            v39 = v41;
            v40 = "Removing %{public}@ (%{public}lld bytes) as it is newer than SRAbsoluteTime %{public}f ";
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0x20u);
            goto LABEL_43;
          }
          dispatch_once(&qword_10006EAC0, &stru_10005CB68);
          v41 = *((void *)v36 + 345);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
        }
        else
        {
          if (qword_10006EAC0 == -1)
          {
            uint64_t v38 = *((void *)v36 + 345);
            if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_43;
            }
LABEL_38:
            *(_DWORD *)long long buf = 138543874;
            v64 = v19;
            __int16 v65 = 2050;
            double v66 = v37;
            __int16 v67 = 2050;
            double v68 = a6;
            v39 = v38;
            v40 = "Removing %{public}@ (%{public}lld bytes) as it is older than SRAbsoluteTime %{public}f";
            goto LABEL_42;
          }
          dispatch_once(&qword_10006EAC0, &stru_10005CB68);
          uint64_t v38 = *((void *)v36 + 345);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
        }
LABEL_43:
        id v60 = 0;
        if ([+[NSFileManager defaultManager] removeItemAtURL:v19 error:&v60])
        {
          v52 += *(void *)&v37;
          int v42 = __isnand();
          if (v24 < v16 || v42 != 0) {
            double v16 = v24;
          }
          int v44 = __isnand();
          if (v24 > v17 || v44 != 0) {
            double v17 = v24;
          }
          goto LABEL_9;
        }
        p_cb = v36;
        if (qword_10006EAC0 == -1)
        {
          long long v12 = v50;
          v46 = *((void *)p_cb + 345);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAC0, &stru_10005CB68);
          long long v12 = v50;
          v46 = *((void *)p_cb + 345);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
LABEL_57:
            *(_DWORD *)long long buf = 138543362;
            v64 = v19;
            long long v27 = v46;
            long long v28 = "Failed to remove old file %{public}@";
            goto LABEL_21;
          }
        }
LABEL_10:
      }
      id v14 = [(NSDirectoryEnumerator *)v12 countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (!v14) {
        goto LABEL_77;
      }
    }
  }
  uint64_t v52 = 0;
  double v16 = NAN;
  double v17 = NAN;
LABEL_77:
  if (v48 && !__isnand()) {
    double *v48 = v16;
  }
  if (a5)
  {
    if (!__isnand()) {
      *a5 = v17;
    }
  }
  return v52;
}

void sub_1000071BC(id a1)
{
  qword_10006EAC8 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogNSFileManager+RDDatastore");
}

NSBundle *sub_100007668(uint64_t a1, NSURL *a2, NSURL *a3)
{
  self;
  if (qword_10006EAD0 == -1)
  {
    id v5 = qword_10006EAD8;
    if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
  id v5 = qword_10006EAD8;
  if (os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_DWORD *)long long buf = 138543362;
    long long v27 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Looking for %{public}@ in LaunchServices", buf, 0xCu);
  }
LABEL_4:
  double v24 = 0;
  id v6 = +[LSApplicationRecord sr_applicationRecordWithIdentifier:a2 error:&v24];
  if (v6) {
    goto LABEL_8;
  }
  if (qword_10006EAD0 == -1)
  {
    double v7 = qword_10006EAD8;
    if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
  double v7 = qword_10006EAD8;
  if (os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    *(_DWORD *)long long buf = 138543618;
    long long v27 = a2;
    __int16 v28 = 2114;
    double v29 = v24;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No application record found for %{public}@ because %{public}@", buf, 0x16u);
  }
LABEL_8:
  double v8 = (NSString *)[v6 URL].path;
  if (v8) {
    goto LABEL_13;
  }
  if (qword_10006EAD0 == -1)
  {
    double v9 = qword_10006EAD8;
    if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
  double v9 = qword_10006EAD8;
  if (os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_DWORD *)long long buf = 138543618;
    long long v27 = a2;
    __int16 v28 = 2114;
    double v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Searching for study bundle %{public}@ in %{public}@", buf, 0x16u);
  }
LABEL_12:
  double v8 = [+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", +[NSURL fileURLWithPath:[(NSURL *)a2 stringByAppendingPathExtension:@"bundle"] isDirectory:0 relativeToURL:a3]) bundlePath];
  if (!v8)
  {
    if (qword_10006EAD0 == -1)
    {
      uint64_t v15 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
      uint64_t v15 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        double v16 = +[NSURL fileURLWithPath:@"loadedStudies.plist" isDirectory:0 relativeToURL:a3];
        if (qword_10006EAD0 == -1)
        {
          double v17 = qword_10006EAD8;
          if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
            goto LABEL_28;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
          double v17 = qword_10006EAD8;
          if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO))
          {
LABEL_28:
            if (v16)
            {
              uint64_t v25 = 0;
              uint64_t v18 = +[NSDictionary dictionaryWithContentsOfURL:v16 error:&v25];
              if (v25)
              {
                if (qword_10006EAD0 == -1)
                {
                  uint64_t v19 = qword_10006EAD8;
                  if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_14;
                  }
                }
                else
                {
                  dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
                  uint64_t v19 = qword_10006EAD8;
                  if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_14;
                  }
                }
                *(_DWORD *)long long buf = 138543362;
                long long v27 = v16;
                long long v20 = "Error creating dictionary from %{public}@";
              }
              else
              {
                id v21 = [[-[NSDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"studies") objectForKeyedSubscript:a2];
                if (!v21)
                {
                  if (qword_10006EAD0 == -1)
                  {
                    double v23 = qword_10006EAD8;
                    if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_14;
                    }
                  }
                  else
                  {
                    dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
                    double v23 = qword_10006EAD8;
                    if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_14;
                    }
                  }
                  *(_DWORD *)long long buf = 138543618;
                  long long v27 = a2;
                  __int16 v28 = 2114;
                  double v29 = v16;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No %{public}@ was found in %{public}@", buf, 0x16u);
                  goto LABEL_14;
                }
                id v22 = -[NSString stringByAppendingPathExtension:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-v%@", a2, [v21 stringValue]), "stringByAppendingPathExtension:", @"bundle");
                v32[0] = [(NSURL *)a3 path];
                v32[1] = v22;
                double v8 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v32 count:2]);
                if ([+[NSFileManager defaultManager] fileExistsAtPath:v8])
                {
                  if (!v8) {
                    goto LABEL_14;
                  }
                  goto LABEL_13;
                }
                if (qword_10006EAD0 == -1)
                {
                  uint64_t v19 = qword_10006EAD8;
                  if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_14;
                  }
                }
                else
                {
                  dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
                  uint64_t v19 = qword_10006EAD8;
                  if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_14;
                  }
                }
                *(_DWORD *)long long buf = 138543362;
                long long v27 = (NSURL *)v8;
                long long v20 = "Failed to locate bundle %{public}@";
              }
            }
            else
            {
              if (qword_10006EAD0 == -1)
              {
                uint64_t v19 = qword_10006EAD8;
                if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_14;
                }
              }
              else
              {
                dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
                uint64_t v19 = qword_10006EAD8;
                if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_14;
                }
              }
              *(_DWORD *)long long buf = 138543362;
              long long v27 = 0;
              long long v20 = "Failed to location %{public}@";
            }
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
            goto LABEL_14;
          }
        }
        *(_DWORD *)long long buf = 138543618;
        long long v27 = a2;
        __int16 v28 = 2114;
        double v29 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Searching for %{public}@ in plist %{public}@", buf, 0x16u);
        goto LABEL_28;
      }
    }
    *(_DWORD *)long long buf = 138543874;
    long long v27 = a2;
    __int16 v28 = 2114;
    double v29 = a3;
    __int16 v30 = 2114;
    CFStringRef v31 = @"loadedStudies.plist";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not found in %{public}@. Trying %{public}@", buf, 0x20u);
    goto LABEL_25;
  }
LABEL_13:
  double v10 = +[NSBundle bundleWithPath:v8];
  if (v10) {
    goto LABEL_15;
  }
LABEL_14:
  double v10 = +[NSBundle bundleWithIdentifier:a2];
  if (!v10)
  {
    if (qword_10006EAD0 == -1)
    {
      id v13 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
      id v13 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    long long v27 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to find bundle for %{public}@", buf, 0xCu);
    return 0;
  }
LABEL_15:
  if (qword_10006EAD0 != -1)
  {
    dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
    double v11 = qword_10006EAD8;
    if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
      return v10;
    }
    goto LABEL_17;
  }
  double v11 = qword_10006EAD8;
  if (os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO))
  {
LABEL_17:
    long long v12 = [(NSBundle *)v10 bundleURL];
    *(_DWORD *)long long buf = 138543618;
    long long v27 = a2;
    __int16 v28 = 2114;
    double v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found bundle for %{public}@ at %{public}@", buf, 0x16u);
  }
  return v10;
}

uint64_t sub_1000081CC(uint64_t a1, void *a2, void *a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = (uint64_t)[[a2 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")] length];
    if (result)
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if (result)
      {
        id v7 = [a3 objectForKeyedSubscript:@"Required"];
        objc_opt_class();
        uint64_t result = objc_opt_isKindOfClass();
        if (result)
        {
          uint64_t result = (uint64_t)[v7 BOOLValue];
          if (result)
          {
            double v8 = *(void **)(a1 + 32);
            return (uint64_t)[v8 addObject:a2];
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100008388(uint64_t a1, void *a2, void *a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = (uint64_t)[(id)[a2 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")] length];
    if (result)
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if (result)
      {
        id v7 = [a3 objectForKeyedSubscript:@"Description"];
        id v8 = [*(id *)(a1 + 32) objectForInfoDictionaryKey:v7];
        if (v8) {
          id v7 = v8;
        }
        objc_opt_class();
        uint64_t result = objc_opt_isKindOfClass();
        if (result)
        {
          uint64_t result = (uint64_t)[v7 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length;
          if (result)
          {
            double v9 = *(void **)(a1 + 40);
            return (uint64_t)[v9 setObject:v7 forKeyedSubscript:a2];
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100008504(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v18 = 0;
  if (![a1 bundleIdentifier])
  {
    if (qword_10006EAD0 == -1)
    {
      id v6 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
      id v6 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    id v20 = [a1 bundleURL];
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "No bundle identifier found for bundle URL: %{public}@", buf, 0xCu);
    goto LABEL_16;
  }
  if (+[LSApplicationRecord sr_applicationRecordWithIdentifier:error:](LSApplicationRecord, "sr_applicationRecordWithIdentifier:error:", [a1 bundleIdentifier], &v18))
  {
    if (qword_10006EAD0 == -1)
    {
      double v11 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
        return 2;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
      double v11 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
        return 2;
      }
    }
    id v4 = [a1 bundleIdentifier];
    *(_DWORD *)long long buf = 138543362;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Detected %{public}@ as app bundle type", buf, 0xCu);
    return 2;
  }
  if (qword_10006EAD0 == -1)
  {
    double v16 = qword_10006EAD8;
    if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
  double v16 = qword_10006EAD8;
  if (os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_DEFAULT))
  {
LABEL_15:
    id v7 = [a1 bundleIdentifier];
    *(_DWORD *)long long buf = 138543618;
    id v20 = v7;
    __int16 v21 = 2114;
    uint64_t v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No application record found for %{public}@ because %{public}@", buf, 0x16u);
  }
LABEL_16:
  if (!-[NSString isEqualToString:](-[NSURL path](+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", objc_msgSend(objc_msgSend(a1, "bundleURL"), "lastPathComponent"), 1, a2), "path"), "isEqualToString:", objc_msgSend(objc_msgSend(a1, "bundleURL"), "path")))
  {
    if (qword_10006EAD0 == -1)
    {
      id v13 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
      id v13 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    id v15 = [a1 bundleIdentifier];
    *(_DWORD *)long long buf = 138543362;
    id v20 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to detect a bundle type for %{public}@", buf, 0xCu);
    return 0;
  }
  if (qword_10006EAD0 != -1) {
    dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
  }
  id v8 = qword_10006EAD8;
  uint64_t v5 = 1;
  if (os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO))
  {
    id v9 = [a1 bundleIdentifier];
    *(_DWORD *)long long buf = 138543362;
    id v20 = v9;
    uint64_t v5 = 1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Detected %{public}@ as study bundle type", buf, 0xCu);
  }
  return v5;
}

void sub_100008ABC(id a1)
{
  qword_10006EAD8 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogNSBundle");
}

id *sub_100008B48(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v8 = a1;
  if (a1)
  {
    id v16 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:a2];
    v21.receiver = v8;
    v21.super_class = (Class)RDListener;
    id v8 = [(id *)[super init];
    if (v8)
    {
      v8[1] = [a2 copy];
      v8[2] = a3;
      id v17 = a4;
      v8[7] = a5;
      v8[3] = v17;
      v8[4] = a6;
      v8[9] = +[NSMapTable strongToStrongObjectsMapTable];
      [v8 setListener:v16];
      [v8[8] setDelegate:v8];
      objc_setProperty_nonatomic(v8, v18, a7, 40);
      v8[6] = a8;
      [v16 _setQueue:a7];
    }
    uint64_t v19 = qword_10006EAE0;
    if (os_log_type_enabled((os_log_t)qword_10006EAE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      double v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Starting %@", buf, 0xCu);
    }
  }
  return v8;
}

void sub_10000904C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_100009084(id a1)
{
  CFStringRef v2 = @"RDAnalyticsDaemonStartReasonKey";
  uint64_t v3 = &off_100060FC0;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

void sub_1000090FC(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  CFStringRef v2 = qword_10006EAE0;
  if (os_log_type_enabled((os_log_t)qword_10006EAE0, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    id v4 = Weak;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@, Connection interrupted for sensor", (uint8_t *)&v3, 0xCu);
  }
}

void sub_1000091A4(uint64_t a1)
{
  id Weak = (id *)objc_loadWeak((id *)(a1 + 40));
  int v3 = qword_10006EAE0;
  if (os_log_type_enabled((os_log_t)qword_10006EAE0, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = Weak;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@, XPC Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
  if (Weak) {
    [Weak[9] removeObjectForKey:*(void *)(a1 + 32)];
  }
}

void sub_100009268(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    id v6 = [*(id *)(a1 + 72) objectForKey:a2];
    if (v6)
    {
      id v7 = v6;
      id v8 = qword_10006EAE0;
      if (os_log_type_enabled((os_log_t)qword_10006EAE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        v35 = a2;
        __int16 v36 = 2114;
        id Property = objc_getProperty(v7, v9, 24, 1);
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ is already a connection for %{public}@", buf, 0x16u);
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v10 = *(void **)(a1 + 72);
      id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v30;
        unint64_t v14 = 0;
        if (a3)
        {
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v10);
              }
              id v19 = [*(id *)(a1 + 72) objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
              if (v19) {
                id v21 = objc_getProperty(v19, v20, 24, 1);
              }
              else {
                id v21 = 0;
              }
              v14 += [v21 isEqualToString:[objc_getProperty(a3, v20, 24, 1)]];
            }
            id v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v12);
        }
        else
        {
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v10);
              }
              id v16 = [*(id *)(a1 + 72) objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
              if (v16) {
                id v16 = objc_getProperty(v16, v17, 24, 1);
              }
              v14 += [v16 isEqualToString:0];
            }
            id v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v12);
        }
      }
      else
      {
        unint64_t v14 = 0;
      }
      if (v14 >= *(void *)(a1 + 32))
      {
        AnalyticsSendEventLazy();
        uint64_t v25 = qword_10006EAE0;
        if (os_log_type_enabled((os_log_t)qword_10006EAE0, OS_LOG_TYPE_ERROR))
        {
          long long v27 = *(void **)(a1 + 8);
          if (a3) {
            id v28 = objc_getProperty(a3, v26, 24, 1);
          }
          else {
            id v28 = 0;
          }
          *(_DWORD *)long long buf = 138543618;
          v35 = v27;
          __int16 v36 = 2114;
          id Property = v28;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Can't have more than one connection to %{public}@ for sensor %{public}@. Invalidating client connection", buf, 0x16u);
        }
        [a2 invalidate];
      }
      else
      {
        uint64_t v22 = qword_10006EAE0;
        if (os_log_type_enabled((os_log_t)qword_10006EAE0, OS_LOG_TYPE_DEFAULT))
        {
          if (a3) {
            id v24 = objc_getProperty(a3, v23, 24, 1);
          }
          else {
            id v24 = 0;
          }
          *(_DWORD *)long long buf = 138543618;
          v35 = a2;
          __int16 v36 = 2114;
          id Property = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Adding new client %{public}@ for %{public}@", buf, 0x16u);
        }
        [*(id *)(a1 + 72) setObject:a3 forKey:a2];
      }
    }
  }
}

NSDictionary *sub_100009624(uint64_t a1)
{
  v4[0] = @"RDAnalyticsConnectionTypeKey";
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ([*(id *)(v1 + 8) isEqualToString:@"com.apple.SensorKit.reader"])
    {
      uint64_t v2 = 1;
    }
    else if ([*(id *)(v1 + 8) isEqualToString:@"com.apple.SensorKit.writer"])
    {
      uint64_t v2 = 2;
    }
    else if ([*(id *)(v1 + 8) isEqualToString:@"com.apple.SensorKit.pruner"])
    {
      uint64_t v2 = 3;
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  v4[1] = @"RDAnalyticsConnectionRejectionTypeKey";
  v5[0] = +[NSNumber numberWithInteger:v2];
  v5[1] = &off_100060FC0;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2]);
}

id sub_100009728(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  id v4 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = *(void **)(a1 + 72);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id Property = [*(id *)(a1 + 72) objectForKey:v10];
        if (Property) {
          id Property = objc_getProperty(Property, v12, 24, 1);
        }
        if ([Property isEqualToString:a2]) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  return v4;
}

void *sub_10000A17C(void *a1, void *a2, void *a3, uint64_t a4)
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)RDUnarchiver;
  id v7 = [super init];
  if (v7)
  {
    v7[3] = a3;
    v7[1] = archive_read_new();
    v7[4] = a4;
    *((unsigned char *)v7 + 41) = 1;
    int support_format_all = archive_read_support_format_all();
    if (!support_format_all)
    {
      int support_format_all = archive_read_support_filter_all();
      if (!support_format_all)
      {
        [a2 bytes];
        [a2 length];
        int support_format_all = archive_read_open_memory();
        if (!support_format_all)
        {
          if (!v7[3]) {
            return v7;
          }
          v7[2] = archive_write_disk_new();
          int v11 = archive_write_disk_set_options();
          if (v11)
          {
            int support_format_all = v11;
            *((unsigned char *)v7 + 40) = 1;
          }
          else
          {
            int support_format_all = archive_write_disk_set_standard_lookup();
            *((unsigned char *)v7 + 40) = 1;
            if (!support_format_all) {
              return v7;
            }
          }
        }
      }
    }
    id v9 = qword_10006EAE8;
    if (os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      long long v14 = a3;
      __int16 v15 = 1024;
      int v16 = support_format_all;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error creating unarchive output at path %@ %d", buf, 0x12u);
      if (!*((unsigned char *)v7 + 41)) {
        goto LABEL_9;
      }
    }
    else if (!*((unsigned char *)v7 + 41))
    {
LABEL_9:
      if (*((unsigned char *)v7 + 40)) {
        archive_write_free();
      }
      *((_WORD *)v7 + 20) = 0;

      return 0;
    }
    archive_read_free();
    goto LABEL_9;
  }
  return v7;
}

BOOL sub_10000A3C4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  self;
  id v9 = +[NSData dataWithContentsOfURL:a2 options:1 error:a5];
  if (v9)
  {
    uint64_t v10 = sub_10000A17C([RDUnarchiver alloc], v9, a3, a4);
    if (!v10)
    {
      BOOL v25 = 0;
      goto LABEL_27;
    }
    if (archive_read_next_header() == 1)
    {
LABEL_23:
      if (*((unsigned char *)v10 + 41))
      {
        BOOL v25 = *((unsigned char *)v10 + 40) != 0;
        archive_read_free();
        if (!*((unsigned char *)v10 + 40))
        {
LABEL_26:
          *((_WORD *)v10 + 20) = 0;
LABEL_27:

          return v25;
        }
      }
      else
      {
        BOOL v25 = 0;
        if (!*((unsigned char *)v10 + 40)) {
          goto LABEL_26;
        }
      }
      archive_write_free();
      goto LABEL_26;
    }
    while (2)
    {
      uint64_t v12 = archive_entry_pathname();
      if (!v12)
      {
        long long v29 = qword_10006EAE8;
        if (os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Got no pathname from entry", buf, 2u);
        }
        uint64_t v27 = 41;
        goto LABEL_22;
      }
      uint64_t v13 = +[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", +[NSString stringWithUTF8String:v12], v10[3]);
      [(NSString *)[(NSURL *)v13 path] UTF8String];
      archive_entry_set_pathname();
      if ((archive_write_header() & 0x80000000) != 0)
      {
        long long v26 = qword_10006EAE8;
        if (!os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR))
        {
LABEL_21:
          uint64_t v27 = 40;
LABEL_22:
          *((unsigned char *)v10 + v27) = 0;
          goto LABEL_23;
        }
        uint64_t v30 = archive_error_string();
        *(_DWORD *)long long buf = 136446210;
        __int16 v36 = (NSString *)v30;
        long long v31 = "Failed to write header. %{public}s";
LABEL_39:
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
        goto LABEL_21;
      }
      do
      {
        int data_block = archive_read_data_block();
        if (data_block == 1) {
          goto LABEL_11;
        }
        if (data_block < 0) {
          goto LABEL_20;
        }
        uint64_t v15 = archive_write_data_block();
      }
      while ((v15 & 0x8000000000000000) == 0);
      int v16 = v15;
      long long v17 = qword_10006EAE8;
      if (os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = archive_error_string();
        *(_DWORD *)long long buf = 136446210;
        __int16 v36 = (NSString *)v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to write a data block. %{public}s", buf, 0xCu);
        if ((v16 & 0x80000000) == 0) {
          goto LABEL_11;
        }
      }
      else if ((v16 & 0x80000000) == 0)
      {
LABEL_11:
        if ((archive_write_finish_entry() & 0x80000000) == 0)
        {
          SEL v18 = +[NSFileHandle fileHandleForUpdatingAtPath:[(NSURL *)v13 path]];
          int v19 = fcntl([(NSFileHandle *)v18 fileDescriptor], 64, v10[4]);
          if (v19 < 0)
          {
            int v20 = v19;
            id v21 = qword_10006EAE8;
            if (os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR))
            {
              double v23 = [(NSURL *)v13 path];
              uint64_t v34 = v10[4];
              int v24 = *__error();
              *(_DWORD *)long long buf = 138544130;
              __int16 v36 = v23;
              __int16 v37 = 2050;
              uint64_t v38 = v34;
              __int16 v39 = 1026;
              int v40 = v20;
              __int16 v41 = 1026;
              int v42 = v24;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to set data protection on file %{public}@ to %{public}ld because %{public}d %{public, errno}d", buf, 0x22u);
            }
          }
          [(NSFileHandle *)v18 closeFile];
          if (archive_read_next_header() != 1) {
            continue;
          }
          goto LABEL_23;
        }
        long long v26 = qword_10006EAE8;
        if (!os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        uint64_t v32 = archive_error_string();
        *(_DWORD *)long long buf = 136315138;
        __int16 v36 = (NSString *)v32;
        long long v31 = "Failed to finish writing entry. %s";
        goto LABEL_39;
      }
      break;
    }
LABEL_20:
    long long v26 = qword_10006EAE8;
    if (!os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v33 = archive_error_string();
    *(_DWORD *)long long buf = 136446210;
    __int16 v36 = (NSString *)v33;
    long long v31 = "Failed to copy data. %{public}s";
    goto LABEL_39;
  }
  return 0;
}

void sub_10000A830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  self;
  uint64_t v15 = 0;
  uint64_t v5 = +[NSData dataWithContentsOfURL:a2 options:1 error:&v15];
  if (v5)
  {
    id v6 = sub_10000A17C([RDUnarchiver alloc], v5, 0, 0);
    uint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_10000A9CC;
    uint64_t v13 = &unk_10005CDA0;
    uint64_t v14 = a3;
    if (v6)
    {
      uint64_t v17 = 0;
      if (archive_read_next_header() != 1)
      {
        while (1)
        {
          uint64_t v7 = archive_entry_pathname();
          if (!v7) {
            break;
          }
          uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7, v10, v11);
          ((void (*)(void ***, NSString *))v12)(&v10, v8);
          if (archive_read_next_header() == 1) {
            goto LABEL_11;
          }
        }
        id v9 = qword_10006EAE8;
        if (os_log_type_enabled((os_log_t)qword_10006EAE8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Got no pathname from entry", buf, 2u);
        }
        v6[41] = 0;
      }
    }
LABEL_11:
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, 0, v15);
  }
}

uint64_t sub_10000A9CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

SRAbsoluteTime SRAbsoluteTimeGetCurrent(void)
{
  uint64_t v0 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v1 = qword_10006EC90;
  double v2 = *(double *)&qword_10006EC98;
  double v3 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v1 >= v0) {
    double v4 = -v4;
  }
  return v3 + v2 + v4;
}

void sub_10000AE58(id a1)
{
  uint64_t v1 = mach_continuous_time();
  TMGetKernelMonotonicClock();
  qword_10006EC98 = v2;
  qword_10006EC90 = v1 + ((mach_continuous_time() - v1) >> 1);
}

BOOL SRAbsoluteTimeSetSyntheticStartFromRemoteTime(unint64_t a1, unint64_t a2, double a3, uint64_t a4, double *a5)
{
  mach_get_times();
  TMConvertTicksToSeconds();
  double v10 = v9;
  TMConvertTicksToSeconds();
  if (a2 < a1) {
    double v11 = -v11;
  }
  double v12 = v10 + a3 + v11;
  TMConvertTicksToSeconds();
  double v14 = v12 - v13;
  TMConvertTicksToSeconds();
  double v16 = v14 + v15;
  unint64_t v17 = qword_10006EC90;
  double v18 = *(double *)&qword_10006EC98;
  TMConvertTicksToSeconds();
  if (v16 > 0.0)
  {
    if (a1 > v17) {
      double v19 = -v19;
    }
    double v20 = v19 + v16 - v18;
    qword_10006ECA0 = *(void *)&v20;
    if (a5) {
      *a5 = v20;
    }
  }
  return v16 > 0.0;
}

CFTimeInterval SRAbsoluteTimeRoundedDownToNearestInterval(double a1, double a2)
{
  mach_get_times();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  double v4 = *(double *)&qword_10006EC98;
  double v5 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  double v7 = v6;
  mach_get_times();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  double v8 = *(double *)&qword_10006EC98;
  double v9 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  double v11 = -v10;
  double v12 = 1.0;
  if (a2 != 0.0) {
    double v12 = a2;
  }
  return kCFAbsoluteTimeIntervalSince1970
       + floor((a1 - (v4 + v5) + v7 + (double)0 - kCFAbsoluteTimeIntervalSince1970 + (double)0 * 0.000000001) / v12)
       * v12
       - (double)0
       + (double)0 * -0.000000001
       + v8
       + v9
       + v11;
}

id sub_10000B3B0(void *a1, id self)
{
  id v2 = a1;
  if (!a1) {
    return v2;
  }
  if (self && objc_getProperty(self, (SEL)self, 24, 1) && objc_getProperty(self, v4, 32, 1))
  {
    v8.receiver = v2;
    v8.super_class = (Class)RDWriteableDatastore;
    double v5 = [super init];
    id v2 = v5;
    if (v5)
    {
      v5[1] = 1;
      if (sub_10002AAFC(*((void **)self + 2), *((void **)self + 3))) {
        *((void *)v2 + 1) |= 4uLL;
      }
      *((_DWORD *)v2 + 4) = 514;
      *((void *)v2 + 3) = self;
    }
    return v2;
  }
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    double v7 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
LABEL_14:
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Trying to create a datastore object with an incomplete datastore context", buf, 2u);
    goto LABEL_12;
  }
  double v7 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
    goto LABEL_14;
  }
LABEL_12:

  return 0;
}

double sub_10000B550(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  double v3 = +[NSFileManager defaultManager];
  double v4 = *(void **)(a1 + 24);
  if (v4)
  {
    id Property = (NSURL *)objc_getProperty(v4, v2, 8, 1);
    double v7 = sub_100039EA8(*(NSArray **)(a1 + 24));
    objc_super v8 = *(void **)(a1 + 24);
    if (v8)
    {
LABEL_4:
      id v9 = objc_getProperty(v8, v6, 24, 1);
      goto LABEL_5;
    }
  }
  else
  {
    id Property = 0;
    double v7 = sub_100039EA8(0);
    objc_super v8 = *(void **)(a1 + 24);
    if (v8) {
      goto LABEL_4;
    }
  }
  id v9 = 0;
LABEL_5:
  double v10 = sub_10001B7D4(Property, (uint64_t)v7, v9, *(void *)(a1 + 8));
  id v11 = sub_10000600C((uint64_t)v3, (uint64_t)v10, 1);
  if ([v11 count])
  {
    [objc_msgSend(v11, "lastObject") doubleValue];
    double v14 = [(NSURL *)sub_10001BFB4(v12) lastPathComponent];
    double v15 = *(void **)(a1 + 24);
    if (v15)
    {
      double v16 = (NSURL *)objc_getProperty(v15, v13, 8, 1);
      double v18 = sub_100039EA8(*(NSArray **)(a1 + 24));
      double v19 = *(void **)(a1 + 24);
      if (v19)
      {
LABEL_8:
        id v20 = objc_getProperty(v19, v17, 24, 1);
        goto LABEL_9;
      }
    }
    else
    {
      double v16 = 0;
      double v18 = sub_100039EA8(0);
      double v19 = *(void **)(a1 + 24);
      if (v19) {
        goto LABEL_8;
      }
    }
    id v20 = 0;
LABEL_9:
    id v21 = +[NSURL fileURLWithPath:v14 isDirectory:0 relativeToURL:sub_10001B7D4(v16, (uint64_t)v18, v20, *(void *)(a1 + 8))];
    uint64_t v29 = 0;
    uint64_t v22 = +[NSFileHandle fileHandleForReadingFromURL:v21 error:&v29];
    if (v22)
    {
      double v23 = v22;
      int v24 = sub_10001DAB4([RDReader alloc], *(void **)(a1 + 24));
      CFStringRef v30 = @"samples";
      long long v31 = v23;
      double v25 = sub_10001E058((uint64_t)v24, +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1]);

      return v25;
    }
    if (qword_10006EAF8 == -1)
    {
      uint64_t v27 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
      {
LABEL_16:
        [(NSString *)[(NSURL *)v21 lastPathComponent] doubleValue];
        return v28 + 5.0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      uint64_t v27 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v33 = v21;
    __int16 v34 = 2114;
    uint64_t v35 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to open %{public}@ to find latest sample because %{public}@", buf, 0x16u);
    goto LABEL_16;
  }

  return nan("");
}

id sub_10000B8A8(uint64_t a1, uint64_t a2, uint64_t a3, const __CFString **a4)
{
  double v6 = +[NSURL fileURLWithPath:a2 isDirectory:0 relativeToURL:a3];
  [+[NSFileManager defaultManager] createDirectoryAtURL:[(NSURL *)v6 URLByDeletingLastPathComponent] withIntermediateDirectories:1 attributes:0 error:0];
  objc_super v8 = *(void **)(a1 + 24);
  if (v8)
  {
    id Property = objc_getProperty(v8, v7, 16, 1);
    id v11 = *(void **)(a1 + 24);
    if (v11) {
      id v12 = objc_getProperty(v11, v9, 24, 1);
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id Property = 0;
    id v12 = 0;
  }
  int v13 = sub_10002A464(Property, v12);
  id v14 = sub_10001D32C((uint64_t)NSFileHandle, v6, v13, *(_DWORD *)(a1 + 16), a4);
  if (v14)
  {
    if (qword_10006EAF8 == -1)
    {
      double v16 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
      {
LABEL_8:
        int v21 = 138543362;
        uint64_t v22 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Created a new segment %{public}@", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      double v16 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    if (qword_10006EAF8 == -1)
    {
      double v18 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return v14;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      double v18 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return v14;
      }
    }
    if (a4) {
      CFStringRef v20 = *a4;
    }
    else {
      CFStringRef v20 = @"(null)";
    }
    int v21 = 138543618;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    CFStringRef v24 = v20;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to create new segment %{public}@ because %{public}@", (uint8_t *)&v21, 0x16u);
  }
  return v14;
}

NSMutableDictionary *sub_10000BB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFString **a5)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return (NSMutableDictionary *)&__NSDictionary0__struct;
  }
  id v11 = +[NSMutableDictionary dictionaryWithCapacity:3];
  id v12 = *(void **)(a1 + 24);
  if (v12)
  {
    id Property = (NSURL *)objc_getProperty(v12, v10, 8, 1);
    double v15 = sub_100039EA8(*(NSArray **)(a1 + 24));
    double v16 = *(void **)(a1 + 24);
    if (v16)
    {
LABEL_5:
      id v17 = objc_getProperty(v16, v14, 24, 1);
      goto LABEL_6;
    }
  }
  else
  {
    id Property = 0;
    double v15 = sub_100039EA8(0);
    double v16 = *(void **)(a1 + 24);
    if (v16) {
      goto LABEL_5;
    }
  }
  id v17 = 0;
LABEL_6:
  double v18 = sub_10001B7D4(Property, (uint64_t)v15, v17, *(void *)(a1 + 8));
  id v19 = sub_10000B8A8(a1, a2, (uint64_t)v18, a5);
  if (!v19) {
    return (NSMutableDictionary *)&__NSDictionary0__struct;
  }
  [(NSMutableDictionary *)v11 setObject:v19 forKeyedSubscript:@"samples"];
  int v21 = *(void **)(a1 + 24);
  if (v21)
  {
    id v22 = +[SRSensorDescription sensorDescriptionForSensor:objc_getProperty(v21, v20, 24, 1)];
    if (!a3) {
      goto LABEL_14;
    }
  }
  else
  {
    id v22 = +[SRSensorDescription sensorDescriptionForSensor:0];
    if (!a3) {
      goto LABEL_14;
    }
  }
  if ([v22 metadataEnabled])
  {
    CFStringRef v24 = *(void **)(a1 + 24);
    if (v24)
    {
      double v25 = (NSURL *)objc_getProperty(v24, v23, 8, 1);
      uint64_t v27 = sub_100039EA8(*(NSArray **)(a1 + 24));
      double v28 = *(void **)(a1 + 24);
      if (v28)
      {
LABEL_12:
        id v29 = objc_getProperty(v28, v26, 24, 1);
LABEL_13:
        CFStringRef v30 = sub_10001B8A4(v25, (uint64_t)v27, v29, *(void *)(a1 + 8));
        [(NSMutableDictionary *)v11 setObject:sub_10000B8A8(a1, a3, (uint64_t)v30, a5) forKeyedSubscript:@"metadata"];
        goto LABEL_14;
      }
    }
    else
    {
      double v25 = 0;
      uint64_t v27 = sub_100039EA8(0);
      double v28 = *(void **)(a1 + 24);
      if (v28) {
        goto LABEL_12;
      }
    }
    id v29 = 0;
    goto LABEL_13;
  }
LABEL_14:
  if (a4 && [v22 sensorConfigurationEnabled])
  {
    uint64_t v32 = *(void **)(a1 + 24);
    if (v32)
    {
      uint64_t v33 = (NSURL *)objc_getProperty(v32, v31, 8, 1);
      uint64_t v35 = sub_100039EA8(*(NSArray **)(a1 + 24));
      __int16 v36 = *(void **)(a1 + 24);
      if (v36)
      {
LABEL_18:
        id v37 = objc_getProperty(v36, v34, 24, 1);
LABEL_19:
        uint64_t v38 = sub_10001B974(v33, (uint64_t)v35, v37, *(void *)(a1 + 8));
        [(NSMutableDictionary *)v11 setObject:sub_10000B8A8(a1, a4, (uint64_t)v38, a5) forKeyedSubscript:@"sensorConfiguration"];
        return v11;
      }
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v35 = sub_100039EA8(0);
      __int16 v36 = *(void **)(a1 + 24);
      if (v36) {
        goto LABEL_18;
      }
    }
    id v37 = 0;
    goto LABEL_19;
  }
  return v11;
}

id sub_10000BD98(void *a1, id self)
{
  id v2 = a1;
  if (!a1) {
    return v2;
  }
  if (self && objc_getProperty(self, (SEL)self, 24, 1) && objc_getProperty(self, v4, 32, 1))
  {
    v8.receiver = v2;
    v8.super_class = (Class)RDReadableDatastore;
    double v5 = [super init];
    id v2 = v5;
    if (v5)
    {
      void v5[2] = 0;
      if (sub_10002AAFC(*((void **)self + 2), *((void **)self + 3))) {
        *((void *)v2 + 2) |= 4uLL;
      }
      *((_DWORD *)v2 + 6) = 0;
      *((void *)v2 + 1) = self;
    }
    return v2;
  }
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    double v7 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
LABEL_14:
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Trying to create a datastore object with an incomplete datastore context", buf, 2u);
    goto LABEL_12;
  }
  double v7 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
    goto LABEL_14;
  }
LABEL_12:

  return 0;
}

NSDictionary *sub_10000BF30(uint64_t a1, const char *a2, NSURL *a3, NSURL *a4, void *a5)
{
  double v10 = *(void **)(a1 + 8);
  if (v10)
  {
    id Property = (NSURL *)objc_getProperty(v10, a2, 8, 1);
    int v13 = sub_100039EA8(*(NSArray **)(a1 + 8));
    id v14 = *(void **)(a1 + 8);
    if (v14)
    {
LABEL_3:
      id v15 = objc_getProperty(v14, v12, 24, 1);
      goto LABEL_4;
    }
  }
  else
  {
    id Property = 0;
    int v13 = sub_100039EA8(0);
    id v14 = *(void **)(a1 + 8);
    if (v14) {
      goto LABEL_3;
    }
  }
  id v15 = 0;
LABEL_4:
  id v17 = +[NSURL fileURLWithPath:a2 isDirectory:0 relativeToURL:sub_10001B7D4(Property, (uint64_t)v13, v15, *(void *)(a1 + 16))];
  if (!a3) {
    goto LABEL_9;
  }
  double v18 = *(void **)(a1 + 8);
  if (!v18)
  {
    id v19 = 0;
    int v21 = sub_100039EA8(0);
    id v22 = *(void **)(a1 + 8);
    if (v22) {
      goto LABEL_7;
    }
LABEL_24:
    id v23 = 0;
    goto LABEL_8;
  }
  id v19 = (NSURL *)objc_getProperty(v18, v16, 8, 1);
  int v21 = sub_100039EA8(*(NSArray **)(a1 + 8));
  id v22 = *(void **)(a1 + 8);
  if (!v22) {
    goto LABEL_24;
  }
LABEL_7:
  id v23 = objc_getProperty(v22, v20, 24, 1);
LABEL_8:
  a3 = +[NSURL fileURLWithPath:a3 isDirectory:0 relativeToURL:sub_10001B8A4(v19, (uint64_t)v21, v23, *(void *)(a1 + 16))];
LABEL_9:
  if (!a4) {
    goto LABEL_14;
  }
  CFStringRef v24 = *(void **)(a1 + 8);
  if (!v24)
  {
    double v25 = 0;
    uint64_t v27 = sub_100039EA8(0);
    double v28 = *(void **)(a1 + 8);
    if (v28) {
      goto LABEL_12;
    }
LABEL_26:
    id v29 = 0;
    goto LABEL_13;
  }
  double v25 = (NSURL *)objc_getProperty(v24, v16, 8, 1);
  uint64_t v27 = sub_100039EA8(*(NSArray **)(a1 + 8));
  double v28 = *(void **)(a1 + 8);
  if (!v28) {
    goto LABEL_26;
  }
LABEL_12:
  id v29 = objc_getProperty(v28, v26, 24, 1);
LABEL_13:
  a4 = +[NSURL fileURLWithPath:a4 isDirectory:0 relativeToURL:sub_10001B974(v25, (uint64_t)v27, v29, *(void *)(a1 + 16))];
LABEL_14:
  CFStringRef v30 = *(void **)(a1 + 8);
  if (v30)
  {
    uint64_t v32 = objc_getProperty(v30, v16, 16, 1);
    uint64_t v33 = *(void **)(a1 + 8);
    if (v33) {
      id v34 = objc_getProperty(v33, v31, 24, 1);
    }
    else {
      id v34 = 0;
    }
  }
  else
  {
    uint64_t v32 = 0;
    id v34 = 0;
  }
  int v35 = sub_10002A464(v32, v34);
  __int16 v36 = +[NSFileManager defaultManager];
  int v37 = *(_DWORD *)(a1 + 24);

  return sub_1000068CC((NSDictionary *)v36, v17, a3, a4, v35, v37, a5);
}

NSDictionary *sub_10000C19C(uint64_t a1, void *a2, double a3)
{
  if (!a1) {
    return 0;
  }
  double v7 = +[NSFileManager defaultManager];
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    id Property = (NSURL *)objc_getProperty(v8, v6, 8, 1);
    id v11 = sub_100039EA8(*(NSArray **)(a1 + 8));
    id v12 = *(void **)(a1 + 8);
    if (v12)
    {
LABEL_4:
      id v13 = objc_getProperty(v12, v10, 24, 1);
      goto LABEL_5;
    }
  }
  else
  {
    id Property = 0;
    id v11 = sub_100039EA8(0);
    id v12 = *(void **)(a1 + 8);
    if (v12) {
      goto LABEL_4;
    }
  }
  id v13 = 0;
LABEL_5:
  id v14 = sub_10001B7D4(Property, (uint64_t)v11, v13, *(void *)(a1 + 16));
  id v15 = sub_10000600C((uint64_t)v7, (uint64_t)v14, 0);
  double v16 = sub_10000C458(v15, a3);
  double v18 = &__NSDictionary0__struct;
  if (!v16) {
    return (NSDictionary *)v18;
  }
  id v19 = (const char *)v16;
  CFStringRef v20 = *(void **)(a1 + 8);
  if (v20)
  {
    id v21 = +[SRSensorDescription sensorDescriptionForSensor:objc_getProperty(v20, v17, 24, 1)];
    if ([v21 metadataEnabled]) {
      goto LABEL_8;
    }
LABEL_17:
    uint64_t v32 = 0;
    if (![v21 sensorConfigurationEnabled]) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  id v21 = +[SRSensorDescription sensorDescriptionForSensor:0];
  if (![v21 metadataEnabled]) {
    goto LABEL_17;
  }
LABEL_8:
  id v23 = +[NSFileManager defaultManager];
  CFStringRef v24 = *(void **)(a1 + 8);
  if (v24)
  {
    double v25 = (NSURL *)objc_getProperty(v24, v22, 8, 1);
    uint64_t v27 = sub_100039EA8(*(NSArray **)(a1 + 8));
    double v28 = *(void **)(a1 + 8);
    if (v28)
    {
LABEL_10:
      id v29 = objc_getProperty(v28, v26, 24, 1);
      goto LABEL_11;
    }
  }
  else
  {
    double v25 = 0;
    uint64_t v27 = sub_100039EA8(0);
    double v28 = *(void **)(a1 + 8);
    if (v28) {
      goto LABEL_10;
    }
  }
  id v29 = 0;
LABEL_11:
  CFStringRef v30 = sub_10001B8A4(v25, (uint64_t)v27, v29, *(void *)(a1 + 16));
  id v31 = sub_10000600C((uint64_t)v23, (uint64_t)v30, 0);
  uint64_t v32 = (NSURL *)sub_10000C458(v31, a3);
  if (![v21 sensorConfigurationEnabled])
  {
LABEL_12:
    uint64_t v33 = 0;
    goto LABEL_22;
  }
LABEL_18:
  int v35 = +[NSFileManager defaultManager];
  __int16 v36 = *(void **)(a1 + 8);
  if (!v36)
  {
    int v37 = 0;
    __int16 v39 = sub_100039EA8(0);
    int v40 = *(void **)(a1 + 8);
    if (v40) {
      goto LABEL_20;
    }
LABEL_28:
    id v41 = 0;
    goto LABEL_21;
  }
  int v37 = (NSURL *)objc_getProperty(v36, v34, 8, 1);
  __int16 v39 = sub_100039EA8(*(NSArray **)(a1 + 8));
  int v40 = *(void **)(a1 + 8);
  if (!v40) {
    goto LABEL_28;
  }
LABEL_20:
  id v41 = objc_getProperty(v40, v38, 24, 1);
LABEL_21:
  int v42 = sub_10001B974(v37, (uint64_t)v39, v41, *(void *)(a1 + 16));
  id v43 = sub_10000600C((uint64_t)v35, (uint64_t)v42, 0);
  uint64_t v33 = (NSURL *)sub_10000C458(v43, a3);
LABEL_22:
  int v44 = sub_10000BF30(a1, v19, v32, v33, a2);
  if ([(NSDictionary *)v44 objectForKeyedSubscript:@"samples"]) {
    return v44;
  }
  return (NSDictionary *)v18;
}

NSString *sub_10000C458(void *a1, double a2)
{
  uint64_t result = (NSString *)[a1 count];
  if (result)
  {
    double v5 = +[NSNumber numberWithDouble:a2];
    double v6 = (char *)[a1 indexOfObject:v5 inSortedRange:0 options:1024 usingComparator:&stru_10005CE00];
    if (v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6)
      {
        objc_super v8 = v6 - 1;
        if (v6 - 1 < [a1 count])
        {
LABEL_6:
          [a1[v8] doubleValue];
          double v10 = [(NSURL *)sub_10001BFB4(v9) lastPathComponent];
          if (qword_10006EAF8 == -1)
          {
            id v11 = qword_10006EB00;
            if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
            {
LABEL_9:
              [a1[v8] doubleValue];
              return [(NSURL *)sub_10001BFB4(v12) lastPathComponent];
            }
          }
          else
          {
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            id v11 = qword_10006EB00;
            if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
              goto LABEL_9;
            }
          }
          int v14 = 138543618;
          id v15 = v10;
          __int16 v16 = 2050;
          double v17 = a2;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Returning segment %{public}@ which contains sample %{public}f", (uint8_t *)&v14, 0x16u);
          goto LABEL_9;
        }
      }
      else
      {
        id v7 = [[objc_msgSend(a1, "firstObject") compare:v5];
        objc_super v8 = 0;
        uint64_t result = 0;
        if ((unint64_t)v7 >= 2) {
          return result;
        }
        if ([a1 count]) {
          goto LABEL_6;
        }
      }
      if (qword_10006EAF8 != -1)
      {
        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
        id v13 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        goto LABEL_13;
      }
      id v13 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
      {
LABEL_13:
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No closest segment found", (uint8_t *)&v14, 2u);
      }
    }
    return 0;
  }
  return result;
}

NSDictionary *sub_10000C6CC(uint64_t a1, void *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    if (qword_10006EAF8 == -1)
    {
      int v37 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      int v37 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    *(_WORD *)v50 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "No segment provided", v50, 2u);
    return 0;
  }
  id v7 = +[NSFileManager defaultManager];
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    id Property = (NSURL *)objc_getProperty(v8, v6, 8, 1);
    id v11 = sub_100039EA8(*(NSArray **)(a1 + 8));
    double v12 = *(void **)(a1 + 8);
    if (v12)
    {
LABEL_5:
      id v13 = objc_getProperty(v12, v10, 24, 1);
      goto LABEL_6;
    }
  }
  else
  {
    id Property = 0;
    id v11 = sub_100039EA8(0);
    double v12 = *(void **)(a1 + 8);
    if (v12) {
      goto LABEL_5;
    }
  }
  id v13 = 0;
LABEL_6:
  int v14 = sub_10001B7D4(Property, (uint64_t)v11, v13, *(void *)(a1 + 16));
  id v15 = sub_10000600C((uint64_t)v7, (uint64_t)v14, 0);
  [a2 doubleValue];
  double v17 = sub_10000CA28(v15, v16);
  double v18 = &__NSDictionary0__struct;
  if (!v17) {
    return (NSDictionary *)v18;
  }
  id v19 = (const char *)v17;
  [(NSString *)v17 doubleValue];
  double v22 = v21;
  id v23 = *(void **)(a1 + 8);
  if (v23)
  {
    id v24 = +[SRSensorDescription sensorDescriptionForSensor:objc_getProperty(v23, v20, 24, 1)];
    if ([v24 metadataEnabled]) {
      goto LABEL_9;
    }
LABEL_22:
    int v35 = 0;
    if (![v24 sensorConfigurationEnabled]) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
  id v24 = +[SRSensorDescription sensorDescriptionForSensor:0];
  if (![v24 metadataEnabled]) {
    goto LABEL_22;
  }
LABEL_9:
  long long v26 = +[NSFileManager defaultManager];
  uint64_t v27 = *(void **)(a1 + 8);
  if (v27)
  {
    double v28 = (NSURL *)objc_getProperty(v27, v25, 8, 1);
    CFStringRef v30 = sub_100039EA8(*(NSArray **)(a1 + 8));
    id v31 = *(void **)(a1 + 8);
    if (v31)
    {
LABEL_11:
      id v32 = objc_getProperty(v31, v29, 24, 1);
      goto LABEL_12;
    }
  }
  else
  {
    double v28 = 0;
    CFStringRef v30 = sub_100039EA8(0);
    id v31 = *(void **)(a1 + 8);
    if (v31) {
      goto LABEL_11;
    }
  }
  id v32 = 0;
LABEL_12:
  uint64_t v33 = sub_10001B8A4(v28, (uint64_t)v30, v32, *(void *)(a1 + 16));
  id v34 = sub_10000600C((uint64_t)v26, (uint64_t)v33, 0);
  int v35 = (NSURL *)sub_10000CA28(v34, v22);
  if (![v24 sensorConfigurationEnabled])
  {
LABEL_13:
    __int16 v36 = 0;
    goto LABEL_27;
  }
LABEL_23:
  __int16 v39 = +[NSFileManager defaultManager];
  int v40 = *(void **)(a1 + 8);
  if (!v40)
  {
    id v41 = 0;
    id v43 = sub_100039EA8(0);
    int v44 = *(void **)(a1 + 8);
    if (v44) {
      goto LABEL_25;
    }
LABEL_33:
    id v45 = 0;
    goto LABEL_26;
  }
  id v41 = (NSURL *)objc_getProperty(v40, v38, 8, 1);
  id v43 = sub_100039EA8(*(NSArray **)(a1 + 8));
  int v44 = *(void **)(a1 + 8);
  if (!v44) {
    goto LABEL_33;
  }
LABEL_25:
  id v45 = objc_getProperty(v44, v42, 24, 1);
LABEL_26:
  v46 = sub_10001B974(v41, (uint64_t)v43, v45, *(void *)(a1 + 16));
  id v47 = sub_10000600C((uint64_t)v39, (uint64_t)v46, 0);
  __int16 v36 = (NSURL *)sub_10000CA28(v47, v22);
LABEL_27:
  v48 = sub_10000BF30(a1, v19, v35, v36, a3);
  if ([(NSDictionary *)v48 objectForKeyedSubscript:@"samples"]) {
    return v48;
  }
  return (NSDictionary *)v18;
}

NSString *sub_10000CA28(void *a1, double a2)
{
  double v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v5 = [a1 indexOfObject:v4 inSortedRange:0 options:1536 usingComparator:&stru_10005CDE0];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v6 = (unint64_t)v5;
  if (!v5 && (unint64_t)objc_msgSend(objc_msgSend(a1, "firstObject"), "compare:", v4) > 1) {
    return 0;
  }
  if (v6 >= (unint64_t)[a1 count])
  {
    if (qword_10006EAF8 == -1)
    {
      double v10 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      double v10 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
        return 0;
      }
    }
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No closest segment found", (uint8_t *)&v12, 2u);
    return 0;
  }
  [a1[v6] doubleValue];
  objc_super v8 = [(NSURL *)sub_10001BFB4(v7) lastPathComponent];
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    double v9 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
      return v8;
    }
    goto LABEL_7;
  }
  double v9 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2050;
    double v15 = a2;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Returning segment %{public}@ which was closest segment after requested segment %{public}f", (uint8_t *)&v12, 0x16u);
  }
  return v8;
}

int64_t sub_10000CC50(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

int64_t sub_10000CC58(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

id sub_10000CC60(void *a1, void **self)
{
  id v2 = a1;
  if (!a1) {
    return v2;
  }
  if (self && objc_getProperty(self, (SEL)self, 24, 1) && objc_getProperty(self, v4, 32, 1))
  {
    v7.receiver = v2;
    v7.super_class = (Class)RDPruneableDatastore;
    id v2 = [super init];
    if (v2)
    {
      *((void *)v2 + 1) = self;
      *((void *)v2 + 2) = 2;
      if (sub_10002AAFC(self[2], self[3])) {
        *((void *)v2 + 2) |= 4uLL;
      }
      *((_DWORD *)v2 + 6) = 2;
    }
    return v2;
  }
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    unint64_t v6 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
LABEL_14:
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Trying to create a datastore object with an incomplete datastore context", buf, 2u);
    goto LABEL_12;
  }
  unint64_t v6 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
    goto LABEL_14;
  }
LABEL_12:

  return 0;
}

uint64_t sub_10000CE04(uint64_t a1, const char *a2, uint64_t a3, int a4, double a5, double a6)
{
  if (!a1) {
    return 0;
  }
  id v12 = *(id *)(a1 + 8);
  if (v12)
  {
    id Property = (NSURL *)objc_getProperty(v12, a2, 8, 1);
    id v12 = *(id *)(a1 + 8);
    if (v12) {
      id v12 = objc_getProperty(v12, v13, 32, 1);
    }
  }
  else
  {
    id Property = 0;
  }
  id v89 = v12;
  double v16 = +[NSArray arrayWithObjects:&v89 count:1];
  double v17 = *(void **)(a1 + 8);
  if (v17) {
    id v18 = objc_getProperty(v17, v15, 24, 1);
  }
  else {
    id v18 = 0;
  }
  id v19 = sub_10001B7D4(Property, (uint64_t)v16, v18, 2);
  double v83 = a5;
  double v82 = 0.0;
  uint64_t v21 = sub_1000069E0((uint64_t)+[NSFileManager defaultManager], v19, a4, (uint64_t)&v83, &v82, a5, a6);
  if ((a4 & 1) == 0)
  {
    id v22 = *(id *)(a1 + 8);
    if (v22) {
      id v22 = objc_getProperty(v22, v20, 24, 1);
    }
    unsigned int v23 = [v22 hasSuffix:@".tombstones"];
    if (a2 != (const char *)2 && !v23 && v21 >= 1)
    {
      if (v82 > a6) {
        a3 = 4096;
      }
      sub_10000D88C(a1, a2, a3, v83, a5);
    }
  }
  double v81 = a5;
  double v80 = 0.0;
  id v24 = *(id *)(a1 + 8);
  if (v24)
  {
    id v26 = objc_getProperty(v24, v20, 8, 1);
    id v24 = *(id *)(a1 + 8);
    if (v24) {
      id v24 = objc_getProperty(v24, v25, 32, 1);
    }
  }
  else
  {
    id v26 = 0;
  }
  id v88 = v24;
  double v28 = +[NSArray arrayWithObjects:&v88 count:1];
  id v29 = *(void **)(a1 + 8);
  if (v29) {
    id v30 = objc_getProperty(v29, v27, 24, 1);
  }
  else {
    id v30 = 0;
  }
  id v31 = sub_10001BB24((uint64_t)v26, (uint64_t)v28, v30);
  uint64_t v32 = sub_1000069E0((uint64_t)+[NSFileManager defaultManager], v31, a4, (uint64_t)&v81, &v80, a5, a6);
  uint64_t v34 = v32;
  if ((a4 & 1) == 0 && v32)
  {
    if (v80 <= a6)
    {
      if (a2 == (const char *)2)
      {
        int v35 = *(void **)(a1 + 8);
        id v36 = v35 ? objc_getProperty(v35, v33, 32, 1) : 0;
        self;
        if (![v36 isEqualToString:qword_10006ECB0]) {
          a3 = 4098;
        }
      }
    }
    else
    {
      a3 = 4096;
    }
    sub_10000D88C(a1, a2, a3, v81, a5);
  }
  id v37 = *(id *)(a1 + 8);
  if (v37)
  {
    id v39 = objc_getProperty(v37, v33, 8, 1);
    id v37 = *(id *)(a1 + 8);
    if (v37) {
      id v37 = objc_getProperty(v37, v38, 32, 1);
    }
  }
  else
  {
    id v39 = 0;
  }
  id v87 = v37;
  id v41 = +[NSArray arrayWithObjects:&v87 count:1];
  int v42 = *(void **)(a1 + 8);
  if (v42) {
    id v43 = objc_getProperty(v42, v40, 24, 1);
  }
  else {
    id v43 = 0;
  }
  int v44 = sub_10001BA44((uint64_t)v39, (uint64_t)v41, v43);
  uint64_t v45 = sub_1000069E0((uint64_t)+[NSFileManager defaultManager], v44, a4, (uint64_t)&v81, &v80, a5, a6);
  uint64_t v47 = v45;
  if ((a4 & 1) == 0 && v45)
  {
    if (v80 <= a6)
    {
      if (a2 == (const char *)2)
      {
        v48 = *(void **)(a1 + 8);
        id v49 = v48 ? objc_getProperty(v48, v46, 32, 1) : 0;
        self;
        if (![v49 isEqualToString:qword_10006ECB0]) {
          a3 = 4099;
        }
      }
    }
    else
    {
      a3 = 4096;
    }
    sub_10000D88C(a1, a2, a3, v81, a5);
  }
  uint64_t v50 = v34 + v21;
  id v51 = *(id *)(a1 + 8);
  if (v51)
  {
    id v53 = objc_getProperty(v51, v46, 8, 1);
    id v51 = *(id *)(a1 + 8);
    if (v51) {
      id v51 = objc_getProperty(v51, v52, 32, 1);
    }
  }
  else
  {
    id v53 = 0;
  }
  uint64_t v54 = v50 + v47;
  id v86 = v51;
  long long v56 = +[NSArray arrayWithObjects:&v86 count:1];
  long long v57 = *(void **)(a1 + 8);
  if (v57) {
    id v58 = objc_getProperty(v57, v55, 24, 1);
  }
  else {
    id v58 = 0;
  }
  double v59 = sub_10001BC04((uint64_t)v53, (uint64_t)v56, v58);
  uint64_t v61 = v54
      + sub_1000069E0((uint64_t)+[NSFileManager defaultManager], v59, a4, 0, 0, a5, a6);
  if (a2 == (const char *)2 || a3 == 4096)
  {
    id v62 = *(id *)(a1 + 8);
    if (v62)
    {
      v64 = (NSURL *)objc_getProperty(v62, v60, 8, 1);
      id v62 = *(id *)(a1 + 8);
      if (v62) {
        id v62 = objc_getProperty(v62, v63, 32, 1);
      }
    }
    else
    {
      v64 = 0;
    }
    id v85 = v62;
    double v66 = +[NSArray arrayWithObjects:&v85 count:1];
    __int16 v67 = *(void **)(a1 + 8);
    if (v67) {
      id v68 = objc_getProperty(v67, v65, 24, 1);
    }
    else {
      id v68 = 0;
    }
    __int16 v69 = sub_10001B8A4(v64, (uint64_t)v66, v68, 1);
    sub_1000069E0((uint64_t)+[NSFileManager defaultManager], v69, a4, 0, 0, a5, a6);
    id v71 = *(id *)(a1 + 8);
    if (v71)
    {
      v73 = (NSURL *)objc_getProperty(v71, v70, 8, 1);
      id v71 = *(id *)(a1 + 8);
      if (v71) {
        id v71 = objc_getProperty(v71, v72, 32, 1);
      }
    }
    else
    {
      v73 = 0;
    }
    id v84 = v71;
    v75 = +[NSArray arrayWithObjects:&v84 count:1];
    v76 = *(void **)(a1 + 8);
    if (v76) {
      id v77 = objc_getProperty(v76, v74, 24, 1);
    }
    else {
      id v77 = 0;
    }
    v78 = sub_10001B974(v73, (uint64_t)v75, v77, 1);
    sub_1000069E0((uint64_t)+[NSFileManager defaultManager], v78, a4, 0, 0, a5, a6);
  }
  return v61;
}

id sub_10000D430(id result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    v29[0] = NSURLIsDirectoryKey;
    v29[1] = NSURLFileSizeKey;
    v29[2] = NSURLLinkCountKey;
    id v2 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:sub_10000D798((uint64_t)result) includingPropertiesForKeys:+[NSArray arrayWithObjects:v29 count:3] options:0 errorHandler:0];
    double v3 = +[NSFileManager defaultManager];
    double v4 = sub_10000D798(v1);
    id v5 = [sub_10000600C((uint64_t)v3, (uint64_t)v4, 1) lastObject];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t result = [(NSDirectoryEnumerator *)v2 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v21;
      *(void *)&long long v6 = 138543618;
      long long v17 = v6;
      do
      {
        double v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v2);
          }
          double v10 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v9);
          id v19 = 0;
          [v10 getResourceValue:&v19 forKey:NSURLIsDirectoryKey error:0];
          if ([v19 BOOLValue]) {
            goto LABEL_6;
          }
          if (sub_100005E58(+[NSFileManager defaultManager], v10)) {
            goto LABEL_6;
          }
          [objc_msgSend(v10, "lastPathComponent") doubleValue];
          double v13 = v12;
          [v5 doubleValue];
          if (v13 == v14) {
            goto LABEL_6;
          }
          if (qword_10006EAF8 == -1)
          {
            double v15 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_19;
            }
          }
          else
          {
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            double v15 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
            {
LABEL_19:
              *(_DWORD *)long long buf = 138543362;
              double v25 = v10;
              _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Deleting empty sample %{public}@", buf, 0xCu);
            }
          }
          uint64_t v18 = 0;
          if ([+[NSFileManager defaultManager] removeItemAtURL:v10 error:&v18])
          {
            goto LABEL_6;
          }
          if (qword_10006EAF8 == -1)
          {
            double v16 = qword_10006EB00;
            if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
              goto LABEL_6;
            }
LABEL_17:
            *(_DWORD *)long long buf = v17;
            double v25 = v10;
            __int16 v26 = 2114;
            uint64_t v27 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ because %{public}@", buf, 0x16u);
            goto LABEL_6;
          }
          dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          double v16 = qword_10006EB00;
          if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
LABEL_6:
          double v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        uint64_t result = [(NSDirectoryEnumerator *)v2 countByEnumeratingWithState:&v20 objects:v28 count:16];
        id v7 = result;
      }
      while (result);
    }
  }
  return result;
}

NSURL *sub_10000D798(uint64_t a1)
{
  id v2 = [RDReadableDatastore alloc];
  if (!v2
    || (double v4 = *(void **)(a1 + 8),
        uint64_t v3 = *(void *)(a1 + 16),
        int v5 = *(_DWORD *)(a1 + 24),
        v17.receiver = v2,
        v17.super_class = (Class)RDReadableDatastore,
        (id v6 = objc_msgSendSuper2(&v17, "init")) == 0))
  {
    id v7 = 0;
    double v15 = 0;
    goto LABEL_8;
  }
  id v7 = v6;
  id v8 = v4;
  *((void *)v7 + 1) = v8;
  *((void *)v7 + 2) = v3;
  *((_DWORD *)v7 + 6) = v5;
  if (!v8)
  {
    id Property = 0;
    double v12 = sub_100039EA8(0);
    double v13 = (void *)*((void *)v7 + 1);
    if (v13) {
      goto LABEL_5;
    }
LABEL_10:
    id v14 = 0;
    goto LABEL_6;
  }
  id Property = (NSURL *)objc_getProperty(v8, v9, 8, 1);
  double v12 = sub_100039EA8(*((NSArray **)v7 + 1));
  double v13 = (void *)*((void *)v7 + 1);
  if (!v13) {
    goto LABEL_10;
  }
LABEL_5:
  id v14 = objc_getProperty(v13, v11, 24, 1);
LABEL_6:
  double v15 = sub_10001B7D4(Property, (uint64_t)v12, v14, *((void *)v7 + 2));
LABEL_8:

  return v15;
}

void sub_10000D88C(uint64_t a1, const char *a2, uint64_t a3, double a4, double a5)
{
  double v10 = *(void **)(a1 + 8);
  if (v10) {
    id Property = objc_getProperty(v10, a2, 32, 1);
  }
  else {
    id Property = 0;
  }
  self;
  if ([Property isEqualToString:qword_10006ECB0])
  {
    uint64_t v12 = 0;
  }
  else
  {
    self;
    uint64_t v12 = qword_10006ECB0;
  }
  uint64_t v13 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v14 = qword_10006EC90;
  double v15 = *(double *)&qword_10006EC98;
  double v16 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v14 >= v13) {
    double v18 = -v18;
  }
  double v19 = fmin(a5, v16 + v15 + v18);
  if (a3)
  {
    if (a3 == 4096)
    {
      long long v20 = *(void **)(a1 + 8);
      if (v20)
      {
        id v22 = objc_getProperty(v20, v17, 16, 1);
        long long v23 = *(void **)(a1 + 8);
        if (v23) {
          id v24 = objc_getProperty(v23, v21, 24, 1);
        }
        else {
          id v24 = 0;
        }
      }
      else
      {
        id v22 = 0;
        id v24 = 0;
      }
      a4 = fmax(v19 - (double)(unint64_t)sub_10002A58C((uint64_t)v22, v24), 0.0);
    }
    id v26 = +[SRDeletionRecord tombstoneWithStartTime:a3 endTime:v12 extendedReason:a4 originatingDeviceIdentifier:v19];
    id v27 = *(id *)(a1 + 8);
    if (v27) {
      goto LABEL_17;
    }
  }
  else
  {
    id v26 = +[SRDeletionRecord tombstoneWithStartTime:a2 endTime:v12 reason:a4 originatingDeviceIdentifier:v19];
    id v27 = *(id *)(a1 + 8);
    if (v27) {
LABEL_17:
    }
      id v27 = objc_getProperty(v27, v25, 24, 1);
  }
  id v29 = [v27 sr_sensorForDeletionRecordsFromSensor];
  id v30 = *(void **)(a1 + 8);
  if (v30)
  {
    id v32 = objc_getProperty(v30, v28, 32, 1);
    uint64_t v33 = *(void **)(a1 + 8);
    if (v33)
    {
      id v35 = objc_getProperty(v33, v31, 8, 1);
      id v36 = *(void **)(a1 + 8);
      if (v36)
      {
        id v37 = objc_getProperty(v36, v34, 16, 1);
        goto LABEL_22;
      }
    }
    else
    {
      id v35 = 0;
    }
    id v37 = 0;
  }
  else
  {
    id v35 = 0;
    id v32 = 0;
    id v37 = 0;
  }
LABEL_22:
  uint64_t v38 = sub_100039FA8(v29, v32, v35, v37);
  CFStringRef v46 = 0;
  id v39 = sub_100001E88([RDWriter alloc], v38);
  if (v39)
  {
    uint64_t v40 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v41 = qword_10006EC90;
    double v42 = *(double *)&qword_10006EC98;
    double v43 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v41 >= v40) {
      double v44 = -v44;
    }
    sub_100001F54((uint64_t)v39, v26, &v46, v43 + v42 + v44);
  }

  if (v46)
  {
    if (qword_10006EAF8 == -1)
    {
      uint64_t v45 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return;
      }
LABEL_35:
      *(_DWORD *)long long buf = 138543362;
      CFStringRef v48 = v46;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to write deletion records because %{public}@", buf, 0xCu);
      return;
    }
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    uint64_t v45 = qword_10006EB00;
    if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
  }
}

uint64_t sub_10000DC68(uint64_t result, const char *a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    id v6 = *(id *)(result + 8);
    if (v6)
    {
      id Property = objc_getProperty(v6, a2, 8, 1);
      id v6 = *(id *)(v5 + 8);
      if (v6) {
        id v6 = objc_getProperty(v6, v7, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v29 = v6;
    double v10 = +[NSArray arrayWithObjects:&v29 count:1];
    id v11 = *(void **)(v5 + 8);
    if (v11)
    {
      id v12 = objc_getProperty(v11, v9, 24, 1);
      unint64_t v14 = sub_10001BB24((uint64_t)Property, (uint64_t)v10, v12);
      id v15 = *(id *)(v5 + 8);
      if (v15) {
        goto LABEL_7;
      }
    }
    else
    {
      unint64_t v14 = sub_10001BB24((uint64_t)Property, (uint64_t)v10, 0);
      id v15 = *(id *)(v5 + 8);
      if (v15)
      {
LABEL_7:
        id v17 = objc_getProperty(v15, v13, 8, 1);
        id v15 = *(id *)(v5 + 8);
        if (v15) {
          id v15 = objc_getProperty(v15, v16, 32, 1);
        }
LABEL_9:
        id v28 = v15;
        double v19 = +[NSArray arrayWithObjects:&v28 count:1];
        long long v20 = *(void **)(v5 + 8);
        if (v20) {
          id v21 = objc_getProperty(v20, v18, 24, 1);
        }
        else {
          id v21 = 0;
        }
        id v22 = sub_10001BC04((uint64_t)v17, (uint64_t)v19, v21);
        long long v23 = +[NSURL fileURLWithPath:a2 isDirectory:0 relativeToURL:v14];
        if ([+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v23 path]])
        {
LABEL_16:
          uint64_t result = [+[NSFileManager defaultManager] removeItemAtURL:v23 error:a3];
          if (!result) {
            return result;
          }
          if (qword_10006EAF8 == -1)
          {
            double v25 = qword_10006EB00;
            if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
              return 1;
            }
          }
          else
          {
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            double v25 = qword_10006EB00;
            if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
              return 1;
            }
          }
          int v26 = 138543362;
          id v27 = v23;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Removed snapshot URL %{public}@", (uint8_t *)&v26, 0xCu);
          return 1;
        }
        if (qword_10006EAF8 == -1)
        {
          id v24 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
          {
LABEL_15:
            long long v23 = +[NSURL fileURLWithPath:a2 isDirectory:0 relativeToURL:v22];
            goto LABEL_16;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          id v24 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
            goto LABEL_15;
          }
        }
        int v26 = 138543362;
        id v27 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@ doesn't existing, looking for an already delivered snapshot", (uint8_t *)&v26, 0xCu);
        goto LABEL_15;
      }
    }
    id v17 = 0;
    goto LABEL_9;
  }
  return result;
}

NSDictionary *sub_10000DF78(uint64_t a1, void *a2, double a3)
{
  if (!a1) {
    return 0;
  }
  id v6 = [RDReadableDatastore alloc];
  if (v6)
  {
    id v8 = *(void **)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 16);
    int v9 = *(_DWORD *)(a1 + 24);
    v13.receiver = v6;
    v13.super_class = (Class)RDReadableDatastore;
    double v10 = [super init];
    if (v10)
    {
      v10[1] = v8;
      v10[2] = v7;
      *((_DWORD *)v10 + 6) = v9;
    }
  }
  else
  {
    double v10 = 0;
  }
  id v11 = sub_10000C19C((uint64_t)v10, a2, a3);

  return v11;
}

NSDictionary *sub_10000E038(uint64_t a1, void *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  id v6 = [RDReadableDatastore alloc];
  if (v6)
  {
    id v8 = *(void **)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 16);
    int v9 = *(_DWORD *)(a1 + 24);
    v13.receiver = v6;
    v13.super_class = (Class)RDReadableDatastore;
    double v10 = [super init];
    if (v10)
    {
      v10[1] = v8;
      v10[2] = v7;
      *((_DWORD *)v10 + 6) = v9;
    }
  }
  else
  {
    double v10 = 0;
  }
  id v11 = sub_10000C6CC((uint64_t)v10, a2, a3);

  return v11;
}

void *sub_10000E0F0(void *a1, id self)
{
  id v2 = a1;
  if (!a1) {
    return v2;
  }
  if (self && objc_getProperty(self, (SEL)self, 24, 1))
  {
    v6.receiver = v2;
    v6.super_class = (Class)RDInformingDatastore;
    id v2 = [super init];
    if (v2) {
      v2[1] = self;
    }
    return v2;
  }
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    uint64_t v5 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
LABEL_11:
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Trying to create a datastore object without a sensor identifier", buf, 2u);
    goto LABEL_9;
  }
  uint64_t v5 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
    goto LABEL_11;
  }
LABEL_9:

  return 0;
}

uint64_t sub_10000E254(uint64_t result, const char *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    id v3 = *(id *)(result + 8);
    if (v3)
    {
      id Property = (NSURL *)objc_getProperty(v3, a2, 8, 1);
      id v3 = *(id *)(v2 + 8);
      if (v3) {
        id v3 = objc_getProperty(v3, v4, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v11 = v3;
    uint64_t v7 = +[NSArray arrayWithObjects:&v11 count:1];
    id v8 = *(void **)(v2 + 8);
    if (v8) {
      id v9 = objc_getProperty(v8, v6, 24, 1);
    }
    else {
      id v9 = 0;
    }
    double v10 = sub_10001B7D4(Property, (uint64_t)v7, v9, 0);
    return sub_10001C0BC((uint64_t)RDFileURLs, v10);
  }
  return result;
}

NSSet *sub_10000E348(NSSet *result)
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = +[NSMutableSet set];
    Class isa = v1[1].super.isa;
    context = v4;
    if (isa)
    {
      id Property = objc_getProperty(isa, v3, 8, 1);
      Class v8 = v1[1].super.isa;
      if (v8) {
        id v9 = objc_getProperty(v8, v6, 24, 1);
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id Property = 0;
      id v9 = 0;
    }
    NSURLResourceKey v25 = NSURLIsDirectoryKey;
    double v10 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:sub_10001B5C4((uint64_t)Property, v9) includingPropertiesForKeys:+[NSArray arrayWithObjects:&v25 count:1] options:0 errorHandler:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [(NSDirectoryEnumerator *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v19 = 0;
          [v15 getResourceValue:&v19 forKey:NSURLIsDirectoryKey error:0];
          if ([v19 BOOLValue])
          {
            id v17 = [v15 pathComponents];
            if (sub_10001C014((uint64_t)RDFileURLs, v17) != 0x7FFFFFFFFFFFFFFFLL
              || sub_10001C05C((uint64_t)RDFileURLs, v17) != 0x7FFFFFFFFFFFFFFFLL)
            {
              [v2 addObject:[v17 objectAtIndexedSubscript:x0]];
            }
          }
        }
        id v12 = [(NSDirectoryEnumerator *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
    return +[NSSet setWithSet:v2];
  }
  return result;
}

void *sub_10000E5A4(void *result, const char *a2)
{
  if (result)
  {
    id v2 = result;
    id v3 = (id)result[1];
    if (v3)
    {
      id Property = objc_getProperty(v3, a2, 8, 1);
      id v3 = (id)v2[1];
      if (v3) {
        id v3 = objc_getProperty(v3, v4, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v15 = v3;
    uint64_t v7 = +[NSArray arrayWithObjects:&v15 count:1];
    Class v8 = (void *)v2[1];
    if (v8)
    {
      id v9 = objc_getProperty(v8, v6, 24, 1);
      id v11 = sub_10001BB24((uint64_t)Property, (uint64_t)v7, v9);
      id v12 = (void *)v2[1];
      if (!v12) {
        goto LABEL_11;
      }
    }
    else
    {
      id v11 = sub_10001BB24((uint64_t)Property, (uint64_t)v7, 0);
      id v12 = (void *)v2[1];
      if (!v12) {
        goto LABEL_11;
      }
    }
    if (objc_getProperty(v12, v10, 32, 1)) {
      return sub_100006754(+[NSFileManager defaultManager], (uint64_t)v11);
    }
LABEL_11:
    if (qword_10006EAF8 == -1)
    {
      uint64_t v13 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      uint64_t v13 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    *(_WORD *)unint64_t v14 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "No device id provided for oldestSnapshotURLInDirectory", v14, 2u);
    return 0;
  }
  return result;
}

void *sub_10000E77C(void *result, const char *a2)
{
  if (result)
  {
    id v2 = result;
    id v3 = (id)result[1];
    if (v3)
    {
      id Property = objc_getProperty(v3, a2, 8, 1);
      id v3 = (id)v2[1];
      if (v3) {
        id v3 = objc_getProperty(v3, v4, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v11 = v3;
    uint64_t v7 = +[NSArray arrayWithObjects:&v11 count:1];
    Class v8 = (void *)v2[1];
    if (v8) {
      id v9 = objc_getProperty(v8, v6, 24, 1);
    }
    else {
      id v9 = 0;
    }
    double v10 = sub_10001BB24((uint64_t)Property, (uint64_t)v7, v9);
    return sub_100006538((uint64_t)+[NSFileManager defaultManager], (uint64_t)v10);
  }
  return result;
}

void *sub_10000E870(void *result, const char *a2)
{
  if (result)
  {
    id v2 = result;
    id v3 = (id)result[1];
    if (v3)
    {
      id Property = objc_getProperty(v3, a2, 8, 1);
      id v3 = (id)v2[1];
      if (v3) {
        id v3 = objc_getProperty(v3, v4, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v11 = v3;
    uint64_t v7 = +[NSArray arrayWithObjects:&v11 count:1];
    Class v8 = (void *)v2[1];
    if (v8) {
      id v9 = objc_getProperty(v8, v6, 24, 1);
    }
    else {
      id v9 = 0;
    }
    double v10 = sub_10001BA44((uint64_t)Property, (uint64_t)v7, v9);
    return sub_100006538((uint64_t)+[NSFileManager defaultManager], (uint64_t)v10);
  }
  return result;
}

NSDirectoryEnumerator *sub_10000E964(NSDirectoryEnumerator *result, const char *a2)
{
  if (result)
  {
    id v2 = result;
    id isa = result[1].super.super.isa;
    if (isa)
    {
      id Property = objc_getProperty(isa, a2, 8, 1);
      id isa = v2[1].super.super.isa;
      if (isa) {
        id isa = objc_getProperty(isa, v4, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v10 = isa;
    uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
    Class v8 = v2[1].super.super.isa;
    if (v8) {
      id v9 = objc_getProperty(v8, v6, 24, 1);
    }
    else {
      id v9 = 0;
    }
    return [+[NSFileManager defaultManager] includingPropertiesForKeys:0 options:1 errorHandler:0];
  }
  return result;
}

NSDirectoryEnumerator *sub_10000EA64(NSDirectoryEnumerator *result, const char *a2)
{
  if (result)
  {
    id v2 = result;
    id isa = result[1].super.super.isa;
    if (isa)
    {
      id Property = objc_getProperty(isa, a2, 8, 1);
      id isa = v2[1].super.super.isa;
      if (isa) {
        id isa = objc_getProperty(isa, v4, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v10 = isa;
    uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
    Class v8 = v2[1].super.super.isa;
    if (v8) {
      id v9 = objc_getProperty(v8, v6, 24, 1);
    }
    else {
      id v9 = 0;
    }
    return [+[NSFileManager defaultManager] includingPropertiesForKeys:0 options:1 errorHandler:0];
  }
  return result;
}

NSDirectoryEnumerator *sub_10000EB64(NSDirectoryEnumerator *result, const char *a2)
{
  if (result)
  {
    id v2 = result;
    id isa = result[1].super.super.isa;
    if (isa)
    {
      id Property = objc_getProperty(isa, a2, 8, 1);
      id isa = v2[1].super.super.isa;
      if (isa) {
        id isa = objc_getProperty(isa, v4, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v10 = isa;
    uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
    Class v8 = v2[1].super.super.isa;
    if (v8) {
      id v9 = objc_getProperty(v8, v6, 24, 1);
    }
    else {
      id v9 = 0;
    }
    return [+[NSFileManager defaultManager] includingPropertiesForKeys:0 options:1 errorHandler:0];
  }
  return result;
}

void *sub_10000EC64(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDTopLevelInformingDatastore;
  id v3 = [super init];
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

unsigned char *sub_10000ED28(unsigned char *result, char a2)
{
  if (result)
  {
    id v3 = result;
    objc_super v5 = +[NSFileManager defaultManager];
    id Property = (id)v3[1];
    if (Property) {
      id Property = objc_getProperty(Property, v4, 8, 1);
    }
    NSURLResourceKey v12 = NSURLIsDirectoryKey;
    uint64_t v7 = [(NSFileManager *)v5 enumeratorAtURL:sub_10001B4B8((uint64_t)Property) includingPropertiesForKeys:+[NSArray arrayWithObjects:&v12 count:1] options:1 errorHandler:0];
    Class v8 = [RDSensorStreamEnumerator alloc];
    if (v8
      && (v11.receiver = v8,
          v11.super_class = (Class)RDSensorStreamEnumerator,
          (id v9 = objc_msgSendSuper2(&v11, "init")) != 0))
    {
      id v10 = v9;
      *((void *)v9 + 1) = v7;
      v10[16] = a2;
    }
    else
    {
      id v10 = 0;
    }
    return v10;
  }
  return result;
}

void *sub_10000EE58(void *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    v50[0] = NSURLFileSizeKey;
    v50[1] = NSURLIsDirectoryKey;
    v50[2] = NSURLContentAccessDateKey;
    v50[3] = NSURLContentModificationDateKey;
    v50[4] = NSURLCreationDateKey;
    double v4 = +[NSArray arrayWithObjects:v50 count:5];
    objc_super v6 = +[NSFileManager defaultManager];
    id Property = (id)v3[1];
    if (Property) {
      id Property = objc_getProperty(Property, v5, 8, 1);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obj = [(NSFileManager *)v6 enumeratorAtURL:sub_10001B4B8((uint64_t)Property) includingPropertiesForKeys:v4 options:0 errorHandler:0];
    uint64_t result = [(NSDirectoryEnumerator *)obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (result)
    {
      id v8 = result;
      char v9 = 0;
      uint64_t v10 = *(void *)v42;
      uint64_t v37 = *(void *)v42;
      id v35 = v4;
      id v36 = a2;
      do
      {
        objc_super v11 = 0;
        id v38 = v8;
        do
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v11);
          uint64_t v40 = 0;
          id v23 = [v21 resourceValuesForKeys:v4 error:&v40];
          if (v40)
          {
            if (qword_10006EAF8 == -1)
            {
              id v24 = qword_10006EB00;
              if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                goto LABEL_10;
              }
LABEL_16:
              *(_DWORD *)long long buf = 138543618;
              CFStringRef v46 = v21;
              __int16 v47 = 2114;
              uint64_t v48 = v40;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to get resource keys from %{public}@ because %{public}@", buf, 0x16u);
              goto LABEL_10;
            }
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            id v24 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
              goto LABEL_16;
            }
          }
          else
          {
            NSURLResourceKey v25 = v23;
            if ((v9 & 1) == 0)
            {
              id v26 = [@"File Size\tCreation Date\tModification Date\tAccess Date\n" dataUsingEncoding:4];
              id v27 = [v26 bytes];
              id v28 = v26;
              id v8 = v38;
              id v29 = [v28 length];
              id v30 = v27;
              uint64_t v10 = v37;
              [a2 write:v30 maxLength:v29];
            }
            if (objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", NSURLIsDirectoryKey), "BOOLValue"))
            {
              id v31 = -[NSString dataUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:\n", [v21 path]), "dataUsingEncoding:", 4);
              [a2 write:-[NSData bytes](v31, "bytes") maxLength:-[NSData length](v31, "length")];
            }
            else
            {
              id v12 = [v25 objectForKeyedSubscript:NSURLFileSizeKey];
              id v13 = [v25 objectForKeyedSubscript:NSURLContentAccessDateKey];
              id v14 = [v25 objectForKeyedSubscript:NSURLContentModificationDateKey];
              id v15 = [v25 objectForKeyedSubscript:NSURLCreationDateKey];
              id v16 = objc_alloc_init((Class)NSISO8601DateFormatter);
              [v16 setTimeZone:[+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone")]];
              id v17 = [v12 unsignedLongLongValue];
              id v18 = [v16 stringFromDate:v15];
              id v19 = [v16 stringFromDate:v14];
              id v34 = [v16 stringFromDate:v13];
              id v33 = v19;
              id v32 = v17;
              uint64_t v10 = v37;
              id v8 = v38;
              double v4 = v35;
              a2 = v36;
              long long v20 = -[NSString dataUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu\t%@\t%@\t%@\t%@\n", v32, v18, v33, v34, [v21 lastPathComponent]), "dataUsingEncoding:", 4);
              [v36 write:-[NSData bytes](v20, "bytes"), -[NSData length](v20, "length")];
            }
            char v9 = 1;
          }
LABEL_10:
          objc_super v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        uint64_t result = [(NSDirectoryEnumerator *)obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        id v8 = result;
      }
      while (result);
    }
  }
  return result;
}

void *sub_10000F2A8(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDTopLevelPruneableDatastore;
  id v3 = [super init];
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

void *sub_10000F36C(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    id v3 = +[NSFileManager defaultManager];
    id Property = (id)v1[1];
    if (Property) {
      id Property = objc_getProperty(Property, v2, 8, 1);
    }
    v35[0] = NSURLFileSizeKey;
    v35[1] = NSURLIsDirectoryKey;
    objc_super v5 = [(NSFileManager *)v3 enumeratorAtURL:sub_10001B4B8((uint64_t)Property) includingPropertiesForKeys:+[NSArray arrayWithObjects:v35 count:2] options:0 errorHandler:0];
    id v28 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t result = [(NSDirectoryEnumerator *)v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v25;
      *(void *)&long long v6 = 138543618;
      long long v21 = v6;
      do
      {
        char v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v9);
          if (!objc_msgSend(objc_msgSend(v10, "path"), "hasSuffix:", @".tombstones.tombstones"))
          {
            [v10 getResourceValue:&v28 forKey:NSURLIsDirectoryKey error:0];
            if (![v28 BOOLValue]) {
              goto LABEL_9;
            }
            id v12 = [+[NSFileManager defaultManager] enumeratorAtURL:v10 includingPropertiesForKeys:0 options:0 errorHandler:0];
            memset(v22, 0, sizeof(v22));
            if ([(NSDirectoryEnumerator *)v12 countByEnumeratingWithState:v22 objects:v29 count:16])
            {
              goto LABEL_9;
            }
            if (qword_10006EAF8 == -1)
            {
              id v13 = qword_10006EB00;
              if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_22;
              }
LABEL_35:
              *(_DWORD *)long long buf = 138543362;
              id v31 = v10;
              _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Removing empty directory %{public}@", buf, 0xCu);
            }
            else
            {
              dispatch_once(&qword_10006EAF8, &stru_10005CE88);
              id v13 = qword_10006EB00;
              if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_35;
              }
            }
LABEL_22:
            uint64_t v23 = 0;
            if (![+[NSFileManager defaultManager] removeItemAtURL:v10 error:&v23])
            {
              if (qword_10006EAF8 == -1)
              {
                uint64_t v14 = qword_10006EB00;
                if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_25;
                }
              }
              else
              {
                dispatch_once(&qword_10006EAF8, &stru_10005CE88);
                uint64_t v14 = qword_10006EB00;
                if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
                {
LABEL_25:
                  *(_DWORD *)long long buf = v21;
                  id v31 = v10;
                  __int16 v32 = 2114;
                  uint64_t v33 = v23;
                  id v15 = v14;
                  id v16 = "Failed to remove directory %{public}@ because %{public}@";
LABEL_8:
                  _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
                  goto LABEL_9;
                }
              }
            }
            goto LABEL_9;
          }
          uint64_t v23 = 0;
          if ([+[NSFileManager defaultManager] removeItemAtURL:v10 error:&v23])
          {
            if (qword_10006EAF8 == -1)
            {
              id v17 = qword_10006EB00;
              if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_9;
              }
LABEL_17:
              *(_DWORD *)long long buf = 138543362;
              id v31 = v10;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removed invalid identifier %{public}@", buf, 0xCu);
              goto LABEL_9;
            }
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            id v17 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_17;
            }
          }
          else if (qword_10006EAF8 == -1)
          {
            uint64_t v19 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
          }
          else
          {
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            uint64_t v19 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
            {
LABEL_29:
              *(_DWORD *)long long buf = v21;
              id v31 = v10;
              __int16 v32 = 2114;
              uint64_t v33 = v23;
              id v15 = v19;
              id v16 = "Failed to remove %{public}@ because %{public}@";
              goto LABEL_8;
            }
          }
LABEL_9:
          char v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        uint64_t result = [(NSDirectoryEnumerator *)v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
        id v7 = result;
      }
      while (result);
    }
  }
  return result;
}

void *sub_10000F800(void *a1, void **self)
{
  id v2 = a1;
  if (!a1) {
    return v2;
  }
  if (self && objc_getProperty(self, (SEL)self, 24, 1))
  {
    v6.receiver = v2;
    v6.super_class = (Class)RDArchiveableDatastore;
    id v2 = [super init];
    if (v2)
    {
      v2[1] = self;
      v2[2] = 0;
      if (sub_10002AAFC(self[2], self[3])) {
        v2[2] |= 4uLL;
      }
    }
    return v2;
  }
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    objc_super v5 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
LABEL_12:
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Trying to create a datastore object without a sensor identifier", buf, 2u);
    goto LABEL_10;
  }
  objc_super v5 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
    goto LABEL_12;
  }
LABEL_10:

  return 0;
}

uint64_t sub_10000F97C(uint64_t a1, const char *a2, const __CFString **a3)
{
  if (!a1) {
    return 0;
  }
  objc_super v6 = *(void **)(a1 + 8);
  if (v6)
  {
    id v8 = +[SRSensorDescription sensorDescriptionForSensor:objc_getProperty(v6, a2, 24, 1)];
    char v9 = *(void **)(a1 + 8);
    if (v9) {
      goto LABEL_4;
    }
  }
  else
  {
    id v8 = +[SRSensorDescription sensorDescriptionForSensor:0];
    char v9 = *(void **)(a1 + 8);
    if (v9)
    {
LABEL_4:
      id Property = objc_getProperty(v9, v7, 24, 1);
      if (!objc_msgSend(Property, "isEqualToString:", objc_msgSend(v8, "legacyName"))) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  id Property = 0;
  if (objc_msgSend(0, "isEqualToString:", objc_msgSend(v8, "legacyName"))) {
LABEL_5:
  }
    id Property = [v8 name];
LABEL_6:
  id v12 = *(id *)(a1 + 8);
  if (v12) {
    id v12 = objc_getProperty(v12, v11, 8, 1);
  }
  id v13 = sub_10001B31C((uint64_t)v12);
  uint64_t v14 = sub_10001B5C4((uint64_t)v13, Property);
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:a3])
  {
    if (qword_10006EAF8 == -1)
    {
      long long v41 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      long long v41 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    if (a3) {
      CFStringRef v152 = *a3;
    }
    else {
      CFStringRef v152 = &stru_10005E2D0;
    }
    *(_DWORD *)long long buf = 138543618;
    id v182 = v14;
    __int16 v183 = 2114;
    id v184 = (id)v152;
    _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to create destination staging directory %{public}@, %{public}@", buf, 0x16u);
    return 0;
  }
  id v16 = *(void **)(a1 + 8);
  if (v16) {
    id v16 = objc_getProperty(v16, v15, 16, 1);
  }
  id v17 = sub_10002A464(v16, Property);
  if (!sub_10000A3C4((uint64_t)RDUnarchiver, (uint64_t)a2, v14, (uint64_t)v17, (uint64_t)a3))
  {
    if (qword_10006EAF8 == -1)
    {
      uint64_t v156 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_150;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      uint64_t v156 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_150;
      }
    }
    if (a3) {
      CFStringRef v52 = *a3;
    }
    else {
      CFStringRef v52 = &stru_10005E2D0;
    }
    *(_DWORD *)long long buf = 138543618;
    id v182 = (id)a2;
    __int16 v183 = 2114;
    id v184 = (id)v52;
    id v62 = "Failed to unarchive %{public}@ because %{public}@";
LABEL_145:
    v136 = v156;
    uint32_t v137 = 22;
    goto LABEL_146;
  }
  if (qword_10006EAF8 == -1)
  {
    v153 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
  }
  else
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    v153 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
  }
  *(_DWORD *)long long buf = 138543362;
  id v182 = (id)a2;
  _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_INFO, "Unarchived %{public}@, now storing in proper device ID", buf, 0xCu);
LABEL_16:
  id v18 = *(void **)(a1 + 8);
  if (v18) {
    id v19 = objc_getProperty(v18, v155, 16, 1);
  }
  else {
    id v19 = 0;
  }
  v161 = v13;
  long long v20 = sub_100039FA8(Property, 0, v13, v19);
  long long v21 = (NSSet *)sub_10000E0F0([RDInformingDatastore alloc], v20);
  long long v22 = +[NSMutableSet setWithSet:sub_10000E348(v21)];

  long long v24 = *(void **)(a1 + 8);
  uint64_t v165 = a1;
  v163 = (id *)a3;
  v160 = a2;
  if (v24)
  {
    id v26 = objc_getProperty(v24, v23, 32, 1);
    long long v27 = *(void **)(a1 + 8);
    if (v27)
    {
      id v29 = objc_getProperty(v27, v25, 8, 1);
      id v30 = *(void **)(a1 + 8);
      if (v30)
      {
        id v31 = objc_getProperty(v30, v28, 16, 1);
        goto LABEL_22;
      }
    }
    else
    {
      id v29 = 0;
    }
    id v31 = 0;
  }
  else
  {
    id v29 = 0;
    id v26 = 0;
    id v31 = 0;
  }
LABEL_22:
  v162 = Property;
  __int16 v32 = sub_100039FA8(Property, v26, v29, v31);
  uint64_t v33 = (NSSet *)sub_10000E0F0([RDInformingDatastore alloc], v32);
  [(NSMutableSet *)v22 minusSet:sub_10000E348(v33)];

  id v34 = objc_alloc_init(RDOverwritingFileManagerDelegate);
  id v35 = objc_alloc_init((Class)NSFileManager);
  [v35 setDelegate:v34];
  id v36 = v35;
  NSURLResourceKey v179 = NSURLIsDirectoryKey;
  v164 = v14;
  uint64_t v37 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:v14 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v179 count:1] options:0 errorHandler:0];
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v38 = [(NSDirectoryEnumerator *)v37 countByEnumeratingWithState:&v166 objects:v178 count:16];
  if (!v38)
  {
LABEL_51:
    if (qword_10006EAF8 != -1) {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    }
    id v53 = v163;
    uint64_t v14 = v164;
    uint64_t v54 = v165;
    long long v55 = qword_10006EB00;
    if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v182 = (id)v160;
      _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "Unarchived %{public}@, now applying tombstones from companion", buf, 0xCu);
      id v57 = *(id *)(v165 + 8);
      if (!v57)
      {
LABEL_56:
        if ([v57 hasSuffix:@".tombstones"])
        {
          if (qword_10006EAF8 == -1) {
            goto LABEL_58;
          }
          goto LABEL_161;
        }
        self;
        __int16 v65 = (void *)qword_10006ECB0;
        if (qword_10006ECB0)
        {
          id v67 = +[NSMutableArray array];
          id v68 = *(id *)(v165 + 8);
          if (v68) {
            id v68 = objc_getProperty(v68, v66, 24, 1);
          }
          id v70 = [v68 sr_sensorForDeletionRecordsFromSensor:v36];
          id v71 = *(void **)(v165 + 8);
          if (v71)
          {
            id v73 = objc_getProperty(v71, v69, 8, 1);
            v74 = *(void **)(v165 + 8);
            if (v74) {
              id v75 = objc_getProperty(v74, v72, 16, 1);
            }
            else {
              id v75 = 0;
            }
          }
          else
          {
            id v73 = 0;
            id v75 = 0;
          }
          v76 = sub_100039FA8(v70, v65, v73, v75);
          id v77 = sub_10001DAB4([RDReader alloc], v76);
          id v78 = +[NSMutableArray array];
          v79 = sub_10001DB80((uint64_t)v77, v163, 0.0, INFINITY);
          double v80 = v79;
          if (v163 && *v163)
          {

            [v67 addObjectsFromArray:&__NSArray0__struct];
          }
          else
          {
            long long v176 = 0u;
            long long v177 = 0u;
            long long v174 = 0u;
            long long v175 = 0u;
            id v83 = [(NSArray *)v79 countByEnumeratingWithState:&v174 objects:buf count:16];
            if (v83)
            {
              id v84 = v83;
              uint64_t v85 = *(void *)v175;
              do
              {
                for (i = 0; i != v84; i = (char *)i + 1)
                {
                  if (*(void *)v175 != v85) {
                    objc_enumerationMutation(v80);
                  }
                  id v87 = *(void **)(*((void *)&v174 + 1) + 8 * i);
                  id v88 = [v87 reason];
                  if (v88) {
                    BOOL v89 = v88 == (id)3;
                  }
                  else {
                    BOOL v89 = 1;
                  }
                  if (v89)
                  {
                    [v78 addObject:v87];
                  }
                  else if (v88 == (id)4)
                  {
                    [v87 extendedReason];
                  }
                }
                id v84 = [(NSArray *)v80 countByEnumeratingWithState:&v174 objects:buf count:16];
              }
              while (v84);
            }

            [v67 addObjectsFromArray:+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v78)];
            id v53 = v163;
            if (!v163) {
              goto LABEL_110;
            }
          }
          if (*v53)
          {
            if (qword_10006EAF8 != -1) {
              dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            }
            uint64_t v156 = qword_10006EB00;
            if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
              goto LABEL_150;
            }
            id v91 = *(id *)(v165 + 8);
            if (v91) {
              id v91 = objc_getProperty(v91, v90, 24, 1);
            }
            id v92 = *v53;
            *(_DWORD *)long long buf = 138543618;
            id v182 = v91;
            __int16 v183 = 2114;
            id v184 = v92;
            id v62 = "Failed to read deletion records for companion for %{public}@ because %{public}@";
            goto LABEL_145;
          }
LABEL_110:
          if (qword_10006EAF8 != -1) {
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          }
          v94 = qword_10006EB00;
          if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "Companion tombstones applied", buf, 2u);
            uint64_t v96 = v165;
            v97 = *(void **)(v165 + 8);
            if (v97) {
              goto LABEL_114;
            }
          }
          else
          {
            uint64_t v96 = v165;
            v97 = *(void **)(v165 + 8);
            if (v97)
            {
LABEL_114:
              id v99 = objc_getProperty(v97, v95, 24, 1);
              v100 = *(void **)(v96 + 8);
              if (v100)
              {
                id v102 = objc_getProperty(v100, v98, 32, 1);
                v103 = *(void **)(v96 + 8);
                if (v103)
                {
                  id v104 = objc_getProperty(v103, v101, 16, 1);
                  goto LABEL_117;
                }
              }
              else
              {
                id v102 = 0;
              }
              id v104 = 0;
LABEL_117:
              v105 = sub_100039FA8(v99, v102, v161, v104);
              v106 = sub_10002CD44([RDPruner alloc], v105);
              long long v170 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v173 = 0u;
              id v107 = [v67 countByEnumeratingWithState:&v170 objects:v180 count:16];
              if (v107)
              {
                id v108 = v107;
                uint64_t v109 = *(void *)v171;
                if (v53)
                {
LABEL_119:
                  uint64_t v110 = 0;
                  while (1)
                  {
                    if (*(void *)v171 != v109) {
                      objc_enumerationMutation(v67);
                    }
                    v111 = *(void **)(*((void *)&v170 + 1) + 8 * v110);
                    [v111 startTime];
                    double v113 = v112;
                    [v111 endTime];
                    sub_10002CE10((uint64_t)v106, v53, v113, v114);
                    if (*v53) {
                      break;
                    }
                    if (v108 == (id)++v110)
                    {
                      id v108 = [v67 countByEnumeratingWithState:&v170 objects:v180 count:16];
                      if (v108) {
                        goto LABEL_119;
                      }
                      goto LABEL_125;
                    }
                  }
                  if (qword_10006EAF8 == -1)
                  {
                    v138 = qword_10006EB00;
                    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_149;
                    }
                  }
                  else
                  {
                    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
                    v138 = qword_10006EB00;
                    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_149;
                    }
                  }
                  id v158 = *v53;
                  *(_DWORD *)long long buf = 138543362;
                  id v182 = v158;
                  _os_log_error_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, "Failed to apply tombstone for samples because %{public}@", buf, 0xCu);
                  goto LABEL_149;
                }
                do
                {
                  for (j = 0; j != v108; j = (char *)j + 1)
                  {
                    if (*(void *)v171 != v109) {
                      objc_enumerationMutation(v67);
                    }
                    v132 = *(void **)(*((void *)&v170 + 1) + 8 * (void)j);
                    [v132 startTime];
                    double v134 = v133;
                    [v132 endTime];
                    sub_10002CE10((uint64_t)v106, 0, v134, v135);
                  }
                  id v108 = [v67 countByEnumeratingWithState:&v170 objects:v180 count:16];
                }
                while (v108);
              }
LABEL_125:
              if (qword_10006EAF8 == -1)
              {
                v115 = qword_10006EB00;
                if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_127;
                }
              }
              else
              {
                dispatch_once(&qword_10006EAF8, &stru_10005CE88);
                v115 = qword_10006EB00;
                if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
                {
LABEL_127:
                  uint64_t v116 = mach_continuous_time();
                  if (qword_10006EC88 == -1) {
                    goto LABEL_128;
                  }
LABEL_192:
                  dispatch_once(&qword_10006EC88, &stru_10005CDC0);
LABEL_128:
                  unint64_t v117 = qword_10006EC90;
                  double v118 = *(double *)&qword_10006EC98;
                  double v119 = *(double *)&qword_10006ECA0;
                  TMConvertTicksToSeconds();
                  if (v117 >= v116) {
                    double v121 = -v121;
                  }
                  double v122 = v119 + v118 + v121;
                  v123 = *(void **)(v165 + 8);
                  if (v123)
                  {
                    id v125 = objc_getProperty(v123, v120, 16, 1);
                    v126 = *(void **)(v165 + 8);
                    if (v126) {
                      id v127 = objc_getProperty(v126, v124, 24, 1);
                    }
                    else {
                      id v127 = 0;
                    }
                  }
                  else
                  {
                    id v125 = 0;
                    id v127 = 0;
                  }
                  uint64_t v128 = sub_10002A58C((uint64_t)v125, v127);
                  sub_10002CE10((uint64_t)v106, v53, 0.0, v122 - (double)(unint64_t)v128);
                  if (v53)
                  {
                    if (*v53)
                    {
                      if (qword_10006EAF8 == -1)
                      {
                        v129 = qword_10006EB00;
                        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
                        {
LABEL_149:

                          goto LABEL_150;
                        }
                      }
                      else
                      {
                        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
                        v129 = qword_10006EB00;
                        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_149;
                        }
                      }
                      id v130 = *v53;
                      *(_DWORD *)long long buf = 138543362;
                      id v182 = v130;
                      _os_log_error_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "Failed to remove old gizmo data because %{public}@", buf, 0xCu);
                      goto LABEL_149;
                    }
                    uint64_t v145 = mach_continuous_time();
                    if (qword_10006EC88 != -1) {
                      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
                    }
                    uint64_t v54 = v165;
                    unint64_t v146 = qword_10006EC90;
                    double v147 = *(double *)&qword_10006EC98;
                    double v148 = *(double *)&qword_10006ECA0;
                    TMConvertTicksToSeconds();
                    if (v146 >= v145) {
                      double v149 = -v149;
                    }
                    sub_10002CE10((uint64_t)v106, v53, v148 + v147 + (double)XPC_ACTIVITY_INTERVAL_1_DAY + v149, INFINITY);

                    if (*v53)
                    {
                      if (qword_10006EAF8 == -1)
                      {
                        uint64_t v150 = qword_10006EB00;
                        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_150;
                        }
                      }
                      else
                      {
                        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
                        uint64_t v150 = qword_10006EB00;
                        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_150;
                        }
                      }
                      id v151 = *v53;
                      *(_DWORD *)long long buf = 138543362;
                      id v182 = v151;
                      id v62 = "Failed to remove future gizmo data because %{public}@";
                      v136 = v150;
                      uint32_t v137 = 12;
                      goto LABEL_146;
                    }
                  }
                  else
                  {
                    uint64_t v140 = mach_continuous_time();
                    if (qword_10006EC88 != -1) {
                      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
                    }
                    uint64_t v54 = v165;
                    unint64_t v141 = qword_10006EC90;
                    double v142 = *(double *)&qword_10006EC98;
                    double v143 = *(double *)&qword_10006ECA0;
                    TMConvertTicksToSeconds();
                    if (v141 >= v140) {
                      double v144 = -v144;
                    }
                    sub_10002CE10((uint64_t)v106, 0, v143 + v142 + (double)XPC_ACTIVITY_INTERVAL_1_DAY + v144, INFINITY);
                  }
                  id v36 = v159;
                  if (qword_10006EAF8 == -1)
                  {
LABEL_58:
                    id v58 = qword_10006EB00;
                    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
                      goto LABEL_59;
                    }
                    goto LABEL_162;
                  }
LABEL_161:
                  dispatch_once(&qword_10006EAF8, &stru_10005CE88);
                  id v58 = qword_10006EB00;
                  if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
                  {
LABEL_59:
                    id v60 = *(id *)(v54 + 8);
                    if (!v60)
                    {
LABEL_61:
                      uint64_t v61 = sub_10001B5C4((uint64_t)v60, v162);
                      if ([v36 copyItemAtURL:v164 toURL:v61 error:v53])
                      {
                        uint64_t v42 = 1;
                        goto LABEL_151;
                      }
                      if (qword_10006EAF8 == -1)
                      {
                        uint64_t v81 = qword_10006EB00;
                        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_150;
                        }
                      }
                      else
                      {
                        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
                        uint64_t v81 = qword_10006EB00;
                        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_150;
                        }
                      }
                      if (v53) {
                        CFStringRef v82 = (const __CFString *)*v53;
                      }
                      else {
                        CFStringRef v82 = &stru_10005E2D0;
                      }
                      *(_DWORD *)long long buf = 138543874;
                      id v182 = v164;
                      __int16 v183 = 2114;
                      id v184 = v61;
                      __int16 v185 = 2114;
                      CFStringRef v186 = v82;
                      id v62 = "Failed to move %{public}@ to %{public}@, %{public}@";
                      v136 = v81;
                      uint32_t v137 = 32;
LABEL_146:
                      _os_log_error_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, v62, buf, v137);
                      goto LABEL_150;
                    }
LABEL_60:
                    id v60 = objc_getProperty(v60, v59, 8, 1);
                    goto LABEL_61;
                  }
LABEL_162:
                  *(_WORD *)long long buf = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "All data update. Ready to move staged data into place", buf, 2u);
                  id v60 = *(id *)(v54 + 8);
                  if (!v60) {
                    goto LABEL_61;
                  }
                  goto LABEL_60;
                }
              }
              *(_WORD *)long long buf = 0;
              _os_log_debug_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEBUG, "Applied tombstones, now removing any old samples", buf, 2u);
              uint64_t v116 = mach_continuous_time();
              if (qword_10006EC88 == -1) {
                goto LABEL_128;
              }
              goto LABEL_192;
            }
          }
          id v102 = 0;
          id v99 = 0;
          id v104 = 0;
          goto LABEL_117;
        }
        if (qword_10006EAF8 == -1)
        {
          v93 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
            goto LABEL_108;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          v93 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
          {
LABEL_108:
            if (!v163) {
              goto LABEL_150;
            }
            goto LABEL_109;
          }
        }
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "Failed to find current device id", buf, 2u);
        if (!v163) {
          goto LABEL_150;
        }
LABEL_109:
        id *v163 = +[SRError errorWithCode:8198];
        goto LABEL_150;
      }
    }
    else
    {
      id v57 = *(id *)(v165 + 8);
      if (!v57) {
        goto LABEL_56;
      }
    }
    id v57 = objc_getProperty(v57, v56, 24, 1);
    goto LABEL_56;
  }
  id v39 = v38;
  uint64_t v40 = *(void *)v167;
LABEL_28:
  uint64_t v43 = 0;
  while (1)
  {
    if (*(void *)v167 != v40) {
      objc_enumerationMutation(v37);
    }
    long long v44 = *(void **)(*((void *)&v166 + 1) + 8 * v43);
    v180[0] = 0;
    [v44 getResourceValue:v180 forKey:NSURLIsDirectoryKey error:0];
    if ([v180[0] BOOLValue])
    {
      if (-[NSMutableSet containsObject:](v22, "containsObject:", [v44 lastPathComponent])) {
        break;
      }
    }
LABEL_30:
    if (v39 == (id)++v43)
    {
      id v39 = [(NSDirectoryEnumerator *)v37 countByEnumeratingWithState:&v166 objects:v178 count:16];
      if (!v39) {
        goto LABEL_51;
      }
      goto LABEL_28;
    }
  }
  uint64_t v45 = v36;
  -[NSMutableSet removeObject:](v22, "removeObject:", [v44 lastPathComponent]);
  *(void *)&long long v174 = 0;
  __int16 v47 = *(void **)(v165 + 8);
  if (v47) {
    id v48 = objc_getProperty(v47, v46, 32, 1);
  }
  else {
    id v48 = 0;
  }
  id v49 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v48, 1, [v44 URLByDeletingLastPathComponent]);
  if (qword_10006EAF8 == -1)
  {
    uint64_t v50 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  dispatch_once(&qword_10006EAF8, &stru_10005CE88);
  uint64_t v50 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
  {
LABEL_39:
    id v51 = [v44 lastPathComponent];
    *(_DWORD *)long long buf = 138478083;
    id v182 = v51;
    __int16 v183 = 2112;
    id v184 = v49;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Storing device %{private}@ snapshot in %{publice}@", buf, 0x16u);
  }
LABEL_40:
  if ([+[NSFileManager defaultManager] createDirectoryAtURL:v49 withIntermediateDirectories:1 attributes:0 error:&v174])
  {
    id v36 = v45;
    if (([v45 copyItemAtURL:v44 toURL:v49 error:&v174] & 1) == 0)
    {
      if (qword_10006EAF8 != -1) {
        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      }
      uint64_t v14 = v164;
      v63 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEFAULT))
      {
        id v64 = [v44 lastPathComponent];
        *(_DWORD *)long long buf = 138543874;
        id v182 = v64;
        __int16 v183 = 2114;
        id v184 = v49;
        __int16 v185 = 2114;
        CFStringRef v186 = (const __CFString *)v174;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Failed to rename watch UUID %{public}@ to remote identifier %{public}@ because %{public}@", buf, 0x20u);
      }
      goto LABEL_150;
    }
    [v45 removeItemAtURL:v44 error:0];
    goto LABEL_30;
  }
  if (qword_10006EAF8 != -1) {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
  }
  uint64_t v14 = v164;
  uint64_t v156 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v182 = v49;
    __int16 v183 = 2114;
    id v184 = (id)v174;
    id v62 = "Failed to create directory %{public}@ because %{public}@";
    goto LABEL_145;
  }
LABEL_150:
  uint64_t v42 = 0;
LABEL_151:
  [+[NSFileManager defaultManager] removeItemAtURL:v14 error:0];
  return v42;
}

NSURL *sub_100010E54(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  double v4 = *(void **)(a1 + 8);
  if (v4)
  {
    id Property = objc_getProperty(v4, a2, 8, 1);
    id v7 = *(void **)(a1 + 8);
    if (v7) {
      id v8 = objc_getProperty(v7, v5, 24, 1);
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id Property = 0;
    id v8 = 0;
  }
  char v9 = sub_10001B74C((uint64_t)Property, v8, *(void *)(a1 + 16));
  if (![+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v9 path]])
  {
    if (qword_10006EAF8 == -1)
    {
      v72 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      v72 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
        return 0;
      }
    }
    LODWORD(v94) = 138543362;
    *(void *)((char *)&v94 + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "No file exists at %{public}@. Skipping archive", (uint8_t *)&v94, 0xCu);
    return 0;
  }
  objc_super v11 = *(void **)(a1 + 8);
  if (!v11 || !objc_getProperty(v11, v10, 32, 1))
  {
    if (qword_10006EAF8 == -1)
    {
      id v73 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v73 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    LOWORD(v94) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_FAULT, "No device id provided for archiveReadableSamplesWithBaseName", (uint8_t *)&v94, 2u);
    return 0;
  }
  id v13 = *(id *)(a1 + 8);
  if (v13)
  {
    id v15 = objc_getProperty(v13, v12, 8, 1);
    id v13 = *(id *)(a1 + 8);
    if (v13) {
      id v13 = objc_getProperty(v13, v14, 32, 1);
    }
  }
  else
  {
    id v15 = 0;
  }
  id v99 = v13;
  id v17 = +[NSArray arrayWithObjects:&v99 count:1];
  id v18 = *(void **)(a1 + 8);
  if (v18) {
    id v19 = objc_getProperty(v18, v16, 24, 1);
  }
  else {
    id v19 = 0;
  }
  long long v21 = +[NSURL fileURLWithPath:a2 isDirectory:0 relativeToURL:sub_10001BA44((uint64_t)v15, (uint64_t)v17, v19)];
  long long v22 = *(void **)(a1 + 8);
  if (v22)
  {
    long long v24 = objc_getProperty(v22, v20, 16, 1);
    long long v25 = *(void **)(a1 + 8);
    if (v25) {
      id v26 = objc_getProperty(v25, v23, 24, 1);
    }
    else {
      id v26 = 0;
    }
  }
  else
  {
    long long v24 = 0;
    id v26 = 0;
  }
  int v27 = sub_10002A33C(v24, v26);
  id v29 = +[NSMutableArray array];
  id v30 = *(id *)(a1 + 8);
  if (v30)
  {
    __int16 v32 = (NSURL *)objc_getProperty(v30, v28, 8, 1);
    id v30 = *(id *)(a1 + 8);
    if (v30) {
      id v30 = objc_getProperty(v30, v31, 32, 1);
    }
  }
  else
  {
    __int16 v32 = 0;
  }
  id v98 = v30;
  id v34 = +[NSArray arrayWithObjects:&v98 count:1];
  id v35 = *(void **)(a1 + 8);
  if (v35) {
    id v36 = objc_getProperty(v35, v33, 24, 1);
  }
  else {
    id v36 = 0;
  }
  id v38 = sub_10001B974(v32, (uint64_t)v34, v36, 1);
  id v39 = *(id *)(a1 + 8);
  if (v39)
  {
    long long v41 = (NSURL *)objc_getProperty(v39, v37, 8, 1);
    id v39 = *(id *)(a1 + 8);
    if (v39) {
      id v39 = objc_getProperty(v39, v40, 32, 1);
    }
  }
  else
  {
    long long v41 = 0;
  }
  id v97 = v39;
  uint64_t v43 = +[NSArray arrayWithObjects:&v97 count:1];
  long long v44 = *(void **)(a1 + 8);
  if (v44) {
    id v45 = objc_getProperty(v44, v42, 24, 1);
  }
  else {
    id v45 = 0;
  }
  __int16 v47 = sub_10001B8A4(v41, (uint64_t)v43, v45, 1);
  *(void *)&long long v94 = 0;
  *((void *)&v94 + 1) = &v94;
  uint64_t v95 = 0x2020000000;
  uint64_t v96 = 0;
  id v48 = *(void **)(a1 + 8);
  if (v48)
  {
    uint64_t v50 = objc_getProperty(v48, v46, 16, 1);
    id v51 = *(void **)(a1 + 8);
    if (v51) {
      id v52 = objc_getProperty(v51, v49, 24, 1);
    }
    else {
      id v52 = 0;
    }
  }
  else
  {
    uint64_t v50 = 0;
    id v52 = 0;
  }
  uint64_t v54 = sub_10002AC24(v50, v52);
  long long v55 = *(void **)(a1 + 8);
  if (v55)
  {
    id v57 = objc_getProperty(v55, v53, 16, 1);
    id v58 = *(void **)(a1 + 8);
    if (v58) {
      id v59 = objc_getProperty(v58, v56, 24, 1);
    }
    else {
      id v59 = 0;
    }
  }
  else
  {
    id v57 = 0;
    id v59 = 0;
  }
  int v60 = sub_10002A464(v57, v59);
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_100011A24;
  v86[3] = &unk_10005CE68;
  v86[4] = v38;
  v86[5] = v47;
  v86[6] = v29;
  v86[7] = &v94;
  v86[8] = v54;
  uint64_t v61 = sub_100015D08((uint64_t)RDArchiver, v9, v21, v27, 0, v60, (uint64_t)&stru_10005CE40, (uint64_t)v86);
  id v62 = (NSURL *)v61;
  if (!v61)
  {
    if (qword_10006EAF8 == -1)
    {
      id v75 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
      {
LABEL_68:
        id v70 = 0;
        goto LABEL_77;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v75 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    id v88 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@", buf, 0xCu);
    id v70 = 0;
    goto LABEL_77;
  }
  if (!*(void *)(*((void *)&v94 + 1) + 24))
  {
    if (qword_10006EAF8 == -1)
    {
      v76 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
      {
LABEL_71:
        id v78 = *(NSURL **)(a1 + 8);
        if (v78) {
          id v78 = (NSURL *)objc_getProperty(v78, v77, 24, 1);
        }
        *(_DWORD *)long long buf = 138543618;
        id v88 = v78;
        __int16 v89 = 2114;
        v90 = v62;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "No segments to archive for %{public}@, removing empty archive %{public}@", buf, 0x16u);
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      v76 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
        goto LABEL_71;
      }
    }
    [+[NSFileManager defaultManager] removeItemAtURL:v62 error:0];
    id v70 = 0;
    goto LABEL_77;
  }
  double v80 = (NSURL *)v61;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v63 = [v29 countByEnumeratingWithState:&v82 objects:v93 count:16];
  if (!v63) {
    goto LABEL_56;
  }
  uint64_t v64 = *(void *)v83;
  do
  {
    for (i = 0; i != v63; i = (char *)i + 1)
    {
      if (*(void *)v83 != v64) {
        objc_enumerationMutation(v29);
      }
      double v66 = *(NSURL **)(*((void *)&v82 + 1) + 8 * i);
      if (v66 != [v29 lastObject])
      {
        uint64_t v81 = 0;
        if ([+[NSFileManager defaultManager] removeItemAtURL:v66 error:&v81]|| [(NSURL *)v81 code] == (id)260|| [(NSURL *)v81 code] == (id)4)
        {
          if (qword_10006EAF8 == -1)
          {
            id v67 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
              goto LABEL_37;
            }
          }
          else
          {
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            id v67 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
            {
LABEL_37:
              *(_DWORD *)long long buf = 138543362;
              id v88 = v66;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Removed %{public}@ as it has already been archived", buf, 0xCu);
              continue;
            }
          }
        }
        else
        {
          if (qword_10006EAF8 == -1)
          {
            id v68 = qword_10006EB00;
            if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_50:
            *(_DWORD *)long long buf = 138543618;
            id v88 = v66;
            __int16 v89 = 2114;
            v90 = v81;
            _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@ that has already been archived because %{public}@", buf, 0x16u);
            continue;
          }
          dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          id v68 = qword_10006EB00;
          if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
        }
      }
    }
    id v63 = [v29 countByEnumeratingWithState:&v82 objects:v93 count:16];
  }
  while (v63);
LABEL_56:
  id v69 = [v29 firstObject];
  id v70 = v80;
  if (!v69) {
    goto LABEL_77;
  }
  id v71 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@", [v69 lastPathComponent], -[NSURL lastPathComponent](v80, "lastPathComponent")), 0, -[NSURL URLByDeletingLastPathComponent](v80, "URLByDeletingLastPathComponent"));
  uint64_t v81 = 0;
  if ([+[NSFileManager defaultManager] moveItemAtURL:v80 toURL:v71 error:&v81])
  {
    id v70 = v71;
    goto LABEL_77;
  }
  if (qword_10006EAF8 == -1)
  {
    v79 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
LABEL_87:
    *(_DWORD *)long long buf = 138543874;
    id v88 = v80;
    __int16 v89 = 2114;
    v90 = v71;
    __int16 v91 = 2114;
    id v92 = v81;
    _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to rename archive URL %{public}@ to %{public}@ because %{public}@", buf, 0x20u);
  }
  else
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    v79 = qword_10006EB00;
    if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_87;
    }
  }
LABEL_77:
  _Block_object_dispose(&v94, 8);
  return v70;
}

void sub_1000118A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000118B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000118D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000118E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100011900(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100011918(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100011930(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100011948(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100011960(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10001197C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100011994(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

int64_t sub_1000119AC(id a1, NSString *a2, NSString *a3)
{
  [[(NSString *)a2 lastPathComponent] doubleValue];
  double v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [[(NSString *)a3 lastPathComponent] doubleValue];
  objc_super v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return [(NSNumber *)v4 compare:v5];
}

BOOL sub_100011A24(uint64_t a1, void *a2)
{
  [objc_msgSend(a2, "lastPathComponent") doubleValue];
  if (v4 == 0.0
    || (objc_msgSend(objc_msgSend(objc_msgSend(a2, "URLByDeletingLastPathComponent"), "path"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "path")) & 1) != 0|| (objc_msgSend(objc_msgSend(objc_msgSend(a2, "URLByDeletingLastPathComponent"), "path"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "path")) & 1) != 0)
  {
    return 1;
  }
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    objc_super v6 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  objc_super v6 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
  {
LABEL_7:
    int v7 = 138543362;
    id v8 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding %{public}@ to archive", (uint8_t *)&v7, 0xCu);
  }
LABEL_8:
  [*(id *)(a1 + 48) addObject:a2];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += sub_100005E58(+[NSFileManager defaultManager], a2);
  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) < *(void *)(a1 + 64);
}

void sub_100011BD8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = 0;
    if (![+[NSFileManager defaultManager] removeItemAtURL:a2 error:&v4])
    {
      if (qword_10006EAF8 == -1)
      {
        id v3 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
          return;
        }
LABEL_7:
        *(_DWORD *)long long buf = 138543618;
        uint64_t v6 = a2;
        __int16 v7 = 2112;
        uint64_t v8 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@ because %@", buf, 0x16u);
        return;
      }
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v3 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
    }
  }
}

NSURL *sub_100011D00(NSURL *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    id v5 = [a2 lastPathComponent];
    id urlString = v3->_urlString;
    if (urlString)
    {
      id Property = objc_getProperty(urlString, v4, 8, 1);
      id urlString = v3->_urlString;
      if (urlString) {
        id urlString = objc_getProperty(urlString, v7, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v14 = urlString;
    uint64_t v10 = +[NSArray arrayWithObjects:&v14 count:1];
    objc_super v11 = v3->_urlString;
    if (v11) {
      id v12 = objc_getProperty(v11, v9, 24, 1);
    }
    else {
      id v12 = 0;
    }
    id v13 = sub_10001BB24((uint64_t)Property, (uint64_t)v10, v12);
    return sub_100011F10(v3->_urlString, (const char *)a2, (uint64_t)v5, (uint64_t)v13, 0);
  }
  return result;
}

NSURL *sub_100011E0C(NSURL *result, const char *a2, uint64_t a3)
{
  if (result)
  {
    id v5 = result;
    id urlString = result->_urlString;
    if (urlString)
    {
      id Property = objc_getProperty(urlString, a2, 8, 1);
      id urlString = v5->_urlString;
      if (urlString) {
        id urlString = objc_getProperty(urlString, v7, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v14 = urlString;
    uint64_t v10 = +[NSArray arrayWithObjects:&v14 count:1];
    objc_super v11 = v5->_urlString;
    if (v11) {
      id v12 = objc_getProperty(v11, v9, 24, 1);
    }
    else {
      id v12 = 0;
    }
    id v13 = sub_10001BB24((uint64_t)Property, (uint64_t)v10, v12);
    return sub_100011F10(v5->_urlString, a2, a3, (uint64_t)v13, 0);
  }
  return result;
}

NSURL *sub_100011F10(void *a1, const char *a2, uint64_t a3, uint64_t a4, NSURL **a5)
{
  if (!a1 || !objc_getProperty(a1, a2, 32, 1))
  {
    if (qword_10006EAF8 == -1)
    {
      id v12 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v12 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT))
      {
LABEL_11:
        if (!a5) {
          return 0;
        }
LABEL_12:
        char v9 = 0;
        *a5 = (NSURL *)+[SRError errorWithCode:8194];
        return v9;
      }
    }
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "No device id provided for storeEncryptedArchive", buf, 2u);
    if (!a5) {
      return 0;
    }
    goto LABEL_12;
  }
  char v9 = +[NSURL fileURLWithPath:a3 isDirectory:0 relativeToURL:a4];
  [+[NSFileManager defaultManager] removeItemAtURL:v9 error:0];
  if (![+[NSFileManager defaultManager] moveItemAtURL:a2 toURL:v9 error:a5])
  {
    if (a5)
    {
      id v13 = *a5;
      if (qword_10006EAF8 == -1) {
        goto LABEL_15;
      }
    }
    else
    {
      id v13 = 0;
      if (qword_10006EAF8 == -1)
      {
LABEL_15:
        id v14 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
LABEL_20:
        *(_DWORD *)long long buf = 138543874;
        id v19 = (void *)a2;
        __int16 v20 = 2114;
        long long v21 = v9;
        __int16 v22 = 2114;
        uint64_t v23 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error moving %{public}@ to %{public}@ because %{public}@", buf, 0x20u);
        return 0;
      }
    }
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    id v14 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    goto LABEL_20;
  }
  NSFileAttributeKey v16 = NSFileProtectionKey;
  NSFileProtectionType v17 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") setAttributes:+[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1] ofItemAtPath:[(NSURL *)v9 path] error:a5])
  {
    return v9;
  }
  if (a5)
  {
    uint64_t v10 = *a5;
    if (qword_10006EAF8 == -1) {
      goto LABEL_7;
    }
LABEL_22:
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    objc_super v11 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
      return v9;
    }
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  if (qword_10006EAF8 != -1) {
    goto LABEL_22;
  }
LABEL_7:
  objc_super v11 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    *(_DWORD *)long long buf = 138543618;
    id v19 = v9;
    __int16 v20 = 2114;
    long long v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Error changing %{public}@ to class c because %{public}@", buf, 0x16u);
  }
  return v9;
}

uint64_t sub_100012264(uint64_t result, char *a2, NSURL **a3)
{
  if (result)
  {
    uint64_t v5 = result;
    id v6 = *(id *)(result + 8);
    if (v6)
    {
      id Property = objc_getProperty(v6, a2, 8, 1);
      id v6 = *(id *)(v5 + 8);
      if (v6) {
        id v6 = objc_getProperty(v6, v7, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v18 = v6;
    uint64_t v10 = +[NSArray arrayWithObjects:&v18 count:1];
    objc_super v11 = *(void **)(v5 + 8);
    id v12 = v11 ? objc_getProperty(v11, v9, 24, 1) : 0;
    id v13 = sub_10001BC04((uint64_t)Property, (uint64_t)v10, v12);
    uint64_t result = (uint64_t)sub_100011F10(*(void **)(v5 + 8), a2, (uint64_t)[a2 lastPathComponent], (uint64_t)v13, a3);
    if (result)
    {
      uint64_t v15 = 0;
      if ((objc_msgSend(objc_msgSend(objc_msgSend((id)result, "lastPathComponent"), "dataUsingEncoding:", 4), "writeToURL:options:error:", result, 1073741825, &v15) & 1) == 0)
      {
        if (qword_10006EAF8 == -1)
        {
          id v14 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
            return 1;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          id v14 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
            return 1;
          }
        }
        *(_DWORD *)long long buf = 138543362;
        uint64_t v17 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to write empty delivered URL because %{public}@", buf, 0xCu);
      }
      return 1;
    }
  }
  return result;
}

NSURL *sub_100012438(NSURL *result, char *a2)
{
  if (result)
  {
    id v3 = result;
    id urlString = result->_urlString;
    if (urlString)
    {
      id Property = objc_getProperty(urlString, a2, 8, 1);
      id urlString = v3->_urlString;
      if (urlString) {
        id urlString = objc_getProperty(urlString, v5, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v12 = urlString;
    uint64_t v8 = +[NSArray arrayWithObjects:&v12 count:1];
    char v9 = v3->_urlString;
    if (v9) {
      id v10 = objc_getProperty(v9, v7, 24, 1);
    }
    else {
      id v10 = 0;
    }
    objc_super v11 = sub_10001BA44((uint64_t)Property, (uint64_t)v8, v10);
    return sub_100011F10(v3->_urlString, a2, (uint64_t)[a2 lastPathComponent], (uint64_t)v11, 0);
  }
  return result;
}

void *sub_100012F98(void *a1, void *a2)
{
  id v2 = a1;
  if (!a1) {
    return v2;
  }
  self;
  uint64_t v4 = objc_alloc_init(RDKeychainStore);
  v6.receiver = v2;
  v6.super_class = (Class)RDEncryptingDatastore;
  id v2 = [super init];
  if (!v2) {
    return v2;
  }
  v2[1] = a2;
  v2[2] = v4;
  if (qword_10006ECA8) {
    return v2;
  }
  qword_10006ECA8 = objc_alloc_init(RDKeychainCache);
  return v2;
}

NSMutableData *sub_1000130B8()
{
  self;
  uint64_t v0 = +[NSMutableData dataWithLength:32];
  CCRNGStatus Bytes = CCRandomGenerateBytes([(NSMutableData *)v0 mutableBytes], 0x20uLL);
  if (Bytes)
  {
    CCRNGStatus v2 = Bytes;
    if (qword_10006EAF8 == -1)
    {
      id v3 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v3 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to generate random data for a key. %d", (uint8_t *)v5, 8u);
    return 0;
  }
  return v0;
}

NSMutableData *sub_1000131C8()
{
  self;
  uint64_t v0 = +[NSMutableData dataWithLength:16];
  CCRNGStatus Bytes = CCRandomGenerateBytes([(NSMutableData *)v0 mutableBytes], 0x10uLL);
  if (Bytes)
  {
    CCRNGStatus v2 = Bytes;
    if (qword_10006EAF8 == -1)
    {
      id v3 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v3 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to generate random data for an initialization vector. %d", (uint8_t *)v5, 8u);
    return 0;
  }
  return v0;
}

NSString *sub_1000132D8(NSString *result, char *a2)
{
  if (result)
  {
    NSString v3 = result[1];
    if (v3) {
      id Property = objc_getProperty(v3, a2, 24, 1);
    }
    else {
      id Property = 0;
    }
    return [NSString stringWithFormat:@"%@.%@", Property, [objc_msgSend(objc_msgSend(a2, "lastPathComponent"), "stringByDeletingPathExtension")];
  }
  return result;
}

uint64_t sub_100013358(uint64_t result, void *a2, void *a3, void *a4)
{
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[a3 length] + [a2 length]);
    [(NSMutableData *)v8 appendData:a3];
    [(NSMutableData *)v8 appendData:a2];
    id v10 = *(void **)(v7 + 8);
    if (v10) {
      id Property = objc_getProperty(v10, v9, 24, 1);
    }
    else {
      id Property = 0;
    }
    id v12 = [NSString stringWithFormat:@"%@.%@", Property, [objc_msgSend(objc_msgSend(a4, "lastPathComponent"), "stringByDeletingPathExtension")];
    if ([*(id *)(v7 + 16) keyDataFromKeyChainWithName:v12])
    {
      unsigned int v14 = 1;
      uint64_t v15 = (void *)qword_10006ECA8;
      NSFileAttributeKey v16 = *(void **)(v7 + 8);
      if (v16)
      {
LABEL_6:
        id v17 = objc_getProperty(v16, v13, 24, 1);
        goto LABEL_7;
      }
    }
    else
    {
      __int16 v20 = *(void **)(v7 + 8);
      long long v21 = *(void **)(v7 + 16);
      if (v20) {
        id v22 = objc_getProperty(v20, v13, 24, 1);
      }
      else {
        id v22 = 0;
      }
      unsigned int v14 = [v21 addToKeychainKey:v8 withName:v12 sensor:v22];
      uint64_t v15 = (void *)qword_10006ECA8;
      NSFileAttributeKey v16 = *(void **)(v7 + 8);
      if (v16) {
        goto LABEL_6;
      }
    }
    id v17 = 0;
LABEL_7:
    unsigned int v18 = [v15 addToKeychainKey:v8 withName:v12 sensor:v17];
    if (qword_10006EAF8 == -1)
    {
      id v19 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
        return v14 | v18;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v19 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
        return v14 | v18;
      }
    }
    *(_DWORD *)long long buf = 138478339;
    long long v24 = v12;
    __int16 v25 = 1026;
    unsigned int v26 = v14;
    __int16 v27 = 1026;
    unsigned int v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Attempted add to key %{private}@ to keychain: %{public, BOOL}d, cache %{public, BOOL}d", buf, 0x18u);
    return v14 | v18;
  }
  return result;
}

NSDictionary *sub_100013590(NSDictionary *result, uint64_t a2)
{
  if (result)
  {
    if (a2)
    {
      NSString v3 = result;
      id v4 = [(id)qword_10006ECA8 keyDataFromKeyChainWithName:a2];
      uint64_t v5 = v4;
      if (v4) {
        goto LABEL_8;
      }
      id v6 = [(objc_class *)v3[2].super.isa keyDataFromKeyChainWithName:a2];
      if (v6)
      {
        uint64_t v5 = v6;
        uint64_t v8 = (void *)qword_10006ECA8;
        Class isa = v3[1].super.isa;
        if (isa) {
          id Property = objc_getProperty(isa, v7, 24, 1);
        }
        else {
          id Property = 0;
        }
        [v8 addToKeychainKey:v5 withName:a2 sensor:Property];
LABEL_8:
        if (qword_10006EAF8 == -1)
        {
          objc_super v11 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
          {
LABEL_10:
            v13[0] = @"key";
            v13[1] = @"iv";
            v14[0] = [NSData dataWithBytes:length:((char *)[v5 bytes] + 16), (char *)objc_msgSend(v5, "length") - 16];
            v14[1] = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v5 bytes], 16);
            return +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
          }
        }
        else
        {
          dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          objc_super v11 = qword_10006EB00;
          if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_10;
          }
        }
        CFStringRef v12 = @"cache";
        if (!v4) {
          CFStringRef v12 = @"keychain";
        }
        *(_DWORD *)long long buf = 138478083;
        uint64_t v16 = a2;
        __int16 v17 = 2114;
        CFStringRef v18 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Key %{private}@ found in %{public}@", buf, 0x16u);
        goto LABEL_10;
      }
      return (NSDictionary *)&__NSDictionary0__struct;
    }
    else
    {
      return (NSDictionary *)&__NSDictionary0__struct;
    }
  }
  return result;
}

void *sub_1000137D4(uint64_t a1, CCOperation a2, void *a3, void *a4, void *a5)
{
  if (!a1) {
    return 0;
  }
  if (a2 < 2)
  {
    id v13 = a3;
    uint64_t v25 = 0;
    id v14 = sub_10001D32C((uint64_t)NSFileHandle, a3, 3, 514, &v25);
    if (!v14)
    {
      if (qword_10006EAF8 == -1)
      {
        uint64_t v21 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
      }
      else
      {
        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
        uint64_t v21 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
      }
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v28 = 2114;
      uint64_t v29 = v25;
      uint64_t v7 = "Unable to open %{public}@ because %{public}@";
      uint64_t v8 = buf;
      char v9 = v21;
      uint32_t v10 = 22;
      goto LABEL_16;
    }
    uint64_t v15 = v14;
    uint64_t v16 = (char *)[v14 seekToEndOfFile] + 16;
    [v15 seekToFileOffset:0];
    size_t dataOutAvailable = NSRoundUpToMultipleOfPageSize((NSUInteger)v16);
    [v15 truncateFileAtOffset:dataOutAvailable];
    CFStringRef v18 = mmap(0, dataOutAvailable, 2, 1, (int)[v15 fileDescriptor], 0);
    if (v18 == (void *)-1)
    {
      if (qword_10006EAF8 == -1)
      {
        id v22 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
          return 0;
        }
      }
      else
      {
        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
        id v22 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
          return 0;
        }
      }
      int v24 = *__error();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v28 = 1026;
      LODWORD(v29) = v24;
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Unable to mmap storage file %{public}@ because %{public, darwin.errno}d", buf, 0x12u);
      return 0;
    }
    dataOut = v18;
    *(void *)long long buf = 0;
    CCCryptorStatus v20 = CCCrypt(a2, 0, 1u, [a4 bytes], (size_t)[a4 length], [a5 bytes], dataOut, (size_t)v16, dataOut, dataOutAvailable, (size_t *)buf);
    munmap(dataOut, dataOutAvailable);
    if (!v20)
    {
      [v15 truncateFileAtOffset:*(void *)buf];
      return v13;
    }
    if (qword_10006EAF8 == -1)
    {
      uint64_t v6 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      uint64_t v6 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    v26[0] = 67109120;
    v26[1] = v20;
    uint64_t v7 = "Failed to archive data! %d";
    uint64_t v8 = (uint8_t *)v26;
    goto LABEL_6;
  }
  if (qword_10006EAF8 != -1)
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    uint64_t v6 = qword_10006EB00;
    if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    goto LABEL_5;
  }
  uint64_t v6 = qword_10006EB00;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
  {
LABEL_5:
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a2;
    uint64_t v7 = "CCCrypt operation %d not supported";
    uint64_t v8 = buf;
LABEL_6:
    char v9 = v6;
    uint32_t v10 = 8;
LABEL_16:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v7, v8, v10);
  }
  return 0;
}

void *sub_100013BC4(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  objc_opt_class();
  id v4 = sub_1000130B8();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  objc_opt_class();
  uint64_t v6 = sub_1000131C8();
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (!sub_100013358(a1, v5, v6, [a2 lastPathComponent])) {
    return 0;
  }

  return sub_1000137D4(a1, 0, a2, v5, v7);
}

void *sub_100013C70(NSDictionary *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v5 = [a2 lastPathComponent];
  Class isa = a1[1].super.isa;
  id v7 = isa ? objc_getProperty(isa, v4, 24, 1) : 0;
  uint64_t v8 = sub_100013590(a1, (uint64_t)[NSString stringWithFormat:@"%@.%@", v7, objc_msgSend(objc_msgSend(v5, "lastPathComponent"), "stringByDeletingPathExtension")]);
  id v9 = [(NSDictionary *)v8 objectForKeyedSubscript:@"key"];
  id v10 = [(NSDictionary *)v8 objectForKeyedSubscript:@"iv"];
  if (!v9 || v10 == 0) {
    return 0;
  }

  return sub_1000137D4((uint64_t)a1, 1u, a2, v9, v10);
}

void *sub_100013D80(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDIDSMessageStore;
  NSString v3 = [super init];
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

void sub_100013E44(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    NSString v3 = *(void **)(a1 + 8);
    if (!v3 || (id Property = objc_getProperty(v3, (SEL)a2, 32, 1)) == 0)
    {
      if (qword_10006EAF8 == -1)
      {
        CFStringRef v18 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
          return;
        }
      }
      else
      {
        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
        CFStringRef v18 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
          return;
        }
      }
      LOWORD(v19[0]) = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "No remote device ID found", (uint8_t *)v19, 2u);
      return;
    }
    id v7 = Property;
    uint64_t v8 = *(void **)(a1 + 8);
    if (v8) {
      id v9 = (NSURL *)objc_getProperty(v8, v6, 8, 1);
    }
    else {
      id v9 = 0;
    }
    id v26 = v7;
    NSURLResourceKey v25 = NSURLIsDirectoryKey;
    id v10 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:sub_10001C4A4(v9, (uint64_t)+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1)) includingPropertiesForKeys:+[NSArray arrayWithObjects:&v25 count:1] options:4 errorHandler:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [(NSDirectoryEnumerator *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v15);
          v19[0] = 0;
          [v16 getResourceValue:v19 forKey:NSURLIsDirectoryKey error:0];
          if ([v19[0] BOOLValue])
          {
            id v13 = [v16 lastPathComponent];
          }
          else if (v13)
          {
            id v17 = sub_1000140F4((uint64_t)v16);
            if ([v17 count])
            {
              if (!(*(unsigned int (**)(uint64_t, id, id))(a2 + 16))(a2, v13, v17)) {
                return;
              }
              id v13 = 0;
            }
          }
          uint64_t v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v12 = [(NSDirectoryEnumerator *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

id sub_1000140F4(uint64_t a1)
{
  CCRNGStatus v2 = +[NSData dataWithContentsOfURL:a1];
  if (!v2)
  {
    if (qword_10006EAF8 == -1)
    {
      id v7 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return &__NSDictionary0__struct;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v7 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return &__NSDictionary0__struct;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v11 = a1;
    _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "No data found for pending IDS message %{public}@", buf, 0xCu);
    return &__NSDictionary0__struct;
  }
  uint64_t v9 = 0;
  id v3 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:&v9];
  if (v3) {
    BOOL v4 = v9 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4 || (id v5 = v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (qword_10006EAF8 == -1)
    {
      uint64_t v6 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSDictionary0__struct;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      uint64_t v6 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSDictionary0__struct;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v11 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to load serialized IDS Message because %{public}@", buf, 0xCu);
    return &__NSDictionary0__struct;
  }
  return v5;
}

void *sub_1000142D8(void *result, const char *a2)
{
  if (!result) {
    return result;
  }
  CCRNGStatus v2 = result;
  id v3 = (void *)result[1];
  if (!v3 || !objc_getProperty(v3, a2, 32, 1))
  {
    if (qword_10006EAF8 == -1)
    {
      uint64_t v9 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSDictionary0__struct;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      uint64_t v9 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSDictionary0__struct;
      }
    }
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No remote device ID found", buf, 2u);
    return &__NSDictionary0__struct;
  }
  id v6 = (id)v2[1];
  if (v6)
  {
    id Property = (NSURL *)objc_getProperty(v6, v5, 8, 1);
    id v6 = (id)v2[1];
    if (v6) {
      id v6 = objc_getProperty(v6, v7, 32, 1);
    }
  }
  else
  {
    id Property = 0;
  }
  id v13 = v6;
  memset(v10, 0, sizeof(v10));
  if ([(NSDirectoryEnumerator *)[+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", a2, 1, sub_10001C4A4(Property, (uint64_t)+[NSArray arrayWithObjects:&v13 count:1])) includingPropertiesForKeys:0 options:4 errorHandler:0] countByEnumeratingWithState:v10 objects:v12 count:16])
  {
    return sub_1000140F4(**((void **)&v10[0] + 1));
  }
  else
  {
    return &__NSDictionary0__struct;
  }
}

void sub_1000144D8(uint64_t a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return;
  }
  if (!a3)
  {
    if (qword_10006EAF8 == -1)
    {
      long long v21 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      long long v21 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_WORD *)long long buf = 0;
    long long v22 = "IDS Identifier is nil";
    goto LABEL_29;
  }
  if (!a2)
  {
    if (qword_10006EAF8 == -1)
    {
      long long v21 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      long long v21 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_WORD *)long long buf = 0;
    long long v22 = "IDS message is nil";
    goto LABEL_29;
  }
  id v6 = *(void **)(a1 + 8);
  if (!v6 || !objc_getProperty(v6, a2, 32, 1))
  {
    if (qword_10006EAF8 == -1)
    {
      long long v21 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      long long v21 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_WORD *)long long buf = 0;
    long long v22 = "No remote device ID found";
LABEL_29:
    _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, v22, buf, 2u);
    return;
  }
  id v8 = *(id *)(a1 + 8);
  if (v8)
  {
    id Property = (NSURL *)objc_getProperty(v8, v7, 8, 1);
    id v8 = *(id *)(a1 + 8);
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 32, 1);
    }
  }
  else
  {
    id Property = 0;
  }
  id v29 = v8;
  uint64_t v11 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", a3, 1, sub_10001C4A4(Property, (uint64_t)+[NSArray arrayWithObjects:&v29 count:1]));
  int v24 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v24])
  {
    if (qword_10006EAF8 == -1)
    {
      id v19 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v19 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    id v26 = v24;
    long long v20 = "Failed to create IDS message store directory because %{public}@";
    goto LABEL_33;
  }
  id v12 = +[NSPropertyListSerialization dataWithPropertyList:a2 format:200 options:0 error:&v24];
  if (!v12 || v24)
  {
    if (qword_10006EAF8 == -1)
    {
      long long v23 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      long long v23 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)long long buf = 138543618;
    id v26 = a2;
    __int16 v27 = 2114;
    __int16 v28 = v24;
    _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Failed to serialize IDS message %{public}@ because %{public}@", buf, 0x16u);
    return;
  }
  id v13 = v12;
  uint64_t v14 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v15 = qword_10006EC90;
  double v16 = *(double *)&qword_10006EC98;
  double v17 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v15 >= v14) {
    double v18 = -v18;
  }
  if (![(NSData *)v13 writeToURL:+[NSURL fileURLWithPath:[(NSURL *)sub_10001BFB4(v17 + v16 + v18) lastPathComponent] isDirectory:0 relativeToURL:v11] options:1 error:&v24])
  {
    if (qword_10006EAF8 == -1)
    {
      id v19 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
      {
LABEL_19:
        *(_DWORD *)long long buf = 138543362;
        id v26 = v24;
        long long v20 = "Failed to write serialized IDS message to disk because %{public}@";
LABEL_33:
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v19 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
    }
  }
}

void sub_1000149FC(uint64_t a1, const char *a2)
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 8);
    if (!v3 || !objc_getProperty(v3, a2, 32, 1))
    {
      if (qword_10006EAF8 == -1)
      {
        uint64_t v9 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
          return;
        }
      }
      else
      {
        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
        uint64_t v9 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
          return;
        }
      }
      *(_WORD *)id v10 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "No remote device ID found", v10, 2u);
      return;
    }
    id v6 = *(id *)(a1 + 8);
    if (v6)
    {
      id Property = (NSURL *)objc_getProperty(v6, v5, 8, 1);
      id v6 = *(id *)(a1 + 8);
      if (v6) {
        id v6 = objc_getProperty(v6, v7, 32, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    id v11 = v6;
    [+[NSFileManager defaultManager](NSFileManager, "defaultManager") removeItemAtURL:+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", a2, 1, sub_10001C4A4(Property, (uint64_t)+[NSArray arrayWithObjects:&v11 count:1])) error:0];
  }
}

uint64_t sub_100014BB4(uint64_t result, double a2, double a3)
{
  if (result)
  {
    uint64_t v5 = result;
    id v7 = +[NSFileManager defaultManager];
    id Property = *(NSURL **)(v5 + 8);
    if (Property) {
      id Property = (NSURL *)objc_getProperty(Property, v6, 8, 1);
    }
    uint64_t v9 = sub_10001C384(Property);
    return sub_1000069E0((uint64_t)v7, v9, 0, 0, 0, a2, a3);
  }
  return result;
}

void *sub_100014C40(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDGizmoStateDatastore;
  id v3 = [super init];
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

void sub_100014D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return;
  }
  if (!a2)
  {
    if (qword_10006EAF8 == -1)
    {
      double v17 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      double v17 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_WORD *)long long buf = 0;
    double v18 = "state is nil";
    goto LABEL_22;
  }
  if (!a3)
  {
    if (qword_10006EAF8 == -1)
    {
      double v17 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      double v17 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_WORD *)long long buf = 0;
    double v18 = "device ID is nil";
LABEL_22:
    _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v18, buf, 2u);
    return;
  }
  id v7 = +[NSFileManager defaultManager];
  id Property = *(id *)(a1 + 8);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 8, 1);
  }
  NSURLResourceKey v43 = NSURLIsDirectoryKey;
  uint64_t v9 = [(NSFileManager *)v7 enumeratorAtURL:sub_10001C530((uint64_t)Property) includingPropertiesForKeys:+[NSArray arrayWithObjects:&v43 count:1] options:4 errorHandler:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = [(NSDirectoryEnumerator *)v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v9);
        }
        double v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        *(void *)long long buf = 0;
        [v16 getResourceValue:buf forKey:NSURLIsDirectoryKey error:0];
        if ([*(id *)buf BOOLValue])
        {
          if (v13 >= 10) {
            goto LABEL_24;
          }
          ++v13;
        }
      }
      id v12 = [(NSDirectoryEnumerator *)v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    if (v13 >= 11)
    {
LABEL_24:
      long long v20 = +[NSFileManager defaultManager];
      id v21 = *(id *)(a1 + 8);
      if (v21) {
        id v21 = objc_getProperty(v21, v19, 8, 1);
      }
      [(NSFileManager *)v20 removeItemAtURL:sub_10001C530((uint64_t)v21) error:0];
    }
  }
  id v22 = *(id *)(a1 + 8);
  if (v22) {
    id v22 = objc_getProperty(v22, v11, 8, 1);
  }
  long long v23 = +[NSURL fileURLWithPath:a3 isDirectory:1 relativeToURL:sub_10001C530((uint64_t)v22)];
  [+[NSFileManager defaultManager] removeItemAtURL:v23 error:0];
  uint64_t v34 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:0 error:&v34])
  {
    if (qword_10006EAF8 == -1)
    {
      id v31 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v31 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v34;
    __int16 v32 = "Failed to create gizmo state store directory because %{public}@";
    goto LABEL_43;
  }
  int v24 = +[NSPropertyListSerialization dataWithPropertyList:a2 format:200 options:0 error:&v34];
  if (!v24 || v34)
  {
    if (qword_10006EAF8 == -1)
    {
      uint64_t v33 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      uint64_t v33 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = a2;
    __int16 v40 = 2114;
    uint64_t v41 = v34;
    _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Failed to serialize gizmo state %{public}@ because %{public}@", buf, 0x16u);
    return;
  }
  NSURLResourceKey v25 = v24;
  uint64_t v26 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v27 = qword_10006EC90;
  double v28 = *(double *)&qword_10006EC98;
  double v29 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v27 >= v26) {
    double v30 = -v30;
  }
  if (![(NSData *)v25 writeToURL:+[NSURL fileURLWithPath:[(NSURL *)sub_10001BFB4(v29 + v28 + v30) lastPathComponent] isDirectory:0 relativeToURL:v23] options:1 error:&v34])
  {
    if (qword_10006EAF8 == -1)
    {
      id v31 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
      {
LABEL_39:
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v34;
        __int16 v32 = "Failed to write serialized gizmo state to disk because %{public}@";
LABEL_43:
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      id v31 = qword_10006EB00;
      if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
    }
  }
}

id sub_1000152E0(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  id Property = *(id *)(a1 + 8);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  BOOL v4 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:+[NSURL fileURLWithPath:a2 isDirectory:1 relativeToURL:sub_10001C530((uint64_t)Property)] includingPropertiesForKeys:0 options:4 errorHandler:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(NSDirectoryEnumerator *)v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138478083;
    long long v21 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v22 = 0;
        id v11 = +[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v10, 0, &v22, v21);
        if (v11)
        {
          id v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:&v22];
          if (v12) {
            BOOL v13 = v22 == 0;
          }
          else {
            BOOL v13 = 0;
          }
          if (v13)
          {
            id v14 = v12;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              return v14;
            }
          }
          if (qword_10006EAF8 == -1)
          {
            uint64_t v15 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
              goto LABEL_21;
            }
          }
          else
          {
            dispatch_once(&qword_10006EAF8, &stru_10005CE88);
            uint64_t v15 = qword_10006EB00;
            if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
            {
LABEL_21:
              *(_DWORD *)long long buf = 138543362;
              uint64_t v28 = v22;
              double v16 = v15;
              double v17 = "Failed to load serialized state because %{public}@";
              uint32_t v18 = 12;
LABEL_8:
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
              continue;
            }
          }
        }
        else if (qword_10006EAF8 == -1)
        {
          uint64_t v19 = qword_10006EB00;
          if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAF8, &stru_10005CE88);
          uint64_t v19 = qword_10006EB00;
          if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR))
          {
LABEL_24:
            *(_DWORD *)long long buf = v21;
            uint64_t v28 = v10;
            __int16 v29 = 2114;
            uint64_t v30 = v22;
            double v16 = v19;
            double v17 = "Failed to load data file %{private}@ because %{public}@";
            uint32_t v18 = 22;
            goto LABEL_8;
          }
        }
      }
      id v7 = [(NSDirectoryEnumerator *)v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }
  return &__NSDictionary0__struct;
}

void sub_1000155F8(id a1)
{
  qword_10006EB00 = (uint64_t)os_log_create("com.apple.SensorKit", "RDDatastore");
}

void sub_1000156F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a1 && a2)
  {
    uint64_t v46 = 0;
    id v7 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", [a2 path], &v46));
    uint64_t v8 = v46;
    if (v46)
    {
      uint64_t v9 = qword_10006EB08;
      if (os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR))
      {
        v54.st_dev = 138412290;
        *(void *)&v54.st_mode = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "error while reading directory, %@", (uint8_t *)&v54, 0xCu);
      }
      return;
    }
    uint64_t v10 = v7;
    if (v7)
    {
      uint64_t v40 = a1;
      unsigned __int8 v45 = 0;
      if (a3) {
        [(NSMutableArray *)v7 sortUsingComparator:a3];
      }
      uint64_t v38 = a3;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v42;
LABEL_13:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * v14);
          id v17 = [[[a2 path] stringByAppendingPathComponent:v15];
          id v18 = [[[a2 relativePath] stringByAppendingPathComponent:v15];
          if (![+[NSFileManager defaultManager] fileExistsAtPath:v17 isDirectory:&v45])goto LABEL_15; {
          uint64_t v19 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v18, v45, [a2 baseURL]);
          }
          long long v20 = v19;
          if (v45)
          {
            sub_1000156F0(v40, v19, v38, a4);
          }
          else
          {
            if (!v19) {
              goto LABEL_15;
            }
            memset(&v54, 0, sizeof(v54));
            long long v21 = [(NSString *)[(NSURL *)v19 path] UTF8String];
            if (!v21) {
              goto LABEL_15;
            }
            stat(v21, &v54);
            archive_entry_new();
            archive_entry_copy_stat();
            [(NSString *)[(NSURL *)v20 relativePath] UTF8String];
            archive_entry_set_pathname();
            if (archive_write_header())
            {
              uint64_t v22 = qword_10006EB08;
              if (os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR))
              {
                long long v36 = [(NSURL *)v20 path];
                int v23 = archive_errno();
                uint64_t v24 = archive_error_string();
                *(_DWORD *)long long buf = 138412802;
                id v51 = v36;
                __int16 v52 = 1024;
                *(_DWORD *)id v53 = v23;
                *(_WORD *)&v53[4] = 2080;
                *(void *)&v53[6] = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to write header for file, %@, status, %d, reason: %s", buf, 0x1Cu);
              }
              goto LABEL_15;
            }
            uint64_t v48 = 0;
            long long v25 = +[NSData dataWithContentsOfURL:v20 options:1 error:&v48];
            if (!v25)
            {
              uint64_t v28 = qword_10006EB08;
              if (os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412546;
                id v51 = v20;
                __int16 v52 = 2112;
                *(void *)id v53 = v48;
                __int16 v29 = v28;
                uint64_t v30 = "failed to open file %@. %@ ";
                uint32_t v31 = 22;
                goto LABEL_40;
              }
LABEL_41:
              archive_entry_free();
              goto LABEL_15;
            }
            long long v26 = v25;
            if (([(NSData *)v25 length] & 0x8000000000000000) != 0)
            {
              uint64_t v32 = qword_10006EB08;
              if (!os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR)) {
                goto LABEL_41;
              }
              uint64_t v33 = [(NSData *)v26 length];
              *(_DWORD *)long long buf = 134218240;
              id v51 = v33;
              __int16 v52 = 2048;
              *(void *)id v53 = 0x7FFFFFFFFFFFFFFFLL;
              __int16 v29 = v32;
              uint64_t v30 = "Data being written is too large (%lu > %ldd)";
              uint32_t v31 = 22;
LABEL_40:
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v30, buf, v31);
              goto LABEL_41;
            }
            [(NSData *)v26 bytes];
            [(NSData *)v26 length];
            id v37 = (id)archive_write_data();
            if (v37 != (id)[(NSData *)v26 length])
            {
              uint64_t v35 = qword_10006EB08;
              if (!os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR)) {
                goto LABEL_41;
              }
              NSUInteger v34 = [(NSData *)v26 length];
              *(_DWORD *)long long buf = 138412802;
              id v51 = v20;
              __int16 v52 = 2048;
              *(void *)id v53 = v34;
              *(_WORD *)&v53[8] = 2048;
              __int16 v29 = v35;
              *(void *)&v53[10] = v37;
              uint64_t v30 = "error writing file, %@, request to write %lu bytes but wrote %ld bytes";
              uint32_t v31 = 32;
              goto LABEL_40;
            }
            archive_entry_free();
            if (*(unsigned char *)(v40 + 16)
              && (uint64_t v47 = 0,
                  ![+[NSFileManager defaultManager] removeItemAtPath:[(NSURL *)v20 path] error:&v47])&& (unint64_t v27 = qword_10006EB08, os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR)))
            {
              *(_DWORD *)long long buf = 138543618;
              id v51 = v20;
              __int16 v52 = 2114;
              *(void *)id v53 = v47;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "error removing file that has been archived %{public}@. %{public}@", buf, 0x16u);
              if (!a4) {
                goto LABEL_15;
              }
            }
            else if (!a4)
            {
              goto LABEL_15;
            }
            if (((*(uint64_t (**)(uint64_t, NSURL *))(a4 + 16))(a4, v20) & 1) == 0)
            {
              return;
            }
          }
LABEL_15:
          if (v12 == (id)++v14)
          {
            id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (!v12) {
              return;
            }
            goto LABEL_13;
          }
        }
      }
    }
  }
}

uint64_t sub_100015D08(uint64_t a1, void *a2, void *a3, int a4, char a5, int a6, uint64_t a7, uint64_t a8)
{
  self;
  uint64_t v15 = [RDArchiver alloc];
  if (!v15) {
    goto LABEL_14;
  }
  if (!a3)
  {

    goto LABEL_14;
  }
  v29.receiver = v15;
  v29.super_class = (Class)RDArchiver;
  double v16 = [super init];
  if (!v16)
  {
LABEL_14:
    sub_1000156F0(0, a2, a7, a8);
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  uint64_t v17 = (uint64_t)v16;
  v16[16] = a5;
  *((void *)v16 + 1) = archive_write_new();
  *(void *)(v17 + 32) = [a3 URLByAppendingPathExtension:@"tar"];
  if (a4)
  {
    int v18 = archive_write_add_filter_gzip();
    *(void *)(v17 + 32) = [*(id *)(v17 + 32) URLByAppendingPathExtension:@"gz"];
    archive_write_set_bytes_per_block();
    id v19 = *(id *)(v17 + 32);
    if (v18) {
      goto LABEL_10;
    }
  }
  else
  {
    int v18 = archive_write_add_filter_none();
    archive_write_set_bytes_per_block();
    id v20 = *(id *)(v17 + 32);
    if (v18) {
      goto LABEL_10;
    }
  }
  int v18 = archive_write_set_format_pax();
  if (v18) {
    goto LABEL_10;
  }
  int v24 = open_dprotected_np((const char *)[objc_msgSend(*(id *)(v17 + 32), "path") UTF8String], 514, a6, 0, 416);
  *(_DWORD *)(v17 + 20) = v24;
  if (v24 < 0)
  {
    long long v26 = qword_10006EB08;
    if (os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(v17 + 32);
      int v28 = *__error();
      *(_DWORD *)long long buf = 138412546;
      uint64_t v31 = v27;
      __int16 v32 = 1024;
      int v33 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to create archive at path %@ with data protection, errno, %{errno}d", buf, 0x12u);
    }
    archive_write_close();
    goto LABEL_13;
  }
  int v18 = archive_write_open_fd();
  *(unsigned char *)(v17 + 24) = 1;
  if (v18)
  {
LABEL_10:
    long long v21 = qword_10006EB08;
    if (os_log_type_enabled((os_log_t)qword_10006EB08, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(v17 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v31 = v25;
      __int16 v32 = 1024;
      int v33 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error creating archive at path %@ %d", buf, 0x12u);
      if (!*(unsigned char *)(v17 + 24)) {
        goto LABEL_13;
      }
    }
    else if (!*(unsigned char *)(v17 + 24))
    {
LABEL_13:

      goto LABEL_14;
    }
    archive_write_free();
    close(*(_DWORD *)(v17 + 20));
    *(unsigned char *)(v17 + 24) = 0;
    goto LABEL_13;
  }
  sub_1000156F0(v17, a2, a7, a8);
  if (*(unsigned char *)(v17 + 24))
  {
    uint64_t v22 = *(void *)(v17 + 32);
    archive_write_free();
    close(*(_DWORD *)(v17 + 20));
    *(unsigned char *)(v17 + 24) = 0;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v22 = 0;
LABEL_16:

  return v22;
}

SRAuthorizationStore *sub_10001649C(uint64_t a1)
{
  uint64_t result = [[SRAuthorizationStore alloc] initWithSensors:*(void *)(a1 + 32)];
  qword_10006EB18 = (uint64_t)result;
  return result;
}

void sub_100016B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100016B94(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  sub_100016BC0(Weak);
}

void sub_100016BC0(void *a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)[a1 updateQueue]);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    CCRNGStatus v2 = _os_activity_create((void *)&_mh_execute_header, "Retrieving fresh authorizations from TCC", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v2, &state);
    id v3 = qword_10006EB10;
    if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Retrieving fresh authorizations from TCC", buf, 2u);
    }
    id v88 = +[NSMutableDictionary dictionary];
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v126 = sub_1000193D8;
    id v127 = &unk_10005CF90;
    id v128 = v88;
    id v4 = [a1 readerAuthorizationGroups];
    long long v151 = 0u;
    long long v152 = 0u;
    memset(v150, 0, sizeof(v150));
    id v5 = [v4 countByEnumeratingWithState:v150 objects:buf count:16];
    id v107 = (id *)a1;
    if (v5)
    {
      uint64_t v85 = **(void **)&v150[16];
      obj = v4;
      do
      {
        __int16 v91 = 0;
        id v80 = v5;
        do
        {
          if (**(void **)&v150[16] != v85) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*(void *)&v150[8] + 8 * (void)v91);
          id v95 = [v107[4] bundleIdentifiersForService:v6];
          id v7 = [v107[4] bundleIdentifiersDisabledForService:v6];
          id v92 = v7;
          if (v95) {
            BOOL v8 = v7 == 0;
          }
          else {
            BOOL v8 = 1;
          }
          if (v8)
          {
            uint64_t v9 = qword_10006EB10;
            if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)double v144 = 138543362;
              uint64_t v145 = v6;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Could not retrieve authorization information for TCC service %{public}@", v144, 0xCu);
            }
          }
          unsigned int v10 = [v107[4] isOverriddenForService:v6];
          id v11 = qword_10006EB10;
          if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)double v144 = 138543874;
            uint64_t v145 = v6;
            __int16 v146 = 1026;
            unsigned int v147 = v10;
            __int16 v148 = 2114;
            id v149 = v95;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Authorized Bundle Ids for %{public}@, overridden %{public, BOOL}d, %{public}@", v144, 0x1Cu);
            id v11 = qword_10006EB10;
          }
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)double v144 = 138543874;
            uint64_t v145 = v6;
            __int16 v146 = 1026;
            unsigned int v147 = v10;
            __int16 v148 = 2114;
            id v149 = v92;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deauthorized Bundle Ids for %{public}@, overridden %{public, BOOL}d, %{public}@", v144, 0x1Cu);
          }
          id v12 = [obj objectForKeyedSubscript:v6];
          long long v142 = 0u;
          long long v143 = 0u;
          memset(v141, 0, sizeof(v141));
          id v13 = [v12 countByEnumeratingWithState:v141 objects:v157 count:16];
          if (v13)
          {
            uint64_t v14 = **(void **)&v141[16];
            if (v10) {
              uint64_t v15 = &__kCFBooleanTrue;
            }
            else {
              uint64_t v15 = &__kCFBooleanFalse;
            }
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (**(void **)&v141[16] != v14) {
                  objc_enumerationMutation(v12);
                }
                [v126((uint64_t)v125, @"com.apple.sensorkit.dummy-bundle-id") setObject:v15 forKeyedSubscript:*(void *)(*(void *)&v141[8] + 8 * i)];
              }
              id v13 = [v12 countByEnumeratingWithState:v141 objects:v157 count:16];
            }
            while (v13);
          }
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          id v17 = [v95 countByEnumeratingWithState:&v121 objects:&v153 count:16];
          if (v17)
          {
            id v98 = *(id *)v122;
            do
            {
              int v18 = 0;
              id v102 = v17;
              do
              {
                if (*(id *)v122 != v98) {
                  objc_enumerationMutation(v95);
                }
                uint64_t v19 = *(void *)(*((void *)&v121 + 1) + 8 * (void)v18);
                long long v117 = 0u;
                long long v118 = 0u;
                long long v119 = 0u;
                long long v120 = 0u;
                id v20 = [v12 countByEnumeratingWithState:&v117 objects:&v137 count:16];
                if (v20)
                {
                  uint64_t v21 = *(void *)v118;
                  do
                  {
                    for (j = 0; j != v20; j = (char *)j + 1)
                    {
                      if (*(void *)v118 != v21) {
                        objc_enumerationMutation(v12);
                      }
                      [v126((uint64_t)v125, v19) setObject:&__kCFBooleanTrue forKeyedSubscript:*(void *)(*((void *)&v117 + 1) + 8 * (void)j)];
                    }
                    id v20 = [v12 countByEnumeratingWithState:&v117 objects:&v137 count:16];
                  }
                  while (v20);
                }
                int v18 = (char *)v18 + 1;
              }
              while (v18 != v102);
              id v17 = [v95 countByEnumeratingWithState:&v121 objects:&v153 count:16];
            }
            while (v17);
          }
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v23 = [v92 countByEnumeratingWithState:&v113 objects:&v133 count:16];
          if (v23)
          {
            id v99 = *(id *)v114;
            do
            {
              int v24 = 0;
              id v103 = v23;
              do
              {
                if (*(id *)v114 != v99) {
                  objc_enumerationMutation(v92);
                }
                uint64_t v25 = *(void *)(*((void *)&v113 + 1) + 8 * (void)v24);
                long long v109 = 0u;
                long long v110 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                id v26 = [v12 countByEnumeratingWithState:&v109 objects:&v129 count:16];
                if (v26)
                {
                  uint64_t v27 = *(void *)v110;
                  do
                  {
                    for (k = 0; k != v26; k = (char *)k + 1)
                    {
                      if (*(void *)v110 != v27) {
                        objc_enumerationMutation(v12);
                      }
                      [v126((uint64_t)v125, v25) setObject:&__kCFBooleanFalse forKeyedSubscript:k];
                    }
                    id v26 = [v12 countByEnumeratingWithState:&v109 objects:&v129 count:16];
                  }
                  while (v26);
                }
                int v24 = (char *)v24 + 1;
              }
              while (v24 != v103);
              id v23 = [v92 countByEnumeratingWithState:&v113 objects:&v133 count:16];
            }
            while (v23);
          }
          __int16 v91 = (char *)v91 + 1;
        }
        while (v91 != v80);
        id v5 = [obj countByEnumeratingWithState:v150 objects:buf count:16];
      }
      while (v5);
    }
    id v78 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", [v107 readerAuthorizationValues]);
    [v107 setReaderAuthorizationValues:v88];
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v29 = [v107 readerAuthorizationValues];
    id v30 = [v29 countByEnumeratingWithState:&v153 objects:buf count:16];
    if (v30)
    {
      id v104 = v29;
      char v31 = 0;
      uint64_t v32 = *(void *)v154;
      do
      {
        for (m = 0; m != v30; m = (char *)m + 1)
        {
          if (*(void *)v154 != v32) {
            objc_enumerationMutation(v104);
          }
          uint64_t v34 = *(void *)(*((void *)&v153 + 1) + 8 * (void)m);
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          id v35 = [[objc_msgSend(v107, "readerAuthorizationValues") objectForKeyedSubscript:v34];
          id v36 = [v35 countByEnumeratingWithState:&v137 objects:v157 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v138;
            do
            {
              for (n = 0; n != v36; n = (char *)n + 1)
              {
                if (*(void *)v138 != v37) {
                  objc_enumerationMutation(v35);
                }
                if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v107, "readerAuthorizationValues"), "objectForKeyedSubscript:", v34), "objectForKeyedSubscript:", *(void *)(*((void *)&v137 + 1) + 8 * (void)n)), "BOOLValue"))
                {
                  char v31 = 1;
                  goto LABEL_65;
                }
              }
              id v36 = [v35 countByEnumeratingWithState:&v137 objects:v157 count:16];
            }
            while (v36);
          }
LABEL_65:
          ;
        }
        id v30 = [v104 countByEnumeratingWithState:&v153 objects:buf count:16];
      }
      while (v30);
    }
    else
    {
      char v31 = 0;
    }
    id v39 = v107;
    [v107 setSensorKitActive:v31 & 1];
    id v40 = objc_alloc_init((Class)NSMutableDictionary);
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v41 = [v107 readerAuthorizationValues];
    id v81 = [v41 countByEnumeratingWithState:&v137 objects:buf count:16];
    if (v81)
    {
      contexta = *(void **)v138;
      v79 = v41;
      do
      {
        for (ii = 0; ii != v81; ii = (char *)ii + 1)
        {
          if (*(void **)v138 != contexta) {
            objc_enumerationMutation(v79);
          }
          uint64_t v42 = *(void *)(*((void *)&v137 + 1) + 8 * (void)ii);
          id v43 = [v107[4] informationForBundleId:v42];
          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v44 = (char *)[v43 countByEnumeratingWithState:&v133 objects:v157 count:16];
          if (v44)
          {
            id v93 = v43;
            id v96 = *(id *)v134;
            do
            {
              v100 = v44;
              unsigned __int8 v45 = 0;
              do
              {
                if (*(id *)v134 != v96) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v47 = *(void **)(*((void *)&v133 + 1) + 8 * (void)v45);
                id v48 = [v47 objectForKeyedSubscript:kTCCInfoService];
                v105 = v45;
                if (v48)
                {
                  id v49 = [v47 objectForKeyedSubscript:kTCCInfoLastModified];
                  if (v49)
                  {
                    if (![v40 objectForKeyedSubscript:v42])
                    {
                      id v50 = objc_alloc_init((Class)NSMutableDictionary);
                      [v40 setObject:v50 forKeyedSubscript:v42];
                    }
                    long long v131 = 0u;
                    long long v132 = 0u;
                    long long v129 = 0u;
                    long long v130 = 0u;
                    id v51 = [objc_msgSend(objc_msgSend(v107, "readerAuthorizationGroups"), "objectForKeyedSubscript:", v48);
                    id v52 = [v51 countByEnumeratingWithState:&v129 objects:&v153 count:16];
                    if (v52)
                    {
                      uint64_t v53 = *(void *)v130;
                      do
                      {
                        for (jj = 0; jj != v52; jj = (char *)jj + 1)
                        {
                          if (*(void *)v130 != v53) {
                            objc_enumerationMutation(v51);
                          }
                          uint64_t v55 = *(void *)(*((void *)&v129 + 1) + 8 * (void)jj);
                          [v49 timeIntervalSinceReferenceDate];
                          [objc_msgSend(v40, "objectForKeyedSubscript:", v42) setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:v55];
                        }
                        id v52 = [v51 countByEnumeratingWithState:&v129 objects:&v153 count:16];
                      }
                      while (v52);
                    }
                  }
                  else
                  {
                    long long v56 = qword_10006EB10;
                    if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)uint64_t v150 = 138543618;
                      *(void *)&v150[4] = v42;
                      *(_WORD *)&v150[12] = 2114;
                      *(void *)&v150[14] = v48;
                      _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "No last modified date for authorization of bundle %{public}@, service: %{public}@", v150, 0x16u);
                    }
                  }
                }
                else
                {
                  uint64_t v46 = qword_10006EB10;
                  if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)uint64_t v150 = 138543362;
                    *(void *)&v150[4] = v47;
                    _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Couldn't find a TCC service in the TCC access dictionary %{public}@", v150, 0xCu);
                  }
                }
                unsigned __int8 v45 = v105 + 1;
                id v43 = v93;
              }
              while (v105 + 1 != v100);
              long long v44 = (char *)[v93 countByEnumeratingWithState:&v133 objects:v157 count:16];
            }
            while (v44);
          }
        }
        id v39 = v107;
        id v81 = [v79 countByEnumeratingWithState:&v137 objects:buf count:16];
      }
      while (v81);
    }
    [v39 setReaderLastModifiedAuthorizationTimes:v40];

    id v57 = v39[2];
    objc_sync_enter(v57);
    id v58 = [v39[2] copy];
    objc_sync_exit(v57);
    sub_100017E60((uint64_t)v39, v88, v78, v58);

    id v59 = v39[3];
    objc_sync_enter(v59);
    id v89 = [v39[3] copy];
    objc_sync_exit(v59);
    id v60 = +[NSMutableDictionary dictionary];
    *(void *)uint64_t v150 = _NSConcreteStackBlock;
    *(void *)&v150[8] = 3221225472;
    *(void *)&v150[16] = sub_100019450;
    *(void *)&v150[24] = &unk_10005CF90;
    *(void *)&long long v151 = v60;
    id v61 = [v39 writerAuthorizationGroups];
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v62 = [v61 countByEnumeratingWithState:&v137 objects:buf count:16];
    id v87 = v60;
    if (v62)
    {
      id v94 = *(id *)v138;
      id v101 = v61;
      do
      {
        id v63 = 0;
        id v97 = v62;
        do
        {
          if (*(id *)v138 != v94) {
            objc_enumerationMutation(v101);
          }
          uint64_t v64 = *(void *)(*((void *)&v137 + 1) + 8 * (void)v63);
          id v65 = [v107[4] bundleIdentifiersForService:v64];
          id v66 = [v107[4] bundleIdentifiersDisabledForService:v64];
          id v67 = v66;
          id v68 = qword_10006EB10;
          if (v65) {
            BOOL v69 = v66 == 0;
          }
          else {
            BOOL v69 = 1;
          }
          if (v69 && os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)unint64_t v141 = 138543362;
            *(void *)&v141[4] = v64;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Could not retrieve authorization information for TCC service %{public}@", v141, 0xCu);
            id v68 = qword_10006EB10;
          }
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)unint64_t v141 = 138543618;
            *(void *)&v141[4] = v64;
            *(_WORD *)&v141[12] = 2114;
            *(void *)&v141[14] = v65;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Authorized Bundle Ids for %{public}@, %{public}@", v141, 0x16u);
            id v68 = qword_10006EB10;
          }
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)unint64_t v141 = 138543618;
            *(void *)&v141[4] = v64;
            *(_WORD *)&v141[12] = 2114;
            *(void *)&v141[14] = v67;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Deauthorized Bundle Ids for %{public}@, %{public}@", v141, 0x16u);
          }
          id v70 = [v101 objectForKeyedSubscript:v64];
          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          id v71 = [v65 countByEnumeratingWithState:&v133 objects:v157 count:16];
          if (v71)
          {
            uint64_t v72 = *(void *)v134;
            do
            {
              for (kk = 0; kk != v71; kk = (char *)kk + 1)
              {
                if (*(void *)v134 != v72) {
                  objc_enumerationMutation(v65);
                }
                [*(uint64_t (**)(uint8_t *, void))&v150[16] setObject:&__kCFBooleanTrue forKeyedSubscript:v70];
              }
              id v71 = [v65 countByEnumeratingWithState:&v133 objects:v157 count:16];
            }
            while (v71);
          }
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          id v74 = [v67 countByEnumeratingWithState:&v129 objects:&v153 count:16];
          if (v74)
          {
            uint64_t v75 = *(void *)v130;
            do
            {
              for (mm = 0; mm != v74; mm = (char *)mm + 1)
              {
                if (*(void *)v130 != v75) {
                  objc_enumerationMutation(v67);
                }
                [(*(uint64_t (**)(uint8_t *, void))&v150[16])(v150, *(void *)(*((void *)&v129 + 1) + 8 * (void)mm)) setObject:&__kCFBooleanFalse forKeyedSubscript:v70];
              }
              id v74 = [v67 countByEnumeratingWithState:&v129 objects:&v153 count:16];
            }
            while (v74);
          }
          id v63 = (char *)v63 + 1;
        }
        while (v63 != v97);
        id v62 = [v101 countByEnumeratingWithState:&v137 objects:buf count:16];
      }
      while (v62);
    }
    id v77 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", [v107 writerAuthorizationValues]);
    [v107 setWriterAuthorizationValues:v87];
    sub_100017E60((uint64_t)v107, v87, v77, v89);

    os_activity_scope_leave(&state);
  }
}

void sub_100017B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  objc_sync_exit(v29);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100017BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_100017E58(uint64_t a1)
{
}

id sub_100017E60(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (!a3)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id result = [a4 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (!result) {
      return result;
    }
    id v35 = result;
    uint64_t v36 = *(void *)v65;
LABEL_52:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v65 == v36)
      {
        uint64_t v38 = *(void **)(*((void *)&v64 + 1) + 8 * v37);
        if (objc_opt_respondsToSelector()) {
          goto LABEL_58;
        }
      }
      else
      {
        objc_enumerationMutation(a4);
        uint64_t v38 = *(void **)(*((void *)&v64 + 1) + 8 * v37);
        if (objc_opt_respondsToSelector()) {
LABEL_58:
        }
          [v38 authorizationStore:a1 didDetermineInitialAuthorizationValues:a2];
      }
      if (v35 == (id)++v37)
      {
        id result = [a4 countByEnumeratingWithState:&v64 objects:v76 count:16];
        id v35 = result;
        if (!result) {
          return result;
        }
        goto LABEL_52;
      }
    }
  }
  uint64_t v6 = a3;
  id v7 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", [a3 allKeys]);
  -[NSMutableSet unionSet:](v7, "unionSet:", +[NSSet setWithArray:](NSSet, "setWithArray:", [a2 allKeys]));
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obj = v7;
  id result = [(NSMutableSet *)v7 countByEnumeratingWithState:&v60 objects:v75 count:16];
  id v45 = result;
  if (result)
  {
    uint64_t v41 = *(void *)v61;
    *(void *)&long long v9 = 138543618;
    long long v39 = v9;
    id v43 = a2;
    long long v44 = a4;
    uint64_t v42 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v61 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v10;
        uint64_t v11 = *(void *)(*((void *)&v60 + 1) + 8 * v10);
        id v12 = [v6 objectForKeyedSubscript:v11, v39];
        id v13 = [a2 objectForKeyedSubscript:v11];
        id v14 = objc_alloc_init((Class)NSMutableSet);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v15 = [v13 countByEnumeratingWithState:&v56 objects:v74 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v57;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v57 != v17) {
                objc_enumerationMutation(v13);
              }
              uint64_t v19 = *(void *)(*((void *)&v56 + 1) + 8 * i);
              id v20 = [v13 objectForKeyedSubscript:v19];
              id v21 = [v12 objectForKeyedSubscript:v19];
              if ([v20 BOOLValue] && !objc_msgSend(v21, "BOOLValue")
                || v20 && ([v20 BOOLValue] & 1) == 0 && !v21)
              {
                [v14 addObject:v19];
              }
            }
            id v16 = [v13 countByEnumeratingWithState:&v56 objects:v74 count:16];
          }
          while (v16);
        }
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v22 = [v12 countByEnumeratingWithState:&v52 objects:v73 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v53;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v53 != v24) {
                objc_enumerationMutation(v12);
              }
              uint64_t v26 = *(void *)(*((void *)&v52 + 1) + 8 * (void)j);
              id v27 = [v13 objectForKeyedSubscript:v26];
              if (v27)
              {
                int v28 = v27;
                if ((objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", v26), "BOOLValue") & 1) == 0)
                {
                  if ([v12 objectForKeyedSubscript:v26]) {
                    continue;
                  }
                }
                if ([v28 BOOLValue]) {
                  continue;
                }
              }
              [v14 addObject:v26];
            }
            id v23 = [v12 countByEnumeratingWithState:&v52 objects:v73 count:16];
          }
          while (v23);
        }
        a2 = v43;
        if ([v14 count])
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v29 = [v44 countByEnumeratingWithState:&v48 objects:v72 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v49;
            do
            {
              for (k = 0; k != v30; k = (char *)k + 1)
              {
                if (*(void *)v49 == v31)
                {
                  int v33 = *(void **)(*((void *)&v48 + 1) + 8 * (void)k);
                  if ((objc_opt_respondsToSelector() & 1) == 0) {
                    continue;
                  }
                }
                else
                {
                  objc_enumerationMutation(v44);
                  int v33 = *(void **)(*((void *)&v48 + 1) + 8 * (void)k);
                  if ((objc_opt_respondsToSelector() & 1) == 0) {
                    continue;
                  }
                }
                [v33 authorizationStore:a1 didUpdateAuthorizationsForBundleId:v11 sensors:v14];
              }
              id v30 = [v44 countByEnumeratingWithState:&v48 objects:v72 count:16];
            }
            while (v30);
          }
          uint64_t v34 = qword_10006EB10;
          if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v39;
            uint64_t v69 = v11;
            __int16 v70 = 2114;
            id v71 = v14;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Authorization Changed for bundle id %{public}@ for sensors %{public}@", buf, 0x16u);
          }
        }

        uint64_t v10 = v47 + 1;
        uint64_t v6 = v42;
      }
      while ((id)(v47 + 1) != v45);
      id result = [(NSMutableSet *)obj countByEnumeratingWithState:&v60 objects:v75 count:16];
      id v45 = result;
    }
    while (result);
  }
  return result;
}

void sub_10001847C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000184FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000185B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100018634(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100018798(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 0;
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      if (a3)
      {
        id v7 = (void *)a1[4];
        return (uint64_t)[v7 setOverride:1 forService:a2];
      }
      else
      {
        id v22 = a1;
        id v9 = [a1 readerAuthorizationBundleIdValues];
        id v10 = +[SRSensorDescription sensorDescriptionsForAuthorizationService:v6];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (!v11) {
          return (uint64_t)[(id)v22[4] setOverride:0 forService:v6];
        }
        id v12 = v11;
        uint64_t v21 = v6;
        char v23 = 0;
        uint64_t v13 = *(void *)v31;
        uint64_t v24 = *(void *)v31;
        do
        {
          id v14 = 0;
          id v25 = v12;
          do
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v9);
            }
            id v15 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v14);
            if (([v15 isEqualToString:a4] & 1) == 0)
            {
              long long v28 = 0u;
              long long v29 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              id v16 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v18 = a4;
                uint64_t v19 = *(void *)v27;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v27 != v19) {
                      objc_enumerationMutation(v10);
                    }
                    if (objc_msgSend(objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", v15), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "name")), "BOOLValue"))
                    {
                      char v23 = 1;
                      goto LABEL_12;
                    }
                  }
                  id v17 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
                }
                while (v17);
LABEL_12:
                a4 = v18;
                uint64_t v13 = v24;
                id v12 = v25;
              }
            }
            id v14 = (char *)v14 + 1;
          }
          while (v14 != v12);
          id v12 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
        uint64_t v6 = v21;
        if (v23) {
          return 1;
        }
        else {
          return (uint64_t)[(id)v22[4] setOverride:0 forService:v6];
        }
      }
    }
  }
  return result;
}

id sub_100018F88(uint64_t a1, void *a2, uint64_t a3)
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id result = [a2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  id v17 = result;
  if (result)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(a2);
        }
        uint64_t v19 = v6;
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * v6);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = [a2 objectForKeyedSubscript:v7, v16];
        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            id v12 = 0;
            do
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v12);
              id v15 = +[SRSensorDescription sensorDescriptionForSensor:v13];
              if (v15) {
                [*(id *)(a1 + 32) addObject:(*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, v15)];
              }
              id v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }
        uint64_t v6 = v19 + 1;
      }
      while ((id)(v19 + 1) != v17);
      id result = [a2 countByEnumeratingWithState:&v24 objects:v29 count:16];
      id v17 = result;
    }
    while (result);
  }
  return result;
}

NSString *__cdecl sub_100019170(id a1, SRSensorDescription *a2)
{
  return [(SRSensorDescription *)a2 authorizationService];
}

NSString *__cdecl sub_100019178(id a1, SRSensorDescription *a2)
{
  return [(SRSensorDescription *)a2 writerAuthorizationService];
}

id sub_1000193D8(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!result)
  {
    id v5 = +[NSMutableDictionary dictionary];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
    return v5;
  }
  return result;
}

id sub_100019450(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!result)
  {
    id v5 = +[NSMutableDictionary dictionary];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
    return v5;
  }
  return result;
}

uint64_t sub_1000198A4(uint64_t a1, void *a2, int a3)
{
  if (!a1) {
    return 0;
  }
  if (qword_10006EB28 != -1)
  {
    dispatch_once(&qword_10006EB28, &stru_10005CFB0);
    id v4 = qword_10006EB30;
    if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
LABEL_39:
    *(_DWORD *)long long buf = 138543618;
    long long v31 = a2;
    __int16 v32 = 1026;
    LODWORD(v33) = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removing files from %{public}@ dry run: %{public, BOOL}d", buf, 0x12u);
    goto LABEL_4;
  }
  id v4 = qword_10006EB30;
  if (os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_39;
  }
LABEL_4:
  id v5 = +[NSFileManager defaultManager];
  v35[0] = NSURLFileSizeKey;
  v35[1] = NSURLIsDirectoryKey;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = [(NSFileManager *)v5 enumeratorAtURL:a2 includingPropertiesForKeys:+[NSArray arrayWithObjects:v35 count:2] options:0 errorHandler:0];
  id v6 = [(NSDirectoryEnumerator *)obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v22 = 0;
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v7 = 138543618;
    long long v19 = v7;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (qword_10006EB28 == -1)
        {
          uint64_t v13 = qword_10006EB30;
          if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_INFO)) {
            goto LABEL_15;
          }
LABEL_14:
          *(_DWORD *)long long buf = 138543362;
          long long v31 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "File %{public}@", buf, 0xCu);
          goto LABEL_15;
        }
        dispatch_once(&qword_10006EB28, &stru_10005CFB0);
        uint64_t v13 = qword_10006EB30;
        if (os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_INFO)) {
          goto LABEL_14;
        }
LABEL_15:
        id v24 = 0;
        int64_t v25 = 0;
        if (objc_msgSend(v11, "getResourceValue:forKey:error:", &v24, NSURLIsDirectoryKey, &v25, v19)) {
          goto LABEL_18;
        }
        if (qword_10006EB28 == -1)
        {
          id v14 = qword_10006EB30;
          if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_FAULT)) {
            goto LABEL_18;
          }
        }
        else
        {
          dispatch_once(&qword_10006EB28, &stru_10005CFB0);
          id v14 = qword_10006EB30;
          if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_FAULT))
          {
LABEL_18:
            if ([v24 BOOLValue]) {
              goto LABEL_9;
            }
            goto LABEL_19;
          }
        }
        *(_DWORD *)long long buf = v19;
        long long v31 = v11;
        __int16 v32 = 2114;
        int64_t v33 = v25;
        _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Failed to get NSURLIsDirectoryKey resource for %{public}@ because %{public}@", buf, 0x16u);
        if ([v24 BOOLValue]) {
          goto LABEL_9;
        }
LABEL_19:
        int64_t v15 = [+[NSFileManager defaultManager] fileSizeOfURL:v11];
        if (a3) {
          goto LABEL_8;
        }
        if (qword_10006EB28 != -1)
        {
          dispatch_once(&qword_10006EB28, &stru_10005CFB0);
          uint64_t v16 = qword_10006EB30;
          if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
LABEL_22:
          *(_DWORD *)long long buf = v19;
          long long v31 = v11;
          __int16 v32 = 2050;
          int64_t v33 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Removing %{public}@ (%{public}lld bytes)", buf, 0x16u);
          goto LABEL_23;
        }
        uint64_t v16 = qword_10006EB30;
        if (os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
LABEL_23:
        uint64_t v23 = 0;
        if ([+[NSFileManager defaultManager] removeItemAtURL:v11 error:&v23])
        {
LABEL_8:
          v22 += v15;
          goto LABEL_9;
        }
        if (qword_10006EB28 == -1)
        {
          id v17 = qword_10006EB30;
          if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_9;
          }
LABEL_26:
          *(_DWORD *)long long buf = 138543362;
          long long v31 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to remove old file %{public}@", buf, 0xCu);
          goto LABEL_9;
        }
        dispatch_once(&qword_10006EB28, &stru_10005CFB0);
        id v17 = qword_10006EB30;
        if (os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
LABEL_9:
      }
      id v8 = [(NSDirectoryEnumerator *)obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (!v8) {
        return v22;
      }
    }
  }
  return 0;
}

void sub_100019D78(id a1)
{
  qword_10006EB30 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogNSFileManager+RDDatastore");
}

SRSensorDescription *sub_10001A0F8(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v4 = (NSURL *)[a2 sr_sensorByDeletingDeletionRecord];
  unsigned __int8 v5 = [(NSURL *)v4 isEqualToString:a2];
  id v6 = (SRSensorDescription *)[*(id *)(a1 + 8) objectForKey:v4];
  if (v6)
  {
    if (v5) {
      return v6;
    }
  }
  else
  {
    id v6 = sub_10001A638(a1, v4);
    if (v6) {
      char v8 = v5;
    }
    else {
      char v8 = 1;
    }
    if (v8) {
      return v6;
    }
  }

  return (SRSensorDescription *)+[SRSensorDescription sensorDescriptionForDeletionRecordFromDescription:v6];
}

uint64_t sub_10001A21C()
{
  self;
  uint64_t result = qword_10006EB40;
  if (!qword_10006EB40)
  {
    self;
    if (qword_10006EB50 != -1) {
      dispatch_once(&qword_10006EB50, &stru_10005CFD0);
    }
    return qword_10006EB48;
  }
  return result;
}

void sub_10001A2CC(id a1)
{
  qword_10006EB48 = objc_alloc_init(SRSensorsCache);
}

void *sub_10001A5B4(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CCRNGStatus v2 = [SRSensorDescriptionEnumerator alloc];
    if (v2)
    {
      v4.receiver = v2;
      v4.super_class = (Class)SRSensorDescriptionEnumerator;
      id v3 = [super init];
      if (v3) {
        v3[1] = v1;
      }
    }
    else
    {
      id v3 = 0;
    }
    return v3;
  }
  return result;
}

SRSensorDescription *sub_10001A638(uint64_t a1, NSURL *a2)
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v4 = *(void **)(a1 + 16);
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138543362;
    long long v22 = v6;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
      id v11 = [(NSURL *)a2 stringByAppendingPathExtension:@"plist", v22];
      if (!v11) {
        break;
      }
      id v12 = +[NSURL fileURLWithPath:v11 isDirectory:0 relativeToURL:v10];
      long long v27 = 0;
      uint64_t v13 = +[NSDictionary dictionaryWithContentsOfURL:v12 error:&v27];
      if (v13)
      {
        id v14 = [[SRSensorDescription alloc] initWithDictionary:v13];
        int64_t v15 = [(SRSensorDescription *)v14 name];
        [*(id *)(a1 + 8) setObject:v14 forKey:v15];
        if ([(SRSensorDescription *)v14 legacyName]) {
          [*(id *)(a1 + 8) setObject:v14 forKey:-[SRSensorDescription legacyName](v14, "legacyName")];
        }
        uint64_t v16 = qword_10006EB38;
        if (os_log_type_enabled((os_log_t)qword_10006EB38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138543618;
          long long v30 = (NSURL *)v15;
          __int16 v31 = 2114;
          __int16 v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Cached description for %{public}@, %{public}@", buf, 0x16u);
        }
        if (v14) {
          return v14;
        }
      }
      else if (objc_msgSend(-[SRSensorDescription domain](v27, "domain"), "isEqualToString:", NSCocoaErrorDomain)&& -[SRSensorDescription code](v27, "code") == (id)260)
      {
        id v17 = qword_10006EB38;
        if (os_log_type_enabled((os_log_t)qword_10006EB38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = v22;
          long long v30 = v12;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@ not found", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v18 = qword_10006EB38;
        if (os_log_type_enabled((os_log_t)qword_10006EB38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          long long v30 = v12;
          __int16 v31 = 2114;
          __int16 v32 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to parse %{public}@ because %{public}@", buf, 0x16u);
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    long long v19 = qword_10006EB38;
    if (os_log_type_enabled((os_log_t)qword_10006EB38, OS_LOG_TYPE_ERROR))
    {
      long long v21 = *(SRSensorDescription **)(a1 + 16);
      *(_DWORD *)long long buf = 138543618;
      long long v30 = a2;
      __int16 v31 = 2114;
      __int16 v32 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to find description for %{public}@ in %{public}@", buf, 0x16u);
    }
  }
  return 0;
}

void *sub_10001AA08(void *a1, uint64_t a2, int a3)
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)SRCompressedOutputStream;
  id v5 = [super init];
  long long v6 = v5;
  if (v5)
  {
    *((_DWORD *)v5 + 2) = a3;
    v5[7] = 0;
    size_t v7 = compression_encode_scratch_buffer_size((compression_algorithm)*((_DWORD *)v5 + 2));
    v6[8] = NSRoundUpToMultipleOfPageSize(10 * v7);
    [+[NSData data] writeToURL:a2 atomically:1];
    uint64_t v12 = 0;
    uint64_t v8 = +[NSFileHandle fileHandleForWritingToURL:a2 error:&v12];
    objc_setProperty_nonatomic(v6, v9, v8, 72);
    if (!v6[9])
    {
      uint64_t v10 = qword_10006EB58;
      if (os_log_type_enabled((os_log_t)qword_10006EB58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v15 = a2;
        __int16 v16 = 2114;
        uint64_t v17 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error creating writing file handle at %{public}@ because %{public}@", buf, 0x16u);
      }

      return 0;
    }
  }
  return v6;
}

uint64_t sub_10001AE90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = *(id *)(a1 + 80);
    if (!v4)
    {
      id v4 = [objc_alloc((Class)NSMutableData) initWithCapacity:*(void *)(v2 + 64)];
      *(void *)(v2 + 80) = v4;
    }
    uint64_t v8 = 0;
    [*(id *)(v2 + 72) writeData:+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v4, "bytes"), a2, 0) error:&v8];
    uint64_t v5 = v8;
    uint64_t v2 = v8 == 0;
    if (v8)
    {
      long long v6 = qword_10006EB58;
      if (os_log_type_enabled((os_log_t)qword_10006EB58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v10 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error writing to output file. %{public}@", buf, 0xCu);
      }
    }
  }
  return v2;
}

void *sub_10001B31C(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = +[NSURL fileURLWithPath:@"com.apple.private.SensorKit" isDirectory:1 relativeToURL:*(void *)(a1 + 8)];
  uint64_t v7 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v7])
  {
    uint64_t v2 = qword_10006EB60;
    if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v8 = 138543618;
      *(void *)&v8[4] = v1;
      *(_WORD *)&v8[12] = 2114;
      *(void *)&v8[14] = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ because %{public}@", v8, 0x16u);
    }
  }
  id v3 = +[NSURL fileURLWithPath:@"staging" isDirectory:1 relativeToURL:v1];
  [+[NSFileManager defaultManager] createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
  id v4 = [RDFileURLs alloc];
  if (!v4) {
    return 0;
  }
  *(void *)uint64_t v8 = v4;
  *(void *)&v8[8] = RDFileURLs;
  uint64_t v5 = [((objc_super *)v8) init];
  if (v5) {
    v5[1] = v3;
  }
  return v5;
}

NSURL *sub_10001B4B8(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = +[NSURL fileURLWithPath:@"com.apple.private.SensorKit" isDirectory:1 relativeToURL:*(void *)(a1 + 8)];
  uint64_t v4 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v4])
  {
    uint64_t v2 = qword_10006EB60;
    if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      long long v6 = v1;
      __int16 v7 = 2114;
      uint64_t v8 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ because %{public}@", buf, 0x16u);
    }
  }
  return v1;
}

NSURL *sub_10001B5C4(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v3 = [[a2 stringByAddingPercentEncodingWithAllowedCharacters:+[NSCharacterSet URLHostAllowedCharacterSet](NSCharacterSet, "URLHostAllowedCharacterSet")];
  uint64_t v4 = +[NSURL fileURLWithPath:@"com.apple.private.SensorKit" isDirectory:1 relativeToURL:*(void *)(a1 + 8)];
  uint64_t v8 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v8])
  {
    uint64_t v5 = qword_10006EB60;
    if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v10 = v4;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ because %{public}@", buf, 0x16u);
    }
  }
  long long v6 = +[NSURL fileURLWithPath:v3 isDirectory:1 relativeToURL:v4];
  [+[NSFileManager defaultManager] createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];
  return v6;
}

NSURL *sub_10001B74C(uint64_t a1, void *a2, char a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = sub_10001B5C4(a1, a2);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if ((a3 & 4) != 0) {
    CFStringRef v6 = @"curated";
  }
  else {
    CFStringRef v6 = @"uncurated";
  }
  id v7 = [@"sensor-data" stringByAppendingPathComponent:v6];

  return +[NSURL fileURLWithPath:v7 isDirectory:1 relativeToURL:v5];
}

NSURL *sub_10001B7D4(NSURL *result, uint64_t a2, void *a3, char a4)
{
  if (result)
  {
    uint64_t v6 = (uint64_t)result;
    id v7 = [+[NSString pathWithComponents:a2] stringByAppendingPathComponent:@"frame-segments"];
    uint64_t v8 = sub_10001B5C4(v6, a3);
    if (v8)
    {
      if ((a4 & 4) != 0) {
        CFStringRef v9 = @"curated";
      }
      else {
        CFStringRef v9 = @"uncurated";
      }
      uint64_t v10 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", [@"sensor-data" stringByAppendingPathComponent:v9], 1, v8);
    }
    else
    {
      uint64_t v10 = 0;
    }
    return +[NSURL fileURLWithPath:v7 isDirectory:1 relativeToURL:v10];
  }
  return result;
}

NSURL *sub_10001B8A4(NSURL *result, uint64_t a2, void *a3, char a4)
{
  if (result)
  {
    uint64_t v6 = (uint64_t)result;
    id v7 = [+[NSString pathWithComponents:a2] stringByAppendingPathComponent:@"frame-metadata"];
    uint64_t v8 = sub_10001B5C4(v6, a3);
    if (v8)
    {
      if ((a4 & 4) != 0) {
        CFStringRef v9 = @"curated";
      }
      else {
        CFStringRef v9 = @"uncurated";
      }
      uint64_t v10 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", [@"sensor-data" stringByAppendingPathComponent:v9], 1, v8);
    }
    else
    {
      uint64_t v10 = 0;
    }
    return +[NSURL fileURLWithPath:v7 isDirectory:1 relativeToURL:v10];
  }
  return result;
}

NSURL *sub_10001B974(NSURL *result, uint64_t a2, void *a3, char a4)
{
  if (result)
  {
    uint64_t v6 = (uint64_t)result;
    id v7 = [+[NSString pathWithComponents:a2] stringByAppendingPathComponent:@"frame-configuration"];
    uint64_t v8 = sub_10001B5C4(v6, a3);
    if (v8)
    {
      if ((a4 & 4) != 0) {
        CFStringRef v9 = @"curated";
      }
      else {
        CFStringRef v9 = @"uncurated";
      }
      uint64_t v10 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", [@"sensor-data" stringByAppendingPathComponent:v9], 1, v8);
    }
    else
    {
      uint64_t v10 = 0;
    }
    return +[NSURL fileURLWithPath:v7 isDirectory:1 relativeToURL:v10];
  }
  return result;
}

NSURL *sub_10001BA44(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  id v3 = [NSURL fileURLWithPath:@"decrypted" isDirectory:1 relativeToURL:[NSURL fileURLWithPath:[objc_msgSend(@"snapshots", "stringByAppendingPathComponent:", [NSString pathWithComponents:])] isDirectory:1 relativeToURL:sub_10001B5C4(a1, a3)]];
  [+[NSFileManager defaultManager] createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
  return v3;
}

NSURL *sub_10001BB24(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  id v3 = [NSURL fileURLWithPath:@"encrypted" isDirectory:1 relativeToURL:[NSURL fileURLWithPath:[NSString pathWithComponents:[[NSURL fileURLWithPath:@"snapshots" isDirectory:1 relativeToURL:[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"encrypted", 1, +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", objc_msgSend(@"snapshots", "stringByAppendingPathComponent:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", a2)), 1, sub_10001B5C4(a1, a3)))]];
  [+[NSFileManager defaultManager] createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
  return v3;
}

NSURL *sub_10001BC04(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  id v3 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"delivered", 1, +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", [objc_msgSend(@"snapshots", "stringByAppendingPathComponent:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", a2))], 1, sub_10001B5C4(a1, a3)));
  [+[NSFileManager defaultManager] createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
  return v3;
}

NSURL *sub_10001BCE4(NSURL *result, void *a2)
{
  if (result)
  {
    uint64_t v2 = sub_10001B5C4((uint64_t)result, a2);
    return +[NSURL fileURLWithPath:@"clients" isDirectory:0 relativeToURL:v2];
  }
  return result;
}

NSURL *sub_10001BD2C(NSURL *result, void *a2)
{
  if (result)
  {
    uint64_t v2 = sub_10001B5C4((uint64_t)result, a2);
    return +[NSURL fileURLWithPath:@"configurations" isDirectory:0 relativeToURL:v2];
  }
  return result;
}

NSURL *sub_10001BD74(NSURL *result, uint64_t a2, void *a3, char a4)
{
  if (result)
  {
    uint64_t v6 = sub_10001B5C4((uint64_t)result, a3);
    if (v6)
    {
      if ((a4 & 4) != 0) {
        CFStringRef v7 = @"curated";
      }
      else {
        CFStringRef v7 = @"uncurated";
      }
      uint64_t v6 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", [@"sensor-data" stringByAppendingPathComponent:v7], 1, v6);
    }
    uint64_t v8 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", +[NSString pathWithComponents:a2], 1, v6);
    return +[NSURL fileURLWithPath:@"metadata" isDirectory:0 relativeToURL:v8];
  }
  return result;
}

NSURL *sub_10001BE44(NSURL *result, uint64_t a2, void *a3, char a4)
{
  if (result)
  {
    uint64_t v6 = sub_10001B5C4((uint64_t)result, a3);
    if (v6)
    {
      if ((a4 & 4) != 0) {
        CFStringRef v7 = @"curated";
      }
      else {
        CFStringRef v7 = @"uncurated";
      }
      uint64_t v6 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", [@"sensor-data" stringByAppendingPathComponent:v7], 1, v6);
    }
    uint64_t v8 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", +[NSString pathWithComponents:a2], 1, v6);
    return +[NSURL fileURLWithPath:@"configuration" isDirectory:0 relativeToURL:v8];
  }
  return result;
}

NSURL *sub_10001BF14()
{
  self;
  self;
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([(NSArray *)v0 count]) {
    uint64_t v1 = +[NSURL fileURLWithPath:[(NSArray *)v0 firstObject] isDirectory:1];
  }
  else {
    uint64_t v1 = 0;
  }

  return +[NSURL fileURLWithPath:@"com.apple.SensorKitDataExport" isDirectory:1 relativeToURL:v1];
}

NSURL *sub_10001BFB4(double a1)
{
  self;
  uint64_t v2 = +[NSString stringWithFormat:@"%.8f", *(void *)&a1];

  return +[NSURL URLWithString:v2];
}

uint64_t sub_10001C014(uint64_t a1, void *a2)
{
  self;
  id v3 = [a2 indexOfObject:@"frame-segments"];
  if ((unint64_t)v3 < 2 || v3 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return (uint64_t)v3 - 1;
  }
}

uint64_t sub_10001C05C(uint64_t a1, void *a2)
{
  self;
  id v3 = (char *)[a2 indexOfObject:@"snapshots"];
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (char *)[a2 count];
  uint64_t result = (uint64_t)(v4 + 1);
  if (v5 <= v4 + 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10001C0BC(uint64_t a1, void *a2)
{
  self;
  [a2 fileSystemRepresentation];
  if ((dirstat_np() & 0x80000000) == 0) {
    return 0;
  }
  uint64_t v5 = qword_10006EB60;
  if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_ERROR))
  {
    int v19 = *__error();
    *(_DWORD *)long long buf = 138478083;
    long long v29 = a2;
    __int16 v30 = 1026;
    int v31 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to dirstat_np %{private}@ because %{public, errno}d", buf, 0x12u);
  }
  self;
  CFStringRef v7 = +[NSFileManager defaultManager];
  v32[0] = NSURLFileSizeKey;
  v32[1] = NSURLIsDirectoryKey;
  uint64_t v8 = [(NSFileManager *)v7 enumeratorAtURL:a2 includingPropertiesForKeys:+[NSArray arrayWithObjects:v32 count:2] options:0 errorHandler:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(NSDirectoryEnumerator *)v8 countByEnumeratingWithState:&v22 objects:buf count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v3 = 0;
    uint64_t v11 = *(void *)v23;
LABEL_9:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      objc_super v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
      id v21 = 0;
      [v13 getResourceValue:&v21 forKey:NSURLIsDirectoryKey error:0];
      if (([v21 BOOLValue] & 1) == 0)
      {
        uint64_t v14 = (uint64_t)sub_100005E58(+[NSFileManager defaultManager], v13);
        BOOL v15 = __CFADD__(v3, v14);
        v3 += v14;
        uint64_t v16 = v15 ? (v14 >> 63) + 1 : v14 >> 63;
        uint64_t v17 = v16 << 63 >> 63;
        if (v17 != v16 || v17 < 0) {
          break;
        }
      }
      if (v10 == (id)++v12)
      {
        id v10 = [(NSDirectoryEnumerator *)v8 countByEnumeratingWithState:&v22 objects:buf count:16];
        if (!v10) {
          goto LABEL_23;
        }
        goto LABEL_9;
      }
    }
    uint64_t v18 = qword_10006EB60;
    if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_FAULT))
    {
      id v20 = [v13 relativePath];
      *(_DWORD *)long long v26 = 138412290;
      id v27 = v20;
      _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Counting any more file sizes in %@ will overflow", v26, 0xCu);
    }
    uint64_t v3 = -1;
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_23:
  return v3;
}

NSURL *sub_10001C384(NSURL *result)
{
  if (result)
  {
    uint64_t v1 = +[NSURL fileURLWithPath:@"com.apple.private.SensorKit" isDirectory:1 relativeToURL:result->_urlString];
    uint64_t v3 = 0;
    if (![+[NSFileManager defaultManager] createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v3])
    {
      uint64_t v2 = qword_10006EB60;
      if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v5 = v1;
        __int16 v6 = 2114;
        uint64_t v7 = v3;
        _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ because %{public}@", buf, 0x16u);
      }
    }
    return +[NSURL fileURLWithPath:@"IDSMessages" isDirectory:1 relativeToURL:v1];
  }
  return result;
}

NSURL *sub_10001C4A4(NSURL *a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v2 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", +[NSString pathWithComponents:a2], 1, sub_10001C384(a1));
    [+[NSFileManager defaultManager] createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v2;
}

NSURL *sub_10001C530(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = +[NSURL fileURLWithPath:@"com.apple.private.SensorKit" isDirectory:1 relativeToURL:*(void *)(a1 + 8)];
  uint64_t v5 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v5])
  {
    uint64_t v2 = qword_10006EB60;
    if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v7 = v1;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ because %{public}@", buf, 0x16u);
    }
  }
  uint64_t v3 = +[NSURL fileURLWithPath:@"gizmo-state" isDirectory:1 relativeToURL:v1];
  [+[NSFileManager defaultManager] createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
  return v3;
}

NSURL *sub_10001C690(NSURL *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [(NSString *)[+[NSBundle mainBundle] bundleIdentifier] stringByAppendingPathExtension:@"plist"];
    uint64_t v3 = +[NSURL fileURLWithPath:@"com.apple.private.SensorKit" isDirectory:1 relativeToURL:v1->_urlString];
    uint64_t v5 = 0;
    if (![+[NSFileManager defaultManager] createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v5])
    {
      uint64_t v4 = qword_10006EB60;
      if (os_log_type_enabled((os_log_t)qword_10006EB60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v7 = v3;
        __int16 v8 = 2114;
        uint64_t v9 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ because %{public}@", buf, 0x16u);
      }
    }
    return +[NSURL fileURLWithPath:v2 isDirectory:0 relativeToURL:v3];
  }
  return result;
}

NSURL *sub_10001C7D0(NSURL *result)
{
  if (result)
  {
    long long v4 = 0u;
    long long v5 = 0u;
    [(NSURL *)result auditToken];
    *(_OWORD *)long long buf = v4;
    long long v7 = v5;
    uint64_t result = [sub_10002EEA4((uint64_t)NSBundle, buf) bundleIdentifier];
    if (!result)
    {
      *(_OWORD *)long long buf = v4;
      long long v7 = v5;
      uint64_t result = sub_10001D868((uint64_t)NSURL, buf);
      if (result)
      {
        uint64_t v1 = result;
        CFDictionaryRef v2 = CFBundleCopyInfoDictionaryForURL((CFURLRef)result);
        if (v2) {
          return (NSURL *)[(__CFDictionary *)v2 objectForKeyedSubscript:@"CFBundleIdentifier"];
        }
        if (qword_10006EB70 == -1)
        {
          uint64_t v3 = qword_10006EB68;
          if (!os_log_type_enabled((os_log_t)qword_10006EB68, OS_LOG_TYPE_ERROR)) {
            return 0;
          }
        }
        else
        {
          dispatch_once(&qword_10006EB70, &stru_10005CFF0);
          uint64_t v3 = qword_10006EB68;
          if (!os_log_type_enabled((os_log_t)qword_10006EB68, OS_LOG_TYPE_ERROR)) {
            return 0;
          }
        }
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v1;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Could not get embedded info plist for executable %{public}@", buf, 0xCu);
        return 0;
      }
    }
  }
  return result;
}

void sub_10001C928(id a1)
{
  qword_10006EB68 = (uint64_t)os_log_create("com.apple.SensorKit", "NSXPCConnectionSK");
}

void sub_10001CEE4(id a1)
{
  qword_10006EB80 = (uint64_t)os_log_create("com.apple.SensorKit", "SRBundleRecord");
}

void *sub_10001CF14(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v10 = [RDCompanionSideSync alloc];

  return sub_10000399C(v10, a3, a1, a2, a4, a5);
}

NSMutableDictionary *sub_10001CF84(void *a1)
{
  CFDictionaryRef v2 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)[a1 count] + 1);
  [(NSMutableDictionary *)v2 addEntriesFromDictionary:a1];
  [(NSMutableDictionary *)v2 setObject:[+[NSUUID UUID] UUIDString] forKeyedSubscript:@"RDGizmoSyncMessageIdKey"];
  return v2;
}

id *sub_10001CFF0(id *result, void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = [a2 objectForKeyedSubscript:@"recordingStates"];
    id v5 = [v3[2] count];
    if (v5 == [v4 count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v3[2];
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v15;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          uint64_t result = (id *)[v4 objectForKeyedSubscript:v11];
          if (!result) {
            break;
          }
          uint64_t result = [(id *)[v3[2] objectForKeyedSubscript:v11] isEqualToNumber:result];
          if (!result) {
            break;
          }
          if (v8 == (id)++v10)
          {
            id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v8) {
              goto LABEL_5;
            }
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:
        id v12 = [a2 objectForKeyedSubscript:@"sensorConfigurations"];
        id v13 = [v3[5] count];
        if (v13 == [v12 count])
        {
          if (![v3[5] count]
            || (uint64_t result = (id *)[v3[5] isEqualToDictionary:v12], result))
          {
            uint64_t result = (id *)[a2 objectForKeyedSubscript:@"prerequisites"];
            if (result) {
              return (id *)([result unsignedIntegerValue] == v3[4]);
            }
          }
        }
        else
        {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

NSDictionary *sub_10001D250(NSDictionary *result)
{
  if (result)
  {
    uint64_t v1 = result;
    v5[0] = result[2].super.isa;
    v4[0] = @"recordingStates";
    v4[1] = @"prerequisites";
    v5[1] = +[NSNumber numberWithUnsignedInteger:result[4].super.isa];
    void v4[2] = @"capabilities";
    CFDictionaryRef v2 = +[NSNumber numberWithUnsignedInteger:v1[6].super.isa];
    v4[3] = @"sensorConfigurations";
    Class isa = v1[5].super.isa;
    if (!isa) {
      Class isa = (Class)&__NSDictionary0__struct;
    }
    _DWORD v5[2] = v2;
    v5[3] = isa;
    return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  }
  return result;
}

id sub_10001D32C(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  self;
  if (!a2) {
    return 0;
  }
  uint64_t v9 = (__CFString *)[a2 URLByResolvingSymlinksInPath];
  if ((objc_msgSend(-[__CFString path](v9, "path"), "isEqualToString:", objc_msgSend(objc_msgSend(a2, "path"), "stringByReplacingOccurrencesOfString:withString:", @"/private/var", @"/var")) & 1) == 0)
  {
    AnalyticsSendEventLazy();
    if (qword_10006EB88 == -1)
    {
      id v13 = qword_10006EB90;
      if (!os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EB88, &stru_10005D128);
      id v13 = qword_10006EB90;
      if (!os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    *(_DWORD *)long long buf = 138412546;
    id v21 = a2;
    __int16 v22 = 2112;
    CFStringRef v23 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Refusing to open %@ because it contains a symlink. Resolved URL %@", buf, 0x16u);
    return 0;
  }
  if (!a4 && !sub_100005E58(+[NSFileManager defaultManager], a2))
  {
    if (qword_10006EB88 == -1)
    {
      long long v14 = qword_10006EB90;
      if (!os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_INFO)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EB88, &stru_10005D128);
      long long v14 = qword_10006EB90;
      if (!os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_INFO)) {
        return 0;
      }
    }
    *(_DWORD *)long long buf = 138543362;
    id v21 = a2;
    long long v15 = "%{public}@ has zero size. Not returning an empty file to read.";
    goto LABEL_27;
  }
  uint64_t v10 = open_dprotected_np((const char *)[a2 fileSystemRepresentation], a4, a3, 0, 416);
  if ((v10 & 0x80000000) != 0)
  {
    if (*__error() == 2)
    {
      if (qword_10006EB88 != -1)
      {
        dispatch_once(&qword_10006EB88, &stru_10005D128);
        long long v14 = qword_10006EB90;
        if (!os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        goto LABEL_15;
      }
      long long v14 = qword_10006EB90;
      if (os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_INFO))
      {
LABEL_15:
        *(_DWORD *)long long buf = 138543362;
        id v21 = a2;
        long long v15 = "Skipping %{public}@ as it doesn't exist.";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
      }
      return 0;
    }
    AnalyticsSendEventLazy();
    int v16 = *__error();
    if (qword_10006EB88 == -1)
    {
      long long v17 = qword_10006EB90;
      if (!os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
    }
    else
    {
      dispatch_once(&qword_10006EB88, &stru_10005D128);
      long long v17 = qword_10006EB90;
      if (!os_log_type_enabled((os_log_t)qword_10006EB90, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
    }
    if (v16 == 1) {
      CFStringRef v18 = @" likely because the device is locked";
    }
    else {
      CFStringRef v18 = &stru_10005E2D0;
    }
    int v19 = *__error();
    *(_DWORD *)long long buf = 138543874;
    id v21 = a2;
    __int16 v22 = 2114;
    CFStringRef v23 = v18;
    __int16 v24 = 1026;
    int v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to open file %{public}@%{public}@. %{public,darwin.errno}d", buf, 0x1Cu);
LABEL_22:
    if (a5) {
      *a5 = +[SRError errorWithCode:2];
    }
    return 0;
  }
  id v11 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v10 closeOnDealloc:1];

  return v11;
}

NSDictionary *__cdecl sub_10001D748(id a1)
{
  CFStringRef v2 = @"RDAnalyticsErrorKey";
  uint64_t v3 = &off_100060FD8;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

NSDictionary *__cdecl sub_10001D7C0(id a1)
{
  CFStringRef v2 = @"RDAnalyticsErrorKey";
  uint64_t v3 = &off_100060FF0;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

void sub_10001D838(id a1)
{
  qword_10006EB90 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogNSFileHandle+RDDatastore");
}

NSURL *sub_10001D868(uint64_t a1, _OWORD *a2)
{
  self;
  bzero(buffer, 0x400uLL);
  long long v3 = a2[1];
  *(_OWORD *)v10.val = *a2;
  *(_OWORD *)&v10.val[4] = v3;
  if (proc_pidpath_audittoken(&v10, buffer, 0x400u) <= 0)
  {
    if (qword_10006EBA0 == -1)
    {
      uint64_t v9 = qword_10006EB98;
      if (!os_log_type_enabled((os_log_t)qword_10006EB98, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EBA0, &stru_10005D148);
      uint64_t v9 = qword_10006EB98;
      if (!os_log_type_enabled((os_log_t)qword_10006EB98, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    *(_DWORD *)long long buf = 68157954;
    LODWORD(v12[0]) = 32;
    WORD2(v12[0]) = 2096;
    *(void *)((char *)v12 + 6) = a2;
    id v6 = "Cannot determine path for audit token %.*P";
    id v7 = v9;
    uint32_t v8 = 18;
    goto LABEL_12;
  }
  uint64_t result = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithUTF8String:buffer]);
  if (result) {
    return result;
  }
  if (qword_10006EBA0 != -1)
  {
    dispatch_once(&qword_10006EBA0, &stru_10005D148);
    uint64_t v5 = qword_10006EB98;
    if (!os_log_type_enabled((os_log_t)qword_10006EB98, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    goto LABEL_5;
  }
  uint64_t v5 = qword_10006EB98;
  if (os_log_type_enabled((os_log_t)qword_10006EB98, OS_LOG_TYPE_ERROR))
  {
LABEL_5:
    *(_DWORD *)long long buf = 136446210;
    v12[0] = buffer;
    id v6 = "Could not create URL for path %{public}s";
    id v7 = v5;
    uint32_t v8 = 12;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
  }
  return 0;
}

NSURL *sub_10001DA4C()
{
  self;

  return +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/ALMANAC"];
}

void sub_10001DA84(id a1)
{
  qword_10006EB98 = (uint64_t)os_log_create("com.apple.SensorKit", "NSURLSK");
}

void *sub_10001DAB4(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDReader;
  long long v3 = [super init];
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

NSArray *sub_10001DB80(uint64_t a1, id *a2, double a3, double a4)
{
  if (!a1) {
    return 0;
  }
  id v7 = sub_10000BD98([RDReadableDatastore alloc], *(id *)(a1 + 8));
  uint64_t v39 = 0;
  id v40 = (double *)&v39;
  uint64_t v41 = 0x2020000000;
  double v42 = a3;
  id v8 = +[NSMutableArray array];
  id v38 = 0;
  while (v40[3] < a4)
  {
    double v10 = v40[3];
    if (v10 == a3)
    {
      id v11 = sub_10000C19C((uint64_t)v7, &v38, v10);
    }
    else
    {
      id v12 = [(NSURL *)sub_10001BFB4(v10) lastPathComponent];
      id v11 = sub_10000C6CC((uint64_t)v7, v12, &v38);
    }
    id v13 = v11;
    if (v38)
    {
      id v14 = v38;
    }
    else
    {
      id v16 = [(NSDictionary *)v11 objectForKeyedSubscript:@"samples"];
      if (v16)
      {
        CFStringRef v18 = [SRDefaults alloc];
        int v19 = *(void **)(a1 + 8);
        if (v19)
        {
          id Property = (NSDictionary *)objc_getProperty(v19, v17, 16, 1);
          __int16 v22 = *(void **)(a1 + 8);
          if (v22) {
            id v23 = objc_getProperty(v22, v20, 24, 1);
          }
          else {
            id v23 = 0;
          }
        }
        else
        {
          id Property = 0;
          id v23 = 0;
        }
        __int16 v24 = sub_10002B204(Property, v23);
        int v25 = sub_100042C68(v18, v24);
        long long v26 = [SRDatastore alloc];
        id v27 = [(NSDictionary *)v13 objectForKeyedSubscript:@"metadata"];
        id v28 = [(NSDictionary *)v13 objectForKeyedSubscript:@"sensorConfiguration"];
        if (v26) {
          long long v29 = sub_1000405A0(v26, v16, v27, v28, 0, (uint64_t)v25);
        }
        else {
          long long v29 = 0;
        }
        id v30 = [v8 count];
        double v31 = v40[3];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10001DF44;
        v37[3] = &unk_10005D170;
        v37[5] = v8;
        v37[6] = &v39;
        v37[4] = a1;
        sub_100040B40(v29, (uint64_t)v37, v31, a4);
        if (v30 == [v8 count]) {
          v40[3] = a4;
        }

        char v15 = 1;
        goto LABEL_19;
      }
    }
    char v15 = 0;
LABEL_19:
    if ((v15 & 1) == 0) {
      break;
    }
  }

  id v32 = v38;
  if (a2) {
    *a2 = v38;
  }
  id v33 = v32;
  uint64_t v34 = +[NSArray arrayWithArray:v8];
  _Block_object_dispose(&v39, 8);
  return v34;
}

void sub_10001DE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10001DF44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a5;
  uint64_t v11 = sub_10001A21C();
  id v12 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v12)
  {
    id Property = objc_getProperty(v12, v10, 24, 1);
    id v14 = [(SRSensorDescription *)sub_10001A0F8(v11, Property) sampleClass];
    Class result = NSClassFromString(v14);
    if (!result) {
      return result;
    }
  }
  else
  {
    CFStringRef v18 = [(SRSensorDescription *)sub_10001A0F8(v11, 0) sampleClass];
    Class result = NSClassFromString(v18);
    if (!result) {
      return result;
    }
  }
  id v16 = result;
  Class result = (Class)[(objc_class *)result conformsToProtocol:&OBJC_PROTOCOL___SRSampling];
  if (result)
  {
    id v17 = [v16 initWithBinarySampleRepresentation:+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0) metadata:a4 timestamp:a5];
    if (v17) {
      [*(id *)(a1 + 40) addObject:v17];
    }

    return (Class)1;
  }
  return result;
}

double sub_10001E058(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0.0;
  }
  objc_super v5 = [SRDefaults alloc];
  id v6 = *(void **)(a1 + 8);
  if (v6)
  {
    id Property = (NSDictionary *)objc_getProperty(v6, v4, 16, 1);
    uint64_t v9 = *(void **)(a1 + 8);
    if (v9) {
      id v10 = objc_getProperty(v9, v7, 24, 1);
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id Property = 0;
    id v10 = 0;
  }
  uint64_t v11 = sub_10002B204(Property, v10);
  id v12 = sub_100042C68(v5, v11);
  id v13 = [SRDatastore alloc];
  id v14 = [a2 objectForKeyedSubscript:@"samples"];
  id v15 = [a2 objectForKeyedSubscript:@"metadata"];
  id v16 = [a2 objectForKeyedSubscript:@"sensorConfiguration"];
  double v17 = 0.0;
  if (v13)
  {
    CFStringRef v18 = sub_1000405A0(v13, v14, v15, v16, 0, (uint64_t)v12);
    id v20 = v18;
    if (v18)
    {
      id v21 = (double *)objc_getProperty(v18, v19, 40, 1);
      if (v21) {
        double v17 = v21[6];
      }
    }
  }
  else
  {
    id v20 = 0;
  }

  return v17;
}

void start()
{
  _set_user_dir_suffix();
  inactive = dispatch_workloop_create_inactive("com.apple.sensorkitd.main");
  dispatch_set_qos_class_fallback();
  dispatch_activate(inactive);
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3052000000;
  v3[3] = sub_10001E2AC;
  v3[4] = sub_10001E2BC;
  v3[5] = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001E2C8;
  v2[3] = &unk_10005D198;
  v2[4] = inactive;
  v2[5] = v3;
  dispatch_async_and_wait(inactive, v2);
  dispatch_main();
}

void sub_10001E294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E2AC(uint64_t a1, uint64_t a2)
{
}

void sub_10001E2BC(uint64_t a1)
{
}

uint64_t sub_10001E2C8(uint64_t a1)
{
  uint64_t result = sub_10002F190((uint64_t)[RDDaemon alloc], *(dispatch_queue_t *)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void sub_10001EA94(id a1)
{
  byte_10006EBB0 = dyld_program_sdk_at_least() ^ 1;
}

void sub_10001EB1C(uint64_t a1, int a2, void *a3)
{
  self;
  objc_super v5 = qword_10006EBC0;
  if (os_log_type_enabled((os_log_t)qword_10006EBC0, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67240450;
    v6[1] = a2;
    __int16 v7 = 2114;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Telling writers recording status is %{public}d for sensor %{public}@", (uint8_t *)v6, 0x12u);
  }
  sub_10001EBE8((uint64_t)RDNotifier, a3);
}

void sub_10001EBE8(uint64_t a1, void *a2)
{
  self;
  long long v3 = qword_10006EBC0;
  if (os_log_type_enabled((os_log_t)qword_10006EBC0, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Posting notification for %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint32_t v4 = notify_post((const char *)[a2 UTF8String]);
  if (v4)
  {
    uint32_t v5 = v4;
    AnalyticsSendEventLazy();
    id v6 = qword_10006EBC0;
    if (os_log_type_enabled((os_log_t)qword_10006EBC0, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543618;
      id v8 = a2;
      __int16 v9 = 1026;
      uint32_t v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to post notification for %{public}@. status %{public}d", (uint8_t *)&v7, 0x12u);
    }
  }
}

NSDictionary *__cdecl sub_10001ED28(id a1)
{
  CFStringRef v2 = @"RDAnalyticsErrorKey";
  long long v3 = &off_100061008;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

void sub_10001EDA0()
{
  self;

  sub_10001EBE8((uint64_t)RDNotifier, @"com.apple.SensorKit.significantTimeChange");
}

id sub_10001EDDC(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)RDNotifier;
  id v11 = [super init];
  if (v11)
  {
    *((void *)v11 + 2) = a2;
    *((void *)v11 + 3) = a3;
    *((void *)v11 + 4) = a4;
    *((void *)v11 + 1) = a6;
    *((void *)v11 + 5) = a5;
    dispatch_retain(*((dispatch_object_t *)v11 + 1));
  }
  return v11;
}

void *sub_10001EF14(void *result, double a2)
{
  if (!result) {
    return result;
  }
  long long v3 = result;
  uint64_t v4 = result[3];
  if (v4)
  {
    double v5 = *(double *)(v4 + 8);
    uint64_t v6 = result[2];
    if (v5 == 0.0)
    {
      double v7 = sub_10002BAC8(v6);
      double v8 = a2 - v5;
      if (a2 - v5 >= v7) {
        goto LABEL_7;
      }
    }
    else
    {
      double v7 = sub_10002BAAC(v6);
      double v8 = a2 - v5;
      if (a2 - v5 >= v7) {
        goto LABEL_7;
      }
    }
    return 0;
  }
  double v7 = sub_10002BAC8(result[2]);
  double v8 = a2 - 0.0;
  if (a2 - 0.0 < v7) {
    return 0;
  }
LABEL_7:
  id v9 = +[NSMutableOrderedSet orderedSet];
  long long v56 = v3;
  id v10 = [(id)v3[5] readerLastModifiedAuthorizationTimes];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v57 = *(void *)v71;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v71 != v57) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v15 = [v10 objectForKeyedSubscript:v14];
        id v16 = [v15 countByEnumeratingWithState:&v66 objects:v79 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v67;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v67 != v18) {
                objc_enumerationMutation(v15);
              }
              [v9 addObject:[v10 objectForKeyedSubscript:v14] objectForKeyedSubscript:[v10 objectForKeyedSubscript:v14]];
            }
            id v17 = [v15 countByEnumeratingWithState:&v66 objects:v79 count:16];
          }
          while (v17);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v12);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v20 = (void *)sub_10001A21C();
  id v21 = sub_10001A5B4(v20);
  id v22 = [v21 countByEnumeratingWithState:&v62 objects:v78 count:16];
  id v23 = v56;
  if (v22)
  {
    id v24 = v22;
    uint64_t v25 = *(void *)v63;
    do
    {
      for (k = 0; k != v24; k = (char *)k + 1)
      {
        if (*(void *)v63 != v25) {
          objc_enumerationMutation(v21);
        }
        id v31 = [*(id *)(*((void *)&v62 + 1) + 8 * (void)k) name];
        if ([(id)v23[5] sensorHasReaderAuthorization:v31])
        {
          uint64_t v32 = v23[3];
          if (v32)
          {
            id v33 = [*(id *)(v32 + 48) objectForKeyedSubscript:v31];
            if (!v33) {
              continue;
            }
          }
          else
          {
            id v33 = [0 objectForKeyedSubscript:v31];
            if (!v33) {
              continue;
            }
          }
          [v33 doubleValue];
          double v35 = v34;
          uint64_t v75 = 0;
          unint64_t v76 = 0;
          uint64_t v74 = 0;
          mach_get_times();
          unint64_t v36 = v76;
          if (qword_10006EC88 != -1) {
            dispatch_once(&qword_10006EC88, &stru_10005CDC0);
          }
          unint64_t v27 = qword_10006EC90;
          double v28 = *(double *)&qword_10006EC98;
          double v29 = *(double *)&qword_10006ECA0;
          TMConvertTicksToSeconds();
          if (v27 < v36) {
            double v30 = -v30;
          }
          [v9 addObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v35 - (v28 + v29) + v30 + (double)v74 - kCFAbsoluteTimeIntervalSince1970 + (double)v75 * 0.000000001)]];
          id v23 = v56;
        }
      }
      id v24 = [v21 countByEnumeratingWithState:&v62 objects:v78 count:16];
    }
    while (v24);
  }
  uint64_t result = [v9 count];
  if (result)
  {
    [v9 sortUsingComparator:&stru_10005D1F8];
    [objc_msgSend(v9, "firstObject") doubleValue];
    double v38 = v37;
    uint64_t v75 = 0;
    unint64_t v76 = 0;
    uint64_t v74 = 0;
    mach_get_times();
    uint64_t v39 = v74;
    uint64_t v40 = v75;
    unint64_t v41 = v76;
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v42 = qword_10006EC90;
    double v43 = *(double *)&qword_10006EC98;
    double v44 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v42 < v41) {
      double v45 = -v45;
    }
    if ((double)v39 + a2 + (double)v40 * 0.000000001 - (v38 + kCFAbsoluteTimeIntervalSince1970 + v43 + v44) + v45 < v7) {
      return 0;
    }
    id v46 = +[NSMutableSet set];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v47 = (void *)sub_10001A21C();
    long long v48 = sub_10001A5B4(v47);
    id v49 = [v48 countByEnumeratingWithState:&v58 objects:v77 count:16];
    long long v50 = v56;
    if (v49)
    {
      id v51 = v49;
      uint64_t v52 = *(void *)v59;
      do
      {
        for (m = 0; m != v51; m = (char *)m + 1)
        {
          while (1)
          {
            if (*(void *)v59 != v52) {
              objc_enumerationMutation(v48);
            }
            uint64_t v54 = v50[4];
            id v55 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)m) name];
            if (!v54) {
              break;
            }
            [v46 unionSet:[*(id *)(v54 + 16) rd_objectsForSensor:v55 fallbackURL:sub_10001BCE4(*(NSURL **)(v54 + 8), v55)]];
            m = (char *)m + 1;
            long long v50 = v56;
            if (v51 == m) {
              goto LABEL_48;
            }
          }
          [v46 unionSet:0];
          long long v50 = v56;
        }
LABEL_48:
        id v51 = [v48 countByEnumeratingWithState:&v58 objects:v77 count:16];
      }
      while (v51);
    }
    return [v46 count];
  }
  return result;
}

int64_t sub_10001F528(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

void sub_10001F530(void *a1)
{
  if (a1)
  {
    uint64_t v2 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v3 = qword_10006EC90;
    double v4 = *(double *)&qword_10006EC98;
    double v5 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v3 >= v2) {
      double v6 = -v6;
    }
    double v7 = sub_10001EF14(a1, v5 + v4 + v6);
    if (v7) {
      double v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [+[NSBundle bundleWithPath:@"/System/Library/Frameworks/SensorKit.framework"] localizedStringForKey:@"REMINDER_ALERT_STUDIES" value:&stru_10005E2D0 table:0], v7);
    }
    else {
      double v8 = 0;
    }
    sub_10001FA38((uint64_t)a1, 0, (uint64_t)v8);
    uint64_t v9 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v10 = qword_10006EC90;
    double v11 = *(double *)&qword_10006EC98;
    double v12 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    uint64_t v14 = a1[3];
    if (v14)
    {
      if (v10 >= v9) {
        double v13 = -v13;
      }
      *(double *)(v14 + 8) = v12 + v11 + v13;
      sub_1000283D8(v14);
    }
  }
}

void sub_10001F6EC(uint64_t a1, double a2)
{
  if (!a1) {
    return;
  }
  if (sub_10002A018(*(void *)(a1 + 16))
    && [*(id *)(a1 + 40) sensorHasReaderAuthorization:@"com.apple.SensorKit.faceMetrics"])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      if (objc_msgSend(objc_msgSend(*(id *)(v4 + 16), "rd_objectsForSensor:fallbackURL:", @"com.apple.SensorKit.faceMetrics", sub_10001BCE4(*(NSURL **)(v4 + 8), @"com.apple.SensorKit.faceMetrics")), "count"))
      {
LABEL_6:
        uint64_t v5 = *(void *)(a1 + 24);
        if (v5)
        {
          double v6 = *(double *)(v5 + 80);
          if (v6 != 0.0)
          {
            *(_OWORD *)long long buf = 0uLL;
            mach_get_times();
            if (qword_10006EC88 != -1) {
              dispatch_once(&qword_10006EC88, &stru_10005CDC0);
            }
            double v7 = *(double *)&qword_10006EC98;
            double v8 = *(double *)&qword_10006ECA0;
            TMConvertTicksToSeconds();
            if (a2
               - (v7
                + v8)
               + v9
               + (double)*(uint64_t *)buf
               - kCFAbsoluteTimeIntervalSince1970
               + (double)*(uint64_t *)&buf[8] * 0.000000001 > v6)
            {
              sub_10001FA38(a1, (uint64_t)[+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", @"/System/Library/Frameworks/SensorKit.framework") localizedStringForKey:@"faceMetricsReminderSubtitle" value:&stru_10005E2D0 table:0], (uint64_t)[+[NSBundle bundleWithPath:@"/System/Library/Frameworks/SensorKit.framework"] localizedStringForKey:@"faceMetricsReminderMessage" value:&stru_10005E2D0 table:0]);
              uint64_t v10 = mach_continuous_time();
              if (qword_10006EC88 != -1) {
                dispatch_once(&qword_10006EC88, &stru_10005CDC0);
              }
              unint64_t v11 = qword_10006EC90;
              double v12 = *(double *)&qword_10006EC98;
              double v13 = *(double *)&qword_10006ECA0;
              TMConvertTicksToSeconds();
              uint64_t v15 = *(void *)(a1 + 24);
              if (v15)
              {
                if (v11 >= v10) {
                  double v14 = -v14;
                }
                *(double *)(v15 + 8) = v13 + v12 + v14;
                sub_1000283D8(v15);
              }
            }
          }
        }
      }
    }
    else if ([0 count])
    {
      goto LABEL_6;
    }
  }
  [[+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian) nextDateAfterDate:+[NSDate now] matchingComponents:sub_10002BF78(*(id **)(a1 + 16)) options:1024] timeIntervalSinceReferenceDate];
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)(a1 + 24);
  if (v19)
  {
    *(void *)(v19 + 80) = v17;
    sub_1000283D8(v19);
  }
  id v20 = qword_10006EBC0;
  if (os_log_type_enabled((os_log_t)qword_10006EBC0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134349056;
    *(void *)&uint8_t buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Scheduling next face metrics reminder for %{public}f (CFAbsoluteTime)", buf, 0xCu);
  }
}

id sub_10001FA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6 = [+[NSBundle bundleWithPath:@"/System/Library/Frameworks/SensorKit.framework"] localizedStringForKey:@"reminderAlertTitle" value:&stru_10005E2D0 table:0];
  id v7 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v7 setTitle:v6];
  if (a2) {
    [v7 setSubtitle:a2];
  }
  [v7 setBody:a3];
  [v7 setDefaultActionURL:sub_10001DA4C()];
  [v7 setIcon:[UNNotificationIcon iconNamed:@"SensorKit"]];
  double v8 = +[UNNotificationRequest requestWithIdentifier:@"Reminder" content:v7 trigger:0 destinations:5];

  double v9 = qword_10006EBC0;
  if (os_log_type_enabled((os_log_t)qword_10006EBC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    double v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Posting reminder user notification %{public}@", buf, 0xCu);
  }
  id v10 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.SensorKit.reminder" queue:*(void *)(a1 + 8)];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_10001FC24;
  v12[3] = &unk_10005D220;
  v12[4] = v10;
  return [v10 addNotificationRequest:v8 withCompletionHandler:v12];
}

void sub_10001FC24(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = qword_10006EBC0;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)qword_10006EBC0, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      uint64_t v6 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to post notification because %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10006EBC0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Added reminder user notification to notification center", (uint8_t *)&v5, 2u);
  }
}

void **sub_10001FE50(void **result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (!result[3])
    {
      uint64_t v2 = sub_100039F34(result[8], result[10]);
      unint64_t v3 = (id *)v1[9];
      if (v3)
      {
        uint64_t v4 = v2;
        id v5 = sub_100024F68((uint64_t)v1[9]);
        uint64_t v6 = (const char *)sub_100024DD4(v3, (uint64_t)v5, [v3[3] devices]);
        if (v6)
        {
          id v7 = v6;
          double v8 = sub_100014C40([RDGizmoStateDatastore alloc], v4);
          id v9 = [[sub_1000152E0((uint64_t)v8, v7) objectForKeyedSubscript:@"capabilities"];
          v1[3] = v9;
          id v10 = qword_10006EBC8;
          if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 134217984;
            id v12 = [v9 unsignedIntegerValue];
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remote device has capabilities: %lu", (uint8_t *)&v11, 0xCu);
          }
        }
      }
    }
    return (void **)[v1[3] unsignedIntegerValue];
  }
  return result;
}

uint64_t sub_100021308(uint64_t a1, const char *a2, void *a3)
{
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RDGizmoSyncMessageTypeKey"), "integerValue") == (id)2) {
    sub_1000149FC(*(void *)(a1 + 32), a2);
  }
  return 1;
}

void sub_10002135C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if ([*(id *)(a1 + 96) containsObject:a2])
    {
      [*(id *)(a1 + 96) removeObject:a2];
      if (![*(id *)(a1 + 96) count])
      {
        uint64_t v4 = *(void *)(a1 + 72);
        v7[0] = @"RDGizmoSyncMessageTypeKey";
        v7[1] = @"RDGizmoSyncArchiveTransferStatusKey";
        v8[0] = &off_100061068;
        v8[1] = +[NSNumber numberWithInteger:4];
        id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
        if (v4) {
          sub_1000250CC(v4, v5, *(void **)(v4 + 24), 0);
        }
        uint64_t v6 = *(void *)(a1 + 88);
        if (v6)
        {
          *(void *)(v6 + 56) = 0;
          sub_1000283D8(v6);
        }
      }
    }
  }
}

NSDictionary *sub_10002193C(NSDictionary *result, char *a2, void *a3, void *a4)
{
  if (result)
  {
    uint64_t v6 = result;
    id v7 = sub_100039FA8(a3, a4, result[8].super.isa, result[10].super.isa);
    double v8 = (NSDictionary *)sub_100012F98([RDEncryptingDatastore alloc], v7);
    CFStringRef v9 = sub_100024B50((uint64_t)v6[9].super.isa, a2, a3);
    id v10 = sub_100013590(v8, (uint64_t)v9);

    if ([(NSDictionary *)v10 count])
    {
      v13[0] = [(NSDictionary *)v10 objectForKeyedSubscript:@"key", @"RDGizmoSyncKeyKey"];
      v12[1] = @"RDGizmoSyncIVKey";
      v13[1] = [(NSDictionary *)v10 objectForKeyedSubscript:@"iv"];
      void v13[2] = a2;
      void v12[2] = @"RDGizmoSyncSnapshotKey";
      v12[3] = @"RDGizmoSyncSensorIdentifierKey";
      v12[4] = @"RDGizmoSyncMessageTypeKey";
      v13[3] = a3;
      v13[4] = &off_100061020;
      return +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
    }
    else
    {
      int v11 = qword_10006EBC8;
      if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        CFStringRef v15 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get key from keychain with name %{public}@", buf, 0xCu);
      }
      return (NSDictionary *)&__NSDictionary0__struct;
    }
  }
  return result;
}

void sub_100022488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000224A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000224B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000224D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000224E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100022504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10002251C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100022534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10002254C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100022564(uint64_t a1, uint64_t a2)
{
}

void sub_100022574(uint64_t a1)
{
}

void sub_100022580(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v4)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [objc_alloc((Class)NSMutableArray) initWithCapacity:*(void *)(a1 + 56)];
      uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v4 addObject:a2];
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] >= *(void *)(a1 + 56))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      if (v5)
      {
        uint64_t v7 = *(void *)(*(void *)(v6 + 8) + 40);
        uint64_t v8 = *(void *)(a1 + 40);
        v14[0] = @"RDGizmoSyncMessageTypeKey";
        v14[1] = @"RDGizmoSyncKeysKey";
        v15[0] = &off_100061038;
        v15[1] = v7;
        void v14[2] = @"RDGizmoSyncSensorIdentifierKey";
        v15[2] = v8;
        CFStringRef v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
        uint64_t v10 = *(void *)(v5 + 72);
        if (v10) {
          sub_1000250CC(v10, v9, *(void **)(v10 + 32), 0);
        }
        uint64_t v6 = *(void *)(a1 + 48);
      }

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v12 = *(void *)(v11 + 72);
      if (v12)
      {
        double v13 = *(void **)(v12 + 32);
        sub_1000250CC(v12, a2, v13, 0);
      }
    }
  }
}

BOOL sub_100022728(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v8 = sub_100039FA8(a3, a4, *(void **)(a1 + 64), *(void **)(a1 + 80));
  CFStringRef v9 = sub_100012F98([RDEncryptingDatastore alloc], v8);
  uint64_t v10 = sub_100013BC4((uint64_t)v9, a2);

  if (v10)
  {
    uint64_t v11 = (NSURL *)sub_10000F800([RDArchiveableDatastore alloc], (void **)&v8->super.isa);
    uint64_t v12 = sub_100011D00(v11, v10);

    double v13 = qword_10006EBC8;
    if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138543362;
      id v20 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Created encrypted archive %{public}@", (uint8_t *)&v19, 0xCu);
    }
    double v14 = sub_10002193C((NSDictionary *)a1, (char *)[(NSURL *)v12 lastPathComponent], a3, a4);
    if ([(NSDictionary *)v14 count])
    {
      uint64_t v15 = *(void *)(a1 + 72);
      if (v15) {
        sub_1000250CC(v15, v14, *(void **)(v15 + 32), 0);
      }
    }
    else
    {
      uint64_t v17 = qword_10006EBC8;
      if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543362;
        id v20 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to get the key for an archive we just encrypted: %{public}@. This is possible (but rare) if the keychain locked just after we encrypted", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    [objc_msgSend((id)a1, "analyticsDelegate") gizmoSync:failedToEncryptArchive:keyName:sensor:a1 a2 sub_100024B50(*(void *)(a1 + 72), (char *)objc_msgSend(a2, "path"), a3) a3];
    id v16 = qword_10006EBC8;
    if (os_log_type_enabled((os_log_t)qword_10006EBC8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to encrypt the archive %{public}@. Will retry on the next unlock", (uint8_t *)&v19, 0xCu);
    }
  }
  return v10 != 0;
}

void sub_100022E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022EC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [[a3 objectForKeyedSubscript:@"RDGizmoSyncMessageTypeKey"] integerValue];
  id v7 = [a3 objectForKeyedSubscript:@"RDGizmoSyncSamplesURLKey"];
  if (v6 == (id)9 && objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "path"), "isEqualToString:", v7))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    [objc_msgSend(a3, "objectForKeyedSubscript:", @"RDGizmoSyncGizmoAbsoluteTimeKey") doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  }
  return 1;
}

void sub_100022F78(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v3 = qword_10006EC90;
    double v4 = *(double *)&qword_10006EC98;
    double v5 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    uint64_t v7 = *(void *)(a1 + 88);
    if (v7) {
      double v8 = *(double *)(v7 + 56);
    }
    else {
      double v8 = 0.0;
    }
    if (v3 < v2) {
      double v6 = -v6;
    }
    if (v6 - (v4 + v5) + v8 < 60.0)
    {
      uint64_t v9 = mach_continuous_time();
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v10 = qword_10006EC90;
      double v11 = *(double *)&qword_10006EC98;
      double v12 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      double v14 = v13;
      uint64_t v15 = sub_10002BC54(*(id **)(a1 + 80));
      uint64_t v16 = *(void *)(a1 + 88);
      if (v16)
      {
        double v17 = -v14;
        if (v10 < v9) {
          double v17 = v14;
        }
        *(double *)(v16 + 56) = v12 + v11 + v17 + (double)(uint64_t)v15;
        sub_1000283D8(v16);
      }
      uint64_t v18 = *(void *)(a1 + 72);
      v20[0] = @"RDGizmoSyncMessageTypeKey";
      v20[1] = @"RDGizmoSyncArchiveTransferStatusKey";
      v21[0] = &off_100061068;
      v21[1] = +[NSNumber numberWithInteger:3];
      int v19 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      if (v18) {
        sub_1000250CC(v18, v19, *(void **)(v18 + 24), 0);
      }
    }
  }
}

RDXPCActivity *sub_1000236BC(uint64_t a1, uint64_t a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  int64_t v4 = sub_10002AD4C(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, v4);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  self;
  double v5 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.updateCompanionWithSamples" criteria:v3];
  xpc_release(v3);
  return v5;
}

RDXPCActivity *sub_1000237C0(uint64_t a1, id *a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  int64_t v4 = (const char *)XPC_ACTIVITY_CPU_INTENSIVE;
  unsigned __int8 v5 = sub_10002AFA4(a2);
  xpc_dictionary_set_BOOL(v3, v4, v5);
  double v6 = (const char *)XPC_ACTIVITY_DISK_INTENSIVE;
  unsigned __int8 v7 = sub_10002AF8C(a2);
  xpc_dictionary_set_BOOL(v3, v6, v7);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  int64_t v8 = sub_10002AE6C((uint64_t)a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, v8);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  self;
  uint64_t v9 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.prepareArchives" criteria:v3];
  xpc_release(v3);
  return v9;
}

RDXPCActivity *sub_100023924()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v0, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.removeOldData" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023A00()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v0, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.gcKeys" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023B0C()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v0, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.postMetric" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023BE8()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_15_MIN);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REPEATING, 1);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.launchAlsRecorder" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023CD8()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.launchUsageCollector" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023D98()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.launchInteractionHistoryCollector" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023E40()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.fetchStrideCalibration" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023F00()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.fetchVisits" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100023FD8()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.launchMediaEventsRecorder" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100024080()
{
  self;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v0, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v0, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_8_HOURS);
  xpc_dictionary_set_BOOL(v0, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  self;
  uint64_t v1 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.decryptArchives" criteria:v0];
  xpc_release(v0);
  return v1;
}

RDXPCActivity *sub_100024158(uint64_t a1, uint64_t a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  int64_t v4 = sub_10002AFBC(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, v4);
  uint64_t v5 = sub_10002AFBC(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, 2 * v5);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  self;
  double v6 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.syncCompanionStateToGizmo" criteria:v3];
  xpc_release(v3);
  return v6;
}

RDXPCActivity *sub_1000242B0(uint64_t a1, uint64_t a2)
{
  self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  uint64_t v4 = sub_10002AFBC(a2);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 2 * v4);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.sensorkitd.startup.group");
  xpc_dictionary_set_uint64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  self;
  uint64_t v5 = [[RDXPCActivity alloc] initWithName:@"com.apple.sensorkit.syncCompanionStateToGizmoLocked" criteria:v3];
  xpc_release(v3);
  return v5;
}

void sub_1000245F4(uint64_t a1, xpc_activity_state_t a2)
{
  if (a1 && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 24), a2))
  {
    uint64_t v4 = qword_10006EBD0;
    if (os_log_type_enabled((os_log_t)qword_10006EBD0, OS_LOG_TYPE_ERROR))
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

void sub_100024818(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = qword_10006EBD0;
    if (os_log_type_enabled((os_log_t)qword_10006EBD0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 8);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unregistering for XPC Activity %{public}@", (uint8_t *)&v4, 0xCu);
    }
    xpc_activity_unregister((const char *)[*(id *)(a1 + 8) UTF8String]);
  }
}

void *sub_1000249A0(void *a1, void *a2, void *a3, NSObject *a4, uint64_t a5)
{
  uint64_t v5 = a1;
  if (a1)
  {
    id v10 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.sensorkit"];
    id v11 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.sensorkitkeys"];
    v16.receiver = v5;
    v16.super_class = (Class)RDGizmoSyncService;
    double v12 = [super init];
    uint64_t v5 = v12;
    if (v12)
    {
      v12[1] = a4;
      void v12[2] = a5;
      dispatch_retain(a4);
      v5[5] = a3;
      v5[6] = a2;
      v5[7] = +[NSHashTable weakObjectsHashTable];
      id v13 = v10;
      v5[3] = v13;
      [v13 addDelegate:v5 queue:a4];
      id v14 = v11;
      void v5[4] = v14;
      [v14 addDelegate:v5 queue:a4];
    }
  }
  return v5;
}

CFStringRef sub_100024B50(uint64_t a1, char *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  int v4 = sub_100039FA8(a3, 0, *(void **)(a1 + 48), *(void **)(a1 + 40));
  uint64_t v5 = (NSString *)sub_100012F98([RDEncryptingDatastore alloc], v4);
  int v6 = sub_1000132D8(v5, a2);
  if (v6) {
    CFStringRef v7 = (const __CFString *)v6;
  }
  else {
    CFStringRef v7 = &stru_10005E2D0;
  }

  return v7;
}

id *sub_100024BD8(id *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = qword_10006EBD8;
    if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67240192;
      v5[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting prefer infra wifi to %{public, BOOL}d", (uint8_t *)v5, 8u);
    }
    return (id *)[v3[3] setPreferInfraWiFi:a2];
  }
  return result;
}

void *sub_100024C94(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = [*(id *)(a1 + 24) devices];
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = *(void *)v9;
LABEL_5:
  uint64_t v5 = 0;
  while (1)
  {
    if (*(void *)v9 != v4) {
      objc_enumerationMutation(v1);
    }
    int v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
    if ([v6 isLocallyPaired])
    {
      if ([v6 isActive]
        && ((objc_opt_respondsToSelector() & 1) == 0 || ([v6 relationship] & 2) == 0))
      {
        return v6;
      }
    }
    if (v3 == (id)++v5)
    {
      id v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (!v3) {
        return 0;
      }
      goto LABEL_5;
    }
  }
}

id sub_100024DD4(id result, uint64_t a2, void *a3)
{
  if (result)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      id v5 = result;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        CFStringRef v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
          long long v9 = (void *)IDSCopyIDForDevice();
          unsigned __int8 v10 = [v9 isEqualToString:a2];

          if (v10) {
            return sub_100029124((uint64_t)RDDeviceInfo, v8, a2);
          }
          CFStringRef v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        id v5 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

NSDictionary *sub_100024F04(NSDictionary *result)
{
  if (result)
  {
    p_Class isa = (id *)&result->super.isa;
    id v2 = sub_100024F68((uint64_t)result);
    id v3 = sub_100024DD4(p_isa, (uint64_t)v2, [p_isa[3] devices]);
    return sub_100028AD0((uint64_t)RDDeviceInfo, v3);
  }
  return result;
}

id sub_100024F68(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = sub_100024C94(a1);
  if (!v1)
  {
    id v5 = qword_10006EBD8;
    if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No paired device found to send snapshot.", (uint8_t *)&v7, 2u);
    }
    return 0;
  }
  id v2 = v1;
  id v3 = (void *)IDSCopyIDForDevice();
  if (!v3)
  {
    uint64_t v6 = qword_10006EBD8;
    if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      uint64_t v8 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to get device id from IDS for %{public}@", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }

  return v3;
}

void sub_1000250CC(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    id v8 = sub_100024F68(a1);
    if (!v8)
    {
      uint64_t v22 = qword_10006EBD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)long long buf = 0;
      int v19 = "No connected device found. Ignoring message.";
      id v20 = v22;
      uint32_t v21 = 2;
      goto LABEL_18;
    }
    long long v9 = +[NSSet setWithObject:v8];
    unsigned __int8 v10 = sub_10001CF84(a2);
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    unsigned __int8 v31 = [a3 sendMessage:v10 toDestinations:v9 priority:300 options:a4 identifier:&v32 error:&v33];
    uint64_t v11 = v32;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v12 = *(void **)(a1 + 56);
    id v13 = [v12 countByEnumeratingWithState:&v34 objects:buf count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v35 == v15)
          {
            double v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          else
          {
            objc_enumerationMutation(v12);
            double v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          [v17 service:a1 didRequestToSendIDSMessage:v10 withIDSIdentifier:v11];
        }
        id v14 = [v12 countByEnumeratingWithState:&v34 objects:buf count:16];
      }
      while (v14);
    }
    uint64_t v18 = qword_10006EBD8;
    if (v31)
    {
      if (!os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_DWORD *)long long buf = 138478083;
      uint64_t v39 = v10;
      __int16 v40 = 2114;
      uint64_t v41 = v32;
      int v19 = "Sent message %{private}@ with identifier %{public}@";
      id v20 = v18;
      uint32_t v21 = 22;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      return;
    }
    if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138478083;
      uint64_t v39 = v10;
      __int16 v40 = 2114;
      uint64_t v41 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to send message %{private}@ immediately. %{public}@", buf, 0x16u);
    }
    uint64_t v23 = v32;
    uint64_t v24 = v33;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v25 = *(void **)(a1 + 56);
    id v26 = [v25 countByEnumeratingWithState:&v34 objects:buf count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v35 == v28)
          {
            double v30 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          else
          {
            objc_enumerationMutation(v25);
            double v30 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          [v30 service:a1 didFailIDSMessage:v10 IDSIdentifier:v23 withError:v24];
        }
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:buf count:16];
      }
      while (v27);
    }
  }
}

void sub_100025454(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a1) {
    return;
  }
  id v10 = sub_100024F68(a1);
  if (!v10) {
    return;
  }
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  unsigned __int8 v11 = [*(id *)(a1 + 24) sendResourceAtURL:a2 metadata:a4 destinations:[NSSet setWithObject:NSSet, "setWithObject:", v10] priority:sub_10002BAE4(*(id **)(a1 + 40)) options:a5 identifier:&v37 error:&v36];
  long long v12 = (char *)[a2 path];
  id v13 = sub_100039FA8(a3, 0, *(void **)(a1 + 48), *(void **)(a1 + 40));
  id v14 = (NSString *)sub_100012F98([RDEncryptingDatastore alloc], v13);
  uint64_t v15 = sub_1000132D8(v14, v12);
  if (v15) {
    CFStringRef v16 = (const __CFString *)v15;
  }
  else {
    CFStringRef v16 = &stru_10005E2D0;
  }

  if ((v11 & 1) == 0)
  {
    uint64_t v26 = v36;
    uint64_t v25 = v37;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = *(void **)(a1 + 56);
    id v28 = [v27 countByEnumeratingWithState:&v38 objects:buf count:16];
    if (!v28)
    {
LABEL_29:
      uint64_t v33 = qword_10006EBD8;
      if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        double v43 = a2;
        __int16 v44 = 2114;
        uint64_t v45 = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to send resource %{public}@. %{public}@", buf, 0x16u);
      }
      return;
    }
    id v29 = v28;
    uint64_t v30 = *(void *)v39;
LABEL_22:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v39 == v30)
      {
        uint64_t v32 = *(void **)(*((void *)&v38 + 1) + 8 * v31);
        if (objc_opt_respondsToSelector()) {
          goto LABEL_28;
        }
      }
      else
      {
        objc_enumerationMutation(v27);
        uint64_t v32 = *(void **)(*((void *)&v38 + 1) + 8 * v31);
        if (objc_opt_respondsToSelector()) {
LABEL_28:
        }
          [v32 service:a1 didFailResource:a2 IDSIdentifier:v25 keyName:v16 sensor:a3 withError:v26];
      }
      if (v29 == (id)++v31)
      {
        id v29 = [v27 countByEnumeratingWithState:&v38 objects:buf count:16];
        if (!v29) {
          goto LABEL_29;
        }
        goto LABEL_22;
      }
    }
  }
  double v17 = qword_10006EBD8;
  if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    double v43 = a2;
    __int16 v44 = 2114;
    uint64_t v45 = v37;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sent resource %{public}@ with identifier %{public}@", buf, 0x16u);
  }
  uint64_t v18 = v37;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  int v19 = *(void **)(a1 + 56);
  id v20 = [v19 countByEnumeratingWithState:&v38 objects:buf count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v39 == v22)
        {
          uint64_t v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v19);
          uint64_t v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
        }
        [v24 service:a1 didRequestToSendResource:a2 withIDSIdentifier:v18 keyName:v16 sensor:a3 isRetry:a6];
      }
      id v21 = [v19 countByEnumeratingWithState:&v38 objects:buf count:16];
    }
    while (v21);
  }
}

void *sub_100026C0C(void *a1, void *a2, void *a3, void *a4)
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)RDLaunchEvents;
  int v7 = [super init];
  if (v7)
  {
    v7[4] = a3;
    v7[3] = a4;
    objc_setProperty_nonatomic(v7, v8, a2, 16);
  }
  return v7;
}

RDXPCActivity *sub_100026D24(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.updateCompanionWithSamples"])
  {
    uint64_t v4 = *(void *)(a1 + 24);
    return sub_1000236BC((uint64_t)RDXPCActivity, v4);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.removeOldData"])
  {
    return sub_100023924();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.postMetric"])
  {
    return sub_100023B0C();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.launchAlsRecorder"])
  {
    return sub_100023BE8();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.launchUsageCollector"])
  {
    return sub_100023CD8();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.launchInteractionHistoryCollector"])
  {
    return sub_100023D98();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.fetchStrideCalibration"])
  {
    return sub_100023E40();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.fetchVisits"])
  {
    return sub_100023F00();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.decryptArchives"])
  {
    return sub_100024080();
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.syncCompanionStateToGizmo"])
  {
    uint64_t v6 = *(void *)(a1 + 24);
    return sub_100024158((uint64_t)RDXPCActivity, v6);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.syncCompanionStateToGizmoLocked"])
  {
    uint64_t v7 = *(void *)(a1 + 24);
    return sub_1000242B0((uint64_t)RDXPCActivity, v7);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.prepareArchives"])
  {
    SEL v8 = *(id **)(a1 + 24);
    return sub_1000237C0((uint64_t)RDXPCActivity, v8);
  }
  if ([a2 isEqualToString:@"com.apple.sensorkit.gcKeys"])
  {
    return sub_100023A00();
  }
  if (![a2 isEqualToString:@"com.apple.sensorkit.launchMediaEventsRecorder"]) {
    return 0;
  }

  return sub_100023FD8();
}

void sub_100027070(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_1000270F4;
  v1[3] = &unk_10005D340;
  long long v2 = *(_OWORD *)(a1 + 32);
  _os_activity_initiate((void *)&_mh_execute_header, "Running XPC Activity", OS_ACTIVITY_FLAG_DEFAULT, v1);
}

id sub_1000270F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) launchEventRunActivity:*(void *)(a1 + 40)];
}

void sub_100027354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_10002738C(uint64_t a1, _xpc_activity_s *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (!Weak) {
    goto LABEL_34;
  }
  uint64_t v6 = (uint64_t)Weak;
  uint64_t v7 = *(void **)(a1 + 32);
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  objc_super v10 = sub_100026D24(v6, v7);
  if (v10 || (unsigned __int8 v11 = qword_10006EBE8, !os_log_type_enabled((os_log_t)qword_10006EBE8, OS_LOG_TYPE_FAULT)))
  {
    if (state != 2) {
      goto LABEL_5;
    }
LABEL_21:
    if (v10) {
      objc_setProperty_nonatomic(v10, v9, a2, 24);
    }
    id v19 = objc_loadWeak((id *)(v6 + 8));
    if (v19)
    {
      id v20 = v19;
      if (objc_opt_respondsToSelector())
      {
        sub_1000245F4((uint64_t)v10, 4);
        id v21 = *(NSObject **)(v6 + 16);
        *(void *)id v28 = _NSConcreteStackBlock;
        *(void *)&v28[8] = 3221225472;
        *(void *)&v28[16] = sub_100027070;
        id v29 = &unk_10005D340;
        id v30 = v20;
        uint64_t v31 = v10;
        dispatch_async(v21, v28);
        goto LABEL_34;
      }
      uint64_t v27 = qword_10006EBE8;
      if (!os_log_type_enabled((os_log_t)qword_10006EBE8, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_WORD *)id v28 = 0;
      uint64_t v24 = "Delegate does not support receiving launch events based on XPC activities";
      uint64_t v25 = v27;
      uint32_t v26 = 2;
    }
    else
    {
      uint64_t v22 = qword_10006EBE8;
      if (!os_log_type_enabled((os_log_t)qword_10006EBE8, OS_LOG_TYPE_INFO))
      {
LABEL_33:
        [(RDXPCActivity *)v10 markCompleted];
        goto LABEL_34;
      }
      if (v10) {
        name = v10->_name;
      }
      else {
        name = 0;
      }
      *(_DWORD *)id v28 = 138543362;
      *(void *)&v28[4] = name;
      uint64_t v24 = "No delegate available to run xpc activity %{public}@";
      uint64_t v25 = v22;
      uint32_t v26 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v24, v28, v26);
    goto LABEL_33;
  }
  *(_DWORD *)id v28 = 138543362;
  *(void *)&v28[4] = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to create and activity named %{public}@", v28, 0xCu);
  if (state == 2) {
    goto LABEL_21;
  }
LABEL_5:
  if (state)
  {
    double v17 = qword_10006EBE8;
    if (os_log_type_enabled((os_log_t)qword_10006EBE8, OS_LOG_TYPE_DEBUG))
    {
      if (v10) {
        uint64_t v18 = v10->_name;
      }
      else {
        uint64_t v18 = 0;
      }
      *(_DWORD *)id v28 = 134349314;
      *(void *)&v28[4] = state;
      *(_WORD *)&v28[12] = 2114;
      *(void *)&v28[14] = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Unexpected xpc activity state %{public}ld for activity %{public}@", v28, 0x16u);
    }
  }
  else
  {
    long long v12 = qword_10006EBE8;
    if (os_log_type_enabled((os_log_t)qword_10006EBE8, OS_LOG_TYPE_DEFAULT))
    {
      if (v10) {
        id v13 = v10->_name;
      }
      else {
        id v13 = 0;
      }
      *(_DWORD *)id v28 = 138543362;
      *(void *)&v28[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking in for %{public}@", v28, 0xCu);
    }
    if (v10)
    {
      xpc_object_t v14 = xpc_activity_copy_criteria(a2);
      uint64_t v15 = v14;
      if (!v14 || !xpc_equal(v14, v10->_criteria)) {
        xpc_activity_set_criteria(a2, v10->_criteria);
      }

      id v16 = objc_loadWeak((id *)(v6 + 8));
      if (objc_opt_respondsToSelector()) {
        [v16 launchEventCheckInActivity:v10];
      }
    }
    else
    {
      objc_loadWeak((id *)(v6 + 8));
    }
  }
LABEL_34:
}

void sub_1000279A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000279BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000279D0(uint64_t a1, uint64_t a2)
{
  id Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    id v4 = objc_loadWeak(Weak + 1);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
  }
  else
  {
    id v4 = 0;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_100027AA0;
  v5[3] = &unk_10005D340;
  void v5[4] = v4;
  v5[5] = a2;
  _os_activity_initiate((void *)&_mh_execute_header, "Running XPC Event Handler", OS_ACTIVITY_FLAG_DEFAULT, v5);
}

void sub_100027AA0(uint64_t a1)
{
  [*(id *)(a1 + 32) launchEventXPCEventReceived:*(void *)(a1 + 40)];
}

double *sub_100027B48(void *a1, void *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  v49.receiver = a1;
  v49.super_class = (Class)RDStateCache;
  id v5 = (double *)[super init];
  if (v5)
  {
    double v48 = 0.0;
    *((void *)v5 + 11) = a2;
    *((void *)v5 + 13) = a3;
    uint64_t v6 = sub_10001C690(*((NSURL **)v5 + 11));
    id v7 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v6 error:&v48];
    if (v7)
    {
      sub_1000280F8(v5, v7);
      SEL v8 = (void *)*((void *)v5 + 12);
      if (v8) {
        goto LABEL_5;
      }
LABEL_9:
      double v10 = v5[2];
      uint64_t v11 = mach_continuous_time();
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v12 = qword_10006EC90;
      double v13 = *(double *)&qword_10006EC98;
      double v14 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      if (v12 >= v11) {
        double v15 = -v15;
      }
      id v16 = +[NSNumber numberWithInt:v10 > v14 + v13 + v15];
      objc_setProperty_nonatomic(v5, v17, v16, 96);
      if (([*((id *)v5 + 12) BOOLValue] & 1) == 0) {
        goto LABEL_40;
      }
      goto LABEL_14;
    }
    long long v9 = qword_10006EBF0;
    if (os_log_type_enabled((os_log_t)qword_10006EBF0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      double v60 = *(double *)&v6;
      __int16 v61 = 2114;
      double v62 = v48;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to initialize cache from %{public}@ because %{public}@", buf, 0x16u);
      sub_1000280F8(v5, 0);
      SEL v8 = (void *)*((void *)v5 + 12);
      if (!v8) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_1000280F8(v5, 0);
      SEL v8 = (void *)*((void *)v5 + 12);
      if (!v8) {
        goto LABEL_9;
      }
    }
LABEL_5:
    if (![v8 BOOLValue])
    {
LABEL_40:
      double v40 = v5[4];
      if (v40 != 0.0)
      {
        long long v41 = qword_10006EBF0;
        if (os_log_type_enabled((os_log_t)qword_10006EBF0, OS_LOG_TYPE_FAULT))
        {
          uint64_t v43 = mach_continuous_time();
          if (qword_10006EC88 != -1) {
            dispatch_once(&qword_10006EC88, &stru_10005CDC0);
          }
          unint64_t v44 = qword_10006EC90;
          double v45 = *(double *)&qword_10006EC98;
          double v46 = *(double *)&qword_10006ECA0;
          TMConvertTicksToSeconds();
          if (v44 >= v43) {
            double v47 = -v47;
          }
          *(_DWORD *)long long buf = 134349312;
          double v60 = v40;
          __int16 v61 = 2050;
          double v62 = v46 + v45 + v47;
          _os_log_fault_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "Phone has a cached timeSyncTimestamp of (%{public}f, now: %{public}f) which should not happen", buf, 0x16u);
        }
        void v5[4] = 0.0;
        sub_1000283D8((uint64_t)v5);
      }

      return v5;
    }
LABEL_14:
    uint64_t v18 = qword_10006EBF0;
    if (os_log_type_enabled((os_log_t)qword_10006EBF0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "System went through an RTC reset. Resetting cached timestamps.", buf, 2u);
    }
    v5[1] = 0.0;
    void v5[4] = 0.0;
    v5[5] = 0.0;
    v5[7] = 0.0;
    v5[8] = 0.0;
    id v19 = +[NSMutableSet set];
    id v20 = (void *)*((void *)v5 + 6);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v21 = [*((id *)v5 + 13) readerAuthorizationGroups];
    id v22 = [v21 countByEnumeratingWithState:&v54 objects:buf count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v55;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          if ([v20 objectForKeyedSubscript:v26]) {
            [v19 addObject:v26];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v54 objects:buf count:16];
      }
      while (v23);
    }
    uint64_t v27 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v28 = qword_10006EC90;
    double v29 = *(double *)&qword_10006EC98;
    double v30 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v28 >= v27) {
      double v32 = -v31;
    }
    else {
      double v32 = v31;
    }
    uint64_t v33 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v19 count]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v34 = [v19 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v34)
    {
      id v35 = v34;
      double v36 = v30 + v29 + v32;
      uint64_t v37 = *(void *)v51;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v51 != v37) {
            objc_enumerationMutation(v19);
          }
          [(NSMutableDictionary *)v33 setObject:+[NSNumber numberWithDouble:v36] forKeyedSubscript:*(void *)(*((void *)&v50 + 1) + 8 * (void)j)];
        }
        id v35 = [v19 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v35);
    }
    long long v39 = (NSMutableDictionary *)*((void *)v5 + 6);
    if (v39 != v33)
    {
      *((void *)v5 + 6) = v33;
    }
    sub_1000283D8((uint64_t)v5);
    sub_1000283D8((uint64_t)v5);
    goto LABEL_40;
  }
  return v5;
}

NSString *sub_1000280F8(void *a1, void *a2)
{
  [objc_msgSend(a2, "objectForKeyedSubscript:", @"LastTimeReminderAlertShown") doubleValue];
  a1[1] = v4;
  [objc_msgSend(a2, "objectForKeyedSubscript:", @"LocalDaemonLaunchTime") doubleValue];
  a1[2] = v5;
  [objc_msgSend(a2, "objectForKeyedSubscript:", @"RemoteRTCOffset") doubleValue];
  a1[5] = v6;
  id v7 = [a2 objectForKeyedSubscript:@"ServiceStartTimes"];
  if (v7) {
    SEL v8 = v7;
  }
  else {
    SEL v8 = &__NSDictionary0__struct;
  }
  a1[6] = [objc_alloc((Class)NSDictionary) initWithDictionary:v8];
  a1[3] = [[a2 objectForKeyedSubscript:@"LastVersionMigrated"] unsignedLongLongValue];
  [objc_msgSend(a2, "objectForKeyedSubscript:", @"TimeSyncTimestamp") doubleValue];
  a1[4] = v9;
  [objc_msgSend(a2, "objectForKeyedSubscript:", @"PreferWifiAssertionEndTime") doubleValue];
  a1[7] = v10;
  [objc_msgSend(a2, "objectForKeyedSubscript:", @"StateSentTimestamp") doubleValue];
  a1[8] = v11;
  [objc_msgSend(a2, "objectForKeyedSubscript:", @"FaceMetricsReminderScheduled") doubleValue];
  a1[10] = v12;
  double v13 = (NSString *)[a2 objectForKeyedSubscript:@"DeviceIdentifier"];
  if (!v13)
  {
    double v13 = [+[NSUUID UUID] UUIDString];
    double v14 = qword_10006EBF0;
    if (os_log_type_enabled((os_log_t)qword_10006EBF0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      SEL v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Assigning a new device identifier: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  uint64_t result = v13;
  a1[9] = result;
  return result;
}

double *sub_1000282D0(double *result)
{
  if (result)
  {
    id v1 = result;
    long long v2 = (void *)*((void *)result + 12);
    if (!v2)
    {
      double v3 = v1[2];
      uint64_t v4 = mach_continuous_time();
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v5 = qword_10006EC90;
      double v6 = *(double *)&qword_10006EC98;
      double v7 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      if (v5 >= v4) {
        double v8 = -v8;
      }
      uint64_t v9 = +[NSNumber numberWithInt:v3 > v7 + v6 + v8];
      objc_setProperty_nonatomic(v1, v10, v9, 96);
      long long v2 = (void *)*((void *)v1 + 12);
    }
    return (double *)[v2 BOOLValue];
  }
  return result;
}

void sub_1000283D8(uint64_t a1)
{
  if (a1)
  {
    v15[0] = @"LastTimeReminderAlertShown";
    *(void *)&long long buf = +[NSNumber numberWithDouble:*(double *)(a1 + 8)];
    v15[1] = @"LocalDaemonLaunchTime";
    *((void *)&buf + 1) = +[NSNumber numberWithDouble:*(double *)(a1 + 16)];
    v15[2] = @"RemoteRTCOffset";
    long long v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
    uint64_t v3 = *(void *)(a1 + 48);
    SEL v17 = v2;
    uint64_t v18 = v3;
    void v15[3] = @"ServiceStartTimes";
    void v15[4] = @"LastVersionMigrated";
    id v19 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    v15[5] = @"TimeSyncTimestamp";
    id v20 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
    v15[6] = @"PreferWifiAssertionEndTime";
    id v21 = +[NSNumber numberWithDouble:*(double *)(a1 + 56)];
    v15[7] = @"StateSentTimestamp";
    uint64_t v4 = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
    uint64_t v5 = *(void *)(a1 + 72);
    id v22 = v4;
    uint64_t v23 = v5;
    v15[8] = @"DeviceIdentifier";
    v15[9] = @"FaceMetricsReminderScheduled";
    uint64_t v24 = +[NSNumber numberWithDouble:*(double *)(a1 + 80)];
    double v6 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v15 count:10];
    v15[0] = 0;
    double v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:v15];
    uint64_t v8 = v15[0];
    if (v15[0])
    {
      uint64_t v9 = qword_10006EBF0;
      if (os_log_type_enabled((os_log_t)qword_10006EBF0, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        SEL v10 = "Failed to cache state to because %{public}@";
LABEL_11:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = v7;
      uint64_t v12 = sub_10001C690(*(NSURL **)(a1 + 88));
      uint64_t v14 = 0;
      unsigned int v13 = [(NSData *)v11 writeToURL:v12 options:268435457 error:&v14];
      uint64_t v9 = qword_10006EBF0;
      if (v13)
      {
        if (os_log_type_enabled((os_log_t)qword_10006EBF0, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cache written to disk: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10006EBF0, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v14;
        SEL v10 = "Failed to cache state because %{public}@";
        goto LABEL_11;
      }
    }
  }
}

void sub_100028728(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(a1 + 48)];
    uint64_t v5 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v6 = qword_10006EC90;
    double v7 = *(double *)&qword_10006EC98;
    double v8 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v6 >= v5) {
      double v9 = -v9;
    }
    [(NSMutableDictionary *)v4 setObject:+[NSNumber numberWithDouble:v8 + v7 + v9] forKeyedSubscript:a2];
    SEL v10 = *(NSMutableDictionary **)(a1 + 48);
    if (v10 != v4)
    {
      *(void *)(a1 + 48) = v4;
    }
    sub_1000283D8(a1);
  }
}

NSDictionary *sub_100028838(NSDictionary *result)
{
  if (result)
  {
    id v1 = result;
    v6[0] = @"LastTimeReminderAlertShown";
    v7[0] = +[NSNumber numberWithDouble:*(double *)&result[1].super.isa];
    v6[1] = @"LocalDaemonLaunchTime";
    v7[1] = +[NSNumber numberWithDouble:*(double *)&v1[2].super.isa];
    _DWORD v6[2] = @"RemoteRTCOffset";
    long long v2 = +[NSNumber numberWithDouble:*(double *)&v1[5].super.isa];
    Class isa = v1[6].super.isa;
    void v7[2] = v2;
    v7[3] = isa;
    v6[3] = @"ServiceStartTimes";
    v6[4] = @"LastVersionMigrated";
    v7[4] = +[NSNumber numberWithUnsignedLongLong:v1[3].super.isa];
    v6[5] = @"TimeSyncTimestamp";
    v7[5] = +[NSNumber numberWithDouble:*(double *)&v1[4].super.isa];
    v6[6] = @"PreferWifiAssertionEndTime";
    v7[6] = +[NSNumber numberWithDouble:*(double *)&v1[7].super.isa];
    v6[7] = @"StateSentTimestamp";
    uint64_t v4 = +[NSNumber numberWithDouble:*(double *)&v1[8].super.isa];
    Class v5 = v1[9].super.isa;
    v7[7] = v4;
    v7[8] = v5;
    v6[8] = @"DeviceIdentifier";
    v6[9] = @"FaceMetricsReminderScheduled";
    v7[9] = +[NSNumber numberWithDouble:*(double *)&v1[10].super.isa];
    return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:10];
  }
  return result;
}

NSDictionary *sub_100028AD0(uint64_t a1, void *a2)
{
  self;
  self;
  if (!qword_10006EC00)
  {
    qword_10006EC00 = (uint64_t)objc_alloc_init((Class)NSCache);
    [(id)qword_10006EC00 setName:@"com.apple.sensorkitd.deviceInfoCache"];
    uint64_t v3 = (NSDictionary *)[(id)qword_10006EC00 objectForKey:a2];
    if (v3) {
      return v3;
    }
LABEL_5:
    self;
    uint64_t v5 = qword_10006ECB0;
    if ([a2 isEqualToString:qword_10006ECB0])
    {
      v22[0] = @"deviceId";
      v22[1] = @"isCurrentDevice";
      v23[0] = v5;
      v23[1] = &__kCFBooleanTrue;
      uint64_t v3 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      self;
      unint64_t v6 = (void *)qword_10006EC00;
      if (qword_10006EC00)
      {
LABEL_8:
        [v6 setObject:v3 forKey:a2];
        return v3;
      }
LABEL_7:
      qword_10006EC00 = (uint64_t)objc_alloc_init((Class)NSCache);
      [(id)qword_10006EC00 setName:@"com.apple.sensorkitd.deviceInfoCache"];
      unint64_t v6 = (void *)qword_10006EC00;
      goto LABEL_8;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100029000;
    v16[3] = &unk_10005D3B8;
    v16[4] = a2;
    id v7 = [[+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance") getDevicesMatching:v16] firstObject];
    id v8 = [v7 pairingID];
    if (v7 && (double v9 = v8) != 0)
    {
      self;
      id v10 = [v9 UUIDString];
      if (v10)
      {
        a2 = v10;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        uint64_t v18 = sub_10002904C;
        id v19 = &unk_10005D3E0;
        id v20 = v7;
        id v21 = v10;
        *(void *)&long long buf = v10;
        v24[0] = @"deviceId";
        v24[1] = @"model";
        uint64_t v11 = NRDevicePropertyLocalizedModel;
        CFStringRef v12 = (const __CFString *)[v7 valueForProperty:NRDevicePropertyLocalizedModel];
        if (!v12)
        {
          unsigned int v13 = qword_10006EBF8;
          if (os_log_type_enabled((os_log_t)qword_10006EBF8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v33 = 138543618;
            uint64_t v34 = v11;
            __int16 v35 = 2114;
            id v36 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No %{public}@ found for device id %{public}@", v33, 0x16u);
          }
          CFStringRef v12 = &stru_10005E2D0;
        }
        *((void *)&buf + 1) = v12;
        v24[2] = @"systemName";
        uint64_t v26 = (uint64_t)v18((uint64_t)v17, NRDevicePropertySystemName);
        v24[3] = @"systemVersion";
        uint64_t v27 = (uint64_t)v18((uint64_t)v17, NRDevicePropertySystemVersion);
        v24[4] = @"name";
        uint64_t v28 = (uint64_t)v18((uint64_t)v17, NRDevicePropertyName);
        v24[5] = @"buildVersion";
        uint64_t v29 = (uint64_t)v18((uint64_t)v17, NRDevicePropertySystemBuildVersion);
        v24[6] = @"productType";
        uint64_t v30 = (uint64_t)v18((uint64_t)v17, NRDevicePropertyProductType);
        v24[7] = @"enclosureMaterial";
        uint64_t v31 = (uint64_t)v18((uint64_t)v17, NRDevicePropertyEnclosureMaterial);
        v24[8] = @"supportsCurrentVersion";
        double v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [objc_alloc((Class)NSUUID) initWithUUIDString:@"9B084186-2B81-4526-9A7D-AD719EC81C83"]);
        uint64_t v3 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v24 count:9];
        self;
        unint64_t v6 = (void *)qword_10006EC00;
        if (qword_10006EC00) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      double v15 = qword_10006EBF8;
      if (os_log_type_enabled((os_log_t)qword_10006EBF8, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to create a UUIDString for UUID %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v14 = qword_10006EBF8;
      if (os_log_type_enabled((os_log_t)qword_10006EBF8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = a2;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No device info found for id %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    return (NSDictionary *)&__NSDictionary0__struct;
  }
  uint64_t v3 = (NSDictionary *)[(id)qword_10006EC00 objectForKey:a2];
  if (!v3) {
    goto LABEL_5;
  }
  return v3;
}

id sub_100029000(uint64_t a1, void *a2)
{
  id v3 = [[[a2 valueForProperty:NRDevicePropertyPairingID] UUIDString];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 isEqualToString:v4];
}

CFStringRef sub_10002904C(uint64_t a1, uint64_t a2)
{
  CFStringRef result = (const __CFString *)[*(id *)(a1 + 32) valueForProperty:a2];
  if (!result)
  {
    uint64_t v5 = qword_10006EBF8;
    if (os_log_type_enabled((os_log_t)qword_10006EBF8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543618;
      uint64_t v8 = a2;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No %{public}@ found for device id %{public}@", (uint8_t *)&v7, 0x16u);
    }
    return &stru_10005E2D0;
  }
  return result;
}

id sub_100029124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  self;
  self;
  if (qword_10006EC00)
  {
    id v5 = [(id)qword_10006EC00 objectForKey:a3];
    if (v5) {
      return v5;
    }
  }
  else
  {
    qword_10006EC00 = (uint64_t)objc_alloc_init((Class)NSCache);
    [(id)qword_10006EC00 setName:@"com.apple.sensorkitd.deviceInfoCache"];
    id v5 = [(id)qword_10006EC00 objectForKey:a3];
    if (v5) {
      return v5;
    }
  }
  id v7 = [+[NRPairedDeviceRegistry sharedInstance] deviceForIDSDevice:a2];
  id v5 = [[[v7 valueForProperty:NRDevicePropertyPairingID] UUIDString];
  if (!v5) {
    return v5;
  }
  self;
  uint64_t v8 = (void *)qword_10006EC00;
  if (!qword_10006EC00)
  {
    qword_10006EC00 = (uint64_t)objc_alloc_init((Class)NSCache);
    [(id)qword_10006EC00 setName:@"com.apple.sensorkitd.deviceInfoCache"];
    uint64_t v8 = (void *)qword_10006EC00;
  }
  [v8 setObject:v5 forKey:a3];
  return v5;
}

id *sub_100029D6C(id *result)
{
  if (result)
  {
    id v1 = result;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    if (qword_10006EC10 != -1) {
      dispatch_once(&qword_10006EC10, &stru_10005D400);
    }
    long long v2 = (void *)qword_10006EC18;
    CFStringRef result = (id *)[(id)qword_10006EC18 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      id v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        id v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          [v1[3] removeObjectForKey:*(void *)(*((void *)&v6 + 1) + 8 * (void)v5), (void)v6];
          id v5 = (id *)((char *)v5 + 1);
        }
        while (v3 != v5);
        CFStringRef result = (id *)[v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        id v3 = result;
      }
      while (result);
    }
  }
  return result;
}

void *sub_100029E94(void *result, char a2, int a3)
{
  if (result)
  {
    uint64_t v4 = result;
    id v5 = (void *)result[3];
    id v6 = [0 componentsSeparatedByString:@"."];
    long long v7 = (char *)[v6 count];
    do
    {
      if (!v7) {
        break;
      }
      id v8 = [[objc_msgSend(v6, "subarrayWithRange:", 0, v7) componentsJoinedByString:@"."];
      if ([v8 length])
      {
        CFStringRef v9 = (const __CFString *)[v8 stringByAppendingFormat:@".%@", @"Enabled"];
        if ([(id)v4[3] objectForKey:v9]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v9 = @"Enabled";
        if ([(id)v4[3] objectForKey:@"Enabled"]) {
          goto LABEL_10;
        }
      }
      --v7;
    }
    while (![v6 objectAtIndexedSubscript:v7] isEqualToString:@"tombstones");
    CFStringRef v9 = @"Enabled";
LABEL_10:
    uint64_t v10 = (uint64_t)[v5 integerForKey:v9];
    uint64_t v11 = v10 & ~(v10 >> 63) & ~(1 << a2) | (a3 << a2);
    CFStringRef v12 = (void *)v4[3];
    return [v12 setInteger:v11 forKey:@"Enabled"];
  }
  return result;
}

unint64_t sub_10002A018(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    long long v2 = *(void **)(result + 24);
    id v3 = [0 componentsSeparatedByString:@"."];
    uint64_t v4 = (char *)[v3 count];
    do
    {
      if (!v4) {
        break;
      }
      id v5 = [[objc_msgSend(v3, "subarrayWithRange:", 0, v4) componentsJoinedByString:@"."];
      if ([v5 length])
      {
        CFStringRef v6 = (const __CFString *)[v5 stringByAppendingFormat:@".%@", @"Enabled"];
        if ([*(id *)(v1 + 24) objectForKey:v6]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v6 = @"Enabled";
        if ([*(id *)(v1 + 24) objectForKey:@"Enabled"]) {
          goto LABEL_10;
        }
      }
      --v4;
    }
    while (![v3[v4] isEqualToString:@"tombstones"]);
    CFStringRef v6 = @"Enabled";
LABEL_10:
    unint64_t v7 = (unint64_t)[v2 integerForKey:v6];
    return v7 & ~(v7 >> 63) & 1;
  }
  return result;
}

unint64_t sub_10002A140(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    long long v2 = *(void **)(result + 24);
    id v3 = [0 componentsSeparatedByString:@"."];
    uint64_t v4 = (char *)[v3 count];
    do
    {
      if (!v4) {
        break;
      }
      id v5 = [[objc_msgSend(v3, "subarrayWithRange:", 0, v4) componentsJoinedByString:@"."];
      if ([v5 length])
      {
        CFStringRef v6 = (const __CFString *)[v5 stringByAppendingFormat:@".%@", @"Enabled"];
        if ([*(id *)(v1 + 24) objectForKey:v6]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v6 = @"Enabled";
        if ([*(id *)(v1 + 24) objectForKey:@"Enabled"]) {
          goto LABEL_10;
        }
      }
      --v4;
    }
    while (![v3[v4] isEqualToString:@"tombstones"]);
    CFStringRef v6 = @"Enabled";
LABEL_10:
    uint64_t v7 = (uint64_t)[v2 integerForKey:v6];
    if ((v7 & ~(v7 >> 63) & 4) != 0)
    {
      return 1;
    }
    else
    {
      id v8 = *(void **)(v1 + 24);
      id v9 = [0 componentsSeparatedByString:@"."];
      uint64_t v10 = (char *)[v9 count];
      do
      {
        if (!v10) {
          break;
        }
        id v11 = [[objc_msgSend(v9, "subarrayWithRange:", 0, v10) componentsJoinedByString:@"."];
        if ([v11 length])
        {
          CFStringRef v12 = (const __CFString *)[v11 stringByAppendingFormat:@".%@", @"Enabled"];
          if ([*(id *)(v1 + 24) objectForKey:v12]) {
            goto LABEL_19;
          }
        }
        else
        {
          CFStringRef v12 = @"Enabled";
          if ([*(id *)(v1 + 24) objectForKey:@"Enabled"]) {
            goto LABEL_19;
          }
        }
        --v10;
      }
      while (![v9 objectAtIndexedSubscript:v10] isEqualToString:@"tombstones"));
      CFStringRef v12 = @"Enabled";
LABEL_19:
      unint64_t v13 = (unint64_t)[v8 integerForKey:v12];
      return ((v13 & ~(v13 >> 62)) >> 1) & 1;
    }
  }
  return result;
}

void *sub_10002A33C(void *result, void *a2)
{
  if (result)
  {
    long long v2 = result;
    id v3 = (void *)result[3];
    id v4 = [a2 componentsSeparatedByString:@"."];
    id v5 = (char *)[v4 count];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = [[objc_msgSend(v4, "subarrayWithRange:", 0, v5) componentsJoinedByString:@"."];
      if ([v6 length])
      {
        CFStringRef v7 = (const __CFString *)[v6 stringByAppendingFormat:@".%@", @"ArchiveCompressionEnabled"];
        if ([(id)v2[3] objectForKey:v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v7 = @"ArchiveCompressionEnabled";
        if ([(id)v2[3] objectForKey:@"ArchiveCompressionEnabled"]) {
          goto LABEL_10;
        }
      }
      --v5;
    }
    while (![v4[v5] isEqualToString:@"tombstones"]);
    CFStringRef v7 = @"ArchiveCompressionEnabled";
LABEL_10:
    return [v3 BOOLForKey:v7];
  }
  return result;
}

void *sub_10002A464(void *result, void *a2)
{
  if (result)
  {
    long long v2 = result;
    id v3 = (void *)result[3];
    id v4 = [a2 componentsSeparatedByString:@"."];
    id v5 = (char *)[v4 count];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = [[objc_msgSend(v4, "subarrayWithRange:", 0, v5) componentsJoinedByString:@"."];
      if ([v6 length])
      {
        CFStringRef v7 = (const __CFString *)[v6 stringByAppendingFormat:@".%@", @"ProtectionClass"];
        if ([(id)v2[3] objectForKey:v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v7 = @"ProtectionClass";
        if ([(id)v2[3] objectForKey:@"ProtectionClass"]) {
          goto LABEL_10;
        }
      }
      --v5;
    }
    while (![v4[v5] isEqualToString:@"tombstones"]);
    CFStringRef v7 = @"ProtectionClass";
LABEL_10:
    return [v3 integerForKey:v7];
  }
  return result;
}

uint64_t sub_10002A58C(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    unsigned int v4 = [a2 hasSuffix:@".tombstones"];
    id v5 = *(void **)(v3 + 24);
    if (v4)
    {
      id v6 = [0 componentsSeparatedByString:@"."];
      CFStringRef v7 = (char *)[v6 count];
      CFStringRef v8 = @"TombstoneDataRetentionLengthSeconds";
      do
      {
        if (!v7) {
          break;
        }
        id v9 = [[objc_msgSend(v6, "subarrayWithRange:", 0, v7) componentsJoinedByString:@"."];
        if ([v9 length])
        {
          CFStringRef v10 = (const __CFString *)[v9 stringByAppendingFormat:@".%@", @"TombstoneDataRetentionLengthSeconds"];
          if ([*(id *)(v3 + 24) objectForKey:v10]) {
            goto LABEL_19;
          }
        }
        else
        {
          CFStringRef v10 = @"TombstoneDataRetentionLengthSeconds";
          if ([*(id *)(v3 + 24) objectForKey:@"TombstoneDataRetentionLengthSeconds"]) {
            goto LABEL_19;
          }
        }
        --v7;
      }
      while ([[objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v7), "isEqualToString:", @"tombstones") boolValue] == 0);
    }
    else
    {
      id v11 = [a2 componentsSeparatedByString:@"."];
      CFStringRef v12 = (char *)[v11 count];
      CFStringRef v8 = @"DataProtectionLengthSeconds";
      do
      {
        if (!v12) {
          break;
        }
        id v13 = [[objc_msgSend(v11, "subarrayWithRange:", 0, v12) componentsJoinedByString:@"."];
        if ([v13 length])
        {
          CFStringRef v10 = (const __CFString *)[v13 stringByAppendingFormat:@".%@", @"DataProtectionLengthSeconds"];
          if ([*(id *)(v3 + 24) objectForKey:v10]) {
            goto LABEL_19;
          }
        }
        else
        {
          CFStringRef v10 = @"DataProtectionLengthSeconds";
          if ([*(id *)(v3 + 24) objectForKey:@"DataProtectionLengthSeconds"]) {
            goto LABEL_19;
          }
        }
        --v12;
      }
      while (![v11 objectAtIndexedSubscript:v12] isEqualToString:@"tombstones"));
    }
    CFStringRef v10 = v8;
LABEL_19:
    uint64_t v14 = (uint64_t)[v5 integerForKey:v10];
    return v14 & ~(v14 >> 63);
  }
  return result;
}

uint64_t sub_10002A77C(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    unsigned int v4 = [a2 hasSuffix:@".tombstones"];
    id v5 = *(void **)(v3 + 24);
    if (v4)
    {
      id v6 = [0 componentsSeparatedByString:@"."];
      CFStringRef v7 = (char *)[v6 count];
      CFStringRef v8 = @"TombstoneDataRetentionLengthSeconds";
      do
      {
        if (!v7) {
          break;
        }
        id v9 = [[objc_msgSend(v6, "subarrayWithRange:", 0, v7) componentsJoinedByString:@"."];
        if ([v9 length])
        {
          CFStringRef v10 = (const __CFString *)[v9 stringByAppendingFormat:@".%@", @"TombstoneDataRetentionLengthSeconds"];
          if ([*(id *)(v3 + 24) objectForKey:v10]) {
            goto LABEL_19;
          }
        }
        else
        {
          CFStringRef v10 = @"TombstoneDataRetentionLengthSeconds";
          if ([*(id *)(v3 + 24) objectForKey:@"TombstoneDataRetentionLengthSeconds"]) {
            goto LABEL_19;
          }
        }
        --v7;
      }
      while ([[objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v7), "isEqualToString:", @"tombstones") boolValue] == 0);
    }
    else
    {
      id v11 = [a2 componentsSeparatedByString:@"."];
      CFStringRef v12 = (char *)[v11 count];
      CFStringRef v8 = @"KeyProtectionLengthSeconds";
      do
      {
        if (!v12) {
          break;
        }
        id v13 = [[objc_msgSend(v11, "subarrayWithRange:", 0, v12) componentsJoinedByString:@"."];
        if ([v13 length])
        {
          CFStringRef v10 = (const __CFString *)[v13 stringByAppendingFormat:@".%@", @"KeyProtectionLengthSeconds"];
          if ([*(id *)(v3 + 24) objectForKey:v10]) {
            goto LABEL_19;
          }
        }
        else
        {
          CFStringRef v10 = @"KeyProtectionLengthSeconds";
          if ([*(id *)(v3 + 24) objectForKey:@"KeyProtectionLengthSeconds"]) {
            goto LABEL_19;
          }
        }
        --v12;
      }
      while (![v11 objectAtIndexedSubscript:v12] isEqualToString:@"tombstones"));
    }
    CFStringRef v10 = v8;
LABEL_19:
    uint64_t v14 = (uint64_t)[v5 integerForKey:v10];
    return v14 & ~(v14 >> 63);
  }
  return result;
}

double sub_10002A96C(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return 0.0;
  }
  id v5 = *(void **)(a1 + 24);
  id v6 = [a3 componentsSeparatedByString:@"."];
  CFStringRef v7 = (char *)[v6 count];
  do
  {
    if (!v7) {
      break;
    }
    id v8 = [[objc_msgSend(v6, "subarrayWithRange:", 0, v7) componentsJoinedByString:@"."];
    if ([v8 length])
    {
      CFStringRef v9 = (const __CFString *)[v8 stringByAppendingFormat:@".%@", @"CacheDeleteAgeLimit"];
      if ([*(id *)(a1 + 24) objectForKey:v9]) {
        goto LABEL_10;
      }
    }
    else
    {
      CFStringRef v9 = @"CacheDeleteAgeLimit";
      if ([*(id *)(a1 + 24) objectForKey:@"CacheDeleteAgeLimit"]) {
        goto LABEL_10;
      }
    }
    --v7;
  }
  while (![v6 objectAtIndexedSubscript:v7] isEqualToString:@"tombstones"));
  CFStringRef v9 = @"CacheDeleteAgeLimit";
LABEL_10:
  id v10 = [[[v5 dictionaryForKey:v9] objectForKeyedSubscript:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a2), "stringValue"]];
  if (!v10) {
    return (double)(3 * XPC_ACTIVITY_INTERVAL_1_DAY);
  }

  [v10 doubleValue];
  return result;
}

void *sub_10002AAFC(void *result, void *a2)
{
  if (result)
  {
    long long v2 = result;
    uint64_t v3 = (void *)result[3];
    id v4 = [a2 componentsSeparatedByString:@"."];
    id v5 = (char *)[v4 count];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = [[[v4 subarrayWithRange:0, v5] componentsJoinedByString:@"."];
      if ([v6 length])
      {
        CFStringRef v7 = (const __CFString *)[v6 stringByAppendingFormat:@".%@", @"Curated"];
        if ([(id)v2[3] objectForKey:v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v7 = @"Curated";
        if ([(id)v2[3] objectForKey:@"Curated"]) {
          goto LABEL_10;
        }
      }
      --v5;
    }
    while (![[v4 objectAtIndexedSubscript:v5] isEqualToString:@"tombstones"]);
    CFStringRef v7 = @"Curated";
LABEL_10:
    return [v3 BOOLForKey:v7];
  }
  return result;
}

void *sub_10002AC24(void *result, void *a2)
{
  if (result)
  {
    long long v2 = result;
    uint64_t v3 = (void *)result[3];
    id v4 = [a2 componentsSeparatedByString:@"."];
    id v5 = (char *)[v4 count];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = [[objc_msgSend(v4, "subarrayWithRange:", 0, v5) componentsJoinedByString:@"."];
      if ([v6 length])
      {
        CFStringRef v7 = (const __CFString *)[v6 stringByAppendingFormat:@".%@", @"MaxArchiveBytes"];
        if ([(id)v2[3] objectForKey:v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v7 = @"MaxArchiveBytes";
        if ([(id)v2[3] objectForKey:@"MaxArchiveBytes"]) {
          goto LABEL_10;
        }
      }
      --v5;
    }
    while (![v4[v5] isEqualToString:@"tombstones"]);
    CFStringRef v7 = @"MaxArchiveBytes";
LABEL_10:
    return [v3 integerForKey:v7];
  }
  return result;
}

uint64_t sub_10002AD4C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    long long v2 = *(void **)(result + 24);
    id v3 = [0 componentsSeparatedByString:@"."];
    id v4 = (char *)[v3 count];
    do
    {
      if (!v4) {
        break;
      }
      id v5 = [[objc_msgSend(v3, "subarrayWithRange:", 0, v4) componentsJoinedByString:@"."];
      if ([v5 length])
      {
        CFStringRef v6 = (const __CFString *)[v5 stringByAppendingFormat:@".%@", @"UpdateCompanionIntervalSeconds"];
        if ([*(id *)(v1 + 24) objectForKey:v6]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v6 = @"UpdateCompanionIntervalSeconds";
        if ([*(id *)(v1 + 24) objectForKey:@"UpdateCompanionIntervalSeconds"]) {
          goto LABEL_10;
        }
      }
      --v4;
    }
    while (![v3[v4] isEqualToString:@"tombstones"]);
    CFStringRef v6 = @"UpdateCompanionIntervalSeconds";
LABEL_10:
    uint64_t v7 = (uint64_t)[v2 integerForKey:v6];
    return v7 & ~(v7 >> 63);
  }
  return result;
}

uint64_t sub_10002AE6C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    long long v2 = *(void **)(result + 24);
    id v3 = [0 componentsSeparatedByString:@"."];
    id v4 = (char *)[v3 count];
    do
    {
      if (!v4) {
        break;
      }
      id v5 = [[objc_msgSend(v3, "subarrayWithRange:", 0, v4) componentsJoinedByString:@"."];
      if ([v5 length])
      {
        CFStringRef v6 = (const __CFString *)[v5 stringByAppendingFormat:@".%@", @"PrepareArchivesIntervalSeconds"];
        if ([*(id *)(v1 + 24) objectForKey:v6]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v6 = @"PrepareArchivesIntervalSeconds";
        if ([*(id *)(v1 + 24) objectForKey:@"PrepareArchivesIntervalSeconds"]) {
          goto LABEL_10;
        }
      }
      --v4;
    }
    while (![v3[v4] isEqualToString:@"tombstones"]);
    CFStringRef v6 = @"PrepareArchivesIntervalSeconds";
LABEL_10:
    uint64_t v7 = (uint64_t)[v2 integerForKey:v6];
    return v7 & ~(v7 >> 63);
  }
  return result;
}

id *sub_10002AF8C(id *result)
{
  if (result) {
    return (id *)[result[3] BOOLForKey:@"PrepareArchivesDiskIntensive"];
  }
  return result;
}

id *sub_10002AFA4(id *result)
{
  if (result) {
    return (id *)[result[3] BOOLForKey:@"PrepareArchivesCPUIntensive"];
  }
  return result;
}

uint64_t sub_10002AFBC(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    long long v2 = *(void **)(result + 24);
    id v3 = [0 componentsSeparatedByString:@"."];
    id v4 = (char *)[v3 count];
    do
    {
      if (!v4) {
        break;
      }
      id v5 = [[objc_msgSend(v3, "subarrayWithRange:", 0, v4) componentsJoinedByString:@"."];
      if ([v5 length])
      {
        CFStringRef v6 = (const __CFString *)[v5 stringByAppendingFormat:@".%@", @"SyncCompanionStateToGizmoInterval"];
        if ([*(id *)(v1 + 24) objectForKey:v6]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v6 = @"SyncCompanionStateToGizmoInterval";
        if ([*(id *)(v1 + 24) objectForKey:@"SyncCompanionStateToGizmoInterval"]) {
          goto LABEL_10;
        }
      }
      --v4;
    }
    while (![[v3 objectAtIndexedSubscript:v4] isEqualToString:@"tombstones"]);
    CFStringRef v6 = @"SyncCompanionStateToGizmoInterval";
LABEL_10:
    uint64_t v7 = (uint64_t)[v2 integerForKey:v6];
    return v7 & ~(v7 >> 63);
  }
  return result;
}

void *sub_10002B0DC(void *result, void *a2)
{
  if (result)
  {
    long long v2 = result;
    id v3 = (void *)result[3];
    id v4 = [a2 componentsSeparatedByString:@"."];
    id v5 = (char *)[v4 count];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = [[objc_msgSend(v4, "subarrayWithRange:", 0, v5) componentsJoinedByString:@"."];
      if ([v6 length])
      {
        CFStringRef v7 = (const __CFString *)[v6 stringByAppendingFormat:@".%@", @"HoldingPeriod"];
        if ([(id)v2[3] objectForKey:v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v7 = @"HoldingPeriod";
        if ([(id)v2[3] objectForKey:@"HoldingPeriod"]) {
          goto LABEL_10;
        }
      }
      --v5;
    }
    while (![v4[v5] isEqualToString:@"tombstones"]);
    CFStringRef v7 = @"HoldingPeriod";
LABEL_10:
    return [v3 integerForKey:v7];
  }
  return result;
}

NSDictionary *sub_10002B204(NSDictionary *result, void *a2)
{
  if (result)
  {
    long long v2 = result;
    v38[0] = @"DatastoreVersion";
    Class isa = result[3].super.isa;
    id v4 = [a2 componentsSeparatedByString:@"."];
    id v5 = (char *)[v4 count];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = [[objc_msgSend(v4, "subarrayWithRange:", 0, v5) componentsJoinedByString:@"."];
      if ([v6 length])
      {
        CFStringRef v7 = (const __CFString *)[v6 stringByAppendingFormat:@".%@", @"DatastoreVersion"];
        if ([(objc_class *)v2[3].super.isa objectForKey:v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v7 = @"DatastoreVersion";
        if ([(objc_class *)v2[3].super.isa objectForKey:@"DatastoreVersion"]) {
          goto LABEL_10;
        }
      }
      --v5;
    }
    while (![v4[v5] isEqualToString:@"tombstones"]);
    CFStringRef v7 = @"DatastoreVersion";
LABEL_10:
    uint64_t v8 = (uint64_t)[(objc_class *)isa integerForKey:v7];
    v39[0] = +[NSNumber numberWithUnsignedInteger:v8 & ~(v8 >> 63)];
    v38[1] = @"SegmentSize";
    Class v9 = v2[3].super.isa;
    id v10 = [a2 componentsSeparatedByString:@"."];
    id v11 = (char *)[v10 count];
    do
    {
      if (!v11) {
        break;
      }
      id v12 = [[objc_msgSend(v10, "subarrayWithRange:", 0, v11) componentsJoinedByString:@"."];
      if ([v12 length])
      {
        CFStringRef v13 = (const __CFString *)[v12 stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
        if ([(objc_class *)v2[3].super.isa objectForKey:v13]) {
          goto LABEL_18;
        }
      }
      else
      {
        CFStringRef v13 = @"SegmentSizeBytes";
        if ([(objc_class *)v2[3].super.isa objectForKey:@"SegmentSizeBytes"]) {
          goto LABEL_18;
        }
      }
      --v11;
    }
    while (![v10 objectAtIndexedSubscript:v11] isEqualToString:@"tombstones"));
    CFStringRef v13 = @"SegmentSizeBytes";
LABEL_18:
    uint64_t v14 = (uint64_t)[(objc_class *)v9 integerForKey:v13];
    v39[1] = +[NSNumber numberWithUnsignedInteger:v14 & ~(v14 >> 63)];
    v38[2] = @"MaxAllowedMappedPages";
    Class v15 = v2[3].super.isa;
    id v16 = [a2 componentsSeparatedByString:@"."];
    SEL v17 = (char *)[v16 count];
    do
    {
      if (!v17) {
        break;
      }
      id v18 = [[objc_msgSend(v16, "subarrayWithRange:", 0, v17) componentsJoinedByString:@"."];
      if ([v18 length])
      {
        CFStringRef v19 = (const __CFString *)[v18 stringByAppendingFormat:@".%@", @"MaxAllowedMappedPages"];
        if ([(objc_class *)v2[3].super.isa objectForKey:v19]) {
          goto LABEL_26;
        }
      }
      else
      {
        CFStringRef v19 = @"MaxAllowedMappedPages";
        if ([(objc_class *)v2[3].super.isa objectForKey:@"MaxAllowedMappedPages"]) {
          goto LABEL_26;
        }
      }
      --v17;
    }
    while (![v16 objectAtIndexedSubscript:v17] isEqualToString:@"tombstones");
    CFStringRef v19 = @"MaxAllowedMappedPages";
LABEL_26:
    uint64_t v20 = (uint64_t)[(objc_class *)v15 integerForKey:v19];
    v39[2] = +[NSNumber numberWithUnsignedInteger:v20 & ~(v20 >> 63)];
    v38[3] = @"SegmentResizeFactor";
    Class v21 = v2[3].super.isa;
    id v22 = [a2 componentsSeparatedByString:@"."];
    uint64_t v23 = (char *)[v22 count];
    do
    {
      if (!v23) {
        break;
      }
      id v24 = [[objc_msgSend(v22, "subarrayWithRange:", 0, v23) componentsJoinedByString:@"."];
      if ([v24 length])
      {
        CFStringRef v25 = (const __CFString *)[v24 stringByAppendingFormat:@".%@", @"SegmentResizeFactor"];
        if ([(objc_class *)v2[3].super.isa objectForKey:v25]) {
          goto LABEL_34;
        }
      }
      else
      {
        CFStringRef v25 = @"SegmentResizeFactor";
        if ([(objc_class *)v2[3].super.isa objectForKey:@"SegmentResizeFactor"]) {
          goto LABEL_34;
        }
      }
      --v23;
    }
    while (![[v22 objectAtIndexedSubscript:v23] isEqualToString:@"tombstones"]);
    CFStringRef v25 = @"SegmentResizeFactor";
LABEL_34:
    [(objc_class *)v21 floatForKey:v25];
    v39[3] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v38[4] = @"SegmentPaddingFactor";
    Class v26 = v2[3].super.isa;
    id v27 = [a2 componentsSeparatedByString:@"."];
    uint64_t v28 = (char *)[v27 count];
    do
    {
      if (!v28) {
        break;
      }
      id v29 = [[objc_msgSend(v27, "subarrayWithRange:", 0, v28) componentsJoinedByString:@"."];
      if ([v29 length])
      {
        CFStringRef v30 = (const __CFString *)[v29 stringByAppendingFormat:@".%@", @"SegmentPaddingFactor"];
        if ([(objc_class *)v2[3].super.isa objectForKey:v30]) {
          goto LABEL_42;
        }
      }
      else
      {
        CFStringRef v30 = @"SegmentPaddingFactor";
        if ([(objc_class *)v2[3].super.isa objectForKey:@"SegmentPaddingFactor"]) {
          goto LABEL_42;
        }
      }
      --v28;
    }
    while (![[v27 objectAtIndexedSubscript:v28] isEqualToString:@"tombstones"]);
    CFStringRef v30 = @"SegmentPaddingFactor";
LABEL_42:
    [(objc_class *)v26 floatForKey:v30];
    v39[4] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v38[5] = @"MetadataSize";
    Class v31 = v2[3].super.isa;
    id v32 = [a2 componentsSeparatedByString:@"."];
    uint64_t v33 = (char *)[v32 count];
    do
    {
      if (!v33) {
        break;
      }
      id v34 = [[objc_msgSend(v32, "subarrayWithRange:", 0, v33) componentsJoinedByString:@"."];
      if ([v34 length])
      {
        CFStringRef v35 = (const __CFString *)[v34 stringByAppendingFormat:@".%@", @"MetadataSizeBytes"];
        if ([(objc_class *)v2[3].super.isa objectForKey:v35]) {
          goto LABEL_50;
        }
      }
      else
      {
        CFStringRef v35 = @"MetadataSizeBytes";
        if ([(objc_class *)v2[3].super.isa objectForKey:@"MetadataSizeBytes"]) {
          goto LABEL_50;
        }
      }
      --v33;
    }
    while (![v32[v33] isEqualToString:@"tombstones"]);
    CFStringRef v35 = @"MetadataSizeBytes";
LABEL_50:
    uint64_t v36 = (uint64_t)[(objc_class *)v31 integerForKey:v35];
    v39[5] = +[NSNumber numberWithUnsignedInteger:v36 & ~(v36 >> 63)];
    return +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:6];
  }
  return result;
}

uint64_t sub_10002B82C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    long long v2 = *(void **)(result + 24);
    id v3 = [0 componentsSeparatedByString:@"."];
    id v4 = (char *)[v3 count];
    do
    {
      if (!v4) {
        break;
      }
      id v5 = [[objc_msgSend(v3, "subarrayWithRange:", 0, v4) componentsJoinedByString:@"."];
      if ([v5 length])
      {
        CFStringRef v6 = (const __CFString *)[v5 stringByAppendingFormat:@".%@", @"Enabled"];
        if ([*(id *)(v1 + 24) objectForKey:v6]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v6 = @"Enabled";
        if ([*(id *)(v1 + 24) objectForKey:@"Enabled"]) {
          goto LABEL_10;
        }
      }
      --v4;
    }
    while (![v3[v4] isEqualToString:@"tombstones"]);
    CFStringRef v6 = @"Enabled";
LABEL_10:
    uint64_t v7 = (uint64_t)[v2 integerForKey:v6];
    return v7 & ~(v7 >> 63);
  }
  return result;
}

id *sub_10002B94C(id *result, uint64_t a2)
{
  if (result) {
    return (id *)[result[3] setInteger:a2 forKey:@"Enabled"];
  }
  return result;
}

double sub_10002B968(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) doubleForKey:@"ResourceSendTimeout"];
  return result;
}

void *sub_10002B984(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    long long v2 = (void *)result[3];
    id v3 = [0 componentsSeparatedByString:@"."];
    id v4 = (char *)[v3 count];
    do
    {
      if (!v4) {
        break;
      }
      id v5 = [[objc_msgSend(v3, "subarrayWithRange:", 0, v4) componentsJoinedByString:@"."];
      if ([v5 length])
      {
        CFStringRef v6 = (const __CFString *)[v5 stringByAppendingFormat:@".%@", @"AnalyticsEnabled"];
        if ([(id)v1[3] objectForKey:v6]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v6 = @"AnalyticsEnabled";
        if ([(id)v1[3] objectForKey:@"AnalyticsEnabled"]) {
          goto LABEL_10;
        }
      }
      --v4;
    }
    while (![v3[v4] isEqualToString:@"tombstones"]);
    CFStringRef v6 = @"AnalyticsEnabled";
LABEL_10:
    return [v2 BOOLForKey:v6];
  }
  return result;
}

double sub_10002BAAC(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) doubleForKey:@"ReminderAlertThresholdSecs"];
  return result;
}

double sub_10002BAC8(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) doubleForKey:@"FirstReminderAlertThresholdSecs"];
  return result;
}

id *sub_10002BAE4(id *result)
{
  if (result) {
    return (id *)[result[3] integerForKey:@"SendResourcePriority"];
  }
  return result;
}

void *sub_10002BAFC(void *result, void *a2)
{
  if (result)
  {
    long long v2 = result;
    id v3 = (void *)result[3];
    id v4 = [a2 componentsSeparatedByString:@"."];
    id v5 = (char *)[v4 count];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = [[objc_msgSend(v4, "subarrayWithRange:", 0, v5) componentsJoinedByString:@"."];
      if ([v6 length])
      {
        CFStringRef v7 = (const __CFString *)[v6 stringByAppendingFormat:@".%@", @"ArchiveResendThresholdSecs"];
        if ([(id)v2[3] objectForKey:v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFStringRef v7 = @"ArchiveResendThresholdSecs";
        if ([(id)v2[3] objectForKey:@"ArchiveResendThresholdSecs"]) {
          goto LABEL_10;
        }
      }
      --v5;
    }
    while (![[v4 objectAtIndexedSubscript:v5] isEqualToString:@"tombstones"]);
    CFStringRef v7 = @"ArchiveResendThresholdSecs";
LABEL_10:
    return [v3 integerForKey:v7];
  }
  return result;
}

id *sub_10002BC24(id *result)
{
  if (result) {
    return (id *)[result[3] arrayForKey:@"LegacyResearchStudyBundleIDs"];
  }
  return result;
}

id *sub_10002BC3C(id *result)
{
  if (result) {
    return (id *)[result[3] stringForKey:@"LegacyResearchStudyEntitlement"];
  }
  return result;
}

id *sub_10002BC54(id *result)
{
  if (result) {
    return (id *)[result[3] integerForKey:@"PreferWifiAssertionDurationSecs"];
  }
  return result;
}

double sub_10002BC6C(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) doubleForKey:@"StateCacheSendDebounceIntervalSecs"];
  return result;
}

id *sub_10002BC88(id *result)
{
  if (result) {
    return (id *)[result[3] BOOLForKey:@"AdditionalDiagnosticsEnabled"];
  }
  return result;
}

double sub_10002BCA0(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) doubleForKey:@"TimeSyncSendDebounceIntervalSecs"];
  return result;
}

id *sub_10002BCBC(id *result)
{
  if (result) {
    return (id *)[result[3] integerForKey:@"PendingMessageResendLimit"];
  }
  return result;
}

id *sub_10002BCD4(id *result)
{
  if (result) {
    return (id *)[result[3] integerForKey:@"RTCResetTimestampThresholdSecs"];
  }
  return result;
}

id *sub_10002BCEC(id *result)
{
  if (result) {
    return (id *)[result[3] dictionaryForKey:@"AuthorizationVersions"];
  }
  return result;
}

double sub_10002BF5C(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) doubleForKey:@"TimeSyncMessageTimeoutSecs"];
  return result;
}

id *sub_10002BF78(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_alloc_init((Class)NSDateComponents);
    [v2 setWeekday:[v1[3] integerForKey:@"FaceMetricsReminderWeekday"]];
    [v2 setHour:[v1[3] integerForKey:@"FaceMetricsReminderHour"]];
    [v2 setMinute:[v1[3] integerForKey:@"FaceMetricsReminderMinute"]];
    [v2 setTimeZone:+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone")];
    return (id *)v2;
  }
  return result;
}

void sub_10002C030(id a1)
{
  qword_10006EC18 = &__NSArray0__struct;
}

uint64_t sub_10002C058(uint64_t result, void *a2, id *a3, void *a4, void *a5)
{
  if (!result) {
    return result;
  }
  Class v9 = (void *)result;
  id v10 = [a4 bundleIdForConnection:result];
  if ([a2 bundleIdentifier])
  {
    if ([a2 bundleIdentifier]) {
      goto LABEL_4;
    }
LABEL_13:
    if (a5) {
      *a5 = +[SRError authorizationError];
    }
    if (qword_10006EC20 == -1)
    {
      id v12 = qword_10006EC28;
      double result = os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }
    else
    {
      dispatch_once(&qword_10006EC20, &stru_10005D420);
      id v12 = qword_10006EC28;
      double result = os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 1026;
    unsigned int v16 = [v9 processIdentifier];
    __int16 v17 = 2114;
    id v18 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Connection %{public}@ from pid %{public}d rejected because no bundle identifier could be found for this connection. Request: %{public}@", (uint8_t *)&v13, 0x1Cu);
    return 0;
  }
  [a2 setBundleIdentifier:v10];
  if (![a2 bundleIdentifier]) {
    goto LABEL_13;
  }
LABEL_4:
  if ((objc_msgSend(objc_msgSend(a2, "bundleIdentifier"), "isEqual:", v10) & 1) != 0
    || (double result = sub_10002C300((BOOL)v9, @"com.apple.private.sensorkit.auth.request.arbitrary_bundle", 0, 0, 0, a3, a4, a5), result))
  {
    double result = sub_10002C300((BOOL)v9, @"com.apple.sensorkit.reader.allow", [a2 sensor], [a2 bundleIdentifier], @"com.apple.private.sensorkit.export.allow-all", a3, a4, a5);
    if (result)
    {
      if ([a2 conformsToProtocol:&OBJC_PROTOCOL___SRRequestRecording]
        && objc_msgSend(objc_msgSend(a2, "sensorConfiguration"), "count"))
      {
        id v11 = [a2 sensor];
        return sub_10002C300((BOOL)v9, @"com.apple.SensorKit.reader.sensor-configuration.allow", v11, 0, 0, a3, a4, a5);
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

BOOL sub_10002C300(BOOL result, void *a2, void *a3, void *a4, uint64_t a5, id *a6, void *a7, void *a8)
{
  if (!result) {
    return result;
  }
  __int16 v15 = (void *)result;
  if ((sub_10002A018((unint64_t)a6) & 1) == 0)
  {
    if (!a8) {
      return 0;
    }
    uint64_t v25 = 4098;
LABEL_28:
    id v24 = +[SRError authorizationErrorWithStatus:v25];
    goto LABEL_29;
  }
  if ((sub_10002A140((unint64_t)a6) & 1) == 0)
  {
    if (!a8) {
      return 0;
    }
    uint64_t v25 = 4097;
    goto LABEL_28;
  }
  id v16 = [a3 sr_sensorByDeletingDeletionRecord];
  unsigned int v17 = [a2 isEqualToString:@"com.apple.sensorkit.reader.allow"];
  if ((objc_msgSend(v15, "_sr_hasEntitlement:sensor:valueProvider:", a2, v16, a7) & 1) == 0)
  {
    id v18 = v17 ? @"com.apple.developer.sensorkit.reader.allow" : 0;
    if ((objc_msgSend(v15, "_sr_hasEntitlement:sensor:valueProvider:", v18, v16, a7) & 1) == 0)
    {
      if (a8) {
        *a8 = +[SRError invalidEntitlementError];
      }
      if (qword_10006EC20 == -1)
      {
        id v27 = qword_10006EC28;
        double result = os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
      }
      else
      {
        dispatch_once(&qword_10006EC20, &stru_10005D420);
        id v27 = qword_10006EC28;
        double result = os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
      }
      *(_DWORD *)long long buf = 138543874;
      Class v31 = v15;
      __int16 v32 = 1026;
      LODWORD(v33[0]) = [v15 processIdentifier];
      WORD2(v33[0]) = 2114;
      *(void *)((char *)v33 + 6) = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Connection %{public}@ from pid %{public}d rejected for lacking entitlement for %{public}@", buf, 0x1Cu);
      return 0;
    }
  }
  if (objc_msgSend(a2, "isEqualToString:", @"com.apple.private.sensorkit.diagnostics.allow", @"com.apple.developer.sensorkit.reader.allow"))
  {
    unsigned int v19 = [@"com.apple.private.sensorkit.debugging.allow" isEqualToString:@"com.apple.sensorkit.reader.allow"];
    if ((objc_msgSend(v15, "_sr_hasEntitlement:sensor:valueProvider:", @"com.apple.private.sensorkit.debugging.allow", v16, a7) & 1) == 0)
    {
      uint64_t v20 = v19 ? v29 : 0;
      if ((objc_msgSend(v15, "_sr_hasEntitlement:sensor:valueProvider:", v20, v16, a7) & 1) == 0
        && (sub_10002BC88(a6) & 1) == 0)
      {
        if (qword_10006EC20 == -1)
        {
          uint64_t v28 = qword_10006EC28;
          if (!os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
        }
        else
        {
          dispatch_once(&qword_10006EC20, &stru_10005D420);
          uint64_t v28 = qword_10006EC28;
          if (!os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_ERROR))
          {
LABEL_38:
            if (a8)
            {
LABEL_39:
              id v24 = +[SRError invalidEntitlementError];
              goto LABEL_29;
            }
            return 0;
          }
        }
        *(_DWORD *)long long buf = 138543618;
        Class v31 = v15;
        __int16 v32 = 1026;
        LODWORD(v33[0]) = [v15 processIdentifier];
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Connection %{public}@ from pid %{public}d rejected because additional diagnostics are not enabled", buf, 0x12u);
        if (a8) {
          goto LABEL_39;
        }
        return 0;
      }
    }
  }
  if (!a4) {
    return 1;
  }
  unsigned __int8 v21 = [a7 isAuthorizedForSensor:v16 bundleIdentifier:a4];
  id v22 = [a7 valueForEntitlement:a5 connection:v15];
  double result = 1;
  if ((v21 & 1) == 0 && !v22)
  {
    if (qword_10006EC20 == -1)
    {
      uint64_t v23 = qword_10006EC28;
      if (!os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
    }
    else
    {
      dispatch_once(&qword_10006EC20, &stru_10005D420);
      uint64_t v23 = qword_10006EC28;
      if (!os_log_type_enabled((os_log_t)qword_10006EC28, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:
        if (a8)
        {
          id v24 = +[SRError authorizationError];
LABEL_29:
          id v26 = v24;
          double result = 0;
          *a8 = v26;
          return result;
        }
        return 0;
      }
    }
    *(_DWORD *)long long buf = 138543618;
    Class v31 = a4;
    __int16 v32 = 2114;
    v33[0] = v16;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ isn't authorized for %{public}@", buf, 0x16u);
    goto LABEL_22;
  }
  return result;
}

void sub_10002CA54(id a1)
{
  qword_10006EC28 = (uint64_t)os_log_create("com.apple.SensorKit", "NSXPCConnection+Valdiation");
}

void *sub_10002CD44(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDPruner;
  id v3 = [super init];
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

BOOL sub_10002CE10(uint64_t a1, id *a2, double a3, double a4)
{
  if (!a1) {
    return a1 != 0;
  }
  id v7 = sub_10000CC60([RDPruneableDatastore alloc], *(void ***)(a1 + 8));
  uint64_t v40 = 0;
  long long v41 = (double *)&v40;
  uint64_t v42 = 0x2020000000;
  double v43 = a3;
  id v39 = 0;
  while (v41[3] < a4)
  {
    double v9 = v41[3];
    if (v9 == a3)
    {
      id v10 = sub_10000DF78((uint64_t)v7, &v39, v9);
    }
    else
    {
      id v11 = [(NSURL *)sub_10001BFB4(v9) lastPathComponent];
      id v10 = sub_10000E038((uint64_t)v7, v11, &v39);
    }
    id v12 = v10;
    if (v39)
    {
      id v13 = v39;
    }
    else
    {
      id v15 = [(NSDictionary *)v10 objectForKeyedSubscript:@"samples"];
      if (v15)
      {
        unsigned int v17 = [SRDefaults alloc];
        id v18 = *(void **)(a1 + 8);
        if (v18)
        {
          id Property = (NSDictionary *)objc_getProperty(v18, v16, 16, 1);
          unsigned __int8 v21 = *(void **)(a1 + 8);
          if (v21) {
            id v22 = objc_getProperty(v21, v19, 24, 1);
          }
          else {
            id v22 = 0;
          }
        }
        else
        {
          id Property = 0;
          id v22 = 0;
        }
        uint64_t v23 = sub_10002B204(Property, v22);
        id v24 = sub_100042C68(v17, v23);
        uint64_t v25 = [SRDatastore alloc];
        id v26 = [(NSDictionary *)v12 objectForKeyedSubscript:@"metadata"];
        id v27 = [(NSDictionary *)v12 objectForKeyedSubscript:@"sensorConfiguration"];
        if (v25) {
          uint64_t v28 = sub_1000405A0(v25, v15, v26, v27, 2, (uint64_t)v24);
        }
        else {
          uint64_t v28 = 0;
        }
        uint64_t v35 = 0;
        uint64_t v36 = &v35;
        uint64_t v37 = 0x2020000000;
        char v38 = 0;
        double v29 = v41[3];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10002D1A4;
        v34[3] = &unk_10005D490;
        v34[4] = &v40;
        v34[5] = &v35;
        sub_100040F88(v28, (uint64_t)v34, v29, a4);
        if (!*((unsigned char *)v36 + 24)) {
          v41[3] = a4;
        }

        _Block_object_dispose(&v35, 8);
        char v14 = 1;
        goto LABEL_19;
      }
    }
    char v14 = 0;
LABEL_19:
    if ((v14 & 1) == 0) {
      break;
    }
  }

  id v30 = v39;
  if (a2) {
    *a2 = v39;
  }
  id v31 = v30;
  _Block_object_dispose(&v40, 8);
  return a1 != 0;
}

void sub_10002D0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002D144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002D1A4(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

CFStringRef sub_10002D2CC(uint64_t a1)
{
  if (a1 >= 4096)
  {
    if (os_variant_has_internal_content())
    {
      if (a1 >= 12288)
      {
        switch(a1)
        {
          case 12288:
            CFStringRef result = @"Writer Not Monitoring";
            break;
          case 12289:
            CFStringRef result = @"Writer Not Authorized";
            break;
          case 12290:
            CFStringRef result = @"Writer Input was invalid";
            break;
          case 12291:
            CFStringRef result = @"No available memory mapped to write sample";
            break;
          case 12292:
            CFStringRef result = @"Provided sample is out of order from previous samples";
            break;
          case 12293:
            CFStringRef result = @"Provided sample is too large";
            break;
          case 12294:
            CFStringRef result = @"Framework datastore state is invalid";
            break;
          case 12295:
            CFStringRef result = @"Writer does not have explicit authorization";
            break;
          case 12296:
            CFStringRef result = @"Provided sample is from the future";
            break;
          default:
            if ((unint64_t)(a1 - 20480) < 5 || a1 != 0x4000) {
              return 0;
            }
            CFStringRef result = @"Sensor Configuration is invalid";
            break;
        }
        return result;
      }
      if (a1 >= 0x2000)
      {
        switch(a1)
        {
          case 8192:
            CFStringRef result = @"No space available to write samples";
            break;
          case 8193:
            CFStringRef result = @"Connection Not Found";
            break;
          case 8194:
            CFStringRef result = @"Internal Error";
            break;
          case 8195:
            CFStringRef result = @"Prompt Busy";
            break;
          case 8196:
            CFStringRef result = @"Prompt is cancelled";
            break;
          case 8198:
            CFStringRef result = @"No device identifier could be found";
            break;
          case 8199:
            CFStringRef result = @"Time synchronization state is invalid";
            break;
          case 8200:
            CFStringRef result = @"The requested bundle authorization is being requested for could not be found";
            break;
          case 8201:
            CFStringRef result = @"No new authorization groups were requested";
            break;
          default:
            return 0;
        }
        return result;
      }
      switch(a1)
      {
        case 4096:
          return @"Required app is not installed";
        case 4097:
          return @"Required onboarding not completed";
        case 4098:
          return @"Global setting not enabled";
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 0:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorInvalidEntitlement";
      break;
    case 1:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorNoAuthorization";
      break;
    case 2:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorDataInaccessible";
      break;
    case 3:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorFetchRequestInvalid";
      break;
    case 4:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorPromptDeclined";
      break;
    default:
      return 0;
  }

  return (const __CFString *)[(NSBundle *)v3 localizedStringForKey:v4 value:&stru_10005E2D0 table:0];
}

void *sub_10002DA28(void *a1, void *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)RDCacheDelete;
  id v5 = [super init];
  id v7 = v5;
  if (v5)
  {
    objc_setProperty_nonatomic(v5, v6, a2, 32);
    objc_setProperty_nonatomic(v7, v8, a3, 24);
  }
  return v7;
}

void sub_10002DB18(uint64_t a1)
{
  if (a1)
  {
    int v1 = CacheDeleteRegisterInfoCallbacks();
    if (v1 < 0)
    {
      int v2 = v1;
      id v3 = qword_10006EC38;
      if (os_log_type_enabled((os_log_t)qword_10006EC38, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 67240192;
        int v5 = v2;
        _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to register for CacheDelete. %{public}d", buf, 8u);
      }
    }
  }
}

NSDictionary *sub_10002DC78(uint64_t a1, int a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (a2 - 1);
  if (v4 < 4) {
    __darwin_ino64_t v5 = v4 + 1;
  }
  else {
    __darwin_ino64_t v5 = 0;
  }
  CFStringRef result = sub_10002DCC0(v3, v5, a3, 1);
  if (result)
  {
    return (NSDictionary *)CFRetain(result);
  }
  return result;
}

NSDictionary *sub_10002DCC0(uint64_t a1, __darwin_ino64_t a2, void *a3, uint64_t a4)
{
  if (!a1) {
    return 0;
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v7 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  SEL v8 = qword_10006EC38;
  if (os_log_type_enabled((os_log_t)qword_10006EC38, OS_LOG_TYPE_INFO))
  {
    buf.st_dev = 138543874;
    *(void *)&buf.st_mode = v7;
    WORD2(buf.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = a2;
    HIWORD(buf.st_gid) = 1026;
    buf.st_rdev = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CacheDelete purgeable for volume %{public}@ with urgency %ld dryRun %{public, BOOL}d", (uint8_t *)&buf, 0x1Cu);
  }
  double v9 = [(NSURL *)sub_10001B4B8(*(void *)(a1 + 32)) path];
  if (!v7
    || (objc_super v10 = v9,
        memset(&buf, 0, sizeof(buf)),
        stat((const char *)[v7 fileSystemRepresentation], &buf) < 0)
    || (memset(&v26, 0, sizeof(v26)),
        stat([(NSString *)v10 fileSystemRepresentation], &v26) < 0)
    || buf.st_dev != v26.st_dev)
  {
    uint64_t v12 = qword_10006EC38;
    if (os_log_type_enabled((os_log_t)qword_10006EC38, OS_LOG_TYPE_INFO))
    {
      id v13 = [(NSURL *)sub_10001B4B8(*(void *)(a1 + 32)) path];
      buf.st_dev = 138543618;
      *(void *)&buf.st_mode = v7;
      WORD2(buf.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Volume doesn't match %{public}@ %{public}@", (uint8_t *)&buf, 0x16u);
    }
  }
  else
  {
    id v11 = *(NSObject **)(a1 + 24);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10002E160;
    v20[3] = &unk_10005D540;
    void v20[4] = a1;
    v20[5] = &v22;
    v20[6] = a2;
    char v21 = a4;
    dispatch_async_and_wait(v11, v20);
    [objc_loadWeak((id *)(a1 + 16)) cacheDelete:a1 purgeWithUrgency:a2 dryRun:a4];
  }
  if (a4) {
    uint64_t v14 = v23[3];
  }
  else {
    uint64_t v14 = 0;
  }
  v27[0] = @"CACHE_DELETE_VOLUME";
  v27[1] = @"CACHE_DELETE_AMOUNT";
  v28[0] = v7;
  v28[1] = +[NSNumber numberWithLongLong:v14];
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v16 = qword_10006EC38;
  if (os_log_type_enabled((os_log_t)qword_10006EC38, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = "purged";
    __darwin_ino64_t v18 = v23[3];
    if (a4) {
      uint64_t v17 = "could purge";
    }
    buf.st_dev = 136315650;
    *(void *)&buf.st_mode = v17;
    WORD2(buf.st_ino) = 2050;
    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v18;
    HIWORD(buf.st_gid) = 2114;
    *(void *)&buf.st_rdev = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Telling CacheDelete we %s %{public}lld %{public}@", (uint8_t *)&buf, 0x20u);
  }
  _Block_object_dispose(&v22, 8);
  return v15;
}

void sub_10002E030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002E048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002E060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSDictionary *sub_10002E078(uint64_t a1, int a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (a2 - 1);
  if (v4 < 4) {
    __darwin_ino64_t v5 = v4 + 1;
  }
  else {
    __darwin_ino64_t v5 = 0;
  }
  CFStringRef result = sub_10002DCC0(v3, v5, a3, 0);
  if (result)
  {
    return (NSDictionary *)CFRetain(result);
  }
  return result;
}

__CFDictionary *__cdecl sub_10002E0C4(id a1, int a2, __CFDictionary *a3)
{
  v4[0] = @"CACHE_DELETE_VOLUME";
  v4[1] = @"CACHE_DELETE_AMOUNT";
  v5[0] = [(__CFDictionary *)a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v5[1] = &off_1000612C0;
  CFStringRef result = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  if (result) {
    return (__CFDictionary *)CFRetain(result);
  }
  return result;
}

id sub_10002E160(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Weak = objc_loadWeak((id *)(v2 + 8));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
    id Weak = 0;
  }
  id result = [Weak cacheDelete:v4 purgeWithUrgency:*(void *)(a1 + 48) dryRun:*(unsigned __int8 *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

NSDictionary *sub_10002E1F4(uint64_t a1)
{
  int v1 = +[NSMutableDictionary dictionaryWithDictionary:a1];
  uint64_t v2 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v3 = qword_10006EC90;
  double v4 = *(double *)&qword_10006EC98;
  double v5 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v3 >= v2) {
    double v6 = -v6;
  }
  double v7 = v5 + v4 + v6;
  double Current = CFAbsoluteTimeGetCurrent();
  [(NSMutableDictionary *)v1 setObject:+[NSNumber numberWithDouble:v7] forKeyedSubscript:@"RDAnalyticsSRAbsoluteTimeKey"];
  [(NSMutableDictionary *)v1 setObject:+[NSNumber numberWithDouble:Current] forKeyedSubscript:@"RDAnalyticsCFAbsoluteTimeKey"];

  return +[NSDictionary dictionaryWithDictionary:v1];
}

NSBundle *sub_10002EEA4(uint64_t a1, _OWORD *a2)
{
  self;
  long long v3 = a2[1];
  v12[0] = *a2;
  v12[1] = v3;
  id result = (NSBundle *)sub_10001D868((uint64_t)NSURL, v12);
  if (result)
  {
    double v5 = result;
    id v6 = (id)_CFBundleCopyBundleURLForExecutableURL();
    if (v6)
    {
      id v7 = v6;
      id result = +[NSBundle bundleWithURL:v6];
      if (result) {
        return result;
      }
      if (qword_10006EC50 != -1)
      {
        dispatch_once(&qword_10006EC50, &stru_10005D678);
        uint64_t v8 = qword_10006EC48;
        if (!os_log_type_enabled((os_log_t)qword_10006EC48, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        goto LABEL_6;
      }
      uint64_t v8 = qword_10006EC48;
      if (os_log_type_enabled((os_log_t)qword_10006EC48, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        LODWORD(v12[0]) = 138543362;
        *(void *)((char *)v12 + 4) = v7;
        double v9 = "Could not create bundle for bundle URL %{public}@";
        objc_super v10 = v8;
LABEL_13:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)v12, 0xCu);
      }
      return 0;
    }
    if (qword_10006EC50 == -1)
    {
      uint64_t v11 = qword_10006EC48;
      if (!os_log_type_enabled((os_log_t)qword_10006EC48, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EC50, &stru_10005D678);
      uint64_t v11 = qword_10006EC48;
      if (!os_log_type_enabled((os_log_t)qword_10006EC48, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    LODWORD(v12[0]) = 138543362;
    *(void *)((char *)v12 + 4) = v5;
    double v9 = "Could not get bundle URL for executable URL %{public}@";
    objc_super v10 = v11;
    goto LABEL_13;
  }
  return result;
}

void sub_10002F054(id a1)
{
  qword_10006EC48 = (uint64_t)os_log_create("com.apple.SensorKit", "NSBundleSKInternal");
}

uint64_t sub_10002F190(uint64_t a1, dispatch_queue_t queue)
{
  uint64_t v2 = a1;
  if (!a1) {
    return v2;
  }
  dispatch_assert_queue_V2(queue);
  long long v3 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
  {
    double v4 = [+[NSBundle mainBundle] bundleIdentifier];
    uint64_t v5 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v6 = qword_10006EC90;
    double v7 = *(double *)&qword_10006EC98;
    double v8 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v6 >= v5) {
      double v9 = -v9;
    }
    *(_DWORD *)stat buf = 138543618;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&unsigned char buf[12] = 2050;
    *(double *)&buf[14] = v8 + v7 + v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting %{public}@, Current Time: %{public}f", buf, 0x16u);
  }
  objc_super v10 = objc_alloc_init(RDFileURLs);
  id v101 = +[SRAuthorizationStore allSensorsStore];
  uint64_t v11 = sub_100027B48([RDStateCache alloc], v10, v101);
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = *((void *)v11 + 5);
    qword_10006ECA0 = v13;
    uint64_t v14 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v13 = 0;
    qword_10006ECA0 = 0;
    uint64_t v14 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
  }
  uint64_t v15 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v16 = qword_10006EC90;
  double v17 = *(double *)&qword_10006EC98;
  double v18 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v16 >= v15) {
    double v19 = -v19;
  }
  *(_DWORD *)stat buf = 134218240;
  *(void *)&uint8_t buf[4] = v13;
  *(_WORD *)&unsigned char buf[12] = 2050;
  *(double *)&buf[14] = v18 + v17 + v19;
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Initialized SRAbsoluteTime with cached remote offset. RemoteRTCOffset: %f, Current Time: %{public}f", buf, 0x16u);
LABEL_15:
  uint64_t v20 = objc_alloc_init(RDDefaults);
  char v21 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceServerReading];
  [(NSXPCInterface *)v21 setClasses:+[NSSet setWithObject:objc_opt_class()] forSelector:"requestFileHandleForReading:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v21 setClasses:+[NSSet setWithObject:objc_opt_class()] forSelector:"requestFileHandleForReading:afterSegment:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v21 setClasses:+[NSSet setWithObject:objc_opt_class()] forSelector:"startRecording:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v21 setClasses:+[NSSet setWithObject:objc_opt_class()] forSelector:"stopRecording:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v21 setClasses:+[NSSet setWithObject:objc_opt_class()] forSelector:"fetchAllDevices:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v21 setClasses:+[NSSet setWithObject:objc_opt_class()] forSelector:"fetchReaderMetadata:reply:" argumentIndex:0 ofReply:0];
  uint64_t v22 = sub_100008B48((id *)[RDListener alloc], @"com.apple.SensorKit.reader", +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceClientReading], v21, (void *)v2, (void *)0xFFFFFFFFFFFFFFFFLL, queue, v12);
  long long v109 = sub_100008B48((id *)[RDListener alloc], @"com.apple.SensorKit.writer", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SRSensorKitServiceClientWriting), +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceServerWriting], (void *)v2, (void *)1, queue, v12);
  id v108 = sub_100008B48((id *)[RDListener alloc], @"com.apple.SensorKit.pruner", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SRSensorKitServiceClientPruning), +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceServerPruning], (void *)v2, (void *)1, queue, v12);
  id v107 = sub_100008B48((id *)[RDListener alloc], @"com.apple.SensorKit.debugging", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SRSensorKitServiceClientDebugging), +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceServerDebugging], (void *)v2, (void *)1, queue, v12);
  uint64_t v23 = v101;
  id v106 = sub_10003A160([RDAuthorizationBroadcaster alloc], queue, v20, v12, v101);
  long long v111 = sub_100002560([RDClientInterestCache alloc], v10);
  v105 = sub_100026C0C([RDLaunchEvents alloc], queue, v10, v20);
  long long v110 = 0;
  if (sub_10002B984(v20))
  {
    uint64_t v24 = (id *)sub_10003E1E0([RDAnalyticsEventListener alloc], v12);
    if (v24)
    {
      long long v110 = v24;
      objc_storeWeak(v24 + 2, (id)v2);
    }
    else
    {
      long long v110 = 0;
    }
  }
  id v104 = sub_10002DA28([RDCacheDelete alloc], v10, queue);
  id v103 = sub_10001EDDC([RDNotifier alloc], v20, v12, v111, v101, (uint64_t)queue);
  dispatch_assert_queue_V2(queue);
  v113.receiver = (id)v2;
  v113.super_class = (Class)RDDaemon;
  id v25 = [super init];
  uint64_t v2 = (uint64_t)v25;
  if (!v25) {
    goto LABEL_101;
  }
  objc_setProperty_nonatomic(v25, v26, v20, 56);
  objc_setProperty_nonatomic((id)v2, v27, v12, 104);
  objc_setProperty_nonatomic((id)v2, v28, v10, 64);
  uint64_t v29 = *(void *)(v2 + 104);
  if (!v29)
  {
    id v30 = 0;
    p_cb = (_DWORD *)(&OBJC_PROTOCOL___CBPeripheralDelegate + 64);
    self;
    __int16 v32 = (void *)qword_10006ECB0;
    if (!qword_10006ECB0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v30 = *(void **)(v29 + 72);
  p_cb = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
  self;
  __int16 v32 = (void *)qword_10006ECB0;
  if ((void *)qword_10006ECB0 != v30)
  {
LABEL_21:

    qword_10006ECB0 = v30;
  }
LABEL_22:
  uint64_t v33 = *(void *)(v2 + 104);
  id v98 = v20;
  id v99 = v12;
  v100 = v10;
  if (v33 && *(void *)(v33 + 24) == 140000) {
    goto LABEL_51;
  }
  id v34 = *((void *)p_cb + 395);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Migrating legacy defaults", buf, 2u);
  }
  uint64_t v35 = *(void *)(v2 + 56);
  if (!v35)
  {
    id v97 = v22;
    [0 doubleForKey:@"LastTimeReminderAlertShown"];
    uint64_t v37 = *(void *)(v2 + 104);
    if (!v37) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  id v97 = v22;
  [*(id *)(v35 + 24) doubleForKey:@"LastTimeReminderAlertShown"];
  uint64_t v37 = *(void *)(v2 + 104);
  if (v37)
  {
LABEL_28:
    *(void *)(v37 + 8) = v36;
    sub_1000283D8(v37);
  }
LABEL_29:
  id v38 = +[NSMutableDictionary dictionary];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = [*(id *)(v2 + 112) readerAuthorizationGroups];
  id v39 = [obj countByEnumeratingWithState:&v114 objects:buf count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v115;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v115 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = *(void *)(*((void *)&v114 + 1) + 8 * i);
        double v45 = +[NSString stringWithFormat:@"%@.ServiceStartTime", v43];
        uint64_t v46 = *(void *)(v2 + 56);
        if (v46)
        {
          id v47 = [*(id *)(v46 + 24) objectForKey:v45];
          if (!v47) {
            goto LABEL_38;
          }
LABEL_37:
          [v38 setObject:v47 forKeyedSubscript:v43];
          goto LABEL_38;
        }
        id v47 = [0 objectForKey:v45];
        if (v47) {
          goto LABEL_37;
        }
LABEL_38:
        uint64_t v48 = *(void *)(v2 + 56);
        if (v48) {
          objc_super v49 = *(void **)(v48 + 24);
        }
        else {
          objc_super v49 = 0;
        }
        [v49 removeObjectForKey:v45];
      }
      id v40 = [obj countByEnumeratingWithState:&v114 objects:buf count:16];
    }
    while (v40);
  }
  uint64_t v50 = *(void *)(v2 + 104);
  uint64_t v22 = v97;
  uint64_t v23 = v101;
  if (v50)
  {
    id v51 = *(id *)(v50 + 48);
    if (v51 != v38)
    {
      *(void *)(v50 + 48) = v38;
    }
    sub_1000283D8(v50);
    uint64_t v52 = *(void *)(v2 + 104);
    if (v52)
    {
      *(void *)(v52 + 24) = 140000;
      sub_1000283D8(v52);
    }
  }
  sub_100029D6C(*(id **)(v2 + 56));
  p_cb = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
LABEL_51:
  uint64_t v53 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v54 = qword_10006EC90;
  double v55 = *(double *)&qword_10006EC98;
  double v56 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  uint64_t v58 = *(void *)(v2 + 104);
  if (v58)
  {
    if (v54 >= v53) {
      double v57 = -v57;
    }
    *(double *)(v58 + 16) = v56 + v55 + v57 - *(double *)(v58 + 40);
    sub_1000283D8(v58);
  }
  long long v59 = *((void *)p_cb + 395);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v61 = *(void *)(v2 + 104);
    *(_DWORD *)stat buf = 138543362;
    *(void *)&uint8_t buf[4] = v61;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Cached State: %{public}@", buf, 0xCu);
  }
  objc_setProperty_nonatomic((id)v2, v60, queue, 48);
  *(void *)(v2 + 128) = v22;
  *(void *)(v2 + 136) = v109;
  *(void *)(v2 + 144) = v108;
  objc_setProperty_nonatomic((id)v2, v62, v103, 96);
  *(void *)(v2 + 152) = v107;
  objc_setProperty_nonatomic((id)v2, v63, v106, 24);
  uint64_t v65 = *(void *)(v2 + 24);
  if (v65) {
    objc_storeWeak((id *)(v65 + 24), (id)v2);
  }
  objc_setProperty_nonatomic((id)v2, v64, v23, 112);
  [*(id *)(v2 + 112) addReaderAuthorizationDelegate:v2];
  objc_setProperty_nonatomic((id)v2, v66, v111, 32);
  objc_setProperty_nonatomic((id)v2, v67, 0, 16);
  objc_setProperty_nonatomic((id)v2, v68, 0, 88);
  objc_setProperty_nonatomic((id)v2, v69, v105, 40);
  uint64_t v71 = *(void *)(v2 + 40);
  if (v71) {
    objc_storeWeak((id *)(v71 + 8), (id)v2);
  }
  objc_setProperty_nonatomic((id)v2, v70, v110, 80);
  objc_setProperty_nonatomic((id)v2, v72, v104, 120);
  uint64_t v73 = *(void *)(v2 + 120);
  if (v73)
  {
    objc_storeWeak((id *)(v73 + 8), (id)v2);
    uint64_t v74 = *(void *)(v2 + 120);
    uint64_t v75 = (id *)(v2 + 80);
    if (v74) {
      objc_storeWeak((id *)(v74 + 16), *v75);
    }
    unint64_t v76 = *((void *)p_cb + 395);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v75 = (id *)(v2 + 80);
    unint64_t v76 = *((void *)p_cb + 395);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
LABEL_67:
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Verifying datastore for RTC rollback", buf, 2u);
    }
  }
  if (sub_1000282D0(*(double **)(v2 + 104)))
  {
    id v77 = *((void *)p_cb + 395);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "RTC has rolled back!! Removing existing datastore", buf, 2u);
    }
    sub_100036484(v2, (const char *)4, 4096);
    sub_10001EDA0();
  }
  id v78 = v22;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 48));
  v79 = sub_100039F34(*(void **)(v2 + 64), *(void **)(v2 + 56));
  id v80 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v79);
  id v81 = v80;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  if (v80)
  {
    long long v82 = sub_10000ED28(v80, 0);
    id v83 = [v82 countByEnumeratingWithState:&v114 objects:buf count:16];
    if (v83) {
      goto LABEL_74;
    }
  }
  else
  {
    long long v82 = 0;
    id v83 = [0 countByEnumeratingWithState:&v114 objects:buf count:16];
    if (v83)
    {
LABEL_74:
      id v84 = v83;
      uint64_t v85 = *(void *)v115;
      do
      {
        for (j = 0; j != v84; j = (char *)j + 1)
        {
          if (*(void *)v115 != v85) {
            objc_enumerationMutation(v82);
          }
          id v87 = *(void **)(*((void *)&v114 + 1) + 8 * (void)j);
          id v88 = [[objc_msgSend((id)v2, "authorizedAndInterestedClientsForSensor:", v87) count];
          if (objc_msgSend(sub_100009728(*(void *)(v2 + 136), (uint64_t)v87), "count")) {
            BOOL v89 = 1;
          }
          else {
            BOOL v89 = v88 == 0;
          }
          if (!v89) {
            sub_10001EB1C((uint64_t)RDNotifier, 1, v87);
          }
        }
        id v84 = [v82 countByEnumeratingWithState:&v114 objects:buf count:16];
      }
      while (v84);
    }
  }

  if (!*(void *)(v2 + 88))
  {
    *(void *)(v2 + 88) = sub_1000249A0([RDGizmoSyncService alloc], *(void **)(v2 + 64), *(void **)(v2 + 56), *(NSObject **)(v2 + 48), 1);
    if (sub_10002B984(*(void **)(v2 + 56)))
    {
      uint64_t v90 = *(void *)(v2 + 88);
      if (v90) {
        [*(id *)(v90 + 56) addObject:*v75];
      }
    }
  }
  __int16 v91 = *(void **)(v2 + 16);
  uint64_t v20 = v98;
  uint64_t v12 = v99;
  uint64_t v22 = v78;
  objc_super v10 = v100;
  if (!v91)
  {
    id v92 = sub_10001CF14(*(void **)(v2 + 88), *(void *)(v2 + 48), *(void **)(v2 + 64), *(void **)(v2 + 56), *(void **)(v2 + 104));
    *(void *)(v2 + 16) = v92;
    [v92 setDelegate:v2];
    id v93 = sub_100002C7C([RDIDSMessageEventListener alloc], *(void **)(v2 + 64), *(void **)(v2 + 56));
    *(void *)(v2 + 72) = v93;
    uint64_t v94 = *(void *)(v2 + 88);
    if (v94) {
      [*(id *)(v94 + 56) addObject:v93];
    }
    __int16 v91 = *(void **)(v2 + 16);
  }
  [v91 validatePreferWifiAssertion];
  *(void *)stat buf = @"com.apple.sensorkit.removeOldData";
  *(void *)&uint8_t buf[8] = @"com.apple.sensorkit.gcKeys";
  *(void *)&uint8_t buf[16] = @"com.apple.sensorkit.postMetric";
  CFStringRef v119 = @"com.apple.sensorkit.syncCompanionStateToGizmo";
  CFStringRef v120 = @"com.apple.sensorkit.syncCompanionStateToGizmoLocked";
  id v95 = +[NSArray arrayWithObjects:buf count:5];
  sub_10002DB18(*(void *)(v2 + 120));
  [*(id *)(v2 + 40) registerForXPCEvent:@"com.apple.notifyd.matching"];
  [*(id *)(v2 + 40) registerForXPCActivities:v95];
LABEL_101:
  if (v22) {
    [v22[8] resume];
  }
  if (v109) {
    [v109[8] resume];
  }
  if (v108) {
    [v108[8] resume];
  }
  if (v107) {
    [v107[8] resume];
  }

  return v2;
}

void sub_1000304CC(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v2 = a1;
    if (!sub_10001B4B8(*(void *)(a1 + 64)))
    {
      unint64_t v44 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        double v45 = "No top level directory found, no need to continue";
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 2u);
      }
LABEL_61:
      [a2 markCompleted];
      return;
    }
    uint64_t v3 = *(void *)(v2 + 88);
    if (!v3 || !*(void *)(v3 + 16))
    {
      uint64_t v46 = *(void *)(v2 + 104);
      if (!v46 || *(double *)(v46 + 32) == 0.0)
      {
        unint64_t v44 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          double v45 = "Unable to garbage collect keys because time hasn't synced with companion";
          goto LABEL_60;
        }
        goto LABEL_61;
      }
    }
    uint64_t v4 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v5 = qword_10006EC90;
    double v6 = *(double *)&qword_10006EC98;
    double v7 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v5 >= v4) {
      double v9 = -v8;
    }
    else {
      double v9 = v8;
    }
    objc_super v10 = sub_10002BCD4(*(id **)(v2 + 56));
    uint64_t v11 = sub_100039F34(*(void **)(v2 + 64), *(void **)(v2 + 56));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v47 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v11);
    id obj = sub_10000ED28(v47, 1);
    id v51 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (!v51)
    {
LABEL_52:

      goto LABEL_61;
    }
    double v12 = v7 + v6 + v9 + (double)(uint64_t)v10;
    uint64_t v50 = *(void *)v60;
    uint64_t v49 = v2;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v60 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
        if ([a2 deferIfNeeded])
        {

          return;
        }
        context = v15;
        uint64_t v16 = mach_continuous_time();
        if (qword_10006EC88 != -1) {
          dispatch_once(&qword_10006EC88, &stru_10005CDC0);
        }
        unint64_t v17 = qword_10006EC90;
        double v18 = *(double *)&qword_10006EC98;
        double v19 = *(double *)&qword_10006ECA0;
        TMConvertTicksToSeconds();
        if (v17 >= v16) {
          double v21 = -v20;
        }
        else {
          double v21 = v20;
        }
        uint64_t v22 = sub_10002A77C(*(void *)(v2 + 56), v14);
        self;
        uint64_t v23 = sub_100039FA8(v14, (void *)qword_10006ECB0, *(void **)(v2 + 64), *(void **)(v2 + 56));
        uint64_t v24 = sub_100012F98([RDEncryptingDatastore alloc], v23);
        stat v26 = +[NSString stringWithFormat:@"%@.", v14];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v54 = v13;
        if (v24)
        {
          SEL v27 = (void *)v24[1];
          SEL v28 = (void *)v24[2];
          if (v27) {
            id Property = objc_getProperty(v27, v25, 24, 1);
          }
          else {
            id Property = 0;
          }
          id v30 = [v28 keyNamesForSensor:Property];
          id v31 = [v30 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v31)
          {
LABEL_26:
            id v32 = v31;
            double v33 = fmax(v19 + v18 + v21 - (double)(unint64_t)v22, 0.0);
            uint64_t v34 = *(void *)v56;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v56 != v34) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v36 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                [objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v36, "stringByReplacingOccurrencesOfString:withString:", v26, &stru_10005E2D0), "componentsSeparatedByString:", @"_"), "lastObject"), "doubleValue"];
                if (v37 == 0.0)
                {
                  id v38 = qword_10006EC58;
                  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)stat buf = 138543362;
                    long long v64 = v36;
                    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Unable to determine file age of key %{public}@", buf, 0xCu);
                  }
                  continue;
                }
                if (v37 < v33 || v37 > v12)
                {
                  if (v37 >= v33)
                  {
                    if (v37 > v12)
                    {
                      uint64_t v43 = qword_10006EC58;
                      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)stat buf = 138543618;
                        long long v64 = v36;
                        __int16 v65 = 2048;
                        double v66 = v12;
                        uint64_t v41 = v43;
                        uint64_t v42 = "Removing key %{public}@ because it is too new (< %f secs))";
LABEL_45:
                        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);
                      }
                    }
                  }
                  else
                  {
                    uint64_t v40 = qword_10006EC58;
                    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)stat buf = 138543618;
                      long long v64 = v36;
                      __int16 v65 = 2048;
                      double v66 = v33;
                      uint64_t v41 = v40;
                      uint64_t v42 = "Removing key %{public}@ because it is too old (> %f secs))";
                      goto LABEL_45;
                    }
                  }
                  if (v24)
                  {
                    [(id)qword_10006ECA8 removeFromKeychain:v36];
                    [(id)v24[2] removeFromKeychain:v36];
                  }
                  continue;
                }
              }
              id v32 = [v30 countByEnumeratingWithState:&v55 objects:v67 count:16];
            }
            while (v32);
          }
        }
        else
        {
          id v30 = 0;
          id v31 = [0 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v31) {
            goto LABEL_26;
          }
        }

        uint64_t v13 = v54 + 1;
        uint64_t v2 = v49;
      }
      while ((id)(v54 + 1) != v51);
      id v51 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (!v51) {
        goto LABEL_52;
      }
    }
  }
}

void sub_100030AD8(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  uint64_t v6 = sub_10002A58C(*(void *)(a1 + 56), a2);
  uint64_t v7 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v8 = qword_10006EC90;
  double v9 = *(double *)&qword_10006EC98;
  double v10 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v8 >= v7) {
    double v12 = -v11;
  }
  else {
    double v12 = v11;
  }
  uint64_t v13 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v14 = qword_10006EC90;
  double v15 = *(double *)&qword_10006EC98;
  double v16 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v14 >= v13) {
    double v18 = -v17;
  }
  else {
    double v18 = v17;
  }
  double v19 = sub_10002BCD4(*(id **)(a1 + 56));
  double v20 = sub_100039FA8(a2, 0, *(void **)(a1 + 64), *(void **)(a1 + 56));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v34 = (NSSet *)sub_10000E0F0([RDInformingDatastore alloc], v20);
  id obj = sub_10000E348(v34);
  id v21 = [(NSSet *)obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    double v23 = fmax(v9 - (double)(unint64_t)v6 + v10 + v12, 0.0);
    double v24 = v16 + v15 + v18 + (double)(uint64_t)v19;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(obj);
        }
        SEL v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v29 = *(NSURL **)(a1 + 64);
        uint64_t v43 = v27;
        [+[NSFileManager defaultManager](NSFileManager, "defaultManager") removeItemAtURL:sub_10001BD74(v29, (uint64_t)+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1, v34), a2, 1) error:0];
        id v30 = *(NSURL **)(a1 + 64);
        uint64_t v42 = v27;
        [+[NSFileManager defaultManager](NSFileManager, "defaultManager") removeItemAtURL:sub_10001BE44(v30, (uint64_t)+[NSArray arrayWithObjects:&v42 count:1], a2, 1) error:0];
        id v31 = sub_100039FA8(a2, v27, *(void **)(a1 + 64), *(void **)(a1 + 56));
        id v32 = sub_10000CC60([RDPruneableDatastore alloc], (void **)&v31->super.isa);
        double v33 = v32;
        if (v32) {
          sub_10000CE04((uint64_t)v32, a3, a4, 0, v23, v24);
        }
        sub_10000D430(v33);
      }
      id v22 = [(NSSet *)obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v22);
  }
}

void sub_100030E0C(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v6 = (uint64_t *)a1;
    uint64_t v7 = *(void *)(a1 + 88);
    if (!v7 || !*(void *)(v7 + 16))
    {
      uint64_t v15 = *(void *)(a1 + 104);
      if (!v15 || *(double *)(v15 + 32) == 0.0)
      {
        double v16 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to garbage collect data because time hasn't synced with companion", buf, 2u);
        }
LABEL_83:
        [a2 markCompleted];
        return;
      }
    }
    SEL v69 = sub_100039F34(*(void **)(a1 + 64), *(void **)(a1 + 56));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v78 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v69);
    unint64_t v8 = sub_10000ED28(v78, 1);
    id v9 = [v8 countByEnumeratingWithState:&v79 objects:v96 count:16];
    unint64_t v76 = v6;
    if (!v9) {
      goto LABEL_31;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v80;
    if (a3 != (const char *)2 && a4 != 4096)
    {
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v80 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if ([a2 deferIfNeeded]) {
            goto LABEL_73;
          }
          if (([v13 hasSuffix:@".tombstones"] & 1) == 0)
          {
            if (!objc_msgSend(objc_msgSend(v76, "authorizedAndInterestedClientsForSensor:", v13), "count")) {
              sub_100031788((uint64_t)v76, v13, (const char *)3, 0);
            }
            sub_100030AD8((uint64_t)v76, v13, a3, a4);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v79 objects:v96 count:16];
        uint64_t v6 = v76;
      }
      while (v10);
LABEL_31:

      double v19 = sub_100039F34((void *)v6[8], (void *)v6[7]);
      double v20 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v19);
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      SEL v67 = v20;
      if (v20) {
        double v20 = sub_10000ED28(v20, 0);
      }
      id obj = v20;
      id v73 = [v20 countByEnumeratingWithState:&v92 objects:buf count:16];
      if (!v73)
      {
LABEL_74:

        uint64_t v52 = sub_100013D80([RDIDSMessageStore alloc], v69);
        uint64_t v53 = mach_continuous_time();
        if (qword_10006EC88 != -1) {
          dispatch_once(&qword_10006EC88, &stru_10005CDC0);
        }
        unint64_t v54 = qword_10006EC90;
        double v55 = *(double *)&qword_10006EC98;
        double v56 = *(double *)&qword_10006ECA0;
        TMConvertTicksToSeconds();
        if (v54 >= v53) {
          double v57 = -v57;
        }
        double v58 = v56 + v55 + v57 - (double)(unint64_t)sub_10002A58C(v76[7], 0);
        uint64_t v59 = mach_continuous_time();
        if (qword_10006EC88 != -1) {
          dispatch_once(&qword_10006EC88, &stru_10005CDC0);
        }
        unint64_t v60 = qword_10006EC90;
        double v61 = *(double *)&qword_10006EC98;
        double v62 = *(double *)&qword_10006ECA0;
        TMConvertTicksToSeconds();
        if (v60 >= v59) {
          double v63 = -v63;
        }
        double v64 = v62 + v61 + v63;
        __int16 v65 = sub_10002BCD4((id *)v76[7]);
        sub_100014BB4((uint64_t)v52, v58, v64 + (double)(uint64_t)v65);

        double v66 = sub_10000F2A8([RDTopLevelPruneableDatastore alloc], v69);
        sub_10000F36C(v66);

        goto LABEL_83;
      }
      uint64_t v72 = *(void *)v93;
      CFStringRef v21 = @"_requestingBundleIdentifier";
LABEL_36:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v93 != v72) {
          objc_enumerationMutation(obj);
        }
        double v23 = *(void **)(*((void *)&v92 + 1) + 8 * v22);
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        uint64_t v25 = v6[4];
        context = v24;
        uint64_t v75 = v22;
        if (v25)
        {
          id v26 = [*(id *)(v25 + 16) rd_objectsForSensor:v23 fallbackURL:sub_10001BCE4(*(NSURL **)(v25 + 8), v23)];
          id v27 = [v26 countByEnumeratingWithState:&v88 objects:v104 count:16];
          if (v27) {
            break;
          }
          goto LABEL_59;
        }
        id v26 = 0;
        id v27 = [0 countByEnumeratingWithState:&v88 objects:v104 count:16];
        if (v27) {
          break;
        }
LABEL_59:
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        uint64_t v42 = v6[4];
        if (v42)
        {
          id v43 = [*(id *)(v42 + 24) rd_objectsForSensor:v23 fallbackURL:sub_10001BD2C(*(NSURL **)(v42 + 8), v23)];
          id v44 = [v43 countByEnumeratingWithState:&v83 objects:v97 count:16];
          if (!v44) {
            goto LABEL_37;
          }
        }
        else
        {
          id v43 = 0;
          id v44 = [0 countByEnumeratingWithState:&v83 objects:v97 count:16];
          if (!v44) {
            goto LABEL_37;
          }
        }
        id v45 = v44;
        uint64_t v46 = *(void *)v84;
        do
        {
          for (j = 0; j != v45; j = (char *)j + 1)
          {
            if (*(void *)v84 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
            id v50 = [v48 objectForKeyedSubscript:v21];
            if ((objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "applicationIsInstalled:", objc_msgSend(+[NSBundle sk_bundleWithIdentifier:](NSBundle, "sk_bundleWithIdentifier:", v50), "sr_normalizedBundleIdentifier")) & 1) == 0)
            {
              id v87 = 0;
              if ((sub_10000298C(v6[4], (uint64_t)v50, v23, (uint64_t)&v87) & 1) == 0)
              {
                id v51 = qword_10006EC58;
                if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)id v98 = 138543618;
                  id v99 = v50;
                  __int16 v100 = 2114;
                  id v101 = v87;
                  _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Failed to remove configuration for uninstalled client %{public}@ because %{public}@", v98, 0x16u);
                }
              }
            }
          }
          id v45 = [v43 countByEnumeratingWithState:&v83 objects:v97 count:16];
        }
        while (v45);
LABEL_37:
        uint64_t v22 = v75 + 1;
        if ((id)(v75 + 1) == v73)
        {
          id v73 = [obj countByEnumeratingWithState:&v92 objects:buf count:16];
          if (!v73) {
            goto LABEL_74;
          }
          goto LABEL_36;
        }
      }
      id v28 = v27;
      uint64_t v29 = *(void *)v89;
LABEL_44:
      uint64_t v30 = 0;
      id v77 = v28;
      while (1)
      {
        if (*(void *)v89 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v88 + 1) + 8 * v30);
        id v33 = [[+[NSBundle sk_bundleWithIdentifier:](NSBundle, "sk_bundleWithIdentifier:", v31) sr_normalizedBundleIdentifier];
        if ([+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace") applicationIsInstalled:v33])goto LABEL_47; {
        id v34 = v26;
        }
        CFStringRef v35 = v21;
        uint64_t v36 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v98 = 138543874;
          id v99 = v33;
          __int16 v100 = 2114;
          id v101 = v31;
          __int16 v102 = 2114;
          id v103 = v23;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "App %{public}@ is not installed. Removing client %{public}@ from the %{public}@ client interest cache", v98, 0x20u);
        }
        id v87 = 0;
        uint64_t v37 = v6[4];
        if (!v37) {
          break;
        }
        id v38 = [*(id *)(v37 + 16) rd_objectsForSensor:v23 fallbackURL:sub_10001BCE4(*(NSURL **)(v37 + 8), v23)];
        id v39 = [v38 mutableCopy];
        [v39 removeObject:v31];
        if ([v38 isEqualToSet:v39])
        {
        }
        else
        {
          [*(id *)(v37 + 16) setObject:v39 forKey:v23];
          unsigned __int8 v40 = [[*(id *)(v37 + 16) rd_writeObject:v39 forKey:v23 toURL:sub_10001BCE4(*(NSURL **)(v37 + 8), v23) error:&v87];

          if ((v40 & 1) == 0) {
            break;
          }
        }
LABEL_46:
        CFStringRef v21 = v35;
        id v26 = v34;
        uint64_t v6 = v76;
        id v28 = v77;
LABEL_47:
        if (v28 == (id)++v30)
        {
          id v28 = [v26 countByEnumeratingWithState:&v88 objects:v104 count:16];
          if (!v28) {
            goto LABEL_59;
          }
          goto LABEL_44;
        }
      }
      long long v41 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)id v98 = 138543618;
        id v99 = v31;
        __int16 v100 = 2114;
        id v101 = v87;
        _os_log_fault_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "Failed to remove interest for uninstalled client %{public}@ because %{public}@", v98, 0x16u);
      }
      goto LABEL_46;
    }
LABEL_22:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v80 != v11) {
        objc_enumerationMutation(v8);
      }
      double v18 = *(void **)(*((void *)&v79 + 1) + 8 * v17);
      if ([a2 deferIfNeeded]) {
        break;
      }
      if (([v18 hasSuffix:@".tombstones"] & 1) == 0
        && !objc_msgSend(objc_msgSend(v76, "authorizedAndInterestedClientsForSensor:", v18), "count"))
      {
        sub_100031788((uint64_t)v76, v18, (const char *)3, 0);
      }
      sub_100030AD8((uint64_t)v76, v18, a3, a4);
      if (v10 == (id)++v17)
      {
        id v10 = [v8 countByEnumeratingWithState:&v79 objects:v96 count:16];
        uint64_t v6 = v76;
        if (!v10) {
          goto LABEL_31;
        }
        goto LABEL_22;
      }
    }
LABEL_73:
  }
}

void sub_100031788(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  unint64_t v5 = a2;
  if ([a2 hasSuffix:@".tombstones"])
  {
    uint64_t v7 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 138543362;
      uint64_t v36 = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Attempting to remove all tombstones (%{public}@)", buf, 0xCu);
    }
  }
  else
  {
    unint64_t v8 = sub_100039FA8(v5, 0, *(void **)(a1 + 64), *(void **)(a1 + 56));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = (NSSet *)sub_10000E0F0([RDInformingDatastore alloc], v8);
    id obj = sub_10000E348(v27);
    id v9 = [(NSSet *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
      double v12 = v5;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(obj);
          }
          unint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          double v16 = sub_100039FA8(v5, v14, *(void **)(a1 + 64), *(void **)(a1 + 56));
          uint64_t v17 = sub_10000CC60([RDPruneableDatastore alloc], (void **)&v16->super.isa);
          if (v17)
          {
            uint64_t v18 = mach_continuous_time();
            if (qword_10006EC88 != -1) {
              dispatch_once(&qword_10006EC88, &stru_10005CDC0);
            }
            unint64_t v19 = qword_10006EC90;
            double v20 = *(double *)&qword_10006EC98;
            double v21 = *(double *)&qword_10006ECA0;
            TMConvertTicksToSeconds();
            if (v19 >= v18) {
              double v24 = -v23;
            }
            else {
              double v24 = v23;
            }
            id Property = (id)v17[1];
            if (Property) {
              id Property = objc_getProperty(Property, v22, 16, 1);
            }
            unint64_t v5 = v12;
            id v26 = sub_10002BCD4((id *)Property);
            sub_10000CE04((uint64_t)v17, a3, a4, 0, INFINITY, v21 + v20 + v24 + (double)(uint64_t)v26);
          }
        }
        id v10 = [(NSSet *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }
  }
}

BOOL sub_100031D24(unint64_t *a1, uint64_t a2)
{
  if ((sub_10002A018(a1[7]) & 1) == 0)
  {
    uint64_t v8 = qword_10006EC58;
    BOOL result = os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v15) = 0;
    id v9 = "Found no authorized clients because global data collection is disabled";
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  unint64_t v4 = a1[11];
  if (v4 && *(void *)(v4 + 16) || (unint64_t v12 = a1[13]) != 0 && *(double *)(v12 + 32) != 0.0)
  {
    id v5 = [a1 authorizedAndInterestedClientsForSensor:a2];
    uint64_t v6 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
    {
      int v15 = 134218242;
      id v16 = [v5 count];
      __int16 v17 = 2114;
      uint64_t v18 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found %lu authorized and interested clients for %{public}@", (uint8_t *)&v15, 0x16u);
    }
    return [v5 count] != 0;
  }
  else
  {
    uint64_t v13 = qword_10006EC58;
    BOOL v14 = os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v14)
    {
      LOWORD(v15) = 0;
      id v9 = "No writer should be monitoring as time sync state is invalid";
      id v10 = v13;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v15, 2u);
      return 0;
    }
  }
  return result;
}

void sub_100031EC0(uint64_t a1, void *a2)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v4 = [a2 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v44;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v44 != v6) {
            objc_enumerationMutation(a2);
          }
          uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          id v10 = +[SRSensorDescription sensorDescriptionForSensor:v8];
          if ([v10 supportsCurrentPlatform])
          {
            if (sub_100031D24((unint64_t *)a1, v8))
            {
              id v11 = [v10 name];
              unint64_t v12 = qword_10006EC58;
              if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)stat buf = 138543362;
                id v53 = v11;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Starting recording for %{public}@", buf, 0xCu);
              }
              dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
              id v13 = [v10 onDemandWriterService];
              if (v13) {
                [(id)a1 setWriterService:v13 enabled:1];
              }
              id v14 = [[sub_100009728(*(void *)(a1 + 136), (uint64_t)v11) firstObject];
              if (v14)
              {
                *(void *)&long long v48 = _NSConcreteStackBlock;
                *((void *)&v48 + 1) = 3221225472;
                uint64_t v49 = sub_1000329CC;
                id v50 = &unk_10005D220;
                id v51 = v11;
                id v15 = [v14 remoteObjectProxyWithErrorHandler:&v48];
                uint64_t v16 = *(void *)(a1 + 32);
                if (v16) {
                  id v17 = [[*(id *)(v16 + 24) rd_objectsForSensor:v11 fallbackURL:sub_10001BD2C(*(NSURL **)(v16 + 8), v11)]
                }
                else {
                  id v17 = 0;
                }
                [v15 setMonitoring:1 withRequestedConfigurations:[v17 allObjects]];
              }
              else
              {
                sub_10001EB1C((uint64_t)RDNotifier, 1, v11);
              }
              double v23 = *(void **)(a1 + 96);
              uint64_t v24 = mach_continuous_time();
              if (qword_10006EC88 != -1) {
                dispatch_once(&qword_10006EC88, &stru_10005CDC0);
              }
              unint64_t v25 = qword_10006EC90;
              double v26 = *(double *)&qword_10006EC98;
              double v27 = *(double *)&qword_10006ECA0;
              TMConvertTicksToSeconds();
              if (v23)
              {
                if (v25 >= v24) {
                  double v28 = -v28;
                }
                double v29 = v27 + v26 + v28;
                if (sub_10001EF14(v23, v29))
                {
                  int v31 = sub_10002A018(v23[2]);
                  if (v31) {
                    sub_10001F530(v23);
                  }
                }
                else
                {
                }
              }
            }
            else
            {
              id v19 = [v10 name];
              double v20 = qword_10006EC58;
              if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)stat buf = 138543362;
                id v53 = v19;
                _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Stopping recording for %{public}@", buf, 0xCu);
              }
              dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
              id v21 = [[sub_100009728(*(void *)(a1 + 136), (uint64_t)v19) firstObject];
              if (v21)
              {
                *(void *)&long long v48 = _NSConcreteStackBlock;
                *((void *)&v48 + 1) = 3221225472;
                uint64_t v49 = sub_100032AA0;
                id v50 = &unk_10005D220;
                id v51 = v19;
                [objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", &v48) setMonitoring:0 withRequestedConfigurations:&__NSArray0__struct];
              }
              id v22 = [v10 onDemandWriterService];
              if (v22) {
                [(id)a1 setWriterService:v22 enabled:0];
              }
            }
          }
          else
          {
            uint64_t v18 = qword_10006EC58;
            if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v48) = 138543362;
              *(void *)((char *)&v48 + 4) = v8;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ is not supported on this platform", (uint8_t *)&v48, 0xCu);
            }
          }
        }
        id v5 = [a2 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v5);
    }
    uint64_t v32 = *(void *)(a1 + 88);
    if (v32)
    {
      if (*(void *)(v32 + 16) == 1)
      {
        long long v33 = sub_100032480(a1);
        if ((sub_100032740(a1, (id *)&v33->super.isa) & 1) == 0)
        {
          uint64_t v34 = mach_continuous_time();
          if (qword_10006EC88 != -1) {
            dispatch_once(&qword_10006EC88, &stru_10005CDC0);
          }
          unint64_t v35 = qword_10006EC90;
          double v36 = *(double *)&qword_10006EC98;
          double v37 = *(double *)&qword_10006ECA0;
          TMConvertTicksToSeconds();
          if (v35 >= v34) {
            double v38 = -v38;
          }
          double v39 = v37 + v36 + v38;
          uint64_t v40 = *(void *)(a1 + 104);
          if (v40)
          {
            double v41 = v39 - *(double *)(v40 + 64);
            if (v41 > sub_10002BC6C(*(void *)(a1 + 56)))
            {
LABEL_47:
              sub_100032800(a1);
              return;
            }
          }
          else if (v39 - 0.0 > sub_10002BC6C(*(void *)(a1 + 56)))
          {
            goto LABEL_47;
          }
          uint64_t v42 = qword_10006EC58;
          if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v48) = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Not updating gizmo because our state was sent too recently.", (uint8_t *)&v48, 2u);
          }
        }
      }
    }
  }
}

RDGizmoSyncState *sub_100032480(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = objc_alloc_init(RDGizmoSyncState);
  uint64_t v3 = -[RDDaemon currentRecordingStatesForAnalytics:]_0((NSDictionary *)a1);
  if (!v2)
  {
    sub_10002B82C(*(void *)(a1 + 56));
    [*(id *)(a1 + 16) isRemoteSupported];
    uint64_t v6 = *(void **)(a1 + 104);
    if (!v6) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  objc_setProperty_nonatomic(v2, v4, v3, 16);
  v2->_prerequisites = sub_10002B82C(*(void *)(a1 + 56));
  v2->_requiredAppInstalled_deprecated = [*(id *)(a1 + 16) isRemoteSupported];
  uint64_t v6 = *(void **)(a1 + 104);
  if (v6) {
LABEL_4:
  }
    uint64_t v6 = (void *)v6[6];
LABEL_5:
  if (v2)
  {
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = &__NSDictionary0__struct;
    }
    objc_setProperty_nonatomic(v2, v5, v7, 24);
    v2->_capabilities = 3;
  }
  self = v2;
  id v8 = +[NSMutableDictionary dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = (void *)sub_10001A21C();
  id v10 = sub_10001A5B4(v9);
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v17 = [v15 name:context];
        uint64_t v18 = *(void *)(a1 + 32);
        if (v18) {
          id v19 = [*(id *)(v18 + 24) rd_objectsForSensor:v17 fallbackURL:sub_10001BD2C(*(NSURL **)(v18 + 8), v17)];
        }
        else {
          id v19 = 0;
        }
        id v20 = [v19 allObjects];
        [v8 setObject:v20 forKeyedSubscript:v17];
        id v21 = [v15 legacyName];
        if (v21) {
          [v8 setObject:v20 forKeyedSubscript:v21];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }
  id v22 = +[NSDictionary dictionaryWithDictionary:v8];
  if (self) {
    objc_setProperty_nonatomic(self, v23, v22, 40);
  }

  return self;
}

id *sub_100032740(uint64_t a1, id *a2)
{
  uint64_t v2 = *(id **)(a1 + 88);
  if (!v2) {
    return 0;
  }
  id v5 = sub_100024F68(*(void *)(a1 + 88));
  uint64_t v6 = (const char *)sub_100024DD4(v2, (uint64_t)v5, [v2[3] devices]);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = sub_100039F34(*(void **)(a1 + 64), *(void **)(a1 + 56));
  id v9 = sub_100014C40([RDGizmoStateDatastore alloc], v8);
  id v10 = sub_1000152E0((uint64_t)v9, v7);

  return sub_10001CFF0(a2, v10);
}

void sub_100032800(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = sub_100032480(a1);
    if (*(unsigned char *)(a1 + 8) || !sub_100032740(a1, (id *)&v2->super.isa))
    {
      [*(id *)(a1 + 16) sendStateToPeer:v2];
      uint64_t v7 = mach_continuous_time();
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v8 = qword_10006EC90;
      double v9 = *(double *)&qword_10006EC98;
      double v10 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      uint64_t v12 = *(void *)(a1 + 104);
      if (v12)
      {
        if (v8 >= v7) {
          double v11 = -v11;
        }
        *(double *)(v12 + 64) = v10 + v9 + v11;
        sub_1000283D8(v12);
      }
    }
    else
    {
      uint64_t v3 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
      {
        id v4 = *(id **)(a1 + 88);
        if (v4)
        {
          id v5 = sub_100024F68((uint64_t)v4);
          id v6 = sub_100024DD4(v4, (uint64_t)v5, [v4[3] devices]);
        }
        else
        {
          id v6 = 0;
        }
        int v13 = 138543362;
        id v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Remote device %{public}@ already knows we are not authorized for any data streams. Not sending this information again", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

void sub_1000329CC(uint64_t a1, uint64_t a2)
{
  id v4 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error trying to start monitoring for %{public}@. %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100032AA0(uint64_t a1, uint64_t a2)
{
  id v4 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error trying to stop monitoring for %{public}@. %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t sub_100033710(uint64_t result, int a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    uint64_t v9 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 48));
    id v20 = 0;
    char v10 = sub_10002C058((uint64_t)+[NSXPCConnection currentConnection], a3, *(id **)(v9 + 56), (void *)v9, &v20);
    if ((a2 & 1) == 0
      && [(SRError *)v20 code] == (id)1
      && objc_msgSend(objc_msgSend(-[SRError underlyingErrors](v20, "underlyingErrors"), "firstObject"), "code") == (id)4098)
    {
      double v11 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = (SRError *)[a3 sensor];
        *(_DWORD *)stat buf = 138543362;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Global collection is disabled but allowing client to stop recording for %{public}@", buf, 0xCu);
      }
    }
    else if ((v10 & 1) == 0)
    {
      id v17 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138543362;
        id v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Connection not valid because %{public}@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    id v13 = [a3 sensor];
    if (sub_100002678(*(void *)(v9 + 32), a2, v13, (uint64_t)[a3 bundleIdentifier], (uint64_t)&v20))
    {
      if ([a3 bundleIdentifier])
      {
        id v14 = +[NSMutableDictionary dictionaryWithDictionary:a4];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", [a3 bundleIdentifier], @"_requestingBundleIdentifier");
        if ((sub_10000276C(*(void *)(v9 + 32), v14, v13, (uint64_t)&v20) & 1) == 0)
        {
          id v15 = qword_10006EC58;
          if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138543362;
            id v22 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to write requested configuration because %{public}@", buf, 0xCu);
          }
          uint64_t v16 = +[SRError errorWithCode:0x4000];
          return (*(uint64_t (**)(uint64_t, SRError *))(a5 + 16))(a5, v16);
        }
      }
      else
      {
        id v19 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Got a recording request with no bundle ID", buf, 2u);
        }
      }
      sub_100031EC0(v9, +[NSSet setWithObject:v13]);
      uint64_t v16 = 0;
      return (*(uint64_t (**)(uint64_t, SRError *))(a5 + 16))(a5, v16);
    }
    uint64_t v18 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138543362;
      id v22 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to set client interest because %{public}@", buf, 0xCu);
    }
LABEL_18:
    uint64_t v16 = v20;
    return (*(uint64_t (**)(uint64_t, SRError *))(a5 + 16))(a5, v16);
  }
  return result;
}

NSArray *sub_100033E10(NSArray *result, void *a2)
{
  if (result)
  {
    id v3 = +[NSMutableArray array];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(a2);
          }
          __int16 v8 = sub_100028AD0((uint64_t)RDDeviceInfo, *(void **)(*((void *)&v9 + 1) + 8 * (void)v7));
          if ([(NSDictionary *)v8 count]) {
            [v3 addObject:v8];
          }
          uint64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    return +[NSArray arrayWithArray:v3];
  }
  return result;
}

void sub_1000341F8(uint64_t a1, uint64_t a2)
{
  id v4 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error trying to start monitoring for %{public}@. %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100034A78(uint64_t a1, const char *a2)
{
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(void **)(a1 + 136);
    if (v3)
    {
      id Property = objc_getProperty(v3, a2, 72, 1);
      id v5 = [Property countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      id Property = 0;
      id v5 = [0 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v5)
      {
LABEL_4:
        id v7 = v5;
        uint64_t v8 = *(void *)v18;
        *(void *)&long long v6 = 138543362;
        long long v16 = v6;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v18 != v8) {
              objc_enumerationMutation(Property);
            }
            uint64_t v10 = *(void *)(a1 + 136);
            if (v10)
            {
              long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
              id v12 = [*(id *)(v10 + 72) objectForKey:v11];
              if (v12)
              {
                id v14 = objc_getProperty(v12, v13, 24, 1);
                id v15 = qword_10006EC58;
                if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)stat buf = v16;
                  id v24 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Resetting datastore for %{public}@", buf, 0xCu);
                }
                v21[0] = _NSConcreteStackBlock;
                v21[1] = 3221225472;
                void v21[2] = sub_100034CB4;
                v21[3] = &unk_10005D220;
                v21[4] = v14;
                [objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21, v16, (void)v17) resetDatastoreFiles:&__NSDictionary0__struct];
              }
            }
          }
          id v7 = [Property countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v7);
      }
    }
    if (*(unsigned char *)(a1 + 8)) {
      sub_10001EBE8((uint64_t)RDNotifier, @"com.apple.SensorKit.resetDatastore");
    }
  }
}

void sub_100034CB4(uint64_t a1, uint64_t a2)
{
  id v4 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error trying to reset datastore for %{public}@. %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t sub_100034F9C(uint64_t result, void *a2, void *a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = (void *)result;
    id v8 = +[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:");
    if (v8)
    {
      uint64_t v9 = v8;
      id v24 = 0;
      id v10 = +[LSBundleRecord sr_bundleRecordWithIdentifier:a2 error:&v24];
      if (v10)
      {
        id v11 = [v7 validateBundleRecord:v10 withFilters:[v9 filters]];
        id v12 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 138543874;
          double v26 = a3;
          __int16 v27 = 2114;
          id v28 = a2;
          __int16 v29 = 1026;
          int v30 = (int)v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ eligibility status: %{public, BOOL}d", buf, 0x1Cu);
        }
        id v13 = *(uint64_t (**)(uint64_t, uint64_t, SRError *))(a4 + 16);
        uint64_t v14 = a4;
        uint64_t v15 = (uint64_t)v11;
LABEL_16:
        id v22 = 0;
        return v13(v14, v15, v22);
      }
      long long v18 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 138543618;
        double v26 = a2;
        __int16 v27 = 2114;
        id v28 = v24;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Failed to find application record for %{public}@ because %{public}@", buf, 0x16u);
      }
      unsigned int v19 = [objc_msgSend(v9, "eligibleDaemons") containsObject:a2];
      long long v20 = qword_10006EC58;
      if (v19)
      {
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
        {
          id v21 = [v9 name];
          *(_DWORD *)stat buf = 138543618;
          double v26 = a2;
          __int16 v27 = 2114;
          id v28 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@ is an eligible daemon for writing to %{public}@", buf, 0x16u);
        }
        id v13 = *(uint64_t (**)(uint64_t, uint64_t, SRError *))(a4 + 16);
        uint64_t v14 = a4;
        uint64_t v15 = 1;
        goto LABEL_16;
      }
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v9 name];
        *(_DWORD *)stat buf = 138543618;
        double v26 = a2;
        __int16 v27 = 2114;
        id v28 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ not eligible for %{public}@ because an app nor daemon record couldn't be found", buf, 0x16u);
      }
      uint64_t v17 = 20480;
    }
    else
    {
      long long v16 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138543362;
        double v26 = a3;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to find a sensor description for %{public}@", buf, 0xCu);
      }
      uint64_t v17 = 8194;
    }
    id v22 = +[SRError errorWithCode:v17];
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, SRError *))(a4 + 16);
    uint64_t v14 = a4;
    uint64_t v15 = 0;
    return v13(v14, v15, v22);
  }
  return result;
}

void sub_100036484(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    int v6 = sub_100039F34(*(void **)(a1 + 64), *(void **)(a1 + 56));
    uint64_t v7 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v6);
    id v8 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)stat buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Removing all files for all sensors", buf, 2u);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      if (v7)
      {
LABEL_4:
        uint64_t v9 = sub_10000ED28(v7, 0);
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      if (v7) {
        goto LABEL_4;
      }
    }
    uint64_t v9 = 0;
    id v10 = [0 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
LABEL_5:
      id v12 = v10;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v9);
          }
          sub_100031788(a1, *(void **)(*((void *)&v15 + 1) + 8 * i), a2, a3);
        }
        id v12 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v12);
    }
LABEL_13:
    sub_100034A78(a1, v11);
  }
}

NSDictionary *sub_100036668(void *a1)
{
  v10[0] = @"RDAnalyticsBundleIdentifierKey";
  v10[1] = @"RDAnalyticsSensorIdentifierKey";
  uint64_t v2 = a1[5];
  v11[0] = a1[4];
  v11[1] = v2;
  v10[2] = @"RDAnalyticsAuthorizationGrantedKey";
  uint64_t v3 = a1[6];
  if (v3) {
    id v4 = *(void **)(v3 + 112);
  }
  else {
    id v4 = 0;
  }
  v11[2] = [NSNumber numberWithBool:objc_msgSend(v4, "sensorHasReaderAuthorization:forBundleId:")];
  v10[3] = @"RDAnalyticsDataCollectionEnabledKey";
  uint64_t v5 = a1[6];
  if (v5) {
    unint64_t v6 = *(void *)(v5 + 56);
  }
  else {
    unint64_t v6 = 0;
  }
  v11[3] = +[NSNumber numberWithBool:sub_10002A018(v6)];
  _OWORD v10[4] = @"RDAnalyticsRequiredOnboardingCompletedKey";
  uint64_t v7 = a1[6];
  if (v7) {
    unint64_t v8 = *(void *)(v7 + 56);
  }
  else {
    unint64_t v8 = 0;
  }
  v11[4] = +[NSNumber numberWithBool:sub_10002A140(v8)];
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5]);
}

void sub_100036A08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    unsigned __int8 v3 = [*(id *)(v2 + 112) sensorKitActive];
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    unsigned __int8 v3 = [0 sensorKitActive];
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      goto LABEL_9;
    }
  }
  *(unsigned char *)(v4 + 8) = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && *(unsigned char *)(v5 + 8))
  {
    *(void *)stat buf = @"com.apple.sensorkit.decryptArchives";
    unint64_t v6 = +[NSArray arrayWithObjects:buf count:1];
    uint64_t v7 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Registering for authorized XPC Activities", v18, 2u);
    }
    [*(id *)(v5 + 40) registerForXPCActivities:v6];
    goto LABEL_11;
  }
LABEL_9:
  unint64_t v8 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No clients authorized so skipping registration of XPC activities that only apply when SensorKit is active", buf, 2u);
  }
LABEL_11:
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v10 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v11 = qword_10006EC90;
  double v12 = *(double *)&qword_10006EC98;
  double v13 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v9)
  {
    if (v11 >= v10) {
      double v14 = -v14;
    }
    double v15 = v13 + v12 + v14;
    if (sub_10001EF14(v9, v15))
    {
      int v17 = sub_10002A018(v9[2]);
      if (v17) {
        sub_10001F530(v9);
      }
    }
    else
    {
    }
  }
}

void sub_100036C94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    BOOL v3 = 0;
    unsigned __int8 v4 = [0 sensorKitActive];
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      goto LABEL_3;
    }
LABEL_19:
    uint64_t v6 = 0;
    if (!v3) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  BOOL v3 = *(unsigned char *)(v2 + 8) != 0;
  unsigned __int8 v4 = [*(id *)(v2 + 112) sensorKitActive];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_19;
  }
LABEL_3:
  *(unsigned char *)(v5 + 8) = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (*(unsigned char *)(v6 + 8) && !v3)
    {
      CFStringRef v13 = @"com.apple.sensorkit.decryptArchives";
      unint64_t v8 = +[NSArray arrayWithObjects:&v13 count:1];
      uint64_t v9 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering for authorized XPC Activities", v12, 2u);
      }
      [*(id *)(v6 + 40) registerForXPCActivities:v8];
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  if (v3)
  {
LABEL_12:
    if (v6 && !*(unsigned char *)(v6 + 8))
    {
      CFStringRef v13 = @"com.apple.sensorkit.decryptArchives";
      uint64_t v10 = +[NSArray arrayWithObjects:&v13 count:1];
      unint64_t v11 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unregistering for authorized XPC Activities", v12, 2u);
      }
      [*(id *)(v6 + 40) unregisterForXPCActivities:v10];
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
LABEL_17:
  sub_100031EC0(v6, *(void **)(a1 + 40));
}

NSDictionary *__cdecl sub_100037ADC(id a1)
{
  CFStringRef v2 = @"RDAnalyticsDaemonStartReasonKey";
  BOOL v3 = &off_1000612D8;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

NSDictionary *sub_100037B54(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = @"RDAnalyticsSensorIdentifierKey";
  v5[1] = @"RDAnalyticsDataSizeKey";
  v6[0] = v3;
  v6[1] = +[NSNumber numberWithUnsignedLongLong:sub_10000E254(v2, a2)];
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2]);
}

NSArray *sub_100039EA8(NSArray *result)
{
  if (result)
  {
    if (result[4].super.isa)
    {
      Class isa = result[4].super.isa;
      return +[NSArray arrayWithObjects:&isa count:1];
    }
    else
    {
      return (NSArray *)&__NSArray0__struct;
    }
  }
  return result;
}

RDDatastoreContext *sub_100039F34(void *a1, void *a2)
{
  unsigned __int8 v4 = objc_alloc_init(RDDatastoreContext);
  uint64_t v6 = v4;
  if (v4)
  {
    objc_setProperty_atomic(v4, v5, a1, 8);
    objc_setProperty_atomic(v6, v7, a2, 16);
  }

  return v6;
}

RDDatastoreContext *sub_100039FA8(void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v8 = objc_alloc_init(RDDatastoreContext);
  uint64_t v10 = v8;
  if (v8)
  {
    objc_setProperty_atomic(v8, v9, a3, 8);
    objc_setProperty_atomic(v10, v11, a4, 16);
    objc_setProperty_atomic(v10, v12, a2, 32);
    objc_setProperty_atomic(v10, v13, a1, 24);
  }

  return v10;
}

RDDatastoreContext *sub_10003A04C(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = objc_alloc_init(RDDatastoreContext);
  SEL v12 = v10;
  if (v10)
  {
    objc_setProperty_atomic(v10, v11, a3, 8);
    objc_setProperty_atomic(v12, v13, a4, 16);
    objc_setProperty_atomic(v12, v14, a2, 32);
    objc_setProperty_atomic(v12, v15, a5, 40);
    objc_setProperty_atomic(v12, v16, a1, 24);
  }

  return v12;
}

id sub_10003A160(void *a1, NSObject *a2, void *a3, void *a4, void *a5)
{
  id v5 = a1;
  if (a1)
  {
    id v10 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.SensorKit.authorization"];
    SEL v11 = objc_alloc_init(SRFollowUp);
    v25.receiver = v5;
    v25.super_class = (Class)RDAuthorizationBroadcaster;
    SEL v12 = [super init];
    id v5 = v12;
    if (v12)
    {
      v12[1] = a2;
      dispatch_retain(a2);
      *((void *)v5 + 10) = a3;
      *((void *)v5 + 11) = a4;
      *((void *)v5 + 12) = a5;
      objc_setProperty_nonatomic(v5, v13, v10, 32);
      [*((id *)v5 + 4) _setQueue:a2];
      [*((id *)v5 + 4) setDelegate:v5];
      [*((id *)v5 + 12) addReaderAuthorizationDelegate:v5];
      SEL v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceServerAuthorizationListening];
      objc_setProperty_nonatomic(v5, v15, v14, 40);
      SEL v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceClientAuthorizationListening];
      objc_setProperty_nonatomic(v5, v17, v16, 48);
      long long v18 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
      objc_setProperty_nonatomic(v5, v19, v18, 56);
      id v20 = +[NSMutableDictionary dictionary];
      objc_setProperty_nonatomic(v5, v21, v20, 64);
      objc_setProperty_nonatomic(v5, v22, v11, 72);
      if (sub_10002A018(*((void *)v5 + 10)))
      {
        id v23 = (void *)*((void *)v5 + 9);
        CFStringRef v26 = @"com.apple.SensorKit.followup.enableSensorKit";
        [v23 clearPendingFollowUpItemsWithUniqueIdentifiers:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1) completion:&stru_10005D7F8];
      }
    }
  }
  return v5;
}

dispatch_queue_t *sub_10003A450(dispatch_queue_t *result, void *a2)
{
  long long v111 = result;
  if (result)
  {
    dispatch_assert_queue_V2(result[1]);
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obj = [v111[8] objectForKeyedSubscript:a2];
    id v105 = [obj countByEnumeratingWithState:&v118 objects:v131 count:16];
    if (v105)
    {
      id v101 = *(id *)v119;
      *(void *)&long long v3 = 67240704;
      long long v99 = v3;
      id v103 = a2;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(id *)v119 != v101) {
            objc_enumerationMutation(obj);
          }
          id v107 = *(void **)(*((void *)&v118 + 1) + 8 * v4);
          uint64_t v109 = v4;
          if (objc_msgSend(a2, "isEqualToString:", @"com.apple.private.SensorKit._compositeBundle", v99))
          {
            id v5 = +[NSMutableSet set];
            id v6 = [v111[12] readerAuthorizationBundleIdValues];
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v7 = [v6 countByEnumeratingWithState:&v126 objects:buf count:16];
            if (v7)
            {
              id v8 = v7;
              uint64_t v9 = *(void *)v127;
              do
              {
                for (i = 0; i != v8; i = (char *)i + 1)
                {
                  if (*(void *)v127 != v9) {
                    objc_enumerationMutation(v6);
                  }
                  id v11 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v126 + 1) + 8 * i)];
                  long long v122 = 0u;
                  long long v123 = 0u;
                  long long v124 = 0u;
                  long long v125 = 0u;
                  id v12 = [v11 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                  if (v12)
                  {
                    id v13 = v12;
                    uint64_t v14 = *(void *)v123;
                    do
                    {
                      for (j = 0; j != v13; j = (char *)j + 1)
                      {
                        if (*(void *)v123 != v14) {
                          objc_enumerationMutation(v11);
                        }
                        uint64_t v16 = *(void *)(*((void *)&v122 + 1) + 8 * (void)j);
                        if (objc_msgSend(objc_msgSend(v11, "objectForKeyedSubscript:", v16), "BOOLValue")) {
                          [v5 addObject:v16];
                        }
                      }
                      id v13 = [v11 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                    }
                    while (v13);
                  }
                }
                id v8 = [v6 countByEnumeratingWithState:&v126 objects:buf count:16];
              }
              while (v8);
            }
            SEL v17 = +[NSSet setWithSet:v5];
            a2 = v103;
          }
          else
          {
            dispatch_assert_queue_V2(v111[1]);
            SEL v17 = (NSSet *)+[NSMutableSet set];
            id v18 = [v111[12] readerAuthorizationBundleIdValues];
            long long v132 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            id v19 = [v18 objectForKeyedSubscript:a2];
            id v20 = [v19 countByEnumeratingWithState:&v132 objects:buf count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v133;
              do
              {
                for (k = 0; k != v21; k = (char *)k + 1)
                {
                  if (*(void *)v133 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v132 + 1) + 8 * (void)k);
                  if ([v18[v24[v24]] boolValue])[v17 addObject:v24];
                }
                  }
                id v21 = [v19 countByEnumeratingWithState:&v132 objects:buf count:16];
              }
              while (v21);
            }
          }
          if ([a2 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
          {
            id v25 = +[NSMutableSet set];
            id v26 = [v111[12] readerAuthorizationBundleIdValues];
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v27 = [v26 countByEnumeratingWithState:&v126 objects:buf count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v112 = *(void *)v127;
              do
              {
                for (m = 0; m != v28; m = (char *)m + 1)
                {
                  if (*(void *)v127 != v112) {
                    objc_enumerationMutation(v26);
                  }
                  id v30 = [v26 objectForKeyedSubscript:*(void *)(*((void *)&v126 + 1) + 8 * (void)m)];
                  long long v122 = 0u;
                  long long v123 = 0u;
                  long long v124 = 0u;
                  long long v125 = 0u;
                  id v31 = [v30 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                  if (v31)
                  {
                    id v32 = v31;
                    uint64_t v33 = *(void *)v123;
                    do
                    {
                      for (n = 0; n != v32; n = (char *)n + 1)
                      {
                        if (*(void *)v123 != v33) {
                          objc_enumerationMutation(v30);
                        }
                        uint64_t v35 = *(void *)(*((void *)&v122 + 1) + 8 * (void)n);
                        if ([v30 count] && !-[NSSet containsObject:](v17, "containsObject:", v35)) {
                          [v25 addObject:v35];
                        }
                      }
                      id v32 = [v30 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                    }
                    while (v32);
                  }
                }
                id v28 = [v26 countByEnumeratingWithState:&v126 objects:buf count:16];
              }
              while (v28);
            }
            double v36 = +[NSSet setWithSet:v25];
            a2 = v103;
          }
          else
          {
            dispatch_assert_queue_V2(v111[1]);
            double v36 = (NSSet *)+[NSMutableSet set];
            id v37 = [v111[12] readerAuthorizationBundleIdValues];
            long long v132 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            id v38 = [v37 objectForKeyedSubscript:a2];
            id v39 = [v38 countByEnumeratingWithState:&v132 objects:buf count:16];
            if (v39)
            {
              id v40 = v39;
              uint64_t v41 = *(void *)v133;
              do
              {
                for (ii = 0; ii != v40; ii = (char *)ii + 1)
                {
                  if (*(void *)v133 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  uint64_t v43 = *(void *)(*((void *)&v132 + 1) + 8 * (void)ii);
                  if ([[[objc_msgSend(objc_msgSend(objc_msgSend(v37, "objectForKeyedSubscript:", a2), "objectForKeyedSubscript:", v43), "BOOLValue") & 1] == 0] addObject:v43];
                }
                  }
                id v40 = [v38 countByEnumeratingWithState:&v132 objects:buf count:16];
              }
              while (v40);
            }
          }
          id v44 = [[-[NSObject readerLastModifiedAuthorizationTimes](v111[12]) objectForKeyedSubscript:a2];
          if (v44) {
            long long v45 = v44;
          }
          else {
            long long v45 = &__NSDictionary0__struct;
          }
          unsigned int v46 = sub_10002A018((unint64_t)v111[10]);
          int v47 = sub_10002A140((unint64_t)v111[10]);
          if (v47) {
            int v48 = 2;
          }
          else {
            int v48 = 0;
          }
          uint64_t v49 = qword_10006EC60;
          if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v50 = sub_10002B82C((uint64_t)v111[10]);
            *(_DWORD *)stat buf = v99;
            unsigned int v137 = v46;
            __int16 v138 = 1026;
            int v139 = v47;
            __int16 v140 = 2048;
            uint64_t v141 = v50;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "dataCollectionEnabled is %{public, BOOL}d. onboardingCompleted is %{public, BOOL}d. Enabled is %lu", buf, 0x18u);
          }
          [objc_msgSend(v107, "remoteObjectProxy") authorizedServicesDidChange:v17 deniedServices:v36 prerequisites:v48 | v46 bundleIdentifier:v45 lastModifiedTimes:a2];
          uint64_t v4 = v109 + 1;
        }
        while ((id)(v109 + 1) != v105);
        id v105 = [obj countByEnumeratingWithState:&v118 objects:v131 count:16];
      }
      while (v105);
    }
    BOOL result = (dispatch_queue_t *)[a2 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"];
    if ((result & 1) == 0)
    {
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v102 = [v111[8] objectForKeyedSubscript:@"com.apple.private.SensorKit._compositeBundle"];
      BOOL result = (dispatch_queue_t *)[v102 countByEnumeratingWithState:&v114 objects:v130 count:16];
      id v106 = result;
      if (result)
      {
        uint64_t v104 = *(void *)v115;
        id v51 = &AnalyticsIsEventUsed_ptr;
        do
        {
          uint64_t v52 = 0;
          do
          {
            if (*(void *)v115 != v104) {
              objc_enumerationMutation(v102);
            }
            id v108 = *(void **)(*((void *)&v114 + 1) + 8 * v52);
            uint64_t v110 = v52;
            if ([@"com.apple.private.SensorKit._compositeBundle" isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
            {
              id v53 = [v51[251] set];
              id v54 = [v111[12] readerAuthorizationBundleIdValues];
              long long v126 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              id v55 = [v54 countByEnumeratingWithState:&v126 objects:buf count:16];
              if (v55)
              {
                id v56 = v55;
                uint64_t v57 = *(void *)v127;
                do
                {
                  for (jj = 0; jj != v56; jj = (char *)jj + 1)
                  {
                    if (*(void *)v127 != v57) {
                      objc_enumerationMutation(v54);
                    }
                    id v59 = [v54 objectForKeyedSubscript:*(void *)(*((void *)&v126 + 1) + 8 * (void)jj)];
                    long long v122 = 0u;
                    long long v123 = 0u;
                    long long v124 = 0u;
                    long long v125 = 0u;
                    id v60 = [v59 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                    if (v60)
                    {
                      id v61 = v60;
                      uint64_t v62 = *(void *)v123;
                      do
                      {
                        for (kk = 0; kk != v61; kk = (char *)kk + 1)
                        {
                          if (*(void *)v123 != v62) {
                            objc_enumerationMutation(v59);
                          }
                          uint64_t v64 = *(void *)(*((void *)&v122 + 1) + 8 * (void)kk);
                          if ([v59[v64] boolValue])[v53 addObject:v64]; {
                        }
                          }
                        id v61 = [v59 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                      }
                      while (v61);
                    }
                  }
                  id v56 = [v54 countByEnumeratingWithState:&v126 objects:buf count:16];
                }
                while (v56);
              }
              __int16 v65 = +[NSSet setWithSet:v53];
              id v51 = &AnalyticsIsEventUsed_ptr;
            }
            else
            {
              dispatch_assert_queue_V2(v111[1]);
              __int16 v65 = (NSSet *)[v51[251] set];
              id v66 = [v111[12] readerAuthorizationBundleIdValues];
              long long v132 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              id v67 = [v66 objectForKeyedSubscript:@"com.apple.private.SensorKit._compositeBundle"];
              id v68 = [v67 countByEnumeratingWithState:&v132 objects:buf count:16];
              if (v68)
              {
                id v69 = v68;
                uint64_t v70 = *(void *)v133;
                do
                {
                  for (mm = 0; mm != v69; mm = (char *)mm + 1)
                  {
                    if (*(void *)v133 != v70) {
                      objc_enumerationMutation(v67);
                    }
                    uint64_t v72 = *(void *)(*((void *)&v132 + 1) + 8 * (void)mm);
                    if ([v66 objectForKeyedSubscript:@"com.apple.private.SensorKit._compositeBundle"] objectForKeyedSubscript:v72) {
                  }
                    }
                  id v69 = [v67 countByEnumeratingWithState:&v132 objects:buf count:16];
                }
                while (v69);
              }
            }
            if ([@"com.apple.private.SensorKit._compositeBundle" isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
            {
              id v73 = [v51[251] set];
              id v74 = [v111[12] readerAuthorizationBundleIdValues];
              long long v126 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              id v75 = [v74 countByEnumeratingWithState:&v126 objects:buf count:16];
              if (v75)
              {
                id v76 = v75;
                uint64_t v113 = *(void *)v127;
                do
                {
                  for (nn = 0; nn != v76; nn = (char *)nn + 1)
                  {
                    if (*(void *)v127 != v113) {
                      objc_enumerationMutation(v74);
                    }
                    id v78 = [v74 objectForKeyedSubscript:*(void *)(*((void *)&v126 + 1) + 8 * (void)nn)];
                    long long v122 = 0u;
                    long long v123 = 0u;
                    long long v124 = 0u;
                    long long v125 = 0u;
                    id v79 = [v78 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                    if (v79)
                    {
                      id v80 = v79;
                      uint64_t v81 = *(void *)v123;
                      do
                      {
                        for (i1 = 0; i1 != v80; i1 = (char *)i1 + 1)
                        {
                          if (*(void *)v123 != v81) {
                            objc_enumerationMutation(v78);
                          }
                          uint64_t v83 = *(void *)(*((void *)&v122 + 1) + 8 * (void)i1);
                          if ([v78 count] && !-[NSSet containsObject:](v65, "containsObject:", v83)) {
                            [v73 addObject:v83];
                          }
                        }
                        id v80 = [v78 countByEnumeratingWithState:&v122 objects:&v132 count:16];
                      }
                      while (v80);
                    }
                  }
                  id v76 = [v74 countByEnumeratingWithState:&v126 objects:buf count:16];
                }
                while (v76);
              }
              long long v84 = +[NSSet setWithSet:v73];
              id v51 = &AnalyticsIsEventUsed_ptr;
            }
            else
            {
              dispatch_assert_queue_V2(v111[1]);
              long long v84 = (NSSet *)[v51[251] set];
              id v85 = [v111[12] readerAuthorizationBundleIdValues];
              long long v132 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              id v86 = [v85 objectForKeyedSubscript:@"com.apple.private.SensorKit._compositeBundle"];
              id v87 = [v86 countByEnumeratingWithState:&v132 objects:buf count:16];
              if (v87)
              {
                id v88 = v87;
                uint64_t v89 = *(void *)v133;
                do
                {
                  for (i2 = 0; i2 != v88; i2 = (char *)i2 + 1)
                  {
                    if (*(void *)v133 != v89) {
                      objc_enumerationMutation(v86);
                    }
                    uint64_t v91 = *(void *)(*((void *)&v132 + 1) + 8 * (void)i2);
                    if ([[[objc_msgSend(objc_msgSend(objc_msgSend(v85, "objectForKeyedSubscript:", @"com.apple.private.SensorKit._compositeBundle"), "objectForKeyedSubscript:", v91), "BOOLValue") & 1] == 0] addObject:v91]; {
                  }
                    }
                  id v88 = [v86 countByEnumeratingWithState:&v132 objects:buf count:16];
                }
                while (v88);
              }
            }
            id v92 = [[-[NSObject readerLastModifiedAuthorizationTimes](v111[12]) objectForKeyedSubscript:@"com.apple.private.SensorKit._compositeBundle"];
            if (v92) {
              long long v93 = v92;
            }
            else {
              long long v93 = &__NSDictionary0__struct;
            }
            unsigned int v94 = sub_10002A018((unint64_t)v111[10]);
            int v95 = sub_10002A140((unint64_t)v111[10]);
            if (v95) {
              int v96 = 2;
            }
            else {
              int v96 = 0;
            }
            id v97 = qword_10006EC60;
            if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v98 = sub_10002B82C((uint64_t)v111[10]);
              *(_DWORD *)stat buf = 67240704;
              unsigned int v137 = v94;
              __int16 v138 = 1026;
              int v139 = v95;
              __int16 v140 = 2048;
              uint64_t v141 = v98;
              _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "dataCollectionEnabled is %{public, BOOL}d. onboardingCompleted is %{public, BOOL}d. Enabled is %lu", buf, 0x18u);
            }
            [objc_msgSend(objc_msgSend(v108, "remoteObjectProxy"), "authorizedServicesDidChange:deniedServices:prerequisites:lastModifiedTimes:bundleIdentifier:", v65, v84, v96 | v94, v93, @"com.apple.private.SensorKit._compositeBundle");
            uint64_t v52 = v110 + 1;
          }
          while ((dispatch_queue_t *)(v110 + 1) != v106);
          BOOL result = (dispatch_queue_t *)[v102 countByEnumeratingWithState:&v114 objects:v130 count:16];
          id v106 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

uint64_t sub_10003B1C4(uint64_t a1)
{
  if (a1)
  {
    int v2 = sub_10002A018(*(void *)(a1 + 80));
    int v3 = sub_10002A140(*(void *)(a1 + 80));
    if (v3) {
      int v4 = 2;
    }
    else {
      int v4 = 0;
    }
    unsigned int v5 = v4 | v2;
    id v6 = qword_10006EC60;
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = sub_10002B82C(*(void *)(a1 + 80));
      v9[0] = 67240704;
      v9[1] = v2;
      __int16 v10 = 1026;
      int v11 = v3;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "dataCollectionEnabled is %{public, BOOL}d. onboardingCompleted is %{public, BOOL}d. Enabled is %lu", (uint8_t *)v9, 0x18u);
    }
  }
  else
  {
    return 0;
  }
  return v5;
}

void sub_10003B2E0(uint64_t a1, void *a2, void *a3, int a4)
{
  if (a1 && ([a3 isEqualToString:@"com.apple.sensorkit.dummy-bundle-id"] & 1) == 0)
  {
    id v30 = objc_alloc_init((Class)NSMutableSet);
    id v32 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[a2 count]];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v6 = [a2 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v33 = *(void *)v40;
      *(void *)&long long v7 = 138543362;
      long long v29 = v7;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(a2);
          }
          int v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v13 = +[SRSensorDescription sensorDescriptionForSensor:v11];
          if (v13)
          {
            uint64_t v14 = v13;
            id v15 = [v13 authorizationService];
            unsigned int v16 = [[a2 objectForKeyedSubscript:v11] boolValue];
            if (v16)
            {
              uint64_t v17 = *(void *)(a1 + 88);
              if (v17)
              {
                if (![*(id *)(v17 + 48) objectForKeyedSubscript:v15]) {
                  goto LABEL_16;
                }
              }
              else if (![0 objectForKeyedSubscript:v15])
              {
LABEL_16:
                sub_100028728(*(void *)(a1 + 88), (uint64_t)v15);
              }
            }
            id v18 = [[objc_msgSend(objc_msgSend(*(id **)(a1 + 80)), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", v11];
            if (!v18)
            {
              if ([v14 legacyName]) {
                id v18 = [objc_msgSend(objc_msgSend(*(id **)(a1 + 80)), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", objc_msgSend(v14, "legacyName")];
              }
              else {
                id v18 = 0;
              }
            }
            id v19 = [v14 authorizationVersion:v29];
            id v20 = [v18 integerValue];
            if (v19 == v20) {
              unsigned int v21 = 0;
            }
            else {
              unsigned int v21 = v16;
            }
            if (v21 == 1)
            {
              if (a4)
              {
                id v22 = v20;
                id v23 = qword_10006EC60;
                if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)stat buf = 134349826;
                  id v45 = v22;
                  __int16 v46 = 2114;
                  id v47 = v11;
                  __int16 v48 = 2114;
                  id v49 = v15;
                  __int16 v50 = 2050;
                  id v51 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Authorization version %{public}ld for sensor: %{public}@, TCC Service: %{public}@ does not match the expected version (%{public}ld}. Resetting the authorization", buf, 0x2Au);
                }
                [v30 addObject:v15];
              }
              uint64_t v24 = qword_10006EC60;
              if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)stat buf = 138543874;
                id v45 = v11;
                __int16 v46 = 2050;
                id v47 = v19;
                __int16 v48 = 2114;
                id v49 = a3;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Setting sensor %{public}@ authorization version to %{public}ld for bundle %{public}@", buf, 0x20u);
              }
              [v32 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19) forKeyedSubscript:v11];
            }
            goto LABEL_9;
          }
          __int16 v10 = qword_10006EC60;
          if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = v29;
            id v45 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to find description for sensor %{public}@", buf, 0xCu);
          }
LABEL_9:
        }
        id v8 = [a2 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v8);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = [v30 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(a1 + 96) resetAuthorizationForService:*(void *)(*((void *)&v35 + 1) + 8 * (void)j) bundleId:a3];
        }
        id v26 = [v30 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v26);
    }

    if ([v32 count]) {
      [*(id *)(a1 + 80) updateAuthorizationVersions:v32 forBundleId:a3];
    }
  }
}

void sub_10003B7FC(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  int v2 = _os_activity_create((void *)&_mh_execute_header, "RDAuthorizationBroadcaster received full authorization set", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);
  int v3 = qword_10006EC60;
  if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received full authorization payload.  Notifying clients.", buf, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    unsigned int v5 = *(void **)(v4 + 96);
  }
  else {
    unsigned int v5 = 0;
  }
  id v6 = [v5 readerAuthorizationBundleIdValues];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        sub_10003B2E0(*(void *)(a1 + 32), [v6 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)], *(void **)(*((void *)&v21 + 1) + 8 * i), 1);
      }
      id v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v7);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    if (*(unsigned char *)(v10 + 16))
    {
      int v11 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", [*(id *)(v10 + 64) allKeys]);
      -[NSMutableSet unionSet:](v11, "unionSet:", +[NSSet setWithArray:](NSSet, "setWithArray:", [v6 allKeys]));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            sub_10003A450(*(dispatch_queue_t **)(a1 + 32), *(void **)(*((void *)&v17 + 1) + 8 * (void)j));
          }
          id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
        }
        while (v12);
      }
      goto LABEL_25;
    }
    id v15 = *(void **)(v10 + 32);
  }
  else
  {
    id v15 = 0;
  }
  [v15 resume];
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    *(unsigned char *)(v16 + 16) = 1;
  }
LABEL_25:
  os_activity_scope_leave(&state);
}

void sub_10003BA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,os_activity_scope_state_s state)
{
}

void sub_10003BBC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    int v2 = *(void **)(a1 + 40);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    int v3 = _os_activity_create((void *)&_mh_execute_header, "RDAuthorizationBroadcaster received authorization change", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v5);
    uint64_t v4 = qword_10006EC60;
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138543362;
      id v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received authorization change for bundle id: %{public}@", buf, 0xCu);
    }
    sub_10003B2E0(v1, [objc_msgSend(*(id *)(v1 + 96), "readerAuthorizationBundleIdValues", v5.opaque[0], v5.opaque[1]) objectForKeyedSubscript:v2], v2, 0);
    sub_10003A450((dispatch_queue_t *)v1, v2);
    os_activity_scope_leave(&v5);
  }
}

void sub_10003BCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

id *sub_10003BCF4(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", [result[8] allKeys]);
    -[NSMutableSet unionSet:](v2, "unionSet:", +[NSSet setWithArray:](NSSet, "setWithArray:", [objc_msgSend(objc_msgSend(v1[12], "readerAuthorizationBundleIdValues"), "allKeys"]));
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    BOOL result = (id *)[(NSMutableSet *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      int v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        os_activity_scope_state_s v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          sub_10003A450((dispatch_queue_t *)v1, *(void **)(*((void *)&v6 + 1) + 8 * (void)v5));
          os_activity_scope_state_s v5 = (id *)((char *)v5 + 1);
        }
        while (v3 != v5);
        BOOL result = (id *)[(NSMutableSet *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        int v3 = result;
      }
      while (result);
    }
  }
  return result;
}

void sub_10003C0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_10003C0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, os_activity_scope_state_s state, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_10003C13C(id a1)
{
  CFStringRef v2 = @"RDAnalyticsDaemonStartReasonKey";
  int v3 = &off_1000612F0;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

void sub_10003C1B4(id a1)
{
  uint64_t v1 = qword_10006EC60;
  if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)CFStringRef v2 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "Interruptions are unexpected", v2, 2u);
  }
  abort();
}

void sub_10003C20C(uint64_t a1)
{
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  CFStringRef v2 = _os_activity_create((void *)&_mh_execute_header, "authorization listening connection invalidated", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v16);
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    id v5 = v4;
    if (v4)
    {
      long long v6 = qword_10006EC60;
      if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Connection invalidated for authorization listening", buf, 2u);
      }
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v5 + 1));
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v7 = _os_activity_create((void *)&_mh_execute_header, "RDAuthorizationBroadcaster connection invalidated", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v7, &state);
      long long v8 = qword_10006EC60;
      if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_INFO))
      {
        unsigned int v9 = [Weak processIdentifier:v16.opaque[0] v16.opaque[1]];
        *(_DWORD *)stat buf = 67240192;
        unsigned int v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Lost connection from pid %{public}d", buf, 8u);
      }
      id v10 = [*((id *)v5 + 7) objectForKey:Weak, v16.opaque[0], v16.opaque[1]];
      [*((id *)v5 + 7) removeObjectForKey:Weak];
      if (v10)
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v17 objects:buf count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v18;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
              id v15 = [*((id *)v5 + 8) objectForKeyedSubscript:v14];
              [v15 removeObject:Weak];
              if (![v15 count]) {
                [*((id *)v5 + 8) setObject:0 forKeyedSubscript:v14];
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v17 objects:buf count:16];
          }
          while (v11);
        }
      }
      os_activity_scope_leave(&state);
    }
  }
  os_activity_scope_leave(&v16);
}

void sub_10003C488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_activity_scope_state_s a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

void sub_10003CD48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CD5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CDE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003CF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_10003E06C(id a1, BOOL a2, NSError *a3)
{
  int v3 = qword_10006EC60;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Successfully cleared follow up item", (uint8_t *)&v5, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    long long v6 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to clear follow up item because %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

void *sub_10003E1E0(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RDAnalyticsEventListener;
  int v3 = [super init];
  if (v3)
  {
    v3[3] = objc_alloc_init((Class)NSCache);
    v3[1] = a2;
  }
  return v3;
}

NSDictionary *sub_10003E4C8(void *a1)
{
  v6[0] = &off_100061308;
  v5[0] = @"RDAnalyticsWatchSyncEventKey";
  v5[1] = @"RDAnalyticsSyncSideKey";
  v6[1] = +[NSNumber numberWithInteger:a1[5]];
  void v5[2] = @"RDAnalyticsIDSMessageTypeKey";
  CFStringRef v2 = +[NSNumber numberWithInteger:a1[6]];
  v5[3] = @"RDAnalyticsIDSIdentifierKey";
  uint64_t v3 = a1[4];
  void v6[2] = v2;
  v6[3] = v3;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4]);
}

NSDictionary *sub_10003E598(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"RDGizmoSyncSensorIdentifierKey"];
  if (!v2) {
    return (NSDictionary *)&__NSDictionary0__struct;
  }
  id v3 = v2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"RDGizmoSyncKeyKey"];
  if (!v4) {
    return (NSDictionary *)&__NSDictionary0__struct;
  }
  v6[0] = @"RDAnalyticsWatchSyncEventKey";
  v6[1] = @"RDAnalyticsSensorIdentifierKey";
  v7[0] = &off_100061320;
  v7[1] = v3;
  void v6[2] = @"RDAnalyticsSyncSideKey";
  v6[3] = @"RDAnalyticsKeyNameKey";
  void v7[2] = &off_100061338;
  v7[3] = v4;
  void v6[4] = @"RDAnalyticsIDSIdentifierKey";
  v7[4] = *(void *)(a1 + 40);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5]);
}

NSDictionary *sub_10003E760(uint64_t a1)
{
  v5[0] = @"RDAnalyticsWatchSyncEventKey";
  v5[1] = @"RDAnalyticsErrorKey";
  v6[0] = &off_100061308;
  v6[1] = &off_100061320;
  void v5[2] = @"RDAnalyticsIDSErrorCodeKey";
  void v6[2] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) code]);
  v5[3] = @"RDAnalyticsSyncSideKey";
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  v6[3] = +[NSNumber numberWithInteger:v3];
  void v5[4] = @"RDAnalyticsIDSMessageTypeKey";
  void v6[4] = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5]);
}

NSDictionary *sub_10003E8EC(uint64_t a1)
{
  v5[0] = &off_100061350;
  v4[0] = @"RDAnalyticsWatchSyncEventKey";
  v4[1] = @"RDAnalyticsArchiveStatusKey";
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  v5[1] = +[NSNumber numberWithInteger:v2];
  void v5[2] = &off_100061338;
  void v4[2] = @"RDAnalyticsSyncSideKey";
  v4[3] = @"RDAnalyticsSensorIdentifierKey";
  void v4[4] = @"RDAnalyticsKeyNameKey";
  long long v6 = *(_OWORD *)(a1 + 32);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5]);
}

NSDictionary *sub_10003EA44(void *a1)
{
  v5[0] = @"RDAnalyticsWatchSyncEventKey";
  v5[1] = @"RDAnalyticsErrorKey";
  v6[0] = &off_100061350;
  v6[1] = &off_100061320;
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  void v6[2] = v3;
  void v5[2] = @"RDAnalyticsSensorIdentifierKey";
  void v5[3] = @"RDAnalyticsIDSErrorCodeKey";
  v6[3] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 code]);
  void v6[4] = &off_100061338;
  void v5[4] = @"RDAnalyticsSyncSideKey";
  void v5[5] = @"RDAnalyticsKeyNameKey";
  void v6[5] = a1[6];
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6]);
}

NSDictionary *sub_10003EC80(void *a1)
{
  v7[0] = &off_100061308;
  v6[0] = @"RDAnalyticsWatchSyncEventKey";
  v6[1] = @"RDAnalyticsSyncSideKey";
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  v7[1] = +[NSNumber numberWithInteger:v3];
  void v7[2] = &off_100061350;
  void v6[2] = @"RDAnalyticsErrorKey";
  v6[3] = @"RDAnalyticsIDSMessageTypeKey";
  uint64_t v4 = a1[6];
  v7[3] = a1[5];
  v7[4] = &off_100061350;
  void v6[4] = @"RDAnalyticsIDSMessageStatusKey";
  void v6[5] = @"RDAnalyticsIDSIdentifierKey";
  void v7[5] = v4;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:6]);
}

NSDictionary *sub_10003EEB8(void *a1)
{
  v9[0] = &off_100061308;
  v8[0] = @"RDAnalyticsWatchSyncEventKey";
  v8[1] = @"RDAnalyticsSyncSideKey";
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = +[NSNumber numberWithInteger:v3];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v9[1] = v4;
  _DWORD v9[2] = v5;
  void v8[2] = @"RDAnalyticsIDSMessageTypeKey";
  v8[3] = @"RDAnalyticsIDSMessageStatusKey";
  v8[4] = @"RDAnalyticsIDSIdentifierKey";
  v9[3] = &off_100061320;
  v9[4] = v6;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5]);
}

NSDictionary *__cdecl sub_10003F08C(id a1)
{
  CFStringRef v2 = @"RDAnalyticsDaemonStartReasonKey";
  uint64_t v3 = &off_100061320;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

NSDictionary *__cdecl sub_10003F300(id a1)
{
  CFStringRef v2 = @"RDAnalyticsDaemonStartReasonKey";
  uint64_t v3 = &off_100061320;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1]);
}

NSDictionary *sub_10003F378(uint64_t a1)
{
  v2[0] = @"RDAnalyticsSyncSideKey";
  v2[1] = @"RDAnalyticsKeyStatusKey";
  v3[0] = &off_100061320;
  v3[1] = &off_100061308;
  v2[2] = @"RDAnalyticsSensorIdentifierKey";
  v2[3] = @"RDAnalyticsKeyNameKey";
  long long v4 = *(_OWORD *)(a1 + 32);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4]);
}

NSDictionary *sub_10003F50C(uint64_t a1)
{
  id v2 = [[objc_msgSend(*(id *)(a1 + 32), "currentRecordingStatesForAnalytics:", *(void *)(a1 + 40)) isEqualToDictionary:*(void *)(a1 + 48)];
  BOOL v3 = [*(id *)(a1 + 32) prerequisitesStatusForAnalytics:*(void *)(a1 + 40)] == *(id *)(a1 + 56);
  v5[0] = @"RDAnalyticsWatchSyncEventKey";
  v5[1] = @"RDAnalyticsSyncSideKey";
  v6[0] = &off_100061368;
  v6[1] = &off_100061320;
  void v6[2] = &off_100061380;
  void v5[2] = @"RDAnalyticsIDSMessageTypeKey";
  void v5[3] = @"RDAnalyticsWatchStateSyncPrerequisitesMatchKey";
  v6[3] = +[NSNumber numberWithBool:v3];
  void v5[4] = @"RDAnalyticsWatchStateSyncRecordingStatesMatchKey";
  void v6[4] = +[NSNumber numberWithBool:v2];
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5]);
}

NSDictionary *sub_10003F690(uint64_t a1)
{
  v2[0] = @"RDAnalyticsSyncSideKey";
  v2[1] = @"RDAnalyticsKeyStatusKey";
  v3[0] = &off_100061320;
  v3[1] = &off_100061398;
  v2[2] = @"RDAnalyticsSensorIdentifierKey";
  v2[3] = @"RDAnalyticsKeyNameKey";
  long long v4 = *(_OWORD *)(a1 + 32);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4]);
}

NSDictionary *sub_10003F7BC(uint64_t a1)
{
  v3[0] = @"RDAnalyticsSyncSideKey";
  v3[1] = @"RDAnalyticsWatchSyncEventKey";
  v4[0] = &off_100061320;
  v4[1] = &off_100061350;
  void v3[2] = @"RDAnalyticsArchiveStatusKey";
  void v4[2] = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v3[3] = @"RDAnalyticsSensorIdentifierKey";
  v3[4] = @"RDAnalyticsKeyNameKey";
  long long v5 = *(_OWORD *)(a1 + 32);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5]);
}

NSDictionary *sub_10003F9B0(uint64_t a1)
{
  v3[0] = @"RDAnalyticsDaemonStartReasonKey";
  v3[1] = @"RDAnalyticsXPCActivityKey";
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = &off_100061350;
  v4[1] = v1;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2]);
}

NSDictionary *sub_10003FAAC(uint64_t a1)
{
  v2[0] = @"RDAnalyticsSyncSideKey";
  v2[1] = @"RDAnalyticsArchiveStatusKey";
  v3[0] = &off_100061320;
  v3[1] = &off_1000613B0;
  v2[2] = @"RDAnalyticsSensorIdentifierKey";
  v2[3] = @"RDAnalyticsKeyNameKey";
  long long v4 = *(_OWORD *)(a1 + 32);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4]);
}

NSDictionary *sub_10003FBC8(uint64_t a1)
{
  v2[0] = @"RDAnalyticsSyncSideKey";
  v2[1] = @"RDAnalyticsArchiveStatusKey";
  v3[0] = &off_100061320;
  v3[1] = &off_1000613C8;
  v2[2] = @"RDAnalyticsSensorIdentifierKey";
  v2[3] = @"RDAnalyticsKeyNameKey";
  long long v4 = *(_OWORD *)(a1 + 32);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4]);
}

NSDictionary *sub_10003FCE4(uint64_t a1)
{
  v2[0] = @"RDAnalyticsSyncSideKey";
  v2[1] = @"RDAnalyticsArchiveStatusKey";
  v3[0] = &off_100061320;
  v3[1] = &off_1000613E0;
  v2[2] = @"RDAnalyticsSensorIdentifierKey";
  v2[3] = @"RDAnalyticsKeyNameKey";
  long long v4 = *(_OWORD *)(a1 + 32);
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4]);
}

NSDictionary *sub_10003FE00(uint64_t a1)
{
  v4[0] = @"RDAnalyticsSyncSideKey";
  v4[1] = @"RDAnalyticsSensorIdentifierKey";
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = &off_100061320;
  v5[1] = v1;
  void v4[2] = @"RDAnalyticsArchiveStatusKey";
  void v4[3] = @"RDAnalyticsErrorKey";
  void v5[2] = &off_1000613F8;
  void v5[3] = &off_100061380;
  void v4[4] = @"RDAnalyticsKeyNameKey";
  void v5[4] = v2;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5]);
}

NSDictionary *sub_10003FF34(uint64_t a1)
{
  v3[0] = @"RDAnalyticsWatchSyncEventKey";
  v3[1] = @"RDAnalyticsErrorKey";
  v4[0] = &off_100061350;
  v4[1] = &off_100061368;
  void v3[2] = @"RDAnalyticsSensorIdentifierKey";
  v3[3] = @"RDAnalyticsSyncSideKey";
  uint64_t v1 = *(void *)(a1 + 40);
  void v4[2] = *(void *)(a1 + 32);
  void v4[3] = &off_100061338;
  v3[4] = @"RDAnalyticsKeyNameKey";
  void v4[4] = v1;
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5]);
}

void sub_100040188(void *a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v5 = [a3 code];
    uint64_t v6 = qword_10006EC68;
    if (v5 == (id)260)
    {
      if (os_log_type_enabled((os_log_t)qword_10006EC68, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = a1[4];
        *(_DWORD *)stat buf = 138543362;
        uint64_t v14 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@ could not be found and likely has already been removed", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10006EC68, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)stat buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      os_activity_scope_state_s v16 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to list %{public}@ because %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v11[0] = @"RDAnalyticsWatchSyncEventKey";
    v11[1] = @"RDAnalyticsSensorIdentifierKey";
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    v12[0] = &off_100061350;
    v12[1] = v8;
    v11[2] = @"RDAnalyticsSyncSideKey";
    v11[3] = @"RDAnalyticsFileNameKey";
    _OWORD v12[2] = &off_100061338;
    v12[3] = a2;
    v11[4] = @"RDAnalyticsKeyNameKey";
    v12[4] = v9;
    sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5]);
    AnalyticsSendEvent();
  }
}

NSDictionary *sub_1000404A0(uint64_t a1)
{
  v4[0] = @"RDAnalyticsCacheDeleteUrgencyKey";
  uint64_t v2 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v4[1] = @"RDAnalyticsCacheDeleteCallbackTypeKey";
  v5[0] = v2;
  v5[1] = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  return sub_10002E1F4((uint64_t)+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2]);
}

void *sub_1000405A0(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  if (!a1) {
    return 0;
  }
  v20.receiver = a1;
  v20.super_class = (Class)SRDatastore;
  id v11 = [super init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11[1] = a5;
    if (a6) {
      unint64_t v13 = (unint64_t)((double)*(unint64_t *)(a6 + 16) * *(float *)(a6 + 44));
    }
    else {
      unint64_t v13 = 0;
    }
    NSUInteger v14 = NSPageSize();
    if (v14 > v13) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v13 / v14;
    }
    unint64_t v16 = v15 * NSPageSize();
    if (a6)
    {
      _OWORD v12[2] = *(void *)(a6 + 32);
      int v17 = *(_DWORD *)(a6 + 40);
      unint64_t v18 = *(void *)(a6 + 24);
    }
    else
    {
      unint64_t v18 = 0;
      _OWORD v12[2] = 0;
      int v17 = 0;
    }
    *((_DWORD *)v12 + 6) = v17;
    v12[4] = (id)a6;
    void v12[5] = sub_100041350([SRFrameStore alloc], a2, v16, v12[1], a6);
    if (a3) {
      v12[6] = sub_100041350([SRFrameStore alloc], a3, v18, v12[1], a6);
    }
    if (a4) {
      v12[7] = sub_100041350([SRFrameStore alloc], a4, v18, v12[1], a6);
    }
  }
  return v12;
}

BOOL sub_100040784(BOOL result, const char *a2, z_size_t a3, SRError **a4, double a5)
{
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  id Property = objc_getProperty((id)result, a2, 40, 1);
  if (!Property)
  {
    uint64_t v20 = qword_10006EC70;
    if (!os_log_type_enabled((os_log_t)qword_10006EC70, OS_LOG_TYPE_INFO)) {
      goto LABEL_43;
    }
    LOWORD(v41) = 0;
    long long v21 = "No disk space available, dropping data";
    long long v22 = v20;
    os_log_type_t v23 = OS_LOG_TYPE_INFO;
    uint32_t v24 = 2;
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, (uint8_t *)&v41, v24);
    goto LABEL_43;
  }
  uint64_t v11 = (uint64_t)Property;
  uint64_t v12 = (void *)Property[2];
  if (v12) {
    unint64_t v13 = v12[6] - v12[3] + v12[2];
  }
  else {
    unint64_t v13 = 0;
  }
  if (v13 >= a3 + 20) {
    goto LABEL_21;
  }
  NSUInteger v14 = qword_10006EC70;
  if (os_log_type_enabled((os_log_t)qword_10006EC70, OS_LOG_TYPE_INFO))
  {
    if (v12) {
      z_size_t v15 = v12[6] - v12[3] + v12[2];
    }
    else {
      z_size_t v15 = 0;
    }
    int v41 = 134349312;
    z_size_t v42 = v15;
    __int16 v43 = 2050;
    z_size_t v44 = a3 + 20;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Not enough free space (%{public}zu) to write %{public}zu. Attempting to expand the mapped region", (uint8_t *)&v41, 0x16u);
  }
  NSUInteger v16 = *(void *)(v9 + 16) * NSPageSize();
  uint64_t v17 = *(void *)(v11 + 24);
  if (v17 && (uint64_t v18 = *(void *)(v17 + 16)) != 0)
  {
    uint64_t v19 = *(void *)(v18 + 4);
  }
  else
  {
    uint64_t v25 = *(void *)(v11 + 16);
    if (v25) {
      uint64_t v19 = *(void *)(v25 + 24) - *(void *)(v25 + 16) + 56;
    }
    else {
      uint64_t v19 = 56;
    }
  }
  NSUInteger v26 = (unint64_t)((double)(v19 + a3) * *(float *)(v9 + 24));
  uint64_t v27 = qword_10006EC70;
  if (v16 <= v26)
  {
    if (!os_log_type_enabled((os_log_t)qword_10006EC70, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    if (v17 && (uint64_t v31 = *(void *)(v17 + 16)) != 0)
    {
      uint64_t v32 = *(void *)(v31 + 4);
    }
    else
    {
      uint64_t v39 = *(void *)(v11 + 16);
      if (v39) {
        uint64_t v32 = *(void *)(v39 + 24) - *(void *)(v39 + 16) + 56;
      }
      else {
        uint64_t v32 = 56;
      }
    }
    int v41 = 134349312;
    z_size_t v42 = a3;
    __int16 v43 = 2050;
    z_size_t v44 = v16 - v32;
    long long v21 = "Trying to write %{public}zd but only have %{public}llul available. Dropping the data.";
    long long v22 = v27;
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    uint32_t v24 = 22;
    goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)qword_10006EC70, OS_LOG_TYPE_INFO))
  {
    int v41 = 134217984;
    z_size_t v42 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Expanding the mapped region to %llu bytes while a new segment is fetched", (uint8_t *)&v41, 0xCu);
  }
  if ((sub_100041D8C(v11, v26) & 1) == 0)
  {
LABEL_43:
    if (a4)
    {
      long long v40 = +[SRError errorWithCode:12291];
      BOOL result = 0;
      *a4 = v40;
      return result;
    }
    return 0;
  }
LABEL_21:
  uint64_t v28 = *(void *)(v11 + 24);
  if (v28 && (uint64_t v29 = *(void *)(v28 + 16)) != 0)
  {
    uint64_t v30 = *(void *)(v29 + 4);
  }
  else
  {
    uint64_t v33 = *(void *)(v11 + 16);
    if (v33) {
      uint64_t v30 = *(void *)(v33 + 24) - *(void *)(v33 + 16) + 56;
    }
    else {
      uint64_t v30 = 56;
    }
  }
  sub_100042064(v11, (const Bytef *)a2, a3, a4, a5);
  uint64_t v34 = *(void *)(v11 + 24);
  if (v34 && (uint64_t v35 = *(void *)(v34 + 16)) != 0)
  {
    unint64_t v36 = *(void *)(v35 + 4);
  }
  else
  {
    uint64_t v37 = *(void *)(v11 + 16);
    if (v37) {
      unint64_t v36 = *(void *)(v37 + 24) - *(void *)(v37 + 16) + 56;
    }
    else {
      unint64_t v36 = 56;
    }
  }
  if (v36 >= v30 + a3) {
    return 1;
  }
  long long v38 = qword_10006EC70;
  BOOL result = os_log_type_enabled((os_log_t)qword_10006EC70, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v41) = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Failed to write frames", (uint8_t *)&v41, 2u);
    return 0;
  }
  return result;
}

void sub_100040B40(void *a1, uint64_t a2, double a3, double a4)
{
  if (a1)
  {
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id Property = (SRFramesStoreOffsetEnumerator *)objc_getProperty(a1, (SEL)a2, 40, 1);
    uint64_t v9 = sub_100041FF8(Property, 0);
    id v10 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          double v15 = *(double *)v14;
          if (*(double *)v14 <= a3 || v15 > a4)
          {
            if (v15 > a4) {
              return;
            }
          }
          else
          {
            uint64_t v17 = (SRFramesStoreOffsetEnumerator *)a1[6];
            if (v17)
            {
              sub_100040D3C(v17, &v31, &v30, v15);
              if (v31) {
                uint64_t v18 = *(unsigned int *)(v31 + 16);
              }
              else {
                uint64_t v18 = 0;
              }
              uint64_t v19 = v31 + 20;
            }
            else
            {
              uint64_t v18 = 0;
              uint64_t v19 = 0;
            }
            uint64_t v20 = (SRFramesStoreOffsetEnumerator *)a1[7];
            if (v20)
            {
              sub_100040D3C(v20, &v29, &v28, v15);
              if (v29) {
                uint64_t v21 = *(unsigned int *)(v29 + 16);
              }
              else {
                uint64_t v21 = 0;
              }
              uint64_t v22 = v29 + 20;
            }
            else
            {
              uint64_t v21 = 0;
              uint64_t v22 = 0;
            }
            char v23 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, double))(a2 + 16))(a2, v14 + 20, *(unsigned int *)(v14 + 16), v19, v18, v22, v21, v15);
            if (v15 > a4 || (v23 & 1) == 0) {
              return;
            }
          }
        }
        id v11 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v11);
    }
  }
}

void sub_100040D3C(SRFramesStoreOffsetEnumerator *a1, uint64_t *a2, uint64_t *a3, double a4)
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = sub_100041FF8(a1, 0);
  unint64_t v9 = [(SRFramesStoreOffsetEnumerator *)v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (!v9)
  {
    uint64_t v19 = 0;
    *a2 = 0;
    goto LABEL_29;
  }
  unint64_t v10 = v9;
  char v23 = a3;
  long long v24 = a2;
  id v11 = 0;
  uint64_t v12 = *(void *)v26;
LABEL_3:
  uint64_t v13 = 0;
  uint64_t v14 = v11;
  while (1)
  {
    if (*(void *)v26 != v12) {
      objc_enumerationMutation(v8);
    }
    id v11 = *(double **)(*((void *)&v25 + 1) + 8 * v13);
    double v15 = qword_10006EC70;
    if (os_log_type_enabled((os_log_t)qword_10006EC70, OS_LOG_TYPE_DEBUG))
    {
      if (a1) {
        unint64_t offset = a1[1]._offset;
      }
      else {
        unint64_t offset = 0;
      }
      double v17 = *v11;
      *(_DWORD *)stat buf = 138413058;
      unint64_t v30 = offset;
      __int16 v31 = 2048;
      double v32 = v17;
      __int16 v33 = 2048;
      double v34 = a4;
      __int16 v35 = 2048;
      unint64_t v36 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "metadata segment: %@, metadata frame time: %f, sample time: %f, current metadata object: %p", buf, 0x2Au);
    }
    if (*v11 > a4) {
      break;
    }
    ++v13;
    uint64_t v14 = v11;
    if (v10 == v13)
    {
      unint64_t v18 = -[SRFramesStoreOffsetEnumerator countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16, *v11);
      unint64_t v10 = v18;
      uint64_t v14 = v11;
      if (v18) {
        goto LABEL_3;
      }
      break;
    }
  }
  uint64_t v19 = 0;
  *long long v24 = (uint64_t)v14;
  if (!a1)
  {
    a3 = v23;
    goto LABEL_29;
  }
  a3 = v23;
  if (!v14)
  {
LABEL_29:
    *a3 = v19;
    return;
  }
  uint64_t v20 = (uint64_t)v14 + *((unsigned int *)v14 + 4) + 20;
  if (!sub_100041E2C((uint64_t)a1, v20))
  {
    uint64_t v19 = 0;
    goto LABEL_29;
  }
  uint64_t *v23 = v20;
  if (v20)
  {
    if (*(double *)v20 != -1.0 && *(double *)v20 <= a4)
    {
      *long long v24 = v20;
      uint64_t v22 = v20 + *(unsigned int *)(v20 + 16) + 20;
      if (sub_100041E2C((uint64_t)a1, v22)) {
        uint64_t v19 = v22;
      }
      else {
        uint64_t v19 = 0;
      }
      goto LABEL_29;
    }
  }
}

void sub_100040F88(uint64_t *a1, uint64_t a2, double a3, double a4)
{
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id Property = (SRFramesStoreOffsetEnumerator *)objc_getProperty(a1, (SEL)a2, 40, 1);
    unint64_t v9 = sub_100041FF8(Property, 0);
    id v10 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(double **)(*((void *)&v17 + 1) + 8 * v13);
        double v15 = *v14;
        if (*v14 >= a3 && v15 <= a4)
        {
          sub_100042448(a1[5], (uint64_t)v14);
          (*(void (**)(uint64_t, double))(a2 + 16))(a2, v15);
        }
        if (v15 > a4) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            goto LABEL_4;
          }
          return;
        }
      }
    }
  }
}

NSString *sub_1000410D8(NSString *result)
{
  if (result)
  {
    int v1 = [(NSString *)result fileDescriptor];
    if (v1 < 0 || fcntl(v1, 50, v2) < 0) {
      return 0;
    }
    else {
      return +[NSString stringWithUTF8String:v2];
    }
  }
  return result;
}

void sub_100041204(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)a1 = 1195725633;
  *(void *)(a1 + 4) = a2;
  *(void *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 20) = a4;
  *(_OWORD *)(a1 + 24) = 0u;
  long long v4 = (_OWORD *)(a1 + 24);
  if (a3)
  {
    id v5 = (const char *)[a3 UTF8String];
    size_t v6 = strlen(v5);
    if (v6 >= 0x21)
    {
      size_t v7 = v6;
      uint64_t v8 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134349312;
        size_t v12 = v7;
        __int16 v13 = 2050;
        uint64_t v14 = 32;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Segment name is too large to store in the segment header. Truncating the segment name of %{public}zu to %{public}lu", (uint8_t *)&v11, 0x16u);
      }
    }
    long long v9 = *((_OWORD *)v5 + 1);
    *long long v4 = *(_OWORD *)v5;
    v4[1] = v9;
  }
  else
  {
    id v10 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No segment name provided for the segment header", (uint8_t *)&v11, 2u);
    }
  }
}

uint64_t sub_100041350(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1) {
    return 0;
  }
  v53.receiver = a1;
  v53.super_class = (Class)SRFrameStore;
  long long v9 = [super init];
  uint64_t v10 = (uint64_t)v9;
  if (!v9) {
    return v10;
  }
  if (a5) {
    unint64_t v11 = *(void *)(a5 + 8);
  }
  else {
    unint64_t v11 = 0;
  }
  if (v11 >= 0xFFFFFFFF) {
    int v12 = -1;
  }
  else {
    int v12 = v11;
  }
  _DWORD v9[2] = v12;
  uint64_t v56 = 0;
  long long v55 = 0u;
  memset(v54, 0, sizeof(v54));
  self;
  id v13 = [a2 seekToEndOfFile];
  [a2 seekToFileOffset:0];
  if (a2)
  {
    uint64_t v14 = [sub_1000410D8((NSString *)a2) lastPathComponent];
    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (!v13) {
      goto LABEL_21;
    }
  }
  double v15 = sub_1000410D8((NSString *)a2);
  if ((unint64_t)v13 > 0x37)
  {
    id v21 = [a2 readDataOfLength:56];
    [a2 seekToFileOffset:0];
    if (v21 && (unint64_t)[v21 length] > 0x37)
    {
      long long v24 = [v21 bytes];
      long long v25 = v24;
      if (*(_DWORD *)v24 == 1195725633)
      {
        long long v52 = v24[1];
        v54[0] = *v24;
        v54[1] = v52;
        long long v55 = v24[2];
        uint64_t v56 = *((void *)v24 + 6);
        goto LABEL_22;
      }
      uint64_t v26 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 68289794;
        *(_DWORD *)double v58 = 4;
        *(_WORD *)&v58[4] = 2082;
        *(void *)&v58[6] = "ASEG";
        *(_WORD *)&v58[14] = 1042;
        *(_DWORD *)&v58[16] = 4;
        *(_WORD *)id v59 = 2082;
        *(void *)&v59[2] = v25;
        __int16 v60 = 2114;
        id v61 = v15;
        long long v17 = "Segment header magic number %{public}.4s doesn't match %{public}.4s in file %{public}@. Potentially overwr"
              "iting whatever data is currently there";
        long long v18 = v26;
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
        uint32_t v20 = 44;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v22 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO))
      {
        id v23 = [v21 length];
        *(_DWORD *)stat buf = 138543618;
        *(void *)double v58 = v15;
        *(_WORD *)&v58[8] = 2050;
        *(void *)&v58[10] = v23;
        long long v17 = "Unable to read frames file segment header %{public}@. Received data of %{public}lu length. Potentially ove"
              "rwriting whatever data is currently there";
        long long v18 = v22;
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        uint32_t v20 = 22;
        goto LABEL_20;
      }
    }
  }
  else
  {
    uint64_t v16 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138543362;
      *(void *)double v58 = v15;
      long long v17 = "Frames file %{public}@ is invalid because the current size is less than a valid segment header. Potentially "
            "overwriting whatever data is currently there.";
      long long v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_INFO;
      uint32_t v20 = 12;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
    }
  }
LABEL_21:
  sub_100041204((uint64_t)v54, 0, v14, v12);
LABEL_22:
  id v27 = [a2 seekToEndOfFile];
  [a2 seekToFileOffset:0];
  uint64_t v29 = sub_1000410D8((NSString *)a2);
  unint64_t v30 = *(void *)((char *)v54 + 4);
  if (*(void *)((char *)v54 + 4) > (unint64_t)v27)
  {
    uint64_t v31 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138543874;
      *(void *)double v58 = v29;
      *(_WORD *)&v58[8] = 2048;
      *(void *)&v58[10] = v30;
      *(_WORD *)&v58[18] = 2050;
      *(void *)id v59 = a3;
      double v32 = "Segment header in %{public}@ says file size is %llu but that is larger than the max size (%{public}lu) we can support.";
      __int16 v33 = v31;
      os_log_type_t v34 = OS_LOG_TYPE_INFO;
      uint32_t v35 = 32;
LABEL_43:
      _os_log_impl((void *)&_mh_execute_header, v33, v34, v32, buf, v35);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  if (!(*(void *)((char *)v54 + 4) | a4 & 0xFFFFFFFFFFFFFFFDLL))
  {
    uint64_t v45 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543362;
      *(void *)double v58 = v29;
      double v32 = "Not mapping an empty file %{public}@";
      __int16 v33 = v45;
      os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
      uint32_t v35 = 12;
      goto LABEL_43;
    }
LABEL_44:

    return 0;
  }
  int v36 = DWORD1(v54[1]);
  int v37 = *(_DWORD *)(v10 + 8);
  if (DWORD1(v54[1]) != v37)
  {
    long long v38 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = "";
      *(_DWORD *)stat buf = 138544130;
      *(void *)double v58 = v29;
      *(_WORD *)&v58[8] = 1026;
      if (a4 == 1) {
        uint64_t v39 = "Potentially overwriting whatever data is currently there";
      }
      *(_DWORD *)&v58[10] = v36;
      *(_WORD *)&v58[14] = 1026;
      *(_DWORD *)&v58[16] = v37;
      *(_WORD *)id v59 = 2080;
      *(void *)&v59[2] = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Segment versions of %{public}@ don't match. Received %{public}d, expected %{public}d.%s", buf, 0x22u);
    }
    unint64_t v30 = 0;
    *(void *)((char *)v54 + 4) = 0;
  }
  if (a2) {
    long long v40 = [sub_1000410D8((NSString *)a2) lastPathComponent];
  }
  else {
    long long v40 = 0;
  }
  objc_setProperty_nonatomic_copy((id)v10, v28, v40, 40);
  if (v30 <= a3) {
    uint64_t v41 = a3;
  }
  else {
    uint64_t v41 = v30;
  }
  *(void *)(v10 + 32) = a4;
  z_size_t v42 = sub_1000418FC(a4, (uint64_t)v54, v41, v30);
  *(void *)(v10 + 56) = a2;
  if (a4 == 1 && (sub_100041A80(v10, v41) & 1) == 0)
  {
    id v51 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to resize backing file", buf, 2u);
    }
    goto LABEL_44;
  }
  *(void *)(v10 + 16) = [(NSArray *)v42 lastObject];
  if ([(NSArray *)v42 count] <= 1)
  {
    id v44 = *(id *)(v10 + 24);
  }
  else
  {
    id v44 = [(NSArray *)v42 firstObject];
    *(void *)(v10 + 24) = v44;
  }
  id Property = objc_getProperty((id)v10, v43, 56, 1);
  sub_100042794((uint64_t)v44, Property);
  uint64_t v47 = *(void *)(v10 + 16);
  id v49 = objc_getProperty((id)v10, v48, 56, 1);
  sub_100042794(v47, v49);
  *(void *)(v10 + 48) = *(void *)((char *)v54 + 12);
  return v10;
}

NSArray *sub_1000418FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4;
  switch(a1)
  {
    case 2:
      id v6 = sub_10004255C([SRMemoryMapping alloc], a4 - 56, 2, 1, 56);
      id v14 = v6;
      size_t v7 = &v14;
      goto LABEL_6;
    case 1:
      id v10 = sub_10004255C([SRMemoryMapping alloc], 56, 2, 1, 0);
      uint64_t v11 = a3 - v5;
      if (!*(void *)(a2 + 4)) {
        uint64_t v5 = 56;
      }
      id v6 = sub_10004255C([SRMemoryMapping alloc], v11, 2, 2, v5);
      v13[0] = v10;
      v13[1] = v6;
      long long v4 = +[NSArray arrayWithObjects:v13 count:2];

      goto LABEL_10;
    case 0:
      id v6 = sub_10004255C([SRMemoryMapping alloc], a4 - 56, 1, 1, 56);
      id v15 = v6;
      size_t v7 = &v15;
LABEL_6:
      long long v4 = +[NSArray arrayWithObjects:v7 count:1];
LABEL_10:

      break;
  }
  return v4;
}

uint64_t sub_100041A80(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (*(void *)(result + 32) == 1)
    {
      [*(id *)(result + 56) truncateFileAtOffset:a2];
      return 1;
    }
    else
    {
      uint64_t v2 = qword_10006EC78;
      BOOL result = os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)BOOL v3 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Attempting to resize a non-writable file", v3, 2u);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100041D8C(uint64_t a1, NSUInteger bytes)
{
  if (!a1) {
    return 0;
  }
  NSUInteger v3 = NSRoundUpToMultipleOfPageSize(bytes);
  if (!sub_100041A80(a1, v3)) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return 0;
  }
  id v6 = sub_1000418FC(*(void *)(a1 + 32), v5, v3, *(void *)(v5 + 4));

  id v7 = [(NSArray *)v6 lastObject];
  *(void *)(a1 + 16) = v7;
  uint64_t v8 = *(void **)(a1 + 56);

  return sub_100042794((uint64_t)v7, v8);
}

uint64_t sub_100041E2C(uint64_t result, uint64_t a2)
{
  if (result)
  {
    NSUInteger v3 = (const Bytef *)(a2 + 20);
    z_size_t v4 = *(unsigned int *)(a2 + 16);
    unint64_t v5 = *(void *)(result + 16);
    if (v5) {
      unint64_t v5 = *(void *)(v5 + 24);
    }
    if (a2 + 20 + v4 > v5) {
      return 0;
    }
    uLong v6 = adler32(0, 0, 0);
    uLong v7 = adler32_z(v6, v3, v4);
    uint64_t v8 = *(void *)(a2 + 8);
    BOOL result = v7 == v8;
    if (v7 != v8 && v8 != 0)
    {
      id v10 = qword_10006EC78;
      BOOL result = os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO);
      if (result)
      {
        int v11 = 134218240;
        uint64_t v12 = v8;
        __int16 v13 = 2050;
        uLong v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Checksums don't match. Header: %llu, Generated checksum: %{public}lu. Skipping frame.", (uint8_t *)&v11, 0x16u);
        return 0;
      }
    }
  }
  return result;
}

SRFramesStoreOffsetEnumerator *sub_100041FF8(SRFramesStoreOffsetEnumerator *result, unint64_t a2)
{
  if (result)
  {
    NSUInteger v3 = (SRFrameStore *)result;
    z_size_t v4 = [SRFramesStoreOffsetEnumerator alloc];
    if (v4)
    {
      v5.receiver = v4;
      v5.super_class = (Class)SRFramesStoreOffsetEnumerator;
      z_size_t v4 = (SRFramesStoreOffsetEnumerator *)[(SRFramesStoreOffsetEnumerator *)&v5 init];
      if (v4)
      {
        v4->_framesStore = v3;
        v4->_unint64_t offset = a2;
      }
    }
    return v4;
  }
  return result;
}

uint64_t sub_100042064(uint64_t result, const Bytef *a2, z_size_t a3, SRError **a4, double a5)
{
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(result + 24);
    if (!v7 || (uint64_t v8 = *(void *)(v7 + 16)) == 0)
    {
      id v15 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)stat buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to find a segment header while writing. Dropping incoming data", buf, 2u);
        if (!a4) {
          return 0;
        }
      }
      else if (!a4)
      {
        return 0;
      }
      uint64_t v14 = 12294;
      goto LABEL_27;
    }
    if (!*(void *)(v8 + 4))
    {
      uint64_t v28 = 0;
      long long v27 = 0u;
      memset(buf, 0, sizeof(buf));
      sub_100041204((uint64_t)buf, 56, *(void **)(result + 40), *(_DWORD *)(result + 8));
      sub_100042AA8(*(void **)(v6 + 24), buf, 0, 0x38uLL);
    }
    uint64_t v12 = *(void **)(v6 + 16);
    if (v12) {
      uint64_t v12 = (void *)(v12[6] - v12[3] + v12[2]);
    }
    if ((unint64_t)v12 < a3 + 20)
    {
      __int16 v13 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)stat buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No space left to write to the mapped region", buf, 2u);
        if (a4) {
          goto LABEL_11;
        }
      }
      else if (a4)
      {
LABEL_11:
        uint64_t v14 = 12291;
LABEL_27:
        id v21 = +[SRError errorWithCode:v14];
        BOOL result = 0;
        *a4 = v21;
        return result;
      }
      return 0;
    }
    double v16 = *(double *)(v6 + 48);
    if (v16 >= a5)
    {
      os_log_type_t v19 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 134218240;
        *(double *)&uint8_t buf[4] = a5;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Frame should come in chronological order. Input %f < last %f", buf, 0x16u);
        if (!a4) {
          return 0;
        }
      }
      else if (!a4)
      {
        return 0;
      }
      uint64_t v14 = 12292;
      goto LABEL_27;
    }
    double Current = SRAbsoluteTimeGetCurrent();
    if (Current + 10.0 < a5)
    {
      long long v18 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 134218240;
        *(double *)&uint8_t buf[4] = a5;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = Current;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Timestamp is from the future. Input %f, Current: %f", buf, 0x16u);
        if (a4) {
          goto LABEL_19;
        }
      }
      else if (a4)
      {
LABEL_19:
        uint64_t v14 = 12296;
        goto LABEL_27;
      }
      return 0;
    }
    if (HIDWORD(a3))
    {
      uint32_t v20 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 134349312;
        *(void *)&uint8_t buf[4] = a3;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = -1;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Sample too large %{public}zu but only %u supported", buf, 0x12u);
        if (!a4) {
          return 0;
        }
      }
      else if (!a4)
      {
        return 0;
      }
      uint64_t v14 = 12293;
      goto LABEL_27;
    }
    uLong v22 = adler32(0, 0, 0);
    uLong v23 = adler32_z(v22, a2, a3);
    *(double *)stat buf = a5;
    *(void *)&uint8_t buf[8] = v23;
    *(_DWORD *)&uint8_t buf[16] = a3;
    sub_100042B20(*(void **)(v6 + 16), buf, 0x14uLL);
    sub_100042B20(*(void **)(v6 + 16), a2, a3);
    *(double *)(v6 + 48) = a5;
    long long v24 = *(void **)(v6 + 16);
    if (v24) {
      long long v24 = (void *)(v24[3] + v24[4] - v24[2]);
    }
    long long v25 = v24;
    sub_100042AA8(*(void **)(v6 + 24), &v25, 4, 8uLL);
    sub_100042AA8(*(void **)(v6 + 24), (const void *)(v6 + 48), 12, 8uLL);
    return 1;
  }
  return result;
}

void sub_100042448(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(void *)(a2 + 8) = 0;
    errno_t v2 = memset_s((void *)(a2 + 20), *(unsigned int *)(a2 + 16), 0, *(unsigned int *)(a2 + 16));
    if (v2 < 0)
    {
      errno_t v3 = v2;
      z_size_t v4 = qword_10006EC78;
      if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_FAULT))
      {
        v5[0] = 67240192;
        v5[1] = v3;
        _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to zero out memory. %{public, darwin.errno}d", (uint8_t *)v5, 8u);
      }
    }
  }
}

id sub_10004255C(id result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  if (result)
  {
    v9.receiver = result;
    v9.super_class = (Class)SRMemoryMapping;
    BOOL result = [super init];
    if (result)
    {
      *((void *)result + 6) = a2;
      *((_DWORD *)result + 2) = a3;
      *((_DWORD *)result + 3) = a4;
      *((void *)result + 4) = a5;
    }
  }
  return result;
}

uint64_t sub_100042794(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    NSUInteger v4 = *(void *)(result + 32);
    off_t v5 = NSRoundDownToMultipleOfPageSize(v4);
    NSUInteger v6 = v4 - v5;
    size_t v7 = NSRoundUpToMultipleOfPageSize(*(void *)(v3 + 48) + v4 - v5);
    uint64_t v8 = (char *)mmap(0, v7, *(_DWORD *)(v3 + 8), 1, (int)[a2 fileDescriptor], v5);
    if (v8 == (char *)-1)
    {
      uint64_t v12 = qword_10006EC80;
      BOOL result = os_log_type_enabled((os_log_t)qword_10006EC80, OS_LOG_TYPE_FAULT);
      if (result)
      {
        int v13 = *__error();
        int v15 = 138543618;
        double v16 = a2;
        __int16 v17 = 1026;
        int v18 = v13;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Unable to mmap storage file %{public}@ because %{public, darwin.errno}d", (uint8_t *)&v15, 0x12u);
        return 0;
      }
    }
    else
    {
      *(void *)(v3 + 56) = v7;
      *(void *)(v3 + 40) = v8;
      objc_super v9 = &v8[v6];
      *(void *)(v3 + 16) = &v8[v6];
      int v10 = *(_DWORD *)(v3 + 12);
      if (v10 != 2) {
        v9 += *(void *)(v3 + 48);
      }
      *(void *)(v3 + 24) = v9;
      if (madvise(v8, v7, v10) < 0)
      {
        int v11 = qword_10006EC80;
        if (os_log_type_enabled((os_log_t)qword_10006EC80, OS_LOG_TYPE_FAULT))
        {
          int v14 = *__error();
          int v15 = 67240192;
          LODWORD(v16) = v14;
          _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to madvise() because %{public, darwin.errno}d", (uint8_t *)&v15, 8u);
        }
      }
      return 1;
    }
  }
  return result;
}

BOOL sub_1000429B8(BOOL result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v4 = result;
    BOOL result = 0;
    if (a4)
    {
      if ((*(_DWORD *)(v4 + 8) & 2) != 0)
      {
        if ((unint64_t)(*(void *)(v4 + 40) + 1) < 2) {
          return 0;
        }
        unint64_t v6 = *(void *)(v4 + 24);
        if (__CFADD__(v6, a3))
        {
          size_t v7 = qword_10006EC80;
          BOOL result = os_log_type_enabled((os_log_t)qword_10006EC80, OS_LOG_TYPE_ERROR);
          if (result)
          {
            int v10 = 134349056;
            uint64_t v11 = a3;
            _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}zu is too large to write", (uint8_t *)&v10, 0xCu);
            return 0;
          }
        }
        else
        {
          unint64_t v8 = *(void *)(v4 + 16);
          return v6 >= a2 && v8 <= a2;
        }
      }
    }
  }
  return result;
}

void *sub_100042AA8(void *result, const void *a2, uint64_t a3, size_t a4)
{
  if (result)
  {
    unint64_t v6 = (void *)(*((void *)result + 2) + a3);
    BOOL result = (void *)sub_1000429B8((BOOL)result, (unint64_t)v6, a4, (uint64_t)a2);
    if (result)
    {
      return memcpy(v6, a2, a4);
    }
  }
  return result;
}

void sub_100042B20(void *a1, const void *a2, size_t a3)
{
  if (a1)
  {
    unint64_t v6 = (char *)a1[3];
    if (sub_1000429B8((BOOL)a1, (unint64_t)v6, a3, (uint64_t)a2))
    {
      size_t v7 = a1[6] - a1[3] + a1[2];
      if (v7 >= a3)
      {
        a1[3] = &v6[a3];
        memcpy(v6, a2, a3);
      }
      else
      {
        unint64_t v8 = qword_10006EC80;
        if (os_log_type_enabled((os_log_t)qword_10006EC80, OS_LOG_TYPE_INFO))
        {
          int v9 = 134349312;
          size_t v10 = a3;
          __int16 v11 = 2050;
          size_t v12 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "More bytes requested %{public}zu than the capacity %{public}zu. Client should call -freeSpace: to avoid this", (uint8_t *)&v9, 0x16u);
        }
      }
    }
  }
}

void *sub_100042C68(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)SRDefaults;
  uint64_t v3 = [super init];
  if (v3)
  {
    v3[1] = [[a2 objectForKeyedSubscript:@"DatastoreVersion"] unsignedIntegerValue];
    void v3[2] = [[objc_msgSend(a2, "objectForKeyedSubscript:", @"SegmentSize") unsignedLongValue];
    v3[3] = [[a2 objectForKeyedSubscript:@"MetadataSize"] unsignedLongValue];
    v3[4] = [[a2 objectForKeyedSubscript:@"MaxAllowedMappedPages"] unsignedLongValue];
    [objc_msgSend(a2, "objectForKeyedSubscript:", @"SegmentResizeFactor") floatValue];
    *((_DWORD *)v3 + 10) = v4;
    [objc_msgSend(a2, "objectForKeyedSubscript:", @"SegmentPaddingFactor") floatValue];
    *((_DWORD *)v3 + 11) = v5;
  }
  return v3;
}

uint64_t AnalyticsIsEventUsed()
{
  return _AnalyticsIsEventUsed();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCrypt(op, alg, options, key, keyLength, iv, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return _CCRandomGenerateBytes(bytes, count);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return _CFBundleCopyInfoDictionaryForURL(url);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSUInteger NSPageSize(void)
{
  return _NSPageSize();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return _NSRoundDownToMultipleOfPageSize(bytes);
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return _NSRoundUpToMultipleOfPageSize(bytes);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

uint64_t TCCAccessCheckAuditToken()
{
  return _TCCAccessCheckAuditToken();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return _TCCAccessCopyBundleIdentifiersDisabledForService();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return _TCCAccessCopyBundleIdentifiersForService();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return _TCCAccessCopyInformationForBundleId();
}

uint64_t TCCAccessGetOverride()
{
  return _TCCAccessGetOverride();
}

uint64_t TCCAccessPreflight()
{
  return _TCCAccessPreflight();
}

uint64_t TCCAccessReset()
{
  return _TCCAccessReset();
}

uint64_t TCCAccessResetForBundleId()
{
  return _TCCAccessResetForBundleId();
}

uint64_t TCCAccessSetForBundleId()
{
  return _TCCAccessSetForBundleId();
}

uint64_t TCCAccessSetOverride()
{
  return _TCCAccessSetOverride();
}

uint64_t TMConvertTicksToSeconds()
{
  return _TMConvertTicksToSeconds();
}

uint64_t TMGetKernelMonotonicClock()
{
  return _TMGetKernelMonotonicClock();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __isinfd()
{
  return ___isinfd();
}

uint64_t __isnand()
{
  return ___isnand();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return _adler32(adler, buf, len);
}

uLong adler32_z(uLong adler, const Bytef *buf, z_size_t len)
{
  return _adler32_z(adler, buf, len);
}

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_data_block()
{
  return _archive_read_data_block();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header()
{
  return _archive_read_next_header();
}

uint64_t archive_read_open_memory()
{
  return _archive_read_open_memory();
}

uint64_t archive_read_support_filter_all()
{
  return _archive_read_support_filter_all();
}

uint64_t archive_read_support_format_all()
{
  return _archive_read_support_format_all();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_add_filter_none()
{
  return _archive_write_add_filter_none();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_data_block()
{
  return _archive_write_data_block();
}

uint64_t archive_write_disk_new()
{
  return _archive_write_disk_new();
}

uint64_t archive_write_disk_set_options()
{
  return _archive_write_disk_set_options();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return _archive_write_disk_set_standard_lookup();
}

uint64_t archive_write_finish_entry()
{
  return _archive_write_finish_entry();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_fd()
{
  return _archive_write_open_fd();
}

uint64_t archive_write_set_bytes_per_block()
{
  return _archive_write_set_bytes_per_block();
}

uint64_t archive_write_set_format_pax()
{
  return _archive_write_set_format_pax();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_encode_scratch_buffer_size(algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

uint64_t dirstat_np()
{
  return _dirstat_np();
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

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dyld_program_sdk_at_least()
{
  return _dyld_program_sdk_at_least();
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

uint64_t launch_set_system_service_enabled()
{
  return _launch_set_system_service_enabled();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

int madvise(void *a1, size_t a2, int a3)
{
  return _madvise(a1, a2, a3);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

double nan(const char *a1)
{
  return _nan(a1);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
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

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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

uint64_t xpc_strerror()
{
  return _xpc_strerror();
}

id objc_msgSend_UIBackgroundModes(void *a1, const char *a2, ...)
{
  return [a1 UIBackgroundModes];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLHostAllowedCharacterSet];
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

id objc_msgSend__originatingDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _originatingDeviceIdentifier];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allSensorsStore(void *a1, const char *a2, ...)
{
  return [a1 allSensorsStore];
}

id objc_msgSend_analyticsDelegate(void *a1, const char *a2, ...)
{
  return [a1 analyticsDelegate];
}

id objc_msgSend_appTags(void *a1, const char *a2, ...)
{
  return [a1 appTags];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authorizationError(void *a1, const char *a2, ...)
{
  return [a1 authorizationError];
}

id objc_msgSend_authorizationService(void *a1, const char *a2, ...)
{
  return [a1 authorizationService];
}

id objc_msgSend_authorizationVersion(void *a1, const char *a2, ...)
{
  return [a1 authorizationVersion];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_binarySampleRepresentation(void *a1, const char *a2, ...)
{
  return [a1 binarySampleRepresentation];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bypassHoldingPeriod(void *a1, const char *a2, ...)
{
  return [a1 bypassHoldingPeriod];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configurationDecodeError(void *a1, const char *a2, ...)
{
  return [a1 configurationDecodeError];
}

id objc_msgSend_connectionNotFoundError(void *a1, const char *a2, ...)
{
  return [a1 connectionNotFoundError];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return [a1 containingBundleRecord];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_datastoreBackend(void *a1, const char *a2, ...)
{
  return [a1 datastoreBackend];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deferIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 deferIfNeeded];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_eligibleDaemons(void *a1, const char *a2, ...)
{
  return [a1 eligibleDaemons];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return [a1 endTime];
}

id objc_msgSend_extendedReason(void *a1, const char *a2, ...)
{
  return [a1 extendedReason];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return [a1 filters];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_from(void *a1, const char *a2, ...)
{
  return [a1 from];
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return [a1 genre];
}

id objc_msgSend_genreIdentifier(void *a1, const char *a2, ...)
{
  return [a1 genreIdentifier];
}

id objc_msgSend_getTimeSyncData(void *a1, const char *a2, ...)
{
  return [a1 getTimeSyncData];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_infoPlistAuthorizationCategory(void *a1, const char *a2, ...)
{
  return [a1 infoPlistAuthorizationCategory];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidEntitlementError(void *a1, const char *a2, ...)
{
  return [a1 invalidEntitlementError];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return [a1 isLocallyPaired];
}

id objc_msgSend_isRemoteSupported(void *a1, const char *a2, ...)
{
  return [a1 isRemoteSupported];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_legacyName(void *a1, const char *a2, ...)
{
  return [a1 legacyName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_markCompleted(void *a1, const char *a2, ...)
{
  return [a1 markCompleted];
}

id objc_msgSend_metadataEnabled(void *a1, const char *a2, ...)
{
  return [a1 metadataEnabled];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return [a1 nsuuid];
}

id objc_msgSend_onDemandWriterService(void *a1, const char *a2, ...)
{
  return [a1 onDemandWriterService];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_publicEntitlementValue(void *a1, const char *a2, ...)
{
  return [a1 publicEntitlementValue];
}

id objc_msgSend_readerAuthorizationBundleIdValues(void *a1, const char *a2, ...)
{
  return [a1 readerAuthorizationBundleIdValues];
}

id objc_msgSend_readerAuthorizationGroups(void *a1, const char *a2, ...)
{
  return [a1 readerAuthorizationGroups];
}

id objc_msgSend_readerAuthorizationValues(void *a1, const char *a2, ...)
{
  return [a1 readerAuthorizationValues];
}

id objc_msgSend_readerLastModifiedAuthorizationTimes(void *a1, const char *a2, ...)
{
  return [a1 readerLastModifiedAuthorizationTimes];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return [a1 relationship];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_roundingInterval(void *a1, const char *a2, ...)
{
  return [a1 roundingInterval];
}

id objc_msgSend_sampleClass(void *a1, const char *a2, ...)
{
  return [a1 sampleClass];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_sensor(void *a1, const char *a2, ...)
{
  return [a1 sensor];
}

id objc_msgSend_sensorConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sensorConfiguration];
}

id objc_msgSend_sensorConfigurationEnabled(void *a1, const char *a2, ...)
{
  return [a1 sensorConfigurationEnabled];
}

id objc_msgSend_sensorKitActive(void *a1, const char *a2, ...)
{
  return [a1 sensorKitActive];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_supportedIntents(void *a1, const char *a2, ...)
{
  return [a1 supportedIntents];
}

id objc_msgSend_supportsCurrentPlatform(void *a1, const char *a2, ...)
{
  return [a1 supportsCurrentPlatform];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return [a1 to];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return [a1 updateQueue];
}

id objc_msgSend_validatePreferWifiAssertion(void *a1, const char *a2, ...)
{
  return [a1 validatePreferWifiAssertion];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_writerAuthorizationGroups(void *a1, const char *a2, ...)
{
  return [a1 writerAuthorizationGroups];
}

id objc_msgSend_writerAuthorizationService(void *a1, const char *a2, ...)
{
  return [a1 writerAuthorizationService];
}

id objc_msgSend_writerAuthorizationValues(void *a1, const char *a2, ...)
{
  return [a1 writerAuthorizationValues];
}
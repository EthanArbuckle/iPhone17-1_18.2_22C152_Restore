uint64_t BCDefaultLog()
{
  if (qword_26DF8 != -1) {
    dispatch_once(&qword_26DF8, &stru_207A0);
  }
  return qword_26DF0;
}

void sub_3040(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_4F40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    v13 = BCDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_13D90((uint64_t)[v12 description], (uint64_t)&a11);
    }
    if (v11) {
      void *v11 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", @"com.apple.atc.Books", -2, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12));
    }
    objc_end_catch();
    JUMPOUT(0x4F10);
  }
  _Unwind_Resume(exception_object);
}

void sub_56EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exception_object);
    id v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_13E44((uint64_t)[v11 description], (uint64_t)&a11);
    }
    objc_end_catch();
    JUMPOUT(0x56B0);
  }
  _Unwind_Resume(exception_object);
}

void sub_59E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exception_object);
    id v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_13EE8((uint64_t)[v11 description], (uint64_t)&a11);
    }
    objc_end_catch();
    JUMPOUT(0x5964);
  }
  _Unwind_Resume(exception_object);
}

void sub_5C78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(exception_object);
    v18 = BCDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_13EE8((uint64_t)[v17 description], (uint64_t)&a17);
    }
    objc_end_catch();
    JUMPOUT(0x5C3CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_5DD8(_Unwind_Exception *a1)
{
}

void sub_6110(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    v3 = BCDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_13F8C(@"/var/mobile/Media/Books/Sync/Upload.plist", (uint64_t)[v2 description], (uint64_t)va);
    }
    objc_end_catch();
    JUMPOUT(0x5F44);
  }
  _Unwind_Resume(exception_object);
}

void sub_625C(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    v4 = BCDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_13FCC(v2, (uint64_t)[v3 description], (uint64_t)va);
    }
    objc_end_catch();
    JUMPOUT(0x622CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_6488(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    v4 = BCDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1400C((uint64_t)[v2 identifier], (uint64_t)objc_msgSend(v3, "description"), (uint64_t)va);
    }
    objc_end_catch();
    JUMPOUT(0x6458);
  }
  _Unwind_Resume(exception_object);
}

void sub_6628(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = BCDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1404C((uint64_t)[v2 description], (uint64_t)va);
    }
    objc_end_catch();
    JUMPOUT(0x6568);
  }
  _Unwind_Resume(exception_object);
}

void sub_7044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_706C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v8 = objc_opt_class();
  if (objc_msgSend((id)BCDynamicCast(v8, (uint64_t)objc_msgSend(a2, "objectForKey:", @"Persistent ID")), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "identifier")))
  {
    id v9 = [a2 mutableCopy];
    objc_msgSend(v9, "setObject:forKey:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "path"), "lastPathComponent"), @"Path");
    [*(id *)(a1 + 40) replaceObjectAtIndex:a3 withObject:v9];

    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_7958(uint64_t a1, void *a2, void *a3)
{
  id v7 = [*(id *)(a1 + 32) accountInfoForAssetAtPath:a2];
  if (objc_msgSend(objc_msgSend(v7, "appleID"), "length")
    && objc_msgSend(*(id *)(a1 + 32), "_stringFromObject:", objc_msgSend(a3, "objectForKey:", @"DSID")))
  {
    unsigned int v8 = [a2 hasPrefix:@"/var/mobile/Media/Books/Purchases"];
    id v9 = BCDefaultLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        int v14 = 138412290;
        v15 = a2;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "#D2D: Adding storeAsset D2D Local path: %@", (uint8_t *)&v14, 0xCu);
      }
      id v11 = [*(id *)(a1 + 32) pathsForDevice2DeviceRestoreRedownloadable];
    }
    else
    {
      if (v10)
      {
        int v14 = 138412290;
        v15 = a2;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "#D2D: Adding storeAsset D2D Redownloadable path: %@", (uint8_t *)&v14, 0xCu);
      }
      id v11 = [*(id *)(a1 + 32) pathsForDevice2DeviceRestoreLocal];
    }
    [v11 addObject:a2];
    [*(id *)(a1 + 32) addKnownAccountInfo:v7];
  }
  else
  {
    id v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = a2;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "#D2D: Adding !storeAsset D2D Local path: %@", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "pathsForDevice2DeviceRestoreLocal"), "addObject:", a2);
    v13 = BCDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = a2;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Adding !storeAsset path: %@", (uint8_t *)&v14, 0xCu);
    }
    [*(id *)(a1 + 40) addObject:a2];
  }
}

id sub_7EB8(uint64_t a1, void *a2, uint64_t a3)
{
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id result = [a2 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = BCDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v12 = *(_DWORD *)(a1 + 40);
          *(_DWORD *)buf = 67109634;
          int v19 = v12;
          __int16 v20 = 2048;
          uint64_t v21 = a3;
          __int16 v22 = 2112;
          uint64_t v23 = v10;
          _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "#D2D: enumeratePathsForBackupType:%u pathAttributes: %llu enumerating: %@", buf, 0x1Cu);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        if (v17) {
          return &dword_0 + 1;
        }
      }
      id v7 = [a2 countByEnumeratingWithState:&v13 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    return (id)(v17 != 0);
  }
  return result;
}

void sub_831C(_Unwind_Exception *a1)
{
}

void sub_8C58(_Unwind_Exception *a1)
{
}

void sub_A5DC(uint64_t a1, uint64_t a2)
{
}

void sub_A5EC(uint64_t a1)
{
}

void sub_A5F8(void *a1)
{
  id v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    *(void *)(a1[4] + 16) = objc_alloc_init((Class)NSMutableDictionary);
    id v2 = *(void **)(a1[4] + 16);
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = [v2 objectForKey:a1[5]];
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = [[BCPlist alloc] initWithPath:a1[5]];
    id v3 = [[ThreadSafeProxy alloc] initWithObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
    [*(id *)(a1[4] + 16) setObject:v3 forKey:a1[5]];

    *(void *)(*(void *)(a1[6] + 8) + 40) = v3;
  }
}

void sub_AD18(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  qword_26DD0 = (uint64_t)objc_msgSend(v1, "initWithObjects:", kExtensionIBOOKS, kExtensionEPUB, kExtensionPDF, 0);
}

id sub_ADFC(uint64_t a1)
{
  id result = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_msgSend(*(id *)(a1 + 32), "alternatePathForPlist:withNamePrefix:", @"/var/mobile/Media/Books/Books.plist", @"Backup-"), objc_msgSend(*(id *)(a1 + 32), "alternatePathForPlist:withNamePrefix:", @"/var/mobile/Media/Books/Purchases/Purchases.plist", @"Backup-"), objc_msgSend(*(id *)(a1 + 32), "alternatePathForPlist:withNamePrefix:", @"/var/mobile/Media/Books/Managed/Managed.plist", @"Backup-"), @"/var/mobile/Media/Books/iBooksData.plist", @"/var/mobile/Media/Books/iBooksData2.plist",
             @"/var/mobile/Media/Books",
             @"/var/mobile/Media/Books/Purchases",
             0);
  qword_26DE0 = (uint64_t)result;
  return result;
}

void sub_B858(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = BCDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_14D4C();
    }
  }
  else
  {
    uint64_t v8 = 0;
    [*(id *)(a1 + 40) removeItemAtURL:a2 error:&v8];
    uint64_t v4 = v8;
    v5 = BCDefaultLog();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_14D4C();
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "deleted: %@", buf, 0xCu);
    }
  }
}

void sub_CE90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_CEA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_CEDC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_CEFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_CF14(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_CF2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_CF48(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

uint64_t sub_CF70(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_CFC4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_CFE4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id _compareDictionaryValues(void *a1, void *a2, uint64_t a3)
{
  id v5 = objc_msgSend(a1, "objectForKey:");
  id v6 = [a2 objectForKey:a3];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v5 = 0;
    }
  }
  if (v6)
  {
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    if (v5 && (isKindOfClass & 1) != 0)
    {
      return [v5 compare:v6];
    }
  }
  else
  {
    unsigned __int8 isKindOfClass = 0;
  }
  if (!v5 || (isKindOfClass & 1) != 0) {
    return (id)((uint64_t)((unint64_t)((v5 == 0) & isKindOfClass) << 63) >> 63);
  }
  else {
    return &dword_0 + 1;
  }
}

void sub_E264(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_E280(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

uint64_t BCDynamicCast(uint64_t a1, uint64_t a2)
{
  if (objc_opt_isKindOfClass()) {
    return a2;
  }
  else {
    return 0;
  }
}

void *BCProtocolCast(uint64_t a1, void *a2)
{
  if ([a2 conformsToProtocol:a1]) {
    return a2;
  }
  else {
    return 0;
  }
}

void *BCClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    long long v13 = &a9;
    if (a3)
    {
      while (1)
      {
        id v11 = v13++;
        if (([v9 conformsToProtocol:*v11] & 1) == 0) {
          break;
        }
        if (!--a3) {
          return v9;
        }
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef BCCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

void sub_10178(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10E2C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entities:*(void *)(a1 + 40) byPredicate:*(void *)(a1 + 48) fromMOC:*(void *)(a1 + 56)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 56) deleteObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v6)];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v4);
  }
  uint64_t v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    unsigned int v10 = [v2 count];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 1024;
    unsigned int v22 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Removing %@ with predicate: %@ -- [Matched: %d]", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  id result = [*(id *)(a1 + 56) save:buf];
  if ((result & 1) == 0)
  {
    if (*(void *)buf)
    {
      int v12 = BCDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_15388();
      }
    }
    long long v13 = +[NSAssertionHandler currentHandler];
    return -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 32), @"BCAssetDatabase.m", 129, @"{%@} - Error saving MOC: %@ -- User Info: %@", *(void *)(a1 + 40), *(void *)buf, [*(id *)buf userInfo]);
  }
  return result;
}

void sub_1125C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_11280(uint64_t a1, uint64_t a2)
{
}

void sub_11290(uint64_t a1)
{
}

void sub_1129C(uint64_t a1)
{
  id v2 = +[NSEntityDescription entityForName:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = +[NSPredicate predicateWithFormat:@"persistentID IN %@", *(void *)(a1 + 48)];
  id v5 = objc_alloc_init((Class)NSFetchRequest);
  [v5 setEntity:v2];
  [v5 setPredicate:v4];
  [v5 setResultType:2];
  objc_msgSend(v5, "setPropertiesToFetch:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"persistentID", 0));
  uint64_t v17 = 0;
  id v6 = [*(id *)(a1 + 40) executeFetchRequest:v5 error:&v17];
  if (!v6 && v17)
  {
    uint64_t v7 = BCDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_15530();
    }

    goto LABEL_8;
  }

  if (!v6)
  {
LABEL_8:
    id v8 = objc_alloc_init((Class)NSSet);
    goto LABEL_9;
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", objc_msgSend(v6, "valueForKeyPath:", @"persistentID"));
LABEL_9:
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v8;

  if (*(void *)(a1 + 64) && [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    uint64_t v9 = +[NSPredicate predicateWithFormat:@"persistentID IN %@", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    unsigned int v10 = +[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", @"sum:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSExpression expressionForKeyPath:@"computedSize"]));
    id v11 = objc_alloc_init((Class)NSExpressionDescription);
    [v11 setName:@"sum_computedSize"];
    [v11 setExpression:v10];
    [v11 setExpressionResultType:300];
    id v12 = objc_alloc_init((Class)NSFetchRequest);
    [v12 setEntity:v2];
    [v12 setPredicate:v9];
    [v12 setResultType:2];
    objc_msgSend(v12, "setPropertiesToFetch:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v11, 0));

    uint64_t v17 = 0;
    id v13 = [*(id *)(a1 + 40) executeFetchRequest:v12 error:&v17];
    if (!v13)
    {
      if (v17)
      {
        long long v14 = BCDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_15530();
        }
      }
    }

    long long v15 = BCDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_154B8((uint64_t)v13, v15);
    }
    if ([v13 count] == (char *)&dword_0 + 1)
    {
      **(void **)(a1 + 64) = objc_msgSend(objc_msgSend(objc_msgSend(v13, "lastObject"), "objectForKey:", @"sum_computedSize"), "unsignedLongLongValue");
      *(void *)(*(void *)(a1 + 64) + 8) = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    }
    else
    {
      long long v16 = *(void **)(a1 + 64);
      *long long v16 = 0;
      v16[1] = 0;
    }
  }
}

void sub_116F8(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "entities:byPredicate:fromMOC:", @"BCOutstandingAsset", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"restoreRelated == %d", *(unsigned __int8 *)(a1 + 56)), *(void *)(a1 + 40));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v6) assetDictionaryAsDictionary];
        if (v7) {
          [*(id *)(a1 + 48) addObject:v7];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v4);
  }
  id v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v2 count];
    int v10 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 67109376;
    unsigned int v16 = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Assets by Restore Flag: %d Assets [Flag: %d]", buf, 0xEu);
  }
}

id sub_119BC(uint64_t a1)
{
  v30 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v32 = a1;
  id v2 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v2)
  {
    id v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v34;
    id v6 = &ATGetDiskUsageForPath_ptr;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v7);
        uint64_t v9 = objc_opt_class();
        int v10 = (void *)BCDynamicCast(v9, v8);
        uint64_t v11 = objc_opt_class();
        long long v12 = (void *)BCDynamicCast(v11, (uint64_t)[v10 objectForKey:@"Persistent ID"]);
        if ([v12 length])
        {
          if (([v12 isEqualToString:v4] & 1) == 0)
          {
            long long v13 = v6;
            uint64_t v14 = objc_opt_class();
            long long v15 = (void *)BCDynamicCast(v14, (uint64_t)[v10 objectForKey:@"Path"]);
            uint64_t v16 = objc_opt_class();
            uint64_t v17 = BCDynamicCast(v16, (uint64_t)[v10 objectForKey:@"Backup-Path"]);
            if (!*(unsigned char *)(v32 + 64)
              || (int v18 = (void *)v17, [v15 length])
              || [v18 length])
            {
              __int16 v19 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCOutstandingAsset" inManagedObjectContext:*(void *)(v32 + 40)];
              [(NSManagedObject *)v19 setPersistentID:v12];
              [(NSManagedObject *)v19 setRestoreRelated:v30];
              [(NSManagedObject *)v19 setAssetDictionaryAsDictionary:v10];
              uint64_t v20 = BCDefaultLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                int v21 = *(unsigned __int8 *)(v32 + 64);
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v12;
                __int16 v38 = 1024;
                LODWORD(v39) = v21;
                _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Inserting asset row: %@ -- [Restore Flag: %d]", buf, 0x12u);
              }
              id v6 = v13;
              id v4 = v12;
            }
            else
            {
              uint64_t v23 = BCDefaultLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v12;
                _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Wanted to insert restore asset without a path: %@", buf, 0xCu);
              }
              id v6 = v13;
            }
          }
        }
        else
        {
          unsigned int v22 = BCDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v24 = [v10 objectForKey:@"Artist"];
            id v25 = [v10 objectForKey:@"Name"];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v24;
            __int16 v38 = 2112;
            id v39 = v25;
            _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Wanted to insert asset without a PID: {%@ - %@}", buf, 0x16u);
          }
        }
        id v7 = (char *)v7 + 1;
      }
      while (v3 != v7);
      id v26 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      id v3 = v26;
    }
    while (v26);
  }
  *(void *)buf = 0;
  id result = [*(id *)(v32 + 40) save:buf];
  if ((result & 1) == 0)
  {
    if (*(void *)buf)
    {
      v28 = BCDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_15598();
      }
    }
    v29 = +[NSAssertionHandler currentHandler];
    return -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v29, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(v32 + 56), *(void *)(v32 + 48), @"BCAssetDatabase.m", 329, @"Error saving MOC: %@ -- User Info: %@", *(void *)buf, [*(id *)buf userInfo]);
  }
  return result;
}

id sub_11F5C(uint64_t a1)
{
  long long v36 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v39;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v39 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v5);
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = (void *)BCDynamicCast(v7, v6);
        uint64_t v9 = objc_opt_class();
        int v10 = (void *)BCDynamicCast(v9, (uint64_t)[v8 objectForKey:@"Persistent ID"]);
        if (![v10 length])
        {
          uint64_t v23 = BCDefaultLog();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          id v24 = [v8 objectForKey:@"Artist"];
          id v25 = [v8 objectForKey:@"Name"];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v24;
          __int16 v43 = 2112;
          id v44 = v25;
          id v26 = v23;
          v27 = "Wanted to insert asset without a PID: {%@ - %@}";
          uint32_t v28 = 22;
          goto LABEL_17;
        }
        uint64_t v11 = objc_opt_class();
        long long v12 = (void *)BCDynamicCast(v11, (uint64_t)[v8 objectForKey:@"Path"]);
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = BCDynamicCast(v13, (uint64_t)[v8 objectForKey:@"Backup-Path"]);
        if (!*(unsigned char *)(a1 + 64) || (long long v15 = (void *)v14, [v12 length]) || objc_msgSend(v15, "length"))
        {
          id v16 = [*(id *)(a1 + 40) entities:@"BCOutstandingAsset", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"persistentID == %@", v10), *(void *)(a1 + 48) byPredicate fromMOC];
          if (![v16 count]) {
            goto LABEL_22;
          }
          id v17 = [v16 lastObject];
          int v18 = v17;
          if (*(unsigned char *)(a1 + 64) || !objc_msgSend(objc_msgSend(v17, "restoreRelated"), "BOOLValue"))
          {
            [v18 setPersistentID:v10];
            [v18 setRestoreRelated:v36];
            [v18 setAssetDictionaryAsDictionary:v8];
            v29 = BCDefaultLog();
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            int v30 = *(unsigned __int8 *)(a1 + 64);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v10;
            __int16 v43 = 1024;
            LODWORD(v44) = v30;
            uint64_t v20 = v29;
            int v21 = "Patching existing asset row: %@ -- [Restore Flag: %d]";
            uint32_t v22 = 18;
          }
          else
          {
            __int16 v19 = BCDefaultLog();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v10;
            uint64_t v20 = v19;
            int v21 = "Skipping existing asset row due to restore flag mismatch: %@";
            uint32_t v22 = 12;
          }
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        }
        else
        {
          v31 = BCDefaultLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v10;
            id v26 = v31;
            v27 = "Wanted to update restore asset without a path: %@";
            uint32_t v28 = 12;
LABEL_17:
            _os_log_error_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
          }
        }
LABEL_22:
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v32 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
      id v3 = v32;
    }
    while (v32);
  }
  *(void *)buf = 0;
  id result = [*(id *)(a1 + 48) save:buf];
  if ((result & 1) == 0)
  {
    if (*(void *)buf)
    {
      long long v34 = BCDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_15598();
      }
    }
    long long v35 = +[NSAssertionHandler currentHandler];
    return -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v35, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"BCAssetDatabase.m", 389, @"Error saving MOC: %@ -- User Info: %@", *(void *)buf, [*(id *)buf userInfo]);
  }
  return result;
}

id sub_12518(uint64_t a1)
{
  id v2 = +[NSPredicate predicateWithFormat:@"NOT (persistentID IN %@)", *(void *)(a1 + 32)];
  id v3 = +[NSMutableArray array];
  id v4 = [*(id *)(a1 + 40) entities:@"BCOutstandingAsset" byPredicate:v2 fromMOC:*(void *)(a1 + 48)];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v9, "downloadCompletePath"), "length")) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "downloadCompletePath"));
        }
        int v10 = BCDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Removing outstanding asset %@", buf, 0xCu);
        }
        [*(id *)(a1 + 48) deleteObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }
  uint64_t v11 = BCDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v4 count];
    unsigned int v13 = [v3 count];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v13;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Removing unnecessary outstanding assets -- [Matched: %d] [Paths to delete: %d]", buf, 0xEu);
  }
  uint64_t v14 = +[NSFileManager defaultManager];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v3);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
        uint64_t v20 = BCDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v19;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Removing file at path %@", buf, 0xCu);
        }
        [(NSFileManager *)v14 removeItemAtPath:v19 error:0];
      }
      id v16 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }
  *(void *)buf = 0;
  id result = [*(id *)(a1 + 48) save:buf];
  if ((result & 1) == 0)
  {
    if (*(void *)buf)
    {
      uint32_t v22 = BCDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_15600();
      }
    }
    uint64_t v23 = +[NSAssertionHandler currentHandler];
    return -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v23, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"BCAssetDatabase.m", 435, @"{%@} - Error saving MOC: %@ -- User Info: %@", @"BCOutstandingAsset", *(void *)buf, [*(id *)buf userInfo]);
  }
  return result;
}

id sub_12CD4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    id v2 = [*(id *)(a1 + 40) entities:@"BCOutstandingAsset", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"persistentID == %@", *(void *)(a1 + 32)), *(void *)(a1 + 48) byPredicate fromMOC];
    if ([v2 count])
    {
      id v3 = [v2 lastObject];
      if (objc_msgSend(objc_msgSend(v3, "downloadCompletePath"), "isEqualToString:", *(void *)(a1 + 56)))
      {
        id v4 = BCDefaultLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          uint64_t v6 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v5;
          __int16 v16 = 2112;
          uint64_t v17 = v6;
          uint64_t v7 = "Existing asset row: %@ -- [Same Path: %@]";
LABEL_10:
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);
        }
      }
      else
      {
        [v3 setDownloadCompletePath:*(void *)(a1 + 56)];
        id v4 = BCDefaultLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v10;
          __int16 v16 = 2112;
          uint64_t v17 = v11;
          uint64_t v7 = "Updating existing asset row: %@ -- [Path: %@]";
          goto LABEL_10;
        }
      }
    }
    else
    {
      id v4 = BCDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        uint64_t v7 = "No existing asset row: %@ -- [Path: %@]";
        goto LABEL_10;
      }
    }
  }
  id result = [*(id *)(a1 + 48) hasChanges];
  if (result)
  {
    *(void *)buf = 0;
    id result = [*(id *)(a1 + 48) save:buf];
    if ((result & 1) == 0)
    {
      if (*(void *)buf)
      {
        unsigned int v13 = BCDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_15598();
        }
      }
      uint64_t v14 = +[NSAssertionHandler currentHandler];
      return -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v14, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 40), @"BCAssetDatabase.m", 508, @"Error saving MOC: %@ -- User Info: %@", *(void *)buf, [*(id *)buf userInfo]);
    }
  }
  return result;
}

void sub_130AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_130C8(uint64_t a1)
{
  id v2 = +[NSEntityDescription entityForName:@"BCOutstandingAsset" inManagedObjectContext:*(void *)(a1 + 32)];
  id v3 = +[NSPredicate predicateWithFormat:@"downloadCompletePath IN %@", *(void *)(a1 + 40)];
  id v4 = objc_alloc_init((Class)NSFetchRequest);
  [v4 setEntity:v2];
  [v4 setPredicate:v3];
  [v4 setResultType:2];
  objc_msgSend(v4, "setPropertiesToFetch:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"downloadCompletePath", 0));
  uint64_t v11 = 0;
  id v5 = [*(id *)(a1 + 32) executeFetchRequest:v4 error:&v11];
  if (!v5)
  {
    if (v11)
    {
      uint64_t v6 = BCDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_15530();
      }
    }
  }

  uint64_t v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [*(id *)(a1 + 40) count];
    unsigned int v9 = [v5 count];
    *(_DWORD *)buf = 67109376;
    unsigned int v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Input count: %d; Output count: %d", buf, 0xEu);
  }
  id result = [v5 valueForKeyPath:@"downloadCompletePath"];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void sub_13384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSDictionary *sub_133A0(uint64_t a1)
{
  id v2 = +[NSEntityDescription entityForName:@"BCOutstandingAsset" inManagedObjectContext:*(void *)(a1 + 32)];
  id v3 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"downloadCompletePath != %@", +[NSNull null]);
  id v4 = objc_alloc_init((Class)NSFetchRequest);
  [v4 setEntity:v2];
  [v4 setPredicate:v3];
  [v4 setResultType:2];
  objc_msgSend(v4, "setPropertiesToFetch:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"downloadCompletePath", @"persistentID", 0));
  uint64_t v10 = 0;
  id v5 = [*(id *)(a1 + 32) executeFetchRequest:v4 error:&v10];
  if (!v5)
  {
    if (v10)
    {
      uint64_t v6 = BCDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_15530();
      }
    }
  }

  id v7 = [v5 valueForKeyPath:@"persistentID"];
  id v8 = [v5 valueForKeyPath:@"downloadCompletePath"];
  id result = (NSDictionary *)[v7 count];
  if (result)
  {
    id result = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

id sub_136A0(uint64_t a1)
{
  id v2 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 40) entities:@"BCInstalledAsset", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"persistentID == %@", *(void *)(a1 + 32)), *(void *)(a1 + 48) byPredicate fromMOC];
  if ([v3 count])
  {
    objc_msgSend(objc_msgSend(v3, "lastObject"), "setComputedSize:", v2);
    id v4 = BCDefaultLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    __int16 v13 = 2112;
    __int16 v14 = v2;
    uint64_t v6 = "Updating installed asset row: %@ -- [Computed Size: %@]";
  }
  else
  {
    id v7 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCInstalledAsset" inManagedObjectContext:*(void *)(a1 + 48)];
    [(NSManagedObject *)v7 setPersistentID:*(void *)(a1 + 32)];
    [(NSManagedObject *)v7 setComputedSize:v2];
    id v4 = BCDefaultLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v13 = 2112;
    __int16 v14 = v2;
    uint64_t v6 = "Inserting installed asset row: %@ -- [Computed Size: %@]";
  }
  _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0x16u);
LABEL_7:
  *(void *)buf = 0;
  id result = [*(id *)(a1 + 48) save:buf];
  if ((result & 1) == 0)
  {
    if (*(void *)buf)
    {
      uint64_t v10 = BCDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_15598();
      }
    }
    uint64_t v11 = +[NSAssertionHandler currentHandler];
    return -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v11, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 40), @"BCAssetDatabase.m", 645, @"Error saving MOC: %@ -- User Info: %@", *(void *)buf, [*(id *)buf userInfo]);
  }
  return result;
}

void sub_138B8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_13A34(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithTarget:*(void *)(*(void *)(a1 + 40) + 8)];
}

void sub_13A5C(id a1)
{
  qword_26DF0 = (uint64_t)os_log_create("com.apple.iBooks.BooksClient", "BooksClient");
}

void sub_13A8C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_13AF8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_13B64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_13BD0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Books entry was not an array.", v1, 2u);
}

void sub_13C14(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Missing books entry.", v1, 2u);
}

void sub_13C58()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "dealloc %@", v2, v3, v4, v5, v6);
}

void sub_13CC0()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "supportedDataclasses %@", v2, v3, v4, v5, v6);
}

void sub_13D28()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "currentSyncAnchor %@", v2, v3, v4, v5, v6);
}

void sub_13D90(uint64_t a1, uint64_t a2)
{
  sub_CF70(a1, a2, 5.7779e-34);
  sub_CE90(&dword_0, v2, (uint64_t)v2, "  Failed to reconcile sync.  Exception=%@", v3);
}

void sub_13DCC()
{
  sub_CE84();
  sub_CEDC(&dword_0, v0, v1, "Error changing modification date of %@ -- %@");
}

void sub_13E44(uint64_t a1, uint64_t a2)
{
  sub_CF70(a1, a2, 5.7779e-34);
  sub_CE90(&dword_0, v2, (uint64_t)v2, "  Failed to reconcile restore.  Exception=%@", v3);
}

void sub_13E80()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "restoreEndedWithError: %@", v2, v3, v4, v5, v6);
}

void sub_13EE8(uint64_t a1, uint64_t a2)
{
  sub_CF70(a1, a2, 5.7779e-34);
  sub_CE90(&dword_0, v2, (uint64_t)v2, "  Failed to collect outstanding asset transfers.  Exception=%@", v3);
}

void sub_13F24()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "Exception Caught %@", v2, v3, v4, v5, v6);
}

void sub_13F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_CF14(a1, a2, a3, 5.778e-34);
  sub_CEFC(&dword_0, v5, v3, "Failed to handle asset transfer result at %@.  Exception=%@", v4);
}

void sub_13FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_CF14(a1, a2, a3, 5.778e-34);
  sub_CEFC(&dword_0, v5, v3, "  Failed to remove item at path %@.  Exception=%@", v4);
}

void sub_1400C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_CF14(a1, a2, a3, 5.778e-34);
  sub_CEFC(&dword_0, v5, v3, "  Failed to remove outstanding assets by persistent ID %@.  Exception=%@", v4);
}

void sub_1404C(uint64_t a1, uint64_t a2)
{
  sub_CF70(a1, a2, 5.7779e-34);
  sub_CE90(&dword_0, v2, (uint64_t)v2, "  Failed to handle install error.  Exception=%@", v3);
}

segment_command_64 *sub_14088(void *a1, const __CFString **a2)
{
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)((char *)&dword_4 + 3)) {
    goto LABEL_16;
  }
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)&dword_8) {
    goto LABEL_16;
  }
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)((char *)&dword_C + 2)) {
    goto LABEL_16;
  }
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)&dword_10) {
    goto LABEL_16;
  }
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)((char *)&dword_8 + 1)) {
    goto LABEL_16;
  }
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)((char *)&dword_10 + 2)) {
    goto LABEL_16;
  }
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)&dword_4) {
    goto LABEL_16;
  }
  id result = (segment_command_64 *)[a1 code];
  if (result == (segment_command_64 *)((char *)&dword_10 + 3)
    || (id result = (segment_command_64 *)[a1 code], result == (segment_command_64 *)&dword_14)
    || (id result = (segment_command_64 *)[a1 code], result == (segment_command_64 *)((char *)&dword_18 + 1))
    || (id result = (segment_command_64 *)[a1 code], result == (segment_command_64 *)((char *)&dword_18 + 3))
    || (id result = (segment_command_64 *)[a1 code], result == (segment_command_64 *)&dword_18)
    || (id result = (segment_command_64 *)[a1 code], result == (segment_command_64 *)((char *)&dword_1C + 3))
    || (id result = (segment_command_64 *)[a1 code], result == &stru_20)
    || (id result = (segment_command_64 *)[a1 code],
        result == (segment_command_64 *)((char *)&stru_20.cmd + 1)))
  {
LABEL_16:
    CFStringRef v5 = @"Recoverable";
  }
  else
  {
    id result = (segment_command_64 *)[a1 code];
    CFStringRef v5 = @"Recoverable";
    if (result != (segment_command_64 *)((char *)&stru_20.cmd + 2))
    {
      id result = (segment_command_64 *)[a1 code];
      if (result == (segment_command_64 *)((char *)&stru_20.cmd + 3)) {
        CFStringRef v5 = @"Recoverable";
      }
      else {
        CFStringRef v5 = @"Not Recoverable";
      }
    }
  }
  *a2 = v5;
  return result;
}

void sub_141E0()
{
  sub_CF94();
  sub_CFC4(&dword_0, v0, v1, "Ending installedAssetMetrics: [%llu bytes] [%d books]", v2, v3);
}

void sub_14248()
{
  sub_CFE4(__stack_chk_guard);
  sub_CEC4();
  sub_CF48(&dword_0, v0, v1, "installedAssetMetrics calculates Managed directory as: [%llu bytes] [%d books]", v2, v3, v4, v5, v6);
}

void sub_142B0()
{
  sub_CFE4(__stack_chk_guard);
  sub_CEC4();
  sub_CF48(&dword_0, v0, v1, "installedAssetMetrics calculates Sync directory as: [%llu bytes] [%d books]", v2, v3, v4, v5, v6);
}

void sub_14318()
{
  sub_CFE4(__stack_chk_guard);
  sub_CEC4();
  sub_CF48(&dword_0, v0, v1, "installedAssetMetrics calculates Purchases directory as: [%llu bytes] [%d books]", v2, v3, v4, v5, v6);
}

void sub_14380()
{
  sub_CFE4(__stack_chk_guard);
  sub_CEC4();
  sub_CF48(&dword_0, v0, v1, "installedAssetMetrics calculates Books directory as: [%llu bytes] [%d books]", v2, v3, v4, v5, v6);
}

void sub_143E8()
{
  sub_CF94();
  sub_CFC4(&dword_0, v0, v1, "installedAssetMetrics calculates Assets metrics as: [%llu bytes] [%d books]", v2, v3);
}

void sub_14450()
{
  sub_CF64();
  sub_CF2C(&dword_0, v0, v1, "Starting installedAssetMetrics", v2, v3, v4, v5, v6);
}

void sub_14484()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "assetDownloadCompleted -- Asset path isn't in one of the expected directories: %@", v2, v3, v4, v5, v6);
}

void sub_144EC()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "assetDownloadCompleted -- Removing the asset from the database since the plist entry was not found %@", v2, v3, v4, v5, v6);
}

void sub_14554()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "assetDownloadCompleted -- Asset has no path or identifier %@", v2, v3, v4, v5, v6);
}

void sub_145BC()
{
  sub_CF64();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "reconcileWithError returning !success", v1, 2u);
}

void sub_145FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3040(&dword_0, a2, a3, "reconcileWithError returning an error %@", a5, a6, a7, a8, 2u);
}

void sub_1466C()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "Sync Persistent IDs %@", v2, v3, v4, v5, v6);
}

void sub_146D4()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "Reverse Persistent IDs %@", v2, v3, v4, v5, v6);
}

void sub_1473C()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "Cannot remove failed asset which has no PID: %@", v2, v3, v4, v5, v6);
}

void sub_147A4(uint64_t a1, void *a2, NSObject *a3)
{
  [a2 database];
  sub_CF7C();
  sub_CEFC(&dword_0, a3, v4, "Removing failed asset: %@ self.database=%@", v5);
}

void sub_1482C()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "Upload Failed for asset: %@", v2, v3, v4, v5, v6);
}

void sub_14894(void *a1, NSObject *a2)
{
  [a1 identifier];
  sub_CE84();
  sub_CE90(&dword_0, a2, v3, "Keeping recoverable failed asset: %@", v4);
}

void sub_14914()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "<iteratePathsForPlist> %@", v2, v3, v4, v5, v6);
}

void sub_1497C(uint64_t a1, NSObject *a2)
{
  objc_opt_class();
  sub_CF7C();
  sub_CEFC(&dword_0, a2, v3, "The object [%@] of class: [%@] could be converted to neither an NSString nor an NSNumber", v4);
}

void sub_14A00()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "ATStoreInfo with no flavor or drmFree: %@", v2, v3, v4, v5, v6);
}

void sub_14A68()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "ATStoreInfo with no appleID: %@", v2, v3, v4, v5, v6);
}

void sub_14AD0()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "ATStoreInfo with no storefrontID: %@", v2, v3, v4, v5, v6);
}

void sub_14B38()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "ATStoreInfo with no AdamID: %@", v2, v3, v4, v5, v6);
}

void sub_14BA0()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "Found Artwork: %@", v2, v3, v4, v5, v6);
}

void sub_14C08()
{
  sub_CE84();
  sub_3040(&dword_0, v0, v1, "Artwork file does not exist: %@", v2, v3, v4, v5, v6);
}

void sub_14C70()
{
  sub_CE84();
  sub_CEDC(&dword_0, v0, v1, "Failed to add items to plist %@ -- %@");
}

void sub_14CE4()
{
  sub_CE84();
  sub_CEA8(&dword_0, v0, v1, "wanted to delete: %@", v2, v3, v4, v5, v6);
}

void sub_14D4C()
{
  sub_CFAC();
  sub_CEDC(&dword_0, v0, v1, "Failed to delete file [%@] -- [Error: %@]");
}

void sub_14DBC()
{
  sub_CF64();
  sub_CF2C(&dword_0, v0, v1, "Preparing to filter input persistent ids", v2, v3, v4, v5, v6);
}

void sub_14DF0()
{
  sub_CF64();
  sub_CF2C(&dword_0, v0, v1, "Removing Outstanding Assets database", v2, v3, v4, v5, v6);
}

void sub_14E24()
{
  sub_CF64();
  sub_CF2C(&dword_0, v0, v1, "Creating Outstanding Assets database", v2, v3, v4, v5, v6);
}

void sub_14E58(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[BCGenerateDownloadSizePlistProducer] Error reading file attributes for %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_14EE4(void *a1)
{
  [a1 objectForKeyedSubscript:@"Artist"];
  [a1 objectForKeyedSubscript:@"Name"];
  sub_10160();
  sub_10178(&dword_0, v2, v3, "[BCGenerateDownloadSizePlistProducer] Path not found for {%@ - %@}", v4, v5, v6, v7, v8);
}

void sub_14F8C(void *a1)
{
  [a1 objectForKeyedSubscript:@"Artist"];
  [a1 objectForKeyedSubscript:@"Name"];
  sub_10160();
  sub_10178(&dword_0, v2, v3, "[BCGenerateDownloadSizePlistProducer] Cannot read itunesMetadata.plist for {%@ - %@}", v4, v5, v6, v7, v8);
}

void sub_15034(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error serializing asset to data -- %@", (uint8_t *)&v2, 0xCu);
}

void sub_150AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error deserializing data to asset -- %@", (uint8_t *)&v2, 0xCu);
}

void sub_15124(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to destroyPersistentStoreAtURL: <nil> error returned", buf, 2u);
}

void sub_15164(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to addPersistentStoreWithType: <nil> error returned", buf, 2u);
}

void sub_151A4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not add PS to PSC. Deleting & Recreating DB folder.", v1, 2u);
}

void sub_151E8(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not add PS to PSC, but retry-count exceeded: %d", (uint8_t *)v3, 8u);
}

void sub_15264(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_152D0(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  sub_138D0();
  sub_CEDC(&dword_0, v1, v2, "Failed to delete file [%@] -- [Error: %@]", (void)v3, DWORD2(v3));
}

void sub_15344(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Database didn't need to be removed, did not exist.", v1, 2u);
}

void sub_15388()
{
  sub_138B8(__stack_chk_guard);
  sub_138C4();
  sub_CEDC(&dword_0, v0, v1, "{%@} - Error saving MOC: %@");
}

void sub_15400(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  sub_138D0();
  sub_CEDC(&dword_0, v1, v2, "Fetching %@: Error fetching from MOC: %@", (void)v3, DWORD2(v3));
}

void sub_15474(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Empty array", v1, 2u);
}

void sub_154B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "SUM(computedSize) == %@", (uint8_t *)&v2, 0xCu);
}

void sub_15530()
{
  sub_138B8(__stack_chk_guard);
  sub_138C4();
  sub_3040(&dword_0, v0, v1, "Fetching: Error fetching from MOC: %@", v2, v3, v4, v5, v6);
}

void sub_15598()
{
  sub_138B8(__stack_chk_guard);
  sub_138C4();
  sub_3040(&dword_0, v0, v1, "Error saving MOC: %@", v2, v3, v4, v5, v6);
}

void sub_15600()
{
  sub_138B8(__stack_chk_guard);
  int v1 = 138412546;
  CFStringRef v2 = @"BCOutstandingAsset";
  sub_138D0();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "{%@} - Error saving MOC: %@", (uint8_t *)&v1, 0x16u);
}

void sub_15684(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t ATGetDiskUsageForPath()
{
  return _ATGetDiskUsageForPath();
}

uint64_t ATGetPhysicalSizeForLogicalSize()
{
  return _ATGetPhysicalSizeForLogicalSize();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_UniqueNumber(void *a1, const char *a2, ...)
{
  return [a1 UniqueNumber];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return [a1 adamID];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrayRemovingNonStrings(void *a1, const char *a2, ...)
{
  return [a1 arrayRemovingNonStrings];
}

id objc_msgSend_assetDictionary(void *a1, const char *a2, ...)
{
  return [a1 assetDictionary];
}

id objc_msgSend_assetDictionaryAsDictionary(void *a1, const char *a2, ...)
{
  return [a1 assetDictionaryAsDictionary];
}

id objc_msgSend_bookExtensions(void *a1, const char *a2, ...)
{
  return [a1 bookExtensions];
}

id objc_msgSend_books(void *a1, const char *a2, ...)
{
  return [a1 books];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bypassStore(void *a1, const char *a2, ...)
{
  return [a1 bypassStore];
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

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_databaseURL(void *a1, const char *a2, ...)
{
  return [a1 databaseURL];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteOrphanedFiles(void *a1, const char *a2, ...)
{
  return [a1 deleteOrphanedFiles];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_downloadCompletePath(void *a1, const char *a2, ...)
{
  return [a1 downloadCompletePath];
}

id objc_msgSend_downloadCompletePathMap(void *a1, const char *a2, ...)
{
  return [a1 downloadCompletePathMap];
}

id objc_msgSend_downloadPhaseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 downloadPhaseIdentifier];
}

id objc_msgSend_downloads(void *a1, const char *a2, ...)
{
  return [a1 downloads];
}

id objc_msgSend_drmFree(void *a1, const char *a2, ...)
{
  return [a1 drmFree];
}

id objc_msgSend_endNotifications(void *a1, const char *a2, ...)
{
  return [a1 endNotifications];
}

id objc_msgSend_entriesWithPath(void *a1, const char *a2, ...)
{
  return [a1 entriesWithPath];
}

id objc_msgSend_existingPersistentIDs(void *a1, const char *a2, ...)
{
  return [a1 existingPersistentIDs];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileOwnerAccountName(void *a1, const char *a2, ...)
{
  return [a1 fileOwnerAccountName];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileWasModifiedDuringDataProduction(void *a1, const char *a2, ...)
{
  return [a1 fileWasModifiedDuringDataProduction];
}

id objc_msgSend_fileWriteFailed(void *a1, const char *a2, ...)
{
  return [a1 fileWriteFailed];
}

id objc_msgSend_filterMatches(void *a1, const char *a2, ...)
{
  return [a1 filterMatches];
}

id objc_msgSend_flavor(void *a1, const char *a2, ...)
{
  return [a1 flavor];
}

id objc_msgSend_foregroundRestoreWhitelist(void *a1, const char *a2, ...)
{
  return [a1 foregroundRestoreWhitelist];
}

id objc_msgSend_forwardSyncAssets(void *a1, const char *a2, ...)
{
  return [a1 forwardSyncAssets];
}

id objc_msgSend_generateDirectories(void *a1, const char *a2, ...)
{
  return [a1 generateDirectories];
}

id objc_msgSend_generateDirectory(void *a1, const char *a2, ...)
{
  return [a1 generateDirectory];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_isDownload(void *a1, const char *a2, ...)
{
  return [a1 isDownload];
}

id objc_msgSend_isEnterpriseBookBackupAllowed(void *a1, const char *a2, ...)
{
  return [a1 isEnterpriseBookBackupAllowed];
}

id objc_msgSend_isRestore(void *a1, const char *a2, ...)
{
  return [a1 isRestore];
}

id objc_msgSend_isRestoreSession(void *a1, const char *a2, ...)
{
  return [a1 isRestoreSession];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowerLockout(void *a1, const char *a2, ...)
{
  return [a1 lowerLockout];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 newManagedObjectContext];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberFromHexDigits(void *a1, const char *a2, ...)
{
  return [a1 numberFromHexDigits];
}

id objc_msgSend_outstandingAssetTransfers(void *a1, const char *a2, ...)
{
  return [a1 outstandingAssetTransfers];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_pathsForDevice2DeviceRestoreLocal(void *a1, const char *a2, ...)
{
  return [a1 pathsForDevice2DeviceRestoreLocal];
}

id objc_msgSend_pathsForDevice2DeviceRestoreRedownloadable(void *a1, const char *a2, ...)
{
  return [a1 pathsForDevice2DeviceRestoreRedownloadable];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_prepareForBackup(void *a1, const char *a2, ...)
{
  return [a1 prepareForBackup];
}

id objc_msgSend_processDeletesFile(void *a1, const char *a2, ...)
{
  return [a1 processDeletesFile];
}

id objc_msgSend_processDeletesFiles(void *a1, const char *a2, ...)
{
  return [a1 processDeletesFiles];
}

id objc_msgSend_produceData(void *a1, const char *a2, ...)
{
  return [a1 produceData];
}

id objc_msgSend_raiseLockout(void *a1, const char *a2, ...)
{
  return [a1 raiseLockout];
}

id objc_msgSend_regenerateMissingEstimatedDownloadSizes(void *a1, const char *a2, ...)
{
  return [a1 regenerateMissingEstimatedDownloadSizes];
}

id objc_msgSend_regenerateMissingPersistentIDs(void *a1, const char *a2, ...)
{
  return [a1 regenerateMissingPersistentIDs];
}

id objc_msgSend_removeDatabase(void *a1, const char *a2, ...)
{
  return [a1 removeDatabase];
}

id objc_msgSend_removePromisedAssets(void *a1, const char *a2, ...)
{
  return [a1 removePromisedAssets];
}

id objc_msgSend_resetPaths(void *a1, const char *a2, ...)
{
  return [a1 resetPaths];
}

id objc_msgSend_restoreRelated(void *a1, const char *a2, ...)
{
  return [a1 restoreRelated];
}

id objc_msgSend_reverseSyncAssets(void *a1, const char *a2, ...)
{
  return [a1 reverseSyncAssets];
}

id objc_msgSend_reverseSyncPersistentIDs(void *a1, const char *a2, ...)
{
  return [a1 reverseSyncPersistentIDs];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_shouldRetry(void *a1, const char *a2, ...)
{
  return [a1 shouldRetry];
}

id objc_msgSend_sortedPaths(void *a1, const char *a2, ...)
{
  return [a1 sortedPaths];
}

id objc_msgSend_startNotifications(void *a1, const char *a2, ...)
{
  return [a1 startNotifications];
}

id objc_msgSend_storefrontID(void *a1, const char *a2, ...)
{
  return [a1 storefrontID];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_trimOutstandingAssetList(void *a1, const char *a2, ...)
{
  return [a1 trimOutstandingAssetList];
}

id objc_msgSend_unfilteredPersistentIDs(void *a1, const char *a2, ...)
{
  return [a1 unfilteredPersistentIDs];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_uploadsByPersistentID(void *a1, const char *a2, ...)
{
  return [a1 uploadsByPersistentID];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_write(void *a1, const char *a2, ...)
{
  return [a1 write];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
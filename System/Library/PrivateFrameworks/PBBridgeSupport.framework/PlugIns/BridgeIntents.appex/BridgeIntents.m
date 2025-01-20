void sub_100004274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_100004A30(uint64_t a1)
{
  v2 = (void *)sub_100004A80();
  result = dlsym(v2, "NTKCollectionIdentifierLibraryFaces");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000D538 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004A80()
{
  v3[0] = 0;
  if (!qword_10000D540)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100004B80;
    v3[4] = &unk_1000081E8;
    v3[5] = v3;
    long long v4 = off_1000081D0;
    uint64_t v5 = 0;
    qword_10000D540 = _sl_dlopen();
  }
  uint64_t v0 = qword_10000D540;
  v1 = (void *)v3[0];
  if (!qword_10000D540)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100004B80()
{
  uint64_t result = _sl_dlopen();
  qword_10000D540 = result;
  return result;
}

Class sub_100004BF4(uint64_t a1)
{
  sub_100004A80();
  Class result = objc_getClass("NTKPersistentFaceCollection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000060A8();
  }
  qword_10000D548 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100004DA8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v7 localizedDescription];
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "completing face list with error: %@", (uint8_t *)&v12, 0xCu);
  }
  v10 = [COSListGizmoFacesIntentResponse alloc];
  if (v7)
  {
    v11 = [(COSListGizmoFacesIntentResponse *)v10 initWithCode:5 userActivity:0];
  }
  else
  {
    v11 = [(COSListGizmoFacesIntentResponse *)v10 initWithCode:4 userActivity:0];
    [(COSListGizmoFacesIntentResponse *)v11 setWatchFaces:v6];
    RecordWatchFaceShortcutTriggered(@"GetAllFaces");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void RecordWatchFaceShortcutTriggered(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)NSMutableDictionary);
  CFStringRef v5 = @"IntentID";
  id v6 = v1;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  id v4 = [v2 initWithDictionary:v3];
  AnalyticsSendEvent();
}

void sub_1000050B8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v7 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "completing current face with error: %@", buf, 0xCu);
  }
  v10 = [COSGetCurrentGizmoFaceIntentResponse alloc];
  if (v7)
  {
    v11 = [(COSGetCurrentGizmoFaceIntentResponse *)v10 initWithCode:5 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v11 = [(COSGetCurrentGizmoFaceIntentResponse *)v10 initWithCode:4 userActivity:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v18 = [v17 isActive];
          unsigned int v19 = [v18 BOOLValue];

          if (v19)
          {
            [(COSGetCurrentGizmoFaceIntentResponse *)v11 setWatchFace:v17];
            goto LABEL_15;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    RecordWatchFaceShortcutTriggered(@"GetCurrentFace");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = v20;
  }
}

void sub_1000053D4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "completing face options", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000573C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "handle: got watch faces, finishing up...", buf, 2u);
  }

  id v8 = [*(id *)(a1 + 40) face];
  v9 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [*(id *)(a1 + 40) face];
    v11 = [v10 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v64 = (uint64_t)v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "selected face with identifier: %@", buf, 0xCu);
  }
  uint64_t v12 = [v8 identifier];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = [v8 identifier];
    id v15 = [v14 length];

    if (v15)
    {
      v16 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "finding face by identifier", buf, 2u);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v17 = v6;
      id v18 = [v17 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v47 = a1;
        id v49 = v6;
        id v51 = v5;
        uint64_t v20 = *(void *)v58;
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            long long v24 = [v8 identifier];
            v25 = [v23 identifier];
            unsigned int v26 = [v24 isEqualToString:v25];

            if (v26) {
              uint64_t v21 = (uint64_t)[v17 indexOfObject:v23];
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v57 objects:v62 count:16];
        }
        while (v19);

        id v6 = v49;
        id v5 = v51;
        a1 = v47;
        if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_35;
        }
      }
      else
      {
      }
    }
  }
  uint64_t v27 = [v8 displayString];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [v8 displayString];
    id v30 = [v29 length];

    if (v30)
    {
      v31 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "finding face by displayString", buf, 2u);
      }

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v32 = v6;
      id v33 = [v32 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v48 = a1;
        id v50 = v6;
        id v52 = v5;
        uint64_t v35 = *(void *)v54;
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
            v38 = [v8 displayString];
            v39 = [v37 displayString];
            id v40 = [v38 caseInsensitiveCompare:v39];

            if (!v40) {
              uint64_t v21 = (uint64_t)[v32 indexOfObject:v37];
            }
          }
          id v34 = [v32 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v34);

        id v6 = v50;
        id v5 = v52;
        a1 = v48;
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_35:
          v41 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v64 = v21;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "match found! setting face to %li", buf, 0xCu);
          }

          [v5 setSelectedFaceIndex:v21 suppressingCallbackToObserver:0];
          uint64_t v42 = 4;
          goto LABEL_42;
        }
      }
      else
      {
      }
    }
  }
  v43 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "could not find face match, no changes made", buf, 2u);
  }

  uint64_t v42 = 5;
LABEL_42:
  RecordWatchFaceShortcutTriggered(@"SetWatchFace");
  v44 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "handle: done", buf, 2u);
  }

  uint64_t v45 = *(void *)(a1 + 48);
  v46 = [[COSSetGizmoFaceIntentResponse alloc] initWithCode:v42 userActivity:0];
  (*(void (**)(uint64_t, COSSetGizmoFaceIntentResponse *))(v45 + 16))(v45, v46);
}

void sub_100006084()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_1000060A8(v0);
}

void sub_1000060A8()
{
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_collectionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 collectionIdentifier];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_hasLoaded(void *a1, const char *a2, ...)
{
  return [a1 hasLoaded];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsValue(void *a1, const char *a2, ...)
{
  return [a1 needsValue];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_numberOfFaces(void *a1, const char *a2, ...)
{
  return [a1 numberOfFaces];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_selectedFace(void *a1, const char *a2, ...)
{
  return [a1 selectedFace];
}

id objc_msgSend_uuidForFace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuidForFace:");
}
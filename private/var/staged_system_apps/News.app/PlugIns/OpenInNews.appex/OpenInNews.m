void sub_100001CFC(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  uint64_t v11;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_100002240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000228C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000229C(uint64_t a1)
{
}

void sub_1000022A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100002324(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000023A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100002424(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    [v2 _openNewsArticleWithURL:];
  }
  else
  {
    id v3 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
    [*(id *)(a1 + 40) cancelRequestWithError:v3];
  }
}

void sub_1000025A4(uint64_t a1)
{
  id v6 = +[FCFeldsparIDProvider sharedInstance];
  id v2 = objc_alloc((Class)FCConfigurationManager);
  id v3 = +[FCContextConfiguration defaultConfiguration];
  id v4 = [v2 initWithContextConfiguration:v3 contentHostDirectoryFileURL:*(void *)(a1 + 32) feldsparIDProvider:v6];
  v5 = (void *)qword_10000D780;
  qword_10000D780 = (uint64_t)v4;
}

void sub_10000273C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extensionContext];
  [v1 completeRequestReturningItems:0 completionHandler:0];
}

void sub_1000038BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003900(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003910(uint64_t a1)
{
}

void sub_100003918(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 filePath];
  if (v7)
  {
    v8 = +[NSURL fileURLWithPath:v7 isDirectory:0];
    if (v8)
    {
      v9 = +[NSUUID UUID];
      v10 = [v9 UUIDString];

      v11 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v10 isDirectory:0];
      v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v13 + 40);
      [v12 copyItemAtURL:v8 toURL:v11 error:&obj];
      objc_storeStrong((id *)(v13 + 40), obj);
      v14 = *(void **)(a1 + 48);
      v15 = [v6 remoteURL];
      [v14 setObject:v11 forKeyedSubscript:v15];

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        *a4 = 1;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100004C10();
  }
}

id sub_100003F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) assetHandleForURL:a2 prefetchedFileURL:a3 importMethod:0 lifetimeHint:0];
}

void sub_1000042C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = +[NSURL nss_NewsURLForArticleID:v5 internal:0 targetIsVideo:0 hardPaywall:1];
    v8 = (void *)FCOpenInNewsLog;
    if (!os_log_type_enabled(FCOpenInNewsLog, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v9 = v8;
    v10 = [v7 absoluteString];
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    v11 = "Open article in News %@";
  }
  else
  {
    CFStringRef v17 = @"openinnewserror";
    v12 = +[NSArray arrayWithObjects:&v17 count:1];
    v7 = +[NSURL nss_NewsURLWithPathComponents:v12 internal:0];

    uint64_t v13 = (void *)FCOpenInNewsLog;
    if (!os_log_type_enabled(FCOpenInNewsLog, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v14 = *(void **)(a1 + 32);
    v9 = v13;
    v10 = [v14 absoluteString];
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    v11 = "Unable to open in News %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, buf, 0xCu);

LABEL_7:
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
  v16 = +[LSApplicationWorkspace defaultWorkspace];
  [v16 openSensitiveURL:v7 withOptions:0];
}

void sub_10000452C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

void sub_1000045F0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"flintDocumentURLAssetHandlesByRemoteURL", v6, 2u);
}

void sub_1000046B4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_100004778()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_10000483C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_100004900()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"encodableElement", v6, 2u);
}

void sub_1000049C4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_100004A88()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedDirectoryFileURL", v6, 2u);
}

void sub_100004B4C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referralItem", v6, 2u);
}

void sub_100004C10()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFilePath", v6, 2u);
}

void sub_100004CD4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_100004D98()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryValue", v6, 2u);
}

void sub_100004E5C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100001D18();
  sub_100001CEC();
  sub_100001CD8();
  sub_100001CFC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemClass", v6, 2u);
}

uint64_t FCDynamicCast()
{
  return _FCDynamicCast();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return _FCURLForContainerizedUserAccountCachesDirectory();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_exception_throw(id exception)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_JSONArray(void *a1, const char *a2, ...)
{
  return [a1 JSONArray];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return [a1 articleRecordData];
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return [a1 asChannel];
}

id objc_msgSend_assetHandles(void *a1, const char *a2, ...)
{
  return [a1 assetHandles];
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return [a1 assetManager];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return [a1 configurationManager];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_encodableElement(void *a1, const char *a2, ...)
{
  return [a1 encodableElement];
}

id objc_msgSend_encodableElementClass(void *a1, const char *a2, ...)
{
  return [a1 encodableElementClass];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_flintDocumentURLAssetHandlesByRemoteURL(void *a1, const char *a2, ...)
{
  return [a1 flintDocumentURLAssetHandlesByRemoteURL];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_myEncodableElement(void *a1, const char *a2, ...)
{
  return [a1 myEncodableElement];
}

id objc_msgSend_networkReachability(void *a1, const char *a2, ...)
{
  return [a1 networkReachability];
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return [a1 parentIssueRecordData];
}

id objc_msgSend_referralItem(void *a1, const char *a2, ...)
{
  return [a1 referralItem];
}

id objc_msgSend_remoteURL(void *a1, const char *a2, ...)
{
  return [a1 remoteURL];
}

id objc_msgSend_sharedDirectoryFileURL(void *a1, const char *a2, ...)
{
  return [a1 sharedDirectoryFileURL];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkReachability];
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return [a1 sourceChannelID];
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return [a1 sourceChannelRecordData];
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return [a1 tagController];
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return [a1 uniqueKey];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}
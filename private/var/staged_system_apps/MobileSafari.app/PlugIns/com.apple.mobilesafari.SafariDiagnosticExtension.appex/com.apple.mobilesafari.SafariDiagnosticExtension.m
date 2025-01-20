id SafariLibraryPath()
{
  void *v0;
  uint64_t vars8;

  if (qword_100010C20 != -1) {
    dispatch_once(&qword_100010C20, &stru_10000C2D8);
  }
  v0 = (void *)qword_100010C18;

  return v0;
}

void sub_100004B14(id a1)
{
  v1 = _SFSafariContainerPath();
  id v4 = v1;
  if (v1) {
    [v1 stringByAppendingPathComponent:@"Library"];
  }
  else {
  uint64_t v2 = SafariNonContaineredLibraryPath();
  }
  v3 = (void *)qword_100010C18;
  qword_100010C18 = v2;
}

id SafariNonContaineredLibraryPath()
{
  if (qword_100010C30 != -1) {
    dispatch_once(&qword_100010C30, &stru_10000C2F8);
  }
  v0 = (void *)qword_100010C28;

  return v0;
}

void sub_100004BD4(id a1)
{
  qword_100010C28 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library"];

  _objc_release_x1();
}

id SafariSettingsDirectoryPath()
{
  v0 = (void *)qword_100010C38;
  if (!qword_100010C38)
  {
    v1 = SafariLibraryPath();
    uint64_t v2 = [v1 stringByAppendingPathComponent:@"Safari"];
    v3 = (void *)qword_100010C38;
    qword_100010C38 = v2;

    id v4 = +[NSFileManager defaultManager];
    [v4 _web_createDirectoryAtPathWithIntermediateDirectories:qword_100010C38 attributes:0];

    v0 = (void *)qword_100010C38;
  }

  return v0;
}

id SafariCloudBookmarksMigrationCoordinatorDirectoryURL()
{
  v0 = SafariSettingsDirectoryPath();
  v1 = [v0 stringByAppendingPathComponent:@"CloudBookmarksMigrationCoordinator"];
  uint64_t v2 = +[NSURL fileURLWithPath:v1 isDirectory:1];

  return v2;
}

id SafariCloudBookmarksMigrationCoordinatorLogsDirectoryURL()
{
  v0 = SafariCloudBookmarksMigrationCoordinatorDirectoryURL();
  v1 = [v0 URLByAppendingPathComponent:@"Logs" isDirectory:1];

  return v1;
}

void sub_100004D7C(id a1)
{
  qword_100010C40 = (uint64_t)os_log_create("com.apple.mobilesafari", "DiagnosticExtension");

  _objc_release_x1();
}

void sub_100004E14(id a1)
{
  qword_100010C50 = (uint64_t)objc_alloc_init((Class)WBReadonlyTabCollection);

  _objc_release_x1();
}

void sub_100004EA4(id a1)
{
  id v1 = objc_alloc((Class)WBTabCollection);
  id v4 = +[WBCollectionConfiguration safariTabCollectionConfiguration];
  id v2 = [v1 initWithConfiguration:v4 openDatabase:1];
  v3 = (void *)qword_100010C60;
  qword_100010C60 = (uint64_t)v2;
}

void sub_100004FC0()
{
  id v0 = objc_alloc((Class)WBTabGroupManager);
  id v3 = [(id)objc_opt_class() _tabCollection];
  id v1 = [v0 initWithCollection:v3];
  id v2 = (void *)qword_100010C70;
  qword_100010C70 = (uint64_t)v1;
}

void sub_100005090(id a1)
{
  qword_100010C80 = objc_alloc_init(SafariProfileDelegate);

  _objc_release_x1();
}

void sub_100005120(id a1)
{
  id v1 = objc_alloc((Class)SFWebExtensionsController);
  id v2 = [v1 initWithProfileServerID:WBSDefaultProfileIdentifier userContentController:0];
  id v3 = (void *)qword_100010C90;
  qword_100010C90 = (uint64_t)v2;

  id v4 = +[SafariDiagnosticExtension sharedProfileDelegate];
  [(id)qword_100010C90 setProfileDelegate:v4];
}

void sub_100005248(uint64_t a1)
{
  id v2 = objc_alloc((Class)SFContentBlockerManager);
  id v5 = [*(id *)(a1 + 32) defaultWebExtensionsController];
  id v3 = [v2 initWithUserContentController:0 webExtensionsController:v5];
  id v4 = (void *)qword_100010CA0;
  qword_100010CA0 = (uint64_t)v3;
}

void sub_100005454(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = [(id)objc_opt_class() defaultContentBlockerManager];
  [v5 addObserver:*(void *)(a1 + 32)];

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  id v9 = [(id)objc_opt_class() defaultWebExtensionsController];
  [v9 addObserver:*(void *)(a1 + 32)];
}

void sub_100005BE0(id *a1, void *a2)
{
  id v11 = a2;
  if ([a1[4] isPrivateBrowsing])
  {
    uint64_t v3 = @"Private Tab";
    goto LABEL_4;
  }
  id v4 = [v11 url];
  uint64_t v3 = [v4 absoluteString];

  if (v3)
  {
LABEL_4:
    if (![(__CFString *)v3 isEqual:&stru_10000C6F0]) {
      goto LABEL_6;
    }
  }

  uint64_t v3 = @"Start Page";
LABEL_6:
  id v5 = [v11 uuid];
  if ([v5 length])
  {
    uint64_t v6 = [(__CFString *)v3 stringByAppendingFormat:@" (%@)", v5];

    uint64_t v3 = (__CFString *)v6;
  }
  if (WBSIsEqual())
  {
    uint64_t v7 = [a1[4] uuid];
    v8 = [a1[6] activeTabGroupUUID];
    int v9 = WBSIsEqual();

    if (v9)
    {
      uint64_t v10 = [(__CFString *)v3 stringByAppendingString:@" (Current)"];

      uint64_t v3 = (__CFString *)v10;
    }
  }
  [a1[7] appendFormat:@"%@\n", v3];
}

uint64_t sub_100006418(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v2 = [a2 uuid];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

void sub_100006E44(uint64_t a1)
{
  dispatch_semaphore_t v2 = [(id)objc_opt_class() defaultWebExtensionsController];
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v3, v4);
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEBUG)) {
    sub_100008C20();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v2 allDiscoveredExtensions];
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v19 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v9 = [v2 webExtensionForExtension:v8];
        uint64_t v10 = [v9 displayName];
        id v11 = [v8 _plugIn];
        v12 = [v11 identifier];
        v13 = +[NSString stringWithFormat:@"%@ (%@)", v10, v12];

        unsigned int v14 = [v2 extensionIsEnabled:v8];
        v15 = *(void **)(a1 + 40);
        CFStringRef v16 = @"disabled:";
        if (v14) {
          CFStringRef v16 = @"enabled:";
        }
        v17 = +[NSString stringWithFormat:@"%@ %@", v16, v13];
        [v15 addObject:v17];
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
}

void sub_100007810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000783C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000784C(uint64_t a1)
{
}

void sub_100007854(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEBUG)) {
    sub_100008DF0();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008288(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEBUG)) {
    sub_100008FBC();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008548(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 lastPathComponent];
  id v4 = [v3 length];
  id v5 = [*(id *)(a1 + 32) firstMatchInString:v3 options:0 range:0 v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) firstMatchInString:v3 options:0 range:0 v4];

    if (!v6)
    {
      uint64_t v7 = *(void **)(a1 + 48);
      v8 = +[DEAttachmentItem attachmentWithPathURL:v9];
      [v7 addObject:v8];
    }
  }
}

void sub_10000867C(id a1)
{
  qword_100010CB0 = _SFSafariTemporaryDirectoryPath();

  _objc_release_x1();
}

void sub_1000088C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000088E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000892C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100008960()
{
  return v0;
}

void sub_10000896C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000898C()
{
  sub_100008920();
  id v2 = v1;
  id v3 = [sub_100008960() safari_privacyPreservingDescription];
  sub_100008908();
  sub_1000088C0((void *)&_mh_execute_header, v4, v5, "Failed to write file with list of open tabs to %{public}@: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100008A24()
{
  sub_100008920();
  id v2 = v1;
  id v3 = [sub_100008960() safari_privacyPreservingDescription];
  sub_100008908();
  sub_1000088C0((void *)&_mh_execute_header, v4, v5, "Failed to write file with list of open tabs to %{public}@, error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100008ABC()
{
  sub_100008920();
  id v2 = v1;
  id v3 = [sub_100008960() safari_privacyPreservingDescription];
  sub_100008948();
  sub_1000088C0((void *)&_mh_execute_header, v4, v5, "Failed to write list of content blockers to %{public}@: %@{public}", v6, v7, v8, v9, v10);
}

void sub_100008B54()
{
  sub_1000088FC();
  sub_1000088E0((void *)&_mh_execute_header, v0, v1, "Moving past content blocker semaphore", v2, v3, v4, v5, v6);
}

void sub_100008B88()
{
  sub_100008920();
  id v2 = v1;
  uint64_t v3 = [sub_100008960() safari_privacyPreservingDescription];
  sub_100008948();
  sub_1000088C0((void *)&_mh_execute_header, v4, v5, "Failed to write list of web extensions to %{public}@: %@{public}", v6, v7, v8, v9, v10);
}

void sub_100008C20()
{
  sub_1000088FC();
  sub_1000088E0((void *)&_mh_execute_header, v0, v1, "Moving past web extensions semaphore", v2, v3, v4, v5, v6);
}

void sub_100008C54(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 safari_privacyPreservingDescription];
  sub_10000896C((void *)&_mh_execute_header, v5, v6, "Error collecting migration eligibility logs: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_100008CEC()
{
  sub_1000088FC();
  sub_10000892C((void *)&_mh_execute_header, v0, v1, "Sync agent failed to collect bookmarks diagnostics data", v2, v3, v4, v5, v6);
}

void sub_100008D20(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to write bookmarks diagnostics data to %{public}@ with error: %{public}@", buf, 0x16u);
}

void sub_100008D88()
{
  sub_1000088FC();
  sub_10000892C((void *)&_mh_execute_header, v0, v1, "Timed out waiting for sync agent to collect bookmarks diagnostics data", v2, v3, v4, v5, v6);
}

void sub_100008DBC()
{
  sub_1000088FC();
  sub_1000088E0((void *)&_mh_execute_header, v0, v1, "Waiting for response from sync agent", v2, v3, v4, v5, v6);
}

void sub_100008DF0()
{
  sub_1000088FC();
  sub_1000088E0((void *)&_mh_execute_header, v0, v1, "Received response from sync agent", v2, v3, v4, v5, v6);
}

void sub_100008E24(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 safari_privacyPreservingDescription];
  sub_10000896C((void *)&_mh_execute_header, v5, v6, "Failed to delete sensitive data from database with error: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_100008EBC()
{
  sub_100008920();
  id v2 = v1;
  id v3 = [sub_100008960() safari_privacyPreservingDescription];
  sub_100008908();
  sub_1000088C0((void *)&_mh_execute_header, v4, v5, "Failed to write file with tab collection diagnostics to %{public}@, error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100008F54()
{
  sub_1000088FC();
  sub_10000892C((void *)&_mh_execute_header, v0, v1, "Timed out waiting for sync agent to collect CloudKit data", v2, v3, v4, v5, v6);
}

void sub_100008F88()
{
  sub_1000088FC();
  sub_1000088E0((void *)&_mh_execute_header, v0, v1, "Waiting for response from sync agent for CloudKit data", v2, v3, v4, v5, v6);
}

void sub_100008FBC()
{
  sub_1000088FC();
  sub_1000088E0((void *)&_mh_execute_header, v0, v1, "Received response from sync agent for ckbookmarks data", v2, v3, v4, v5, v6);
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OSAIterateSubmittableLogsWithBlock()
{
  return _OSAIterateSubmittableLogsWithBlock();
}

uint64_t WBSIsEqual()
{
  return _WBSIsEqual();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SFDeviceIsPad()
{
  return __SFDeviceIsPad();
}

uint64_t _SFSafariContainerPath()
{
  return __SFSafariContainerPath();
}

uint64_t _SFSafariTemporaryDirectoryPath()
{
  return __SFSafariTemporaryDirectoryPath();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

id objc_msgSend__bookmarksAttachmentItem(void *a1, const char *a2, ...)
{
  return [a1 _bookmarksAttachmentItem];
}

id objc_msgSend__cloudKitDataAttachment(void *a1, const char *a2, ...)
{
  return [a1 _cloudKitDataAttachment];
}

id objc_msgSend__contentBlockerListAttachment(void *a1, const char *a2, ...)
{
  return [a1 _contentBlockerListAttachment];
}

id objc_msgSend__currentLayoutModeAttachment(void *a1, const char *a2, ...)
{
  return [a1 _currentLayoutModeAttachment];
}

id objc_msgSend__migrationEligibilityLogItem(void *a1, const char *a2, ...)
{
  return [a1 _migrationEligibilityLogItem];
}

id objc_msgSend__openTabsAttachment(void *a1, const char *a2, ...)
{
  return [a1 _openTabsAttachment];
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return [a1 _plugIn];
}

id objc_msgSend__readOnlyTabCollection(void *a1, const char *a2, ...)
{
  return [a1 _readOnlyTabCollection];
}

id objc_msgSend__tabCollection(void *a1, const char *a2, ...)
{
  return [a1 _tabCollection];
}

id objc_msgSend__temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 _temporaryDirectory];
}

id objc_msgSend__webExtensionsListAttachment(void *a1, const char *a2, ...)
{
  return [a1 _webExtensionsListAttachment];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeTabGroupUUID(void *a1, const char *a2, ...)
{
  return [a1 activeTabGroupUUID];
}

id objc_msgSend_allDiscoveredExtensions(void *a1, const char *a2, ...)
{
  return [a1 allDiscoveredExtensions];
}

id objc_msgSend_allNamedTabGroupsUnsorted(void *a1, const char *a2, ...)
{
  return [a1 allNamedTabGroupsUnsorted];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultContentBlockerManager(void *a1, const char *a2, ...)
{
  return [a1 defaultContentBlockerManager];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWebExtensionsController(void *a1, const char *a2, ...)
{
  return [a1 defaultWebExtensionsController];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_extensions(void *a1, const char *a2, ...)
{
  return [a1 extensions];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isPrivateBrowsing(void *a1, const char *a2, ...)
{
  return [a1 isPrivateBrowsing];
}

id objc_msgSend_isSafariProfilesEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSafariProfilesEnabled];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTabGroup(void *a1, const char *a2, ...)
{
  return [a1 localTabGroup];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_preferredCapsuleLayoutStyle(void *a1, const char *a2, ...)
{
  return [a1 preferredCapsuleLayoutStyle];
}

id objc_msgSend_privateTabGroup(void *a1, const char *a2, ...)
{
  return [a1 privateTabGroup];
}

id objc_msgSend_profileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 profileIdentifier];
}

id objc_msgSend_safariTabCollectionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 safariTabCollectionConfiguration];
}

id objc_msgSend_sharedFeatureManager(void *a1, const char *a2, ...)
{
  return [a1 sharedFeatureManager];
}

id objc_msgSend_sharedProfileDelegate(void *a1, const char *a2, ...)
{
  return [a1 sharedProfileDelegate];
}

id objc_msgSend_tabs(void *a1, const char *a2, ...)
{
  return [a1 tabs];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_windowStates(void *a1, const char *a2, ...)
{
  return [a1 windowStates];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}
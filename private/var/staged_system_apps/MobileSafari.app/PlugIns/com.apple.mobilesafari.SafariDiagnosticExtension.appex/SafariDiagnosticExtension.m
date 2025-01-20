@interface SafariDiagnosticExtension
+ (id)_tabCollection;
+ (id)defaultContentBlockerManager;
+ (id)defaultWebExtensionsController;
+ (id)sharedProfileDelegate;
+ (id)tabGroupManager;
+ (void)initialize;
- (SafariDiagnosticExtension)init;
- (id)_bookmarksAttachmentItem;
- (id)_cloudKitDataAttachment;
- (id)_contentBlockerListAttachment;
- (id)_currentLayoutModeAttachment;
- (id)_getAttachmentsWithDisplayNamePattern:(id)a3;
- (id)_migrationEligibilityLogItem;
- (id)_openTabsAttachment;
- (id)_readOnlyTabCollection;
- (id)_tabCollectionDataAttachmentItemHidingSensitiveData:(BOOL)a3;
- (id)_tabsDatabaseAttachmentsItemHidingSensitiveData:(BOOL)a3;
- (id)_temporaryDirectory;
- (id)_webExtensionsListAttachment;
- (id)attachmentsForParameters:(id)a3;
- (void)_addTabGroup:(id)a3 inWindow:(id)a4 toLog:(id)a5;
- (void)_addWindow:(id)a3 withActiveTabGroup:(id)a4 toLog:(id)a5;
- (void)contentBlockerManagerExtensionListDidChange:(id)a3;
- (void)dealloc;
- (void)extensionsControllerExtensionListDidChange:(id)a3;
@end

@implementation SafariDiagnosticExtension

- (id)_readOnlyTabCollection
{
  if (qword_100010C58 != -1) {
    dispatch_once(&qword_100010C58, &stru_10000C338);
  }
  v2 = (void *)qword_100010C50;

  return v2;
}

+ (id)_tabCollection
{
  if (qword_100010C68 != -1) {
    dispatch_once(&qword_100010C68, &stru_10000C358);
  }
  v2 = (void *)qword_100010C60;

  return v2;
}

+ (id)tabGroupManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004FC0;
  block[3] = &unk_10000C378;
  block[4] = a1;
  if (qword_100010C78 != -1) {
    dispatch_once(&qword_100010C78, block);
  }
  v2 = (void *)qword_100010C70;

  return v2;
}

+ (id)sharedProfileDelegate
{
  if (qword_100010C88 != -1) {
    dispatch_once(&qword_100010C88, &stru_10000C398);
  }
  v2 = (void *)qword_100010C80;

  return v2;
}

+ (id)defaultWebExtensionsController
{
  if (qword_100010C98 != -1) {
    dispatch_once(&qword_100010C98, &stru_10000C3B8);
  }
  v2 = (void *)qword_100010C90;

  return v2;
}

+ (id)defaultContentBlockerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005248;
  block[3] = &unk_10000C378;
  block[4] = a1;
  if (qword_100010CA8 != -1) {
    dispatch_once(&qword_100010CA8, block);
  }
  v2 = (void *)qword_100010CA0;

  return v2;
}

+ (void)initialize
{
  _SFSafariContainerPath();
  id v2 = objc_claimAutoreleasedReturnValue();
  setenv("HOME", (const char *)[v2 fileSystemRepresentation], 1);
  id v4 = v2;
  setenv("CFFIXED_USER_HOME", (const char *)[v4 fileSystemRepresentation], 1);
  _SFSafariTemporaryDirectoryPath();
  id v3 = objc_claimAutoreleasedReturnValue();
  setenv("TMPDIR", (const char *)[v3 fileSystemRepresentation], 1);
}

- (SafariDiagnosticExtension)init
{
  v11.receiver = self;
  v11.super_class = (Class)SafariDiagnosticExtension;
  id v2 = [(SafariDiagnosticExtension *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005454;
    block[3] = &unk_10000C3E0;
    id v4 = v2;
    v10 = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileSafari.SafariDiagnosticExtension.DatabaseQueue", 0);
    databaseQueue = v4->_databaseQueue;
    v4->_databaseQueue = (OS_dispatch_queue *)v5;

    v7 = v4;
  }

  return v3;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  dispatch_queue_t v5 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to gather diagnostic extension attachments", (uint8_t *)&v23, 2u);
  }
  v6 = +[NSMutableArray array];
  unsigned int v7 = [v4 safari_BOOLForKey:@"DEExtensionAttachmentsParamConsentProvidedKey"];
  if (v7)
  {
    v8 = [(SafariDiagnosticExtension *)self _openTabsAttachment];
    if (v8) {
      [v6 addObject:v8];
    }
    if (+[WBSFeatureAvailability isInternalInstall])
    {
      v9 = [(SafariDiagnosticExtension *)self _cloudKitDataAttachment];
      [v6 safari_addObjectUnlessNil:v9];
    }
  }
  uint64_t v10 = v7 ^ 1;
  objc_super v11 = [(SafariDiagnosticExtension *)self _tabsDatabaseAttachmentsItemHidingSensitiveData:v10];
  [v6 safari_addObjectsFromArrayUnlessNil:v11];

  v12 = [(SafariDiagnosticExtension *)self _tabCollectionDataAttachmentItemHidingSensitiveData:v10];
  [v6 safari_addObjectUnlessNil:v12];

  v13 = [(SafariDiagnosticExtension *)self _contentBlockerListAttachment];
  if (v13) {
    [v6 addObject:v13];
  }
  v14 = [(SafariDiagnosticExtension *)self _webExtensionsListAttachment];
  if (v14) {
    [v6 addObject:v14];
  }
  v15 = [(SafariDiagnosticExtension *)self _currentLayoutModeAttachment];
  [v6 safari_addObjectUnlessNil:v15];
  v16 = [(SafariDiagnosticExtension *)self _bookmarksAttachmentItem];
  if (v16) {
    [v6 addObject:v16];
  }
  v17 = [(SafariDiagnosticExtension *)self _migrationEligibilityLogItem];
  if (v17) {
    [v6 addObject:v17];
  }
  v18 = [(SafariDiagnosticExtension *)self _getAttachmentsWithDisplayNamePattern:@"com\\.apple\\.WebKit.*"];
  [v6 addObjectsFromArray:v18];

  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  v19 = (void *)qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    id v21 = [v6 count];
    int v23 = 134217984;
    id v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Finished gathering %lu diagnostic extension attachments", (uint8_t *)&v23, 0xCu);
  }

  return v6;
}

- (id)_currentLayoutModeAttachment
{
  if (_SFDeviceIsPad())
  {
    id v3 = +[NSUserDefaults safari_browserDefaults];
    unsigned int v4 = [v3 BOOLForKey:SFEnableStandaloneTabBarKey];

    CFStringRef v5 = @"Compact";
    if (v4) {
      CFStringRef v5 = @"Separate";
    }
    +[NSString stringWithFormat:@"Current Tab Bar Layout: %@", v5];
  }
  else
  {
    v6 = +[SFFeatureManager sharedFeatureManager];
    id v7 = [v6 preferredCapsuleLayoutStyle];

    CFStringRef v8 = @"Top";
    if (v7 != (id)2) {
      CFStringRef v8 = 0;
    }
    if (v7 == (id)1) {
      CFStringRef v8 = @"BottomWithToolbar";
    }
    +[NSString stringWithFormat:@"Current Capsule Layout: %@", v8];
  v9 = };
  uint64_t v10 = +[NSDate now];
  objc_super v11 = [v10 safari_filenameFormattedString];

  v12 = [(SafariDiagnosticExtension *)self _temporaryDirectory];
  v13 = +[NSString stringWithFormat:@"Safari Current Layout State_%@.log", v11];
  v14 = [v12 stringByAppendingPathComponent:v13];

  id v19 = 0;
  LODWORD(v13) = [v9 writeToFile:v14 atomically:1 encoding:4 error:&v19];
  id v15 = v19;
  v16 = v15;
  if (!v13 || v15)
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
      sub_10000898C();
    }
    v17 = 0;
  }
  else
  {
    v17 = +[DEAttachmentItem attachmentWithPath:v14];
    [v17 setDeleteOnAttach:&__kCFBooleanTrue];
  }

  return v17;
}

- (void)_addTabGroup:(id)a3 inWindow:(id)a4 toLog:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 uuid];
  objc_super v11 = [v8 activeTabUUIDForTabGroupWithUUID:v10];

  v12 = [v7 tabWithUUID:v11];
  v13 = [v7 title];
  [v9 appendFormat:@"%@\n", v13];

  v14 = [v7 tabs];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005BE0;
  v19[3] = &unk_10000C408;
  id v20 = v7;
  id v21 = v12;
  id v22 = v8;
  id v23 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v12;
  id v18 = v7;
  [v14 enumerateObjectsUsingBlock:v19];
}

- (void)_addWindow:(id)a3 withActiveTabGroup:(id)a4 toLog:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v15 uuid];
  [v9 appendFormat:@"Browser Window : %@\n\n", v10];
  if (+[WBSFeatureAvailability isSafariProfilesEnabled])
  {
    objc_super v11 = [v8 profileIdentifier];
    [v9 appendFormat:@"Active Profile: %@\n\n", v11];
  }
  v12 = [v15 localTabGroup];
  [(SafariDiagnosticExtension *)self _addTabGroup:v12 inWindow:v15 toLog:v9];

  v13 = [v15 localTabGroup];
  char v14 = WBSIsEqual();

  if ((v14 & 1) == 0)
  {
    [v9 appendString:@"\n"];
    [(SafariDiagnosticExtension *)self _addTabGroup:v8 inWindow:v15 toLog:v9];
  }
  [v9 appendString:@"\n\n"];
}

- (id)_openTabsAttachment
{
  if (+[WBSFeatureAvailability isSafariProfilesEnabled])
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    id v2 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v3 = "Starting to gather open tabs, tab groups, and profiles";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, v3, buf, 2u);
    }
  }
  else
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    id v2 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v3 = "Starting to gather open tabs and tab groups";
      goto LABEL_10;
    }
  }
  id v4 = objc_alloc_init((Class)WBReadonlyTabCollection);
  CFStringRef v5 = [v4 windowStates];
  if ([v5 count])
  {
    id v36 = objc_alloc_init((Class)NSMutableString);
    v6 = +[NSDate now];
    uint64_t v7 = [v6 safari_filenameFormattedString];

    id v8 = [(SafariDiagnosticExtension *)self _temporaryDirectory];
    v30 = (void *)v7;
    id v9 = +[NSString stringWithFormat:@"Safari URLs for All Tabs_%@.log", v7];
    v32 = [v8 stringByAppendingPathComponent:v9];

    id v29 = v4;
    v34 = [v4 allNamedTabGroupsUnsorted];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v31 = v5;
    id obj = v5;
    id v10 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(obj);
          }
          char v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v15 = [v14 activeTabGroupUUID];
          id v16 = [v14 localTabGroup];
          v45[0] = v16;
          id v17 = [v14 privateTabGroup];
          v45[1] = v17;
          id v18 = +[NSArray arrayWithObjects:v45 count:2];
          id v19 = [v34 arrayByAddingObjectsFromArray:v18];

          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100006418;
          v38[3] = &unk_10000C430;
          id v39 = v15;
          id v20 = v15;
          id v21 = [v19 safari_firstObjectPassingTest:v38];
          [(SafariDiagnosticExtension *)self _addWindow:v14 withActiveTabGroup:v21 toLog:v36];
        }
        id v11 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v11);
    }

    [v36 appendString:@"\n"];
    id v37 = 0;
    unsigned __int8 v22 = [v36 writeToFile:v32 atomically:1 encoding:4 error:&v37];
    id v23 = v37;
    if (v22)
    {
      id v24 = +[DEAttachmentItem attachmentWithPath:v32];
      [v24 setDeleteOnAttach:&__kCFBooleanTrue];
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      id v4 = v29;
      v25 = v30;
      CFStringRef v5 = v31;
      v26 = qword_100010C40;
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Finished gathering open tabs", buf, 2u);
      }
    }
    else
    {
      v25 = v30;
      CFStringRef v5 = v31;
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      id v4 = v29;
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
        sub_100008A24();
      }
      id v24 = 0;
    }
  }
  else
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    v27 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No windows are currently open", buf, 2u);
    }
    id v24 = 0;
  }

  return v24;
}

- (void)contentBlockerManagerExtensionListDidChange:(id)a3
{
  id v4 = a3;
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  CFStringRef v5 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content Blocker extension list changed", v6, 2u);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreWaitingForChangeInContentBlockers);
}

- (id)_contentBlockerListAttachment
{
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v3 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather content blockers", buf, 2u);
  }
  v34 = [(id)objc_opt_class() defaultContentBlockerManager];
  v31 = self;
  semaphoreWaitingForChangeInContentBlockers = self->_semaphoreWaitingForChangeInContentBlockers;
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)semaphoreWaitingForChangeInContentBlockers, v5);
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEBUG)) {
    sub_100008B54();
  }
  v6 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v34 extensions];
  id v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        id v10 = v6;
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v12 = [v34 displayNameForExtension:v11];
        v13 = [v11 _plugIn];
        char v14 = [v13 identifier];
        id v15 = +[NSString stringWithFormat:@"%@ (%@)", v12, v14];

        unsigned int v16 = [v34 extensionIsEnabled:v11];
        CFStringRef v17 = @"disabled:";
        if (v16) {
          CFStringRef v17 = @"enabled:";
        }
        id v18 = +[NSString stringWithFormat:@"%@ %@", v17, v15];
        v6 = v10;
        [v10 addObject:v18];
      }
      id v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    id v19 = +[NSDate now];
    id v20 = [v19 safari_filenameFormattedString];

    id v21 = [(SafariDiagnosticExtension *)v31 _temporaryDirectory];
    unsigned __int8 v22 = +[NSString stringWithFormat:@"Safari Content Blockers_%@.log", v20];
    id v23 = [v21 stringByAppendingPathComponent:v22];

    if ([v6 count])
    {
      id v24 = [v6 componentsJoinedByString:@"\n"];
    }
    else
    {
      id v24 = @"No Content Blockers found.";
    }
    id v35 = 0;
    unsigned __int8 v27 = [(__CFString *)v24 writeToFile:v23 atomically:1 encoding:4 error:&v35];
    id v28 = v35;
    if (v27)
    {
      v26 = +[DEAttachmentItem attachmentWithPath:v23];
      [v26 setDeleteOnAttach:&__kCFBooleanTrue];
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      id v29 = qword_100010C40;
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Finished gathering content blockers", buf, 2u);
      }
    }
    else
    {
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
        sub_100008ABC();
      }
      v26 = 0;
    }
  }
  else
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    v25 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "No content blocker extensions found", buf, 2u);
    }
    v26 = 0;
  }

  return v26;
}

- (void)extensionsControllerExtensionListDidChange:(id)a3
{
  id v4 = a3;
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  dispatch_time_t v5 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Web extensions list changed", v6, 2u);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreWaitingForChangeInWebExtensions);
}

- (id)_webExtensionsListAttachment
{
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v3 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather web extensions", buf, 2u);
  }
  +[NSMutableArray array];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006E44;
  block[3] = &unk_10000C458;
  void block[4] = self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  if ([v4 count])
  {
    dispatch_time_t v5 = +[NSDate now];
    v6 = [v5 safari_filenameFormattedString];

    id v7 = [(SafariDiagnosticExtension *)self _temporaryDirectory];
    id v8 = +[NSString stringWithFormat:@"Safari Web Extensions_%@.log", v6];
    id v9 = [v7 stringByAppendingPathComponent:v8];

    id v10 = [v4 componentsJoinedByString:@"\n"];
    id v17 = 0;
    unsigned __int8 v11 = [v10 writeToFile:v9 atomically:1 encoding:4 error:&v17];
    id v12 = v17;
    if (v11)
    {
      v13 = +[DEAttachmentItem attachmentWithPath:v9];
      [v13 setDeleteOnAttach:&__kCFBooleanTrue];
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      char v14 = qword_100010C40;
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finished gathering web extensions", buf, 2u);
      }
    }
    else
    {
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
        sub_100008B88();
      }
      v13 = 0;
    }
  }
  else
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    id v15 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No web extensions found", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)_migrationEligibilityLogItem
{
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v2 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Starting to gather bookmarks migration diagnostics", buf, 2u);
  }
  id v3 = SafariCloudBookmarksMigrationCoordinatorLogsDirectoryURL();
  id v4 = +[NSDate now];
  dispatch_time_t v5 = [v4 safari_filenameFormattedString];

  v6 = +[NSString stringWithFormat:@"cloudBookmarksMigrationEligibility_%@.log", v5];
  id v7 = NSTemporaryDirectory();
  uint64_t v8 = [v7 stringByAppendingPathComponent:v6];
  id v9 = +[NSURL fileURLWithPath:v8 isDirectory:0];

  id v19 = 0;
  LOBYTE(v8) = +[WBSFileLogger collectLogsInDirectory:v3 withName:@"migrationEligibility" intoFile:v9 error:&v19];
  id v10 = v19;
  unsigned __int8 v11 = v10;
  if (v8)
  {
    id v12 = +[DEAttachmentItem attachmentWithPathURL:v9];
    [v12 setDeleteOnAttach:&__kCFBooleanTrue];
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    v13 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Finished gathering bookmarks migration diagnostics", v17, 2u);
    }
  }
  else
  {
    if (v10)
    {
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      char v14 = (void *)qword_100010C40;
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
        sub_100008C54(v14, v11);
      }
    }
    else
    {
      if (qword_100010C48 != -1) {
        dispatch_once(&qword_100010C48, &stru_10000C318);
      }
      id v15 = qword_100010C40;
      if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No migration elibility logs to collect", v18, 2u);
      }
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_bookmarksAttachmentItem
{
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v3 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather bookmarks diagnostics", buf, 2u);
  }
  id v4 = +[NSDate now];
  dispatch_time_t v5 = [v4 safari_filenameFormattedString];

  v6 = +[NSString stringWithFormat:@"Bookmarks_Diagnostic_%@.json", v5];
  id v7 = [(SafariDiagnosticExtension *)self _temporaryDirectory];
  uint64_t v8 = [v7 stringByAppendingPathComponent:v6];

  id v9 = [@"file://" stringByAppendingString:v8];
  id v10 = +[NSURL URLWithString:v9];

  id v11 = objc_alloc_init((Class)WBSSafariBookmarksSyncAgentProxy);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  id v28 = buf;
  uint64_t v29 = 0x3032000000;
  v30 = sub_10000783C;
  v31 = sub_10000784C;
  id v32 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100007854;
  v24[3] = &unk_10000C480;
  v26 = buf;
  v13 = v12;
  v25 = v13;
  [v11 collectDiagnosticsDataWithCompletionHandler:v24];
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEBUG)) {
    sub_100008DBC();
  }
  dispatch_time_t v14 = dispatch_time(0, 90000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
      sub_100008D88();
    }
LABEL_14:
    id v15 = 0;
    goto LABEL_32;
  }
  unsigned int v16 = (void *)*((void *)v28 + 5);
  if (!v16)
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
      sub_100008CEC();
    }
    goto LABEL_14;
  }
  id v23 = 0;
  unsigned __int8 v17 = [v16 writeToURL:v10 options:1 error:&v23];
  id v18 = v23;
  if (v17)
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    id v19 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v33 = 138543362;
      v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Finished writing bookmarks diagnostic data to %{public}@", v33, 0xCu);
    }
    id v15 = +[DEAttachmentItem attachmentWithPathURL:v10];
    [v15 setDeleteOnAttach:&__kCFBooleanTrue];
  }
  else
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    id v20 = (id)qword_100010C40;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [v18 safari_privacyPreservingDescription];
      sub_100008D20((uint64_t)v10, v21, v33, v20);
    }

    id v15 = 0;
  }

LABEL_32:
  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)_tabsDatabaseAttachmentsItemHidingSensitiveData:(BOOL)a3
{
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v4 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v28 = @" with sensitive data removed";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to gather tabs database diagnostics%@.", buf, 0xCu);
  }
  dispatch_time_t v5 = +[NSDate now];
  v6 = [v5 safari_filenameFormattedString];

  id v7 = [(SafariDiagnosticExtension *)self _temporaryDirectory];
  uint64_t v8 = +[NSString stringWithFormat:@"SafariTabs%@_%@.db", @"_WithoutSensitiveData", v6];
  id v9 = [v7 stringByAppendingPathComponent:v8];
  id v10 = +[NSURL fileURLWithPath:v9];

  id v11 = [(SafariDiagnosticExtension *)self _readOnlyTabCollection];
  id v26 = 0;
  unsigned __int8 v12 = [v11 copyTabsDatabase:v10 hidingSensitiveData:1 error:&v26];
  id v13 = v26;

  if (v13 || (v12 & 1) == 0)
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    id v24 = (void *)qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
      sub_100008E24(v24, v13);
    }
    dispatch_time_t v14 = 0;
  }
  else
  {
    dispatch_time_t v14 = +[NSMutableArray array];
    id v15 = +[DEAttachmentItem attachmentWithPathURL:v10];
    [v15 setDeleteOnAttach:];
    [v14 addObject:v15];
    unsigned int v16 = [v10 path];
    unsigned __int8 v17 = [v16 stringByAppendingString:@"-wal"];
    id v18 = +[NSURL fileURLWithPath:v17];
    id v19 = +[DEAttachmentItem attachmentWithPathURL:v18];

    [v19 setDeleteOnAttach:&__kCFBooleanTrue];
    [v14 addObject:v19];
    id v20 = [v10 path];
    id v21 = [v20 stringByAppendingString:@"-shm"];
    unsigned __int8 v22 = +[NSURL fileURLWithPath:v21];
    id v23 = +[DEAttachmentItem attachmentWithPathURL:v22];

    [v23 setDeleteOnAttach:&__kCFBooleanTrue];
    [v14 addObject:v23];
  }

  return v14;
}

- (id)_tabCollectionDataAttachmentItemHidingSensitiveData:(BOOL)a3
{
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v4 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v18 = @"without titles and urls";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to gather tab collection diagnostics %@", buf, 0xCu);
  }
  dispatch_time_t v5 = [(SafariDiagnosticExtension *)self _readOnlyTabCollection];
  v6 = [v5 tabCollectionDataSummaryLogHidingSensitiveData:1];

  id v7 = +[NSDate now];
  uint64_t v8 = [v7 safari_filenameFormattedString];

  id v9 = [(SafariDiagnosticExtension *)self _temporaryDirectory];
  uint64_t v10 = +[NSString stringWithFormat:@"Safari%@ Tabs Database_%@.log", @" Scrubbed", v8];
  id v11 = [v9 stringByAppendingPathComponent:v10];

  id v16 = 0;
  LOBYTE(v10) = [v6 writeToFile:v11 atomically:1 encoding:4 error:&v16];
  id v12 = v16;
  if (v10)
  {
    id v13 = +[DEAttachmentItem attachmentWithPath:v11];
    [v13 setDeleteOnAttach:&__kCFBooleanTrue];
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    dispatch_time_t v14 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finished gathering open tabs", buf, 2u);
    }
  }
  else
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
      sub_100008EBC();
    }
    id v13 = 0;
  }

  return v13;
}

- (id)_cloudKitDataAttachment
{
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v3 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather CloudKit data", buf, 2u);
  }
  id v4 = +[NSDate now];
  dispatch_time_t v5 = [v4 safari_filenameFormattedString];

  v6 = +[NSString stringWithFormat:@"CloudKit_data_%@.plist", v5];
  id v7 = [(SafariDiagnosticExtension *)self _temporaryDirectory];
  uint64_t v8 = [v7 stringByAppendingPathComponent:v6];

  id v9 = +[NSURL fileURLWithPath:v8];
  id v10 = objc_alloc_init((Class)WBSSafariBookmarksSyncAgentProxy);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008288;
  v16[3] = &unk_10000C4A8;
  id v11 = dispatch_semaphore_create(0);
  unsigned __int8 v17 = v11;
  [v10 dumpCloudKitDataPrintByDates:0 liveOnly:0 printTree:0 printPlist:1 writeToFile:1 atFileURL:v9 completionHandler:v16];
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_DEBUG)) {
    sub_100008F88();
  }
  dispatch_time_t v12 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_ERROR)) {
      sub_100008F54();
    }
    id v13 = 0;
  }
  else
  {
    if (qword_100010C48 != -1) {
      dispatch_once(&qword_100010C48, &stru_10000C318);
    }
    dispatch_time_t v14 = qword_100010C40;
    if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finished writing CloudKit data to %{public}@", buf, 0xCu);
    }
    id v13 = +[DEAttachmentItem attachmentWithPathURL:v9];
    [v13 setDeleteOnAttach:&__kCFBooleanTrue];
  }

  return v13;
}

- (id)_getAttachmentsWithDisplayNamePattern:(id)a3
{
  id v3 = a3;
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v4 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to gather crashes with display pattern '%{public}@'", buf, 0xCu);
  }
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = +[NSRegularExpression regularExpressionWithPattern:v3 options:1 error:0];
  id v7 = +[NSRegularExpression regularExpressionWithPattern:@"(LowMemory|ExcResource|Sandbox|stacks|log-aggregated).*" options:1 error:0];
  id v8 = v6;
  id v9 = v7;
  id v10 = v5;
  dispatch_time_t v14 = v10;
  OSAIterateSubmittableLogsWithBlock();
  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C318);
  }
  id v11 = qword_100010C40;
  if (os_log_type_enabled((os_log_t)qword_100010C40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Finished gathering crashes with known display pattern", buf, 2u);
  }
  id v12 = v10;

  return v12;
}

- (id)_temporaryDirectory
{
  if (qword_100010CB8 != -1) {
    dispatch_once(&qword_100010CB8, &stru_10000C4F0);
  }
  id v2 = (void *)qword_100010CB0;

  return v2;
}

- (void)dealloc
{
  id v3 = [(id)objc_opt_class() defaultContentBlockerManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SafariDiagnosticExtension;
  [(SafariDiagnosticExtension *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_semaphoreWaitingForChangeInWebExtensions, 0);

  objc_storeStrong((id *)&self->_semaphoreWaitingForChangeInContentBlockers, 0);
}

@end
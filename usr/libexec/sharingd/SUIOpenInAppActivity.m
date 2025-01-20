@interface SUIOpenInAppActivity
+ (Class)classForOpenByCopyActivity;
+ (Class)classForOpenInPlaceActivity;
+ (Class)classForPreparingExtensionItemData;
+ (id)_activitiesForFileURL:(id)a3 isContentManaged:(BOOL)a4 sourceApplicationAuditTokenData:(id)a5 includeSourceApplicationInResults:(BOOL)a6 supportedTypeIdentifiers:(id)a7;
+ (id)openInActivitiesForItems:(id)a3 isContentManaged:(BOOL)a4 sourceApplicationAuditTokenData:(id)a5 includeSourceApplicationInResults:(BOOL)a6 supportedTypeIdentifiers:(id)a7;
+ (int64_t)activityCategory;
- (BOOL)_appIsDocumentTypeOwner;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isContentManaged;
- (BOOL)openByImportWillHandlePromiseURLs;
- (BOOL)openInPlaceWillHandlePromiseURLs;
- (BOOL)ss_shouldExecuteInShareSheet;
- (LSApplicationProxy)applicationProxy;
- (LSDocumentProxy)documentProxy;
- (NSData)sourceApplicationAuditTokenData;
- (NSDictionary)openURLAnnotationsByURL;
- (NSOrderedSet)supportedTypeIdentifiers;
- (NSString)applicationIdentifier;
- (NSString)description;
- (SUIOpenInAppActivity)initWithApplicationProxy:(id)a3 documentProxy:(id)a4 isContentManaged:(BOOL)a5 sourceApplicationAuditTokenData:(id)a6 appIsDocumentTypeOwner:(BOOL)a7 supportedTypeIdentifiers:(id)a8;
- (UISUISecurityContext)securityContext;
- (id)_activityImage;
- (id)_activitySettingsImage;
- (id)_bookmarkWithSandboxExtensionForExport;
- (id)_firstMatchingDocumentProxyForActivityItems:(id)a3;
- (id)activityTitle;
- (id)activityType;
- (id)ss_activitySpecificExtensionItemDataRequestInfo;
- (id)ss_activityTypeToReportToHost;
- (int64_t)_defaultSortGroup;
- (void)_performLaunchServicesOpenWithDocumentOpenURL:(id)a3 launchServiceOptions:(id)a4 completion:(id)a5;
- (void)_setAppIsDocumentTypeOwner:(BOOL)a3;
- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)performActivity;
- (void)performLaunchServicesImportOpenWithCompletion:(id)a3;
- (void)performLaunchServicesInPlaceOpenWithCompletion:(id)a3;
- (void)prepareWithActivityExtensionItemData:(id)a3;
- (void)prepareWithActivityItemData:(id)a3;
- (void)prepareWithActivityItems:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationProxy:(id)a3;
- (void)setDocumentProxy:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setOpenURLAnnotationsByURL:(id)a3;
- (void)setSecurityContext:(id)a3;
- (void)setSourceApplicationAuditTokenData:(id)a3;
- (void)setSupportedTypeIdentifiers:(id)a3;
@end

@implementation SUIOpenInAppActivity

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 1;
}

- (id)ss_activityTypeToReportToHost
{
  return @"com.apple.UIKit.activity.RemoteOpenInApplication";
}

- (id)ss_activitySpecificExtensionItemDataRequestInfo
{
  v2 = [(SUIOpenInAppActivity *)self applicationIdentifier];
  v3 = _UISUIActivitySpecificMetadataForOpeningDocumentWithApplicationID();

  return v3;
}

+ (Class)classForOpenInPlaceActivity
{
  return (Class)objc_opt_class();
}

+ (Class)classForOpenByCopyActivity
{
  return (Class)objc_opt_class();
}

- (SUIOpenInAppActivity)initWithApplicationProxy:(id)a3 documentProxy:(id)a4 isContentManaged:(BOOL)a5 sourceApplicationAuditTokenData:(id)a6 appIsDocumentTypeOwner:(BOOL)a7 supportedTypeIdentifiers:(id)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = objc_opt_class();
  if (v19 == objc_opt_class())
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SUIOpenInAppActivity.m", 89, @"%@ is an abstract class, use one of the concrete implementation classes instead", objc_opt_class() object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)SUIOpenInAppActivity;
  v20 = [(SUIOpenInAppActivity *)&v25 init];
  v21 = v20;
  if (v20)
  {
    [(SUIOpenInAppActivity *)v20 setApplicationProxy:v15];
    [(SUIOpenInAppActivity *)v21 setDocumentProxy:v16];
    [(SUIOpenInAppActivity *)v21 setIsContentManaged:v11];
    [(SUIOpenInAppActivity *)v21 setSourceApplicationAuditTokenData:v17];
    [(SUIOpenInAppActivity *)v21 _setAppIsDocumentTypeOwner:v9];
    id v22 = [v18 copy];
    [(SUIOpenInAppActivity *)v21 setSupportedTypeIdentifiers:v22];
  }
  return v21;
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (NSString)applicationIdentifier
{
  v2 = [(SUIOpenInAppActivity *)self applicationProxy];
  v3 = [v2 applicationIdentifier];

  return (NSString *)v3;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)SUIOpenInAppActivity;
  v3 = [(SUIOpenInAppActivity *)&v7 description];
  v4 = [(SUIOpenInAppActivity *)self activityTitle];
  v5 = +[NSString stringWithFormat:@"%@ '%@'", v3, v4];

  return (NSString *)v5;
}

+ (id)openInActivitiesForItems:(id)a3 isContentManaged:(BOOL)a4 sourceApplicationAuditTokenData:(id)a5 includeSourceApplicationInResults:(BOOL)a6 supportedTypeIdentifiers:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a3;
  id v15 = +[NSPredicate predicateWithBlock:&stru_1008CFC40];
  id v16 = [v14 filteredArrayUsingPredicate:v15];

  if ([v16 count])
  {

    id v13 = 0;
  }
  else
  {
    memset(v26, 0, sizeof(v26));
    if ([v13 countByEnumeratingWithState:v26 objects:v30 count:16])
    {
      id v17 = +[UTType typeWithIdentifier:**((void **)&v26[0] + 1)];
      id v18 = [v17 preferredFilenameExtension];
      uint64_t v19 = +[NSString stringWithFormat:@"fake.%@", v18];
      v20 = +[NSURL fileURLWithPath:v19 isDirectory:0];

      v21 = share_sheet_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SUIOpenInAppActivity: using fake fileURL:%@", buf, 0xCu);
      }

      v27 = v20;
      uint64_t v22 = +[NSArray arrayWithObjects:&v27 count:1];

      id v16 = (void *)v22;
    }
  }
  if ([v16 count])
  {
    v23 = [v16 firstObject];
    v24 = [a1 _activitiesForFileURL:v23 isContentManaged:v9 sourceApplicationAuditTokenData:v12 includeSourceApplicationInResults:v8 supportedTypeIdentifiers:v13];
  }
  else
  {
    v24 = &__NSArray0__struct;
  }

  return v24;
}

- (void)_performLaunchServicesOpenWithDocumentOpenURL:(id)a3 launchServiceOptions:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = _UIActivityDefaultOpenApplicationLaunchServiceOptions();
  id v10 = [v9 mutableCopy];

  [v10 addEntriesFromDictionary:v7];
  BOOL v11 = [(SUIOpenInAppActivity *)self sourceApplicationAuditTokenData];

  if (v11)
  {
    id v12 = [(SUIOpenInAppActivity *)self sourceApplicationAuditTokenData];
    id v13 = sub_1001BB7CC(v12);

    if (v13)
    {
      id v14 = v10;
      id v15 = UIApplicationLaunchOptionsSourceApplicationKey;
      id v16 = v13;
      if (v15)
      {
        uint64_t v17 = LSOpenApplicationPayloadOptionsKey;
        id v18 = [v14 objectForKeyedSubscript:LSOpenApplicationPayloadOptionsKey];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v18)
          {
            id v19 = [v18 mutableCopy];

            id v18 = v19;
          }
          else
          {
            id v18 = +[NSMutableDictionary dictionary];
          }
          [v14 setObject:v18 forKeyedSubscript:v17];
        }
        [v18 setObject:v16 forKeyedSubscript:v15];
      }
    }
  }
  v20 = [(SUIOpenInAppActivity *)self openURLAnnotationsByURL];
  v21 = [v20 objectForKeyedSubscript:v8];

  uint64_t v22 = [v10 objectForKeyedSubscript:LSFileProviderStringKey];
  v23 = +[LSApplicationWorkspace defaultWorkspace];
  v24 = [(LSApplicationProxy *)self->_applicationProxy applicationIdentifier];
  BOOL v25 = [(SUIOpenInAppActivity *)self isContentManaged];
  id v26 = [(SUIOpenInAppActivity *)self sourceApplicationAuditTokenData];
  v27 = [v23 operationToOpenResource:v8 usingApplication:v24 uniqueDocumentIdentifier:v22 isContentManaged:v25 sourceAuditToken:[v26 bytes] userInfo:v21 options:v10 delegate:self];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001BB804;
  v30[3] = &unk_1008CA4B8;
  v30[4] = self;
  [v27 setCompletionBlock:v30];
  v28 = share_sheet_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [(LSApplicationProxy *)self->_applicationProxy applicationIdentifier];
    *(_DWORD *)buf = 138412546;
    v32 = v29;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SUIOpenInAppActivity: Performing open using application %@ with options %@", buf, 0x16u);
  }
  [v27 start];
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SUIOpenInAppActivity openResourceOperation:didFailWithError:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)openInPlaceWillHandlePromiseURLs
{
  return 1;
}

- (void)performLaunchServicesInPlaceOpenWithCompletion:(id)a3
{
  id v5 = a3;
  int v6 = [(SUIOpenInAppActivity *)self applicationProxy];
  id v7 = [(SUIOpenInAppActivity *)self documentProxy];
  __int16 v8 = [v7 URL];
  char CanOpenInPlaceByReferenceOriginalFile = _UIApplicationCanOpenInPlaceByReferenceOriginalFile();

  if ((CanOpenInPlaceByReferenceOriginalFile & 1) == 0)
  {
    uint64_t v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SUIOpenInAppActivity.m" lineNumber:256 description:@"unexpected state for open using _FPExtendBookmarkForDocumentURL"];
  }
  id v10 = [(SUIOpenInAppActivity *)self documentProxy];
  BOOL v11 = [v10 URL];

  id v12 = [(SUIOpenInAppActivity *)self applicationProxy];
  id v13 = [v12 bundleIdentifier];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001BBAF4;
  v18[3] = &unk_1008CFC90;
  id v19 = v11;
  id v20 = v5;
  v18[4] = self;
  id v14 = (void (*)(uint64_t, uint64_t, void *))off_100969118;
  id v15 = v11;
  id v16 = v5;
  v14((uint64_t)v15, (uint64_t)v13, v18);
}

- (BOOL)openByImportWillHandlePromiseURLs
{
  v3 = [(SUIOpenInAppActivity *)self documentProxy];
  id v4 = [v3 URL];

  id v5 = [(SUIOpenInAppActivity *)self applicationProxy];
  LOBYTE(v3) = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile();

  return (char)v3;
}

- (void)performLaunchServicesImportOpenWithCompletion:(id)a3
{
  id v5 = a3;
  int v6 = [(SUIOpenInAppActivity *)self documentProxy];
  id v7 = [v6 URL];

  __int16 v8 = [(SUIOpenInAppActivity *)self applicationProxy];
  int CanOpenInPlaceByCopyingFromOriginalFile = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile();

  if (CanOpenInPlaceByCopyingFromOriginalFile)
  {
    id v10 = [(SUIOpenInAppActivity *)self applicationProxy];
    unsigned int v11 = [v10 supportsOpenInPlace];

    if (v11)
    {
      id v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SUIOpenInAppActivity.m", 285, @"When a URL and app both support open-in-place, performLaunchServicesInPlaceOpenWithCompletion: should be used" object file lineNumber description];
    }
    id v12 = [(SUIOpenInAppActivity *)self _bookmarkWithSandboxExtensionForExport];
    v15[0] = LSFileProviderStringKey;
    v15[1] = LSRequireOpenInPlaceKey;
    v16[0] = v12;
    v16[1] = &__kCFBooleanFalse;
    id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    id v13 = 0;
  }
  [(SUIOpenInAppActivity *)self _performLaunchServicesOpenWithDocumentOpenURL:v7 launchServiceOptions:v13 completion:v5];
}

- (id)_bookmarkWithSandboxExtensionForExport
{
  v3 = [(SUIOpenInAppActivity *)self documentProxy];
  id v4 = [v3 URL];

  id v5 = [(SUIOpenInAppActivity *)self securityContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001BC010;
  v11[3] = &unk_1008CFCB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 securityScopedResourcesMatchingPredicate:v11];
  __int16 v8 = [v7 firstObject];

  id v9 = [v8 bookmarkExportDataEncodedAsString];
  if (!v9)
  {
    id v9 = [v6 ui_bookmarkForExportWithError:0];
  }

  return v9;
}

+ (Class)classForPreparingExtensionItemData
{
  return (Class)objc_opt_class();
}

- (void)prepareWithActivityItemData:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [v4 securityContexts];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) securityScopedResources];
        [v5 addObjectsFromArray:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v12 = [objc_alloc((Class)UISUISecurityContext) initWithSecurityScopedResources:v5];
  id v13 = [v4 openURLAnnotationsByURL];
  [(SUIOpenInAppActivity *)self setOpenURLAnnotationsByURL:v13];

  [(SUIOpenInAppActivity *)self setSecurityContext:v12];
  id v14 = [(SUIOpenInAppActivity *)self securityContext];
  [v14 activate];

  id v15 = sub_1001BC280(v12);
  [(SUIOpenInAppActivity *)self prepareWithActivityItems:v15];
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v20 = self;
  id v21 = a3;
  id v3 = [v21 extensionItems];
  id v4 = dispatch_group_create();
  uint64_t v39 = NSItemProviderOptionsDispatchModeKey;
  uint64_t v40 = NSItemProviderOptionsDispatchModeAsynchronous;
  id v5 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  id v6 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  id v24 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        id v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v9 = [v8 attachments:v20];
        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if ([v14 hasItemConformingToTypeIdentifier:@"com.apple.ShareUI.openURL.supplementalSecurityContext"])
              {
                dispatch_group_enter(v4);
                v26[0] = _NSConcreteStackBlock;
                v26[1] = 3221225472;
                v26[2] = sub_1001BD664;
                v26[3] = &unk_1008CFD28;
                id v27 = v6;
                v28 = v4;
                [v14 loadItemForTypeIdentifier:@"com.apple.ShareUI.openURL.supplementalSecurityContext" options:v5 completionHandler:v26];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v24);
  }

  dispatch_time_t v15 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v4, v15);

  id v16 = [objc_alloc((Class)UISUISecurityContext) initWithSecurityScopedResources:v6];
  long long v17 = [v21 openURLAnnotationsByURL];
  [(SUIOpenInAppActivity *)v20 setOpenURLAnnotationsByURL:v17];

  [(SUIOpenInAppActivity *)v20 setSecurityContext:v16];
  long long v18 = [(SUIOpenInAppActivity *)v20 securityContext];
  [v18 activate];

  long long v19 = sub_1001BC280(v16);
  [(SUIOpenInAppActivity *)v20 prepareWithActivityItems:v19];
}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SUIOpenInAppActivity;
  [(SUIOpenInAppActivity *)&v7 activityDidFinish:a3 items:a4 error:a5];
  id v6 = [(SUIOpenInAppActivity *)self securityContext];
  [v6 deactivate];
}

+ (int64_t)activityCategory
{
  return 1;
}

- (int64_t)_defaultSortGroup
{
  return 5;
}

- (id)_activityImage
{
  return +[UIImage _iconForResourceProxy:self->_applicationProxy format:10];
}

- (id)_activitySettingsImage
{
  return +[UIImage _iconForResourceProxy:self->_applicationProxy format:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  id v5 = [(SUIOpenInAppActivity *)self supportedTypeIdentifiers];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_super v7 = [(SUIOpenInAppActivity *)self _firstMatchingDocumentProxyForActivityItems:v4];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = [(SUIOpenInAppActivity *)self _firstMatchingDocumentProxyForActivityItems:a3];
  documentProxy = self->_documentProxy;
  self->_documentProxy = v4;
}

- (id)activityType
{
  v2 = [(SUIOpenInAppActivity *)self applicationIdentifier];
  id v3 = _UISUIActivityRealActivityTypeForOpeningDocumentWithApplicationID();

  return v3;
}

+ (id)_activitiesForFileURL:(id)a3 isContentManaged:(BOOL)a4 sourceApplicationAuditTokenData:(id)a5 includeSourceApplicationInResults:(BOOL)a6 supportedTypeIdentifiers:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = objc_opt_new();
  id v15 = v11;
  unsigned int v16 = [v15 isFileURL];
  id v17 = v15;
  id v18 = v17;
  if (v16)
  {
    if (_UIIsIWorkArchiveURL())
    {
      long long v19 = [v17 lastPathComponent];
      id v20 = _UIStringByDeletingArchiveExtensions();

      id v21 = [v17 URLByDeletingLastPathComponent];
      id v18 = [v21 URLByAppendingPathComponent:v20];
    }
    else
    {
      id v18 = v17;
    }
  }
  uint64_t v22 = sub_1001BCB8C(v18, v10, v12);
  if (a6)
  {
    uint64_t v23 = 0;
LABEL_10:
    uint64_t v25 = &__NSArray0__struct;
    goto LABEL_11;
  }
  uint64_t v24 = sub_1001BB7CC(v12);
  uint64_t v23 = (void *)v24;
  if (!v24) {
    goto LABEL_10;
  }
  uint64_t v37 = v24;
  uint64_t v25 = +[NSArray arrayWithObjects:&v37 count:1];
LABEL_11:
  id v26 = sub_1001BCB8C(v17, v10, v12);
  long long v36 = v13;
  id v33 = v14;
  long long v34 = v26;
  long long v35 = v12;
  id v27 = v13;
  id v28 = v12;
  id v29 = v26;
  id v30 = v17;
  _UIEnumerateApplicationsInPreferredOrderForOpeningDocument();
  id v31 = v33;

  return v31;
}

- (id)_firstMatchingDocumentProxyForActivityItems:(id)a3
{
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v45;
    uint64_t v9 = &OBJC_IVAR___SDSubCredentialAgent__statusMonitor;
    *(void *)&long long v6 = 138412802;
    long long v33 = v6;
    id v37 = v4;
    v38 = self;
    uint64_t v34 = *(void *)v45;
    while (2)
    {
      BOOL v10 = 0;
      id v35 = v7;
      do
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          if ([v12 isFileURL])
          {
            id v13 = [v12 pathExtension];
            uint64_t v14 = v9[3];
            id v15 = [*(id *)((char *)&self->super.super.isa + v14) URL];
            unsigned int v16 = [v15 pathExtension];
            id v17 = [v13 caseInsensitiveCompare:v16];

            if (!v17)
            {
              id v31 = sub_1001BCB8C(v12, self->_isContentManaged, self->_sourceApplicationAuditTokenData);
LABEL_25:

              goto LABEL_27;
            }
            uint64_t v36 = v14;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id obj = [(SUIOpenInAppActivity *)self supportedTypeIdentifiers];
            id v18 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v41;
              while (2)
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(void *)v41 != v20) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v22 = +[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", *(void *)(*((void *)&v40 + 1) + 8 * i), v33);
                  uint64_t v23 = [v12 pathExtension];
                  uint64_t v24 = +[UTType typeWithFilenameExtension:v23];

                  uint64_t v25 = [v22 preferredFilenameExtension];
                  id v26 = [v24 preferredFilenameExtension];
                  unsigned __int8 v27 = [v25 isEqual:v26];

                  if (v27)
                  {
                    id v31 = sub_1001BCB8C(v12, v38->_isContentManaged, v38->_sourceApplicationAuditTokenData);

                    id v4 = v37;
                    goto LABEL_25;
                  }
                }
                id v19 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            id v28 = share_sheet_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = [*(id *)((char *)&v38->super.super.isa + v36) URL];
              id v30 = [(SUIOpenInAppActivity *)v38 supportedTypeIdentifiers];
              *(_DWORD *)buf = v33;
              id v49 = v12;
              __int16 v50 = 2112;
              v51 = v29;
              __int16 v52 = 2112;
              v53 = v30;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SUIOpenInAppActivity: didn't find a matching document proxy for url:%@ documentProxy.URL:%@ supportedTypeIdentifiers:%@", buf, 0x20u);
            }
            id v4 = v37;
            self = v38;
            uint64_t v8 = v34;
            id v7 = v35;
            uint64_t v9 = &OBJC_IVAR___SDSubCredentialAgent__statusMonitor;
          }
        }
        BOOL v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v7 = [v4 countByEnumeratingWithState:&v44 objects:v55 count:16];
      id v31 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v31 = 0;
  }
LABEL_27:

  return v31;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (LSDocumentProxy)documentProxy
{
  return self->_documentProxy;
}

- (void)setDocumentProxy:(id)a3
{
}

- (UISUISecurityContext)securityContext
{
  return self->_securityContext;
}

- (void)setSecurityContext:(id)a3
{
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSData)sourceApplicationAuditTokenData
{
  return self->_sourceApplicationAuditTokenData;
}

- (void)setSourceApplicationAuditTokenData:(id)a3
{
}

- (NSDictionary)openURLAnnotationsByURL
{
  return self->_openURLAnnotationsByURL;
}

- (void)setOpenURLAnnotationsByURL:(id)a3
{
}

- (BOOL)_appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (void)_setAppIsDocumentTypeOwner:(BOOL)a3
{
  self->_appIsDocumentTypeOwner = a3;
}

- (void)setApplicationProxy:(id)a3
{
}

- (NSOrderedSet)supportedTypeIdentifiers
{
  return self->_supportedTypeIdentifiers;
}

- (void)setSupportedTypeIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, 0);
  objc_storeStrong((id *)&self->_sourceApplicationAuditTokenData, 0);
  objc_storeStrong((id *)&self->_securityContext, 0);
  objc_storeStrong((id *)&self->_documentProxy, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (id)activityTitle
{
  return &stru_1008E7020;
}

- (void)performActivity
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end
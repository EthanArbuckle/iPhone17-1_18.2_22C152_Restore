@interface AirDropExtensionActivity
+ (Class)classForPreparingExtensionItemData;
+ (int64_t)activityCategory;
- (AirDropBrowserViewController)airDropViewController;
- (AirDropExtensionActivity)init;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming;
- (BOOL)ss_shouldExecuteInShareSheet;
- (CGSize)_thumbnailSize;
- (NSMutableArray)activeSecurityContexts;
- (id)activityType;
- (id)airdropCompletion;
- (id)itemDataRequest;
- (void)_activateSecurityScopedResourcesForExtensionItems:(id)a3;
- (void)dealloc;
- (void)performActivity;
- (void)prepareWithActivityExtensionItemData:(id)a3;
- (void)setActiveSecurityContexts:(id)a3;
- (void)setAirDropViewController:(id)a3;
- (void)setAirdropCompletion:(id)a3;
- (void)startAccessingSecurityScopedResourcesInContext:(id)a3;
- (void)stopAccessingSecurityScopedResources;
@end

@implementation AirDropExtensionActivity

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 1;
}

- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming
{
  return 0;
}

- (AirDropExtensionActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)AirDropExtensionActivity;
  v2 = [(AirDropExtensionActivity *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    activeSecurityContexts = v2->_activeSecurityContexts;
    v2->_activeSecurityContexts = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)activityType
{
  return UIActivityTypeAirDrop;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (void)dealloc
{
  [(AirDropExtensionActivity *)self stopAccessingSecurityScopedResources];
  v3.receiver = self;
  v3.super_class = (Class)AirDropExtensionActivity;
  [(AirDropExtensionActivity *)&v3 dealloc];
}

- (void)startAccessingSecurityScopedResourcesInContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    [v4 activate];
    v5 = self->_activeSecurityContexts;
    objc_sync_enter(v5);
    [(NSMutableArray *)self->_activeSecurityContexts addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)stopAccessingSecurityScopedResources
{
  objc_super v3 = self->_activeSecurityContexts;
  objc_sync_enter(v3);
  id v4 = [(NSMutableArray *)self->_activeSecurityContexts copy];
  [(NSMutableArray *)self->_activeSecurityContexts removeAllObjects];
  objc_sync_exit(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "deactivate", (void)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)itemDataRequest
{
  objc_super v3 = [(AirDropExtensionActivity *)self ss_activityTypeToReportToHost];
  id v4 = [(AirDropExtensionActivity *)self ss_activitySpecificExtensionItemDataRequestInfo];
  id v5 = +[UISUIActivityExtensionItemDataRequest requestForActivity:self activityType:v3 activitySpecificMetadata:v4];

  return v5;
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v4 = a3;
  id v5 = [(AirDropExtensionActivity *)self airDropViewController];
  id v6 = [v4 extensionItems];
  [(AirDropExtensionActivity *)self _activateSecurityScopedResourcesForExtensionItems:v6];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F718;
  v9[3] = &unk_100031328;
  id v7 = v4;
  id v10 = v7;
  long long v11 = self;
  v13 = v14;
  id v8 = v5;
  id v12 = v8;
  sub_10000F578(v6, v9);

  _Block_object_dispose(v14, 8);
}

- (void)_activateSecurityScopedResourcesForExtensionItems:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v13 = NSItemProviderOptionsDispatchModeKey;
  uint64_t v14 = NSItemProviderOptionsDispatchModeAsynchronous;
  id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FA04;
  v8[3] = &unk_100031378;
  id v6 = dispatch_group_create();
  long long v9 = v6;
  id v7 = v5;
  id v10 = v7;
  objc_copyWeak(&v11, &location);
  sub_10000F578(v4, v8);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)performActivity
{
  objc_super v3 = [(AirDropExtensionActivity *)self airdropCompletion];

  if (v3)
  {
    id v4 = [(AirDropExtensionActivity *)self airdropCompletion];
    v4[2]();

    [(AirDropExtensionActivity *)self setAirdropCompletion:0];
  }
}

- (CGSize)_thumbnailSize
{
  +[UIAirDropActivity _thumbnailSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

+ (Class)classForPreparingExtensionItemData
{
  return (Class)objc_opt_class();
}

- (AirDropBrowserViewController)airDropViewController
{
  return self->_airDropViewController;
}

- (void)setAirDropViewController:(id)a3
{
}

- (id)airdropCompletion
{
  return self->_airdropCompletion;
}

- (void)setAirdropCompletion:(id)a3
{
}

- (NSMutableArray)activeSecurityContexts
{
  return self->_activeSecurityContexts;
}

- (void)setActiveSecurityContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSecurityContexts, 0);
  objc_storeStrong(&self->_airdropCompletion, 0);

  objc_storeStrong((id *)&self->_airDropViewController, 0);
}

@end
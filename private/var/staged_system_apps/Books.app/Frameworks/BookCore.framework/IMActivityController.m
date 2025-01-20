@interface IMActivityController
- (AEAssetActivityPropertyProvider)propertyProvider;
- (BCActivityViewController)activityVC;
- (BOOL)isManagedBook;
- (IMActivityController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shareType:(int64_t)a5 propertySource:(id)a6 sharingStyle:(int64_t)a7 customActivityTypeOrder:(id)a8 customShareActivityTitle:(id)a9 tracker:(id)a10;
- (IMActivityController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shareType:(int64_t)a5 propertySource:(id)a6 tracker:(id)a7;
- (NSArray)activityItems;
- (NSArray)applicationActivities;
- (NSArray)customActivityTypeOrder;
- (NSArray)excludedActivityTypes;
- (NSArray)expandedActivityItems;
- (NSString)customShareActivityTitle;
- (_TtC13BookAnalytics9BATracker)tracker;
- (id)completionHandler;
- (id)expandedActivityItemsFromActivityItems:(id)a3 conformingToProtocol:(id)a4;
- (id)includedActivityTypes;
- (id)viewController;
- (int64_t)shareType;
- (int64_t)sharingStyle;
- (void)dealloc;
- (void)setActivityItems:(id)a3;
- (void)setActivityVC:(id)a3;
- (void)setApplicationActivities:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCustomActivityTypeOrder:(id)a3;
- (void)setCustomShareActivityTitle:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setExpandedActivityItems:(id)a3;
- (void)setManagedBook:(BOOL)a3;
- (void)setPropertyProvider:(id)a3;
- (void)setShareType:(int64_t)a3;
- (void)setSharingStyle:(int64_t)a3;
- (void)setTracker:(id)a3;
@end

@implementation IMActivityController

- (IMActivityController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shareType:(int64_t)a5 propertySource:(id)a6 tracker:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v17 = [(IMActivityController *)self init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_activityItems, a3);
    objc_storeStrong((id *)&v18->_applicationActivities, a4);
    v18->_shareType = a5;
    v19 = [[AEAssetActivityPropertyProvider alloc] initWithPropertySource:v15];
    propertyProvider = v18->_propertyProvider;
    v18->_propertyProvider = v19;

    objc_storeStrong((id *)&v18->_tracker, a7);
  }

  return v18;
}

- (IMActivityController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shareType:(int64_t)a5 propertySource:(id)a6 sharingStyle:(int64_t)a7 customActivityTypeOrder:(id)a8 customShareActivityTitle:(id)a9 tracker:(id)a10
{
  id v17 = a8;
  id v18 = a9;
  v19 = [(IMActivityController *)self initWithActivityItems:a3 applicationActivities:a4 shareType:a5 propertySource:a6 tracker:a10];
  v20 = v19;
  if (v19)
  {
    v19->_sharingStyle = a7;
    objc_storeStrong((id *)&v19->_customActivityTypeOrder, a8);
    v21 = (NSString *)[v18 copy];
    customShareActivityTitle = v20->_customShareActivityTitle;
    v20->_customShareActivityTitle = v21;
  }
  return v20;
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  _objc_release_x1(v4, completionHandler);
}

- (id)viewController
{
  v3 = [(IMActivityController *)self activityVC];

  if (!v3)
  {
    id v4 = [BCActivityViewController alloc];
    v5 = [(IMActivityController *)self activityItems];
    v6 = [(IMActivityController *)self expandedActivityItems];
    v7 = [(IMActivityController *)self applicationActivities];
    int64_t v8 = [(IMActivityController *)self sharingStyle];
    v9 = [(IMActivityController *)self customActivityTypeOrder];
    v10 = [(IMActivityController *)self customShareActivityTitle];
    v11 = [(IMActivityController *)self propertyProvider];
    v12 = [(IMActivityController *)self tracker];
    id v13 = [(BCActivityViewController *)v4 initWithRootActivityItems:v5 expandedActivityItems:v6 applicationActivities:v7 sharingStyle:v8 customActivityTypeOrder:v9 customShareActivityTitle:v10 appAnalyticsProvider:v11 tracker:v12];

    if ((char *)[(IMActivityController *)self shareType] != (char *)&def_7D91C + 2)
    {
      id v14 = [(IMActivityController *)self includedActivityTypes];
      [(BCActivityViewController *)v13 setIncludedActivityTypes:v14];
    }
    id v15 = [(IMActivityController *)self excludedActivityTypes];
    [(BCActivityViewController *)v13 setExcludedActivityTypes:v15];

    [(BCActivityViewController *)v13 setManagedBook:self->_managedBook];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_166A98;
    v18[3] = &unk_2CA858;
    v18[4] = self;
    [(BCActivityViewController *)v13 setCompletionWithItemsHandler:v18];
    [(IMActivityController *)self setActivityVC:v13];
  }
  id v16 = [(IMActivityController *)self activityVC];

  return v16;
}

- (void)dealloc
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  activityVC = self->_activityVC;
  self->_activityVC = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMActivityController;
  [(IMActivityController *)&v5 dealloc];
}

- (NSArray)excludedActivityTypes
{
  if ((char *)[(IMActivityController *)self shareType] == (char *)&def_7D91C + 2)
  {
    v16[0] = UIActivityTypeCloudSharing;
    v16[1] = UIActivityTypeMarkupAsPDF;
    v16[2] = UIActivityTypeAddToReadingList;
    id v3 = +[NSArray arrayWithObjects:v16 count:3];
    id v4 = [(IMActivityController *)self propertyProvider];
    objc_super v5 = (char *)[v4 assetType];

    v6 = [(IMActivityController *)self propertyProvider];
    unsigned __int8 v7 = [v6 isStoreAsset];

    if (v5 == (unsigned char *)&def_7D91C + 3) {
      char v8 = 1;
    }
    else {
      char v8 = v7;
    }
    if (self->_managedBook || (v8 & 1) == 0)
    {
      uint64_t v9 = [v3 arrayByAddingObject:UIActivityTypeAirDrop];

      id v3 = (id)v9;
    }
    if (v5 != (unsigned char *)&def_7D91C + 3)
    {
      uint64_t v10 = [v3 arrayByAddingObject:UIActivityTypeSaveToFiles];

      id v3 = (id)v10;
    }
    if ((v7 & 1) == 0)
    {
      uint64_t v11 = [v3 arrayByAddingObject:UIActivityTypePostToFacebook];

      id v3 = (id)v11;
    }
  }
  else
  {
    v12 = +[IMActivity activityTypes];
    id v13 = +[NSMutableArray arrayWithArray:v12];

    id v14 = [(IMActivityController *)self includedActivityTypes];
    [v13 removeObjectsInArray:v14];

    id v3 = [v13 copy];
  }

  return (NSArray *)v3;
}

- (id)includedActivityTypes
{
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(IMActivityController *)self expandedActivityItems];
  objc_super v5 = (char *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = BUProtocolCast();
        uint64_t v10 = v9;
        if (v9)
        {
          uint64_t v11 = [v9 supportedActivityTypes];
          [v3 addObjectsFromArray:v11];
        }
        else
        {
          objc_opt_class();
          v12 = BUDynamicCast();

          if (v12)
          {
            [v3 addObject:@"com.apple.schoolwork.ClassKitApp.SaveToClassKitApp"];
            [v3 addObject:@"com.apple.schoolwork.ClassKitApp.ShareWithClassKitApp"];
          }
        }
      }
      v6 = (char *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)expandedActivityItems
{
  expandedActivityItems = self->_expandedActivityItems;
  if (!expandedActivityItems)
  {
    id v4 = [(IMActivityController *)self activityItems];
    objc_super v5 = [(IMActivityController *)self expandedActivityItemsFromActivityItems:v4 conformingToProtocol:&OBJC_PROTOCOL___UIActivityItemSource];
    v6 = self->_expandedActivityItems;
    self->_expandedActivityItems = v5;

    expandedActivityItems = self->_expandedActivityItems;
  }

  return expandedActivityItems;
}

- (id)expandedActivityItemsFromActivityItems:(id)a3 conformingToProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    char v8 = +[NSMutableArray array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v6;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v14 conformsToProtocol:v7]) {
            [v8 addObject:v14];
          }
          if ([v14 conformsToProtocol:&OBJC_PROTOCOL___IMActivityItemSourceExpanding])
          {
            long long v15 = [v14 expandedItemProviders];
            long long v16 = [(IMActivityController *)self expandedActivityItemsFromActivityItems:v15 conformingToProtocol:v7];

            if (v16) {
              [v8 addObjectsFromArray:v16];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v6 = v18;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
}

- (void)setExpandedActivityItems:(id)a3
{
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (BOOL)isManagedBook
{
  return self->_managedBook;
}

- (void)setManagedBook:(BOOL)a3
{
  self->_managedBook = a3;
}

- (BCActivityViewController)activityVC
{
  return self->_activityVC;
}

- (void)setActivityVC:(id)a3
{
}

- (int64_t)shareType
{
  return self->_shareType;
}

- (void)setShareType:(int64_t)a3
{
  self->_shareType = a3;
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void)setPropertyProvider:(id)a3
{
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (NSArray)customActivityTypeOrder
{
  return self->_customActivityTypeOrder;
}

- (void)setCustomActivityTypeOrder:(id)a3
{
}

- (NSString)customShareActivityTitle
{
  return self->_customShareActivityTitle;
}

- (void)setCustomShareActivityTitle:(id)a3
{
}

- (_TtC13BookAnalytics9BATracker)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_customShareActivityTitle, 0);
  objc_storeStrong((id *)&self->_customActivityTypeOrder, 0);
  objc_storeStrong((id *)&self->_propertyProvider, 0);
  objc_storeStrong((id *)&self->_activityVC, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_expandedActivityItems, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end
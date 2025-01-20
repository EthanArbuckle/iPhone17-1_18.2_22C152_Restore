@interface AEAssetNotesActivityItemProvider
- (AEAssetNotesActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4;
- (BOOL)supportsActivityType:(id)a3;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)item;
- (id)placeholderItem;
@end

@implementation AEAssetNotesActivityItemProvider

- (AEAssetNotesActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v12.receiver = self;
  v12.super_class = (Class)AEAssetNotesActivityItemProvider;
  v10 = [(AEAssetBaseActivityItemProvider *)&v12 initWithDelegate:v7 placeholderItem:v9 propertySource:v6];

  return v10;
}

- (BOOL)supportsActivityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:UIActivityTypeSaveToNotes]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.Notes.SharingExtension"];
  }

  return v4;
}

- (id)placeholderItem
{
  return &stru_2CE418;
}

- (id)item
{
  id v3 = [(AEAssetNotesActivityItemProvider *)self activityType];
  unsigned int v4 = [(AEAssetBaseActivityItemProvider *)self shouldShareActivityType:v3];

  if (v4)
  {
    v5 = [(AEAssetNotesActivityItemProvider *)self activityType];
    id v6 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    [v6 setActivityType:v5];

    id v7 = +[NSMutableDictionary dictionary];
    v8 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    v9 = [v8 title];

    if ([v9 length])
    {
      id v10 = [v9 copy];
      [v7 setObject:v10 forKeyedSubscript:@"title"];
    }
    v11 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    objc_super v12 = [v11 author];

    if ([v12 length])
    {
      id v13 = [v12 copy];
      [v7 setObject:v13 forKeyedSubscript:@"author"];
    }
    v14 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    v15 = [v14 genre];

    if ([v15 length])
    {
      id v16 = [v15 copy];
      [v7 setObject:v16 forKeyedSubscript:@"genre"];
    }
    v17 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    v18 = [v17 publisherYear];

    if ([v18 length])
    {
      id v19 = [v18 copy];
      [v7 setObject:v19 forKeyedSubscript:@"publishing_date"];
    }
    v20 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    v21 = [v20 assetTypeString];

    if ([v21 length])
    {
      id v22 = [v21 copy];
      [v7 setObject:v22 forKeyedSubscript:@"media_type"];
    }
    v23 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    v24 = [v23 bookDescription];

    if ([v24 length])
    {
      id v25 = [v24 copy];
      [v7 setObject:v25 forKeyedSubscript:@"description"];
    }
    v26 = v9;
    v27 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    v28 = [v27 seriesTitle];

    if ([v28 length])
    {
      id v29 = [v28 copy];
      [v7 setObject:v29 forKeyedSubscript:@"series"];
    }
    v30 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    unsigned int v31 = [v30 isStoreAsset];

    if (v31)
    {
      v32 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
      v33 = [v32 storeURL];

      if (v33)
      {
        v34 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
        v35 = [v34 storeURL];
        [v7 setObject:v35 forKeyedSubscript:@"url"];
      }
    }
    id v40 = 0;
    v36 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v40];
    id v37 = v40;
    if (!v36 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1EB634();
    }
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v4 = a4;
  if (([v4 isEqualToString:UIActivityTypeSaveToNotes] & 1) != 0
    || [v4 isEqualToString:@"com.apple.Notes.SharingExtension"])
  {
    v5 = @"com.apple.notes.share-metadata";
  }
  else
  {
    v5 = &stru_2CE418;
  }

  return v5;
}

@end
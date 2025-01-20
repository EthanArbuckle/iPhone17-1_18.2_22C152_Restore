@interface AEAssetBaseActivityItemProvider
- (AEAssetActivityItemProviderSourceDelegate)delegate;
- (AEAssetActivityPropertyProvider)propertyProvider;
- (AEAssetBaseActivityItemProvider)initWithDelegate:(id)a3 placeholderItem:(id)a4 propertySource:(id)a5;
- (BOOL)shouldShareActivityType:(id)a3;
- (BOOL)supportsActivityType:(id)a3;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPropertyProvider:(id)a3;
@end

@implementation AEAssetBaseActivityItemProvider

- (AEAssetBaseActivityItemProvider)initWithDelegate:(id)a3 placeholderItem:(id)a4 propertySource:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AEAssetBaseActivityItemProvider;
  v10 = [(AEAssetBaseActivityItemProvider *)&v15 initWithPlaceholderItem:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v12 = [[AEAssetActivityPropertyProvider alloc] initWithPropertySource:v9];
    propertyProvider = v11->_propertyProvider;
    v11->_propertyProvider = v12;
  }
  return v11;
}

- (BOOL)supportsActivityType:(id)a3
{
  return 0;
}

- (BOOL)shouldShareActivityType:(id)a3
{
  id v4 = a3;
  if ([(AEAssetBaseActivityItemProvider *)self supportsActivityType:v4])
  {
    v5 = [(AEAssetBaseActivityItemProvider *)self delegate];
    unsigned __int8 v6 = [v5 itemProviderSource:self shouldShareActivityType:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v5 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
  unsigned __int8 v6 = [v5 title];

  v7 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
  id v8 = [v7 author];

  if ([v6 length])
  {
    id v9 = [v8 length];
    v10 = IMCommonCoreBundle();
    v11 = v10;
    if (v9) {
      CFStringRef v12 = @"\\U201C%@\\U201D by %@";
    }
    else {
      CFStringRef v12 = @"\\U201C%@\\U201D";
    }
    v13 = [v10 localizedStringForKey:v12 value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v6, v8);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_2CE418;
  }

  return v14;
}

- (AEAssetActivityItemProviderSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AEAssetActivityItemProviderSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void)setPropertyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
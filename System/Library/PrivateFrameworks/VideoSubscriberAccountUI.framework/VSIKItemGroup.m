@interface VSIKItemGroup
+ (id)makeFeatureJSObjectForFeature:(id)a3;
+ (void)registerFeature;
- (IKAppContext)appContext;
- (NSString)featureName;
- (VSIKItemGroup)initWithDOMNode:(id)a3 featureName:(id)a4;
- (VSIKItemGroupDelegate)delegate;
- (int64_t)jsSelectedItem;
- (int64_t)selectedItemIndex;
- (void)setDelegate:(id)a3;
- (void)setJSSelectedItem:(int64_t)a3;
- (void)setSelectedItemIndex:(int64_t)a3;
@end

@implementation VSIKItemGroup

+ (void)registerFeature
{
  v2 = (void *)MEMORY[0x263F4B428];
  uint64_t v3 = objc_opt_class();
  [v2 registerClass:v3 forFeatureName:@"ItemGroup"];
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  v4 = [VSJSItemGroup alloc];
  v5 = [v3 appContext];
  v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  [(VSJSItemGroup *)v6 setBridge:v3];
  return v6;
}

- (VSIKItemGroup)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VSIKItemGroup;
  v8 = [(VSIKItemGroup *)&v13 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v9);

    uint64_t v10 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;
  }
  return v8;
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "ItemGroup updated from UI to index %lu.", (uint8_t *)&v6, 0xCu);
  }

  [(VSIKItemGroup *)self willChangeValueForKey:@"selectedItemIndex"];
  self->_selectedItemIndex = a3;
  [(VSIKItemGroup *)self didChangeValueForKey:@"selectedItemIndex"];
  [(VSIKItemGroup *)self willChangeValueForKey:@"jsSelectedItem"];
  self->_jsSelectedItem = a3;
  [(VSIKItemGroup *)self didChangeValueForKey:@"jsSelectedItem"];
}

- (void)setJSSelectedItem:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "ItemGroup updated from JS to index %lu.", (uint8_t *)&v7, 0xCu);
  }

  [(VSIKItemGroup *)self willChangeValueForKey:@"selectedItemIndex"];
  self->_selectedItemIndex = a3;
  [(VSIKItemGroup *)self didChangeValueForKey:@"selectedItemIndex"];
  [(VSIKItemGroup *)self willChangeValueForKey:@"jsSelectedItem"];
  self->_jsSelectedItem = a3;
  [(VSIKItemGroup *)self didChangeValueForKey:@"jsSelectedItem"];
  int v6 = [(VSIKItemGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 itemGroup:self selectedItemIndexDidChange:a3];
  }
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (int64_t)jsSelectedItem
{
  return self->_jsSelectedItem;
}

- (VSIKItemGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSIKItemGroupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end
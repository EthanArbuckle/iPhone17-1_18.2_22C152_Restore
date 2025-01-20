@interface SUScriptStorePageNativeObject
- (id)_eventNameForNote:(id)a3;
- (void)_webViewControllerNote:(id)a3;
- (void)destroyNativeObject;
- (void)setupNativeObject;
@end

@implementation SUScriptStorePageNativeObject

- (void)setupNativeObject
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__webViewControllerNote_ name:@"SUWebViewControllerDidStartLoad" object:0];
  [v3 addObserver:self selector:sel__webViewControllerNote_ name:@"SUWebViewControllerDidFinishLoad" object:0];
  [v3 addObserver:self selector:sel__webViewControllerNote_ name:@"SUWebViewControllerDidFailLoad" object:0];
  v4.receiver = self;
  v4.super_class = (Class)SUScriptStorePageNativeObject;
  [(SUScriptViewControllerNativeObject *)&v4 setupNativeObject];
}

- (void)destroyNativeObject
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptStorePageNativeObject;
  [(SUScriptViewControllerNativeObject *)&v4 destroyNativeObject];
}

- (void)_webViewControllerNote:(id)a3
{
  id v10 = a3;
  objc_super v4 = [v10 object];
  v5 = [(SUScriptNativeObject *)self object];
  int v6 = [v4 isDescendantOfViewController:v5];

  if (v6)
  {
    v7 = [(SUScriptNativeObject *)self scriptObject];
    v8 = [v10 name];
    v9 = [(SUScriptStorePageNativeObject *)self _eventNameForNote:v8];
    [v7 dispatchEvent:0 forName:v9];
  }
}

- (id)_eventNameForNote:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"SUWebViewControllerDidStartLoad"])
  {
    objc_super v4 = @"didstartload";
  }
  else if ([v3 isEqual:@"SUWebViewControllerDidFinishLoad"])
  {
    objc_super v4 = @"didfinishload";
  }
  else if ([v3 isEqual:@"SUWebViewControllerDidFailLoad"])
  {
    objc_super v4 = @"didfailload";
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

@end
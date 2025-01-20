@interface SUScriptSegmentedControlNativeObject
- (void)_valueChanged:(id)a3;
- (void)destroyNativeObject;
- (void)setupNativeObject;
@end

@implementation SUScriptSegmentedControlNativeObject

- (void)destroyNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControlNativeObject;
  [(SUScriptNativeObject *)&v3 destroyNativeObject];
}

- (void)setupNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "addTarget:action:forEvents:", self, sel__valueChanged_, 4096);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControlNativeObject;
  [(SUScriptNativeObject *)&v3 setupNativeObject];
}

- (void)_valueChanged:(id)a3
{
  objc_super v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"valuechange"];
}

@end
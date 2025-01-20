@interface SUScriptActivityNativeObject
- (BOOL)activity:(id)a3 canPerformWithActivityItems:(id)a4;
- (void)activity:(id)a3 prepareWithActivityItems:(id)a4;
- (void)destroyNativeObject;
- (void)performActionForActivity:(id)a3;
- (void)setupNativeObject;
@end

@implementation SUScriptActivityNativeObject

- (void)destroyNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setITunesStoreDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivityNativeObject;
  [(SUScriptNativeObject *)&v3 destroyNativeObject];
}

- (void)setupNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setITunesStoreDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivityNativeObject;
  [(SUScriptNativeObject *)&v3 setupNativeObject];
}

- (BOOL)activity:(id)a3 canPerformWithActivityItems:(id)a4
{
  return 1;
}

- (void)activity:(id)a3 prepareWithActivityItems:(id)a4
{
  v5 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v5 _performActionFunctionWithItems:a4];
}

- (void)performActionForActivity:(id)a3
{
}

@end
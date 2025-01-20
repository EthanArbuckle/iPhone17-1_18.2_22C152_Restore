@interface SUScriptMediaPickerNativeObject
- (void)destroyNativeObject;
- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)setupNativeObject;
@end

@implementation SUScriptMediaPickerNativeObject

- (void)destroyNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPickerNativeObject;
  [(SUScriptViewControllerNativeObject *)&v3 destroyNativeObject];
}

- (void)setupNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPickerNativeObject;
  [(SUScriptViewControllerNativeObject *)&v3 setupNativeObject];
}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  v5 = [(SUScriptNativeObject *)self scriptObject];
  v7 = objc_alloc_init(SUScriptMediaItemCollection);
  [(SUScriptObject *)v7 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:a4]];
  v6 = [[SUScriptMediaPickerEvent alloc] initWithCollection:v7];
  [(SUScriptObject *)v5 checkInScriptObject:v6];
  [(SUScriptObject *)v5 dispatchEvent:v6 forName:@"pick"];
}

- (void)mediaPickerDidCancel:(id)a3
{
  objc_super v3 = [(SUScriptNativeObject *)self scriptObject];
  v4 = objc_alloc_init(SUScriptMediaPickerEvent);
  [(SUScriptObject *)v3 checkInScriptObject:v4];
  [(SUScriptObject *)v3 dispatchEvent:v4 forName:@"pick"];
}

@end
@interface SUScriptMediaLibraryNativeObject
- (void)_libraryChangedNotification:(id)a3;
- (void)destroyNativeObject;
- (void)setupNativeObject;
@end

@implementation SUScriptMediaLibraryNativeObject

- (void)destroyNativeObject
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SUMediaLibraryCacheDidChangeNotification", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaLibraryNativeObject;
  [(SUScriptNativeObject *)&v3 destroyNativeObject];
}

- (void)setupNativeObject
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__libraryChangedNotification_, @"SUMediaLibraryCacheDidChangeNotification", 0);
  objc_msgSend(+[SUMediaLibraryAdamIDCache sharedCache](SUMediaLibraryAdamIDCache, "sharedCache"), "populateCache");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaLibraryNativeObject;
  [(SUScriptNativeObject *)&v3 setupNativeObject];
}

- (void)_libraryChangedNotification:(id)a3
{
  objc_super v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"contentschange"];
}

@end
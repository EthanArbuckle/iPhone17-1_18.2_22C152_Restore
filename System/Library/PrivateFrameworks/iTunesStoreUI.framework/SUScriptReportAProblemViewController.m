@interface SUScriptReportAProblemViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSNumber)adamID;
- (SUScriptReportAProblemViewController)init;
- (SUScriptReportAProblemViewController)initWithAdamID:(id)a3 clientInterface:(id)a4;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)setAdamID:(id)a3;
@end

@implementation SUScriptReportAProblemViewController

- (SUScriptReportAProblemViewController)init
{
  return [(SUScriptReportAProblemViewController *)self initWithAdamID:0 clientInterface:0];
}

- (SUScriptReportAProblemViewController)initWithAdamID:(id)a3 clientInterface:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)SUScriptReportAProblemViewController;
  v6 = [(SUScriptObject *)&v25 init];
  v7 = v6;
  if (v6)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v17 = MEMORY[0x263EF8330];
    id v18 = a3;
    id v19 = a4;
    v20 = v6;
    WebThreadRunOnMainThread();
    if (!*((unsigned char *)v22 + 24))
    {
      v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v9 = [v8 shouldLog];
      int v10 = [v8 shouldLogToDisk];
      v11 = [v8 OSLogObject];
      if (v10) {
        v9 |= 2u;
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        v9 &= 2u;
      }
      if (v9)
      {
        uint64_t v12 = [(SUScriptReportAProblemViewController *)v7 _className];
        int v26 = 138412290;
        uint64_t v27 = v12;
        LODWORD(v16) = 12;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v16, v17, 3221225472, __71__SUScriptReportAProblemViewController_initWithAdamID_clientInterface___block_invoke, &unk_264813A60, v18, v19, v20, &v21);
          free(v14);
          SSFileLog();
        }
      }

      v7 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  return v7;
}

void __71__SUScriptReportAProblemViewController_initWithAdamID_clientInterface___block_invoke(uint64_t a1)
{
  v2 = -[SUReportConcernViewController initWithItemIdentifier:]([SUReportConcernViewController alloc], "initWithItemIdentifier:", [*(id *)(a1 + 32) itemIdentifierValue]);
  [(SUViewController *)v2 setClientInterface:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 48) setNativeViewController:v2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (id)newNativeViewController
{
  v3 = [[SUReportConcernViewController alloc] initWithItemIdentifier:0];
  [(SUViewController *)v3 setClientInterface:[(SUScriptObject *)self clientInterface]];
  return v3;
}

- (NSNumber)adamID
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__37;
  v8 = __Block_byref_object_dispose__37;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSNumber *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __46__SUScriptReportAProblemViewController_adamID__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = objc_msgSend(objc_alloc(NSNumber), "initWithItemIdentifier:", objc_msgSend(v2, "itemIdentifier"));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)_className
{
  return @"iTunesReportAProblemViewController";
}

- (void)setAdamID:(id)a3
{
  v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"adamID"];

  [v3 throwException:v4];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_49, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptReportAProblemViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptReportAProblemViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_49, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_49 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"adamID", 0);
  }
}

@end
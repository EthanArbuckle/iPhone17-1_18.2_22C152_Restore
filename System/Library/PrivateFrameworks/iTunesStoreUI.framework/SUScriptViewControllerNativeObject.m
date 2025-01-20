@interface SUScriptViewControllerNativeObject
- (void)_loadPassbookPassWithURL:(id)a3;
- (void)_reloadVisibility;
- (void)dealloc;
- (void)destroyNativeObject;
- (void)passbookLoaderDidFinish:(id)a3;
- (void)setScriptObject:(id)a3;
- (void)setupNativeObject;
@end

@implementation SUScriptViewControllerNativeObject

- (void)dealloc
{
  [(SUUIPassbookLoader *)self->_passbookLoader setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)SUScriptViewControllerNativeObject;
  [(SUScriptViewControllerNativeObject *)&v3 dealloc];
}

- (void)destroyNativeObject
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SUViewControllerParentViewControllerDidChangeNotification", 0);
  [(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] setVisible:0];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptViewControllerNativeObject;
  [(SUScriptNativeObject *)&v3 destroyNativeObject];
}

- (void)setScriptObject:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptViewControllerNativeObject;
  -[SUScriptNativeObject setScriptObject:](&v5, sel_setScriptObject_);
  if (a3) {
    objc_msgSend((id)-[SUScriptViewControllerNativeObject mainThreadProxy](self, "mainThreadProxy"), "_reloadVisibility");
  }
}

- (void)setupNativeObject
{
  id v3 = [(SUScriptNativeObject *)self object];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__parentViewControllerChangeNotification_, @"SUViewControllerParentViewControllerDidChangeNotification", v3);
  [(SUScriptViewControllerNativeObject *)self _reloadVisibility];
  v4.receiver = self;
  v4.super_class = (Class)SUScriptViewControllerNativeObject;
  [(SUScriptNativeObject *)&v4 setupNativeObject];
}

- (void)passbookLoaderDidFinish:(id)a3
{
  for (i = [(SUScriptNativeObject *)self scriptObject];
        ;
        i = [(SUScriptObject *)v6 parentScriptObject])
  {
    v6 = i;
    if (![(SUScriptObject *)i parentScriptObject]) {
      break;
    }
  }
  if (v6) {
    [(SUScriptObject *)v6 dispatchEvent:0 forName:@"didreappear"];
  }
  if (self->_passbookLoader == a3)
  {
    [a3 setDelegate:0];

    self->_passbookLoader = 0;
  }
}

- (void)_loadPassbookPassWithURL:(id)a3
{
  passbookLoader = self->_passbookLoader;
  if (!passbookLoader)
  {
    uint64_t v6 = ISUIMobileStoreUIFramework();
    id v7 = ISUIWeakLinkedClassForString(&cfstr_Suuiclientcont.isa, v6);
    uint64_t v8 = ISUIMobileStoreUIFramework();
    v9 = (SUUIPassbookLoader *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuipassbooklo.isa, v8)), "initWithClientContext:", objc_msgSend(v7, "defaultContext"));
    self->_passbookLoader = v9;
    [(SUUIPassbookLoader *)v9 setDelegate:self];
    passbookLoader = self->_passbookLoader;
  }

  [(SUUIPassbookLoader *)passbookLoader loadPassWithURL:a3];
}

- (void)_reloadVisibility
{
  id v3 = [(SUScriptNativeObject *)self object];
  if ([v3 parentViewController])
  {
    BOOL v4 = 1;
  }
  else if ([v3 isViewLoaded])
  {
    BOOL v4 = objc_msgSend((id)objc_msgSend(v3, "view"), "window") != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  objc_super v5 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v5 setVisible:v4];
}

@end
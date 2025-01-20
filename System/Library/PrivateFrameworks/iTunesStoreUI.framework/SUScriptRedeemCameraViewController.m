@interface SUScriptRedeemCameraViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)backButtonTitle;
- (SURedeemCameraViewController)redeemCameraViewController;
- (WebScriptObject)codeHandler;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)_performAction:(int64_t)a3 withObject:(id)a4;
- (void)codeDetected:(id)a3;
- (void)dismiss;
- (void)pauseCamera;
- (void)present;
- (void)recognitionError;
- (void)recognitionSuccess;
- (void)resumeCamera;
- (void)setBackButtonTitle:(id)a3;
- (void)setCodeHandler:(id)a3;
- (void)setRedeemCameraViewController:(id)a3;
@end

@implementation SUScriptRedeemCameraViewController

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (id)_className
{
  return @"iTunesRedeemCameraViewController";
}

- (WebScriptObject)codeHandler
{
  return self->_codeHandler;
}

- (void)setBackButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonTitle, a3);
  id v5 = a3;
  [(SUScriptRedeemCameraViewController *)self _performAction:6 withObject:v5];
}

- (void)setCodeHandler:(id)a3
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  else {
    objc_storeStrong((id *)&self->_codeHandler, a3);
  }
}

- (void)codeDetected:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  WebThreadRunOnMainThread();
}

void __51__SUScriptRedeemCameraViewController_codeDetected___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [SUScriptFunction alloc];
  id v3 = [*(id *)(a1 + 32) codeHandler];
  id v4 = [(SUScriptFunction *)v2 initWithScriptObject:v3];

  [(SUScriptFunction *)v4 setThisObject:*(void *)(a1 + 32)];
  v6[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(SUScriptFunction *)v4 callWithArguments:v5];

  [(SUScriptFunction *)v4 setThisObject:0];
}

- (void)dismiss
{
}

- (void)pauseCamera
{
}

- (void)present
{
}

- (void)recognitionError
{
}

- (void)recognitionSuccess
{
}

- (void)resumeCamera
{
}

- (void)_performAction:(int64_t)a3 withObject:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  WebThreadRunOnMainThread();
}

void __64__SUScriptRedeemCameraViewController__performAction_withObject___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1
    && ([*(id *)(a1 + 32) redeemCameraViewController],
        v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    id v3 = objc_alloc_init(SURedeemCameraViewController);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__SUScriptRedeemCameraViewController__performAction_withObject___block_invoke_2;
    v8[3] = &unk_2648128B0;
    objc_copyWeak(&v9, &location);
    [(SURedeemCameraViewController *)v3 setCodeHandler:v8];
    id v4 = [*(id *)(a1 + 32) clientInterface];
    -[SURedeemCameraViewController setIgnoreDefaultKeyboardNotifications:](v3, "setIgnoreDefaultKeyboardNotifications:", [v4 ignoreDefaultKeyboardNotifications]);

    id v5 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v3];
    [v5 setModalPresentationStyle:2];
    v6 = [*(id *)(a1 + 32) parentViewController];
    [v6 presentViewController:v5 animated:1 completion:0];

    [*(id *)(a1 + 32) setRedeemCameraViewController:v3];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) redeemCameraViewController];
    [v7 performAction:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
  }
}

void __64__SUScriptRedeemCameraViewController__performAction_withObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);
  [v4 codeDetected:v3];

  objc_destroyWeak(&to);
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)__KeyMapping_3 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemCameraViewController;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_1, 6);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemCameraViewController;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptRedeemCameraViewController;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  id v3 = [(id)__KeyMapping_3 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_1 = (uint64_t)sel_dismiss;
    *(void *)algn_2681B45C8 = @"dismiss";
    qword_2681B45D0 = (uint64_t)sel_pauseCamera;
    unk_2681B45D8 = @"pauseCamera";
    qword_2681B45E0 = (uint64_t)sel_present;
    unk_2681B45E8 = @"present";
    qword_2681B45F0 = (uint64_t)sel_recognitionError;
    unk_2681B45F8 = @"recognitionError";
    qword_2681B4600 = (uint64_t)sel_recognitionSuccess;
    unk_2681B4608 = @"recognitionSuccess";
    qword_2681B4610 = (uint64_t)sel_resumeCamera;
    unk_2681B4618 = @"resumeCamera";
    __KeyMapping_3 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"backButtonTitle", @"codeHandler", @"codeHandler", 0);
    MEMORY[0x270F9A758]();
  }
}

- (SURedeemCameraViewController)redeemCameraViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redeemCameraViewController);

  return (SURedeemCameraViewController *)WeakRetained;
}

- (void)setRedeemCameraViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemCameraViewController);
  objc_storeStrong((id *)&self->_codeHandler, 0);

  objc_storeStrong((id *)&self->_backButtonTitle, 0);
}

@end
@interface SUScriptApplication
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSNumber)exitStoreReasonButton;
- (NSNumber)exitStoreReasonDownloadComplete;
- (NSNumber)exitStoreReasonFatalError;
- (NSNumber)exitStoreReasonGotoMainStore;
- (NSNumber)exitStoreReasonOther;
- (NSNumber)exitStoreReasonPurchase;
- (NSString)identifier;
- (NSString)version;
- (id)hostIdentifier;
- (id)iconBadgeNumber;
- (id)isDelayingTerminate;
- (id)isRunningInStoreDemoMode;
- (id)screenHeight;
- (id)screenWidth;
- (id)scriptAttributeKeys;
- (id)statusBarHidden;
- (id)wasLaunchedFromLibrary;
- (int64_t)statusBarAnimationFade;
- (int64_t)statusBarAnimationNone;
- (int64_t)statusBarAnimationSlide;
- (int64_t)statusBarStyle;
- (int64_t)statusBarStyleBlackOpaque;
- (int64_t)statusBarStyleBlackTranslucent;
- (int64_t)statusBarStyleDefault;
- (void)beginDelayingTerminate;
- (void)endDelayingTerminate;
- (void)exitStoreWithReason:(id)a3;
- (void)returnToLibrary;
- (void)scrollIconToVisible:(id)a3 shouldSuspend:(BOOL)a4;
- (void)setIconBadgeNumber:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4;
- (void)setStatusBarHidden:(id)a3;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)setStatusBarStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setVersion:(id)a3;
@end

@implementation SUScriptApplication

- (void)beginDelayingTerminate
{
}

- (void)endDelayingTerminate
{
}

- (void)exitStoreWithReason:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  WebThreadRunOnMainThread();
}

uint64_t __43__SUScriptApplication_exitStoreWithReason___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) clientInterface];
  v3 = *(void **)(a1 + 40);
  if (v3) {
    uint64_t v4 = [v3 integerValue];
  }
  else {
    uint64_t v4 = 2;
  }

  return [v2 _exitStoreWithReason:v4];
}

- (void)returnToLibrary
{
}

uint64_t __38__SUScriptApplication_returnToLibrary__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) clientInterface];

  return [v1 _returnToLibrary];
}

- (void)scrollIconToVisible:(id)a3 shouldSuspend:(BOOL)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
}

uint64_t __57__SUScriptApplication_scrollIconToVisible_shouldSuspend___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, 512);
  uint64_t result = CFStringGetCString(*(CFStringRef *)(a1 + 32), (char *)v4, 1024, 0x8000100u);
  if (result)
  {
    uint64_t v3 = SBSSpringBoardServerPort();
    return MEMORY[0x22A680210](v3, v4, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)setStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUScriptApplication_setStatusBarHidden_withAnimation___block_invoke;
  block[3] = &unk_264813E38;
  BOOL v5 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__SUScriptApplication_setStatusBarHidden_withAnimation___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) clientInterface];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 _setStatusBarHidden:v3 withAnimation:v4];
}

- (void)setStatusBarStyle:(int64_t)a3 animated:(BOOL)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUScriptApplication_setStatusBarStyle_animated___block_invoke;
  block[3] = &unk_264813E38;
  block[4] = self;
  block[5] = a3;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__SUScriptApplication_setStatusBarStyle_animated___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) clientInterface];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);

  return [v2 _setStatusBarStyle:v3 animated:v4];
}

- (id)hostIdentifier
{
  id result = [(SUClientInterface *)[(SUScriptObject *)self clientInterface] hostApplicationIdentifier];
  if (!result)
  {
    return +[SUClientInterface _defaultApplicationIdentifier];
  }
  return result;
}

- (id)iconBadgeNumber
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  uint64_t v11 = 0;
  WebThreadRunOnMainThread();
  v2 = (void *)v7[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)[NSNumber numberWithInteger:0];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

uint64_t __38__SUScriptApplication_iconBadgeNumber__block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t result = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v2, "applicationIconBadgeNumber"));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (NSString)identifier
{
  uint64_t result = [(SUClientInterface *)[(SUScriptObject *)self clientInterface] applicationIdentifier];
  if (!result)
  {
    return (NSString *)+[SUClientInterface _defaultApplicationIdentifier];
  }
  return result;
}

- (id)isDelayingTerminate
{
  return (id)*MEMORY[0x263EFFB38];
}

- (id)isRunningInStoreDemoMode
{
  int v2 = [MEMORY[0x263F1C408] isRunningInStoreDemoMode];
  id v3 = (id *)MEMORY[0x263EFFB40];
  if (!v2) {
    id v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (id)screenHeight
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x3010000000;
  uint64_t v8 = &unk_2279415F1;
  long long v9 = *MEMORY[0x263F001B0];
  WebThreadRunOnMainThread();
  double v2 = v6[5];
  *(float *)&double v2 = v2;
  id v3 = (void *)[NSNumber numberWithFloat:v2];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __35__SUScriptApplication_screenHeight__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (id)screenWidth
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x3010000000;
  uint64_t v8 = &unk_2279415F1;
  long long v9 = *MEMORY[0x263F001B0];
  WebThreadRunOnMainThread();
  double v2 = v6[4];
  *(float *)&double v2 = v2;
  uint64_t v3 = (void *)[NSNumber numberWithFloat:v2];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __34__SUScriptApplication_screenWidth__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (void)setIconBadgeNumber:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = 0;
LABEL_6:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SUScriptApplication_setIconBadgeNumber___block_invoke;
    block[3] = &unk_264812130;
    block[4] = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  char v6 = objc_opt_respondsToSelector();
  id v4 = a3;
  if (v6) {
    goto LABEL_6;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

uint64_t __42__SUScriptApplication_setIconBadgeNumber___block_invoke(uint64_t a1)
{
  double v2 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t v3 = (int)[*(id *)(a1 + 32) intValue];

  return [v2 setApplicationIconBadgeNumber:v3];
}

- (void)setIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"identifier"];

  [v3 throwException:v4];
}

- (void)setStatusBarHidden:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a3 BOOLValue];
    [(SUScriptApplication *)self setStatusBarHidden:v5 withAnimation:0];
  }
  else
  {
    char v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

- (void)setStatusBarStyle:(int64_t)a3
{
}

- (void)setVersion:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"version"];

  [v3 throwException:v4];
}

- (id)statusBarHidden
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    double v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    double v2 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __38__SUScriptApplication_statusBarHidden__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "isStatusBarHidden");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int64_t)statusBarStyle
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __37__SUScriptApplication_statusBarStyle__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NSString)version
{
  uint64_t result = [(SUClientInterface *)[(SUScriptObject *)self clientInterface] applicationVersion];
  if (!result)
  {
    return (NSString *)+[SUClientInterface _defaultApplicationVersion];
  }
  return result;
}

- (id)wasLaunchedFromLibrary
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    int64_t v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    int64_t v2 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __45__SUScriptApplication_wasLaunchedFromLibrary__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "wasLaunchedFromLibrary");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSNumber)exitStoreReasonButton
{
  return (NSNumber *)[NSNumber numberWithInteger:3];
}

- (NSNumber)exitStoreReasonDownloadComplete
{
  return (NSNumber *)[NSNumber numberWithInteger:4];
}

- (NSNumber)exitStoreReasonFatalError
{
  return (NSNumber *)[NSNumber numberWithInteger:0];
}

- (NSNumber)exitStoreReasonGotoMainStore
{
  return (NSNumber *)[NSNumber numberWithInteger:5];
}

- (NSNumber)exitStoreReasonOther
{
  return (NSNumber *)[NSNumber numberWithInteger:2];
}

- (NSNumber)exitStoreReasonPurchase
{
  return (NSNumber *)[NSNumber numberWithInteger:1];
}

- (int64_t)statusBarAnimationFade
{
  return 1;
}

- (int64_t)statusBarAnimationNone
{
  return 0;
}

- (int64_t)statusBarAnimationSlide
{
  return 2;
}

- (int64_t)statusBarStyleDefault
{
  return 0;
}

- (int64_t)statusBarStyleBlackOpaque
{
  return 2;
}

- (int64_t)statusBarStyleBlackTranslucent
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_44, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_35, 8);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptApplication;
  int64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_44 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_35 = (uint64_t)sel_beginDelayingTerminate;
    unk_2681B5180 = @"beginDelayingTerminate";
    qword_2681B5188 = (uint64_t)sel_endDelayingTerminate;
    unk_2681B5190 = @"endDelayingTerminate";
    qword_2681B5198 = (uint64_t)sel_exitStoreWithReason_;
    unk_2681B51A0 = @"exitStore";
    qword_2681B51A8 = (uint64_t)sel_returnToLibrary;
    unk_2681B51B0 = @"returnToLibrary";
    qword_2681B51B8 = (uint64_t)sel_scrollIconToVisible_shouldSuspend_;
    unk_2681B51C0 = @"scrollIconToVisible";
    qword_2681B51C8 = (uint64_t)sel_setStatusBarHidden_withAnimation_;
    unk_2681B51D0 = @"setStatusBarHidden";
    qword_2681B51D8 = (uint64_t)sel_setStatusBarStyle_animated_;
    unk_2681B51E0 = @"setStatusBarStyle";
    qword_2681B51E8 = (uint64_t)sel_showNewsstand;
    unk_2681B51F0 = @"showNewsstand";
    __KeyMapping_44 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"hostIdentifier", @"iconBadgeNumber", @"iconBadgeNumber", @"identifier", @"identifier", @"isDelayingTerminate", @"isDelayingTerminate", @"isRunningInStoreDemoMode", @"isRunningInStoreDemoMode", @"screenHeight", @"screenHeight", @"screenWidth", @"screenWidth", @"statusBarHidden", @"statusBarHidden", @"statusBarStyle", @"statusBarStyle",
                        @"version",
                        @"version",
                        @"wasLaunchedFromLibrary",
                        @"wasLaunchedFromLibrary",
                        @"EXIT_STORE_REASON_BUTTON",
                        @"exitStoreReasonButton",
                        @"EXIT_STORE_REASON_DOWNLOAD_COMPLETE",
                        @"exitStoreReasonDownloadComplete",
                        @"EXIT_STORE_REASON_FATAL_ERROR",
                        @"exitStoreReasonFatalError",
                        @"EXIT_STORE_REASON_GOTO_MAIN_STORE",
                        @"exitStoreReasonGotoMainStore",
                        @"EXIT_STORE_REASON_OTHER",
                        @"exitStoreReasonOther",
                        @"EXIT_STORE_REASON_PURCHASE",
                        @"exitStoreReasonPurchase",
                        @"STATUS_BAR_ANIMATION_FADE",
                        @"statusBarAnimationFade",
                        @"STATUS_BAR_ANIMATION_NONE",
                        @"statusBarAnimationNone",
                        @"STATUS_BAR_ANIMATION_SLIDE",
                        @"statusBarAnimationSlide",
                        @"STATUS_BAR_STYLE_DEFAULT",
                        @"statusBarStyleDefault",
                        @"STATUS_BAR_STYLE_BLACK_OPAQUE",
                        @"statusBarStyleBlackOpaque",
                        @"STATUS_BAR_STYLE_BLACK_TRANSLUCENT",
                        @"statusBarStyleBlackTranslucent",
                        0);
  }
}

@end
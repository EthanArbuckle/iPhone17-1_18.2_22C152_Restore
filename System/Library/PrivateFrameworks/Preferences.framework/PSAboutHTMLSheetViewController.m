@interface PSAboutHTMLSheetViewController
+ (void)presentAboutSheetTitled:(id)a3 HTMLContent:(id)a4 fromViewController:(id)a5;
- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (void)dealloc;
- (void)donePressed;
- (void)loadView;
- (void)setHTMLContent:(id)a3 isFragment:(BOOL)a4;
- (void)viewDidBecomeVisible;
@end

@implementation PSAboutHTMLSheetViewController

- (void)loadView
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F43050]);
  [v8 setAutoresizingMask:18];
  [v8 setDelegate:self];
  [v8 setDataDetectorTypes:0];
  [v8 _setDrawsCheckeredPattern:0];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v8 setBackgroundColor:v3];

  v4 = [v8 _browserView];
  [v4 setTilesOpaque:0];
  [v4 setLoadsSynchronously:1];
  [v4 setDetectsPhoneNumbers:0];
  v5 = [v8 _scrollView];
  v6 = [MEMORY[0x1E4F428B8] whiteColor];
  [v5 setBackgroundColor:v6];

  [v5 _setShowsBackgroundShadow:0];
  [v5 setDecelerationRate:0.998];
  v7 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v5 setBackgroundColor:v7];

  [(PSAboutHTMLSheetViewController *)self setView:v8];
}

- (void)dealloc
{
  v3 = [(PSAboutHTMLSheetViewController *)self view];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)PSAboutHTMLSheetViewController;
  [(PSAboutHTMLSheetViewController *)&v4 dealloc];
}

- (void)viewDidBecomeVisible
{
  id v3 = [(PSAboutHTMLSheetViewController *)self view];
  v2 = [v3 _scrollView];
  [v2 flashScrollIndicators];
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  if (!a5)
  {
    v6 = (void *)MEMORY[0x1E4F42738];
    id v7 = a4;
    id v8 = [v6 sharedApplication];
    v9 = [v7 URL];

    [v8 openURL:v9 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
  return a5 != 0;
}

- (void)donePressed
{
  id v2 = [(PSAboutHTMLSheetViewController *)self parentViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)setHTMLContent:(id)a3 isFragment:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  if (v4)
  {
    v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    id v7 = [NSString stringWithFormat:@"<style type=\"text/css\"> :root { supported-color-schemes: light dark } body {font: -apple-system-body; word-wrap: break-word;-khtml-nbsp-mode: space;-khtml-line-break: after-white-space; color: -apple-system-label; background-color: -apple-system-background; } </style>"];;
    id v8 = (void *)MEMORY[0x1E4F1CA20];
    v9 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v10 = [v9 objectAtIndex:0];
    uint64_t v11 = [v8 characterDirectionForLanguage:v10];

    v12 = &stru_1EFB51FD0;
    if (v11 == 2) {
      v12 = @"; direction: rtl";
    }
    v13 = objc_msgSend(NSString, "stringWithFormat:", v7, v12);

    uint64_t v14 = [NSString stringWithFormat:@"<html><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/>%@</head><body>%@</body></html>", v13, v16];

    id v16 = (id)v14;
  }
  v15 = [(PSAboutHTMLSheetViewController *)self view];
  [v15 loadHTMLString:v16 baseURL:0];
}

+ (void)presentAboutSheetTitled:(id)a3 HTMLContent:(id)a4 fromViewController:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setTitle:v10];

  [v14 setHTMLContent:v9 isFragment:1];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v14];
  [v11 setModalPresentationStyle:2];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v14 action:sel_donePressed];
  v13 = [v14 navigationItem];
  [v13 setRightBarButtonItem:v12];

  [v8 presentViewController:v11 animated:1 completion:0];
}

@end
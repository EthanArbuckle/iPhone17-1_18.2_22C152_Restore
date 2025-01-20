@interface PSAboutTextSheetViewController
+ (void)presentAboutSheetTitled:(id)a3 attributedText:(id)a4 fromViewController:(id)a5;
- (void)donePressed;
- (void)loadView;
- (void)setAttributedText:(id)a3;
@end

@implementation PSAboutTextSheetViewController

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42F58]);
  id v5 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v5 setAutoresizingMask:18];
  v4 = [MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  [v5 setFont:v4];

  [v5 setEditable:0];
  [(PSAboutTextSheetViewController *)self setView:v5];
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(PSAboutTextSheetViewController *)self view];
  [v5 setAttributedText:v4];
}

- (void)donePressed
{
  id v2 = [(PSAboutTextSheetViewController *)self parentViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

+ (void)presentAboutSheetTitled:(id)a3 attributedText:(id)a4 fromViewController:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setTitle:v10];

  [v14 setAttributedText:v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v14];
  [v11 setModalPresentationStyle:2];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v14 action:sel_donePressed];
  v13 = [v14 navigationItem];
  [v13 setRightBarButtonItem:v12];

  [v8 presentViewController:v11 animated:1 completion:0];
}

@end
@interface ICRenameAttachmentPrompt
+ (void)showWithTitle:(id)a3 presentingViewController:(id)a4 completion:(id)a5;
@end

@implementation ICRenameAttachmentPrompt

+ (void)showWithTitle:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F45E18];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)[[v7 alloc] initWithExistingTitle:v10];

  [v11 showFromViewController:v9 completion:v8];
}

@end
@interface PKExtension(PKUIAdditions)
- (void)beginRemoteViewControllerExtensionServiceWithInputItems:()PKUIAdditions completion:;
@end

@implementation PKExtension(PKUIAdditions)

- (void)beginRemoteViewControllerExtensionServiceWithInputItems:()PKUIAdditions completion:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 provider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__PKExtension_PKUIAdditions__beginRemoteViewControllerExtensionServiceWithInputItems_completion___block_invoke;
  v10[3] = &unk_1E59DA960;
  id v11 = v6;
  id v9 = v6;
  [v8 _beginRemoteViewControllerExtensionServiceWithExtension:a1 inputItems:v7 completion:v10];
}

@end
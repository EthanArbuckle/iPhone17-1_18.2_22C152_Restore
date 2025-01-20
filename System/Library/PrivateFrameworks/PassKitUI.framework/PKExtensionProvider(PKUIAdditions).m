@interface PKExtensionProvider(PKUIAdditions)
- (void)_beginRemoteViewControllerExtensionServiceWithExtension:()PKUIAdditions inputItems:completion:;
@end

@implementation PKExtensionProvider(PKUIAdditions)

- (void)_beginRemoteViewControllerExtensionServiceWithExtension:()PKUIAdditions inputItems:completion:
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 extension];
  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __116__PKExtensionProvider_PKUIAdditions___beginRemoteViewControllerExtensionServiceWithExtension_inputItems_completion___block_invoke;
    v11[3] = &unk_1E59D0AF8;
    id v12 = v8;
    [v9 instantiateViewControllerWithInputItems:v7 connectionHandler:v11];
  }
  else if (v8)
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1001 userInfo:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v10);
  }
}

@end
@interface SecureChannelController
+ (void)actionForURL:(id)a3 completion:(id)a4;
+ (void)runApproverFlowForURL:(id)a3 withCompletion:(id)a4;
@end

@implementation SecureChannelController

+ (void)actionForURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 absoluteString];
  char v8 = [v7 hasPrefix:@"https://auth.apple.com/"];

  if (v8)
  {
    v9 = +[SecureChannelServiceProxy sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__SecureChannelController_actionForURL_completion___block_invoke;
    v10[3] = &unk_2649A78C0;
    id v11 = v6;
    [v9 actionForURL:v5 completion:v10];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __51__SecureChannelController_actionForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)runApproverFlowForURL:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SecureChannelServiceProxy sharedInstance];
  [v7 runApproverFlowForURL:v6 completion:v5];
}

@end
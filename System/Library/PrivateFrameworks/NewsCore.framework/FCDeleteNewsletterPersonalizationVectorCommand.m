@interface FCDeleteNewsletterPersonalizationVectorCommand
+ (BOOL)supportsSecureCoding;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
@end

@implementation FCDeleteNewsletterPersonalizationVectorCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7 = a4;
  v8 = [a3 newsletterEndpointConnection];
  v9 = dispatch_get_global_queue(-2, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__FCDeleteNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v11[3] = &unk_1E5B4D168;
  id v12 = v7;
  v13 = self;
  id v10 = v7;
  [v8 deletePersonalizationVectorWithCallbackQueue:v9 completion:v11];
}

void __95__FCDeleteNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 0;
  }
  else if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 1;
  }
  else
  {
    int v9 = objc_msgSend(v10, "fc_shouldRetry");
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v9) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  [v6 command:v7 didFinishWithStatus:v8];
}

@end
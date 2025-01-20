@interface PKIssuerProvisioningExtensionHandler
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)generateAddPaymentPassRequestForPassEntryWithIdentifier:(NSString *)identifier configuration:(PKAddPaymentPassRequestConfiguration *)configuration certificateChain:(NSArray *)certificates nonce:(NSData *)nonce nonceSignature:(NSData *)nonceSignature completionHandler:(void *)completion;
- (void)passEntriesWithCompletion:(void *)completion;
- (void)remotePassEntriesWithCompletion:(void *)completion;
- (void)statusWithCompletion:(void *)completion;
@end

@implementation PKIssuerProvisioningExtensionHandler

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = (void *)MEMORY[0x192FDC630]();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 setHandler:self];
      [v6 connect];
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid configuration for PKIssuerProvisioningExtensionHandler extension."];
      [v6 completeRequestReturningItems:0 completionHandler:0];
    }
    id v4 = v6;
  }
}

- (void)statusWithCompletion:(void *)completion
{
  if (completion) {
    (*((void (**)(void *, void))completion + 2))(completion, 0);
  }
}

- (void)passEntriesWithCompletion:(void *)completion
{
  if (completion) {
    (*((void (**)(void *, void))completion + 2))(completion, 0);
  }
}

- (void)remotePassEntriesWithCompletion:(void *)completion
{
  if (completion) {
    (*((void (**)(void *, void))completion + 2))(completion, 0);
  }
}

- (void)generateAddPaymentPassRequestForPassEntryWithIdentifier:(NSString *)identifier configuration:(PKAddPaymentPassRequestConfiguration *)configuration certificateChain:(NSArray *)certificates nonce:(NSData *)nonce nonceSignature:(NSData *)nonceSignature completionHandler:(void *)completion
{
  if (completion) {
    (*((void (**)(void *, void))completion + 2))(completion, 0);
  }
}

@end
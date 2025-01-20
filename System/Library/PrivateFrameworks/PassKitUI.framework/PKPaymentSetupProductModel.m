@interface PKPaymentSetupProductModel
@end

@implementation PKPaymentSetupProductModel

uint64_t __78__PKPaymentSetupProductModel_PKUIUtilities___localCredentials_containProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isRemoteCredential])
  {
    v4 = [v3 remoteCredential];
  }
  else
  {
    if (![v3 isCarKeyTerminalPairingCredential])
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    v4 = [v3 carKeyTerminalPairingCredential];
  }
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  v7 = [v4 productIdentifier];
  uint64_t v8 = [v6 isEqualToString:v7];

LABEL_7:
  return v8;
}

@end
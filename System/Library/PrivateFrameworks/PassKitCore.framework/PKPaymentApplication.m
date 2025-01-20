@interface PKPaymentApplication
- (BOOL)_supportsTransitNetworks:(id)a3;
@end

@implementation PKPaymentApplication

- (BOOL)_supportsTransitNetworks:(id)a3
{
  id v4 = a3;
  v5 = (char *)[(PKPaymentApplication *)self paymentNetworkIdentifier];
  if ((unint64_t)(v5 - 103) > 6 || ((1 << (v5 - 103)) & 0x61) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v8 = [(PKPaymentApplication *)self supportedTransitNetworkIdentifiers];
    id v7 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v8);
          }
          if ([v4 containsObject:*(void *)(*((void *)&v12 + 1) + 8 * i)])
          {
            LOBYTE(v7) = 1;
            goto LABEL_16;
          }
        }
        id v7 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return (char)v7;
}

@end
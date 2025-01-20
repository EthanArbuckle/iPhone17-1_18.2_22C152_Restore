@interface PKSecureElementPass(NanoPassKit)
- (BOOL)npkIsBankConnectEligible;
- (BOOL)npkIsInLostMode;
- (BOOL)npkProvidesLinkedAccountFeatureIdentifier;
- (BOOL)npkSupportUWBSecureRanging;
- (BOOL)npkSupportsMultipleRadioTypes;
- (id)npkSubcredentials;
- (uint64_t)allSupportedTechnologies;
- (uint64_t)npkExclusivelyTransactsOverBluetooth;
- (uint64_t)npkExclusivelyTransactsOverNFC;
- (uint64_t)npkIsPrecursorPass;
- (uint64_t)npkLinkedAccountFeatureIdentifier;
- (uint64_t)npkSupportsNFC;
- (unint64_t)npkSupportsBluetooth;
@end

@implementation PKSecureElementPass(NanoPassKit)

- (unint64_t)npkSupportsBluetooth
{
  return ((unint64_t)[a1 allSupportedTechnologies] >> 1) & 1;
}

- (uint64_t)npkSupportsNFC
{
  return [a1 allSupportedTechnologies] & 1;
}

- (uint64_t)npkExclusivelyTransactsOverBluetooth
{
  uint64_t result = [a1 npkSupportsBluetooth];
  if (result) {
    return [a1 npkSupportsMultipleRadioTypes] ^ 1;
  }
  return result;
}

- (uint64_t)npkExclusivelyTransactsOverNFC
{
  uint64_t result = [a1 npkSupportsNFC];
  if (result) {
    return [a1 npkSupportsMultipleRadioTypes] ^ 1;
  }
  return result;
}

- (id)npkSubcredentials
{
  v1 = [a1 devicePrimaryContactlessPaymentApplication];
  v2 = [v1 subcredentials];

  return v2;
}

- (BOOL)npkSupportUWBSecureRanging
{
  v2 = [a1 devicePrimaryContactlessPaymentApplication];
  if (v2 && [a1 npkSupportsBluetooth])
  {
    [v2 state];
    BOOL v3 = PKPaymentApplicationStateIsPersonalized() != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)allSupportedTechnologies
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v1 = [a1 paymentApplications];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        v8 = objc_msgSend(v7, "subcredentials", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              v4 |= [*(id *)(*((void *)&v14 + 1) + 8 * j) supportedRadioTechnologies];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v10);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)npkSupportsMultipleRadioTypes
{
  uint64_t v2 = [a1 allSupportedTechnologies];
  return (([a1 allSupportedTechnologies] - 1) & v2) != 0;
}

- (BOOL)npkIsBankConnectEligible
{
  uint64_t v2 = [a1 paymentPass];
  if (PKBankConnectAvailableForPass())
  {
    uint64_t v3 = [a1 primaryAccountIdentifier];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)npkProvidesLinkedAccountFeatureIdentifier
{
  return [a1 npkLinkedAccountFeatureIdentifier] != 0;
}

- (uint64_t)npkLinkedAccountFeatureIdentifier
{
  v1 = [a1 secureElementPass];
  int v2 = [v1 isAppleCardPass];

  if (v2) {
    return 5;
  }
  else {
    return 0;
  }
}

- (uint64_t)npkIsPrecursorPass
{
  int v2 = [MEMORY[0x263F5C1F8] secureElementIdentifiers];
  uint64_t v3 = [a1 isPrecursorPass:v2];

  return v3;
}

- (BOOL)npkIsInLostMode
{
  return [a1 effectiveContactlessPaymentApplicationState] == 7;
}

@end
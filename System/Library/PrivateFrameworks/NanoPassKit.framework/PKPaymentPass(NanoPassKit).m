@interface PKPaymentPass(NanoPassKit)
- (BOOL)npkHasMultiplePaymentApplications;
- (BOOL)npkHasUserSelectableContactlessPaymentApplications;
- (BOOL)npkIsInActivatedState;
- (BOOL)npkIsInActivatingState;
- (BOOL)npkIsInSuspendedState;
- (id)npkDevicePaymentApplicationForAID:()NanoPassKit;
- (id)npkPreferredContactlessPaymentApplications;
- (id)npkPrimaryPaymentApplication;
- (id)npkSortedDeviceContactlessPaymentApplications;
- (id)npkUserSelectedPaymentApplication;
- (uint64_t)npkHasTransitNetworkIdentifiers;
- (void)npkSetPreferredPaymentApplication:()NanoPassKit;
@end

@implementation PKPaymentPass(NanoPassKit)

- (id)npkSortedDeviceContactlessPaymentApplications
{
  v2 = [a1 deviceContactlessPaymentApplications];
  v3 = [v2 allObjects];
  v4 = [a1 sortedPaymentApplications:v3 ascending:1];

  return v4;
}

- (id)npkDevicePaymentApplicationForAID:()NanoPassKit
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v5 = [a1 devicePaymentApplications];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__PKPaymentPass_NanoPassKit__npkDevicePaymentApplicationForAID___block_invoke;
  v9[3] = &unk_2644D2EA8;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)npkHasUserSelectableContactlessPaymentApplications
{
  if ([a1 contactlessActivationGroupingType] != 2) {
    return 0;
  }
  v2 = [a1 deviceContactlessPaymentApplications];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)npkUserSelectedPaymentApplication
{
  id v2 = objc_alloc_init(MEMORY[0x263F5C0A8]);
  BOOL v3 = [a1 uniqueID];
  id v4 = [v2 defaultPaymentApplicationForPassUniqueIdentifier:v3];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [a1 devicePrimaryContactlessPaymentApplication];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)npkHasMultiplePaymentApplications
{
  v1 = [a1 devicePaymentApplications];
  BOOL v2 = (unint64_t)[v1 count] > 1;

  return v2;
}

- (id)npkPrimaryPaymentApplication
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 devicePrimaryContactlessPaymentApplication];
  BOOL v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x263EFFA68];
  }

  return v3;
}

- (id)npkPreferredContactlessPaymentApplications
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 contactlessActivationGroupingType];
  switch(v2)
  {
    case 3:
      id v4 = [a1 deviceContactlessPaymentApplications];
      uint64_t v5 = [v4 allObjects];
      goto LABEL_8;
    case 2:
      uint64_t v6 = [a1 npkUserSelectedPaymentApplication];
      id v4 = (void *)v6;
      if (!v6)
      {
        BOOL v3 = (void *)MEMORY[0x263EFFA68];
        goto LABEL_9;
      }
      v8[0] = v6;
      uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
LABEL_8:
      BOOL v3 = (void *)v5;
LABEL_9:

      break;
    case 1:
      BOOL v3 = [a1 npkPrimaryPaymentApplication];
      break;
    default:
      BOOL v3 = (void *)MEMORY[0x263EFFA68];
      break;
  }
  return v3;
}

- (void)npkSetPreferredPaymentApplication:()NanoPassKit
{
  id v8 = a3;
  id v4 = [a1 devicePaymentApplications];
  int v5 = [v4 containsObject:v8];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F5C0A8]);
    id v7 = [a1 uniqueID];
    [v6 setDefaultPaymentApplication:v8 forPassUniqueIdentifier:v7 completion:0];
  }
}

- (BOOL)npkIsInActivatingState
{
  return [a1 effectiveContactlessPaymentApplicationState] == 2;
}

- (BOOL)npkIsInActivatedState
{
  return PKPaymentApplicationStateIsPersonalized() != 0;
}

- (BOOL)npkIsInSuspendedState
{
  return PKPaymentApplicationStateIsSuspended() != 0;
}

- (uint64_t)npkHasTransitNetworkIdentifiers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = objc_msgSend(a1, "devicePaymentApplications", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        int v5 = [*(id *)(*((void *)&v8 + 1) + 8 * i) supportedTransitNetworkIdentifiers];
        uint64_t v6 = [v5 count];

        if (v6)
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

@end
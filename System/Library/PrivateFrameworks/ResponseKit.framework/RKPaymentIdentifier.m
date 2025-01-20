@interface RKPaymentIdentifier
+ (id)sharedManager;
- (id)amountsFromMessage:(id)a3;
- (id)copyAttributedTokensForText:(id)a3;
@end

@implementation RKPaymentIdentifier

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_12);
  }
  v2 = (void *)sharedManager_sharedPaymentIdentifier;

  return v2;
}

uint64_t __36__RKPaymentIdentifier_sharedManager__block_invoke()
{
  sharedManager_sharedPaymentIdentifier = objc_alloc_init(RKPaymentIdentifier);

  return MEMORY[0x270F9A758]();
}

- (id)amountsFromMessage:(id)a3
{
  id v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__RKPaymentIdentifier_amountsFromMessage___block_invoke;
  block[3] = &unk_2642D2068;
  block[4] = v13;
  if (amountsFromMessage__onceToken != -1) {
    dispatch_once(&amountsFromMessage__onceToken, block);
  }
  if (amountsFromMessage__scanner
    && DDScannerScanString()
    && (CFArrayRef v4 = (const __CFArray *)DDScannerCopyResultsWithOptions(), (v5 = v4) != 0))
  {
    CFIndex Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFArrayGetValueAtIndex(v5, i);
        if (DDResultHasType())
        {
          uint64_t Value = DDResultGetValue();
          if (DDResultCurrencyExtraction())
          {
            v10 = [[RKCurrencyAmount alloc] initWithString:Value currency:0 value:0.0];
            [v7 addObject:v10];
          }
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(v13, 8);

  return v7;
}

uint64_t __42__RKPaymentIdentifier_amountsFromMessage___block_invoke()
{
  uint64_t result = DDScannerCreateWithType();
  amountsFromMessage__scanner = result;
  return result;
}

- (id)copyAttributedTokensForText:(id)a3
{
  id v3 = [(RKPaymentIdentifier *)self amountsFromMessage:a3];
  CFArrayRef v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v5 setValue:@"money" forKey:*MEMORY[0x263F51238]];
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v6 setValue:v4 forKey:@"xCURRENCYAMOUNTx"];
    [v5 setValue:v6 forKey:*MEMORY[0x263F51200]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end
@interface PPDataDetectors
+ (BOOL)isValidDataDetectorsMatch:(__DDResult *)a3 addressComponents:(id *)a4;
+ (id)addressComponentsFromString:(id)a3 extractedAddress:(id *)a4;
+ (id)addressComponentsFromString:(id)a3 extractedAddress:(id *)a4 locale:(id)a5;
+ (uint64_t)_components:(void *)a3 haveHongKongAtKey:;
+ (void)addAddressComponentsInResult:(__DDResult *)a3 toDictionary:(id)a4;
+ (void)scanString:(id)a3 inRange:(id)a4 withScanner:(__DDScanner *)a5 options:(int64_t)a6 block:(id)a7;
@end

@implementation PPDataDetectors

+ (BOOL)isValidDataDetectorsMatch:(__DDResult *)a3 addressComponents:(id *)a4
{
  v7 = objc_opt_new();
  +[PPDataDetectors addAddressComponentsInResult:a3 toDictionary:v7];
  if (a4) {
    *a4 = v7;
  }
  uint64_t v8 = *MEMORY[0x1E4F28920];
  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28920]];

  if (!v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F28928];
    if ((+[PPDataDetectors _components:haveHongKongAtKey:]((uint64_t)a1, v7, (void *)*MEMORY[0x1E4F28928]) & 1) != 0
      || (uint64_t v10 = *MEMORY[0x1E4F28950],
          +[PPDataDetectors _components:haveHongKongAtKey:]((uint64_t)a1, v7, (void *)*MEMORY[0x1E4F28950])))
    {
      v11 = [v7 objectForKeyedSubscript:v10];
      [v7 setObject:v11 forKeyedSubscript:v8];

      [v7 removeObjectForKey:v10];
    }
  }
  id v12 = v7;
  self;
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28958]];
  if (v13)
  {
    v14 = [v12 objectForKeyedSubscript:v8];
    if (v14)
    {
      BOOL v15 = 1;
    }
    else
    {
      v16 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28960]];
      BOOL v15 = v16 != 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (uint64_t)_components:(void *)a3 haveHongKongAtKey:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = [v5 objectForKeyedSubscript:v4];

  if (([v6 isEqualToString:@"香港"] & 1) != 0
    || ([v6 isEqualToString:@"香港省"] & 1) != 0
    || ([v6 isEqualToString:@"HongKong"] & 1) != 0)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = [v6 isEqualToString:@"Hong Kong"];
  }

  return v7;
}

+ (id)addressComponentsFromString:(id)a3 extractedAddress:(id *)a4 locale:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([v9 length])
  {
    if (v10)
    {
      BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:a1 file:@"PPDataDetectors.m" lineNumber:110 description:@"overriding locale for PPDataDetectors +addressComponentsFromString is for unit tests only"];
    }
    if (addressComponentsFromString_extractedAddress_locale___pasOnceToken2 != -1) {
      dispatch_once(&addressComponentsFromString_extractedAddress_locale___pasOnceToken2, &__block_literal_global_25);
    }
    id v11 = (id)addressComponentsFromString_extractedAddress_locale___pasExprOnceResult;
    id v12 = [v11 result];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__4418;
    v25 = __Block_byref_object_dispose__4419;
    id v26 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_41;
    v16[3] = &unk_1E65D57E0;
    id v19 = a1;
    v20 = a4;
    id v17 = v9;
    v18 = &v21;
    [v12 runWithLockAcquired:v16];
    id v13 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 length];
  uint64_t v7 = *MEMORY[0x1E4F5F128];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_2_42;
  v10[3] = &unk_1E65D57B8;
  id v8 = *(id *)(a1 + 32);
  int8x16_t v13 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  objc_msgSend(v4, "scanString:inRange:withScanner:options:block:", v5, 0, v6, v3, v7, v10);
}

BOOL __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_2_42(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 3)
  {
    uint64_t Range = DDResultGetRange();
    uint64_t v8 = v7;
    uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
    id v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", Range, v8);
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v10;
    }
    id v11 = objc_opt_class();
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v12 + 40);
    char v13 = [v11 isValidDataDetectorsMatch:a2 addressComponents:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if ((v13 & 1) == 0)
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0;
    }
  }
  return a3 != 3;
}

void __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_29 idleTimeout:1.0];
  v2 = (void *)addressComponentsFromString_extractedAddress_locale___pasExprOnceResult;
  addressComponentsFromString_extractedAddress_locale___pasExprOnceResult = v1;
}

id __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_2()
{
  v0 = (void *)DDScannerCreate();
  if (!v0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"+[PPDataDetectors addressComponentsFromString:extractedAddress:locale:]_block_invoke_2"];
    [v3 handleFailureInFunction:v4, @"PPDataDetectors.m", 115, @"Invalid parameter not satisfying: %@", @"newScanner" file lineNumber description];
  }
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v0];

  return v1;
}

+ (id)addressComponentsFromString:(id)a3 extractedAddress:(id *)a4
{
  return (id)[a1 addressComponentsFromString:a3 extractedAddress:a4 locale:0];
}

+ (void)addAddressComponentsInResult:(__DDResult *)a3 toDictionary:(id)a4
{
  id v15 = a4;
  if (addAddressComponentsInResult_toDictionary__onceToken != -1) {
    dispatch_once(&addAddressComponentsInResult_toDictionary__onceToken, &__block_literal_global_4436);
  }
  CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
  if (SubResults)
  {
    CFArrayRef v5 = SubResults;
    CFIndex Count = CFArrayGetCount(SubResults);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        id v10 = DDResultGetType();
        id v11 = [(id)addAddressComponentsInResult_toDictionary__subTypesToKeysDictionary objectForKeyedSubscript:v10];
        if (v11)
        {
          uint64_t Value = DDResultGetValue();
          if (Value)
          {
            char v13 = (const void *)Value;
            CFTypeID TypeID = CFStringGetTypeID();
            if (TypeID == CFGetTypeID(v13)) {
              [v15 setObject:v13 forKeyedSubscript:v11];
            }
          }
        }
        [(id)objc_opt_class() addAddressComponentsInResult:ValueAtIndex toDictionary:v15];
      }
    }
  }
}

void __61__PPDataDetectors_addAddressComponentsInResult_toDictionary___block_invoke()
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F28948];
  v7[0] = @"CompanyName";
  v7[1] = @"Street";
  uint64_t v1 = *MEMORY[0x1E4F28958];
  v8[0] = v0;
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F28920];
  v7[2] = @"City";
  v7[3] = @"State";
  uint64_t v3 = *MEMORY[0x1E4F28950];
  v8[2] = v2;
  v8[3] = v3;
  v7[4] = @"ZipCode";
  v7[5] = @"Country";
  uint64_t v4 = *MEMORY[0x1E4F28928];
  v8[4] = *MEMORY[0x1E4F28960];
  v8[5] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  uint64_t v6 = (void *)addAddressComponentsInResult_toDictionary__subTypesToKeysDictionary;
  addAddressComponentsInResult_toDictionary__subTypesToKeysDictionary = v5;
}

+ (void)scanString:(id)a3 inRange:(id)a4 withScanner:(__DDScanner *)a5 options:(int64_t)a6 block:(id)a7
{
  id v15 = (unsigned int (**)(id, const void *, uint64_t))a7;
  if (DDScannerScanStringWithRange())
  {
    CFArrayRef v7 = (const __CFArray *)DDScannerCopyResultsWithOptions();
    if (v7)
    {
      CFArrayRef v8 = v7;
      CFIndex Count = CFArrayGetCount(v7);
      CFIndex v10 = Count - 1;
      if (Count >= 1)
      {
        CFIndex v11 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v11);
          uint64_t Category = DDResultGetCategory();
          if (v15[2](v15, ValueAtIndex, Category)) {
            BOOL v14 = v10 == v11;
          }
          else {
            BOOL v14 = 1;
          }
          ++v11;
        }
        while (!v14);
      }
      CFRelease(v8);
    }
  }
}

@end
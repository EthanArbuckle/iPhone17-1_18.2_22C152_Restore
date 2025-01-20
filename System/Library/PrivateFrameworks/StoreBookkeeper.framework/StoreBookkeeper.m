void sub_22B80ABDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_22B80BBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SBKGenericKeyValuePair *SBKKeyValuePayloadPairWithPreferredClass(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [a1 pairWithKVSKey:v6 kvsPayload:v5];
  }
  else
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [[SBKGenericKeyValuePair alloc] initWithKVSKey:v6 kvsPayload:v5];
  }
  v8 = v7;

  return v8;
}

void sub_22B80EE6C(_Unwind_Exception *a1)
{
}

void sub_22B80EFF0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_22B80F230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B80F690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

id shortArrayDescription(void *a1)
{
  v1 = (objc_class *)MEMORY[0x263F089D8];
  id v2 = a1;
  v3 = objc_msgSend([v1 alloc], "initWithCapacity:", 32 * objc_msgSend(v2, "count"));
  objc_msgSend(v3, "appendString:", @"(");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __shortArrayDescription_block_invoke;
  v6[3] = &unk_2648AF160;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  [v4 appendString:@""]);
  return v4;
}

void __shortArrayDescription_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    id v5 = @", ";
  }
  else {
    id v5 = @" ";
  }
  id v6 = a2;
  [v4 appendString:v5];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 description];

  [v7 appendString:v8];
}

id ErrorInfoWithUnderlyingError(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4
    && (uint64_t v5 = *MEMORY[0x263F08608],
        [v3 objectForKey:*MEMORY[0x263F08608]],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    if (v3) {
      id v8 = (id)[v3 mutableCopy];
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v7 = v8;
    [v8 setObject:v4 forKey:v5];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

id NSStringFromErrorCode(uint64_t a1)
{
  if (a1 > -2009)
  {
    if ((unint64_t)a1 <= 0xFFFFFFFFFFFFF827)
    {
      switch(a1)
      {
        case -2008:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeKeyBagLoadFailure"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965288;
          break;
        case -2007:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeKeyBagKillSwitch"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965289;
          break;
        case -2006:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeDisabled"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965290;
          break;
        case -2005:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeKillSwitch"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965291;
          break;
        case -2004:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeNetworkingBlocked"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965292;
          break;
        case -2003:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeUserClamp"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965293;
          break;
        case -2002:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeServerClamp"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965294;
          break;
        case -2001:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeAuthenticationClamp"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294965295;
          break;
        default:
          JUMPOUT(0);
      }
    }
    else
    {
      switch(a1)
      {
        case -1008:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeValidation"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966288;
          break;
        case -1007:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeGeneric"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966289;
          break;
        case -1006:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeStoreAccountUserCredentials"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966290;
          break;
        case -1005:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeStoreAccountUserCancelSignIn"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966291;
          break;
        case -1004:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeStoreAccountSessionExpired"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966292;
          break;
        case -1003:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeStoreAccountMismatch"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966293;
          break;
        case -1002:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeStoreAccountLoggedOut"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966294;
          break;
        case -1001:
          v1 = NSString;
          uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeNoStoreAccount"];
          id v3 = (void *)v2;
          uint64_t v4 = 4294966295;
          break;
        default:
          switch(a1)
          {
            case -4:
              v1 = NSString;
              uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeAuthenticationError"];
              id v3 = (void *)v2;
              uint64_t v4 = 4294967292;
              goto LABEL_38;
            case -3:
              v1 = NSString;
              uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeGenericBookkeeperServiceError"];
              id v3 = (void *)v2;
              uint64_t v4 = 4294967293;
              goto LABEL_38;
            case -2:
              v1 = NSString;
              uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeGenericValidationError"];
              id v3 = (void *)v2;
              uint64_t v4 = 4294967294;
              goto LABEL_38;
            case -1:
              v1 = NSString;
              uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeUnknown"];
              id v3 = (void *)v2;
              uint64_t v4 = 0xFFFFFFFFLL;
              goto LABEL_38;
            default:
              goto LABEL_20;
          }
      }
    }
    goto LABEL_38;
  }
  if (a1 <= -4002)
  {
    if (a1 == -4003)
    {
      v1 = NSString;
      uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeTimeout"];
      id v3 = (void *)v2;
      uint64_t v4 = 4294963293;
      goto LABEL_38;
    }
    if (a1 == -4002)
    {
      v1 = NSString;
      uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeDelegateCancelled"];
      id v3 = (void *)v2;
      uint64_t v4 = 4294963294;
      goto LABEL_38;
    }
LABEL_20:
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Error Code = %lld", a1);
    goto LABEL_39;
  }
  if (a1 == -4001)
  {
    v1 = NSString;
    uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeCancelled"];
    id v3 = (void *)v2;
    uint64_t v4 = 4294963295;
    goto LABEL_38;
  }
  if (a1 == -3002)
  {
    v1 = NSString;
    uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeMissingDomain"];
    id v3 = (void *)v2;
    uint64_t v4 = 4294964294;
    goto LABEL_38;
  }
  if (a1 != -3001) {
    goto LABEL_20;
  }
  v1 = NSString;
  uint64_t v2 = [NSString stringWithUTF8String:"SBKStoreErrorCodeMissingURL"];
  id v3 = (void *)v2;
  uint64_t v4 = 4294964295;
LABEL_38:
  uint64_t v5 = [v1 stringWithFormat:@"Error Code = %@ (%d)", v2, v4];

LABEL_39:
  return v5;
}

os_log_t _SBKLogCategoryDefault()
{
  os_log_t v0 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  return v0;
}

os_log_t _SBKLogCategorySync()
{
  os_log_t v0 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  return v0;
}

uint64_t _PreferencesDidChangeNotification(uint64_t a1, void *a2)
{
  CFPreferencesSynchronize(@"com.apple.storebookkeeper", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  return [a2 _preferencesDidChange];
}

uint64_t __TimestampStringFromNSTimeInterval_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)TimestampStringFromNSTimeInterval_dateFormatter;
  TimestampStringFromNSTimeInterval_dateFormatter = (uint64_t)v0;

  [(id)TimestampStringFromNSTimeInterval_dateFormatter setTimeStyle:3];
  uint64_t v2 = (void *)TimestampStringFromNSTimeInterval_dateFormatter;
  return [v2 setDateStyle:1];
}

id storageItemIdentifierForProperties(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v17;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = [v4 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v11 absoluteString];
LABEL_11:
        v13 = (void *)v12;

        v11 = v13;
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [v11 stringValue];
        goto LABEL_11;
      }
LABEL_12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v11 length])
      {

        goto LABEL_19;
      }
      [v5 appendString:v11];
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_16:

  if ([v5 length])
  {
    v14 = [MEMORY[0x263EFF8F8] SBKStringByMD5HashingString:v5];
  }
  else
  {
LABEL_19:
    v14 = 0;
  }

  return v14;
}

id valuesForProperties(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v5 = a1;
  id v6 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v4];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __valuesForProperties_block_invoke;
  v10[3] = &unk_2648AF188;
  id v8 = v6;
  id v11 = v8;
  [v5 enumerateValuesForProperties:v7 usingBlock:v10];

  return v8;
}

uint64_t __valuesForProperties_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) setObject:a3 forKey:a2];
  }
  return result;
}

id ErrorInfoWithUnderlyingError_925(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = *MEMORY[0x263F08608];
    id v3 = [0 objectForKey:*MEMORY[0x263F08608]];

    id v4 = 0;
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v4 setObject:v1 forKey:v2];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_22B8181F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__926(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__927(uint64_t a1)
{
}

void sub_22B818670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B81906C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_22B81B244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B81C378(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_22B81CFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B81E114(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1220(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1221(uint64_t a1)
{
}

void SBKLogProductionKeyBag()
{
  if (SBKLogProductionKeyBag_keybag)
  {
    NSLog(&cfstr_KeyBagContents.isa, SBKLogProductionKeyBag_keybag);
  }
  else
  {
    id v0 = (void *)MEMORY[0x263F7B350];
    uint64_t v1 = [MEMORY[0x263F7B358] contextWithBagType:0];
    id v2 = [v0 URLBagForContext:v1];

    [v2 loadWithCompletionBlock:&__block_literal_global_1282];
  }
}

void __SBKLogProductionKeyBag_block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)&SBKLogProductionKeyBag_keybag, a2);
  id v3 = a2;
  NSLog(&cfstr_KeyBagContents.isa, SBKLogProductionKeyBag_keybag);
}

void sub_22B820FD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_22B821374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_22B821910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1688(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230F4DE10](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1689(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__1891(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1892(uint64_t a1)
{
}

uint64_t ___serialGetValue_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x270F9A758]();
}

uint64_t ___serialSetValue_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22B826018(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B8260A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SBKStoreAccount()
{
  id v0 = [MEMORY[0x263F7B0E8] defaultStore];
  uint64_t v1 = [v0 activeAccount];

  return v1;
}

id SBKStoreAccountIdentifiers()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v1 = objc_msgSend(MEMORY[0x263F893C8], "defaultIdentityStore", 0);
  id v2 = [v1 userIdentitiesForManageableAccountsWithError:0];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = NSNumber;
        id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) accountDSID];
        uint64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
        [v0 addObject:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  v10 = (void *)[v0 copy];
  return v10;
}

id SBKStoreAccountLastSyncedIdentifier()
{
  return +[SBKStoreAuthenticationController lastSyncedAccountIdentifier];
}

id SBKStoreAccountLastFailedSyncIdentifier()
{
  return +[SBKStoreAuthenticationController lastFailedSyncAccountIdentifier];
}

id SBKStoreAccountIdentifierFromDatabasePath(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263F893C8] defaultIdentityStore];
  uint64_t v3 = [v2 userIdentitiesForManageableAccountsWithError:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(MEMORY[0x263F57448], "musicLibraryForUserAccount:", v8, (void)v15);
        v10 = [v9 databasePath];
        char v11 = [v10 isEqualToString:v1];

        if (v11)
        {
          long long v12 = NSNumber;
          long long v13 = [v8 accountDSID];
          uint64_t v5 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));

          goto LABEL_11;
        }
      }
      uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

uint64_t ISCopyDecompressedGZipDataForData()
{
  return MEMORY[0x270F88AD0]();
}

uint64_t ISCopyGzippedDataForData()
{
  return MEMORY[0x270F88AE0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x270EDA038](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x270EDA088](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}
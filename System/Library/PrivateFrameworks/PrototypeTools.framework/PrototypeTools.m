id PTLogObjectForTopic(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  if (PTLogObjectForTopic_onceToken != -1) {
    dispatch_once(&PTLogObjectForTopic_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)PTLogObjectForTopic___logObjects;
  v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
  v4 = [v2 objectForKey:v3];

  return v4;
}

void __PTLogObjectForTopic_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA60] dictionary];
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (i == 1) {
      v2 = "domain";
    }
    else {
      v2 = "settings";
    }
    if (i == 2) {
      v3 = "server";
    }
    else {
      v3 = v2;
    }
    os_log_t v4 = os_log_create("PrototypeTools", v3);
    if (v4)
    {
      v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:i];
      [v0 setObject:v4 forKey:v5];
    }
  }
  v6 = (void *)PTLogObjectForTopic___logObjects;
  PTLogObjectForTopic___logObjects = (uint64_t)v0;
}

id _NSStringFromRuntimeString(const char *a1)
{
  v1 = (void *)[[NSString alloc] initWithBytesNoCopy:a1 length:strlen(a1) encoding:4 freeWhenDone:0];
  return v1;
}

uint64_t PTInstallIsAppleInternal()
{
  if (PTInstallIsAppleInternal_onceToken != -1) {
    dispatch_once(&PTInstallIsAppleInternal_onceToken, &__block_literal_global_4);
  }
  return PTInstallIsAppleInternal_isAppleInternal;
}

uint64_t __PTInstallIsAppleInternal_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  PTInstallIsAppleInternal_isAppleInternal = result;
  return result;
}

void _handlePrototypingIsActiveNotification(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___handlePrototypingIsActiveNotification_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void sub_1BEC57DB8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, void *a15)
{
  v22 = v16;
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    v18 = PTLogObjectForTopic(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [*(id *)(v15 + 32) _domainID];
      uint64_t v20 = *(void *)(v15 + 40);
      v21 = [v17 reason];
      LODWORD(buf) = 138412802;
      *(void *)((char *)&buf + 4) = v19;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v20;
      a14 = 2112;
      a15 = v21;
      _os_log_impl(&dword_1BEC4F000, v18, OS_LOG_TYPE_DEFAULT, "Domain %@: can't invoke outlet at keypath %@ (%@)", (uint8_t *)&buf, 0x20u);
    }
    objc_end_catch();
    JUMPOUT(0x1BEC57D78);
  }
  _Unwind_Resume(a1);
}

void sub_1BEC58DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ___handlePrototypingIsActiveNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerWithServerIfNecessary];
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

void PTTransactionBegin(void *a1)
{
  id v1 = a1;
  v2 = _TransactionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __PTTransactionBegin_block_invoke;
  block[3] = &unk_1E63BC600;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

id _TransactionQueue()
{
  if (_TransactionQueue_onceToken != -1) {
    dispatch_once(&_TransactionQueue_onceToken, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)_TransactionQueue___queue;
  return v0;
}

void __PTTransactionBegin_block_invoke(uint64_t a1)
{
  v2 = _TransactionsByReason();
  id v5 = [v2 objectForKey:*(void *)(a1 + 32)];

  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = _TransactionsByReason();
    [v3 setObject:v5 forKey:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) UTF8String];
  os_log_t v4 = (void *)os_transaction_create();
  [v5 addObject:v4];
}

id _TransactionsByReason()
{
  if (_TransactionsByReason_onceToken != -1) {
    dispatch_once(&_TransactionsByReason_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)_TransactionsByReason___transactions;
  return v0;
}

void PTTransactionEnd(void *a1)
{
  id v1 = a1;
  v2 = _TransactionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __PTTransactionEnd_block_invoke;
  block[3] = &unk_1E63BC600;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void __PTTransactionEnd_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _TransactionsByReason();
  id v3 = [v2 objectForKey:*(void *)(a1 + 32)];

  if ([v3 count])
  {
    [v3 removeLastObject];
  }
  else
  {
    os_log_t v4 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1BEC4F000, v4, OS_LOG_TYPE_DEFAULT, "****** imbalanced transactions for reason '%@' -- please file a radar on PEP PrototypeTools ******", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t PTDebugServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19D57E8];
}

void PTDisableFileProtection(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28CB8];
  id v2 = a1;
  id v3 = [v1 defaultManager];
  uint64_t v5 = *MEMORY[0x1E4F28370];
  v6[0] = *MEMORY[0x1E4F28378];
  os_log_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 setAttributes:v4 ofItemAtPath:v2 error:0];
}

id PTHomeDirectory()
{
  uint64_t v0 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
  id v1 = v0;
  if (v0)
  {
    id v2 = v0;
  }
  else
  {
    NSHomeDirectory();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v3 = v2;

  return v3;
}

id PTPrototypeDirectory()
{
  if (PTPrototypeDirectory_onceToken != -1) {
    dispatch_once(&PTPrototypeDirectory_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)PTPrototypeDirectory___path;
  return v0;
}

void __PTPrototypeDirectory_block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PTHomeDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"Library/Prototyping"];
  id v2 = (void *)PTPrototypeDirectory___path;
  PTPrototypeDirectory___path = v1;

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = PTPrototypeDirectory___path;
  uint64_t v6 = *MEMORY[0x1E4F28320];
  v7[0] = @"mobile";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v5 error:0];

  PTDisableFileProtection((void *)PTPrototypeDirectory___path);
}

BOOL PTEqualFloats(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000011920929;
}

uint64_t PTObjectIsRecursivelyPlistable(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (objc_msgSend(v1, "bs_isPlistableType"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v2 = v1;
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v17 != v5) {
              objc_enumerationMutation(v2);
            }
            if (!PTObjectIsRecursivelyPlistable(*(void *)(*((void *)&v16 + 1) + 8 * i)))
            {

LABEL_26:
              goto LABEL_27;
            }
          }
          uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v7 = objc_msgSend(v2, "allKeys", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * j);
            v13 = [v2 objectForKey:v12];
            if (!PTObjectIsRecursivelyPlistable(v12)
              || !PTObjectIsRecursivelyPlistable(v13))
            {

              goto LABEL_26;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v14 = 1;
  }
  else
  {
LABEL_27:
    uint64_t v14 = 0;
  }

  return v14;
}

id PTPlistableClasses()
{
  if (PTPlistableClasses_onceToken != -1) {
    dispatch_once(&PTPlistableClasses_onceToken, &__block_literal_global_28);
  }
  uint64_t v0 = (void *)PTPlistableClasses_classes;
  return v0;
}

uint64_t __PTPlistableClasses_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  uint64_t v7 = PTPlistableClasses_classes;
  PTPlistableClasses_classes = v6;
  return MEMORY[0x1F41817F8](v6, v7);
}

uint64_t PTValidateDictionary(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = objc_msgSend(v2, "objectForKeyedSubscript:", v7, (void)v12);
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              continue;
            }
          }
          uint64_t v10 = 0;
          goto LABEL_15;
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v10 = 1;
        if (v4) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
LABEL_15:
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t PTValidateArray(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t PTValidateSet(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t PTValidatePredicate(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 _allowsEvaluation])
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v4 = +[_PTPredicateValidator validatorWithPredicate:]((uint64_t)_PTPredicateValidator, v2);
      uint64_t v3 = -[_PTPredicateValidator evaluate]((uint64_t)v4);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t PTRowClassIsWhitelistedForRemoteEditing(void *a1)
{
  if (_RowWhitelist_onceToken != -1) {
    dispatch_once(&_RowWhitelist_onceToken, &__block_literal_global_45);
  }
  id v2 = (void *)_RowWhitelist_whitelist;
  return _ClassIsCodableAndWhitelisted(a1, v2);
}

uint64_t _ClassIsCodableAndWhitelisted(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = [a2 containsObject:a1];
  unsigned int v4 = [a1 conformsToProtocol:&unk_1F19D23E0];
  char v5 = v4;
  uint64_t result = v3 & v4;
  if (v3 && (v5 & 1) == 0)
  {
    uint64_t v7 = PTLogObjectForTopic(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      long long v9 = a1;
      _os_log_impl(&dword_1BEC4F000, v7, OS_LOG_TYPE_DEFAULT, "%@ is whitelisted for remote editing, but does not conform to NSSecureCoding", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
  return result;
}

uint64_t PTRowActionClassIsWhitelistedForRemoteEditing(void *a1)
{
  if (_RowActionWhitelist_onceToken != -1) {
    dispatch_once(&_RowActionWhitelist_onceToken, &__block_literal_global_54);
  }
  id v2 = (void *)_RowActionWhitelist_whitelist;
  return _ClassIsCodableAndWhitelisted(a1, v2);
}

__CFString *PTPrototypingEventName(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E63BC738[a1];
  }
}

__CFString *PTPrototypingEventShortName(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E63BC760[a1];
  }
}

uint64_t PTPrototypingEventAvailable(uint64_t a1)
{
  if (PTPrototypingEventAvailable_onceToken != -1) {
    dispatch_once(&PTPrototypingEventAvailable_onceToken, &__block_literal_global_6);
  }
  id v2 = (void *)PTPrototypingEventAvailable___availableEvents;
  int v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __PTPrototypingEventAvailable_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v1 = (void *)PTPrototypingEventAvailable___availableEvents;
  PTPrototypingEventAvailable___availableEvents = (uint64_t)v0;

  if (MGGetBoolAnswer())
  {
    [(id)PTPrototypingEventAvailable___availableEvents addObject:&unk_1F19D0010];
    [(id)PTPrototypingEventAvailable___availableEvents addObject:&unk_1F19D0028];
  }
  if (MGGetBoolAnswer()) {
    [(id)PTPrototypingEventAvailable___availableEvents addObject:&unk_1F19D0040];
  }
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    int v3 = (void *)PTPrototypingEventAvailable___availableEvents;
    return [v3 addObject:&unk_1F19D0058];
  }
  return result;
}

void PTPrototypingEnumerateHardwareEventsWithBlock(void *a1)
{
  id v1 = a1;
  char v2 = 0;
  v1[2](v1, 1, &v2);
  if (!v2)
  {
    v1[2](v1, 2, &v2);
    if (!v2)
    {
      v1[2](v1, 3, &v2);
      if (!v2) {
        v1[2](v1, 4, &v2);
      }
    }
  }
}

__CFString *PTPrototypingEventsDescription(void *a1)
{
  id v1 = a1;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __PTPrototypingEventsDescription_block_invoke;
  v14[3] = &unk_1E63BC6F0;
  id v2 = v1;
  id v15 = v2;
  long long v16 = &v17;
  PTPrototypingEnumerateHardwareEventsWithBlock(v14);
  if (v18[3])
  {
    int v3 = [MEMORY[0x1E4F28E78] string];
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    uint64_t v13 = 0;
    uint64_t v13 = v18[3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __PTPrototypingEventsDescription_block_invoke_2;
    v8[3] = &unk_1E63BC718;
    id v9 = v2;
    id v4 = v3;
    id v10 = v4;
    long long v11 = v12;
    PTPrototypingEnumerateHardwareEventsWithBlock(v8);
    char v5 = v10;
    uint64_t v6 = (__CFString *)v4;

    _Block_object_dispose(v12, 8);
  }
  else
  {
    uint64_t v6 = @"no events";
  }

  _Block_object_dispose(&v17, 8);
  return v6;
}

void sub_1BEC5DB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __PTPrototypingEventsDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

uint64_t __PTPrototypingEventsDescription_block_invoke_2(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if (result)
  {
    if (a2 > 4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = off_1E63BC760[a2];
    }
    [*(id *)(a1 + 40) appendString:v7];
    unint64_t v8 = --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v8 < 2)
    {
      uint64_t v9 = *(void **)(a1 + 40);
      if (v8 != 1)
      {
        uint64_t result = [v9 appendString:@" events"];
        *a3 = 1;
        return result;
      }
      id v10 = @" and ";
    }
    else
    {
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = @", ";
    }
    return [v9 appendString:v10];
  }
  return result;
}

id _ParameterRecordsPath()
{
  id v0 = PTPrototypeDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"ParameterRecords.archive"];

  return v1;
}

void sub_1BEC61E08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id _ProxyDefinitionDirectory()
{
  if (_ProxyDefinitionDirectory_onceToken != -1) {
    dispatch_once(&_ProxyDefinitionDirectory_onceToken, &__block_literal_global_8);
  }
  id v0 = (void *)_ProxyDefinitionDirectory___path;
  return v0;
}

id _SettingsArchiveDirectory()
{
  if (_SettingsArchiveDirectory_onceToken != -1) {
    dispatch_once(&_SettingsArchiveDirectory_onceToken, &__block_literal_global_7);
  }
  id v0 = (void *)_SettingsArchiveDirectory___path;
  return v0;
}

id _DomainInfoPath()
{
  id v0 = PTPrototypeDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"DomainInfo.archive"];

  return v1;
}

id _TestRecipeInfoPath()
{
  id v0 = PTPrototypeDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"TestRecipeInfo.archive"];

  return v1;
}

id _ProxyDefinitionPath(void *a1)
{
  id v1 = [a1 stringByAppendingPathExtension:@"archive"];
  uint64_t v2 = _ProxyDefinitionDirectory();
  int v3 = [v2 stringByAppendingPathComponent:v1];

  return v3;
}

id _SettingsArchivePath(void *a1)
{
  id v1 = [a1 stringByAppendingPathExtension:@"settings"];
  uint64_t v2 = _SettingsArchiveDirectory();
  int v3 = [v2 stringByAppendingPathComponent:v1];

  return v3;
}

void _ValidateUnarchivedDictionary(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"Dictionary validation failed: putative dictionary is a %@", objc_opt_class() format];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = ___ValidateUnarchivedDictionary_block_invoke;
  v6[3] = &__block_descriptor_48_e15_v32__0_8_16_B24lu32l8u40l8;
  v6[4] = a2;
  v6[5] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

id _ReadInfo(void *a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v21 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    long long v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), a2, 0);
    id v22 = 0;
    uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v12 fromData:v6 error:&v22];
    id v14 = v22;
    if (v13)
    {
      uint64_t v15 = objc_opt_class();
      _ValidateUnarchivedDictionary(v13, v15, a2);

      long long v16 = (void *)[v13 mutableCopy];
      goto LABEL_11;
    }
    long long v18 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v21;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_1BEC4F000, v18, OS_LOG_TYPE_DEFAULT, "Error unarchiving persisted %@: %@", buf, 0x16u);
    }

    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v19 removeItemAtPath:v5 error:0];
  }
  else
  {
    uint64_t v17 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v21;
      _os_log_impl(&dword_1BEC4F000, v17, OS_LOG_TYPE_DEFAULT, "No persisted %@", buf, 0xCu);
    }
  }
  long long v16 = [MEMORY[0x1E4F1CA60] dictionary];
LABEL_11:

  return v16;
}

void sub_1BEC62784(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(a1);
    uint64_t v19 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412546;
      *(void *)((char *)&buf + 4) = a15;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v18;
      _os_log_impl(&dword_1BEC4F000, v19, OS_LOG_TYPE_DEFAULT, "Error reading persisted %@: %@@", (uint8_t *)&buf, 0x16u);
    }

    uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v20 removeItemAtPath:v17 error:0];

    objc_end_catch();
    JUMPOUT(0x1BEC62710);
  }
  _Unwind_Resume(a1);
}

id _PTReadDomainInfo()
{
  id v0 = _DomainInfoPath();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = _ReadInfo(v0, v1, @"domain info");

  return v2;
}

void _PTWriteDomainInfo(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  uint64_t v1 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v10];
  id v2 = v10;
  if (!v1) {
    goto LABEL_3;
  }
  int v3 = _DomainInfoPath();
  id v9 = v2;
  char v4 = [v1 writeToFile:v3 options:1 error:&v9];
  id v5 = v9;

  id v2 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = _DomainInfoPath();
      uint64_t v8 = [v2 localizedDescription];
      *(_DWORD *)buf = 138412546;
      long long v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to write domain dictionary to file %@: %@", buf, 0x16u);
    }
  }
}

id _PTReadTestRecipeInfo()
{
  id v0 = _TestRecipeInfoPath();
  uint64_t v1 = objc_opt_class();
  id v2 = _ReadInfo(v0, v1, @"test recipe info");

  return v2;
}

void _PTWriteTestRecipeInfo(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  uint64_t v1 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v10];
  id v2 = v10;
  if (!v1) {
    goto LABEL_3;
  }
  int v3 = _DomainInfoPath();
  id v9 = v2;
  char v4 = [v1 writeToFile:v3 options:1 error:&v9];
  id v5 = v9;

  id v2 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = _DomainInfoPath();
      uint64_t v8 = [v2 localizedDescription];
      *(_DWORD *)buf = 138412546;
      long long v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to write test recipe dictionary to file %@: %@", buf, 0x16u);
    }
  }
}

id _PTReadSettingsProxyDefinition(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = _ProxyDefinitionPath(a1);
  id v11 = 0;
  id v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v1 options:0 error:&v11];
  id v3 = v11;
  if (v2)
  {
    id v10 = v3;
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v10];
    id v5 = v10;

    if (v4)
    {
      id v4 = v4;
      uint64_t v6 = v4;
    }
    else
    {
      uint64_t v7 = PTLogObjectForTopic(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_1BEC4F000, v7, OS_LOG_TYPE_DEFAULT, "Error unarchiving persisted proxy definition: %@", buf, 0xCu);
      }

      uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v8 removeItemAtPath:v1 error:0];

      uint64_t v6 = 0;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v4 removeItemAtPath:v1 error:0];
    uint64_t v6 = 0;
    id v5 = v3;
  }

  return v6;
}

void _PTWriteSettingsProxyDefinition(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v7];
  id v5 = v7;
  if (v4)
  {
    uint64_t v6 = _ProxyDefinitionPath(v3);
    [v4 writeToFile:v6 atomically:1];
  }
  else
  {
    uint64_t v6 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to archive proxy definition: %@", buf, 0xCu);
    }
  }
}

id _PTReadSettingsArchive(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = _SettingsArchivePath(a1);
  id v12 = 0;
  id v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v1 options:0 error:&v12];
  id v3 = v12;
  if (v2)
  {
    id v11 = 0;
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:1 format:0 error:&v11];
    id v5 = v11;

    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = v4;
        uint64_t v6 = v4;
        goto LABEL_11;
      }
      id v7 = PTLogObjectForTopic(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v1;
        _os_log_impl(&dword_1BEC4F000, v7, OS_LOG_TYPE_DEFAULT, "Non-dictionary archive at path %@", buf, 0xCu);
      }
    }
    else
    {
      id v7 = PTLogObjectForTopic(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v5 localizedDescription];
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = v1;
        __int16 v15 = 2112;
        long long v16 = v8;
        _os_log_impl(&dword_1BEC4F000, v7, OS_LOG_TYPE_DEFAULT, "Unable to deserialize settings archive at path %@: %@", buf, 0x16u);
      }
    }

    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 removeItemAtPath:v1 error:0];

    uint64_t v6 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v4 removeItemAtPath:v1 error:0];
    uint64_t v6 = 0;
    id v5 = v3;
  }
LABEL_11:

  return v6;
}

void _PTWriteSettingsArchive(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v13 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a1 format:200 options:0 error:&v13];
  id v5 = v13;
  if (v4)
  {
    uint64_t v6 = _SettingsArchivePath(v3);
    id v12 = v5;
    char v7 = [v4 writeToFile:v6 options:1 error:&v12];
    id v8 = v12;

    if ((v7 & 1) == 0)
    {
      id v9 = PTLogObjectForTopic(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v8 localizedDescription];
        *(_DWORD *)buf = 138412546;
        __int16 v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1BEC4F000, v9, OS_LOG_TYPE_DEFAULT, "Unable to write settings archive data to path %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v6 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412546;
      __int16 v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to serialize settings archive for domain %@: %@", buf, 0x16u);
    }
    id v8 = v5;
  }
}

void _PTClearSettingsArchive(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28CB8];
  id v2 = a1;
  id v4 = [v1 defaultManager];
  id v3 = _SettingsArchivePath(v2);

  [v4 removeItemAtPath:v3 error:0];
}

void _PTMigrateIfNecessary()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v0 = +[PTDefaults sharedInstance];
  uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v0 shouldClearPrototypeCachesForMigration])
  {
    [v0 setShouldClearPrototypeCachesForMigration:0];
    id v2 = _DomainInfoPath();
    [v1 removeItemAtPath:v2 error:0];

    id v3 = _TestRecipeInfoPath();
    [v1 removeItemAtPath:v3 error:0];
  }
  if ([v0 shouldClearSettingsArchivesForMigration])
  {
    [v0 setShouldClearSettingsArchivesForMigration:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = _SettingsArchiveDirectory();
    id v5 = objc_msgSend(v1, "contentsOfDirectoryAtPath:error:", v4, 0, 0);

    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
          id v11 = _SettingsArchiveDirectory();
          id v12 = [v11 stringByAppendingPathComponent:v10];
          [v1 removeItemAtPath:v12 error:0];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
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

void sub_1BEC67778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC67DF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t PTDomainServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19D5600];
}

uint64_t PTDomainClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19D3640];
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1F40F4AC0](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1F40E7118](userName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181AF0](proto, outCount);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}
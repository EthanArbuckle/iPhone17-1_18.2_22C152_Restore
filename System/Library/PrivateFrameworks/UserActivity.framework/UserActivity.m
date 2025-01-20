void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1B3DF7AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DF7C78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B3DF7D18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B3DF7DE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3DF7F08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B3DF7FD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B3DF834C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DF872C(_Unwind_Exception *a1)
{
  v5 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

uint64_t recurse(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = v3;
  id v7 = v5;
  v8 = (uint64_t (**)(id, void *))v4;
  v26 = v6;
  if (([v7 containsObject:v6] & 1) == 0)
  {
    [v7 addObject:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v4;
      id v10 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = [v10 allKeys];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        id v24 = v3;
        uint64_t v13 = *(void *)v28;
        LOBYTE(v9) = 1;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v16 = objc_msgSend(v10, "objectForKey:", v15, v24, v25);
            if ((v9 & 1) != 0 && v8[2](v8, v15)) {
              uint64_t v9 = v8[2](v8, v16);
            }
            else {
              uint64_t v9 = 0;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
        goto LABEL_41;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v11 = v6;
        uint64_t v17 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v28;
          LOBYTE(v9) = 1;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v11);
              }
              if (v9) {
                uint64_t v9 = v8[2](v8, *(void **)(*((void *)&v27 + 1) + 8 * j));
              }
              else {
                uint64_t v9 = 0;
              }
            }
            uint64_t v17 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v17);
          goto LABEL_41;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = v8[2](v8, v6);
          goto LABEL_42;
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v11 = v6;
        uint64_t v20 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v28;
          LOBYTE(v9) = 1;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v11);
              }
              if (v9) {
                uint64_t v9 = v8[2](v8, *(void **)(*((void *)&v27 + 1) + 8 * k));
              }
              else {
                uint64_t v9 = 0;
              }
            }
            uint64_t v20 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v20);
          goto LABEL_41;
        }
      }
    }
    uint64_t v9 = 1;
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v9 = 1;
LABEL_42:

  return v9;
}

void sub_1B3DF8BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t ___Z21acceptableForUserInfoP12NSDictionary_block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  id v3 = v2;
  if (v2) {
    uint64_t v4 = objectIsOfAcceptableClassForUserInfo(v2);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1B3DF8CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t objectIsOfAcceptableClassForUserInfo(objc_object *a1)
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&objectIsOfAcceptableClassForUserInfo(objc_object *)::sLock);
  v2 = (void *)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
  if (!objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses)
  {
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    v16[5] = objc_opt_class();
    v16[6] = objc_opt_class();
    v16[7] = objc_opt_class();
    v16[8] = objc_opt_class();
    v16[9] = objc_opt_class();
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v16 count:10];
    uint64_t v4 = (void *)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
    objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses = v3;

    for (uint64_t i = 9; i != -1; --i)
    v2 = (void *)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
  }
  if ([v2 containsObject:objc_opt_class()])
  {
    uint64_t v6 = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = (id)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
    uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t j = 0; j != v6; ++j)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v7);
          }
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend((id)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses, "addObject:", objc_opt_class(), v11);
            uint64_t v6 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&objectIsOfAcceptableClassForUserInfo(objc_object *)::sLock);

  return v6;
}

void sub_1B3DF8F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ___ZL25dictionaryContainsFileURLP12NSDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 isFileURL];
  }
  BOOL v5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;

  return v5;
}

void sub_1B3DF9050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL differ(objc_object *a1, objc_object *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  BOOL v6 = v3 != v4 && (!v3 || !v4 || ([(objc_object *)v3 isEqual:v4] & 1) == 0);

  return v6;
}

void sub_1B3DF90DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DF9728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,id a21,id a22)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  objc_destroyWeak(&a22);

  _Unwind_Resume(a1);
}

id uaUserActivityObjectsMap(void)
{
  if (uaUserActivityObjectsMap(void)::sOnce != -1) {
    dispatch_once(&uaUserActivityObjectsMap(void)::sOnce, &__block_literal_global_854);
  }
  v0 = (void *)uaUserActivityObjectsMap(void)::sResult;

  return v0;
}

__CFString *trimmedString(void *a1, unsigned int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 length];
    if (v5 <= a2)
    {
      uint64_t v9 = v4;
    }
    else
    {
      BOOL v6 = NSString;
      id v7 = objc_msgSend(v4, "substringWithRange:", 0, a2 >> 1);
      uint64_t v8 = objc_msgSend(v4, "substringWithRange:", v5 - (a2 >> 1), a2 >> 1);
      uint64_t v9 = [v6 stringWithFormat:@"%@..(%ld)..%@", v7, v5 - a2, v8];
    }
  }
  else
  {
    uint64_t v9 = &stru_1F0CB4508;
  }

  return v9;
}

void sub_1B3DF9A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

objc_object *deepMutableCopyOnce(objc_object *a1, NSMutableDictionary *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    BOOL v6 = [(NSMutableDictionary *)v4 objectForKey:v3];

    if (v6)
    {
      id v7 = [(NSMutableDictionary *)v5 objectForKey:v3];
LABEL_4:
      uint64_t v8 = v7;
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = (objc_object *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)v5 setObject:v8 forKey:v3];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v9 = [(objc_object *)v3 allKeys];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v38 != v11) {
              objc_enumerationMutation(v9);
            }
            long long v13 = *(objc_object **)(*((void *)&v37 + 1) + 8 * i);
            long long v14 = deepMutableCopyOnce(v13, v5);
            v15 = [(objc_object *)v3 objectForKey:v13];
            v16 = deepMutableCopyOnce(v15, v5);

            if (v14) {
              BOOL v17 = v16 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (!v17) {
              [(objc_object *)v8 setObject:v16 forKey:v14];
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v10);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = (objc_object *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(NSMutableDictionary *)v5 setObject:v8 forKey:v3];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v18 = v3;
        uint64_t v19 = [(objc_object *)v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = deepMutableCopyOnce(*(objc_object **)(*((void *)&v33 + 1) + 8 * j), v5);
              [(objc_object *)v8 addObject:v22];
            }
            uint64_t v19 = [(objc_object *)v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v19);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (objc_opt_respondsToSelector()) {
            id v7 = (objc_object *)[(objc_object *)v3 copy];
          }
          else {
            id v7 = v3;
          }
          goto LABEL_4;
        }
        uint64_t v8 = (objc_object *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [(NSMutableDictionary *)v5 setObject:v8 forKey:v3];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v23 = v3;
        uint64_t v24 = [(objc_object *)v23 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v30;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v30 != v25) {
                objc_enumerationMutation(v23);
              }
              long long v27 = deepMutableCopyOnce(*(objc_object **)(*((void *)&v29 + 1) + 8 * k), v5);
              -[objc_object addObject:](v8, "addObject:", v27, (void)v29);
            }
            uint64_t v24 = [(objc_object *)v23 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v24);
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_38:

  return v8;
}

void sub_1B3DF9E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DFA43C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3DFA540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DFA5C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id getUAUserActivityToNSUserActivityMap(void)
{
  if (getUAUserActivityToNSUserActivityMap(void)::sOnce != -1) {
    dispatch_once(&getUAUserActivityToNSUserActivityMap(void)::sOnce, &__block_literal_global_870);
  }
  v0 = (void *)getUAUserActivityToNSUserActivityMap(void)::sResult;

  return v0;
}

id biomeInfoLogging()
{
  if (biomeInfoLogging::sOnce != -1) {
    dispatch_once(&biomeInfoLogging::sOnce, &__block_literal_global_7);
  }
  v0 = (void *)biomeInfoLogging::sLog;

  return v0;
}

id _uaGetLogForCategory(void *a1)
{
  v1 = a1;
  if (!v1)
  {
    v2 = getenv("_UALOGGINGCATEGORY");
    if (!v2
      || ([NSString stringWithCString:v2 encoding:4],
          (v1 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v1 = @"main";
    }
  }
  if (pthread_mutex_lock(&_uaGetLogForCategory::sLock))
  {
    id v3 = 0;
  }
  else
  {
    id v4 = (void *)_uaGetLogForCategory::sLogs;
    if (!_uaGetLogForCategory::sLogs)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      BOOL v6 = (void *)_uaGetLogForCategory::sLogs;
      _uaGetLogForCategory::sLogs = v5;

      id v4 = (void *)_uaGetLogForCategory::sLogs;
    }
    id v3 = [v4 objectForKey:v1];
    if (!v3)
    {
      id v7 = v1;
      os_log_t v8 = os_log_create("com.apple.useractivity", (const char *)[(__CFString *)v7 cStringUsingEncoding:4]);
      if (v8)
      {
        id v3 = v8;
        [(id)_uaGetLogForCategory::sLogs setValue:v8 forKey:v7];
      }
      else
      {
        id v3 = (void *)MEMORY[0x1E4F14500];
        id v9 = MEMORY[0x1E4F14500];
      }
    }
    pthread_mutex_unlock(&_uaGetLogForCategory::sLock);
  }

  return v3;
}

void sub_1B3DFA960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *suggestedActionTypeString(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0xA && ((0x217u >> v1))
  {
    v2 = off_1E6083350[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UASuggestedActionType=%ld", a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id deepMutableCopy(objc_object *a1)
{
  uint64_t v1 = a1;
  v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = deepMutableCopyOnce(v1, v2);

  return v3;
}

void sub_1B3DFAA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1B3DFAF48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DFB1DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void __validDictionaryTypes_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  char valid = 0;
  if (a2 && v7)
  {
    uint64_t v11 = v7;
    id v9 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char valid = validType(v11);
    }
    else {
      char valid = 0;
    }
    id v7 = v11;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = valid;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
}

void sub_1B3DFB3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3DFB614(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

uint64_t __validType_block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = validType(a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void sub_1B3DFB8BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

id copyNSStringOrSubclass(NSString *a1)
{
  uint64_t v1 = a1;
  if ([(NSString *)v1 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v2 = [(NSString *)v1 copy];
LABEL_3:
    id v3 = (void *)v2;
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [NSString stringWithString:v1];
    goto LABEL_3;
  }
  id v3 = 0;
LABEL_8:

  return v3;
}

void sub_1B3DFB9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DFBC78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3DFBE08(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1B3DFC068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3DFC0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DFC2EC()
{
  objc_end_catch();
  JUMPOUT(0x1B3DFC1B8);
}

void sub_1B3DFC3B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getUserActivityObserversCopy()
{
  id v0 = (id)getUserActivityObservers(BOOL)::sResult;
  objc_sync_enter(v0);
  uint64_t v1 = (void *)[v0 copy];
  objc_sync_exit(v0);

  return v1;
}

void sub_1B3DFC7AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void encodeString(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  id v6 = a3;
  if (v8 && v5 && v6)
  {
    if ([v5 isMemberOfClass:objc_opt_class()])
    {
      encodeObject(v8, v5, v6);
    }
    else
    {
      id v7 = [NSString stringWithString:v5];
      if (v7) {
        encodeObject(v8, v5, v6);
      }
    }
  }
}

void encodeObjectOfType(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a1;
  id v7 = a2;
  id v8 = a4;
  if (v9 && v7 && v8 && (!a3 || (objc_opt_isKindOfClass() & 1) != 0)) {
    encodeObject(v9, v7, v8);
  }
}

uint64_t encodeObject(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  uint64_t v9 = 0;
  if (v5 && v6 && v7)
  {
    [v5 encodeObject:v6 forKey:v7];
    uint64_t v9 = 1;
  }

  return v9;
}

void sub_1B3DFD150(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void encodeURL(void *a1, void *a2, void *a3)
{
  if (a1 && a2 && a3)
  {
    id v5 = a3;
    id v6 = a1;
    id v7 = [a2 absoluteURL];
    encodeObject(v6, v7, v5);
  }
}

void sub_1B3DFD308(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void encodeSet(void *a1, void *a2, void *a3)
{
  id v7 = a1;
  id v5 = a2;
  id v6 = a3;
  if (validType(v5)) {
    encodeObject(v7, v5, v6);
  }
}

uint64_t validType(void *a1)
{
  id v1 = a1;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v2 = 1;
LABEL_10:
      *((unsigned char *)v12 + 24) = v2;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v10;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      id v6 = &unk_1E6083078;
      id v7 = __validType_block_invoke;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __validType_block_invoke_3;
          v8[3] = &unk_1E6083050;
          v8[4] = &v11;
          [v1 enumerateKeysAndObjectsUsingBlock:v8];
          goto LABEL_11;
        }
        char v2 = 0;
        goto LABEL_10;
      }
      id v5 = v9;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      id v6 = &unk_1E60830A0;
      id v7 = __validType_block_invoke_2;
    }
    v5[2] = v7;
    v5[3] = v6;
    v5[4] = &v11;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:");
  }
LABEL_11:
  uint64_t v3 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v3;
}

void sub_1B3DFD6A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B3DFD82C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3DFD9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void encodeDictionary(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v5)
  {
    if (v6)
    {
      if (v7)
      {
        id v9 = v6;
        uint64_t v12 = 0;
        uint64_t v13 = &v12;
        uint64_t v14 = 0x2020000000;
        BOOL v15 = 0;
        BOOL v15 = [v9 count] == 0;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __validDictionaryTypes_block_invoke;
        v11[3] = &unk_1E6083050;
        v11[4] = &v12;
        [v9 enumerateKeysAndObjectsUsingBlock:v11];
        int v10 = *((unsigned __int8 *)v13 + 24);
        _Block_object_dispose(&v12, 8);

        if (v10) {
          [v5 encodeObject:v9 forKey:v8];
        }
      }
    }
  }
}

void sub_1B3DFDB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3DFE42C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SFPeerDeviceFunction()
{
  return (id)classSFPeerDevice;
}

id SFPeerDeviceFunction_0()
{
  return (id)classSFPeerDevice_0;
}

void sub_1B3DFE594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void encodeData(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = a1;
  uint64_t v7 = objc_opt_class();
  encodeObjectOfType(v8, v6, v7, v5);
}

Class initSFPeerDevice()
{
  if (LoadSharing_loadPredicate != -1) {
    dispatch_once(&LoadSharing_loadPredicate, &__block_literal_global_474);
  }
  Class result = objc_getClass("SFPeerDevice");
  classSFPeerDevice = (uint64_t)result;
  getSFPeerDeviceClass = (uint64_t (*)())SFPeerDeviceFunction;
  return result;
}

Class initSFPeerDevice_0()
{
  if (LoadSharing_loadPredicate_0 != -1) {
    dispatch_once(&LoadSharing_loadPredicate_0, &__block_literal_global_116);
  }
  Class result = objc_getClass("SFPeerDevice");
  classSFPeerDevice_0 = (uint64_t)result;
  getSFPeerDeviceClass_0 = (uint64_t (*)())SFPeerDeviceFunction_0;
  return result;
}

void sub_1B3DFE848(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    uint64_t v18 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v9 uniqueIdentifier];
      uint64_t v20 = [v19 UUIDString];
      LODWORD(a9) = 138543618;
      *(void *)((char *)&a9 + 4) = v20;
      WORD6(a9) = 2114;
      *(void *)((char *)&a9 + 14) = v17;
      _os_log_impl(&dword_1B3DF6000, v18, OS_LOG_TYPE_INFO, "failed to encode contentAttributeSet of activity %{public}@ with exception %{public}@", (uint8_t *)&a9, 0x16u);
    }
    ((void (**)(void, void *, void, void, void))v12)[2](v12, v11, 0, 0, 0);

    objc_end_catch();
    JUMPOUT(0x1B3DFE800);
  }

  _Unwind_Resume(a1);
}

void sub_1B3DFEB14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___ZL24getUserActivityObserversb_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = (void *)getUserActivityObservers(BOOL)::sResult;
  getUserActivityObservers(BOOL)::sResult = (uint64_t)v0;
}

void sub_1B3DFEC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1B3DFEDB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t cmp_write_bin8_marker(uint64_t a1, char a2)
{
  char v6 = a2;
  char v7 = -60;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    char v4 = 8;
    goto LABEL_5;
  }
  uint64_t v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    char v4 = 15;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

void sub_1B3DFF0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSSearchableIndexFunction(void)
{
  return (id)classCSSearchableIndex;
}

id stringForContentSet(void *a1)
{
  uint64_t v1 = [a1 description];
  char v2 = stringRemovingNewlines(v1);

  return v2;
}

void sub_1B3DFF218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3DFFBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E002C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

id trimmedHexStringForData(void *a1, uint64_t a2)
{
  id v20 = a1;
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"$"];
  id v4 = v20;
  uint64_t v21 = [v4 bytes];
  unint64_t v5 = [v4 length];
  unint64_t v6 = v5;
  if (a2 >= 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = a2 + 1;
  }
  uint64_t v8 = v7 >> 1;
  if (v5 >= a2) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v5;
  }
  if (v9)
  {
    int v10 = (unsigned __int8 *)v21;
    unint64_t v11 = v9;
    do
    {
      unsigned int v12 = *v10++;
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c", a0123456789abcd[(unint64_t)v12 >> 4], a0123456789abcd[v12 & 0xF]);
      [v3 appendString:v13];

      --v11;
    }
    while (v11);
  }
  if (v6 > v9)
  {
    objc_msgSend(v3, "appendFormat:", @".. %ld ..", v6);
    if (v6 - v9 < v6)
    {
      uint64_t v14 = -(uint64_t)v9;
      unint64_t v15 = v21 + v6;
      do
      {
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c", a0123456789abcd[(unint64_t)*(unsigned __int8 *)(v15 + v14) >> 4], a0123456789abcd[*(unsigned char *)(v15 + v14) & 0xF]);
        [v3 appendString:v16];
      }
      while (!__CFADD__(v14++, 1));
    }
  }
  uint64_t v18 = (void *)[v3 copy];

  return v18;
}

void sub_1B3E005C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

CFDataRef UAMessagePack::CopyPacked(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = a1;
  UAMessagePack::UAMessagePack((uint64_t)&v12, a2, a3, a4);
  if (v7 && UAMessagePack::writeObject((UAMessagePack *)&v12, v7))
  {
    uint64_t v8 = (const UInt8 *)[v13 bytes];
    CFIndex v9 = [v13 length];
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8, v9);
  }
  else
  {
    CFDataRef v10 = 0;
  }

  return v10;
}

void sub_1B3E006D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t UAMessagePack::writeObject(UAMessagePack *this, objc_object *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = *((void *)this + 6);
  if (v4 && (*(unsigned int (**)(uint64_t, objc_object *, void))(v4 + 16))(v4, v3, *(void *)this))
  {
    unint64_t v5 = (NSNumber *)(*(uint64_t (**)(void))(*((void *)this + 7) + 16))();
  }
  else
  {
    unint64_t v5 = (NSNumber *)v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cmp_write_array((uint64_t)this + 16, [(NSNumber *)v5 count]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    unint64_t v6 = v5;
    uint64_t v7 = [(NSNumber *)v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v6);
          }
          if ((UAMessagePack::writeObject(this, *(objc_object **)(*((void *)&v44 + 1) + 8 * i)) & 1) == 0)
          {

            goto LABEL_31;
          }
        }
        uint64_t v7 = [(NSNumber *)v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cmp_write_map((uint64_t)this + 16, [(NSNumber *)v5 count]);
    [(NSNumber *)v5 keyEnumerator];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v41;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(objc_object **)(*((void *)&v40 + 1) + 8 * j);
          if (UAMessagePack::writeObject(this, v14))
          {
            id v15 = [(NSNumber *)v5 objectForKeyedSubscript:v14];
            char v16 = UAMessagePack::writeObject(this, v15);

            if (v16) {
              continue;
            }
          }

          goto LABEL_31;
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v5;
    uint64_t v18 = (const char *)[(NSNumber *)v17 UTF8String];
    uint64_t v19 = (uint64_t)v18;
    if (v18)
    {
      unsigned int v20 = strlen(v18);
      cmp_write_str((uint64_t)this + 16, v19, v20);
    }
    else
    {
      size[0] = 0;
      uint64_t v22 = [(NSNumber *)v17 length];
      int v23 = -[NSNumber getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v17, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0, size, 4, 0, 0, v22, 0);
      if (size[0] >= 0x7FFFFFFF) {
        int v23 = 0;
      }
      if (v23 == 1)
      {
        uint64_t v24 = malloc_type_malloc(size[0], 0xF0642784uLL);
        if (v24)
        {
          if (-[NSNumber getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v17, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v24, size[0], 0, 4, 0, 0, v22, 0))cmp_write_str((uint64_t)this + 16, (uint64_t)v24, size[0]); {
          free(v24);
          }
        }
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    UAMessagePack::writeNumber(this, v5);
LABEL_44:
    uint64_t v21 = 1;
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cmp_write_nil((uint64_t)this + 16);
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = v5;
    cmp_write_bin((uint64_t)this + 16, [(NSNumber *)v26 bytes], [(NSNumber *)v26 length]);
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cmp_write_ext((uint64_t)this + 16, 2, 0, 0);
    cmp_write_array((uint64_t)this + 16, [(NSNumber *)v5 count]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v27 = v5;
    uint64_t v28 = [(NSNumber *)v27 countByEnumeratingWithState:&v36 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v37;
      while (2)
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v27);
          }
          if ((UAMessagePack::writeObject(this, *(objc_object **)(*((void *)&v36 + 1) + 8 * k)) & 1) == 0)
          {

            goto LABEL_31;
          }
        }
        uint64_t v28 = [(NSNumber *)v27 countByEnumeratingWithState:&v36 objects:v49 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NSNumber *)v5 timeIntervalSinceReferenceDate];
    size[0] = v31;
    cmp_write_ext((uint64_t)this + 16, 3, 8u, (uint64_t)size);
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    size[0] = 0;
    size[1] = 0;
    [(NSNumber *)v5 getUUIDBytes:size];
    cmp_write_ext((uint64_t)this + 16, 1, 0x10u, (uint64_t)size);
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v32 = [(NSNumber *)v5 baseURL];
    long long v33 = (char *)this + 16;
    if (v32)
    {
      cmp_write_ext((uint64_t)v33, 4, 0, 0);
      if (!UAMessagePack::writeObject(this, v32))
      {
        uint64_t v21 = 0;
        goto LABEL_70;
      }
      long long v34 = [(NSNumber *)v5 relativeString];
      uint64_t v35 = UAMessagePack::writeObject(this, v34);
    }
    else
    {
      cmp_write_ext((uint64_t)v33, 5, 0, 0);
      long long v34 = [(NSNumber *)v5 absoluteString];
      uint64_t v35 = UAMessagePack::writeObject(this, v34);
    }
    uint64_t v21 = v35;

LABEL_70:
    goto LABEL_45;
  }
LABEL_31:
  uint64_t v21 = 0;
LABEL_45:

  return v21;
}

void sub_1B3E00DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t cmp_write_str(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 > 0x1F)
  {
    if (a3 > 0xFF)
    {
      if (HIWORD(a3))
      {
        uint64_t result = cmp_write_str32_marker(a1, a3);
        if (!result) {
          return result;
        }
      }
      else
      {
        uint64_t result = cmp_write_str16_marker(a1, (unsigned __int16)a3);
        if (!result) {
          return result;
        }
      }
    }
    else
    {
      uint64_t result = cmp_write_str8_marker(a1, a3);
      if (!result) {
        return result;
      }
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  else
  {
    return cmp_write_fixstr(a1, a2, a3);
  }
  return result;
}

uint64_t cmp_write_fixstr(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 > 0x1F)
  {
    char v7 = 5;
  }
  else
  {
    char v8 = a3 | 0xA0;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1) == 1)
    {
      if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3)) {
        return 1;
      }
      char v7 = 10;
    }
    else
    {
      char v7 = 6;
    }
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v7;
  return result;
}

uint64_t UAMessagePack::mp_writer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t cmp_write_str8_marker(uint64_t a1, char a2)
{
  char v6 = a2;
  char v7 = -39;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    char v4 = 8;
    goto LABEL_5;
  }
  uint64_t v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    char v4 = 15;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t UAMessagePack::writeNumber(UAMessagePack *this, NSNumber *a2)
{
  uint64_t v3 = a2;
  if (!strcmp((const char *)[(NSNumber *)v3 objCType], "B"))
  {
    cmp_write_BOOL((uint64_t)this + 16, [(NSNumber *)v3 BOOLValue]);
    goto LABEL_11;
  }
  CFNumberType Type = CFNumberGetType((CFNumberRef)v3);
  if ((unint64_t)Type <= kCFNumberCGFloatType)
  {
    if (((1 << Type) & 0x11020) != 0)
    {
      [(NSNumber *)v3 floatValue];
      cmp_write_float((uint64_t)this + 16, v5);
      goto LABEL_11;
    }
    if (((1 << Type) & 0x2040) != 0)
    {
      [(NSNumber *)v3 doubleValue];
      cmp_write_double((uint64_t)this + 16, v6);
      goto LABEL_11;
    }
  }
  if ([(NSNumber *)v3 compare:&unk_1F0CBE520] < 0) {
    cmp_write_sint((uint64_t)this + 16, [(NSNumber *)v3 longLongValue]);
  }
  else {
    cmp_write_uint((uint64_t)this + 16, [(NSNumber *)v3 unsignedLongLongValue]);
  }
LABEL_11:

  return 1;
}

void sub_1B3E011B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t cmp_write_map(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xF)
  {
    if (HIWORD(a2))
    {
      return cmp_write_map32(a1, a2);
    }
    else
    {
      return cmp_write_map16(a1, (unsigned __int16)a2);
    }
  }
  else
  {
    char v5 = a2 | 0x80;
    uint64_t v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      uint64_t v3 = 0;
      *(unsigned char *)a1 = 6;
    }
    return v3;
  }
}

uint64_t UAMessagePack::UAMessagePack(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  *(void *)(a1 + 48) = _Block_copy(v7);
  *(void *)(a1 + 56) = _Block_copy(v8);
  __int16 v10 = 20557;
  char v11 = cmp_version();
  char v12 = cmp_mp_version();
  [*(id *)(a1 + 8) appendBytes:&v10 length:4];
  cmp_init(a1 + 16, a1, (uint64_t)UAMessagePack::mp_reader, (uint64_t)UAMessagePack::mp_writer);

  return a1;
}

void sub_1B3E01358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t cmp_init(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 0;
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t cmp_version()
{
  return 3;
}

uint64_t cmp_mp_version()
{
  return 5;
}

BOOL cmp_write_uint(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x7F)
  {
    if (a2 > 0xFF)
    {
      if (a2 >> 16)
      {
        if (HIDWORD(a2))
        {
          return cmp_write_u64(a1, a2);
        }
        else
        {
          return cmp_write_u32(a1, a2);
        }
      }
      else
      {
        return cmp_write_u16(a1, (unsigned __int16)a2);
      }
    }
    else
    {
      return cmp_write_u8(a1, a2);
    }
  }
  else
  {
    char v5 = a2;
    uint64_t v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      uint64_t v3 = 0;
      *(unsigned char *)a1 = 6;
    }
    return v3;
  }
}

id sortedArrayOfNSStringValues(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * i))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v8 = v1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  double v6 = objc_msgSend(v1, "mutableCopy", (void)v10);
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];
  id v8 = (id)[v7 copy];

LABEL_12:

  return v8;
}

id _UACopyUnpackedObjectFromData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = UAMessageUnpack::CopyUnpacked(a1, a2, a3, 0, 0);
  if (result)
  {
    return (id)CFRetain(result);
  }
  return result;
}

id UAMessageUnpack::CopyUnpacked(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  UAMessageUnpack::UAMessageUnpack((uint64_t)v7, a1, a2, a3, a4, a5);
  char v5 = UAMessageUnpack::readFromContext((UAMessageUnpack *)v7);

  return v5;
}

void sub_1B3E016EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

uint64_t UAMessageUnpack::UAMessageUnpack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 40) = a2;
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = a4;
  id v8 = a6;
  *(void *)(a1 + 72) = _Block_copy(a5);
  id v9 = _Block_copy(v8);

  *(void *)(a1 + 80) = v9;
  long long v10 = *(unsigned char **)(a1 + 40);
  if (v10 && *(void *)(a1 + 48) >= 4uLL && *v10 == 77 && v10[1] == 80)
  {
    *(void *)(a1 + 56) = 4;
    *(unsigned char *)a1 = 1;
  }
  cmp_init(a1 + 8, a1, (uint64_t)UAMessageUnpack::mp_reader, (uint64_t)UAMessageUnpack::mp_writer);
  return a1;
}

void sub_1B3E017D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id stringRemovingNewlines(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if ([v1 containsString:@"\n"])
  {
    uint64_t v3 = (void *)[v1 mutableCopy];
    do
      uint64_t v4 = objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\n", &stru_1F0CB4508, 0, 0, objc_msgSend(v3, "length"));
    while (v4
          + objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"  ", @" ", 0, 0, objc_msgSend(v3, "length")));
    uint64_t v2 = (void *)[v3 copy];
  }

  return v2;
}

void sub_1B3E018F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL cmp_write_u32(uint64_t a1, unsigned int a2)
{
  char v6 = -50;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    unsigned int v5 = bswap32(a2);
    return (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v5, 4) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_u16(uint64_t a1, unsigned int a2)
{
  char v6 = -51;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    __int16 v5 = __rev16(a2);
    return (*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v5, 2) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_double(uint64_t a1, double a2)
{
  char v6 = -53;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    unint64_t v5 = bswap64(*(unint64_t *)&a2);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 24))(a1, &v5, 8) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

Class initCSSearchableIndex(void)
{
  if (!CoreSpotlightLibrary(void)::frameworkLibrary) {
    CoreSpotlightLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  }
  Class result = objc_getClass("CSSearchableIndex");
  classCSSearchableIndex = (uint64_t)result;
  getCSSearchableIndexClass = (uint64_t (*)(void))CSSearchableIndexFunction;
  return result;
}

Class initNSUserActivity(void)
{
  if (!FoundationLibrary(void)::frameworkLibrary) {
    FoundationLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Foundation.framework/Foundation", 2);
  }
  Class result = objc_getClass("NSUserActivity");
  classNSUserActivity = (uint64_t)result;
  getNSUserActivityClass = (uint64_t (*)(void))NSUserActivityFunction;
  return result;
}

uint64_t cmp_write_bin(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 > 0xFF)
  {
    if (HIWORD(a3))
    {
      uint64_t result = cmp_write_bin32_marker(a1, a3);
      if (!result) {
        return result;
      }
    }
    else
    {
      uint64_t result = cmp_write_bin16_marker(a1, (unsigned __int16)a3);
      if (!result) {
        return result;
      }
    }
  }
  else
  {
    uint64_t result = cmp_write_bin8_marker(a1, a3);
    if (!result) {
      return result;
    }
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3)) {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = 10;
  return result;
}

id NSUserActivityFunction(void)
{
  return (id)classNSUserActivity;
}

void sub_1B3E01D34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *___Z22setIndexPendingForUUIDbP6NSUUID_block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v3 = sIndexPendingUUIDs == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v5 = (void *)sIndexPendingUUIDs;
    sIndexPendingUUIDs = (uint64_t)v4;

    int v2 = *(unsigned __int8 *)(a1 + 40);
  }
  uint64_t result = (void *)sIndexPendingUUIDs;
  if (v2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return (void *)[result addObject:v7];
  }
  else if (sIndexPendingUUIDs && *(void *)(a1 + 32))
  {
    return objc_msgSend(result, "removeObject:");
  }
  return result;
}

void ___ZL36getUAUserActivityToNSUserActivityMapv_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:0];
  id v1 = (void *)getUAUserActivityToNSUserActivityMap(void)::sResult;
  getUAUserActivityToNSUserActivityMap(void)::sResult = v0;
}

void sub_1B3E02324(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E02784(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E02968(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E02A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1B3E02BE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E02C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E02D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E02F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E03018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B3E03594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)UAUserActivity;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B3E03BD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void setIndexPendingForUUID(char a1, NSUUID *a2)
{
  BOOL v3 = a2;
  id v4 = getIndexPendingQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___Z22setIndexPendingForUUIDbP6NSUUID_block_invoke;
  v6[3] = &unk_1E6082B10;
  char v8 = a1;
  uint64_t v7 = v3;
  unint64_t v5 = v3;
  dispatch_sync(v4, v6);
}

id getIndexPendingQueue(void)
{
  if (getIndexPendingQueue(void)::sIndexPendingOnce != -1) {
    dispatch_once(&getIndexPendingQueue(void)::sIndexPendingOnce, &__block_literal_global_872);
  }
  uint64_t v0 = (void *)getIndexPendingQueue(void)::sIndexPendingQueue;

  return v0;
}

void sub_1B3E03E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E042D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0440C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E04954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B3E04A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E04B8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E04CC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E05230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1B3E05580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E05930(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E05D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E05E54(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

char *serializedCFType(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v1, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if ((unint64_t)[(__CFData *)Data length] > 0xFFFFFFFE)
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = (char *)malloc_type_malloc([(__CFData *)Data length] + 200, 0x7A065B7EuLL);
      *(_DWORD *)BOOL v3 = 1;
      *((_DWORD *)v3 + 1) = [(__CFData *)Data length];
      bzero(v3 + 8, 0x40uLL);
      bzero(v3 + 72, 0x40uLL);
      bzero(v3 + 136, 0x40uLL);
      strlcpy(v3 + 136, "UAUserActivity", 0x40uLL);
      memcpy(v3 + 200, (const void *)[(__CFData *)Data bytes], *((unsigned int *)v3 + 1));
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

void sub_1B3E05F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E060C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E06324(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

id _LSGetBestAppSuggestionManagerResponseProtocolInterface()
{
  if (_LSGetBestAppSuggestionManagerResponseProtocolInterface_once != -1) {
    dispatch_once(&_LSGetBestAppSuggestionManagerResponseProtocolInterface_once, &__block_literal_global_147);
  }
  uint64_t v0 = (void *)_LSGetBestAppSuggestionManagerResponseProtocolInterface_result;

  return v0;
}

id _LSGetBestAppSuggestionManagerProtocolInterface()
{
  if (_LSGetBestAppSuggestionManagerProtocolInterface_once != -1) {
    dispatch_once(&_LSGetBestAppSuggestionManagerProtocolInterface_once, &__block_literal_global_123);
  }
  uint64_t v0 = (void *)_LSGetBestAppSuggestionManagerProtocolInterface_result;

  return v0;
}

id UABestAppSuggestionManagerServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYBESTAPP", @"com.apple.coreservices.lsbestappsuggestionmanager.xpc");
}

void ___ZL24uaUserActivityObjectsMapv_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  id v1 = (void *)uaUserActivityObjectsMap(void)::sResult;
  uaUserActivityObjectsMap(void)::sResult = v0;
}

void sub_1B3E072F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E075E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id stringFromEnvWithDefault(const char *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getenv(a1);
  if (v4)
  {
    id v5 = [NSString stringWithCString:v4 encoding:4];
    char v6 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEBUG, "Using service name %{public}@ for %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

id _LSGetUserActivityClientResponseProtocolInterface()
{
  if (_LSGetUserActivityClientResponseProtocolInterface_once != -1) {
    dispatch_once(&_LSGetUserActivityClientResponseProtocolInterface_once, &__block_literal_global_113);
  }
  uint64_t v0 = (void *)_LSGetUserActivityClientResponseProtocolInterface_result;

  return v0;
}

id _LSGetUserActivityClientProtocolInterface()
{
  if (_LSGetUserActivityClientProtocolInterface_once != -1) {
    dispatch_once(&_LSGetUserActivityClientProtocolInterface_once, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)_LSGetUserActivityClientProtocolInterface_result;

  return v0;
}

id UActivityCreationXPCServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYCREATION", @"com.apple.coreservices.lsuseractivitymanager.xpc");
}

void sub_1B3E07A50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E07BF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E08240(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E084B0(_Unwind_Exception *a1)
{
  id v5 = v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E088B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0893C()
{
}

void ___ZL11LoadSynapsev_block_invoke()
{
  LoadSynapse(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Synapse.framework/Synapse", 2);
  if (!LoadSynapse(void)::frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_0.isa);
  }
}

void __LoadSharing_block_invoke()
{
  LoadSharing_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  if (!LoadSharing_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

void __LoadSharing_block_invoke_0()
{
  LoadSharing_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  if (!LoadSharing_frameworkLibrary_0) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

uint64_t ___ZL53loadSynapseObserverWhenFirstUserActivityIsMadeCurrentv_block_invoke()
{
  uint64_t result = getSYActivityObserverClass();
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      SYActivityObserverClass = (void *)getSYActivityObserverClass();
      return [SYActivityObserverClass loadSynapseObserver];
    }
  }
  return result;
}

id SYActivityObserverFunction(void)
{
  return (id)classSYActivityObserver;
}

Class initSYActivityObserver(void)
{
  if (LoadSynapse(void)::loadPredicate != -1) {
    dispatch_once(&LoadSynapse(void)::loadPredicate, &__block_literal_global_890);
  }
  Class result = objc_getClass("SYActivityObserver");
  classSYActivityObserver = (uint64_t)result;
  getSYActivityObserverClass = (uint64_t (*)(void))SYActivityObserverFunction;
  return result;
}

void sub_1B3E08B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void __biomeInfoLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.useractivity", "biome-69594900");
  id v1 = (void *)biomeInfoLogging::sLog;
  biomeInfoLogging::sLog = (uint64_t)v0;

  int v2 = biomeInfoLogging::sLog;
  if (os_log_type_enabled((os_log_t)biomeInfoLogging::sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "- UAUserActivity\tv1.0", v3, 2u);
  }
}

id UAMessageUnpack::readDictionary(UAMessageUnpack *this, unsigned int a2)
{
  if (a2 >= 0x3E8) {
    uint64_t v4 = 1000;
  }
  else {
    uint64_t v4 = a2;
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v4];
  if (a2)
  {
    uint64_t v6 = a2;
    while (1)
    {
      uint64_t v7 = UAMessageUnpack::readFromContext(this);
      if (!v7) {
        break;
      }
      int v8 = UAMessageUnpack::readFromContext(this);
      if (!v8)
      {

        break;
      }
      [v5 setObject:v8 forKey:v7];

      if (!--v6) {
        goto LABEL_9;
      }
    }
    id v9 = 0;
  }
  else
  {
LABEL_9:
    id v9 = (void *)[v5 copy];
  }

  return v9;
}

void sub_1B3E08D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *UAMessageUnpack::readFromContext(UAMessageUnpack *this)
{
  v43[2] = *(double *)MEMORY[0x1E4F143B8];
  int v2 = pthread_self();
  stackaddr_np = pthread_get_stackaddr_np(v2);
  if (stackaddr_np - v41 <= pthread_get_stacksize_np(v2) - 1024
    && *(unsigned char *)this
    && cmp_read_object((uint64_t)this + 8, (uint64_t)v41))
  {
    switch(v41[0])
    {
      case 0:
      case 0xE:
        size_t v31 = [NSNumber numberWithUnsignedChar:LOBYTE(v42[0])];
        UAMessageUnpack::substitute(this, v31);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 1:
      case 0x20:
      case 0x21:
        UAMessageUnpack::readDictionary(this, v42[0]);
        uint64_t v12 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v12);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 2:
      case 0x1E:
      case 0x1F:
        UAMessageUnpack::readArray(this, v42[0]);
        long long v13 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v13);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 3:
      case 0x1B:
      case 0x1C:
      case 0x1D:
        uint64_t v7 = v42[0];
        if (v42[0])
        {
          if (*((void *)this + 6) - *((void *)this + 7) < (unint64_t)v42[0]) {
            goto LABEL_21;
          }
          int v8 = [MEMORY[0x1E4F1CA58] dataWithLength:v42[0]];
          id v9 = (void (*)(char *, uint64_t, uint64_t))*((void *)this + 3);
          id v10 = v8;
          v9((char *)this + 8, [v10 mutableBytes], v7);
          id v11 = (objc_object *)[[NSString alloc] initWithData:v10 encoding:4];
          UAMessageUnpack::substitute(this, v11);
          uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v6 = &stru_1F0CB4508;
        }
        break;
      case 4:
        uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
        goto LABEL_34;
      case 5:
        uint64_t v30 = [NSNumber numberWithBool:LOBYTE(v42[0])];
        goto LABEL_34;
      case 6:
      case 7:
      case 8:
        uint64_t v14 = v42[0];
        if (v42[0])
        {
          if (*((void *)this + 6) - *((void *)this + 7) < (unint64_t)v42[0]) {
            goto LABEL_21;
          }
          uint64_t v15 = [MEMORY[0x1E4F1CA58] dataWithLength:v42[0]];
          char v16 = (void (*)(char *, uint64_t, uint64_t))*((void *)this + 3);
          id v17 = v15;
          v16((char *)this + 8, [(objc_object *)v17 mutableBytes], v14);
          UAMessageUnpack::substitute(this, v17);
          uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v30 = [MEMORY[0x1E4F1C9B8] data];
LABEL_34:
          uint64_t v6 = (__CFString *)v30;
        }
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0x16:
      case 0x17:
      case 0x18:
      case 0x19:
      case 0x1A:
        switch(LOBYTE(v42[0]))
        {
          case 1:
            if (v42[1] != 16) {
              goto LABEL_21;
            }
            v43[0] = 0.0;
            v43[1] = 0.0;
            (*((void (**)(char *, double *, uint64_t))this + 3))((char *)this + 8, v43, 16);
            id v5 = (objc_object *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v43];
            UAMessageUnpack::substitute(this, v5);
            uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_22;
          case 2:
            uint64_t v18 = (objc_class *)objc_opt_class();
            uint64_t v19 = UAMessageUnpack::readFromContextOfClass(this, v18);
            if (v19)
            {
              unsigned int v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
            }
            else
            {
              unsigned int v20 = 0;
            }
            UAMessageUnpack::substitute(this, v20);
            uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_22;
          case 3:
            if (v42[1] != 8) {
              goto LABEL_21;
            }
            v43[0] = 0.0;
            (*((void (**)(char *, double *, uint64_t))this + 3))((char *)this + 8, v43, 8);
            uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v43[0]];
            UAMessageUnpack::substitute(this, v21);
            uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_22;
          case 4:
            int v23 = (objc_class *)objc_opt_class();
            uint64_t v24 = UAMessageUnpack::readFromContextOfClass(this, v23);
            if (v24
              && (uint64_t v25 = (objc_class *)objc_opt_class(),
                  UAMessageUnpack::readFromContextOfClass(this, v25),
                  (v26 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              long long v27 = [MEMORY[0x1E4F1CB10] URLWithString:v26 relativeToURL:v24];
              UAMessageUnpack::substitute(this, v27);
              uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v6 = 0;
            }
            goto LABEL_45;
          case 5:
            uint64_t v28 = (objc_class *)objc_opt_class();
            uint64_t v24 = UAMessageUnpack::readFromContextOfClass(this, v28);
            if (v24)
            {
              uint64_t v29 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
              UAMessageUnpack::substitute(this, v29);
              uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v6 = 0;
            }
LABEL_45:

            break;
          default:
            goto LABEL_21;
        }
        break;
      case 0xC:
        LODWORD(v4) = v42[0];
        long long v32 = [NSNumber numberWithFloat:v4];
        UAMessageUnpack::substitute(this, v32);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0xD:
        long long v33 = [NSNumber numberWithDouble:*(double *)v42];
        UAMessageUnpack::substitute(this, v33);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0xF:
        long long v34 = [NSNumber numberWithUnsignedShort:LOWORD(v42[0])];
        UAMessageUnpack::substitute(this, v34);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0x10:
        uint64_t v35 = [NSNumber numberWithUnsignedInt:v42[0]];
        UAMessageUnpack::substitute(this, v35);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0x11:
        long long v36 = [NSNumber numberWithUnsignedLongLong:*(void *)v42];
        UAMessageUnpack::substitute(this, v36);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0x12:
      case 0x22:
        uint64_t v37 = [NSNumber numberWithChar:SLOBYTE(v42[0])];
        UAMessageUnpack::substitute(this, v37);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0x13:
        long long v38 = [NSNumber numberWithShort:SLOWORD(v42[0])];
        UAMessageUnpack::substitute(this, v38);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0x14:
        long long v39 = [NSNumber numberWithInt:v42[0]];
        UAMessageUnpack::substitute(this, v39);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 0x15:
        long long v40 = [NSNumber numberWithLongLong:*(void *)v42];
        UAMessageUnpack::substitute(this, v40);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_21;
    }
  }
  else
  {
LABEL_21:
    uint64_t v6 = 0;
  }
LABEL_22:

  return v6;
}

void sub_1B3E094B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t cmp_read_object(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v26 = 0;
  if (((*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 16))(a1, &v26, 1) & 1) == 0)
  {
    uint64_t v5 = 0;
    char v6 = 7;
    goto LABEL_7;
  }
  unsigned __int8 v4 = v26;
  if (((char)v26 & 0x80000000) == 0)
  {
    *(unsigned char *)a2 = 0;
LABEL_4:
    *(unsigned char *)(a2 + 8) = v4;
    return 1;
  }
  if (v26 <= 0x8Fu)
  {
    uint64_t v5 = 1;
    *(unsigned char *)a2 = 1;
    *(_DWORD *)(a2 + 8) = v4 & 0xF;
    return v5;
  }
  if (v26 > 0x9Fu)
  {
    if (v26 <= 0xBFu)
    {
      *(unsigned char *)a2 = 3;
      int v8 = v4 & 0x1F;
      goto LABEL_15;
    }
    switch(v26)
    {
      case 0xC0u:
        char v9 = 4;
        goto LABEL_21;
      case 0xC2u:
        char v9 = 5;
LABEL_21:
        *(unsigned char *)a2 = v9;
        *(unsigned char *)(a2 + 8) = 0;
        return 1;
      case 0xC3u:
        *(unsigned char *)a2 = 5;
        uint64_t v5 = 1;
        *(unsigned char *)(a2 + 8) = 1;
        return v5;
      case 0xC4u:
        *(unsigned char *)a2 = 6;
        id v10 = (unsigned int *)(a2 + 8);
        if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 1)) {
          goto LABEL_56;
        }
        goto LABEL_28;
      case 0xC5u:
        *(unsigned char *)a2 = 7;
        id v10 = (unsigned int *)(a2 + 8);
        if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 2)) {
          goto LABEL_78;
        }
        goto LABEL_28;
      case 0xC6u:
        *(unsigned char *)a2 = 8;
        id v10 = (unsigned int *)(a2 + 8);
        if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 4)) {
          goto LABEL_75;
        }
LABEL_28:
        uint64_t v5 = 0;
        char v6 = 14;
        break;
      case 0xC7u:
        char v25 = 0;
        unsigned __int8 v24 = 0;
        *(unsigned char *)a2 = 9;
        if (!(*(unsigned int (**)(uint64_t, char *, uint64_t))(a1 + 16))(a1, &v25, 1)) {
          goto LABEL_61;
        }
        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 16))(a1, &v24, 1)) {
          goto LABEL_82;
        }
        *(unsigned char *)(a2 + 8) = v25;
        unsigned int v11 = v24;
        goto LABEL_71;
      case 0xC8u:
        char v23 = 0;
        unsigned __int16 v22 = 0;
        *(unsigned char *)a2 = 10;
        if ((*(unsigned int (**)(uint64_t, char *, uint64_t))(a1 + 16))(a1, &v23, 1))
        {
          if ((*(unsigned int (**)(uint64_t, unsigned __int16 *, uint64_t))(a1 + 16))(a1, &v22, 2))
          {
            *(unsigned char *)(a2 + 8) = v23;
            unsigned int v11 = bswap32(v22) >> 16;
            goto LABEL_71;
          }
LABEL_82:
          char v6 = 14;
        }
        else
        {
LABEL_61:
          char v6 = 11;
        }
        uint64_t v5 = 0;
        break;
      case 0xC9u:
        char v21 = 0;
        unsigned int v20 = 0;
        char v18 = 11;
        *(unsigned char *)a2 = 11;
        if (!(*(unsigned int (**)(uint64_t, char *, uint64_t))(a1 + 16))(a1, &v21, 1)) {
          goto LABEL_85;
        }
        if ((*(unsigned int (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, &v20, 4))
        {
          *(unsigned char *)(a2 + 8) = v21;
          unsigned int v11 = bswap32(v20);
          goto LABEL_71;
        }
        char v18 = 14;
LABEL_85:
        uint64_t v5 = 0;
        *(unsigned char *)a1 = v18;
        return v5;
      case 0xCAu:
        char v12 = 12;
        goto LABEL_74;
      case 0xCBu:
        char v13 = 13;
        goto LABEL_45;
      case 0xCCu:
        *(unsigned char *)a2 = 14;
        uint64_t v5 = 1;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0) {
          goto LABEL_80;
        }
        return v5;
      case 0xCDu:
        char v14 = 15;
        goto LABEL_66;
      case 0xCEu:
        char v12 = 16;
        goto LABEL_74;
      case 0xCFu:
        char v13 = 17;
        goto LABEL_45;
      case 0xD0u:
        *(unsigned char *)a2 = 18;
        uint64_t v5 = 1;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0) {
          goto LABEL_80;
        }
        return v5;
      case 0xD1u:
        char v14 = 19;
LABEL_66:
        *(unsigned char *)a2 = v14;
        uint64_t v19 = (_WORD *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, _WORD *, uint64_t))(a1 + 16))(a1, v19, 2) & 1) == 0) {
          goto LABEL_80;
        }
        *uint64_t v19 = bswap32((unsigned __int16)*v19) >> 16;
        return 1;
      case 0xD2u:
        char v12 = 20;
        goto LABEL_74;
      case 0xD3u:
        char v13 = 21;
LABEL_45:
        *(unsigned char *)a2 = v13;
        uint64_t v15 = (unint64_t *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 16))(a1, v15, 8) & 1) == 0) {
          goto LABEL_80;
        }
        unint64_t *v15 = bswap64(*v15);
        return 1;
      case 0xD4u:
        *(unsigned char *)a2 = 22;
        uint64_t v5 = 1;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0) {
          goto LABEL_72;
        }
        *(_DWORD *)(a2 + 12) = 1;
        return v5;
      case 0xD5u:
        *(unsigned char *)a2 = 23;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0) {
          goto LABEL_72;
        }
        unsigned int v11 = 2;
        goto LABEL_71;
      case 0xD6u:
        *(unsigned char *)a2 = 24;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0) {
          goto LABEL_72;
        }
        unsigned int v11 = 4;
        goto LABEL_71;
      case 0xD7u:
        *(unsigned char *)a2 = 25;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0) {
          goto LABEL_72;
        }
        unsigned int v11 = 8;
        goto LABEL_71;
      case 0xD8u:
        *(unsigned char *)a2 = 26;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
        {
LABEL_72:
          uint64_t v5 = 0;
          char v6 = 11;
          break;
        }
        unsigned int v11 = 16;
LABEL_71:
        *(_DWORD *)(a2 + 12) = v11;
        return 1;
      case 0xD9u:
        *(unsigned char *)a2 = 27;
        id v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 1) & 1) == 0) {
          goto LABEL_80;
        }
LABEL_56:
        unsigned int v16 = *(unsigned __int8 *)v10;
        goto LABEL_79;
      case 0xDAu:
        char v17 = 28;
        goto LABEL_77;
      case 0xDBu:
        char v12 = 29;
        goto LABEL_74;
      case 0xDCu:
        char v17 = 30;
        goto LABEL_77;
      case 0xDDu:
        char v12 = 31;
        goto LABEL_74;
      case 0xDEu:
        char v17 = 32;
LABEL_77:
        *(unsigned char *)a2 = v17;
        id v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 2) & 1) == 0) {
          goto LABEL_80;
        }
LABEL_78:
        unsigned int v16 = bswap32(*(unsigned __int16 *)v10) >> 16;
        goto LABEL_79;
      case 0xDFu:
        char v12 = 33;
LABEL_74:
        *(unsigned char *)a2 = v12;
        id v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 4) & 1) == 0)
        {
LABEL_80:
          uint64_t v5 = 0;
          char v6 = 9;
          break;
        }
LABEL_75:
        unsigned int v16 = bswap32(*v10);
LABEL_79:
        *id v10 = v16;
        return 1;
      default:
        if (v26 >= 0xE0u)
        {
          *(unsigned char *)a2 = 34;
          goto LABEL_4;
        }
        uint64_t v5 = 0;
        char v6 = 13;
        break;
    }
LABEL_7:
    *(unsigned char *)a1 = v6;
    return v5;
  }
  *(unsigned char *)a2 = 2;
  int v8 = v4 & 0xF;
LABEL_15:
  *(_DWORD *)(a2 + 8) = v8;
  return 1;
}

BOOL UAMessageUnpack::mp_reader(uint64_t a1, void *__dst, size_t a3)
{
  id v3 = *(void **)(a1 + 8);
  uint64_t v4 = v3[7];
  if (v3[6] - v4 < a3) {
    return 0;
  }
  memcpy(__dst, (const void *)(v3[5] + v4), a3);
  v3[7] += a3;
  return a3 != 0;
}

id UAMessageUnpack::substitute(UAMessageUnpack *this, objc_object *a2)
{
  id v3 = a2;
  uint64_t v4 = *((void *)this + 9);
  uint64_t v5 = v3;
  if (v4)
  {
    uint64_t v5 = v3;
    if ((*(unsigned int (**)(uint64_t, objc_object *, void))(v4 + 16))(v4, v3, *((void *)this + 8)))
    {
      uint64_t v5 = (*(void (**)(void))(*((void *)this + 10) + 16))();
    }
  }

  return v5;
}

void sub_1B3E09C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL20getIndexPendingQueuev_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("indexPendingQ", 0);
  id v1 = (void *)getIndexPendingQueue(void)::sIndexPendingQueue;
  getIndexPendingQueue(void)::sIndexPendingQueue = (uint64_t)v0;
}

void ___ZL24getDeferredIndexingQueuev_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("coreSpotlightDeferredIndexQ", 0);
  id v1 = (void *)getDeferredIndexingQueue(void)::sQueue;
  getDeferredIndexingQueue(void)::sQueue = (uint64_t)v0;
}

uint64_t ___ZL21isIndexPendingForUUIDP6NSUUID_block_invoke(uint64_t a1)
{
  uint64_t result = sIndexPendingUUIDs;
  if (sIndexPendingUUIDs)
  {
    uint64_t result = [(id)sIndexPendingUUIDs containsObject:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void sub_1B3E09E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B3E09FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1B3E0A068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1B3E0A538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1B3E0AA8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E0AC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1B3E0AF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1B3E0B268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initCSSearchableItemAttributeSet(void)
{
  if (!CoreSpotlightLibrary(void)::frameworkLibrary) {
    CoreSpotlightLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  }
  Class result = objc_getClass("CSSearchableItemAttributeSet");
  classCSSearchableItemAttributeSet = (uint64_t)result;
  getCSSearchableItemAttributeSetClass = (uint64_t (*)(void))CSSearchableItemAttributeSetFunction;
  return result;
}

void sub_1B3E0B610(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E0BB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_1B3E0BCB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t acceptableForUserInfo(NSDictionary *a1)
{
  return recurse(a1, &__block_literal_global);
}

void sub_1B3E0BFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1B3E0C19C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1B3E0C240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0C4F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1B3E0C698(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1B3E0C994(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id getSupportsContinuationStreamsQueue(void)
{
  if (getSupportsContinuationStreamsQueue(void)::sOnce != -1) {
    dispatch_once(&getSupportsContinuationStreamsQueue(void)::sOnce, &__block_literal_global_882);
  }
  dispatch_queue_t v0 = (void *)getSupportsContinuationStreamsQueue(void)::sResult;

  return v0;
}

void sub_1B3E0CC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0CD90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B3E0D2C4(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1B3E0D494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0D55C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E0DD98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0E40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0E684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E0E8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0F204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,id a59)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v64 - 160), 8);

  _Unwind_Resume(a1);
}

void sub_1B3E0F468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0F614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0F900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E0FB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Block_object_dispose((const void *)(v20 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B3E1064C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *a50)
{
  _Block_object_dispose((const void *)(v52 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B3E108B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E10A9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

id recurseAndReplace(void *a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v42 = a1;
  id v43 = a2;
  id v44 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = v42;
  id v7 = v5;
  int v8 = (unsigned int (**)(id, void *))v43;
  v48 = v6;
  v49 = (void (**)(id, void *))v44;
  long long v45 = v7;
  char v9 = [v7 objectForKey:v6];

  if (v9)
  {
    id v10 = [v7 objectForKey:v48];
LABEL_3:
    unsigned int v11 = v10;
    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v46 = [MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:v46 forKey:v48];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    char v12 = [v48 allKeys];
    char v13 = v12;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(id *)(*((void *)&v50 + 1) + 8 * i);
          char v18 = [v48 objectForKey:v17];
          if (v8[2](v8, v18))
          {
            uint64_t v19 = v49[2](v49, v18);

            char v18 = (void *)v19;
          }
          if (v8[2](v8, v17))
          {
            uint64_t v20 = v49[2](v49, v17);

            id v17 = (id)v20;
          }
          if (v17) {
            BOOL v21 = v18 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21) {
            [v46 setObject:v18 forKey:v17];
          }
        }
        char v12 = v13;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v14);
    }

    unsigned __int16 v22 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      char v23 = [v48 description];
      stringRemovingNewlines(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      char v25 = [v46 description];
      unsigned __int8 v26 = stringRemovingNewlines(v25);
      *(_DWORD *)buf = 138478083;
      id v55 = v24;
      __int16 v56 = 2113;
      v57 = v26;
      _os_log_impl(&dword_1B3DF6000, v22, OS_LOG_TYPE_DEBUG, "recurseAndReplace(dict): %{private}@ => %{private}@", buf, 0x16u);
    }
    unsigned int v11 = (void *)[v46 copy];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v47 = [MEMORY[0x1E4F1CA48] array];
      [v7 setObject:v47 forKey:v48];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v27 = v48;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v51 != v29) {
              objc_enumerationMutation(v27);
            }
            id v31 = *(id *)(*((void *)&v50 + 1) + 8 * j);
            if (v8[2](v8, v31))
            {
              uint64_t v32 = v49[2](v49, v31);

              id v31 = (id)v32;
            }
            if (v31) {
              [v47 addObject:v31];
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v28);
      }

      long long v33 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        id v55 = v27;
        __int16 v56 = 2113;
        v57 = v47;
        _os_log_impl(&dword_1B3DF6000, v33, OS_LOG_TYPE_DEBUG, "recurseAndReplace(array): %{private}@ => %{private}@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v41 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v58 = 138477827;
          v59 = v48;
          _os_log_impl(&dword_1B3DF6000, v41, OS_LOG_TYPE_DEBUG, "recurseAndReplace(obj): %{private}@", v58, 0xCu);
        }

        id v10 = v48;
        goto LABEL_3;
      }
      long long v47 = [MEMORY[0x1E4F1CA80] set];
      [v7 setObject:v47 forKey:v48];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v34 = v48;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v51 != v36) {
              objc_enumerationMutation(v34);
            }
            id v38 = *(id *)(*((void *)&v50 + 1) + 8 * k);
            if (v8[2](v8, v38))
            {
              uint64_t v39 = v49[2](v49, v38);

              id v38 = (id)v39;
            }
            if (v38) {
              [v47 addObject:v38];
            }
          }
          uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v35);
      }

      long long v33 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        id v55 = v34;
        __int16 v56 = 2113;
        v57 = v47;
        _os_log_impl(&dword_1B3DF6000, v33, OS_LOG_TYPE_DEBUG, "recurseAndReplace(set): %{private}@ => %{private}@", buf, 0x16u);
      }
    }

    unsigned int v11 = (void *)[v47 copy];
  }
LABEL_54:

  return v11;
}

void sub_1B3E11210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B3E113B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E1151C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B3E11644(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B3E116D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E117A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E1199C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B3E11BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E11CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1B3E11EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E120B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E1228C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E123A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E124B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E129A0(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1B3E12CF0(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1B3E12FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E13334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E13BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_1B3E13EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E14170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

void sub_1B3E14AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E14E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

void sub_1B3E157A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E159E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E15BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id suggestedActionNudgesQueue(void)
{
  if (suggestedActionNudgesQueue(void)::onceToken != -1) {
    dispatch_once(&suggestedActionNudgesQueue(void)::onceToken, &__block_literal_global_909);
  }
  dispatch_queue_t v0 = (void *)suggestedActionNudgesQueue(void)::sSuggestedActionNudgesQueue;

  return v0;
}

void sub_1B3E15EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E16098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B3E161B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B3E162D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B3E16424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E164E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1B3E16638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  objc_sync_exit(v8);

  _Unwind_Resume(a1);
}

void sub_1B3E16708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B3E1678C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_1B3E170E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void sub_1B3E17254()
{
}

void sub_1B3E17260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  JUMPOUT(0x1B3E171CCLL);
}

void sub_1B3E1728C()
{
  JUMPOUT(0x1B3E172A4);
}

void sub_1B3E172E4()
{
  JUMPOUT(0x1B3E172F4);
}

void sub_1B3E1747C(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1B3E17690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E17870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E179EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E17ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B3E17BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E17C08(void *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    if (v2)
    {
      void *v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-114 userInfo:0];
    }
    objc_end_catch();
    JUMPOUT(0x1B3E17BB8);
  }
  JUMPOUT(0x1B3E17BF8);
}

void sub_1B3E17C6C()
{
}

void sub_1B3E17CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E17E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E17F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSArray *sortedArrayIfSameClass(NSArray *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = v1;
  if (v1
    && [(NSArray *)v1 count] >= 2
    && ([(NSArray *)v2 firstObject],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    uint64_t v5 = [(NSArray *)v2 firstObject];
    uint64_t v6 = objc_opt_class();

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v2;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          if (objc_opt_class() != v6)
          {

            goto LABEL_14;
          }
        }
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    -[NSArray sortedArrayUsingSelector:](v7, "sortedArrayUsingSelector:", sel_compare_, v14);
    unsigned int v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_14:
    unsigned int v11 = v2;
  }
  char v12 = v11;

  return v12;
}

void sub_1B3E180B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E187DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E18940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E189D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3E18A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL23dTraceProcessIdentifierv_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  dispatch_queue_t v0 = [v2 bundleIdentifier];

  if (!v0)
  {
    uint64_t v1 = objc_msgSend(NSString, "stringWithFormat:", @"[PID:%lld]", getpid(), 0);
    if (v1) {
      dispatch_queue_t v0 = (__CFString *)v1;
    }
    else {
      dispatch_queue_t v0 = @"unknown";
    }
  }
  id v3 = v0;
  dTraceProcessIdentifier(void)::Class result = (uint64_t)strdup((const char *)[(__CFString *)v3 UTF8String]);
}

void sub_1B3E18B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

Class initSFCompanionAdvertiser(void)
{
  if (LoadSharing(void)::loadPredicate != -1) {
    dispatch_once(&LoadSharing(void)::loadPredicate, &__block_literal_global_876);
  }
  Class result = objc_getClass("SFCompanionAdvertiser");
  classSFCompanionAdvertiser = (uint64_t)result;
  getSFCompanionAdvertiserClass = (uint64_t (*)(void))SFCompanionAdvertiserFunction;
  return result;
}

id SFCompanionAdvertiserFunction(void)
{
  return (id)classSFCompanionAdvertiser;
}

void ___ZL11LoadSharingv_block_invoke()
{
  LoadSharing(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  if (!LoadSharing(void)::frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

void ___ZL35getSupportsContinuationStreamsQueuev_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("getSupportsContinuationStreamsQueue", 0);
  uint64_t v1 = (void *)getSupportsContinuationStreamsQueue(void)::sResult;
  getSupportsContinuationStreamsQueue(void)::sResult = (uint64_t)v0;
}

uint64_t initFPURLMightBeInFileProvider(const __CFURL *a1)
{
  id v2 = (void *)FileProviderLibrary(void)::frameworkLibrary;
  if (!FileProviderLibrary(void)::frameworkLibrary)
  {
    id v2 = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  id v3 = (uint64_t (*)(const __CFURL *))dlsym(v2, "FPURLMightBeInFileProvider");
  softLinkFPURLMightBeInFileProvider = v3;

  return v3(a1);
}

uint64_t initFPCreateBookmarkableStringFromDocumentURL(const __CFURL *a1, __CFError **a2)
{
  char v4 = (void *)FileProviderLibrary(void)::frameworkLibrary;
  if (!FileProviderLibrary(void)::frameworkLibrary)
  {
    char v4 = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  uint64_t v5 = (uint64_t (*)(const __CFURL *, __CFError **))dlsym(v4, "FPCreateBookmarkableStringFromDocumentURL");
  softLinkFPCreateBookmarkableStringFromDocumentURL = v5;

  return v5(a1, a2);
}

uint64_t initFPCreateDocumentURLFromBookmarkableString(const __CFString *a1, __CFError **a2)
{
  char v4 = (void *)FileProviderLibrary(void)::frameworkLibrary;
  if (!FileProviderLibrary(void)::frameworkLibrary)
  {
    char v4 = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  uint64_t v5 = (uint64_t (*)(const __CFString *, __CFError **))dlsym(v4, "FPCreateDocumentURLFromBookmarkableString");
  softLinkFPCreateDocumentURLFromBookmarkableString = v5;

  return v5(a1, a2);
}

void ___ZL26suggestedActionNudgesQueuev_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("suggestedActionNudgesQ", 0);
  uint64_t v1 = (void *)suggestedActionNudgesQueue(void)::sSuggestedActionNudgesQueue;
  suggestedActionNudgesQueue(void)::sSuggestedActionNudgesQueue = (uint64_t)v0;
}

uint64_t ___ZL34installSpringBoardUserEventMonitorv_block_invoke()
{
  uint64_t result = suggestedActionNudges;
  if (suggestedActionNudges) {
    return [(id)suggestedActionNudges enumerateKeysAndObjectsUsingBlock:&__block_literal_global_917];
  }
  return result;
}

uint64_t ___ZL34installSpringBoardUserEventMonitorv_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void sub_1B3E194B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3E1A8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id CSSearchableItemAttributeSetFunction(void)
{
  return (id)classCSSearchableItemAttributeSet;
}

void sub_1B3E1AAF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E1ACA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E1B3C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __validType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = validType(a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void __validType_block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    char valid = validType(v10);
  }
  else {
    char valid = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = valid;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
}

id copyHexStringForData(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = v1;
  char v4 = (unsigned __int8 *)[v3 bytes];
  uint64_t v5 = [v3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      unsigned int v7 = *v4++;
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c", a0123456789abcd[(unint64_t)v7 >> 4], a0123456789abcd[v7 & 0xF]);
      [v2 appendString:v8];

      --v6;
    }
    while (v6);
  }
  uint64_t v9 = (void *)[v2 copy];

  return v9;
}

id copyDataFromHexString(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA58] data];
  if ([v1 length])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = v3 + 1;
      unsigned __int8 v5 = [v1 characterAtIndex:v3];
      if (v5 > 0x24u || ((1 << v5) & 0x1100000400) == 0)
      {
        char v7 = v5 - 48;
        if ((v5 - 48) >= 0xAu
          && (v5 - 65 > 0x25 || ((1 << (v5 - 65)) & 0x3F0000003FLL) == 0))
        {

          id v2 = 0;
          break;
        }
        if (v5 - 48 >= 0xA)
        {
          if (v5 - 97 > 5)
          {
            if (v5 - 65 >= 6) {
              char v7 = 0;
            }
            else {
              char v7 = v5 - 55;
            }
          }
          else
          {
            char v7 = v5 - 87;
          }
        }
        unint64_t v8 = v3 + 2;
        int v9 = [v1 characterAtIndex:v4];
        unsigned int v10 = v9 - 48;
        if ((v9 - 65) <= 5) {
          char v11 = v9 - 55;
        }
        else {
          char v11 = 0;
        }
        if ((v9 - 97) <= 5) {
          char v12 = v9 - 87;
        }
        else {
          char v12 = v11;
        }
        if (v10 > 9) {
          LOBYTE(v10) = v12;
        }
        char v15 = v10 | (16 * v7);
        [v2 appendBytes:&v15 length:1];
        unint64_t v4 = v8;
      }
      unint64_t v3 = v4;
    }
    while (v4 < [v1 length]);
  }
  char v13 = (void *)[v2 copy];

  return v13;
}

const char *cmp_strerror(unsigned __int8 *a1)
{
  uint64_t v1 = *a1;
  if ((v1 - 1) > 0xE) {
    return "";
  }
  else {
    return (&cmp_error_messages)[v1];
  }
}

uint64_t cmp_write_pfix(uint64_t a1, char a2)
{
  if (a2 < 0)
  {
    char v4 = 5;
    goto LABEL_5;
  }
  char v6 = a2;
  uint64_t v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    char v4 = 6;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_nfix(uint64_t a1, unsigned int a2)
{
  if (a2 < 0xFFFFFFE0)
  {
    char v4 = 5;
    goto LABEL_5;
  }
  char v6 = a2;
  uint64_t v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    char v4 = 6;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_sfix(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0)
  {
    if (a2 < 0xFFFFFFE0)
    {
      char v5 = 5;
      goto LABEL_8;
    }
    char v8 = a2;
    uint64_t v3 = 1;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1);
  }
  else
  {
    char v7 = a2;
    uint64_t v3 = 1;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1);
  }
  if (v4 != 1)
  {
    char v5 = 6;
LABEL_8:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v5;
  }
  return v3;
}

BOOL cmp_write_s8(uint64_t a1, char a2)
{
  char v4 = a2;
  char v5 = -48;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) == 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1) != 0;
  }
  BOOL result = 0;
  *(unsigned char *)a1 = 8;
  return result;
}

BOOL cmp_write_s16(uint64_t a1, unsigned int a2)
{
  char v6 = -47;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    __int16 v5 = bswap32(a2) >> 16;
    return (*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v5, 2) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_s32(uint64_t a1, unsigned int a2)
{
  char v6 = -46;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    unsigned int v5 = bswap32(a2);
    return (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v5, 4) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_s64(uint64_t a1, unint64_t a2)
{
  char v6 = -45;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    unint64_t v5 = bswap64(a2);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 24))(a1, &v5, 8) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_sint(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    if (a2 < 0xFFFFFFFFFFFFFFE0)
    {
      if (a2 < 0xFFFFFFFFFFFFFF80)
      {
        if (a2 < 0xFFFFFFFFFFFF8000)
        {
          if (a2 < 0xFFFFFFFF80000000)
          {
            return cmp_write_s64(a1, a2);
          }
          else
          {
            return cmp_write_s32(a1, a2);
          }
        }
        else
        {
          return cmp_write_s16(a1, (__int16)a2);
        }
      }
      else
      {
        return cmp_write_s8(a1, a2);
      }
    }
    else
    {
      char v5 = a2;
      uint64_t v4 = 1;
      if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
      {
        uint64_t v4 = 0;
        *(unsigned char *)a1 = 6;
      }
      return v4;
    }
  }
  else
  {
    return cmp_write_uint(a1, a2);
  }
}

BOOL cmp_write_u8(uint64_t a1, char a2)
{
  char v4 = a2;
  char v5 = -52;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) == 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1) != 0;
  }
  BOOL result = 0;
  *(unsigned char *)a1 = 8;
  return result;
}

BOOL cmp_write_u64(uint64_t a1, unint64_t a2)
{
  char v6 = -49;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    unint64_t v5 = bswap64(a2);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 24))(a1, &v5, 8) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_float(uint64_t a1, float a2)
{
  char v6 = -54;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    unsigned int v5 = bswap32(LODWORD(a2));
    return (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v5, 4) != 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_nil(uint64_t a1)
{
  char v4 = -64;
  uint64_t v2 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1);
  if (v2 != 1) {
    *(unsigned char *)a1 = 8;
  }
  return v2 == 1;
}

BOOL cmp_write_true(uint64_t a1)
{
  char v4 = -61;
  uint64_t v2 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1);
  if (v2 != 1) {
    *(unsigned char *)a1 = 8;
  }
  return v2 == 1;
}

BOOL cmp_write_false(uint64_t a1)
{
  char v4 = -62;
  uint64_t v2 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1);
  if (v2 != 1) {
    *(unsigned char *)a1 = 8;
  }
  return v2 == 1;
}

uint64_t cmp_write_BOOL(uint64_t a1, int a2)
{
  if (a2)
  {
    char v6 = -61;
    uint64_t v3 = 1;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1);
  }
  else
  {
    char v7 = -62;
    uint64_t v3 = 1;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1);
  }
  if (v4 != 1)
  {
    uint64_t v3 = 0;
    *(unsigned char *)a1 = 8;
  }
  return v3;
}

uint64_t cmp_write_fixstr_marker(uint64_t a1, unsigned int a2)
{
  if (a2 > 0x1F)
  {
    char v4 = 5;
    goto LABEL_5;
  }
  char v6 = a2 | 0xA0;
  uint64_t v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    char v4 = 6;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_str8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = cmp_write_str8_marker(a1, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_str16_marker(uint64_t a1, unsigned int a2)
{
  char v7 = -38;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    __int16 v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_str16(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = cmp_write_str16_marker(a1, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_str32_marker(uint64_t a1, unsigned int a2)
{
  char v7 = -37;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    unsigned int v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_str32(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = cmp_write_str32_marker(a1, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_str_marker(uint64_t a1, unsigned int a2)
{
  if (a2 > 0x1F)
  {
    if (a2 > 0xFF)
    {
      if (HIWORD(a2))
      {
        return cmp_write_str32_marker(a1, a2);
      }
      else
      {
        return cmp_write_str16_marker(a1, (unsigned __int16)a2);
      }
    }
    else
    {
      return cmp_write_str8_marker(a1, a2);
    }
  }
  else
  {
    char v5 = a2 | 0xA0;
    uint64_t v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      uint64_t v3 = 0;
      *(unsigned char *)a1 = 6;
    }
    return v3;
  }
}

uint64_t cmp_write_bin8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = cmp_write_bin8_marker(a1, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_bin16_marker(uint64_t a1, unsigned int a2)
{
  char v7 = -59;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    __int16 v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_bin16(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = cmp_write_bin16_marker(a1, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_bin32_marker(uint64_t a1, unsigned int a2)
{
  char v7 = -58;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    unsigned int v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_bin32(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = cmp_write_bin32_marker(a1, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a2, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_bin_marker(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0xFF) {
    return cmp_write_bin8_marker(a1, a2);
  }
  if (HIWORD(a2)) {
    return cmp_write_bin32_marker(a1, a2);
  }
  return cmp_write_bin16_marker(a1, (unsigned __int16)a2);
}

uint64_t cmp_write_fixarray(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xF)
  {
    char v4 = 5;
    goto LABEL_5;
  }
  char v6 = a2 | 0x90;
  uint64_t v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    char v4 = 6;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_array16(uint64_t a1, unsigned int a2)
{
  char v7 = -36;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    __int16 v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_array32(uint64_t a1, unsigned int a2)
{
  char v7 = -35;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    unsigned int v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_array(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xF)
  {
    if (HIWORD(a2))
    {
      return cmp_write_array32(a1, a2);
    }
    else
    {
      return cmp_write_array16(a1, (unsigned __int16)a2);
    }
  }
  else
  {
    char v5 = a2 | 0x90;
    uint64_t v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      uint64_t v3 = 0;
      *(unsigned char *)a1 = 6;
    }
    return v3;
  }
}

uint64_t cmp_write_fixmap(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xF)
  {
    char v4 = 5;
    goto LABEL_5;
  }
  char v6 = a2 | 0x80;
  uint64_t v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    char v4 = 6;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_map16(uint64_t a1, unsigned int a2)
{
  char v7 = -34;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    __int16 v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_map32(uint64_t a1, unsigned int a2)
{
  char v7 = -33;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    unsigned int v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4)) {
      return 1;
    }
    char v5 = 15;
  }
  else
  {
    char v5 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v5;
  return result;
}

uint64_t cmp_write_fixext1_marker(uint64_t a1, char a2)
{
  char v6 = a2;
  char v7 = -44;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    char v4 = 8;
    goto LABEL_5;
  }
  uint64_t v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    char v4 = 12;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext1(uint64_t a1, char a2, uint64_t a3)
{
  if (!cmp_write_fixext1_marker(a1, a2)) {
    return 0;
  }
  uint64_t v5 = 1;
  if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 1))
  {
    uint64_t v5 = 0;
    *(unsigned char *)a1 = 10;
  }
  return v5;
}

uint64_t cmp_write_fixext2_marker(uint64_t a1, char a2)
{
  char v6 = a2;
  char v7 = -43;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    char v4 = 8;
    goto LABEL_5;
  }
  uint64_t v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    char v4 = 12;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext2(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result = cmp_write_fixext2_marker(a1, a2);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 2);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_fixext4_marker(uint64_t a1, char a2)
{
  char v6 = a2;
  char v7 = -42;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    char v4 = 8;
    goto LABEL_5;
  }
  uint64_t v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    char v4 = 12;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result = cmp_write_fixext4_marker(a1, a2);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 4);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_fixext8_marker(uint64_t a1, char a2)
{
  char v6 = a2;
  char v7 = -41;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    char v4 = 8;
    goto LABEL_5;
  }
  uint64_t v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    char v4 = 12;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext8(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result = cmp_write_fixext8_marker(a1, a2);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 8);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_fixext16_marker(uint64_t a1, char a2)
{
  char v6 = a2;
  char v7 = -40;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    char v4 = 8;
    goto LABEL_5;
  }
  uint64_t v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    char v4 = 12;
LABEL_5:
    uint64_t v3 = 0;
    *(unsigned char *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext16(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result = cmp_write_fixext16_marker(a1, a2);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 16);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_ext8_marker(uint64_t a1, char a2, char a3)
{
  char v8 = a2;
  char v7 = a3;
  char v9 = -57;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v9, 1) != 1)
  {
    char v5 = 8;
    goto LABEL_7;
  }
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1))
  {
    char v5 = 12;
    goto LABEL_7;
  }
  uint64_t v4 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1))
  {
    char v5 = 15;
LABEL_7:
    uint64_t v4 = 0;
    *(unsigned char *)a1 = v5;
  }
  return v4;
}

uint64_t cmp_write_ext8(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t result = cmp_write_ext8_marker(a1, a2, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a4, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_ext16_marker(uint64_t a1, char a2, unsigned int a3)
{
  char v8 = a2;
  char v9 = -56;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v9, 1) == 1)
  {
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1))
    {
      __int16 v7 = __rev16(a3);
      if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v7, 2)) {
        return 1;
      }
      char v6 = 15;
    }
    else
    {
      char v6 = 12;
    }
  }
  else
  {
    char v6 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v6;
  return result;
}

uint64_t cmp_write_ext16(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t result = cmp_write_ext16_marker(a1, a2, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a4, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_ext32_marker(uint64_t a1, char a2, unsigned int a3)
{
  char v8 = a2;
  char v9 = -55;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v9, 1) == 1)
  {
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1))
    {
      unsigned int v7 = bswap32(a3);
      if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v7, 4)) {
        return 1;
      }
      char v6 = 15;
    }
    else
    {
      char v6 = 12;
    }
  }
  else
  {
    char v6 = 8;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = v6;
  return result;
}

uint64_t cmp_write_ext32(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t result = cmp_write_ext32_marker(a1, a2, a3);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a4, a3);
    if (result) {
      return 1;
    }
    else {
      *(unsigned char *)a1 = 10;
    }
  }
  return result;
}

uint64_t cmp_write_ext_marker(uint64_t a1, char a2, unsigned int a3)
{
  switch(a3)
  {
    case 1u:
      uint64_t result = cmp_write_fixext1_marker(a1, a2);
      break;
    case 2u:
      uint64_t result = cmp_write_fixext2_marker(a1, a2);
      break;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      goto LABEL_5;
    case 4u:
      uint64_t result = cmp_write_fixext4_marker(a1, a2);
      break;
    case 8u:
      uint64_t result = cmp_write_fixext8_marker(a1, a2);
      break;
    default:
      if (a3 == 16)
      {
        uint64_t result = cmp_write_fixext16_marker(a1, a2);
      }
      else
      {
LABEL_5:
        if (a3 > 0xFF)
        {
          if (HIWORD(a3)) {
            uint64_t result = cmp_write_ext32_marker(a1, a2, a3);
          }
          else {
            uint64_t result = cmp_write_ext16_marker(a1, a2, (unsigned __int16)a3);
          }
        }
        else
        {
          uint64_t result = cmp_write_ext8_marker(a1, a2, a3);
        }
      }
      break;
  }
  return result;
}

uint64_t cmp_write_ext(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  switch(a3)
  {
    case 1u:
      if (!cmp_write_fixext1_marker(a1, a2)) {
        return 0;
      }
      uint64_t v7 = 1;
      if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 1)) {
        goto LABEL_22;
      }
      return v7;
    case 2u:
      if (!cmp_write_fixext2_marker(a1, a2)) {
        return 0;
      }
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 2);
      goto LABEL_20;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      goto LABEL_8;
    case 4u:
      if (!cmp_write_fixext4_marker(a1, a2)) {
        return 0;
      }
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 4);
      goto LABEL_20;
    case 8u:
      if (!cmp_write_fixext8_marker(a1, a2)) {
        return 0;
      }
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 8);
      goto LABEL_20;
    default:
      if (a3 == 16)
      {
        if (cmp_write_fixext16_marker(a1, a2))
        {
          uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 16);
          goto LABEL_20;
        }
        return 0;
      }
LABEL_8:
      if (a3 > 0xFF)
      {
        if (HIWORD(a3))
        {
          if (!cmp_write_ext32_marker(a1, a2, a3)) {
            return 0;
          }
        }
        else if (!cmp_write_ext16_marker(a1, a2, (unsigned __int16)a3))
        {
          return 0;
        }
      }
      else if (!cmp_write_ext8_marker(a1, a2, a3))
      {
        return 0;
      }
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, a4, a3);
LABEL_20:
      if (v8) {
        return 1;
      }
LABEL_22:
      uint64_t v7 = 0;
      *(unsigned char *)a1 = 10;
      return v7;
  }
}

uint64_t cmp_write_object(uint64_t a1, unsigned char *a2)
{
  switch(*a2)
  {
    case 0:
      if ((char)a2[8] < 0) {
        goto LABEL_99;
      }
      char v41 = a2[8];
      uint64_t v3 = 1;
      uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v41, 1);
      goto LABEL_97;
    case 1:
      unsigned int v5 = a2[8];
      if (v5 > 0xF) {
        goto LABEL_99;
      }
      char v42 = v5 | 0x80;
      uint64_t v3 = 1;
      uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v42, 1);
      goto LABEL_97;
    case 2:
      unsigned int v6 = a2[8];
      if (v6 > 0xF) {
        goto LABEL_99;
      }
      char v43 = v6 | 0x90;
      uint64_t v3 = 1;
      uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v43, 1);
      goto LABEL_97;
    case 3:
      unsigned int v7 = a2[8];
      if (v7 > 0x1F) {
        goto LABEL_99;
      }
      char v44 = v7 | 0xA0;
      uint64_t v3 = 1;
      uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v44, 1);
      goto LABEL_97;
    case 4:
      char v45 = -64;
      uint64_t v3 = 1;
      uint64_t v8 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v45, 1);
      goto LABEL_102;
    case 5:
      if (a2[8])
      {
        char v46 = -61;
        uint64_t v3 = 1;
        uint64_t v8 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v46, 1);
      }
      else
      {
        char v47 = -62;
        uint64_t v3 = 1;
        uint64_t v8 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v47, 1);
      }
LABEL_102:
      if (v8 == 1) {
        return v3;
      }
      uint64_t v3 = 0;
      char v34 = 8;
      goto LABEL_104;
    case 6:
      char v9 = a2[8];
      return cmp_write_bin8_marker(a1, v9);
    case 7:
      unsigned int v11 = *((unsigned __int16 *)a2 + 4);
      return cmp_write_bin16_marker(a1, v11);
    case 8:
      unsigned int v12 = *((_DWORD *)a2 + 2);
      return cmp_write_bin32_marker(a1, v12);
    case 9:
      char v13 = a2[12];
      char v14 = a2[8];
      return cmp_write_ext8_marker(a1, v14, v13);
    case 0xA:
      unsigned int v15 = *((unsigned __int16 *)a2 + 6);
      char v16 = a2[8];
      return cmp_write_ext16_marker(a1, v16, v15);
    case 0xB:
      unsigned int v17 = *((_DWORD *)a2 + 3);
      char v18 = a2[8];
      return cmp_write_ext32_marker(a1, v18, v17);
    case 0xC:
      float v19 = *((float *)a2 + 2);
      return cmp_write_float(a1, v19);
    case 0xD:
      double v20 = *((double *)a2 + 1);
      return cmp_write_double(a1, v20);
    case 0xE:
      char v21 = a2[8];
      return cmp_write_u8(a1, v21);
    case 0xF:
      unsigned int v22 = *((unsigned __int16 *)a2 + 4);
      return cmp_write_u16(a1, v22);
    case 0x10:
      unsigned int v23 = *((_DWORD *)a2 + 2);
      return cmp_write_u32(a1, v23);
    case 0x11:
      unint64_t v24 = *((void *)a2 + 1);
      return cmp_write_u64(a1, v24);
    case 0x12:
      char v25 = a2[8];
      return cmp_write_s8(a1, v25);
    case 0x13:
      unsigned int v26 = *((__int16 *)a2 + 4);
      return cmp_write_s16(a1, v26);
    case 0x14:
      unsigned int v27 = *((_DWORD *)a2 + 2);
      return cmp_write_s32(a1, v27);
    case 0x15:
      unint64_t v28 = *((void *)a2 + 1);
      return cmp_write_s64(a1, v28);
    case 0x16:
      char v29 = a2[8];
      return cmp_write_fixext1_marker(a1, v29);
    case 0x17:
      char v30 = a2[8];
      return cmp_write_fixext2_marker(a1, v30);
    case 0x18:
      char v31 = a2[8];
      return cmp_write_fixext4_marker(a1, v31);
    case 0x19:
      char v32 = a2[8];
      return cmp_write_fixext8_marker(a1, v32);
    case 0x1A:
      char v33 = a2[8];
      return cmp_write_fixext16_marker(a1, v33);
    case 0x1C:
      unsigned int v35 = *((unsigned __int16 *)a2 + 4);
      return cmp_write_str16_marker(a1, v35);
    case 0x1D:
      unsigned int v36 = *((_DWORD *)a2 + 2);
      return cmp_write_str32_marker(a1, v36);
    case 0x1E:
      unsigned int v37 = *((unsigned __int16 *)a2 + 4);
      return cmp_write_array16(a1, v37);
    case 0x1F:
      unsigned int v38 = *((_DWORD *)a2 + 2);
      return cmp_write_array32(a1, v38);
    case 0x20:
      unsigned int v39 = *((unsigned __int16 *)a2 + 4);
      return cmp_write_map16(a1, v39);
    case 0x21:
      unsigned int v40 = *((_DWORD *)a2 + 2);
      return cmp_write_map32(a1, v40);
    case 0x22:
      if (a2[8] < 0xE0u)
      {
LABEL_99:
        char v34 = 5;
      }
      else
      {
        char v48 = a2[8];
        uint64_t v3 = 1;
        uint64_t v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v48, 1);
LABEL_97:
        if (v4 == 1) {
          return v3;
        }
        char v34 = 6;
      }
      uint64_t v3 = 0;
LABEL_104:
      *(unsigned char *)a1 = v34;
      return v3;
    default:
      uint64_t v3 = 0;
      char v34 = 13;
      goto LABEL_104;
  }
}

uint64_t cmp_read_pfix(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if ((_BYTE)v5)
    {
      uint64_t result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v6;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_nfix(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 34)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_sfix(unsigned char *a1, unsigned char *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    if (v6 == 34 || v6 == 0)
    {
      *a2 = v7;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s8(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 18)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s16(unsigned char *a1, _WORD *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 19)
    {
      *a2 = bswap32((unsigned __int16)v6) >> 16;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s32(unsigned char *a1, _DWORD *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 20)
    {
      *a2 = bswap32(v6);
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s64(unsigned char *a1, void *a2)
{
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 21)
    {
      *a2 = bswap64(v6);
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_char(unsigned char *a1, unsigned char *a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if (result)
  {
    if (v7 > 0x11u)
    {
      if (v7 != 34 && v7 != 18) {
        goto LABEL_14;
      }
    }
    else if ((_BYTE)v7)
    {
      if (v7 != 14 || (char v5 = v8, (char)v8 < 0))
      {
LABEL_14:
        uint64_t result = 0;
        *a1 = 13;
        return result;
      }
LABEL_13:
      *a2 = v5;
      return 1;
    }
    char v5 = v8;
    goto LABEL_13;
  }
  return result;
}

uint64_t cmp_read_short(unsigned char *a1, _WORD *a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if (result)
  {
    switch((char)v7)
    {
      case 14:
        __int16 v5 = v8;
        goto LABEL_13;
      case 15:
        __int16 v5 = v8;
        if ((__int16)v8 < 0) {
          goto LABEL_11;
        }
        goto LABEL_13;
      case 16:
      case 17:
        goto LABEL_11;
      case 18:
        goto LABEL_9;
      case 19:
        __int16 v5 = v8;
        goto LABEL_13;
      default:
        if (v7 == 34 || v7 == 0)
        {
LABEL_9:
          __int16 v5 = (char)v8;
LABEL_13:
          *a2 = v5;
          uint64_t result = 1;
        }
        else
        {
LABEL_11:
          uint64_t result = 0;
          *a1 = 13;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_int(unsigned char *a1, _DWORD *a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if (result)
  {
    switch((char)v7)
    {
      case 14:
        int v5 = v8;
        goto LABEL_15;
      case 15:
        int v5 = (unsigned __int16)v8;
        goto LABEL_15;
      case 16:
        int v5 = v8;
        if ((v8 & 0x80000000) != 0) {
          goto LABEL_12;
        }
        goto LABEL_15;
      case 17:
        goto LABEL_12;
      case 18:
        goto LABEL_9;
      case 19:
        int v5 = (__int16)v8;
        goto LABEL_15;
      case 20:
        int v5 = v8;
        goto LABEL_15;
      default:
        if (v7 == 34 || v7 == 0)
        {
LABEL_9:
          int v5 = (char)v8;
LABEL_15:
          *a2 = v5;
          uint64_t result = 1;
        }
        else
        {
LABEL_12:
          uint64_t result = 0;
          *a1 = 13;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_long(unsigned char *a1, void *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    switch((char)v6)
    {
      case 14:
        uint64_t v5 = v7;
        goto LABEL_13;
      case 15:
        uint64_t v5 = (unsigned __int16)v7;
        goto LABEL_13;
      case 16:
        uint64_t v5 = v7;
        goto LABEL_13;
      case 17:
        uint64_t v5 = v7;
        if (v7 < 0) {
          goto LABEL_9;
        }
        goto LABEL_13;
      case 18:
      case 34:
        goto LABEL_5;
      case 19:
        uint64_t v5 = (__int16)v7;
        goto LABEL_13;
      case 20:
        uint64_t v5 = (int)v7;
        goto LABEL_13;
      case 21:
        uint64_t v5 = v7;
        goto LABEL_13;
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
        goto LABEL_9;
      default:
        if ((_BYTE)v6)
        {
LABEL_9:
          uint64_t result = 0;
          *a1 = 13;
        }
        else
        {
LABEL_5:
          uint64_t v5 = (char)v7;
LABEL_13:
          *a2 = v5;
          uint64_t result = 1;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_u8(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 14)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_u16(unsigned char *a1, _WORD *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 15)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_u32(unsigned char *a1, _DWORD *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 16)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_u64(unsigned char *a1, void *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 17)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_uchar(unsigned char *a1, unsigned char *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    if (v6 == 14 || v6 == 0)
    {
      *a2 = v7;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ushort(unsigned char *a1, _WORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    if (!(_BYTE)v6) {
      goto LABEL_5;
    }
    if (v6 == 15)
    {
      __int16 v5 = v7;
      goto LABEL_7;
    }
    if (v6 == 14)
    {
LABEL_5:
      __int16 v5 = v7;
LABEL_7:
      *a2 = v5;
      return 1;
    }
    uint64_t result = 0;
    *a1 = 13;
  }
  return result;
}

uint64_t cmp_read_uint(unsigned char *a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    if (v6 <= 0xEu)
    {
      if ((_BYTE)v6 && v6 != 14) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v6 == 15)
      {
        int v5 = (unsigned __int16)v7;
        goto LABEL_12;
      }
      if (v6 == 16)
      {
        int v5 = v7;
        goto LABEL_12;
      }
      if (v6 != 34)
      {
LABEL_14:
        uint64_t result = 0;
        *a1 = 13;
        return result;
      }
    }
    int v5 = v7;
LABEL_12:
    *a2 = v5;
    return 1;
  }
  return result;
}

uint64_t cmp_read_ulong(unsigned char *a1, void *a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if (result)
  {
    switch((char)v7)
    {
      case 14:
        goto LABEL_9;
      case 15:
        uint64_t v5 = (unsigned __int16)v8;
        goto LABEL_12;
      case 16:
        uint64_t v5 = v8;
        goto LABEL_12;
      case 17:
        uint64_t v5 = v8;
        goto LABEL_12;
      default:
        if (v7 == 34 || v7 == 0)
        {
LABEL_9:
          uint64_t v5 = v8;
LABEL_12:
          *a2 = v5;
          uint64_t result = 1;
        }
        else
        {
          uint64_t result = 0;
          *a1 = 13;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_float(unsigned char *a1, _DWORD *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 12)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_double(unsigned char *a1, void *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 13)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_nil(unsigned char *a1)
{
  v3[0] = 0;
  v3[1] = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)v3);
  if (result)
  {
    if (LOBYTE(v3[0]) == 4)
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_BOOL(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 5)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_str_size(unsigned char *a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    if (v6 > 0x1Du || ((1 << v6) & 0x38000008) == 0)
    {
      uint64_t result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v7;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_str(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v10)) {
    return 0;
  }
  if (v10 > 0x1Du || ((1 << v10) & 0x38000008) == 0)
  {
    *(unsigned char *)a1 = 13;
    return 0;
  }
  uint64_t v7 = v11;
  if ((v11 + 1) <= *a3)
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 16))(a1, a2, v11))
    {
      *(unsigned char *)(a2 + v7) = 0;
      *a3 = v7;
      return 1;
    }
    uint64_t result = 0;
    char v9 = 9;
  }
  else
  {
    uint64_t result = 0;
    *a3 = v11;
    char v9 = 1;
  }
  *(unsigned char *)a1 = v9;
  return result;
}

uint64_t cmp_read_bin_size(unsigned char *a1, _DWORD *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 - 6 > 2)
    {
      uint64_t result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v6;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_bin(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v9)) {
    return 0;
  }
  if (v9 - 6 >= 3)
  {
    *(unsigned char *)a1 = 13;
    return 0;
  }
  int v6 = v10;
  if (v10 <= *a3)
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 16))(a1, a2, v10))
    {
      *a3 = v6;
      return 1;
    }
    uint64_t result = 0;
    char v8 = 9;
  }
  else
  {
    uint64_t result = 0;
    char v8 = 2;
  }
  *(unsigned char *)a1 = v8;
  return result;
}

uint64_t cmp_read_array(unsigned char *a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    if (v6 > 0x1Fu || ((1 << v6) & 0xC0000004) == 0)
    {
      uint64_t result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v7;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_map(unsigned char *a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if (result)
  {
    if (v6 > 0x21u || ((1 << v6) & 0x300000002) == 0)
    {
      uint64_t result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v7;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_fixext1_marker(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 22)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext1(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v8)) {
    return 0;
  }
  if (v8 != 22)
  {
    *(unsigned char *)a1 = 13;
    return 0;
  }
  *a2 = v9;
  uint64_t v6 = 1;
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 1) & 1) == 0)
  {
    uint64_t v6 = 0;
    *(unsigned char *)a1 = 9;
  }
  return v6;
}

uint64_t cmp_read_fixext2_marker(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 23)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext2(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7)) {
    return 0;
  }
  if (v7 != 23)
  {
    *(unsigned char *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 2)) {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = 9;
  return result;
}

uint64_t cmp_read_fixext4_marker(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 24)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext4(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7)) {
    return 0;
  }
  if (v7 != 24)
  {
    *(unsigned char *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 4)) {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = 9;
  return result;
}

uint64_t cmp_read_fixext8_marker(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 25)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext8(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7)) {
    return 0;
  }
  if (v7 != 25)
  {
    *(unsigned char *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 8)) {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = 9;
  return result;
}

uint64_t cmp_read_fixext16_marker(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if (result)
  {
    if (v5 == 26)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext16(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7)) {
    return 0;
  }
  if (v7 != 26)
  {
    *(unsigned char *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 16)) {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)a1 = 9;
  return result;
}

uint64_t cmp_read_ext8_marker(unsigned char *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if (result)
  {
    if (v7 == 9)
    {
      *a2 = v8;
      *a3 = BYTE4(v8);
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ext8(uint64_t a1, unsigned char *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t result = cmp_read_ext8_marker((unsigned char *)a1, a2, a3);
  if (result)
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 16))(a1, a4, *a3))
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)a1 = 9;
    }
  }
  return result;
}

uint64_t cmp_read_ext16_marker(unsigned char *a1, unsigned char *a2, _WORD *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if (result)
  {
    if (v7 == 10)
    {
      *a2 = v8;
      *a3 = WORD2(v8);
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ext16(uint64_t a1, unsigned char *a2, _WORD *a3, uint64_t a4)
{
  uint64_t result = cmp_read_ext16_marker((unsigned char *)a1, a2, a3);
  if (result)
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 16))(a1, a4, (unsigned __int16)*a3))
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)a1 = 9;
    }
  }
  return result;
}

uint64_t cmp_read_ext32_marker(unsigned char *a1, unsigned char *a2, _DWORD *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if (result)
  {
    if (v7 == 11)
    {
      *a2 = v8;
      *a3 = HIDWORD(v8);
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ext32(uint64_t a1, unsigned char *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t result = cmp_read_ext32_marker((unsigned char *)a1, a2, a3);
  if (result)
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 16))(a1, a4, *a3))
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)a1 = 9;
    }
  }
  return result;
}

uint64_t cmp_read_ext_marker(unsigned char *a1, unsigned char *a2, _DWORD *a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t result = cmp_read_object((uint64_t)a1, (uint64_t)&v8);
  if (result)
  {
    if (v8 > 0x1Au || ((1 << v8) & 0x7C00E00) == 0)
    {
      uint64_t result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v9;
      *a3 = HIDWORD(v9);
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_ext(uint64_t a1, unsigned char *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t result = cmp_read_ext_marker((unsigned char *)a1, a2, a3);
  if (result)
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 16))(a1, a4, *a3))
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)a1 = 9;
    }
  }
  return result;
}

void sub_1B3E20300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E206DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E208D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E20B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E20D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E20E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E20FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E21148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E212BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E214A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void sub_1B3E215EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E21784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E2194C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E22318(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t _UABRCopyDocumentURLForUbiquitousBookmarkData(const __CFString *a1, __CFError **a2)
{
  if (softLinkBRCopyDocumentURLForUbiquitousBookmarkData) {
    return softLinkBRCopyDocumentURLForUbiquitousBookmarkData(a1, a2);
  }
  else {
    return 0;
  }
}

uint64_t _UABRCopyUbiquitousBookmarkDataForDocumentAtURL(const __CFURL *a1, __CFError **a2)
{
  if (softLinkBRCopyUbiquitousBookmarkDataForDocumentAtURL) {
    return softLinkBRCopyUbiquitousBookmarkDataForDocumentAtURL(a1, a2);
  }
  else {
    return 0;
  }
}

void *_UABRCloudDocsErrorDomain()
{
  dispatch_queue_t v0 = getBRCloudDocsErrorDomain();

  return v0;
}

uint64_t (*initBRCopyDocumentURLForUbiquitousBookmarkData(const __CFString *a1, __CFError **a2))(const __CFString *, __CFError **)
{
  uint64_t v4 = (void *)CloudDocsLibrary(void)::frameworkLibrary;
  if (!CloudDocsLibrary(void)::frameworkLibrary)
  {
    uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  uint64_t result = (uint64_t (*)(const __CFString *, __CFError **))dlsym(v4, "BRCopyDocumentURLForUbiquitousBookmarkData");
  softLinkBRCopyDocumentURLForUbiquitousBookmarkCFDataRef Data = result;
  if (result)
  {
    return (uint64_t (*)(const __CFString *, __CFError **))result(a1, a2);
  }
  return result;
}

uint64_t (*initBRCopyUbiquitousBookmarkDataForDocumentAtURL(const __CFURL *a1, __CFError **a2))(const __CFURL *, __CFError **)
{
  uint64_t v4 = (void *)CloudDocsLibrary(void)::frameworkLibrary;
  if (!CloudDocsLibrary(void)::frameworkLibrary)
  {
    uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  uint64_t result = (uint64_t (*)(const __CFURL *, __CFError **))dlsym(v4, "BRCopyUbiquitousBookmarkDataForDocumentAtURL");
  softLinkBRCopyUbiquitousBookmarkDataForDocumentAtURL = result;
  if (result)
  {
    return (uint64_t (*)(const __CFURL *, __CFError **))result(a1, a2);
  }
  return result;
}

id initBRCloudDocsErrorDomain(void)
{
  dispatch_queue_t v0 = (void *)CloudDocsLibrary(void)::frameworkLibrary;
  if (!CloudDocsLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  uint64_t v1 = (id *)dlsym(v0, "BRCloudDocsErrorDomain");
  objc_storeStrong((id *)&constantBRCloudDocsErrorDomain, *v1);
  getBRCloudDocsErrorDomain = (uint64_t (*)(void))BRCloudDocsErrorDomainFunction;
  uint64_t v2 = (void *)constantBRCloudDocsErrorDomain;

  return v2;
}

id BRCloudDocsErrorDomainFunction(void)
{
  return (id)constantBRCloudDocsErrorDomain;
}

id UASharedPasteboardManagerServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYPASTEBOARD", @"com.apple.coreservices.uasharedpasteboardmanager.xpc");
}

id UASharedPasteboardAUXServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYPASTEBOARDAUX", @"com.apple.coreservices.uasharedpasteboardaux.xpc");
}

id UASharedPasteboardControllServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYPASTEBOARDAUX", @"com.apple.coreservices.uasharedpasteboardcontroll.xpc");
}

id _UAGetSharedPasteboardManagerProtocolInterface()
{
  if (_UAGetSharedPasteboardManagerProtocolInterface_once != -1) {
    dispatch_once(&_UAGetSharedPasteboardManagerProtocolInterface_once, &__block_literal_global_154);
  }
  dispatch_queue_t v0 = (void *)_UAGetSharedPasteboardManagerProtocolInterface_result;

  return v0;
}

id _UAGetSharedPasteboardManagerResponseProtocolInterface()
{
  if (_UAGetSharedPasteboardManagerResponseProtocolInterface_once != -1) {
    dispatch_once(&_UAGetSharedPasteboardManagerResponseProtocolInterface_once, &__block_literal_global_175);
  }
  dispatch_queue_t v0 = (void *)_UAGetSharedPasteboardManagerResponseProtocolInterface_result;

  return v0;
}

id _UAGetSharedPasteboardAUXProtocolInterface()
{
  if (_UAGetSharedPasteboardAUXProtocolInterface_once != -1) {
    dispatch_once(&_UAGetSharedPasteboardAUXProtocolInterface_once, &__block_literal_global_185);
  }
  dispatch_queue_t v0 = (void *)_UAGetSharedPasteboardAUXProtocolInterface_result;

  return v0;
}

id _UAGetSharedPasteboardControllProtocolInterface()
{
  if (_UAGetSharedPasteboardControllProtocolInterface_once != -1) {
    dispatch_once(&_UAGetSharedPasteboardControllProtocolInterface_once, &__block_literal_global_188);
  }
  dispatch_queue_t v0 = (void *)_UAGetSharedPasteboardControllProtocolInterface_result;

  return v0;
}

BOOL isEarlierThan(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4) {
      BOOL v6 = [v3 compare:v4] == -1;
    }
    else {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void sub_1B3E24BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL isEarlierThanNow(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v3 = isEarlierThan(v1, v2);

  return v3;
}

void sub_1B3E24C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL isLaterThan(void *a1, void *a2)
{
  return !isEarlierThan(a1, a2);
}

BOOL isLaterThanNow(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v3 = !isEarlierThan(v1, v2);

  return v3;
}

void sub_1B3E24CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id teamIDFromApplicationIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0xB)
  {
    uint64_t v3 = [v2 rangeOfString:@"."];
    id v4 = 0;
    if (v5 == 1 && v3 == 10)
    {
      id v4 = [v2 substringToIndex:10];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_1B3E24D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id trimmedDataString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0x41)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v2, "bytes"), 64, 0);
    id v4 = [v3 description];
  }
  else
  {
    id v4 = [v2 description];
  }

  return v4;
}

void sub_1B3E24E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *timeoutStr(double a1)
{
  if (a1 >= 1.0e98)
  {
    id v1 = @"forever";
    goto LABEL_14;
  }
  if (a1 <= 0.0)
  {
    id v1 = @"now";
    goto LABEL_14;
  }
  if (a1 < 300.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld seconds", (uint64_t)a1);
LABEL_13:
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (a1 < 3600.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"roughly %ld minutes", (uint64_t)a1 / 60);
    goto LABEL_13;
  }
  if (a1 < 86400.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"roughly %ld hours", (uint64_t)a1 / 3600);
    goto LABEL_13;
  }
  if (a1 < 7776000.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"roughly %ld days", 3600 * ((uint64_t)a1 / 24));
    goto LABEL_13;
  }
  id v1 = @"a long time";
LABEL_14:

  return v1;
}

__CFString *dispatchTimeStr(unint64_t a1)
{
  if (a1 == -1)
  {
    id v4 = @"forever";
    goto LABEL_9;
  }
  if (!a1 || (v2 = dispatch_time(0, 0), v2 > a1) || (double v3 = ((double)a1 - (double)v2) / 1000000000.0, v3 <= 0.0))
  {
    id v4 = @"now";
    goto LABEL_9;
  }
  if (v3 < 10.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%2.1g seconds", *(void *)&v3);
LABEL_20:
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v3 < 30.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%2ld seconds", (uint64_t)v3);
    goto LABEL_20;
  }
  if (v3 < 300.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%3ld seconds", (uint64_t)v3);
    goto LABEL_20;
  }
  if (v3 < 3600.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"roughly %2ld minutes", (uint64_t)v3 / 60);
    goto LABEL_20;
  }
  BOOL v6 = NSString;
  if (v3 < 86400.0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"roughly %2ld hours", (uint64_t)(v3 / 60.0) / 24);
    goto LABEL_20;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
  id v4 = [v6 stringWithFormat:@"%@", v7];

LABEL_9:

  return v4;
}

void sub_1B3E251B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL isSuggestedActionTypeAdvertiseable(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

double currentAbsoluteTime()
{
  uint64_t v0 = mach_absolute_time();
  if (!v0) {
    return NAN;
  }
  unint64_t v1 = v0;
  mach_timebase_info info = 0;
  if (mach_timebase_info(&info)) {
    return NAN;
  }
  LODWORD(v2) = info.numer;
  LODWORD(v3) = info.denom;
  double result = (double)v1 * (double)v2 / (double)v3 / 1000000000.0;
  double v5 = fabs(result);
  if (result < 0.0 || v5 == INFINITY) {
    return NAN;
  }
  return result;
}

uint64_t applicationProxyCanHandleWebBrowserContinuation(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1
    && ([v1 appState],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isInstalled],
        v3,
        v2,
        v4))
  {
    double v5 = [v2 activityTypes];
    BOOL v6 = v5;
    if (v5) {
      uint64_t v7 = [v5 containsObject:@"NSUserActivityTypeBrowsingWeb"];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1B3E252F8(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id applicationProxyForWebBrowserSupportingContinuation()
{
  id v0 = objc_alloc(MEMORY[0x1E4F22408]);
  id v1 = [MEMORY[0x1E4F1CB10] URLWithString:@"https:"];
  id v9 = 0;
  unint64_t v2 = (void *)[v0 initWithURL:v1 error:&v9];
  id v3 = v9;

  if (v2)
  {
    int v4 = [v2 bundleRecord];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v6 = [v2 bundleRecord];
      uint64_t v7 = [v6 compatibilityObject];

      if (v7)
      {
        if (applicationProxyCanHandleWebBrowserContinuation(v7)) {
          goto LABEL_7;
        }
      }
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilesafari"];
LABEL_7:

  return v7;
}

void sub_1B3E25468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id userActivityInfoOptionsDictionaryString(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    goto LABEL_20;
  }
  unint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [v1 allKeys];
  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x1E4F224B0];
    uint64_t v14 = *MEMORY[0x1E4F224B8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v8 isEqual:v6])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"fileProvider:%@", v9];
        }
        else if ([v8 isEqual:v14])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"unsyncronizedCloudDocs:%@", v9];
        }
        else if ([v8 isEqual:@"UAUserActivityContainsCloudDocsKey"])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"cloudDocs:%@", v9];
        }
        else if ([v8 isEqual:@"UAUserActivityItemIsNotActiveKey"])
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          [v2 appendFormat:@"inactive:%@", v9];
        }
        else
        {
          id v9 = [v1 objectForKeyedSubscript:v8];
          uint64_t v10 = [v9 description];
          uint64_t v11 = stringRemovingNewlines(v10);
          [v2 appendFormat:@"%@=%@", v8, v11];
        }
      }
      id v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  [v2 appendFormat:@"}"];
  if (v2)
  {
    unsigned int v12 = (void *)[v2 copy];
  }
  else
  {
LABEL_20:
    unsigned int v12 = 0;
  }

  return v12;
}

void sub_1B3E2578C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B3E25D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E26268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_1B3E26648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_1B3E268A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E27078(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E27830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id obj)
{
}

void sub_1B3E28114(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E28A94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E293E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E29DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E2ABA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E2B64C(_Unwind_Exception *a1)
{
}

void sub_1B3E2C594(_Unwind_Exception *a1)
{
}

void sub_1B3E2C808(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B3E2CD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E2D520(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exc_buf);
    unsigned int v12 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LODWORD(a9) = 138543362;
      *(void *)((char *)&a9 + 4) = v11;
      _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_FAULT, "Exception accessing data file: %{public}@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1B3E2D4C4);
  }
  objc_sync_exit(v9);
  _Unwind_Resume(exc_buf);
}

void sub_1B3E2DAB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E2DBE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E2E324(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E31CD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E32534(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __dTraceProcessIdentifier_block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];

  if (!v1)
  {
    uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"[PID:%lld]", getpid());
    if (v2) {
      uint64_t v1 = (__CFString *)v2;
    }
    else {
      uint64_t v1 = @"unknown";
    }
  }
  id v3 = v1;
  dTraceProcessIdentifier_double result = (uint64_t)strdup((const char *)[(__CFString *)v3 UTF8String]);
}

BOOL rateLimitTenPercent(int a1, int a2)
{
  return a1 == 1
      || (int)((double)(a1 - 1) / (double)a2 * 10.0) % 10 != (int)((double)a1 / (double)a2 * 10.0) % 10
      || a1 == a2;
}

void sub_1B3E33C10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _UACheckEntitlementForSecTask(__SecTask *a1, const __CFString *a2)
{
  if (!a1) {
    return 0;
  }
  CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(a1, a2, 0);
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFNumberRef v4 = (const __CFNumber *)CFGetTypeID(v2);
  if (v4 == (const __CFNumber *)CFBooleanGetTypeID())
  {
    uint64_t Value = CFBooleanGetValue(v3);
  }
  else if (v4 == (const __CFNumber *)CFNumberGetTypeID())
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
    uint64_t Value = valuePtr != 0;
  }
  else
  {
    uint64_t Value = 0;
  }
  CFRelease(v3);
  return Value;
}

uint64_t _UAGetAuditTokenForSelf(void)
{
  if (_UAGetAuditTokenForSelf(void)::once != -1) {
    dispatch_once(&_UAGetAuditTokenForSelf(void)::once, &__block_literal_global_9);
  }
  return _UAGetAuditTokenForSelf(void)::result;
}

void ___Z23_UAGetAuditTokenForSelfv_block_invoke()
{
  kern_return_t v0;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];

  task_info_outCnt = 8;
  id v0 = task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt);
  if (!v0) {
    operator new();
  }
  syslog(3, "failed to get audit token for current process: %llx", v0);
}

uint64_t _UAIsAuditTokenSandboxed(uint64_t result, BOOL *a2)
{
  if (result)
  {
    double result = sandbox_check_by_audit_token();
    if (a2) {
      *a2 = result != 0;
    }
  }
  return result;
}

__CFString *_UACopyCodeSigningIdentifierForAuditToken(_OWORD *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v2 = a1[1];
  *(_OWORD *)v7.val = *a1;
  *(_OWORD *)&v7.val[4] = v2;
  CFBooleanRef v3 = SecTaskCreateWithAuditToken(v1, &v7);
  CFNumberRef v4 = v3;
  if (v3)
  {
    uint64_t v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, 0);
    CFRelease(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1B3E35250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initCSSearchableIndex()
{
  if (!CoreSpotlightLibrary_frameworkLibrary) {
    CoreSpotlightLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  }
  Class result = objc_getClass("CSSearchableIndex");
  classCSSearchableIndex = (uint64_t)result;
  getCSSearchableIndexClass = (uint64_t (*)())CSSearchableIndexFunction;
  return result;
}

id CSSearchableIndexFunction()
{
  return (id)classCSSearchableIndex;
}

void sub_1B3E36070(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E366F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3E3779C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E3785C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B3E37BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3E37CD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *UAResumableActivitiesManagerServiceName()
{
  id v0 = getenv("_UAUSERACTIVITYADMIN");
  if (v0)
  {
    CFAllocatorRef v1 = [NSString stringWithCString:v0 encoding:4];
  }
  else
  {
    CFAllocatorRef v1 = @"com.apple.coreservices.lsuseractivityadministration.xpc";
  }

  return v1;
}

id _LSGetResumableActivitiesAdministrativeProtocolInterface()
{
  if (_LSGetResumableActivitiesAdministrativeProtocolInterface_once != -1) {
    dispatch_once(&_LSGetResumableActivitiesAdministrativeProtocolInterface_once, &__block_literal_global_12);
  }
  id v0 = (void *)_LSGetResumableActivitiesAdministrativeProtocolInterface_result;

  return v0;
}

id _LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface()
{
  if (_LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface_once != -1) {
    dispatch_once(&_LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface_once, &__block_literal_global_112);
  }
  id v0 = (void *)_LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface_result;

  return v0;
}

CFDataRef _UACopyPackedDataForObject(void *a1, uint64_t a2)
{
  return UAMessagePack::CopyPacked(a1, a2, 0, 0);
}

CFTypeRef _UACopyUnpackedObjectFromDataWithSubstitution(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  id v11 = UAMessageUnpack::CopyUnpacked(a1, a2, a3, v9, v10);
  if (v11) {
    CFTypeRef v12 = CFRetain(v11);
  }
  else {
    CFTypeRef v12 = 0;
  }

  return v12;
}

void sub_1B3E38B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t UAMessagePack::mp_reader()
{
  return 0;
}

void UAMessagePack::~UAMessagePack(id *this)
{
}

uint64_t UAMessageUnpack::mp_writer()
{
  return 0;
}

id UAMessageUnpack::readArray(UAMessageUnpack *this, unsigned int a2)
{
  if (a2 >= 0x3E8) {
    uint64_t v4 = 1000;
  }
  else {
    uint64_t v4 = a2;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (a2)
  {
    uint64_t v6 = a2;
    while (1)
    {
      audit_token_t v7 = UAMessageUnpack::readFromContext(this);
      if (!v7) {
        break;
      }
      [v5 addObject:v7];

      if (!--v6) {
        goto LABEL_8;
      }
    }
    id v8 = 0;
  }
  else
  {
LABEL_8:
    id v8 = v5;
  }

  return v8;
}

void sub_1B3E38D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UAMessageUnpack::readFromContextOfClass(UAMessageUnpack *this, objc_class *a2)
{
  CFBooleanRef v3 = UAMessageUnpack::readFromContext(this);
  if (v3 && (!a2 || (objc_opt_isKindOfClass() & 1) == 0))
  {

    CFBooleanRef v3 = 0;
  }

  return v3;
}

void sub_1B3E38D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7A90](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return MEMORY[0x1F40DEE98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x1F40CDA00](a1);
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA08](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}
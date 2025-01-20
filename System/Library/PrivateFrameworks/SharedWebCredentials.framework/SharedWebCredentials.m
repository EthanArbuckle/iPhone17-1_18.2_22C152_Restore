void sub_1ABCD88BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABCD89B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCD8E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id _SWCGetBundle()
{
  if (qword_1EB67B198 != -1) {
    dispatch_once(&qword_1EB67B198, &__block_literal_global_5);
  }
  v0 = (void *)_MergedGlobals_5;
  return v0;
}

void sub_1ABCD9138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _SWCIsAuditTokenEntitled(_OWORD *a1, int a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1AD1157F0]();
  long long v5 = a1[1];
  *(_OWORD *)v29.val = *a1;
  *(_OWORD *)&v29.val[4] = v5;
  pid_t v6 = audit_token_to_pid(&v29);
  if (qword_1EB67B168 != -1) {
    dispatch_once(&qword_1EB67B168, &__block_literal_global_101);
  }
  v7 = qword_1EB67B160;
  if (os_log_type_enabled((os_log_t)qword_1EB67B160, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v6;
    _os_log_debug_impl(&dword_1ABCD7000, v7, OS_LOG_TYPE_DEBUG, "Checking connection from %llu for various SWC-tracked entitlements", buf, 0xCu);
  }
  if (qword_1EB67B210
    && (+[_SWCPrefs sharedPrefs],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isAppleInternal],
        v8,
        v9))
  {
    if (qword_1EB67B168 != -1) {
      dispatch_once(&qword_1EB67B168, &__block_literal_global_101);
    }
    v10 = qword_1EB67B160;
    if (os_log_type_enabled((os_log_t)qword_1EB67B160, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v6;
      __int16 v31 = 2114;
      uint64_t v32 = qword_1EB67B210;
      _os_log_impl(&dword_1ABCD7000, v10, OS_LOG_TYPE_DEFAULT, "Using artificially-enforced entitlements for %llu: %{public}@", buf, 0x16u);
    }
    id v11 = (id)qword_1EB67B210;
  }
  else
  {
    v12 = (void *)xpc_copy_entitlements_data_for_token();
    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      bytes_ptr = xpc_data_get_bytes_ptr(v12);
      id v15 = (id)[v13 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v12) freeWhenDone:0];
      if (qword_1EB67B178 != -1) {
        dispatch_once(&qword_1EB67B178, &__block_literal_global_104);
      }
      *(void *)buf = 0;
      int Filtered = _CFPropertyListCreateFiltered();
      id v17 = *(id *)buf;
      if (Filtered && (v18 = _NSIsNSDictionary(), id v17 = *(id *)buf, v18))
      {
        id v17 = *(id *)buf;
        id v11 = v17;
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  if (v11)
  {
    v19 = [v11 objectForKeyedSubscript:@"com.apple.private.associated-domains"];
    int v20 = [v19 isEqual:MEMORY[0x1E4F1CC38]];

    if (((v20 | a2) & 1) == 0)
    {
      v21 = [v11 objectForKeyedSubscript:@"com.apple.private.canGetAppLinkInfo"];
      LOBYTE(v20) = [v21 isEqual:MEMORY[0x1E4F1CC38]];
    }
    if ((v20 & 1) != 0
      || ([v11 objectForKeyedSubscript:@"com.apple.private.canModifyAppLinkPermissions"],
          v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = [v22 isEqual:MEMORY[0x1E4F1CC38]],
          v22,
          (v23 & 1) != 0))
    {
      uint64_t v24 = 1;
LABEL_36:
      if (qword_1EB67B168 != -1) {
        dispatch_once(&qword_1EB67B168, &__block_literal_global_101);
      }
      v26 = qword_1EB67B160;
      if (os_log_type_enabled((os_log_t)qword_1EB67B160, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = v6;
        if (a2) {
          v28 = "read-write";
        }
        else {
          v28 = "read-only";
        }
        __int16 v31 = 2082;
        uint64_t v32 = (uint64_t)v28;
        __int16 v33 = 1024;
        int v34 = v24;
        _os_log_debug_impl(&dword_1ABCD7000, v26, OS_LOG_TYPE_DEBUG, "Connection from %llu entitled for %{public}s access? %{BOOL}i", buf, 0x1Cu);
      }
      goto LABEL_39;
    }
  }
  if (qword_1EB67B210 || v6 != getpid())
  {
    uint64_t v24 = 0;
    goto LABEL_36;
  }
  if (qword_1EB67B168 != -1) {
    dispatch_once(&qword_1EB67B168, &__block_literal_global_101);
  }
  v25 = qword_1EB67B160;
  if (os_log_type_enabled((os_log_t)qword_1EB67B160, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v6;
    _os_log_debug_impl(&dword_1ABCD7000, v25, OS_LOG_TYPE_DEBUG, "Treating connection from self (%llu) as entitled", buf, 0xCu);
  }
  uint64_t v24 = 1;
LABEL_39:

  return v24;
}

void sub_1ABCD9630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDA09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

id _SWCGetServerConnection()
{
  os_unfair_lock_lock(&gLock);
  v0 = (void *)_MergedGlobals_3;
  if (!_MergedGlobals_3)
  {
    v1 = (void *)MEMORY[0x1AD1157F0]();
    uint64_t v2 = gTestListener;
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    v4 = v3;
    if (v2)
    {
      long long v5 = [(id)gTestListener endpoint];
      uint64_t v6 = [v4 initWithListenerEndpoint:v5];
      v7 = (void *)_MergedGlobals_3;
      _MergedGlobals_3 = v6;
    }
    else
    {
      uint64_t v8 = [v3 initWithMachServiceName:@"com.apple.SharedWebCredentials" options:4096];
      long long v5 = (void *)_MergedGlobals_3;
      _MergedGlobals_3 = v8;
    }

    int v9 = _SWCGetServerInterface();
    [(id)_MergedGlobals_3 setRemoteObjectInterface:v9];

    [(id)_MergedGlobals_3 setInterruptionHandler:&__block_literal_global_3];
    [(id)_MergedGlobals_3 setInvalidationHandler:&__block_literal_global_4];
    [(id)_MergedGlobals_3 resume];
    v0 = (void *)_MergedGlobals_3;
  }
  id v10 = v0;
  os_unfair_lock_unlock(&gLock);
  return v10;
}

void sub_1ABCDA2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _SWCGetServerInterface()
{
  if (qword_1EB67B158 != -1) {
    dispatch_once(&qword_1EB67B158, &__block_literal_global_6);
  }
  v0 = (void *)qword_1EB67B150;
  return v0;
}

void ___ZL6getLogv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.swc", "pattern");
  v1 = (void *)qword_1EB67B050;
  qword_1EB67B050 = (uint64_t)v0;
}

void ___ZL6getLogv_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.swc", "settings");
  v1 = (void *)qword_1EB67B080;
  qword_1EB67B080 = (uint64_t)v0;
}

void ___ZL6getLogv_block_invoke_1()
{
  os_log_t v0 = os_log_create("com.apple.swc", "cbx");
  v1 = (void *)qword_1EB67B0B0;
  qword_1EB67B0B0 = (uint64_t)v0;
}

void ___ZL6getLogv_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.swc", "db");
  v1 = (void *)qword_1EB67B128;
  qword_1EB67B128 = (uint64_t)v0;
}

void ___ZL6getLogv_block_invoke_3()
{
  os_log_t v0 = os_log_create("com.apple.swc", "xpc");
  v1 = (void *)qword_1EB67B160;
  qword_1EB67B160 = (uint64_t)v0;
}

void ___ZL6getLogv_block_invoke_4()
{
  os_log_t v0 = os_log_create("com.apple.swc", "tracking-domains");
  v1 = (void *)qword_1EB67B1B0;
  qword_1EB67B1B0 = (uint64_t)v0;
}

void ___ZL6getLogv_block_invoke_5()
{
  os_log_t v0 = os_log_create("com.apple.swc", "domain");
  v1 = (void *)qword_1EB67B1D0;
  qword_1EB67B1D0 = (uint64_t)v0;
}

void sub_1ABCDA530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDAAC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDAC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDAE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDAEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table(v13);

  _Unwind_Resume(a1);
}

unint64_t SWCPatternStorage::evaluate(SWCPatternStorage *this, NSURLComponents *a2, const SWCFNMatch *a3, const audit_token_t *a4)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (!a2 || (uint64_t v6 = this, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    v48 = objc_msgSend(NSString, "stringWithUTF8String:", "SWCPatternMatchResult SWCPatternStorage::evaluate(NSURLComponents *const __strong, const SWCFNMatch *, const audit_token_t *) const");
    [v51 handleFailureInFunction:v48, @"SWCPattern.mm", 1503, @"Invalid parameter not satisfying: %@", @"components && [components isKindOfClass:[NSURLComponents class]]" file lineNumber description];
    uint64_t v6 = this;
  }
  context = (void *)MEMORY[0x1AD1157F0]();
  cStrings = v6->cStrings;
  unsigned int v8 = *(unsigned char *)v6;
  LOBYTE(v65) = 0;
  char v67 = 0;
  if ((v8 & 2) != 0)
  {
    v65 = v6->cStrings;
    size_t v66 = strlen(v6->cStrings);
    char v67 = 1;
    cStrings += v66 + 1;
  }
  LOBYTE(v62) = 0;
  char v64 = 0;
  if ((v8 & 4) != 0)
  {
    v62 = cStrings;
    size_t v63 = strlen(cStrings);
    char v64 = 1;
    cStrings += v63 + 1;
  }
  LOBYTE(v59) = 0;
  char v61 = 0;
  unsigned int v9 = ((v8 >> 3) & 3) - 3;
  if (v9 >= 0xFFFFFFFE)
  {
    v59 = cStrings;
    size_t v60 = strlen(cStrings);
    char v61 = 1;
    cStrings += v60 + 1;
  }
  if ((v8 & 0x80) != 0)
  {
    v57[0] = cStrings;
    v57[1] = (const char *)strlen(cStrings);
    char v58 = 1;
    if (!SWCPatternStorage::_CheckEntitlement((uint64_t)a4, v57))
    {
      v85 = "com.apple.private.associated-domains.ignore-required-entitlements";
      uint64_t v86 = 65;
      if (!SWCPatternStorage::_CheckEntitlement((uint64_t)a4, &v85)) {
        goto LABEL_44;
      }
    }
  }
  unsigned int v55 = (v8 >> 1) & 0x10;
  if ((v8 & 2) != 0)
  {
    if ((v8 >> 6)) {
      [(NSURLComponents *)a2 path];
    }
    else {
    uint64_t v11 = [(NSURLComponents *)a2 percentEncodedPath];
    }
    uint64_t v13 = (void *)v11;
    v14 = &stru_1F0342F60;
    if (v11) {
      v14 = (__CFString *)v11;
    }
    id v15 = v14;

    unint64_t v12 = SWCPatternStorage::_EvaluateString(v15, (unint64_t)&v65, (uint64_t)a3, v55, 1);
    if ((v8 & 4) == 0)
    {
LABEL_32:
      if (v9 < 0xFFFFFFFE)
      {
        id v10 = this;
        goto LABEL_73;
      }
      if (v12)
      {
LABEL_37:
        unint64_t v52 = v12;
        id v10 = this;
        int v21 = (*(unsigned char *)this >> 3) & 3;
        if (v21 == 1)
        {
          if ((v8 >> 6)) {
            [(NSURLComponents *)a2 query];
          }
          else {
          uint64_t v23 = [(NSURLComponents *)a2 percentEncodedQuery];
          }
          v46 = (void *)v23;
          v47 = &stru_1F0342F60;
          if (v23) {
            v47 = (__CFString *)v23;
          }
          v45 = v47;

          id v10 = this;
          unint64_t v44 = SWCPatternStorage::_EvaluateString(v45, (unint64_t)&v59, (uint64_t)a3, v55, 0);
        }
        else
        {
          if (v21 != 2) {
            goto LABEL_73;
          }
          if ((v8 >> 6)) {
            [(NSURLComponents *)a2 queryItems];
          }
          else {
          uint64_t v22 = [(NSURLComponents *)a2 percentEncodedQueryItems];
          }
          v25 = (void *)v22;
          v26 = (void *)MEMORY[0x1E4F1CBF0];
          if (v22) {
            v26 = (void *)v22;
          }
          v50 = v26;

          uint64_t v80 = 0;
          v81 = &v80;
          uint64_t v82 = 0x2020000000;
          uint64_t v83 = 200;
          v49 = (void *)MEMORY[0x1AD1157F0]();
          v85 = 0;
          uint64_t v86 = (uint64_t)&v85;
          uint64_t v87 = 0x43012000000;
          v88 = __Block_byref_object_copy_;
          v89 = __Block_byref_object_dispose_;
          v90 = &unk_1ABCF39FB;
          v27 = SWCPatternStorage::_ReconstituteQueryJSON(&v59);
          if (v27)
          {
            id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            audit_token_t v29 = v50;
            uint64_t v30 = [(__CFString *)v29 countByEnumeratingWithState:&v76 objects:v84 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v77;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v77 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  __int16 v33 = *(void **)(*((void *)&v76 + 1) + 8 * i);
                  int v34 = [v33 name];
                  uint64_t v35 = [v33 value];
                  v36 = (void *)v35;
                  if (v35) {
                    v37 = (__CFString *)v35;
                  }
                  else {
                    v37 = &stru_1F0342F60;
                  }
                  v38 = v37;

                  v39 = [v27 objectForKeyedSubscript:v34];
                  SWCGetFastUTF8String<1024ul>((uint64_t)v68, v39, (const char *)(v86 + 48));

                  if ((_BYTE)v69)
                  {
                    unint64_t v40 = v81[3];
                    unint64_t v41 = SWCPatternStorage::_EvaluateString(v38, (unint64_t)v68, (uint64_t)a3, v55, 0);
                    if (v40 >= v41) {
                      unint64_t v42 = v41;
                    }
                    else {
                      unint64_t v42 = v40;
                    }
                    v81[3] = v42;
                  }
                  [v28 addObject:v34];
                }
                uint64_t v30 = [(__CFString *)v29 countByEnumeratingWithState:&v76 objects:v84 count:16];
              }
              while (v30);
            }

            v68[0] = MEMORY[0x1E4F143A8];
            v68[1] = 3221225472;
            v69 = ___ZN17SWCPatternStorage18_EvaluateQueryJSONEP7NSArrayIP14NSURLQueryItemERKNSt3__117basic_string_viewIcNS5_11char_traitsIcEEEEPK10SWCFNMatchi_block_invoke;
            v70 = &unk_1E5E51988;
            id v43 = v28;
            id v71 = v43;
            v72 = &v85;
            v73 = &v80;
            v74 = a3;
            unsigned int v75 = v55;
            [v27 enumerateKeysAndObjectsUsingBlock:v68];
          }
          _Block_object_dispose(&v85, 8);
          unint64_t v44 = v81[3];
          _Block_object_dispose(&v80, 8);
          id v10 = this;
          v45 = v50;
        }
        unint64_t v12 = v52;
        if (v44 < v52) {
          unint64_t v12 = v44;
        }

LABEL_73:
        unint64_t result = v12;
        if (v12 != 200) {
          return result;
        }
        goto LABEL_74;
      }
LABEL_44:
      return 0;
    }
    if (!v12) {
      goto LABEL_44;
    }
LABEL_24:
    if ((v8 >> 6)) {
      [(NSURLComponents *)a2 fragment];
    }
    else {
    uint64_t v16 = [(NSURLComponents *)a2 percentEncodedFragment];
    }
    id v17 = (void *)v16;
    int v18 = &stru_1F0342F60;
    if (v16) {
      int v18 = (__CFString *)v16;
    }
    v19 = v18;

    unint64_t v20 = SWCPatternStorage::_EvaluateString(v19, (unint64_t)&v62, (uint64_t)a3, v55, 0);
    if (v20 < v12) {
      unint64_t v12 = v20;
    }

    goto LABEL_32;
  }
  if ((v8 & 4) != 0)
  {
    unint64_t v12 = 200;
    goto LABEL_24;
  }
  if (v9 > 0xFFFFFFFD)
  {
    unint64_t v12 = 200;
    goto LABEL_37;
  }
  id v10 = this;
LABEL_74:
  if (*(unsigned char *)v10) {
    return 100;
  }
  else {
    return 200;
  }
}

void sub_1ABCDB5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t SWCPatternStorage::getSize(SWCPatternStorage *this)
{
  cStrings = this->cStrings;
  unsigned int v2 = *(unsigned char *)this;
  if ((v2 & 2) != 0)
  {
    id v3 = &cStrings[strlen(this->cStrings) + 1];
    if ((v2 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v3 = this->cStrings;
  if ((v2 & 4) != 0) {
LABEL_5:
  }
    v3 += strlen(v3) + 1;
LABEL_6:
  if (((v2 >> 3) & 3) - 1 <= 1) {
    v3 += strlen(v3) + 1;
  }
  if ((v2 & 0x80) != 0) {
    v3 += strlen(v3) + 1;
  }
  return v3 - cStrings + 1;
}

void sub_1ABCDBCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDBFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDC130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDC27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table(v13);

  _Unwind_Resume(a1);
}

void sub_1ABCDC3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDC6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDCB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDCF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t SWCSubstitutionVariable::getSize(SWCSubstitutionVariable *this)
{
  if (*(unsigned char *)this) {
    return 1;
  }
  cStrings = this->cStrings;
  for (uint64_t i = &this->cStrings[strlen(this->cStrings)]; ; uint64_t i = (char *)&v3[strlen(v3)])
  {
    int v4 = i[1];
    id v3 = i + 1;
    if (!v4) {
      break;
    }
  }
  return v3 - cStrings + 2;
}

void sub_1ABCDD354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDD5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDDAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDDC7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDDED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDE1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDE658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id SWCSubstitutionVariable::getValuesNoCopy(SWCSubstitutionVariable *this)
{
  if (*(unsigned char *)this)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((*(unsigned char *)this & 1) == 0)
    {
      size_t v3 = strlen(this->cStrings);
      if ((*(unsigned char *)this & 2) != 0)
      {
        uint64_t v11 = "";
        size_t v12 = 0;
        int v4 = SWCGetNSStringFromStringViewNoCopy(&v11);
        if (v4) {
          [v2 addObject:v4];
        }
      }
      long long v5 = &this->cStrings[v3 + 1];
      if (*v5)
      {
        char v6 = *(unsigned char *)this;
        do
        {
          if ((v6 & 4) != 0) {
            size_t v7 = 1;
          }
          else {
            size_t v7 = strlen(v5);
          }
          uint64_t v11 = v5;
          size_t v12 = v7;
          unsigned int v8 = SWCGetNSStringFromStringViewNoCopy(&v11);
          if (v8) {
            [v2 addObject:v8];
          }

          char v6 = *(unsigned char *)this;
          if ((*(unsigned char *)this & 4) != 0) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = v7 + 1;
          }
          v5 += v9;
        }
        while (*v5);
      }
    }
  }
  return v2;
}

void sub_1ABCDE88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SWCSubstitutionVariable::getNameNoCopy(SWCSubstitutionVariable *this)
{
  if (*(unsigned char *)this)
  {
    v1 = 0;
  }
  else
  {
    v3[0] = this->cStrings;
    v3[1] = strlen(this->cStrings);
    v1 = SWCGetNSStringFromStringViewNoCopy(v3);
  }
  return v1;
}

void sub_1ABCDEB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDEFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCDF14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SWCPatternStorage::_EvaluateString(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "static SWCPatternMatchResult SWCPatternStorage::_EvaluateString(NSString *__strong, const std::string_view &, const SWCFNMatch *, int, BOOL)");
    [v15 handleFailureInFunction:v16, @"SWCPattern.mm", 1252, @"Invalid parameter not satisfying: %@", @"component != nil" file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
LABEL_24:
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    int v18 = objc_msgSend(NSString, "stringWithUTF8String:", "static SWCPatternMatchResult SWCPatternStorage::_EvaluateString(NSString *__strong, const std::string_view &, const SWCFNMatch *, int, BOOL)");
    [v17 handleFailureInFunction:v18, @"SWCPattern.mm", 1253, @"Invalid parameter not satisfying: %@", @"fnmatch != NULL" file lineNumber description];

    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_24;
  }
LABEL_3:
  uint64_t v10 = *(void *)(a2 + 8);
  if (v10 == 1 && **(unsigned char **)a2 == 42)
  {
    uint64_t v11 = 200;
  }
  else
  {
    if (a5)
    {
      id v12 = +[_SWCPattern _normalizedURLPath:v9];

      uint64_t v10 = *(void *)(a2 + 8);
      id v9 = v12;
    }
    if (v10)
    {
      if (*(_DWORD *)(a3 + 32))
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL SWCFNMatch::execute(const std::string_view &, NSString *const __strong, int) const");
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"SWCPattern.mm", 2258, @"Entered SWCFNMatch::execute() with non-zero recursion depth (%i).", *(unsigned int *)(a3 + 32));
      }
      SWCGetFastUTF8String<1024ul>((uint64_t)v23, v9, v24);
      if (v23[16])
      {
        *(_OWORD *)(a3 + 8) = *(_OWORD *)a2;
        *(unsigned char *)a3 = 0;
        int v13 = SWCFNMatch::_execute((int8x8_t *)a3, a2, (uint64_t)v23, a4);
      }
      else
      {
        int v13 = 0;
      }
      if (*(_DWORD *)(a3 + 32))
      {
        int v21 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL SWCFNMatch::execute(const std::string_view &, NSString *const __strong, int) const");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"SWCPattern.mm", 2267, @"Exited SWCFNMatch::execute() with non-zero recursion depth (%i).", *(unsigned int *)(a3 + 32));
      }
      if (v13) {
        uint64_t v11 = 200;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else if ([v9 length])
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = 200;
    }
  }

  return v11;
}

void sub_1ABCDF460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SWCPatternStorage::_ReconstituteQueryJSON(void *a1)
{
  id v2 = (void *)MEMORY[0x1AD1157F0]();
  size_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:a1[1] + 2];
  [v3 appendBytes:"{" length:1];
  [v3 appendBytes:*a1 length:a1[1]];
  [v3 appendBytes:"}" length:1];
  int v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:0];
  if (v4 && _NSIsNSDictionary())
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___ZN17SWCPatternStorage22_ReconstituteQueryJSONERKNSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE_block_invoke;
    v7[3] = &unk_1E5E51960;
    v7[4] = &v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    if (*((unsigned char *)v9 + 24)) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1ABCDF65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

uint64_t ___ZN17SWCPatternStorage22_ReconstituteQueryJSONERKNSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = _NSIsNSString();
  if (!result || (uint64_t result = _NSIsNSString(), (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x400uLL);
}

void SWCGetFastUTF8String<1024ul>(uint64_t a1, void *a2, const char *a3)
{
  id v5 = a2;
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 16) = 0;
  if (v5)
  {
    theString = v5;
    if (((unint64_t)v5 & 0x8000000000000000) != 0
      || (CStringPtr = CFStringGetCStringPtr(v5, 0x8000100u)) == 0)
    {
      char v7 = [(__CFString *)theString getCString:a3 maxLength:1024 encoding:4];
      CStringPtr = a3;
      if ((v7 & 1) == 0) {
        CStringPtr = (const char *)[(__CFString *)theString UTF8String];
      }
    }
    *(void *)a1 = CStringPtr;
    *(void *)(a1 + 8) = strlen(CStringPtr);
    *(unsigned char *)(a1 + 16) = 1;
    id v5 = theString;
  }
}

void sub_1ABCDF7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN17SWCPatternStorage18_EvaluateQueryJSONEP7NSArrayIP14NSURLQueryItemERKNSt3__117basic_string_viewIcNS5_11char_traitsIcEEEEPK10SWCFNMatchi_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [*(id *)(a1 + 32) member:a2];

  if (!v5)
  {
    SWCGetFastUTF8String<1024ul>((uint64_t)v9, a3, (const char *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
    if (v9[16])
    {
      unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      unint64_t v7 = SWCPatternStorage::_EvaluateString(&stru_1F0342F60, (unint64_t)v9, *(void *)(a1 + 56), *(unsigned int *)(a1 + 64), 0);
      if (v6 >= v7) {
        unint64_t v8 = v7;
      }
      else {
        unint64_t v8 = v6;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    }
  }
}

BOOL SWCPatternStorage::_CheckEntitlement(uint64_t a1, const char **a2)
{
  if (qword_1EB67B200
    && (+[_SWCPrefs sharedPrefs],
        int v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isAppleInternal],
        v4,
        v5))
  {
    uint64_t v6 = xpc_dictionary_get_value((xpc_object_t)qword_1EB67B200, *a2);
  }
  else if (a1)
  {
    uint64_t v6 = xpc_copy_entitlement_for_token();
  }
  else
  {
    uint64_t v6 = xpc_copy_entitlement_for_self();
  }
  unint64_t v7 = (void *)v6;
  BOOL v8 = v6 && MEMORY[0x1AD115C20](v6) == MEMORY[0x1E4F14570] && xpc_BOOL_get_value(v7);

  return v8;
}

void sub_1ABCDF96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN17SWCPatternStorage13GetTerminatorEv_block_invoke()
{
  _MergedGlobals |= 0x18u;
}

uint64_t std::string_view::find[abi:nn180100](char *__s, uint64_t a2)
{
  id v2 = __s;
  size_t v3 = &__s[a2];
  if (a2 >= 2)
  {
    do
    {
      int v4 = (char *)memchr(__s, 36, a2 - 1);
      if (!v4) {
        break;
      }
      if (*(_WORD *)v4 == 10276) {
        goto LABEL_6;
      }
      __s = v4 + 1;
      a2 = v3 - __s;
    }
    while (v3 - __s > 1);
  }
  int v4 = v3;
LABEL_6:
  if (v4 == v3) {
    return -1;
  }
  else {
    return v4 - v2;
  }
}

id getLog(void)
{
  if (qword_1EB67B058 != -1) {
    dispatch_once(&qword_1EB67B058, &__block_literal_global_273);
  }
  os_log_t v0 = (void *)qword_1EB67B050;
  return v0;
}

__CFString *SWCGetNSStringFromStringViewNoCopy(void *a1)
{
  if (a1[1]) {
    v1 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:*a1 length:a1[1] encoding:4 freeWhenDone:0];
  }
  else {
    v1 = &stru_1F0342F60;
  }
  return v1;
}

void ___ZN23SWCSubstitutionVariable13GetTerminatorEv_block_invoke()
{
  byte_1EB67B019 |= 1u;
}

uint64_t SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>(uint64_t result, uint64_t a2)
{
  if (result)
  {
    size_t v3 = (SWCSubstitutionVariable *)result;
    if ((*(unsigned char *)result & 1) == 0)
    {
      int v4 = (uint64_t *)a2;
      while (1)
      {
        uint64_t v5 = *v4;
        size_t v6 = strlen(v3->cStrings);
        unint64_t v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v3->cStrings, v6);
        unint64_t v8 = v7;
        unint64_t v9 = *(void *)(v5 + 48);
        if (v9)
        {
          uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
          v10.i16[0] = vaddlv_u8(v10);
          unint64_t v11 = v10.u32[0];
          if (v10.u32[0] > 1uLL)
          {
            unint64_t v2 = v7;
            if (v7 >= v9) {
              unint64_t v2 = v7 % v9;
            }
          }
          else
          {
            unint64_t v2 = (v9 - 1) & v7;
          }
          id v12 = *(uint64_t ****)(*(void *)(v5 + 40) + 8 * v2);
          if (v12)
          {
            for (uint64_t i = *v12; i; uint64_t i = (uint64_t **)*i)
            {
              unint64_t v14 = (unint64_t)i[1];
              if (v14 == v8)
              {
                if (i[3] == (uint64_t *)v6 && !memcmp(i[2], v3->cStrings, v6)) {
                  goto LABEL_77;
                }
              }
              else
              {
                if (v11 > 1)
                {
                  if (v14 >= v9) {
                    v14 %= v9;
                  }
                }
                else
                {
                  v14 &= v9 - 1;
                }
                if (v14 != v2) {
                  break;
                }
              }
            }
          }
        }
        id v15 = operator new(0x28uLL);
        *id v15 = 0;
        v15[1] = v8;
        v15[2] = v3->cStrings;
        v15[3] = v6;
        v15[4] = v3;
        float v16 = (float)(unint64_t)(*(void *)(v5 + 64) + 1);
        float v17 = *(float *)(v5 + 72);
        if (!v9 || (float)(v17 * (float)v9) < v16) {
          break;
        }
LABEL_67:
        uint64_t v34 = *(void *)(v5 + 40);
        uint64_t v35 = *(void **)(v34 + 8 * v2);
        if (v35)
        {
          *id v15 = *v35;
LABEL_75:
          *uint64_t v35 = v15;
          goto LABEL_76;
        }
        *id v15 = *(void *)(v5 + 56);
        *(void *)(v5 + 56) = v15;
        *(void *)(v34 + 8 * v2) = v5 + 56;
        if (*v15)
        {
          unint64_t v36 = *(void *)(*v15 + 8);
          if ((v9 & (v9 - 1)) != 0)
          {
            if (v36 >= v9) {
              v36 %= v9;
            }
          }
          else
          {
            v36 &= v9 - 1;
          }
          uint64_t v35 = (void *)(*(void *)(v5 + 40) + 8 * v36);
          goto LABEL_75;
        }
LABEL_76:
        ++*(void *)(v5 + 64);
LABEL_77:
        int v4 = (uint64_t *)a2;
        uint64_t v37 = *(void *)(a2 + 8);
        if (*(void *)(v37 + 8) == v6)
        {
          uint64_t result = memcmp(*(const void **)v37, v3->cStrings, v6);
          if (!result)
          {
            **(void **)(a2 + 16) = v3;
            return result;
          }
        }
        uint64_t result = SWCSubstitutionVariable::getSize(v3);
        size_t v3 = (SWCSubstitutionVariable *)((char *)v3 + result);
        if (*(unsigned char *)v3) {
          return result;
        }
      }
      BOOL v18 = (v9 & (v9 - 1)) != 0;
      if (v9 < 3) {
        BOOL v18 = 1;
      }
      unint64_t v19 = v18 | (2 * v9);
      unint64_t v20 = vcvtps_u32_f32(v16 / v17);
      if (v19 <= v20) {
        int8x8_t prime = (int8x8_t)v20;
      }
      else {
        int8x8_t prime = (int8x8_t)v19;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        unint64_t v9 = *(void *)(v5 + 48);
      }
      if (*(void *)&prime > v9) {
        goto LABEL_33;
      }
      if (*(void *)&prime < v9)
      {
        unint64_t v28 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 64) / *(float *)(v5 + 72));
        if (v9 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
        {
          unint64_t v28 = std::__next_prime(v28);
        }
        else
        {
          uint64_t v30 = 1 << -(char)__clz(v28 - 1);
          if (v28 >= 2) {
            unint64_t v28 = v30;
          }
        }
        if (*(void *)&prime <= v28) {
          int8x8_t prime = (int8x8_t)v28;
        }
        if (*(void *)&prime >= v9)
        {
          unint64_t v9 = *(void *)(v5 + 48);
        }
        else
        {
          if (prime)
          {
LABEL_33:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            uint64_t v22 = operator new(8 * *(void *)&prime);
            uint64_t v23 = *(void **)(v5 + 40);
            *(void *)(v5 + 40) = v22;
            if (v23) {
              operator delete(v23);
            }
            uint64_t v24 = 0;
            *(int8x8_t *)(v5 + 48) = prime;
            do
              *(void *)(*(void *)(v5 + 40) + 8 * v24++) = 0;
            while (*(void *)&prime != v24);
            uint64_t v25 = *(void **)(v5 + 56);
            if (v25)
            {
              unint64_t v26 = v25[1];
              uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
              v27.i16[0] = vaddlv_u8(v27);
              if (v27.u32[0] > 1uLL)
              {
                if (v26 >= *(void *)&prime) {
                  v26 %= *(void *)&prime;
                }
              }
              else
              {
                v26 &= *(void *)&prime - 1;
              }
              *(void *)(*(void *)(v5 + 40) + 8 * v26) = v5 + 56;
              uint64_t v31 = (void *)*v25;
              if (*v25)
              {
                do
                {
                  unint64_t v32 = v31[1];
                  if (v27.u32[0] > 1uLL)
                  {
                    if (v32 >= *(void *)&prime) {
                      v32 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v32 &= *(void *)&prime - 1;
                  }
                  if (v32 != v26)
                  {
                    uint64_t v33 = *(void *)(v5 + 40);
                    if (!*(void *)(v33 + 8 * v32))
                    {
                      *(void *)(v33 + 8 * v32) = v25;
                      goto LABEL_58;
                    }
                    void *v25 = *v31;
                    *uint64_t v31 = **(void **)(*(void *)(v5 + 40) + 8 * v32);
                    **(void **)(*(void *)(v5 + 40) + 8 * v32) = v31;
                    uint64_t v31 = v25;
                  }
                  unint64_t v32 = v26;
LABEL_58:
                  uint64_t v25 = v31;
                  uint64_t v31 = (void *)*v31;
                  unint64_t v26 = v32;
                }
                while (v31);
              }
            }
            unint64_t v9 = (unint64_t)prime;
            goto LABEL_62;
          }
          v38 = *(void **)(v5 + 40);
          *(void *)(v5 + 40) = 0;
          if (v38) {
            operator delete(v38);
          }
          unint64_t v9 = 0;
          *(void *)(v5 + 48) = 0;
        }
      }
LABEL_62:
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v8 >= v9) {
          unint64_t v2 = v8 % v9;
        }
        else {
          unint64_t v2 = v8;
        }
      }
      else
      {
        unint64_t v2 = (v9 - 1) & v8;
      }
      goto LABEL_67;
    }
  }
  return result;
}

void sub_1ABCDFF50(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t SWCFNMatch::_execute(int8x8_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = a1;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if (!*(void *)a2)
  {
    unsigned int v55 = [MEMORY[0x1E4F28B00] currentHandler];
    v56 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    [v55 handleFailureInFunction:v56, @"SWCPattern.mm", 2043, @"Invalid parameter not satisfying: %@", @"pattern.data() != NULL" file lineNumber description];
    unint64_t v7 = a1;
  }
  s = *(uint8_t **)a3;
  if (!*(void *)a3)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    char v58 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    [v57 handleFailureInFunction:v58, @"SWCPattern.mm", 2044, @"Invalid parameter not satisfying: %@", @"string.data() != NULL" file lineNumber description];
    unint64_t v7 = a1;

    s = *(uint8_t **)a3;
  }
  unint64_t v8 = *(char **)a2;
  uint64_t v9 = *(void *)(a3 + 8);
  uint64_t v65 = *(void *)(a2 + 8);
  if (*(unsigned char *)(*(void *)a2 + v65))
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    size_t v60 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    [v59 handleFailureInFunction:v60, @"SWCPattern.mm", 2052, @"Invalid parameter not satisfying: %@", @"*pEnd == '\\0'" file lineNumber description];
    unint64_t v7 = a1;
  }
  uint8x8_t v10 = s;
  if (s[v9])
  {
    char v61 = [MEMORY[0x1E4F28B00] currentHandler];
    v62 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    [v61 handleFailureInFunction:v62, @"SWCPattern.mm", 2053, @"Invalid parameter not satisfying: %@", @"*sEnd == '\\0'" file lineNumber description];
    unint64_t v7 = a1;

    uint8x8_t v10 = s;
  }
  if (v7->i8[0]) {
    return 0;
  }
  if (v7[4].i32[0] >= 65)
  {
    size_t v63 = getLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      char v64 = SWCGetNSStringFromStringViewNoCopy(&a1[1]);
      LODWORD(s1) = 138412290;
      *(void *)((char *)&s1 + 4) = v64;
      _os_log_impl(&dword_1ABCD7000, v63, OS_LOG_TYPE_INFO, "Pattern \"%@\" was too complex. Stopping evaluation.", (uint8_t *)&s1, 0xCu);
    }
    uint64_t result = 0;
    a1->i8[0] = 1;
    return result;
  }
  int v11 = *v8;
  if (!*v8 && *v10) {
    return 0;
  }
  for (uint64_t i = v8; ; ++i)
  {
    if (v11 > 41)
    {
      switch(v11)
      {
        case '?':
          if (*v10)
          {
            SWCFNMatch::_decodeUTF8Character(v10, (const char *)a2, (const char *)a3);
            if (a2 >= 2) {
              uint8x8_t v10 = &v10[a2 - 1];
            }
            goto LABEL_54;
          }
          break;
        case '\\':
          ++i;
          goto LABEL_54;
        case '*':
          uint8x8_t v27 = (unsigned char *)(&v8[v65] - i);
          do
          {
            int v29 = *++i;
            int v28 = v29;
            --v27;
          }
          while (v29 == 42);
          if (!v28) {
            return 1;
          }
          if (*v10)
          {
            int v39 = a1[4].i32[0] + 1;
            int64_t v40 = &s[v9] - v10;
            do
            {
              a1[4].i32[0] = v39;
              *(void *)&long long s1 = i;
              *((void *)&s1 + 1) = v27;
              *(void *)s2 = v10;
              size_t v77 = v40;
              uint64_t result = SWCFNMatch::_execute(a1, &s1, s2, a4);
              int v39 = a1[4].i32[0];
              a1[4].i32[0] = v39 - 1;
              if (result) {
                break;
              }
              int v41 = *++v10;
              --v40;
            }
            while (v41);
            return result;
          }
          return 0;
      }
      goto LABEL_29;
    }
    if (!v11)
    {
      if (!*v10) {
        return 1;
      }
      goto LABEL_29;
    }
    if (v11 == 36 && !strncmp(i, "$(", 2uLL)) {
      break;
    }
LABEL_29:
    unsigned int v15 = SWCFNMatch::_decodeUTF8Character((uint8_t *)i, (const char *)a2, (const char *)a3);
    if (v13) {
      float v16 = v13 - 1;
    }
    else {
      float v16 = 0;
    }
    unsigned int v17 = SWCFNMatch::_decodeUTF8Character(v10, v13, v14);
    __darwin_ct_rune_t v18 = v17;
    uint64_t i = (char *)&v16[(void)i];
    unint64_t v19 = a2 - 1;
    if (!a2) {
      unint64_t v19 = 0;
    }
    v10 += v19;
    if (v15 == v17 || (a4 & 0x10) == 0)
    {
      if (v15 != v17) {
        return 0;
      }
    }
    else if (((v17 | v15) & 0xFFFFFF80) != 0)
    {
      if (v15 - 0x10000 >= 0x100000) {
        unsigned __int16 v21 = v15;
      }
      else {
        unsigned __int16 v21 = (v15 >> 10) - 10304;
      }
      int v22 = (v15 & 0x3FF | 0xDC00) << 16;
      if (v15 - 0x10000 >= 0x100000) {
        int v22 = 0;
      }
      WORD2(s1) = 0;
      LODWORD(s1) = v22 & 0xFFFF0000 | v21;
      if (v17 - 0x10000 >= 0x100000) {
        unsigned __int16 v23 = v17;
      }
      else {
        unsigned __int16 v23 = (v17 >> 10) - 10304;
      }
      int v24 = (v17 & 0x3FF | 0xDC00) << 16;
      if (v17 - 0x10000 >= 0x100000) {
        int v24 = 0;
      }
      s2[2] = 0;
      *(_DWORD *)s2 = v24 & 0xFFFF0000 | v23;
      if (u_strcasecmp((const UChar *)&s1, s2, 0)) {
        return 0;
      }
    }
    else
    {
      __darwin_ct_rune_t v25 = __tolower(v15);
      if (v25 != __tolower(v18)) {
        return 0;
      }
    }
LABEL_54:
    int v26 = i[1];
    int v11 = v26;
    ++v10;
  }
  uint64_t v30 = i + 2;
  uint64_t result = (uint64_t)strchr(i + 2, 41);
  if (!result) {
    return result;
  }
  sa = (uint8_t *)result;
  size_t v32 = result - (void)v30;
  v72[0] = i + 2;
  v72[1] = result - (void)v30;
  *(void *)s2 = 0;
  unint64_t v33 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)(i + 2), result - (void)v30);
  int8x8_t v34 = a1[6];
  if (v34)
  {
    unint64_t v35 = v33;
    uint8x8_t v36 = (uint8x8_t)vcnt_s8(v34);
    v36.i16[0] = vaddlv_u8(v36);
    unint64_t v37 = v36.u32[0];
    if (v36.u32[0] > 1uLL)
    {
      unint64_t v38 = v33;
      if (v33 >= *(void *)&v34) {
        unint64_t v38 = v33 % *(void *)&v34;
      }
    }
    else
    {
      unint64_t v38 = (*(void *)&v34 - 1) & v33;
    }
    unint64_t v42 = *(uint64_t ****)(*(void *)&a1[5] + 8 * v38);
    if (v42)
    {
      for (j = *v42; j; j = (uint64_t **)*j)
      {
        unint64_t v44 = (unint64_t)j[1];
        if (v44 == v35)
        {
          if (j[3] == (uint64_t *)v32 && !memcmp(j[2], i + 2, v32))
          {
            v48 = (char *)j[4];
            goto LABEL_90;
          }
        }
        else
        {
          if (v37 > 1)
          {
            if (v44 >= *(void *)&v34) {
              v44 %= *(void *)&v34;
            }
          }
          else
          {
            v44 &= *(void *)&v34 - 1;
          }
          if (v44 != v38) {
            break;
          }
        }
      }
    }
  }
  if (!a1[10].i8[0])
  {
    *(void *)&long long s1 = a1;
    *((void *)&s1 + 1) = v72;
    uint64_t v80 = s2;
    int8x8_t v45 = a1[3];
    if (!*(void *)&v45
      || (SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>(*(void *)&v45 + 8, (uint64_t)&s1), (v48 = *(char **)s2) == 0))
    {
      v46 = +[_SWCSubstitutionVariableList cheapBuiltInSubstitutionVariableList];
      SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>((uint64_t)v46 + 8, (uint64_t)&s1);

      v48 = *(char **)s2;
      if (!*(void *)s2)
      {
        v47 = +[_SWCSubstitutionVariableList expensiveBuiltInSubstitutionVariableList];
        SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>((uint64_t)v47 + 8, (uint64_t)&s1);

        v48 = *(char **)s2;
        if (!*(void *)s2) {
          a1[10].i8[0] = 1;
        }
      }
    }
LABEL_90:
    if (v48)
    {
      v70 = sa + 1;
      size_t v71 = strlen((const char *)sa + 1);
      v69[0] = v10;
      size_t v49 = strlen((const char *)v10);
      uint64_t result = 0;
      v69[1] = v49;
      int v75 = a4;
      char v74 = 0;
      size_t v73 = v71;
      *(void *)&long long s1 = &v73;
      *((void *)&s1 + 1) = &v70;
      uint64_t v80 = (UChar *)a1;
      v81 = v69;
      uint64_t v82 = &v75;
      uint64_t v83 = &v74;
      char v50 = *v48;
      if ((*v48 & 1) == 0)
      {
        char v78 = 0;
        size_t v51 = strlen(v48 + 1);
        if ((v50 & 2) == 0
          || (*(void *)s2 = "",
              size_t v77 = 0,
              SWCFNMatch::_tryMatchingVariable(SWCSubstitutionVariable const*,std::string_view const&,std::string_view const&,int)const::$_0::operator()((uint64_t **)&s1, (uint64_t)s2, &v78), !v78))
        {
          for (k = &v48[v51 + 2]; *k; k += v54)
          {
            if ((*v48 & 4) != 0) {
              size_t v53 = 1;
            }
            else {
              size_t v53 = strlen(k);
            }
            *(void *)s2 = k;
            size_t v77 = v53;
            SWCFNMatch::_tryMatchingVariable(SWCSubstitutionVariable const*,std::string_view const&,std::string_view const&,int)const::$_0::operator()((uint64_t **)&s1, (uint64_t)s2, &v78);
            if (v78) {
              break;
            }
            uint64_t v54 = (*v48 & 4) != 0 ? 1 : v53 + 1;
          }
        }
        return v74 != 0;
      }
      return result;
    }
  }
  return 0;
}

void sub_1ABCE0740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SWCFNMatch::_decodeUTF8Character(uint8_t *s, const char *a2, const char *a3)
{
  unsigned int v3 = *s;
  if ((char)*s < 0)
  {
    if (v3 > 0xBF)
    {
      int32_t v5 = 0;
      LODWORD(v6) = 1;
    }
    else
    {
      int32_t v5 = utf8_back1SafeBody(s, 0, 0);
      unsigned int v3 = s[v5];
      if ((v3 & 0x80) == 0) {
        return v3;
      }
      LODWORD(v6) = v5 + 1;
      if (v5 == -2) {
        return -1;
      }
    }
    if (v3 < 0xE0)
    {
      if (v3 < 0xC2) {
        return -1;
      }
      int v9 = v3 & 0x1F;
    }
    else
    {
      if (v3 > 0xEF)
      {
        if (v3 > 0xF4) {
          return -1;
        }
        unsigned int v11 = v3 - 240;
        unint64_t v7 = s[(int)v6];
        if (((byte_1ABCF11FD[v7 >> 4] >> v11) & 1) == 0) {
          return -1;
        }
        uint64_t v6 = v5 + 2;
        if (v5 == -3) {
          return -1;
        }
        unsigned int v8 = s[v6] ^ 0x80;
        if (v8 > 0x3F) {
          return -1;
        }
        LODWORD(v7) = v7 & 0x3F | (v11 << 6);
      }
      else
      {
        unint64_t v7 = v3 & 0xF;
        if (((a00000000000000[v7] >> (s[(int)v6] >> 5)) & 1) == 0) {
          return -1;
        }
        unsigned int v8 = s[(int)v6] & 0x3F;
      }
      LODWORD(v6) = v6 + 1;
      if (v6 == -1) {
        return -1;
      }
      int v9 = v8 | (v7 << 6);
    }
    unsigned int v10 = s[(int)v6] ^ 0x80;
    if (v10 <= 0x3F) {
      return v10 | (v9 << 6);
    }
    return -1;
  }
  return v3;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v32 + v35 + v36 + a2;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v34 + v37 + v45;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    char v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v58 + v56 + v67 + v57;
      uint64_t v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void SWCFNMatch::_tryMatchingVariable(SWCSubstitutionVariable const*,std::string_view const&,std::string_view const&,int)const::$_0::operator()(uint64_t **a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  size_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = a1[1];
  uint64_t v6 = **a1;
  uint64_t v7 = v6 + v4;
  uint64_t v8 = a1[2];
  uint64_t v9 = a1[3];
  uint64_t v10 = (unsigned int *)a1[4];
  uint64_t v11 = a1[5];
  size_t v12 = v6 + v4 + 1;
  if (v6 + v4 == -1)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "void SWCWithFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 128UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/EmbeddedSharedWebCredentials/Sources/SWCPattern.mm:2001:65)]");
    [v22 handleFailureInFunction:v21, @"SWCLogging.h", 157, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];

    size_t v13 = *(void *)(a2 + 8);
    goto LABEL_4;
  }
  if (v12 <= 0x80)
  {
    size_t v13 = *(void *)(a2 + 8);
LABEL_4:
    memset(__dst, 0, sizeof(__dst));
    if (v13) {
      memmove(__dst, *(const void **)a2, v13);
    }
    size_t v14 = v5[1];
    if (v14) {
      memmove((char *)__dst + v4, (const void *)*v5, v14);
    }
    *(void *)&long long v27 = __dst;
    *((void *)&v27 + 1) = v7;
    if (std::string_view::find[abi:nn180100]((char *)__dst, v7) >= v13)
    {
      ++*((_DWORD *)v8 + 8);
      int v19 = SWCFNMatch::_execute(v8, &v27, v9, *v10);
      --*((_DWORD *)v8 + 8);
      if (v19)
      {
        *(unsigned char *)uint64_t v11 = 1;
        *a3 = 1;
      }
    }
    else
    {
      if (qword_1EB67B058 != -1) {
        dispatch_once(&qword_1EB67B058, &__block_literal_global_273);
      }
      uint64_t v15 = qword_1EB67B050;
      if (os_log_type_enabled((os_log_t)qword_1EB67B050, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v26 = __dst;
        _os_log_impl(&dword_1ABCD7000, v15, OS_LOG_TYPE_INFO, "Substitution variable value composed to another substitution variable: \"%s\". Rejecting.", buf, 0xCu);
      }
    }
    return;
  }
  if ((v12 & 0x8000000000000000) != 0) {
    abort();
  }
  uint64_t v16 = (char *)operator new(v6 + v4 + 1);
  bzero(v16, v12);
  if (v4) {
    memmove(v16, *(const void **)a2, v4);
  }
  size_t v17 = v5[1];
  if (v17) {
    memmove(&v16[v4], (const void *)*v5, v17);
  }
  *(void *)&__dst[0] = v16;
  *((void *)&__dst[0] + 1) = v7;
  if (std::string_view::find[abi:nn180100](v16, v7) >= v4)
  {
    ++*((_DWORD *)v8 + 8);
    int v20 = SWCFNMatch::_execute(v8, __dst, v9, *v10);
    --*((_DWORD *)v8 + 8);
    if (v20)
    {
      *(unsigned char *)uint64_t v11 = 1;
      *a3 = 1;
    }
  }
  else
  {
    if (qword_1EB67B058 != -1) {
      dispatch_once(&qword_1EB67B058, &__block_literal_global_273);
    }
    uint64_t v18 = qword_1EB67B050;
    if (os_log_type_enabled((os_log_t)qword_1EB67B050, OS_LOG_TYPE_INFO))
    {
      LODWORD(v27) = 136315138;
      *(void *)((char *)&v27 + 4) = v16;
      _os_log_impl(&dword_1ABCD7000, v18, OS_LOG_TYPE_INFO, "Substitution variable value composed to another substitution variable: \"%s\". Rejecting.", (uint8_t *)&v27, 0xCu);
    }
  }
  operator delete(v16);
}

void sub_1ABCE10CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  size_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_1ABCE12B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE151C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v28 - 112), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1ABCE1764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE19D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE1BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE1E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v28 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1ABCE1FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE21B8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABCE23F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE2514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE25B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE2654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE26FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE279C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE2C50(_Unwind_Exception *a1)
{
  uint64_t v10 = v6;

  _Unwind_Resume(a1);
}

void sub_1ABCE2FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1ABCE3280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1ABCE33C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE353C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE36AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE396C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE3F1C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABCE4094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE4138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE4774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE48D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE49DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1ABCE4E1C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {

    objc_begin_catch(exception_object);
    os_unfair_recursive_lock_unlock();
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1ABCE5158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE5500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE57BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE5998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE5A6C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1ABCE5AA4(_Unwind_Exception *a1)
{
}

void sub_1ABCE5B28(void *a1)
{
}

void sub_1ABCE5B40(_Unwind_Exception *a1)
{
  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1ABCE5C04(void *a1)
{
}

void sub_1ABCE5C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1ABCE5E58(_Unwind_Exception *a1)
{
  uint64_t v9 = v6;

  _Unwind_Resume(a1);
}

void sub_1ABCE6074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE6194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE6394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE66AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE6AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE6C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE6DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE6E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE6ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE7020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE7150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE7284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE7368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE7418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE74AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE7540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE7668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _SWCEnabledConfigurationGetFromDetails(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"alwaysEnabled"];
  uint64_t v3 = [v1 objectForKeyedSubscript:@"enabledByDefault"];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0 && ([v2 BOOLValue] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ([v3 BOOLValue]) {
      unsigned __int8 v4 = 2;
    }
    else {
      unsigned __int8 v4 = 3;
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

void sub_1ABCE774C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _SWCFieldsEncodeWithCoder(int a1, void *a2, uint64_t a3)
{
  return [a2 encodeInt64:*(void *)&a1 & 0xFFFFFFLL forKey:a3];
}

uint64_t _SWCFieldsMakeWithCoder(void *a1, uint64_t a2)
{
  return [a1 decodeInt64ForKey:a2];
}

void _SWCFieldsLogDebugDescription(unsigned int a1, __sFILE *a2, void *a3)
{
  id v13 = a3;
  logApprovalState(a2, @"User Approval", a1 & 3);
  logApprovalState(a2, @"Site/Fmwk Approval", (a1 >> 2) & 3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v6 = v5;
  if ((a1 & 0x10) != 0) {
    [v5 addObject:@"updating"];
  }
  if ((a1 & 0x20) != 0) {
    [v6 addObject:@"systemApplication"];
  }
  if ((a1 & 0x100) != 0) {
    [v6 addObject:@"enterpriseManaged"];
  }
  if ((a1 & 0x200) != 0) {
    [v6 addObject:@"systemPlaceholder"];
  }
  uint64_t v7 = (a1 >> 6) - 1;
  if (v7 <= 2) {
    [v6 addObject:off_1E5E51AC8[v7]];
  }
  unint64_t v8 = (((unint64_t)(unsigned __int16)a1 >> 10) & 7) - 1;
  if (v8 <= 2) {
    [v6 addObject:off_1E5E51AE0[v8]];
  }
  if (v13) {
    [v6 unionSet:v13];
  }
  uint64_t v9 = (void *)MEMORY[0x1AD1157F0]();
  uint64_t v10 = [v6 array];
  uint64_t v11 = [v10 componentsJoinedByString:@", "];
  logValueForOptionalKey(a2, &cfstr_Flags.isa, v11, -1, -1, 1);

  if (BYTE2(a1))
  {
    size_t v12 = [NSNumber numberWithChar:SBYTE2(a1)];
    logValueForOptionalKey(a2, &cfstr_RelativeOrder.isa, v12, -1, -1, 1);
  }
}

void sub_1ABCE798C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void logApprovalState(__sFILE *a1, void *a2, unsigned int a3)
{
  unint64_t v8 = a2;
  _SWCServiceApprovalStateGetDebugDescription(a3);
  id v5 = (objc_object *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2) {
    int v6 = 160;
  }
  else {
    int v6 = 8;
  }
  if (a3 == 1) {
    int v7 = 42;
  }
  else {
    int v7 = v6;
  }
  logValueForOptionalKey(a1, v8, v5, v7, -1, 1);
}

void sub_1ABCE7A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *_SWCServiceApprovalStateGetDebugDescription(unsigned int a1)
{
  if (a1 >= 3) {
    id v1 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", a1);
  }
  else {
    id v1 = off_1E5E51AF8[(char)a1];
  }
  return v1;
}

void _SWCSetServerListenerForTests(void *a1)
{
  id v8 = a1;
  uint64_t v2 = +[_SWCPrefs sharedPrefs];
  char v3 = [v2 isAppleInternal];

  if ((v3 & 1) == 0)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    int v7 = [NSString stringWithUTF8String:"void _SWCSetServerListenerForTests(NSXPCListener *__strong _Nullable)"];
    [v6 handleFailureInFunction:v7 file:@"SWCServerProtocol.mm" lineNumber:170 description:@"Cannot change the SWC XPC server object here"];
  }
  unsigned __int8 v4 = (void *)MEMORY[0x1AD1157F0]();
  os_unfair_lock_lock(&gLock);
  if (_MergedGlobals_3)
  {
    [(id)_MergedGlobals_3 invalidate];
    id v5 = (void *)_MergedGlobals_3;
    _MergedGlobals_3 = 0;
  }
  if (gTestListener) {
    [(id)gTestListener invalidate];
  }
  objc_storeStrong((id *)&gTestListener, a1);
  os_unfair_lock_unlock(&gLock);
}

void sub_1ABCE7DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL _SWCServerIsUsingTestListener()
{
  os_log_t v0 = (void *)MEMORY[0x1AD1157F0]();
  os_unfair_lock_lock(&gLock);
  BOOL v1 = gTestListener != 0;
  os_unfair_lock_unlock(&gLock);
  return v1;
}

BOOL _SWCGetAuditTokenForSelf(_OWORD *a1)
{
  kern_return_t v2;
  long long v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v7;

  task_info_outCnt = 8;
  uint64_t v2 = task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt);
  if (a1 && !v2)
  {
    char v3 = v7;
    *a1 = *(_OWORD *)task_info_out;
    a1[1] = v3;
  }
  return v2 == 0;
}

BOOL _SWCCanAuditTokenConnect()
{
  return sandbox_check_by_audit_token() == 0;
}

void ___ZL34_SWCGetEntitlementsNeededForAccessP6NSData_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F03459C8];
  BOOL v1 = (void *)qword_1EB67B170;
  qword_1EB67B170 = v0;
}

uint64_t _SWCServiceTypeIsWhitelisted(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _SWCServiceTypeGetCanonicals();
  uint64_t v3 = [v2 containsObject:v1];

  return v3;
}

void sub_1ABCE7FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _SWCServiceTypeGetCanonicals(void)
{
  if (qword_1EB67B188 != -1) {
    dispatch_once(&qword_1EB67B188, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_MergedGlobals_4;
  return v0;
}

uint64_t _SWCServiceTypeIsWhitelistedForAppClips(void *a1)
{
  id v1 = a1;
  if ([v1 isEqual:@"appclips"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqual:@"webcredentials"];
  }

  return v2;
}

void sub_1ABCE80A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _SWCServiceTypeCanonicalize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _SWCServiceTypeGetCanonicals();
  uint64_t v3 = [v2 member:v1];
  unsigned __int8 v4 = v3;
  if (!v3) {
    uint64_t v3 = v1;
  }
  id v5 = v3;

  return v5;
}

void sub_1ABCE811C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _SWCServiceTypeMaximumDetailsCount(void *a1)
{
  return [a1 isEqual:@"applinks"] << 63 >> 63;
}

void ___ZL28_SWCServiceTypeGetCanonicalsv_block_invoke()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"activitycontinuation";
  v4[1] = @"applinks";
  v4[2] = @"webcredentials";
  v4[3] = @"messagefilter";
  v4[4] = @"classificationreport";
  v4[5] = @"authsrv";
  v4[6] = @"appclips";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  uint64_t v2 = [v0 initWithArray:v1];
  uint64_t v3 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v2;
}

void sub_1ABCE8238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE85A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE87A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8EBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE8FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9024()
{
}

void sub_1ABCE902C()
{
}

void sub_1ABCE90AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v30 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1ABCE9614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE98B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCE9FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEA04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEA0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEA1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABCEA23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEA328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEA3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEA630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a21, 8);

  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1ABCEA768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEA8E4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABCEA9C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEAAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEAB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEAD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1ABCEAE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEAEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEAFB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEB070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEB138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEB1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEB34C(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t _SWCFileIsTTY(FILE *a1)
{
  int v1 = fileno(a1);
  if (v1 < 0) {
    return 0;
  }
  int v2 = v1;
  uint64_t result = isatty(v1);
  if (result) {
    return *(_DWORD *)forcedTTY() == v2 || getenv("TERM") != 0;
  }
  return result;
}

_DWORD *_SWCForceTTY()
{
  uint64_t result = (_DWORD *)forcedTTY();
  *uint64_t result = v1;
  return result;
}

uint64_t _SWCLogSeparator(FILE *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v5 = 0;
  *(void *)&long long v2 = 0x2D2D2D2D2D2D2D2DLL;
  *((void *)&v2 + 1) = 0x2D2D2D2D2D2D2D2DLL;
  v4[0] = v2;
  v4[1] = v2;
  v4[2] = v2;
  v4[3] = v2;
  v4[4] = v2;
  fputs((const char *)v4, a1);
  return fputc(10, a1);
}

void _SWCLogHeader(FILE *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  fputc(10, a1);
  int IsTTY = _SWCFileIsTTY(a1);
  if (IsTTY) {
    fputs("\x1B[1m", a1);
  }
  id v5 = [v3 uppercaseString];
  uint64_t v6 = (const char *)[v5 UTF8String];

  size_t v7 = strlen(v6);
  if (v7 < 0x4E)
  {
    size_t v8 = v7;
    char v13 = 0;
    *(void *)&long long v9 = 0x3D3D3D3D3D3D3D3DLL;
    *((void *)&v9 + 1) = 0x3D3D3D3D3D3D3D3DLL;
    v12[0] = v9;
    v12[1] = v9;
    v12[2] = v9;
    v12[3] = v9;
    v12[4] = v9;
    size_t v10 = 80 - v7;
    uint64_t v11 = (char *)v12 + ((80 - v7) >> 1);
    *(v11 - 1) = 32;
    memcpy(v11, v6, v8);
    *((unsigned char *)v12 + v8 + (v10 >> 1)) = 32;
    fputs((const char *)v12, a1);
  }
  else
  {
    fputs(v6, a1);
  }
  if (IsTTY) {
    fputs("\x1B[0m", a1);
  }
  fputc(10, a1);
}

void sub_1ABCEB6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _SWCLogValueForKey(__sFILE *a1, NSString *a2, objc_object *a3, int a4, int a5)
{
}

void logValueForOptionalKey(__sFILE *a1, NSString *a2, objc_object *a3, int a4, int a5, int a6)
{
  unint64_t v23 = a2;
  uint64_t v11 = a3;
  int IsTTY = _SWCFileIsTTY(a1);
  if (!v23) {
    goto LABEL_6;
  }
  if (IsTTY) {
    fputs("\x1B[1m", a1);
  }
  id v13 = [(NSString *)v23 stringByAppendingString:@": "];
  fprintf(a1, "%-22s", (const char *)[v13 UTF8String]);

  if (IsTTY)
  {
    fputs("\x1B[0m", a1);
LABEL_6:
    char v14 = IsTTY ^ 1;
    if (a4 < 0) {
      char v14 = 1;
    }
    if (v14 & 1) == 0 && (_SWCFileIsTTY(a1))
    {
      fprintf(a1, "\x1B[38;5;%um", a4);
      if ((a5 & 0x80000000) == 0) {
        fprintf(a1, "\x1B[48;5;%um", a5);
      }
    }
  }
  if (v11)
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v11))
    {
      int v16 = [(objc_object *)v11 BOOLValue];
      size_t v17 = @"no";
      if (v16) {
        size_t v17 = @"yes";
      }
      uint64_t v18 = v17;

      uint64_t v11 = (objc_object *)v18;
    }
  }
  id v19 = [(objc_object *)v11 description];
  int v20 = (const char *)[v19 UTF8String];
  if (!v20) {
    int v20 = "(null)";
  }
  fputs(v20, a1);

  char v21 = IsTTY ^ 1;
  if ((a5 & a4) < 0 != v22) {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    fputs("\x1B[0m", a1);
  }
  if (a6) {
    fputc(10, a1);
  }
}

void sub_1ABCEB8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _SWCLogObject(__sFILE *a1, objc_object *a2, int a3, int a4)
{
}

void _SWCLogLine(__sFILE *a1, objc_object *a2, int a3, int a4)
{
}

void sub_1ABCEB95C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEBD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEBED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCEC0B8(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABCEC7CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCECB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCECDE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCECE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCED1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABCED310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABCED4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1F40D9030]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1F40D94A8]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
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

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2F0](atoken);
}

void bzero(void *a1, size_t a2)
{
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1F4181510](cls, extraBytes);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1F40CB580]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
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

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int32_t u_strcasecmp(const UChar *s1, const UChar *s2, uint32_t options)
{
  return MEMORY[0x1F417F868](s1, s2, *(void *)&options);
}

int32_t utf8_back1SafeBody(const uint8_t *s, int32_t start, int32_t i)
{
  return MEMORY[0x1F41807E8](s, *(void *)&start, *(void *)&i);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1F40CED30]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

uint64_t xpc_copy_entitlements_data_for_token()
{
  return MEMORY[0x1F40CED48]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}
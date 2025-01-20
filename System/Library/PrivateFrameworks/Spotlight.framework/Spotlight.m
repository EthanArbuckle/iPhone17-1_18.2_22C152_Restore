void __updateSiriEnabledStatus_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t vars8;

  AFSupportPreferencesSynchronize();
  v0 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [v0 languageCode];

  v1 = [MEMORY[0x263F285A0] sharedPreferences];
  v2 = [v1 languageCode];
  v3 = [v2 componentsSeparatedByString:@"-"];
  v4 = [v3 firstObject];

  v5 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v5 assistantIsEnabled] && (AFAssistantRestricted() & 1) == 0) {
    [v4 isEqualToString:v6];
  }
}

void sub_235D0DB44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t sp_analytics_log_timing(uint64_t a1, const char *a2, uint64_t a3)
{
  unint64_t v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "label", a2);
  xpc_dictionary_set_double(empty, "latency", (double)v4 / 1000000000.0);
  analytics_send_event();

  return v4;
}

void sub_235D0E668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_235D0F34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t priorityIndexEligibleBundleIdentifer(void *a1)
{
  id v1 = a1;
  if (SSPriorityIndexLimitBundles()) {
    uint64_t v2 = [(id)sEligibleBundleSet containsObject:v1];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

void hideResultFromSection(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  if (a5 != a2)
  {
    id v9 = a2;
    handleHiddenResult();
    [v9 removeResults:v10];
  }
}

id copyForResending(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v10 = objc_alloc(MEMORY[0x263F78D70]);
        if (isKindOfClass)
        {
          v11 = (void *)[v10 initWithPrototype:v8];
          v12 = [v8 resultSet];
          [v11 setResultSet:v12];
        }
        else
        {
          v11 = objc_msgSend(v10, "initWithSection:", v8, (void)v14);
        }
        objc_msgSend(v2, "addObject:", v11, (void)v14);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v2;
}

void query_analytics_log_complete(void *a1, const char *a2, uint64_t a3)
{
  id v7 = a1;
  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  os_unfair_lock_lock((os_unfair_lock_t)&perfDictLock);
  xpc_object_t empty = [v7 perfDictionary];
  if (!empty) {
    xpc_object_t empty = xpc_dictionary_create_empty();
  }
  xpc_dictionary_set_string(empty, "label", a2);
  __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  xpc_dictionary_set_double(empty, "latency", (double)(v6 - a3) / 1000000000.0);
  analytics_send_event();
  [v7 setPerfDictionary:0];
  os_unfair_lock_unlock((os_unfair_lock_t)&perfDictLock);
}

void sub_235D17794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_235D177F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t query_analytics_log_timing(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  id v7 = a1;
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  key = 0;
  asprintf(&key, "%s_label", a3);
  v12 = 0;
  asprintf(&v12, "%s_latency", a3);
  os_unfair_lock_lock((os_unfair_lock_t)&perfDictLock);
  xpc_object_t empty = [v7 perfDictionary];
  if (!empty)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [v7 setPerfDictionary:empty];
  }
  unint64_t v10 = v8 - a4;
  xpc_dictionary_set_string(empty, key, a2);
  xpc_dictionary_set_double(empty, v12, (double)v10 / 1000000000.0);
  os_unfair_lock_unlock((os_unfair_lock_t)&perfDictLock);
  free(key);
  free(v12);

  return v10;
}

void sub_235D1B4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_235D1CD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D1D464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,long long a29,long long a30,uint64_t a31)
{
  si_tracing_restore_current_span((uint64_t)&a23);
  long long v32 = a30;
  *(_OWORD *)a11 = a29;
  *(_OWORD *)(a11 + 16) = v32;
  *(void *)(a11 + 32) = a31;
  _Unwind_Resume(a1);
}

__n128 si_tracing_restore_current_span(uint64_t a1)
{
  uint64_t v2 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  si_tracing_log_span_end();
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(void *)(v2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)uint64_t v2 = result;
  *(_OWORD *)(v2 + 16) = v4;
  return result;
}

void sub_235D1EB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_235D1F01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  si_tracing_restore_current_span((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_235D1F218(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, uint64_t a19, long long a20)
{
  if (a2 == 1)
  {
    id v22 = objc_begin_catch(a1);
    v23 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v25 = (id)objc_opt_class();
      uint64_t v26 = *(void *)(v20 + 56);
      v27 = [v22 callStackSymbols];
      LODWORD(buf) = 138413058;
      *(void *)((char *)&buf + 4) = v25;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v22;
      a18 = 2112;
      a19 = v26;
      LOWORD(a20) = 2112;
      *(void *)((char *)&a20 + 2) = v27;
      _os_log_error_impl(&dword_235D0B000, v23, OS_LOG_TYPE_ERROR, "#query %@ crashed (exception: %@) with search string '%@'\n stack:%@", (uint8_t *)&buf, 0x2Au);
    }
    v24 = SPLogForSPLogCategoryTelemetry();
    if (os_signpost_enabled(v24))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_235D0B000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "queryCrash", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }

    objc_end_catch();
    JUMPOUT(0x235D1F1ACLL);
  }
  si_tracing_restore_current_span((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_235D200A4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_235D20488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void createDedupeDicts(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, int a8)
{
  LODWORD(v38) = a8;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v14 = a1;
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v21 = [v14 bundleIdentifier];
  HIDWORD(v38) = [v21 isEqualToString:*MEMORY[0x263F78F60]];

  id v22 = [v14 bundleIdentifier];
  char v23 = [v22 isEqualToString:*MEMORY[0x263F78F78]];

  v24 = [v14 bundleIdentifier];
  char v25 = [v24 isEqualToString:*MEMORY[0x263F78F80]];

  v39 = v14;
  uint64_t v26 = [v14 bundleIdentifier];
  int v27 = [v26 hasPrefix:*MEMORY[0x263F78F68]];

  if ((v38 & 0x100000000) != 0
    || (v23 & 1) != 0
    || (v25 & 1) != 0
    || (v27 & v38 & 1) != 0
    || ([v39 bundleIdentifier],
        v28 = objc_claimAutoreleasedReturnValue(),
        char v29 = [v28 hasPrefix:@"com.apple.parsec."],
        v28,
        (v29 & 1) == 0))
  {
    v30 = objc_msgSend(v39, "results", v38);
    v31 = (void *)[v30 copy];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = objc_unsafeClaimAutoreleasedReturnValue(updateDedupeDictsForResult(*(void **)(*((void *)&v40 + 1)
                                                                                            + 8 * i), v15, v16, v17, v18, v19, v20));
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v34);
    }
  }
}

id updateDedupeDictsForResult(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v13 = a1;
  id v66 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v76 = a7;
  id v18 = [v13 sectionBundleIdentifier];
  uint64_t v19 = *MEMORY[0x263F78F78];
  LODWORD(a5) = [v18 isEqualToString:*MEMORY[0x263F78F78]];

  if (a5
    || ([v13 sectionBundleIdentifier],
        id v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = *MEMORY[0x263F78F80],
        int v21 = [v20 isEqualToString:*MEMORY[0x263F78F80]],
        v20,
        v21))
  {
    id v22 = [v17 objectForKey:v19];
    char v23 = v22;
    if (v22)
    {
      if (v22 != v13)
      {
        id v24 = v22;
LABEL_8:
        id v25 = v24;

        goto LABEL_61;
      }
    }
    else
    {
      [v17 setObject:v13 forKey:v19];
    }
    id v24 = 0;
    goto LABEL_8;
  }
  uint64_t v26 = [v13 storeIdentifier];
  v65 = (void *)v26;
  if (!v26)
  {
    id v77 = 0;
    goto LABEL_17;
  }
  uint64_t v27 = v26;
  id v28 = [v14 objectForKey:v26];
  char v29 = v28;
  if (!v28)
  {
    [v14 setObject:v13 forKey:v27];
    goto LABEL_15;
  }
  if (v28 == v13)
  {
LABEL_15:
    id v77 = 0;
    goto LABEL_16;
  }
  id v77 = v28;
LABEL_16:

LABEL_17:
  uint64_t v30 = [v13 calendarIdentifier];
  uint64_t v63 = v30;
  if (v30)
  {
    uint64_t v31 = v30;
    objc_msgSend(v15, "objectForKey:", v30, v30, v65, v66);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = v32;
    if (v32)
    {
      if (v32 != v13)
      {
        id v34 = v32;

        id v77 = v34;
      }
    }
    else
    {
      [v15 setObject:v13 forKey:v31];
    }
  }
  uint64_t v35 = objc_msgSend(v13, "sectionBundleIdentifier", v63);
  int v36 = [v35 isEqualToString:*MEMORY[0x263F78F60]];

  if (!v36) {
    goto LABEL_30;
  }
  id v37 = [v13 identifier];
  id v38 = [v16 objectForKey:v37];

  if (!v38)
  {
    v39 = [v13 identifier];
    [v16 setObject:v13 forKey:v39];
    goto LABEL_28;
  }
  if (v38 != v13)
  {
    v39 = v77;
    id v77 = v38;
LABEL_28:
  }
LABEL_30:
  long long v40 = [v13 sectionBundleIdentifier];
  int v41 = [v40 hasPrefix:*MEMORY[0x263F78F68]];

  if (v41)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v42 = [v13 inlineCard];
    long long v43 = [v42 cardSections];

    obuint64_t j = v43;
    uint64_t v73 = [v43 countByEnumeratingWithState:&v82 objects:v87 count:16];
    if (v73)
    {
      id v71 = v14;
      uint64_t v72 = *(void *)v83;
      id v69 = v16;
      id v70 = v15;
      id v68 = v17;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v83 != v72) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v46 = v45;
          }
          else {
            v46 = 0;
          }
          id v47 = v46;
          if (v47)
          {
            id v74 = v47;
            uint64_t v75 = i;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v48 = [v47 cardSections];
            uint64_t v49 = [v48 countByEnumeratingWithState:&v78 objects:v86 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v79;
              v52 = v76;
              do
              {
                for (uint64_t j = 0; j != v50; ++j)
                {
                  if (*(void *)v79 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  v54 = [*(id *)(*((void *)&v78 + 1) + 8 * j) command];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    v55 = v54;
                  }
                  else {
                    v55 = 0;
                  }
                  id v56 = v55;
                  v57 = [v56 applicationBundleIdentifier];
                  if (v57)
                  {
                    id v58 = [v52 objectForKey:v57];
                    v59 = v58;
                    if (v58)
                    {
                      if (v58 != v13)
                      {
                        id v60 = v13;
                        id v61 = v58;

                        id v77 = v61;
                        id v13 = v60;
                        v52 = v76;
                      }
                    }
                    else
                    {
                      [v52 setObject:v13 forKey:v57];
                    }
                  }
                }
                uint64_t v50 = [v48 countByEnumeratingWithState:&v78 objects:v86 count:16];
              }
              while (v50);
            }

            id v15 = v70;
            id v14 = v71;
            id v17 = v68;
            id v16 = v69;
            id v47 = v74;
            uint64_t i = v75;
          }
        }
        uint64_t v73 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
      }
      while (v73);
    }
  }
  id v25 = v77;

LABEL_61:
  return v25;
}

void sub_235D25200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

unint64_t query_analytics_log_timing_with_extras(void *a1, const char *a2, const char *a3, uint64_t a4, const char *a5, unint64_t a6, const char *a7, unint64_t a8, const char *a9, unint64_t a10)
{
  id v17 = a1;
  __uint64_t v18 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  key = 0;
  asprintf(&key, "%s_label", a3);
  id v25 = 0;
  asprintf(&v25, "%s_latency", a3);
  char v23 = 0;
  id v24 = 0;
  id v22 = 0;
  if (a5) {
    asprintf(&v24, "%s_%s", a3, a5);
  }
  if (a7) {
    asprintf(&v23, "%s_%s", a3, a7);
  }
  if (a9) {
    asprintf(&v22, "%s_%s", a3, a9);
  }
  unint64_t v19 = v18 - a4;
  os_unfair_lock_lock((os_unfair_lock_t)&perfDictLock);
  xpc_object_t empty = [v17 perfDictionary];
  if (!empty)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [v17 setPerfDictionary:empty];
  }
  xpc_dictionary_set_string(empty, key, a2);
  xpc_dictionary_set_double(empty, v25, (double)v19 / 1000000000.0);
  if (v24) {
    xpc_dictionary_set_double(empty, v24, (double)a6 / 1000000000.0);
  }
  if (v23) {
    xpc_dictionary_set_double(empty, v23, (double)a8 / 1000000000.0);
  }
  if (v22) {
    xpc_dictionary_set_double(empty, v22, (double)a10 / 1000000000.0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&perfDictLock);
  free(key);
  free(v25);
  free(v24);
  free(v23);
  free(v22);

  return v19;
}

uint64_t __SPQueryKindIsSearchToolSearch_block_invoke()
{
  SPQueryKindIsSearchToolSearch_isSearchToolRanking = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  SPQueryKindIsSearchToolSearch_isSearchToolDebugMode = result;
  return result;
}

void sub_235D264B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D26808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D268F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::updatePhoneFavorites(_anonymous_namespace_ *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = [MEMORY[0x263EFEA98] sharedInstance];
  uint64_t v2 = [v1 entries];
  id v3 = (void *)[v2 copy];

  long long v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v8), "contactProperty", (void)v14);
        unint64_t v10 = [v9 contact];

        v11 = [v10 identifier];
        [v4 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [v4 copy];
}

void sub_235D26AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D26BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D26E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D26F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::updateMailVIPList(_anonymous_namespace_ *this)
{
  uint64_t v1 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E9427A0];
  uint64_t v2 = [MEMORY[0x263F536A8] remoteProxyForXPCInterface:v1 connectionErrorHandler:&__block_literal_global_661];
  id v3 = (void *)os_transaction_create();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_663;
  v5[3] = &unk_264C76F00;
  id v6 = v3;
  id v4 = v3;
  [v2 orderedVIPAddressesAndUnreadCountsWithCompletion:v5];
}

void sub_235D2709C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v17 = v16;

  _Unwind_Resume(a1);
}

void sub_235D27190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D27380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D27550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D279EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_235D27AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D27DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_235D27EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D27FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SPCSSearchQuery;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_235D2915C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<tt_hash_table<anonymous namespace'::SPResultValueItemHashTableEntry>>::emplace_back<long &,anonymous namespace'::SPResultValueItemHashTableEntry>(int64x2_t *a1, uint64_t *a2, uint64_t a3)
{
  id v5 = a1;
  unint64_t v6 = a1[1].u64[0];
  unint64_t v7 = a1->u64[1];
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - a1->i64[0]) >> 5;
    if ((unint64_t)(v10 + 1) >> 59) {
      abort();
    }
    uint64_t v11 = v6 - a1->i64[0];
    uint64_t v12 = v11 >> 4;
    if (v11 >> 4 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    id v34 = a1 + 1;
    if (v13)
    {
      if (v13 >> 59) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      long long v14 = (char *)operator new(32 * v13);
    }
    else
    {
      long long v14 = 0;
    }
    uint64_t v31 = v14;
    v32.i64[0] = (uint64_t)&v14[32 * v10];
    uint64_t v33 = &v14[32 * v13];
    long long v15 = (void *)v32.i64[0];
    uint64_t v9 = v32.i64[0] + 32;
    v32.i64[1] = v32.i64[0] + 32;
    uint64_t v17 = v5->i64[0];
    unint64_t v16 = v5->u64[1];
    if (v16 == v5->i64[0])
    {
      int64x2_t v28 = vdupq_n_s64(v16);
    }
    else
    {
      uint64_t v30 = v5;
      __uint64_t v18 = (void *)v32.i64[0];
      do
      {
        int v19 = *(_DWORD *)(v16 - 32);
        v16 -= 32;
        *((_DWORD *)v18 - 8) = v19;
        v18 -= 4;
        v18[1] = 0;
        v18[2] = 0;
        v18[3] = 0;
        uint64_t v20 = *(void *)(v16 + 8);
        uint64_t v21 = *(void *)(v16 + 16);
        if (v21 != v20)
        {
          uint64_t v22 = 0;
          uint64_t v23 = *(v15 - 2);
          do
          {
            uint64_t v24 = v20 + v22;
            uint64_t v25 = v23 + v22;
            long long v26 = *(_OWORD *)(v20 + v22 + 16);
            *(_OWORD *)uint64_t v25 = *(_OWORD *)(v20 + v22);
            *(_OWORD *)(v25 + 16) = v26;
            *(void *)(v25 + 32) = *(id *)(v20 + v22 + 32);
            uint64_t v27 = *(void *)(v20 + v22 + 40);
            *(_DWORD *)(v25 + 48) = *(_DWORD *)(v20 + v22 + 48);
            *(void *)(v25 + 40) = v27;
            *(void *)(v25 + 56) = *(id *)(v20 + v22 + 56);
            *(void *)(v25 + 64) = *(id *)(v20 + v22 + 64);
            *(void *)(v25 + 72) = *(void *)(v20 + v22 + 72);
            v22 += 80;
          }
          while (v24 + 80 != v21);
          *(v15 - 2) = v23 + v22;
        }
        long long v15 = v18;
      }
      while (v16 != v17);
      id v5 = v30;
      int64x2_t v28 = *v30;
      uint64_t v9 = v32.i64[1];
      long long v15 = v18;
    }
    v5->i64[0] = (uint64_t)v15;
    v5->i64[1] = v9;
    int64x2_t v32 = v28;
    char v29 = (char *)v5[1].i64[0];
    v5[1].i64[0] = (uint64_t)v33;
    uint64_t v33 = v29;
    uint64_t v31 = (char *)v28.i64[0];
  }
  else
  {
    uint64_t v9 = v7 + 32;
    v5->i64[1] = v7 + 32;
  }
  v5->i64[1] = v9;
  return result;
}

void sub_235D295B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void anonymous namespace'::SPResultValueItemHashTableEntry::~SPResultValueItemHashTableEntry(id *this)
{
}

uint64_t anonymous namespace'::getGreaterOperator@<X0>(uint64_t this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  if (!a2)
  {
    *a3 = &unk_26E92AB18;
LABEL_5:
    goto LABEL_6;
  }
  if ((~this & 3) != 0)
  {
    *a3 = &unk_26E92AB18;
    if (this)
    {
      goto LABEL_6;
    }
    if ((this & 2) != 0)
    {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  *a3 = &unk_26E92AB18;
LABEL_6:
  a3[1] = v3;
  a3[3] = a3;
  return this;
}

uint64_t std::function<BOOL ()(anonymous namespace'::SPResultValueItem,anonymous namespace'::SPResultValueItem)>::function(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::function<BOOL ()(anonymous namespace'::SPResultValueItem,anonymous namespace'::SPResultValueItem)>::~function(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::function<BOOL ()(anonymous namespace'::SPResultValueItem,anonymous namespace'::SPResultValueItem)>::operator()(uint64_t a1, id *a2, id *a3)
{
  uint64_t v5 = *(void *)(a1 + 24);
  if (v5)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, id *, id *))(*(void *)v5 + 48))(v5, a2, a3);

    return v6;
  }
  else
  {
    uint64_t result = std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
  }
  return result;
}

void sub_235D29884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2AA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

id anonymous namespace'::installedApps(_anonymous_namespace_ *this)
{
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = SPFastApplicationsGetNoBuild();
  uint64_t v3 = [v2 allKeys];
  id v4 = [v1 setWithArray:v3];

  if (![v4 count])
  {
    uint64_t v5 = SPCopyVisibleApps();

    id v4 = (void *)v5;
  }
  return v4;
}

void sub_235D2AE5C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_235D2AF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D2B9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2BAB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2BB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2C0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, id *location, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  _Unwind_Resume(a1);
}

void sub_235D2C4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_235D2C608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_235D2D3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_235D2D7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2E2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38,uint64_t a39,uint64_t a40,void *a41)
{
  _Unwind_Resume(a1);
}

void sub_235D2E620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2E9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_235D2F184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_235D2F3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2F488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D2F7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_235D3015C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_235D30B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, _Unwind_Exception *exception_object, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

void sub_235D31A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, uint64_t a18, void *a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,uint64_t a27,void *a28,void *a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_235D31EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D32928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, id *location, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,void *a34,uint64_t a35,uint64_t a36,id a37)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a37);

  _Unwind_Resume(a1);
}

void sub_235D32C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D33680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

id anonymous namespace'::BundleIdToResultMap::resultSet(_anonymous_namespace_::BundleIdToResultMap *this, NSString *a2)
{
  uint64_t v3 = a2;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(NSString *)v3 UTF8String]);
  uint64_t v8 = __p;
  id v4 = *((id *)std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)this, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v8)+ 6);
  if (v7 < 0) {
    operator delete(__p[0]);
  }

  return v4;
}

void sub_235D338B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_235D33928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D33994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D37738(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,uint64_t a44,void *a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,void *a50,uint64_t a51,void *a52,void *a53,void *a54,void *a55,uint64_t a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  STACK[0x218] = a1;

  id v77 = (void *)STACK[0x220];
  _Unwind_Resume((_Unwind_Exception *)STACK[0x218]);
}

void sub_235D387C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D388FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D38A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D38B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D38C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D38D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D38F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_235D39090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_235D39328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void **std::vector<tt_hash_table<anonymous namespace'::SPResultValueItemHashTableEntry>>::~vector[abi:nn180100](void **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    id v4 = *a1;
    if ((void *)v3 != v2)
    {
      do
      {
        v3 -= 32;
      }
      while ((void *)v3 != v2);
      id v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_235D39908(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::~__hash_table((uint64_t)v1);
  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke(uint64_t a1, void *a2)
{
  v5[3] = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [v2 localizedDescription];
    ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_cold_1(v4, (uint64_t)v5, v3);
  }
}

void sub_235D399FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_663(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_663_cold_1((uint64_t)v5, v6, v7);
    }
  }
  else
  {
    if ((unint64_t)[v4 count] >= 0x65)
    {
      uint64_t v8 = objc_msgSend(v4, "subarrayWithRange:", 0, 100);

      id v4 = (id)v8;
    }
    uint64_t v6 = SPLogForSPLogCategoryDefault();
    os_log_type_t v9 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v6, v9))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_235D0B000, v6, v9, "Finish Fetching VIPs", v11, 2u);
    }
  }

  id v10 = self;
}

void sub_235D39B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL29SPQueryKindIsSearchToolSearch11SPQueryKindP8NSString_block_invoke()
{
  SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode = result;
  return result;
}

_anonymous_namespace_::SPResultValueItem *anonymous namespace'::SPResultValueItem::SPResultValueItem(_anonymous_namespace_::SPResultValueItem *this, CSSearchableItem *a2)
{
  long long v43 = a2;
  *((void *)this + 4) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  long long v42 = [(CSSearchableItem *)v43 attributeSet];
  uint64_t v3 = [v42 attributeDictionary];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
  uint64_t v5 = [v3 objectForKey:*MEMORY[0x263F02A08]];
  uint64_t v6 = (void *)*((void *)this + 4);
  *((void *)this + 4) = v5;

  *((_DWORD *)this + 10) = 0;
  uint64_t v7 = [v3 objectForKeyedSubscript:*MEMORY[0x263F02A10]];
  int v41 = v7;
  if (v7)
  {
    [v7 floatValue];
    *((_DWORD *)this + 10) = v8;
  }
  *((_DWORD *)this + 11) = 0;
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x263F029E8]];
  id v10 = v9;
  id v11 = (id)*MEMORY[0x263EFFD08];
  if (v9) {
    BOOL v12 = v9 == v11;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && [v9 count] == 3)
  {
    uint64_t v13 = 0;
    float v14 = 3.4028e38;
    do
    {
      long long v15 = [v10 objectAtIndexedSubscript:v13];
      [v15 floatValue];
      float v17 = v16;

      if (v14 >= v17) {
        float v14 = v17;
      }
      ++v13;
    }
    while (v13 != 3);
    if (v14 >= 0.0 && v14 <= 4.0) {
      *((float *)this + 11) = (float)(v14 * -0.5) + 1.0;
    }
  }
  float v19 = *((float *)this + 10);
  float v20 = *((float *)this + 11);
  id v21 = v4;
  {
  }
  {
    if (([v21 isEqualToString:*MEMORY[0x263F78F28]] & 1) != 0
      || ([v21 isEqualToString:*MEMORY[0x263F78ED8]] & 1) != 0
      || ([v21 isEqualToString:*MEMORY[0x263F78F08]] & 1) != 0
      || [v21 isEqualToString:*MEMORY[0x263F78EF8]])
    {
      float v22 = v20 * 0.6;
      float v23 = 0.4;
    }
    else
    {
      float v22 = v20 * 0.91;
      float v23 = 0.09;
    }
    float v24 = v22 + (float)(v19 * v23);
  }
  else
  {
    float v24 = v19 + v20;
  }

  *((float *)this + 12) = v24;
  uint64_t v25 = [v3 objectForKey:*MEMORY[0x263F029F8]];
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v25 length] == 16)
    {
      long long v26 = (void *)[v25 bytes];
      uint64_t v27 = v26[1];
      *(void *)this = *v26;
      *((void *)this + 1) = v27;
    }
  }
  {
    qword_26AC2E810 = (uint64_t)(id)*MEMORY[0x263F024D0];
    qword_26AC2E818 = (uint64_t)(id)*MEMORY[0x263F02028];
    qword_26AC2E820 = (uint64_t)(id)*MEMORY[0x263F02858];
    qword_26AC2E828 = (uint64_t)(id)*MEMORY[0x263F02048];
    qword_26AC2E830 = (uint64_t)(id)*MEMORY[0x263F01F00];
    qword_26AC2E838 = (uint64_t)(id)*MEMORY[0x263F01F60];
  }
  if ([v21 isEqualToString:*MEMORY[0x263F78F10]])
  {
    id v28 = [v3 objectForKeyedSubscript:*MEMORY[0x263F01F60]];
    if (v28 != v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((_DWORD *)this + 6) = 1;
        [v28 timeIntervalSinceReferenceDate];
        *((void *)this + 2) = v29;
      }
    }
  }
  else
  {
    uint64_t v30 = 0;
    while (1)
    {
      id v31 = [v3 objectForKeyedSubscript:v28];
      if (v31 != v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v31 timeIntervalSinceReferenceDate];
          if (v32 > 0.0) {
            break;
          }
        }
      }

      if (++v30 == 7) {
        goto LABEL_43;
      }
    }
    *((_DWORD *)this + 6) = 7 - v30;
    [v31 timeIntervalSinceReferenceDate];
    *((void *)this + 2) = v33;
  }
LABEL_43:
  id v34 = [v42 curationScore];
  [v34 floatValue];
  *((_DWORD *)this + 7) = v35;

  int v36 = [(CSSearchableItem *)v43 protection];
  uint64_t v37 = [v36 copy];
  id v38 = (void *)*((void *)this + 7);
  *((void *)this + 7) = v37;

  v39 = (void *)*((void *)this + 8);
  *((void *)this + 8) = v43;

  return this;
}

void sub_235D3A128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL anonymous namespace'::hybridGreaterOperator(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a2 + 48);
  float v3 = *(float *)(a1 + 48);
  if (v2 < v3) {
    return 1;
  }
  if (v3 < v2) {
    return 0;
  }
  float v4 = *(float *)(a2 + 28);
  float v5 = *(float *)(a1 + 28);
  if (v4 < v5) {
    return 1;
  }
  if (v5 < v4) {
    return 0;
  }
  int v6 = *(_DWORD *)(a2 + 24);
  int v7 = *(_DWORD *)(a1 + 24);
  if (v6 < v7) {
    return 1;
  }
  return v7 >= v6 && *(double *)(a2 + 16) < *(double *)(a1 + 16);
}

BOOL anonymous namespace'::sparseGreaterOperator(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a2 + 40);
  float v3 = *(float *)(a1 + 40);
  if (v2 < v3) {
    return 1;
  }
  if (v3 < v2) {
    return 0;
  }
  float v4 = *(float *)(a2 + 28);
  float v5 = *(float *)(a1 + 28);
  if (v4 < v5) {
    return 1;
  }
  if (v5 < v4) {
    return 0;
  }
  int v6 = *(_DWORD *)(a2 + 24);
  int v7 = *(_DWORD *)(a1 + 24);
  if (v6 < v7) {
    return 1;
  }
  return v7 >= v6 && *(double *)(a2 + 16) < *(double *)(a1 + 16);
}

BOOL anonymous namespace'::denseGreaterOperator(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a2 + 44);
  float v3 = *(float *)(a1 + 44);
  if (v2 < v3) {
    return 1;
  }
  if (v3 < v2) {
    return 0;
  }
  float v4 = *(float *)(a2 + 28);
  float v5 = *(float *)(a1 + 28);
  if (v4 < v5) {
    return 1;
  }
  if (v5 < v4) {
    return 0;
  }
  int v6 = *(_DWORD *)(a2 + 24);
  int v7 = *(_DWORD *)(a1 + 24);
  if (v6 < v7) {
    return 1;
  }
  return v7 >= v6 && *(double *)(a2 + 16) < *(double *)(a1 + 16);
}

BOOL anonymous namespace'::rankingbitsGreaterOperator(uint64_t a1, uint64_t a2)
{
  if (*(_OWORD *)a2 < *(_OWORD *)a1) {
    return 1;
  }
  if (*(_OWORD *)a1 < *(_OWORD *)a2) {
    return 0;
  }
  float v2 = *(float *)(a2 + 28);
  float v3 = *(float *)(a1 + 28);
  if (v2 < v3) {
    return 1;
  }
  if (v3 < v2) {
    return 0;
  }
  int v4 = *(_DWORD *)(a2 + 24);
  int v5 = *(_DWORD *)(a1 + 24);
  if (v4 < v5) {
    return 1;
  }
  return v5 >= v4 && *(double *)(a2 + 16) < *(double *)(a1 + 16);
}

void _ZNSt3__110__function6__funcIPDoFbRKN12_GLOBAL__N_117SPResultValueItemES5_ENS_9allocatorIS7_EEFbS3_S3_EED0Ev()
{
}

void *_ZNKSt3__110__function6__funcIPDoFbRKN12_GLOBAL__N_117SPResultValueItemES5_ENS_9allocatorIS7_EEFbS3_S3_EE7__cloneEv(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26E92AB18;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIPDoFbRKN12_GLOBAL__N_117SPResultValueItemES5_ENS_9allocatorIS7_EEFbS3_S3_EE7__cloneEPNS0_6__baseISA_EE(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E92AB18;
  a2[1] = v2;
  return result;
}

uint64_t _ZNSt3__110__function6__funcIPDoFbRKN12_GLOBAL__N_117SPResultValueItemES5_ENS_9allocatorIS7_EEFbS3_S3_EEclEOS3_SC_(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, a3);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned __int8 *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v17, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v11 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v11 = (*(void *)&v7 - 1) & v6;
  }
  BOOL v12 = *(unsigned __int8 ***)(*a1 + 8 * v11);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = *v12;
  if (*v12)
  {
    uint64_t v14 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v15 = *((void *)v13 + 1);
      if (v15 == v8)
      {
        if (std::equal_to<std::string>::operator()[abi:nn180100](v14, v13 + 16, v2)) {
          return v13;
        }
      }
      else
      {
        if (v10 > 1)
        {
          if (v15 >= *(void *)&v7) {
            v15 %= *(void *)&v7;
          }
        }
        else
        {
          v15 &= *(void *)&v7 - 1;
        }
        if (v15 != v11) {
          return 0;
        }
      }
      uint64_t v13 = *(unsigned __int8 **)v13;
    }
    while (v13);
  }
  return v13;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      float v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:nn180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v5 = (unsigned __int8 *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v27, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v14 = v9;
      if (v9 >= v11) {
        unint64_t v14 = v9 % v11;
      }
    }
    else
    {
      unint64_t v14 = (v11 - 1) & v9;
    }
    uint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v14);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v5)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
          }
          else
          {
            v17 &= v11 - 1;
          }
          if (v17 != v14) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  memset(v27, 0, sizeof(v27));
  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v11 || (float)(v19 * (float)v11) < v18)
  {
    BOOL v20 = 1;
    if (v11 >= 3) {
      BOOL v20 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v11);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__rehash<true>(a1, v23);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v14 = v10 % v11;
      }
      else {
        unint64_t v14 = v10;
      }
    }
    else
    {
      unint64_t v14 = (v11 - 1) & v10;
    }
  }
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v14);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    void *v24 = v27[0];
  }
  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v14) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v25 >= v11) {
          v25 %= v11;
        }
      }
      else
      {
        v25 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v27, 0);
  return i;
}

void sub_235D3AD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, void *a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  unint64_t v8 = operator new(0x38uLL);
  *a4 = v8;
  a4[1] = v7;
  *((unsigned char *)a4 + 16) = 0;
  *unint64_t v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  *((unsigned char *)a4 + 16) = 1;
}

void sub_235D3ADF4(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      long long v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            long long v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          long long v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

float anonymous namespace'::getScore(float *a1)
{
  if (([*((id *)a1 + 4) intValue] & 1) != 0 && (objc_msgSend(*((id *)a1 + 4), "intValue") & 2) != 0) {
    return a1[12];
  }
  if ([*((id *)a1 + 4) intValue]) {
    return a1[10];
  }
  if (([*((id *)a1 + 4) intValue] & 2) != 0) {
    return a1[11];
  }
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *((void *)a1 + 1);
  return (float)*(unsigned long long *)&v2;
}

void ___ZN12_GLOBAL__N_149topHitNominatedByPommesScoringforBundleIdentifierEP8NSString_block_invoke()
{
  v13[19] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F78E88];
  v13[0] = *MEMORY[0x263F78FD8];
  v13[1] = v1;
  uint64_t v2 = *MEMORY[0x263F78FF0];
  v13[2] = *MEMORY[0x263F78EA8];
  v13[3] = v2;
  uint64_t v3 = *MEMORY[0x263F78EF8];
  v13[4] = *MEMORY[0x263F78F38];
  v13[5] = v3;
  uint64_t v4 = *MEMORY[0x263F78ED8];
  v13[6] = *MEMORY[0x263F78F08];
  v13[7] = v4;
  uint64_t v5 = *MEMORY[0x263F78EA0];
  v13[8] = *MEMORY[0x263F78F10];
  v13[9] = v5;
  uint64_t v6 = *MEMORY[0x263F78FF8];
  v13[10] = *MEMORY[0x263F78FD0];
  v13[11] = v6;
  uint64_t v7 = *MEMORY[0x263F79010];
  v13[12] = *MEMORY[0x263F78EB8];
  v13[13] = v7;
  uint64_t v8 = *MEMORY[0x263F78F30];
  v13[14] = *MEMORY[0x263F78E90];
  v13[15] = v8;
  uint64_t v9 = *MEMORY[0x263F78F98];
  v13[16] = *MEMORY[0x263F78FB8];
  v13[17] = v9;
  v13[18] = *MEMORY[0x263F78FA0];
  unint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:19];
  uint64_t v11 = [v0 setWithArray:v10];
}

void sub_235D3B3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v5 = (unsigned __int8 *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v14 = v9;
      if (v9 >= v11) {
        unint64_t v14 = v9 % v11;
      }
    }
    else
    {
      unint64_t v14 = (v11 - 1) & v9;
    }
    uint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v14);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v5)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
          }
          else
          {
            v17 &= v11 - 1;
          }
          if (v17 != v14) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v31 = 0;
  float v18 = operator new(0x38uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *float v18 = 0;
  v18[1] = v10;
  float v19 = *a4;
  long long v20 = **a4;
  v18[4] = *((void *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)float v19 = 0;
  v18[5] = 0;
  v18[6] = 0;
  LOBYTE(v31) = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v11 || (float)(v22 * (float)v11) < v21)
  {
    BOOL v23 = 1;
    if (v11 >= 3) {
      BOOL v23 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v11);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__rehash<true>(a1, v26);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v14 = v10 % v11;
      }
      else {
        unint64_t v14 = v10;
      }
    }
    else
    {
      unint64_t v14 = (v11 - 1) & v10;
    }
  }
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v14);
  if (v27)
  {
    *(void *)v30[0] = *v27;
    void *v27 = v30[0];
  }
  else
  {
    *(void *)v30[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v30[0];
    *(void *)(*(void *)a1 + 8 * v14) = a1 + 16;
    if (*(void *)v30[0])
    {
      unint64_t v28 = *(void *)(*(void *)v30[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v28 >= v11) {
          v28 %= v11;
        }
      }
      else
      {
        v28 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v28) = v30[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_235D3B670(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t ___ZN12_GLOBAL__N_122SPQueryFetchAttributesEv_block_invoke()
{
  rankingPrefetchedAttributesArray();
  return MEMORY[0x270F9A758]();
}

uint64_t ___ZN12_GLOBAL__N_136topHitQueryParametersForSearchStringEP8NSStringP7NSArrayP6NSDateS1_11SPQueryKindbbbbbbS6_S1_S1_lP12NSDictionary_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
  }
  else
  {

    id v2 = &unk_26E931478;
  }
  return MEMORY[0x270F9A758]();
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  id v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      id v2 = v3;
    }
    while (v3);
  }
}

id anonymous namespace'::BundleIdToResultMap::addSectionWithBundleIdentifier(_anonymous_namespace_::BundleIdToResultMap *this, NSString *a2, uint64_t a3)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v14 = 0;
  uint64_t v5 = a2;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(NSString *)v5 UTF8String]);
  if (std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(this, (uint64_t)__p))
  {
    uint64_t v15 = __p;
    id v6 = *((id *)std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)this, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v15)+ 5);
  }
  else
  {
    unint64_t v7 = [MEMORY[0x263F78D70] mutableSectionWithBundleId:v5];
    [v7 setDomain:1];
    [v7 setDoNotFold:a3];
    uint64_t v8 = objc_opt_new();
    id v6 = v7;
    uint64_t v15 = __p;
    unint64_t v9 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)this, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v15);
    unint64_t v10 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v6;

    unint64_t v11 = (void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v8;
  }
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

void sub_235D3B90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return std::string::basic_string[abi:nn180100]<0>(v0, v1);
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::allocator_traits<std::allocator<std::vector<anonymous namespace'::SPResultValueItem>>>::destroy[abi:nn180100]<std::vector<anonymous namespace'::SPResultValueItem>,void>(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    size_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 80;
      }
      while ((void *)v3 != v1);
      size_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
  }
}

void std::allocator_traits<std::allocator<anonymous namespace'::SPResultValueItem>>::destroy[abi:nn180100]<anonymous namespace'::SPResultValueItem,void>(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
}

void *std::allocator_traits<std::allocator<tt_hash_table<anonymous namespace'::SPResultValueItemHashTableEntry>>>::construct[abi:nn180100]<tt_hash_table<anonymous namespace'::SPResultValueItemHashTableEntry>,long &,anonymous namespace'::SPResultValueItemHashTableEntry,void>(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *(_DWORD *)a1 = *a2;
  *(void *)(a1 + 8) = 0;
  uint64_t result = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  if (v4)
  {
    unsigned int v7 = v4;
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v9 = v8 + 80 * v7;
    do
    {
      long long v10 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)a3;
      *(_OWORD *)(v8 + 16) = v10;
      *(void *)(v8 + 32) = *(id *)(a3 + 32);
      uint64_t v11 = *(void *)(a3 + 40);
      *(_DWORD *)(v8 + 48) = *(_DWORD *)(a3 + 48);
      *(void *)(v8 + 40) = v11;
      *(void *)(v8 + 56) = *(id *)(a3 + 56);
      uint64_t result = *(id *)(a3 + 64);
      uint64_t v12 = *(void *)(a3 + 72);
      *(void *)(v8 + 64) = result;
      *(void *)(v8 + 72) = v12;
      v8 += 80;
    }
    while (v8 != v9);
    *(void *)(a1 + 16) = v9;
  }
  return result;
}

char *std::vector<anonymous namespace'::SPResultValueItemHashTableEntry>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    abort();
  }
  uint64_t v3 = 5 * a2;
  uint64_t result = (char *)operator new(80 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v3];
  return result;
}

uint64_t std::__split_buffer<tt_hash_table<anonymous namespace'::SPResultValueItemHashTableEntry>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 32;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::allocator_traits<std::allocator<tt_hash_table<anonymous namespace'::SPResultValueItemHashTableEntry>>>::destroy[abi:nn180100]<tt_hash_table<anonymous namespace'::SPResultValueItemHashTableEntry>,void>(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    uint64_t v4 = *(void **)(a1 + 8);
    if (v3 != v1)
    {
      do
      {

        v3 -= 80;
      }
      while (v3 != v1);
      uint64_t v4 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v1;
    operator delete(v4);
  }
}

void *std::__split_buffer<anonymous namespace'::SPResultValueItem>::__split_buffer(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x333333333333334) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    unsigned int v7 = (char *)operator new(80 * a2);
  }
  else
  {
    unsigned int v7 = 0;
  }
  uint64_t v8 = &v7[80 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[80 * a2];
  return a1;
}

uint64_t *std::vector<anonymous namespace'::SPResultValueItem>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  if (v3 == *result)
  {
    uint64_t v5 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v5 = v4 - 80;
      long long v6 = *(_OWORD *)(v3 - 64);
      *(_OWORD *)(v4 - 80) = *(_OWORD *)(v3 - 80);
      *(_OWORD *)(v4 - 64) = v6;
      uint64_t v7 = *(void *)(v3 - 48);
      *(void *)(v3 - 48) = 0;
      *(void *)(v4 - 48) = v7;
      uint64_t v8 = *(void *)(v3 - 40);
      *(_DWORD *)(v4 - 32) = *(_DWORD *)(v3 - 32);
      *(void *)(v4 - 40) = v8;
      long long v9 = *(_OWORD *)(v3 - 24);
      *(void *)(v3 - 24) = 0;
      *(void *)(v3 - 16) = 0;
      *(_OWORD *)(v4 - 24) = v9;
      v3 -= 80;
      v4 -= 80;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  uint64_t v10 = *result;
  *uint64_t result = v5;
  a2[1] = v10;
  uint64_t v11 = result[1];
  result[1] = a2[2];
  a2[2] = v11;
  uint64_t v12 = result[2];
  result[2] = a2[3];
  a2[3] = v12;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<anonymous namespace'::SPResultValueItem>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 80;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(anonymous namespace'::SPResultValueItem,anonymous namespace'::SPResultValueItem)> &,std::__wrap_iter<anonymous namespace'::SPResultValueItem*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v6 = v4 >> 1;
    uint64_t v7 = a1 + 80 * (v4 >> 1);
    long long v8 = *(_OWORD *)(v7 + 16);
    v61[0] = *(_OWORD *)v7;
    v61[1] = v8;
    id v62 = *(id *)(v7 + 32);
    uint64_t v9 = *(void *)(v7 + 40);
    int v64 = *(_DWORD *)(v7 + 48);
    uint64_t v63 = v9;
    id v65 = *(id *)(v7 + 56);
    id v66 = *(id *)(v7 + 64);
    long long v10 = *(_OWORD *)(a2 - 64);
    v55[0] = *(_OWORD *)(a2 - 80);
    v55[1] = v10;
    id v56 = *(id *)(a2 - 48);
    uint64_t v11 = *(void *)(a2 - 40);
    int v58 = *(_DWORD *)(a2 - 32);
    uint64_t v57 = v11;
    id v59 = *(id *)(a2 - 24);
    id v60 = *(id *)(a2 - 16);
    {
      uint64_t v12 = a2 - 80;
      memset(v54, 0, sizeof(v54));
      long long v13 = *(_OWORD *)(a2 - 64);
      long long v50 = *(_OWORD *)(a2 - 80);
      long long v51 = v13;
      uint64_t v14 = *(void **)(a2 - 48);
      *(void *)(a2 - 48) = 0;
      id v52 = v14;
      uint64_t v15 = *(void *)(a2 - 40);
      LODWORD(v54[0]) = *(_DWORD *)(a2 - 32);
      uint64_t v53 = v15;
      long long v16 = *(_OWORD *)(a2 - 24);
      *(void *)(a2 - 24) = 0;
      *(void *)(a2 - 16) = 0;
      *(_OWORD *)((char *)v54 + 8) = v16;
      while (1)
      {
        uint64_t v17 = v7;
        long long v18 = *(_OWORD *)(v7 + 16);
        *(_OWORD *)uint64_t v12 = *(_OWORD *)v7;
        *(_OWORD *)(v12 + 16) = v18;
        uint64_t v19 = *(void *)(v7 + 32);
        *(void *)(v7 + 32) = 0;
        long long v20 = *(void **)(v12 + 32);
        *(void *)(v12 + 32) = v19;

        uint64_t v21 = *(void *)(v7 + 40);
        *(_DWORD *)(v12 + 48) = *(_DWORD *)(v7 + 48);
        *(void *)(v12 + 40) = v21;
        uint64_t v22 = *(void *)(v7 + 56);
        *(void *)(v7 + 56) = 0;
        BOOL v23 = *(void **)(v12 + 56);
        *(void *)(v12 + 56) = v22;

        uint64_t v24 = *(void *)(v7 + 64);
        *(void *)(v7 + 64) = 0;
        unint64_t v25 = *(void **)(v12 + 64);
        *(void *)(v12 + 64) = v24;

        if (!v6) {
          break;
        }
        unint64_t v6 = (v6 - 1) >> 1;
        uint64_t v7 = a1 + 80 * v6;
        long long v26 = *(_OWORD *)(v7 + 16);
        v44[0] = *(_OWORD *)v7;
        v44[1] = v26;
        id v45 = *(id *)(v7 + 32);
        uint64_t v27 = *(void *)(v7 + 40);
        int v47 = *(_DWORD *)(v7 + 48);
        uint64_t v46 = v27;
        id v48 = *(id *)(v7 + 56);
        id v49 = *(id *)(v7 + 64);
        v38[0] = v50;
        v38[1] = v51;
        id v28 = v52;
        id v39 = v28;
        uint64_t v40 = v53;
        int v41 = v54[0];
        id v29 = *((id *)&v54[0] + 1);
        id v42 = v29;
        id v30 = *(id *)&v54[1];
        id v43 = v30;
        uint64_t v12 = v17;
      }
      id v28 = v52;
      id v29 = (id)*((void *)&v54[0] + 1);
      id v30 = *(id *)&v54[1];
LABEL_8:
      long long v31 = v51;
      *(_OWORD *)uint64_t v17 = v50;
      *(_OWORD *)(v17 + 16) = v31;
      uint64_t v32 = *(void **)(v17 + 32);
      *(void *)(v17 + 32) = v28;

      uint64_t v33 = v53;
      *(_DWORD *)(v17 + 48) = v54[0];
      *(void *)(v17 + 40) = v33;
      uint64_t v34 = *(void **)(v17 + 56);
      *(void *)(v17 + 56) = v29;

      uint64_t v35 = *(void **)(v17 + 64);
      *(void *)(v17 + 64) = v30;
    }
  }
}

void sub_235D3C108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__erase_unique<std::string>(void *a1, uint64_t a2)
{
  uint64_t result = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::remove(a1, result, (uint64_t)v4);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v4, 0);
    return (unsigned __int8 *)1;
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  unint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    unint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  *uint64_t v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void siriSettingsDidChange()
{
}

uint64_t _SpotlightInternetDomainsChangedCallback(uint64_t a1, void *a2)
{
  return [a2 _setSearchDomains:0];
}

unint64_t sp_analytics_log_timing_with_bundle_id(uint64_t a1, const char *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  unint64_t v7 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "label", a2);
  xpc_dictionary_set_double(empty, "latency", (double)v7 / 1000000000.0);
  if (v6) {
    xpc_dictionary_set_string(empty, "bundleid", (const char *)[v6 UTF8String]);
  }
  analytics_send_event();

  return v7;
}

void sub_235D421C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D42EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v38 - 160), 8);
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id SPAppStoreSearchURLFromQuery(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (objc_class *)MEMORY[0x263F08BA0];
    id v2 = a1;
    id v3 = objc_alloc_init(v1);
    [v3 setScheme:@"itms-apps"];
    [v3 setHost:&stru_26E92AFF0];
    unint64_t v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"action" value:@"search"];
    [v4 addObject:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"term" value:v2];
    [v4 addObject:v6];

    [v3 setQueryItems:v4];
    unint64_t v7 = [v3 URL];
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7;
}

id SPWebSearchURLFromQuery(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (SPWebSearchURLFromQuery_onceToken != -1) {
      dispatch_once(&SPWebSearchURLFromQuery_onceToken, &__block_literal_global_24);
    }
    id v2 = [MEMORY[0x263F169B0] sharedInstance];
    id v3 = [v2 defaultSearchEngine];
    unint64_t v4 = [v3 searchURLForUserTypedString:v1];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

void __SPWebSearchURLFromQuery_block_invoke()
{
  int v0 = objc_alloc_init(SPSafariObserver);
  id v1 = (void *)SPWebSearchURLFromQuery_safariObserver;
  SPWebSearchURLFromQuery_safariObserver = (uint64_t)v0;

  objc_msgSend(MEMORY[0x263EFFA40], "_sf_safariSharedDefaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObserver:SPWebSearchURLFromQuery_safariObserver forKeyPath:*MEMORY[0x263F169D0] options:3 context:0];
}

void sub_235D45380(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_235D45428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_235D461A8(_Unwind_Exception *a1)
{
}

void sub_235D461C0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x235D461CCLL);
}

void sub_235D464CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  si_tracing_restore_current_span((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_235D47AB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x3B0]);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Unwind_Resume(a1);
}

id _makeQueryStringForField(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v14 = v4;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v17;
      char v9 = 1;
      do
      {
        uint64_t v10 = 0;
        unint64_t v11 = v7;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          unint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@ = \"%@\"", v3, v12];

          if ((v9 & 1) == 0) {
            [v7 appendFormat:@"|| %@ = \"%@\"", v3, v12];
          }
          char v9 = 0;
          ++v10;
          unint64_t v11 = v7;
        }
        while (v6 != v10);
        uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        char v9 = 0;
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
    }

    id v4 = v14;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

void sub_235D4A070(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x560]);
  _Unwind_Resume(a1);
}

void sub_235D4B190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_235D4C588(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_235D4D0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

unsigned int *SPResultValueItemCreate2(void *a1)
{
  v26[7] = *MEMORY[0x263EF8340];
  id v1 = a1;
  unint64_t v25 = [v1 attributeSet];
  id v2 = [v25 attributeDictionary];
  id v3 = (unsigned int *)malloc_type_calloc(1uLL, 0x50uLL, 0x1080040DC77DE92uLL);
  atomic_store(1u, v3);
  id v4 = [v2 objectForKey:*MEMORY[0x263F029F8]];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length] == 16)
    {
      uint64_t v5 = (void *)[v4 bytes];
      uint64_t v6 = v5[1];
      *((void *)v3 + 2) = *v5;
      *((void *)v3 + 3) = v6;
    }
  }
  if (!SPResultValueItemCreate2_dateAttributeNames)
  {
    uint64_t v7 = *MEMORY[0x263F024D0];
    v26[0] = *MEMORY[0x263F02830];
    v26[1] = v7;
    uint64_t v8 = *MEMORY[0x263F02858];
    v26[2] = *MEMORY[0x263F02028];
    v26[3] = v8;
    uint64_t v9 = *MEMORY[0x263F01F00];
    v26[4] = *MEMORY[0x263F02048];
    v26[5] = v9;
    v26[6] = *MEMORY[0x263F01F60];
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:7];
    unint64_t v11 = (void *)SPResultValueItemCreate2_dateAttributeNames;
    SPResultValueItemCreate2_dateAttributeNames = v10;

    SPResultValueItemCreate2_dateAttributeCount = [(id)SPResultValueItemCreate2_dateAttributeNames count];
  }
  uint64_t v12 = [v2 objectForKey:*MEMORY[0x263F01E20]];
  if ([v12 isEqualToString:@"com.apple.mobilemail"])
  {
    long long v13 = [v2 objectForKey:*MEMORY[0x263F01F60]];
    id v14 = v13;
    if (v13)
    {
      v3[12] = 1;
      [v13 timeIntervalSinceReferenceDate];
      *((void *)v3 + 5) = v15;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (SPResultValueItemCreate2_dateAttributeCount)
  {
    uint64_t v16 = 0;
    unsigned int v17 = 0;
    while (1)
    {
      id v14 = [(id)SPResultValueItemCreate2_dateAttributeNames objectAtIndexedSubscript:v16];
      long long v18 = [v2 objectForKey:v14];
      long long v19 = v18;
      if (v18)
      {
        [v18 timeIntervalSinceReferenceDate];
        if (v20 > 0.0) {
          break;
        }
      }

      uint64_t v16 = ++v17;
      if (SPResultValueItemCreate2_dateAttributeCount <= (unint64_t)v17) {
        goto LABEL_18;
      }
    }
    v3[12] = SPResultValueItemCreate2_dateAttributeCount - v17;
    [v19 timeIntervalSinceReferenceDate];
    *((void *)v3 + 5) = v21;

    goto LABEL_17;
  }
LABEL_18:
  uint64_t v22 = [v2 objectForKey:*MEMORY[0x263F01FE0]];
  [v22 floatValue];
  v3[13] = v23;

  *((void *)v3 + 4) = (id)[v1 protection];
  *((void *)v3 + 8) = CFRetain(v1);

  return v3;
}

void sprvdestroyResultValueArray2(CFTypeRef *a1)
{
  CFRelease(a1[8]);
  free(a1);
}

void sprvreleaseCallback(uint64_t a1, CFTypeRef *a2)
{
  if (atomic_fetch_add((atomic_uint *volatile)a2, 0xFFFFFFFF) == 1)
  {
    CFRelease(a2[8]);
    free(a2);
  }
}

atomic_uint *sprvretainCallback(uint64_t a1, atomic_uint *a2)
{
  uint64_t result = a2;
  atomic_fetch_add(a2, 1u);
  return result;
}

uint64_t sprvcompareResultArrays(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a1 + 16);
  unint64_t v2 = *(void *)(a1 + 24);
  if (*(_OWORD *)(a2 + 16) < __PAIR128__(v2, v3)) {
    return 1;
  }
  if (__PAIR128__(v2, v3) < *(_OWORD *)(a2 + 16)) {
    return -1;
  }
  float v4 = *(float *)(a1 + 52);
  float v5 = *(float *)(a2 + 52);
  if (v4 > v5) {
    return 1;
  }
  if (v4 < v5) {
    return -1;
  }
  int v6 = *(_DWORD *)(a1 + 48);
  int v7 = *(_DWORD *)(a2 + 48);
  if (v6 > v7) {
    return 1;
  }
  if (v6 < v7) {
    return -1;
  }
  double v9 = *(double *)(a1 + 40);
  double v10 = *(double *)(a2 + 40);
  if (v9 > v10) {
    return 1;
  }
  if (v9 >= v10) {
    return 0;
  }
  else {
    return -1;
  }
}

uint64_t sprvcompareRecencyResultArrays(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a2 + 40);
  if (v2 >= v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = -1;
  }
  if (v2 > v3) {
    return 1;
  }
  else {
    return v4;
  }
}

uint64_t BOOLValueForAttr(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t __SPQueryKindIsSearchToolSearch_block_invoke_0()
{
  SPQueryKindIsSearchToolSearch_isSearchToolRanking_0 = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_0 = result;
  return result;
}

id getURLString(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 absoluteString];
LABEL_5:
    double v3 = v2;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    goto LABEL_5;
  }
  double v3 = 0;
LABEL_7:

  return v3;
}

void sub_235D54CFC(_Unwind_Exception *a1)
{
}

uint64_t __SPQueryKindIsSearchToolSearch_block_invoke_1()
{
  SPQueryKindIsSearchToolSearch_isSearchToolRanking_1 = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_1 = result;
  return result;
}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_235D0B000, a3, (uint64_t)a3, "** Mail VIP Widget failed to connect to MailServices: %@", (uint8_t *)a2);
}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_663_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_235D0B000, a2, a3, "There was an XPC error when fetching VIPs: %@", (uint8_t *)&v3);
}

uint64_t AFAssistantRestricted()
{
  return MEMORY[0x270F0EC38]();
}

uint64_t AFSupportPreferencesSynchronize()
{
  return MEMORY[0x270F0EFA0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x270EE44B8](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x270EE44C0](heap);
}

void CFBinaryHeapGetValues(CFBinaryHeapRef heap, const void **values)
{
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t CSRedactString()
{
  return MEMORY[0x270EE85F8]();
}

uint64_t DCSCopyActiveDictionaries()
{
  return MEMORY[0x270F260A0]();
}

uint64_t DCSSearchFoundationCopyResultsWithOptions()
{
  return MEMORY[0x270F260E8]();
}

uint64_t MDPurgeTokenizers()
{
  return MEMORY[0x270F4A6D0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x270EF2A80](retstr, table);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x270EF2B30](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x270EF2B60](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PRSLogCategoryDefault()
{
  return MEMORY[0x270F76E60]();
}

uint64_t PRSRankingItemRankerAddJunkFilter()
{
  return MEMORY[0x270F76E68]();
}

uint64_t PRSRankingQueryIndexDictionary()
{
  return MEMORY[0x270F76E78]();
}

uint64_t SDTraceAdd()
{
  return MEMORY[0x270F76D48]();
}

uint64_t SIGetCompletionOptionsFromRankingWeights()
{
  return MEMORY[0x270F4B088]();
}

uint64_t SISetCompletionRankingWeights()
{
  return MEMORY[0x270F4B190]();
}

uint64_t SPBuildApplicationNames()
{
  return MEMORY[0x270F5CDD8]();
}

uint64_t SPCopyVisibleApps()
{
  return MEMORY[0x270F5CDE8]();
}

uint64_t SPDomains()
{
  return MEMORY[0x270F5CDF0]();
}

uint64_t SPFastApplicationsGetNoBuild()
{
  return MEMORY[0x270F5CE00]();
}

uint64_t SPFastApplicationsNamesGetNoBuild()
{
  return MEMORY[0x270F5CE08]();
}

uint64_t SPFastHiddenAppsGetNoBuild()
{
  return MEMORY[0x270F5CE10]();
}

uint64_t SPGenreGroupingEnabled()
{
  return MEMORY[0x270F5CE18]();
}

uint64_t SPGetDisabledAppSet()
{
  return MEMORY[0x270F5CE20]();
}

uint64_t SPGetDisabledBundleSet()
{
  return MEMORY[0x270F5CE28]();
}

uint64_t SPGetDisabledDomainSet()
{
  return MEMORY[0x270F5CE30]();
}

uint64_t SPGetDisabledDomains()
{
  return MEMORY[0x270F5CE38]();
}

uint64_t SPHideSearchThroughSuggestions()
{
  return MEMORY[0x270F5CE40]();
}

uint64_t SPL1Threshold()
{
  return MEMORY[0x270F5CE48]();
}

uint64_t SPL2Threshold()
{
  return MEMORY[0x270F5CE50]();
}

uint64_t SPLogForSPLogCategoryDefault()
{
  return MEMORY[0x270F5CE58]();
}

uint64_t SPLogForSPLogCategoryQuery()
{
  return MEMORY[0x270F5CE60]();
}

uint64_t SPLogForSPLogCategoryRanking()
{
  return MEMORY[0x270F5CE68]();
}

uint64_t SPLogForSPLogCategoryTelemetry()
{
  return MEMORY[0x270F5CE70]();
}

uint64_t SPLogInit()
{
  return MEMORY[0x270F5CE78]();
}

uint64_t SPMaxCountTopHits()
{
  return MEMORY[0x270F5CE80]();
}

uint64_t SPMaxSectionsBeforeShowMore()
{
  return MEMORY[0x270F5CE88]();
}

uint64_t SPMaxSectionsBeforeShowMoreWithScopedSearch()
{
  return MEMORY[0x270F5CE90]();
}

uint64_t SPMaxVisibleResultsCountPerSection()
{
  return MEMORY[0x270F5CE98]();
}

uint64_t SPMinTopHitThresholdForBigResult()
{
  return MEMORY[0x270F5CEA0]();
}

uint64_t SPSetAppsChangedBlockClient()
{
  return MEMORY[0x270F5CEB0]();
}

uint64_t SSAppNameForBundleId()
{
  return MEMORY[0x270F76E88]();
}

uint64_t SSBundleIdentifiersForSyndicatedPhotos()
{
  return MEMORY[0x270F76E90]();
}

uint64_t SSCompactRankingAttrsAlloc()
{
  return MEMORY[0x270F76E98]();
}

uint64_t SSCompactRankingAttrsCopy()
{
  return MEMORY[0x270F76EA0]();
}

uint64_t SSCompactRankingAttrsGetValue()
{
  return MEMORY[0x270F76EA8]();
}

uint64_t SSCompactRankingAttrsInsertValue()
{
  return MEMORY[0x270F76EB0]();
}

uint64_t SSCompactRankingAttrsUpdateValue()
{
  return MEMORY[0x270F76EB8]();
}

uint64_t SSCreateAsTypedSuggestion()
{
  return MEMORY[0x270F76EC0]();
}

uint64_t SSDefaultQueryParseResultsForQueryString()
{
  return MEMORY[0x270F76EC8]();
}

uint64_t SSDefaultsGetResources()
{
  return MEMORY[0x270F76ED0]();
}

uint64_t SSDefaultsLogForTrigger()
{
  return MEMORY[0x270F76ED8]();
}

uint64_t SSDefaultsSetResources()
{
  return MEMORY[0x270F76EE0]();
}

uint64_t SSDisplayLateServerSuggestions()
{
  return MEMORY[0x270F76EE8]();
}

uint64_t SSEnableAppSearchV2()
{
  return MEMORY[0x270F76EF0]();
}

uint64_t SSEnableLocalDetailText()
{
  return MEMORY[0x270F76EF8]();
}

uint64_t SSEnableSearchToolCleanSlate()
{
  return MEMORY[0x270F76F00]();
}

uint64_t SSEnableSpotlightTopHitPersonalizedRanking()
{
  return MEMORY[0x270F76F08]();
}

uint64_t SSGetCurrentLocale()
{
  return MEMORY[0x270F76F18]();
}

uint64_t SSIsCounterFactual()
{
  return MEMORY[0x270F76F30]();
}

uint64_t SSMaxSectionsBelowSuggestions()
{
  return MEMORY[0x270F76F38]();
}

uint64_t SSNormalizedQueryString()
{
  return MEMORY[0x270F76F40]();
}

uint64_t SSPhraseQueryEscapeString()
{
  return MEMORY[0x270F76F48]();
}

uint64_t SSPreferLocalResultsOnLocalEngagment()
{
  return MEMORY[0x270F76F50]();
}

uint64_t SSPriorityIndexDelayMilliseconds()
{
  return MEMORY[0x270F76F58]();
}

uint64_t SSPriorityIndexFastPathEnabled()
{
  return MEMORY[0x270F76F60]();
}

uint64_t SSPriorityIndexLimitBundles()
{
  return MEMORY[0x270F76F68]();
}

uint64_t SSQueryParseResultsForQueryString()
{
  return MEMORY[0x270F76F70]();
}

uint64_t SSQueryParserCancelWithReferenceDict()
{
  return MEMORY[0x270F76F78]();
}

uint64_t SSQueryParserCooldown()
{
  return MEMORY[0x270F76F80]();
}

uint64_t SSQueryParserPreheat()
{
  return MEMORY[0x270F76F88]();
}

uint64_t SSQueryParserStripKindFromString()
{
  return MEMORY[0x270F76F90]();
}

uint64_t SSScreenTimeStatusClearCache()
{
  return MEMORY[0x270F76FA8]();
}

uint64_t SSSectionIsSyndicatedPhotos()
{
  return MEMORY[0x270F76FB0]();
}

uint64_t SSSetTopHitWithReasonString()
{
  return MEMORY[0x270F76FB8]();
}

uint64_t SSSetTopHitWithReasonType()
{
  return MEMORY[0x270F76FC0]();
}

uint64_t SSShowMusicRec()
{
  return MEMORY[0x270F76FC8]();
}

uint64_t SSSnippetModernizationEnabled()
{
  return MEMORY[0x270F76FD0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MDCreateSimpleQueryEvaluatorWithBlock()
{
  return MEMORY[0x270F4B220]();
}

uint64_t _MDSimpleQueryDeallocate()
{
  return MEMORY[0x270F4B228]();
}

uint64_t _MDSimpleQueryObjectMatches()
{
  return MEMORY[0x270F4B230]();
}

uint64_t _MDSimpleQuerySetWidcardAttributes()
{
  return MEMORY[0x270F4B238]();
}

uint64_t _MDStringPrefixOfString()
{
  return MEMORY[0x270F4B240]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t analytics_send_event()
{
  return MEMORY[0x270F18A68]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x270ED9450]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
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

uint64_t getAppCorrectionIfAny()
{
  return MEMORY[0x270F76D50]();
}

uint64_t handleHiddenResult()
{
  return MEMORY[0x270F76FD8]();
}

uint64_t isImageOrVideoContentType()
{
  return MEMORY[0x270F76FE0]();
}

uint64_t isMessagesAttachmentCoreSpotlightId()
{
  return MEMORY[0x270F76FF0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t logForCSLogCategoryDefault()
{
  return MEMORY[0x270EE8640]();
}

uint64_t logForCSLogCategoryPersonalization()
{
  return MEMORY[0x270EE8648]();
}

uint64_t logForCSLogCategoryQuery()
{
  return MEMORY[0x270EE8650]();
}

uint64_t logForCSLogCategoryRecs()
{
  return MEMORY[0x270EE8658]();
}

uint64_t looksLikeURL()
{
  return MEMORY[0x270F77060]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint64_t md_tracing_dispatch_async_propagating()
{
  return MEMORY[0x270F4A810]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDA740](*(void *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

uint64_t rankingAttributeNameArray()
{
  return MEMORY[0x270F77068]();
}

uint64_t rankingPrefetchedAttributesArray()
{
  return MEMORY[0x270F77070]();
}

uint64_t si_tracing_calc_next_spanid()
{
  return MEMORY[0x270F4A820]();
}

uint64_t si_tracing_log_span_begin()
{
  return MEMORY[0x270F4A830]();
}

uint64_t si_tracing_log_span_end()
{
  return MEMORY[0x270F4A838]();
}

uint64_t strippedURL()
{
  return MEMORY[0x270F77078]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t tracing_dispatch_apply()
{
  return MEMORY[0x270F4A840]();
}

uint64_t tracing_dispatch_async()
{
  return MEMORY[0x270F4A848]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}
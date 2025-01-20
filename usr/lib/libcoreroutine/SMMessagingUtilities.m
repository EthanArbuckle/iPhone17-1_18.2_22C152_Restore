@interface SMMessagingUtilities
+ (BOOL)handlesInConversation1:(id)a3 canonicallyEqualsHandlesInConversation2:(id)a4;
+ (id)_canonicalHandleMapFromHandles:(id)a3;
+ (id)_canonicalizeHandles:(id)a3;
+ (id)canonicalIDSIDsForAddress:(id)a3;
+ (id)conversationFromHandlesInConversation1:(id)a3 canonicallyIntersectedWithHandlesInConversation2:(id)a4;
+ (id)conversationFromHandlesInConversation1:(id)a3 canonicallyMappedToHandlesInConversation2:(id)a4;
+ (void)queryChatWithGroupID:(id)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation SMMessagingUtilities

+ (void)queryChatWithGroupID:(id)a3 queue:(id)a4 handler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMCoreLibraryCore() && getIMSPIQueryChatWithGroupIDSymbolLoc())
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]";
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%s, IMCoreIMSPIQueryChatWithGroupID available", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__SMMessagingUtilities_queryChatWithGroupID_queue_handler___block_invoke;
    v16[3] = &unk_1E6B97498;
    id v17 = v9;
    id v11 = v7;
    id v12 = v8;
    v13 = v16;
    IMSPIQueryChatWithGroupIDSymbolLoc = (void (*)(id, uint64_t, id, void *))getIMSPIQueryChatWithGroupIDSymbolLoc();
    if (!IMSPIQueryChatWithGroupIDSymbolLoc)
    {
      dlerror();
      abort_report_np();
    }
    IMSPIQueryChatWithGroupIDSymbolLoc(v11, 25, v12, v13);
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]";
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, IMCoreIMSPIQueryChatWithGroupID not available", buf, 0xCu);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __59__SMMessagingUtilities_queryChatWithGroupID_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v11 = 136315394;
      id v12 = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v3;
      v6 = "%s, found chat %@";
      id v7 = v4;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    int v11 = 136315138;
    id v12 = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]_block_invoke";
    v6 = "%s, no chat found";
    id v7 = v4;
    uint32_t v8 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v9, v10);
}

+ (id)_canonicalizeHandles:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v4 count]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 138413058;
    long long v19 = v8;
    id v20 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        __int16 v13 = [a1 canonicalIDSIDsForAddress:v12, v19];
        [v5 addObject:v13];
        id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = (objc_class *)objc_opt_class();
          v16 = NSStringFromClass(v15);
          *(_DWORD *)buf = v19;
          v26 = v16;
          __int16 v27 = 2080;
          v28 = "+[SMMessagingUtilities _canonicalizeHandles:]";
          __int16 v29 = 2112;
          uint64_t v30 = v12;
          __int16 v31 = 2112;
          v32 = v13;
          _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, %s, raw handle, %@, canonicalized handle, %@", buf, 0x2Au);

          id v6 = v20;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v9);
  }

  id v17 = (void *)[v5 copy];

  return v17;
}

+ (id)_canonicalHandleMapFromHandles:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[v4 count]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        int v11 = [a1 canonicalIDSIDsForAddress:v10];
        uint64_t v12 = [v5 objectForKey:v11];
        __int16 v13 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v10, 0];
        [v5 setObject:v13 forKey:v11];

        if (v12)
        {
          id v14 = [v12 arrayByAddingObject:v10];

          uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (objc_class *)objc_opt_class();
            id v17 = NSStringFromClass(v16);
            *(_DWORD *)buf = 138413058;
            v26 = v17;
            __int16 v27 = 2080;
            v28 = "+[SMMessagingUtilities _canonicalHandleMapFromHandles:]";
            __int16 v29 = 2112;
            uint64_t v30 = v14;
            __int16 v31 = 2112;
            v32 = v11;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "%@, %s, found multiple handles, %@, for the same canonical handle, %@", buf, 0x2Au);
          }
        }
        else
        {
          id v14 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v10, 0];
          [v5 setObject:v14 forKey:v11];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v7);
  }

  v18 = (void *)[v5 copy];

  return v18;
}

+ (BOOL)handlesInConversation1:(id)a3 canonicallyEqualsHandlesInConversation2:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = [v6 receiverPrimaryHandles];
  uint64_t v10 = [a1 _canonicalizeHandles:v9];
  int v11 = (void *)[v8 initWithArray:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  __int16 v13 = [v7 receiverPrimaryHandles];
  id v14 = [a1 _canonicalizeHandles:v13];
  uint64_t v15 = (void *)[v12 initWithArray:v14];

  v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    long long v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    long long v21 = [v6 receiverPrimaryHandles];
    long long v22 = [v7 receiverPrimaryHandles];
    int v23 = 138413570;
    long long v24 = v20;
    __int16 v25 = 2080;
    v26 = "+[SMMessagingUtilities handlesInConversation1:canonicallyEqualsHandlesInConversation2:]";
    __int16 v27 = 2112;
    v28 = v21;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    __int16 v31 = 2112;
    v32 = v11;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@, %s, conversation 1 handles, %@, conversation 2 handles, %@, conversation 1 canonical handles, %@, conversation 2 canonical handles, %@", (uint8_t *)&v23, 0x3Eu);
  }
  char v17 = [v11 isEqualToSet:v15];

  return v17;
}

+ (id)conversationFromHandlesInConversation1:(id)a3 canonicallyMappedToHandlesInConversation2:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v45 = v6;
  id v8 = [v6 receiverPrimaryHandles];
  uint64_t v9 = [a1 _canonicalHandleMapFromHandles:v8];

  v42 = v7;
  uint64_t v10 = [v7 receiverPrimaryHandles];
  int v11 = [a1 _canonicalHandleMapFromHandles:v10];

  id v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v9 count]];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v47 = v9;
  __int16 v13 = [v9 allKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v66 count:16];
  v46 = v12;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v19 = [v11 objectForKey:v18];
        id v20 = v19;
        if (v19 && [v19 count])
        {
          id v21 = objc_alloc(MEMORY[0x1E4F99888]);
          long long v22 = [v20 objectAtIndexedSubscript:0];
          int v23 = [v21 initWithPrimaryHandle:v22 secondaryHandles:MEMORY[0x1E4F1CBF0]];
          [v12 addObject:v23];
        }
        else
        {
          long long v24 = [v47 objectForKey:v18];
          long long v22 = v24;
          if (v24 && [v24 count])
          {
            id v25 = objc_alloc(MEMORY[0x1E4F99888]);
            int v23 = [v47 objectForKey:v18];
            v26 = [v23 objectAtIndexedSubscript:0];
            __int16 v27 = (void *)[v25 initWithPrimaryHandle:v26 secondaryHandles:MEMORY[0x1E4F1CBF0]];
            [v46 addObject:v27];

            id v12 = v46;
          }
          else
          {
            int v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v28 = (objc_class *)objc_opt_class();
              __int16 v29 = NSStringFromClass(v28);
              *(_DWORD *)buf = 138413058;
              v53 = v29;
              __int16 v54 = 2080;
              v55 = "+[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyMappedToHandlesInConversation2:]";
              __int16 v56 = 2112;
              v57 = v45;
              __int16 v58 = 2112;
              v59 = v18;
              _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %s, missing handle in conversation, %@, for key, %@", buf, 0x2Au);

              id v12 = v46;
            }
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v66 count:16];
    }
    while (v15);
  }

  id v30 = objc_alloc(MEMORY[0x1E4F99838]);
  __int16 v31 = (void *)[v12 copy];
  v32 = [v45 identifier];
  __int16 v33 = [v45 displayName];
  uint64_t v34 = (void *)[v30 initWithReceiverHandles:v31 identifier:v32 displayName:v33];

  uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v37 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v37);
    v38 = [v45 receiverPrimaryHandles];
    v43 = [v47 allKeys];
    v41 = [v42 receiverPrimaryHandles];
    v39 = [v11 allKeys];
    v40 = [v34 receiverPrimaryHandles];
    *(_DWORD *)buf = 138413826;
    v53 = v44;
    __int16 v54 = 2080;
    v55 = "+[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyMappedToHandlesInConversation2:]";
    __int16 v56 = 2112;
    v57 = v38;
    __int16 v58 = 2112;
    v59 = v43;
    __int16 v60 = 2112;
    v61 = v41;
    __int16 v62 = 2112;
    v63 = v39;
    __int16 v64 = 2112;
    v65 = v40;
    _os_log_debug_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEBUG, "%@, %s, original handles in conversation, %@, canonical handles in conversation, %@, handles in reference conversation, %@, canonical handles in reference conversation, %@, final handles in conversation, %@", buf, 0x48u);

    id v12 = v46;
  }

  return v34;
}

+ (id)conversationFromHandlesInConversation1:(id)a3 canonicallyIntersectedWithHandlesInConversation2:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v41 = v6;
  id v8 = [v6 receiverPrimaryHandles];
  uint64_t v9 = [a1 _canonicalHandleMapFromHandles:v8];

  v39 = v7;
  uint64_t v10 = [v7 receiverPrimaryHandles];
  int v11 = [a1 _canonicalHandleMapFromHandles:v10];

  id v12 = (void *)MEMORY[0x1E4F1CA80];
  __int16 v13 = [v9 allKeys];
  uint64_t v14 = [v12 setWithArray:v13];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  v38 = v11;
  uint64_t v16 = [v11 allKeys];
  uint64_t v17 = [v15 setWithArray:v16];

  v37 = (void *)v17;
  [v14 intersectSet:v17];
  v18 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v14 count]];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v43;
    v40 = v18;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v25 = [v9 objectForKey:v24];
        v26 = v25;
        if (v25 && [v25 count])
        {
          id v27 = objc_alloc(MEMORY[0x1E4F99888]);
          v28 = [v26 objectAtIndexedSubscript:0];
          __int16 v29 = (void *)[v27 initWithPrimaryHandle:v28 secondaryHandles:MEMORY[0x1E4F1CBF0]];
          [v18 addObject:v29];
        }
        else
        {
          v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            id v30 = (objc_class *)objc_opt_class();
            __int16 v31 = NSStringFromClass(v30);
            *(_DWORD *)buf = 138413058;
            v47 = v31;
            __int16 v48 = 2080;
            long long v49 = "+[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyIntersectedWithHandlesInConversation2:]";
            __int16 v50 = 2112;
            long long v51 = v41;
            __int16 v52 = 2112;
            uint64_t v53 = v24;
            _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %s, missing handle in conversation, %@, for key, %@", buf, 0x2Au);

            v18 = v40;
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v21);
  }

  id v32 = objc_alloc(MEMORY[0x1E4F99838]);
  __int16 v33 = [v41 identifier];
  uint64_t v34 = [v41 displayName];
  uint64_t v35 = (void *)[v32 initWithReceiverHandles:v18 identifier:v33 displayName:v34];

  return v35;
}

+ (id)canonicalIDSIDsForAddress:(id)a3
{
  return (id)MEMORY[0x1F4123F90](a3, a2);
}

@end
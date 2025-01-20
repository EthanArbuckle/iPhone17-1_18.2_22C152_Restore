@interface TTSSynthesisProviderVoiceManager
+ (BOOL)_componentIsEqual:(AudioComponentDescription *)a3 to:(AudioComponentDescription *)a4;
+ (BOOL)synthesizerHasEntitlement:(id)a3 entitlement:(const char *)a4;
+ (NSArray)allSynthesisProviderVoices;
+ (NSArray)componentCache;
+ (id)sharedInstance;
+ (void)freeSharedInstance;
+ (void)registerFirstPartyInProcessAudioUnits;
+ (void)setComponentCache:(id)a3;
- (BOOL)_loadVoicesForComponentWithTimeout:(id)a3 timeout:(double)a4 timedOut:(BOOL *)a5;
- (OS_dispatch_queue)componentQueryQueue;
- (OS_dispatch_queue)operationQueue;
- (TTSSynthesisProviderVoiceManager)init;
- (TTSSynthesisProviderVoiceManagerDelegate)delegate;
- (void)_loadVoicesForComponentRecord:(id)a3 dispatchGroup:(id)a4;
- (void)_loadVoicesForComponents:(id)a3;
- (void)_reconcileCachedComponents:(id)a3;
- (void)_reloadVoiceForBundleIdentifierHash:(id)a3;
- (void)_reloadVoiceForBundleIdentifierPrefix:(id)a3;
- (void)fetchAudioUnitInstanceForVoice:(id)a3 completion:(id)a4;
- (void)purgeAndReloadAllComponents;
- (void)reconcileCachedComponents;
- (void)reloadVoicesForBundleIdentifierHash:(id)a3;
- (void)reloadVoicesForBundleIdentifierPrefix:(id)a3;
- (void)setComponentQueryQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation TTSSynthesisProviderVoiceManager

+ (NSArray)allSynthesisProviderVoices
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = objc_opt_class();
  v11 = objc_msgSend_componentCache(v6, v7, v8, v9, v10, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v13)
  {
    uint64_t v18 = v13;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v11);
        }
        v21 = objc_msgSend_voices(*(void **)(*((void *)&v26 + 1) + 8 * i), v14, v15, v16, v17);
        objc_msgSend_addObjectsFromArray_(v5, v22, (uint64_t)v21, v23, v24);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v18);
  }

  return (NSArray *)v5;
}

- (TTSSynthesisProviderVoiceManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)TTSSynthesisProviderVoiceManager;
  uint64_t v2 = [(TTSSynthesisProviderVoiceManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("auspmanager.voiceloading", v3);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, -1);

    dispatch_queue_t v8 = dispatch_queue_create("auspmanager.componentquery", v7);
    componentQueryQueue = v2->_componentQueryQueue;
    v2->_componentQueryQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = v2;
  }

  return v2;
}

+ (NSArray)componentCache
{
  v25[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1AD0C1200](a1, a2);
  CFPropertyListRef v3 = TTSPreferencesCopyValueForKey(@"TTSSynthesisProviderCachedComponentsKey");
  if (v3)
  {
    dispatch_queue_t v4 = (void *)v3;
    id v5 = objc_alloc(MEMORY[0x1E4F28DC0]);
    id v24 = 0;
    dispatch_queue_t v8 = objc_msgSend_initForReadingFromData_error_(v5, v6, (uint64_t)v4, (uint64_t)&v24, v7);
    id v9 = v24;
    if (v9)
    {
      uint64_t v10 = AXTTSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1A688E658(v10);
      }
    }
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v25, 3, v13);
    uint64_t v18 = objc_msgSend_setWithArray_(v11, v15, (uint64_t)v14, v16, v17);

    v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v8, v19, (uint64_t)v18, *MEMORY[0x1E4F284E8], v20);

    id v22 = v21;
  }
  else
  {
    id v22 = (id)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v22;
}

+ (id)sharedInstance
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_1A6708CA4;
  dispatch_queue_t v8 = sub_1A6708CB4;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

+ (void)freeSharedInstance
{
}

+ (void)registerFirstPartyInProcessAudioUnits
{
  if (qword_1E96C3AB0 != -1) {
    dispatch_once(&qword_1E96C3AB0, &unk_1EFB80500);
  }
}

- (void)reconcileCachedComponents
{
  uint64_t v6 = objc_msgSend_operationQueue(self, a2, v2, v3, v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A670904C;
  block[3] = &unk_1E5C69588;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (void)reloadVoicesForBundleIdentifierPrefix:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_operationQueue(self, v5, v6, v7, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A670915C;
  v11[3] = &unk_1E5C69600;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_sync(v9, v11);
}

- (void)reloadVoicesForBundleIdentifierHash:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_operationQueue(self, v5, v6, v7, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A670921C;
  v11[3] = &unk_1E5C69600;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_sync(v9, v11);
}

- (void)_reloadVoiceForBundleIdentifierPrefix:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v10 = objc_msgSend_componentCache(v5, v6, v7, v8, v9);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1A67092F8;
  v19[3] = &unk_1E5C69DB8;
  id v20 = v4;
  id v11 = v4;
  uint64_t v15 = objc_msgSend_ax_filteredArrayUsingBlock_(v10, v12, (uint64_t)v19, v13, v14);

  objc_msgSend__reconcileCachedComponents_(self, v16, (uint64_t)v15, v17, v18);
}

- (void)_reloadVoiceForBundleIdentifierHash:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_intValue(v4, v5, v6, v7, v8))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v14 = objc_msgSend_componentCache(v9, v10, v11, v12, v13);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1A670944C;
    v26[3] = &unk_1E5C69DB8;
    id v27 = v4;
    uint64_t v18 = objc_msgSend_ax_filteredArrayUsingBlock_(v14, v15, (uint64_t)v26, v16, v17);

    objc_msgSend__reconcileCachedComponents_(self, v19, (uint64_t)v18, v20, v21);
  }
  else
  {
    id v22 = AXTTSLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1A688E0B4(v22);
    }

    objc_msgSend__reconcileCachedComponents_(self, v23, MEMORY[0x1E4F1CBF0], v24, v25);
  }
}

- (void)purgeAndReloadAllComponents
{
  uint64_t v6 = objc_msgSend_operationQueue(self, a2, v2, v3, v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A6709570;
  block[3] = &unk_1E5C69588;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (void)_reconcileCachedComponents:(id)a3
{
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  id v163 = a3;
  uint64_t v3 = AXTTSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = objc_msgSend_count(v163, v4, v5, v6, v7);
    _os_log_impl(&dword_1A66D3000, v3, OS_LOG_TYPE_INFO, "TTSVoiceProvider::Reconcile records: Source cache: %ld", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v8 = AXTTSLogCommon();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    id v14 = v163;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v176, (uint64_t)v190, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v177;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v177 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v176 + 1) + 8 * v18);
          uint64_t v20 = AXTTSLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v19;
            _os_log_debug_impl(&dword_1A66D3000, v20, OS_LOG_TYPE_DEBUG, "  - %@", (uint8_t *)&buf, 0xCu);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v21, (uint64_t)&v176, (uint64_t)v190, 16);
      }
      while (v16);
    }
  }
  v161 = objc_msgSend_mutableCopy(v163, v10, v11, v12, v13);
  v160 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24, v25);
  v162 = objc_msgSend_sharedAudioUnitComponentManager(MEMORY[0x1E4F15410], v26, v27, v28, v29);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v186 = 0x3032000000;
  v187 = sub_1A6708CA4;
  v188 = sub_1A6708CB4;
  strcpy((char *)v180, "psua");
  *(void *)v181 = 0;
  BYTE1(v180[1]) = 0;
  HIWORD(v180[1]) = 0;
  v180[2] = 0;
  v33 = objc_msgSend_componentsMatchingDescription_(v162, v30, (uint64_t)v180, v31, v32);
  id v189 = (id)objc_msgSend_mutableCopy(v33, v34, v35, v36, v37);

  v42 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v38, v39, v40, v41);
  v43 = *(void **)(*((void *)&buf + 1) + 40);
  v174[0] = MEMORY[0x1E4F143A8];
  v174[1] = 3221225472;
  v174[2] = sub_1A6709D34;
  v174[3] = &unk_1E5C69DE0;
  id v159 = v42;
  id v175 = v159;
  v47 = objc_msgSend_ax_filteredArrayUsingBlock_(v43, v44, (uint64_t)v174, v45, v46);
  uint64_t v52 = objc_msgSend_mutableCopy(v47, v48, v49, v50, v51);
  v53 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v52;

  v54 = AXTTSLogCommon();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    uint64_t v59 = objc_msgSend_count(*(void **)(*((void *)&buf + 1) + 40), v55, v56, v57, v58);
    v180[0] = 134217984;
    *(void *)&v180[1] = v59;
    _os_log_impl(&dword_1A66D3000, v54, OS_LOG_TYPE_INFO, "AVAudioUnitComponentManager did complete scan, finding %ld components", (uint8_t *)v180, 0xCu);
  }

  v60 = AXTTSLogCommon();
  BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG);

  if (v61)
  {
    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    id v62 = *(id *)(*((void *)&buf + 1) + 40);
    uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v170, (uint64_t)v184, 16);
    if (v64)
    {
      uint64_t v65 = *(void *)v171;
      do
      {
        uint64_t v66 = 0;
        do
        {
          if (*(void *)v171 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = *(void **)(*((void *)&v170 + 1) + 8 * v66);
          v68 = AXTTSLogCommon();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            v74 = objc_msgSend_name(v67, v69, v70, v71, v72);
            v79 = objc_msgSend_typeName(v67, v75, v76, v77, v78);
            v180[0] = 138412802;
            *(void *)&v180[1] = v67;
            *(_WORD *)v181 = 2112;
            *(void *)&v181[2] = v74;
            __int16 v182 = 2112;
            v183 = v79;
            _os_log_debug_impl(&dword_1A66D3000, v68, OS_LOG_TYPE_DEBUG, "  %@ - %@ %@", (uint8_t *)v180, 0x20u);
          }
          ++v66;
        }
        while (v64 != v66);
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v73, (uint64_t)&v170, (uint64_t)v184, 16);
      }
      while (v64);
    }
  }
  v167[0] = MEMORY[0x1E4F143A8];
  v167[1] = 3221225472;
  v167[2] = sub_1A6709DC8;
  v167[3] = &unk_1E5C69E30;
  p_long long buf = &buf;
  v167[4] = self;
  id v80 = v160;
  id v168 = v80;
  v84 = objc_msgSend_ax_filteredArrayUsingBlock_(v161, v81, (uint64_t)v167, v82, v83);
  v89 = objc_msgSend_mutableCopy(v84, v85, v86, v87, v88);

  v93 = objc_msgSend_ax_mappedArrayUsingBlock_(*(void **)(*((void *)&buf + 1) + 40), v90, (uint64_t)&unk_1EFB7E258, v91, v92);
  v98 = objc_msgSend_mutableCopy(v93, v94, v95, v96, v97);

  objc_msgSend__loadVoicesForComponents_(self, v99, (uint64_t)v98, v100, v101);
  v106 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v102, v103, v104, v105);
  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = sub_1A670A048;
  v165[3] = &unk_1E5C69DB8;
  id v107 = v106;
  id v166 = v107;
  v111 = objc_msgSend_ax_filteredArrayUsingBlock_(v98, v108, (uint64_t)v165, v109, v110);
  v116 = objc_msgSend_mutableCopy(v111, v112, v113, v114, v115);

  objc_msgSend_addObjectsFromArray_(v89, v117, (uint64_t)v116, v118, v119);
  v120 = objc_opt_class();
  objc_msgSend_setComponentCache_(v120, v121, (uint64_t)v89, v122, v123);
  v124 = AXTTSLogCommon();
  if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
  {
    v129 = NSNumber;
    uint64_t v130 = objc_msgSend_count(v116, v125, v126, v127, v128);
    v134 = objc_msgSend_numberWithUnsignedInteger_(v129, v131, v130, v132, v133);
    v135 = NSNumber;
    uint64_t v140 = objc_msgSend_count(v80, v136, v137, v138, v139);
    v144 = objc_msgSend_numberWithUnsignedInteger_(v135, v141, v140, v142, v143);
    v180[0] = 138412546;
    *(void *)&v180[1] = v134;
    *(_WORD *)v181 = 2112;
    *(void *)&v181[2] = v144;
    _os_log_impl(&dword_1A66D3000, v124, OS_LOG_TYPE_INFO, "TTSVoiceProvider::Component cache updated with %@ additions and %@ evictions.", (uint8_t *)v180, 0x16u);
  }
  v149 = objc_msgSend_delegate(self, v145, v146, v147, v148);
  v150 = objc_opt_class();
  v155 = objc_msgSend_allSynthesisProviderVoices(v150, v151, v152, v153, v154);
  objc_msgSend_synthesisProviderVoicesDidChange_(v149, v156, (uint64_t)v155, v157, v158);

  _Block_object_dispose(&buf, 8);
}

- (void)_loadVoicesForComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend__loadVoicesForComponentRecord_dispatchGroup_(self, v9, *(void *)(*((void *)&v14 + 1) + 8 * v13++), (uint64_t)v5, v10, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v11);
  }

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_loadVoicesForComponentRecord:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  dispatch_group_enter(v7);
  uint64_t v12 = objc_msgSend_componentQueryQueue(self, v8, v9, v10, v11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A670A2A4;
  block[3] = &unk_1E5C69E78;
  block[4] = self;
  id v16 = v6;
  long long v17 = v7;
  uint64_t v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

- (BOOL)_loadVoicesForComponentWithTimeout:(id)a3 timeout:(double)a4 timedOut:(BOOL *)a5
{
  id v8 = a3;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v14 = (void *)MEMORY[0x1E4F15408];
  if (v8)
  {
    objc_msgSend_componentDescription(v8, v9, v10, v11, v12);
  }
  else
  {
    v29[0] = 0;
    v29[1] = 0;
    int v30 = 0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1A670A7D4;
  v23[3] = &unk_1E5C69EC8;
  uint64_t v27 = &v35;
  uint64_t v28 = &v31;
  long long v15 = v13;
  uint64_t v24 = v15;
  id v16 = v8;
  id v25 = v16;
  long long v26 = self;
  objc_msgSend_instantiateWithComponentDescription_options_completionHandler_(v14, v17, (uint64_t)v29, 1, (uint64_t)v23);
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  intptr_t v19 = dispatch_semaphore_wait(v15, v18);
  *((unsigned char *)v36 + 24) = v19 != 0;
  if (v19)
  {
    uint64_t v20 = AXTTSLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1A688E230();
    }
  }
  if (a5) {
    *a5 = *((unsigned char *)v36 + 24);
  }
  if (*((unsigned char *)v32 + 24)) {
    BOOL v21 = 0;
  }
  else {
    BOOL v21 = *((unsigned char *)v36 + 24) == 0;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

- (void)fetchAudioUnitInstanceForVoice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_componentQueryQueue(self, v8, v9, v10, v11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A670AEF0;
  block[3] = &unk_1E5C69F18;
  long long v17 = self;
  id v18 = v7;
  id v16 = v6;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

+ (void)setComponentCache:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((AXProcessIsAXAssetsd() & 1) == 0) {
    sub_1A688E5C4();
  }
  id v43 = 0;
  uint64_t v5 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)v3, 1, (uint64_t)&v43);
  id v10 = v43;
  if (v10)
  {
    uint64_t v11 = AXTTSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A688E55C();
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend_sharedInstance(TTSAXResourceManager, v6, v7, v8, v9);
    objc_msgSend_purgeLegacyResourceCache(v12, v13, v14, v15, v16);

    unint64_t v21 = objc_msgSend_length(v5, v17, v18, v19, v20);
    id v22 = AXTTSLogCommon();
    uint64_t v23 = v22;
    if (v21 <= 0x7A120)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = NSNumber;
        uint64_t v29 = objc_msgSend_length(v5, v24, v25, v26, v27);
        uint64_t v33 = objc_msgSend_numberWithUnsignedInteger_(v28, v30, v29, v31, v32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v45 = v33;
        _os_log_impl(&dword_1A66D3000, v23, OS_LOG_TYPE_INFO, "Writing %@ bytes to the component cache", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      sub_1A688E4E8();
    }

    TTSPreferencesSetValueForKey(@"TTSSynthesisProviderCachedComponentsKey", v5);
    uint64_t v38 = objc_msgSend_defaultCStringEncoding(NSString, v34, v35, v36, v37);
    v42 = (const char *)objc_msgSend_cStringUsingEncoding_(@"com.apple.TTS.synthProviderVoicesDidUpdate", v39, v38, v40, v41);
    notify_post(v42);
  }
}

+ (BOOL)synthesizerHasEntitlement:(id)a3 entitlement:(const char *)a4
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4) {
    objc_msgSend_remoteProcessAuditToken(v4, v5, v6, v7, v8, (unsigned __int128)0, (unsigned __int128)0);
  }
  id v10 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v11 = v10;
  if (v10) {
    BOOL value = xpc_BOOL_get_value(v10);
  }
  else {
    BOOL value = 0;
  }

  return value;
}

+ (BOOL)_componentIsEqual:(AudioComponentDescription *)a3 to:(AudioComponentDescription *)a4
{
  return a3->componentType == a4->componentType
      && a3->componentManufacturer == a4->componentManufacturer
      && a3->componentSubType == a4->componentSubType;
}

- (TTSSynthesisProviderVoiceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TTSSynthesisProviderVoiceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)componentQueryQueue
{
  return self->_componentQueryQueue;
}

- (void)setComponentQueryQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentQueryQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
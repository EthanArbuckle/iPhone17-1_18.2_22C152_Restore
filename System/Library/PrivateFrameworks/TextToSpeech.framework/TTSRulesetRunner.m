@interface TTSRulesetRunner
- (BOOL)executing;
- (BOOL)shouldAbort;
- (NSMutableArray)ruleReplacements;
- (NSMutableArray)ruleSets;
- (NSNumber)ruleCount;
- (OS_dispatch_queue)regexExecutionQueue;
- (TTSRulesetRunner)init;
- (id)_computeActiveRanges:(id)a3 withIgnoreRanges:(id)a4;
- (id)_ignoreRangesForString:(id)a3;
- (id)_processSpeechString:(id)a3 startingAt:(unint64_t)a4 currentRecursionDepth:(unint64_t)a5;
- (id)_processTemplateReplacementTextForText:(id)a3 replacement:(id)a4 cString:(const char *)a5;
- (id)matchLogger;
- (id)postRuleWriter;
- (id)preRuleWriter;
- (id)processText:(id)a3;
- (void)_recomputeRuleOrdering;
- (void)cancelProcessing;
- (void)loadRuleSet:(id)a3;
- (void)reset;
- (void)setExecuting:(BOOL)a3;
- (void)setMatchLogger:(id)a3;
- (void)setPostRuleWriter:(id)a3;
- (void)setPreRuleWriter:(id)a3;
- (void)setRegexExecutionQueue:(id)a3;
- (void)setRuleReplacements:(id)a3;
- (void)setRuleSets:(id)a3;
- (void)setShouldAbort:(BOOL)a3;
- (void)unloadRuleset:(id)a3;
@end

@implementation TTSRulesetRunner

- (TTSRulesetRunner)init
{
  v20.receiver = self;
  v20.super_class = (Class)TTSRulesetRunner;
  v6 = [(TTSRulesetRunner *)&v20 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v2, v3, v4, v5);
    ruleReplacements = v6->_ruleReplacements;
    v6->_ruleReplacements = (NSMutableArray *)v7;

    uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12);
    ruleSets = v6->_ruleSets;
    v6->_ruleSets = (NSMutableArray *)v13;

    v15 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INTERACTIVE, -1);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v17 = dispatch_queue_create("ttsruleset.execution", v16);
    regexExecutionQueue = v6->_regexExecutionQueue;
    v6->_regexExecutionQueue = (OS_dispatch_queue *)v17;
  }
  return v6;
}

- (void)reset
{
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  ruleReplacements = self->_ruleReplacements;
  self->_ruleReplacements = v6;

  objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11);
  self->_ruleSets = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)loadRuleSet:(id)a3
{
  objc_msgSend_addObject_(self->_ruleSets, a2, (uint64_t)a3, v3, v4);

  MEMORY[0x1F4181798](self, sel__recomputeRuleOrdering, v6, v7, v8);
}

- (void)unloadRuleset:(id)a3
{
  objc_msgSend_removeObject_(self->_ruleSets, a2, (uint64_t)a3, v3, v4);

  MEMORY[0x1F4181798](self, sel__recomputeRuleOrdering, v6, v7, v8);
}

- (void)_recomputeRuleOrdering
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  objc_msgSend_removeAllObjects(self->_ruleReplacements, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_ruleSets(self, v6, v7, v8, v9);
  objc_msgSend_sortUsingComparator_(v10, v11, (uint64_t)&unk_1EFB80380, v12, v13);

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  objc_msgSend_ruleSets(self, v14, v15, v16, v17);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v61, (uint64_t)v66, 16);
  if (v19)
  {
    uint64_t v24 = v19;
    uint64_t v25 = *(void *)v62;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v62 != v25) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v61 + 1) + 8 * v26);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v28 = objc_msgSend_ruleReplacements(v27, v20, v21, v22, v23);
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v57, (uint64_t)v65, 16);
        if (v30)
        {
          uint64_t v35 = v30;
          uint64_t v36 = *(void *)v58;
          do
          {
            uint64_t v37 = 0;
            do
            {
              if (*(void *)v58 != v36) {
                objc_enumerationMutation(v28);
              }
              v38 = *(void **)(*((void *)&v57 + 1) + 8 * v37);
              v39 = objc_msgSend_ruleReplacements(self, v31, v32, v33, v34);
              uint64_t v44 = objc_msgSend_count(v39, v40, v41, v42, v43);
              objc_msgSend_setIndex_(v38, v45, v44, v46, v47);

              v52 = objc_msgSend_ruleReplacements(self, v48, v49, v50, v51);
              objc_msgSend_addObject_(v52, v53, (uint64_t)v38, v54, v55);

              ++v37;
            }
            while (v35 != v37);
            uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v57, (uint64_t)v65, 16);
          }
          while (v35);
        }

        ++v26;
      }
      while (v26 != v24);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v61, (uint64_t)v66, 16);
    }
    while (v24);
  }
}

- (id)processText:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    objc_msgSend_setExecuting_(v5, v6, 1, v7, v8);
    uint64_t v9 = [TTSSpeechString alloc];
    uint64_t v13 = objc_msgSend_initWithOriginalString_(v9, v10, (uint64_t)v4, v11, v12);
    v18 = objc_msgSend_preRuleWriter(v5, v14, v15, v16, v17);

    if (v18)
    {
      objc_msgSend_preRuleWriter(v5, v19, v20, v21, v22);
      uint64_t v23 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v24 = ((void (**)(void, void *))v23)[2](v23, v13);

      if (objc_msgSend_finalized(v24, v25, v26, v27, v28))
      {
        v29 = [TTSSpeechString alloc];
        uint64_t v13 = objc_msgSend_initWithParentSpeechString_(v29, v30, (uint64_t)v24, v31, v32);
      }
      else
      {
        uint64_t v13 = v24;
      }
    }
    uint64_t v34 = objc_msgSend__processSpeechString_startingAt_currentRecursionDepth_(v5, v19, (uint64_t)v13, 0, 0);
    v39 = objc_msgSend_postRuleWriter(v5, v35, v36, v37, v38);

    if (v39)
    {
      if (objc_msgSend_finalized(v34, v40, v41, v42, v43))
      {
        v48 = [TTSSpeechString alloc];
        uint64_t v52 = objc_msgSend_initWithParentSpeechString_(v48, v49, (uint64_t)v34, v50, v51);

        uint64_t v34 = (void *)v52;
      }
      objc_msgSend_postRuleWriter(v5, v44, v45, v46, v47);
      v53 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v54 = ((void (**)(void, void *))v53)[2](v53, v34);

      uint64_t v34 = (void *)v54;
    }
    if (objc_msgSend_finalized(v34, v40, v41, v42, v43))
    {
      long long v59 = [TTSSpeechString alloc];
      uint64_t v63 = objc_msgSend_initWithParentSpeechString_(v59, v60, (uint64_t)v34, v61, v62);

      uint64_t v34 = (void *)v63;
    }
    long long v64 = objc_msgSend_sharedInstance(TTSRegexCache, v55, v56, v57, v58);
    uint64_t v67 = objc_msgSend_regexForString_atStart_(v64, v65, @"__AXTTS_SHIELDS_(UP|DOWN)__", 0, v66);

    v72 = objc_msgSend_originalString(v34, v68, v69, v70, v71);
    v77 = objc_msgSend_originalString(v34, v73, v74, v75, v76);
    uint64_t v82 = objc_msgSend_length(v77, v78, v79, v80, v81);
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = sub_1A6705F10;
    v88[3] = &unk_1E5C69C70;
    id v33 = v34;
    id v89 = v33;
    objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v67, v83, (uint64_t)v72, 2, 0, v82, v88);

    objc_msgSend_setExecuting_(v5, v84, 0, v85, v86);
    objc_sync_exit(v5);
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

- (void)cancelProcessing
{
  if (objc_msgSend_executing(self, a2, v2, v3, v4))
  {
    objc_msgSend_setShouldAbort_(self, v6, 1, v7, v8);
    id obj = self;
    objc_sync_enter(obj);
    objc_msgSend_setShouldAbort_(obj, v9, 0, v10, v11);
    objc_sync_exit(obj);
  }
}

- (NSNumber)ruleCount
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = objc_msgSend_ruleReplacements(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_count(v6, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(v5, v12, v11, v13, v14);

  return (NSNumber *)v15;
}

- (id)_ignoreRangesForString:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_rangeOfString_(v3, v4, @"__AXTTS_SHIELDS_UP__", v5, v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_27;
  }
  uint64_t v13 = v7;
  unint64_t v14 = (unint64_t)&v8[v7];
  uint64_t v47 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11);
  uint64_t v23 = 1;
  if (v14 < objc_msgSend_length(v3, v15, v16, v17, v18))
  {
    do
    {
      uint64_t v24 = objc_msgSend_length(v3, v19, v20, v21, v22);
      unint64_t v25 = v24 - v14;
      unint64_t v27 = objc_msgSend_rangeOfString_options_range_(v3, v26, @"__AXTTS_SHIELDS_UP__", 2, v14, v24 - v14);
      v29 = v28;
      unint64_t v30 = objc_msgSend_rangeOfString_options_range_(v3, v28, @"__AXTTS_SHIELDS_DOWN__", 2, v14, v25);
      BOOL v32 = v27 == 0x7FFFFFFFFFFFFFFFLL || v27 > v30;
      if (v30 == 0x7FFFFFFFFFFFFFFFLL || !v32)
      {
        if (v23) {
          uint64_t v33 = v13;
        }
        else {
          uint64_t v33 = v27;
        }
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          ++v23;
          unint64_t v14 = (unint64_t)&v29[v27];
          uint64_t v13 = v33;
        }
      }
      else
      {
        if (!--v23)
        {
          unint64_t v14 = (unint64_t)&v19[v30];
          uint64_t v34 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v19, v13, (uint64_t)&v19[v30 - v13], v22);
          objc_msgSend_addObject_(v47, v35, (uint64_t)v34, v36, v37);

          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          continue;
        }
        unint64_t v14 = (unint64_t)&v19[v30];
      }
      if (v27 == 0x7FFFFFFFFFFFFFFFLL && v30 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
    while (v14 < objc_msgSend_length(v3, v19, v20, v21, v22));
  }
  if (v23)
  {
    uint64_t v38 = (void *)MEMORY[0x1E4F29238];
    uint64_t v39 = objc_msgSend_length(v3, v19, v20, v21, v22);
    uint64_t v42 = objc_msgSend_valueWithRange_(v38, v40, v13, v39 - v13, v41);
    uint64_t v12 = v47;
    objc_msgSend_addObject_(v47, v43, (uint64_t)v42, v44, v45);
  }
  else
  {
    uint64_t v12 = v47;
  }
LABEL_27:

  return v12;
}

- (id)_computeActiveRanges:(id)a3 withIgnoreRanges:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v10 = objc_msgSend_mutableCopy(a3, v6, v7, v8, v9);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v5;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v47)
  {
    uint64_t v46 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v17 = objc_msgSend_rangeValue(*(void **)(*((void *)&v48 + 1) + 8 * i), length, v13, v14, v15);
        NSUInteger v19 = (NSUInteger)v18;
        if (objc_msgSend_count(v10, v18, v20, v21, v22))
        {
          unint64_t v23 = 0;
          unint64_t v24 = v19 + v17;
          while (1)
          {
            unint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v10, length, v23, v14, v15);
            unint64_t v30 = objc_msgSend_rangeValue(v25, v26, v27, v28, v29);
            NSUInteger v32 = v31;

            v55.location = v30;
            v55.length = v32;
            v56.location = v17;
            v56.length = v19;
            NSRange v33 = NSIntersectionRange(v55, v56);
            length = (const char *)v33.length;
            if (v30 >= v24) {
              goto LABEL_23;
            }
            if (!v33.length) {
              goto LABEL_21;
            }
            uint64_t v34 = v17 - v30;
            if (v17 > v30) {
              break;
            }
            if (v33.location != v30 || v32 != v33.length)
            {
              objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], (const char *)v33.length, v19 + v17, v30 + v32 - v24, v15);
              uint64_t v41 = LABEL_20:;
              objc_msgSend_setObject_atIndexedSubscript_(v10, v42, (uint64_t)v41, v23, v43);

LABEL_21:
              ++v23;
              goto LABEL_22;
            }
            objc_msgSend_removeObjectAtIndex_(v10, (const char *)v33.length, v23, v34, v15);
LABEL_22:
            if (v23 >= objc_msgSend_count(v10, length, v13, v14, v15)) {
              goto LABEL_23;
            }
          }
          if (v33.location == v17 && v33.length == v19)
          {
            uint64_t v35 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], (const char *)v33.length, v30, v34, v15);
            objc_msgSend_setObject_atIndexedSubscript_(v10, v36, (uint64_t)v35, v23, v37);

            uint64_t v14 = v32 + v30 - v24;
            if (v32 + v30 != v24)
            {
              uint64_t v38 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], length, v19 + v17, v14, v15);
              objc_msgSend_insertObject_atIndex_(v10, v39, (uint64_t)v38, ++v23, v40);
            }
            goto LABEL_22;
          }
          objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], (const char *)v33.length, v30, v32 - v33.length, v15);
          goto LABEL_20;
        }
LABEL_23:
        ;
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, length, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v47);
  }

  return v10;
}

- (id)_processSpeechString:(id)a3 startingAt:(unint64_t)a4 currentRecursionDepth:(unint64_t)a5
{
  uint64_t v243 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v221 = self;
  uint64_t v13 = objc_msgSend_ruleCount(self, v9, v10, v11, v12);
  unint64_t v18 = objc_msgSend_unsignedLongValue(v13, v14, v15, v16, v17);

  if (v18 > a4)
  {
    unint64_t v210 = a5;
    v211 = v8;
    unint64_t v23 = objc_msgSend_transformedString(v8, v19, v20, v21, v22);
    uint64_t v27 = objc_msgSend__ignoreRangesForString_(v221, v24, (uint64_t)v23, v25, v26);
    id v28 = v23;
    uint64_t v219 = objc_msgSend_cStringUsingEncoding_(v28, v29, 4, v30, v31);
    v206 = v28;
    uint64_t v220 = objc_msgSend_lengthOfBytesUsingEncoding_(v28, v32, 4, v33, v34);
    v205 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v35, v36, v37, v38);
    uint64_t v43 = objc_msgSend_ruleCount(v221, v39, v40, v41, v42);
    unint64_t v208 = a4;
    unint64_t iterations = objc_msgSend_unsignedLongValue(v43, v44, v45, v46, v47) - a4;

    uint64_t v52 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v48, v49, v50, v51);
    long long v236 = 0u;
    long long v237 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    objc_msgSend_ruleSets(v221, v53, v54, v55, v56);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v236, (uint64_t)v242, 16);
    if (v217)
    {
      uint64_t v61 = *(void *)v237;
      unint64_t v62 = 0x1E4F29000uLL;
      uint64_t v212 = *(void *)v237;
      do
      {
        for (uint64_t i = 0; i != v217; ++i)
        {
          if (*(void *)v237 != v61) {
            objc_enumerationMutation(obj);
          }
          long long v64 = *(void **)(*((void *)&v236 + 1) + 8 * i);
          v65 = objc_msgSend_valueWithPointer_(*(void **)(v62 + 568), v58, (uint64_t)v64, v59, v60);
          uint64_t v70 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v66, v67, v68, v69);
          uint64_t v75 = objc_msgSend_activationRegex(v64, v71, v72, v73, v74);

          if (v75)
          {
            uint64_t v80 = objc_msgSend_activationRegex(v64, v76, v77, v78, v79);
            v234[0] = MEMORY[0x1E4F143A8];
            v234[1] = 3221225472;
            v234[2] = sub_1A6706D08;
            v234[3] = &unk_1E5C69BA0;
            id v81 = v70;
            id v235 = v81;
            objc_msgSend_enumerateMatchesInCString_length_usingBlock_(v80, v82, v219, v220, (uint64_t)v234);

            v83 = v235;
            uint64_t v84 = (uint64_t)v27;
          }
          else
          {
            v83 = objc_msgSend_valueWithRange_(*(void **)(v62 + 568), v76, 0, v220, v79);
            v241 = v83;
            v87 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v85, (uint64_t)&v241, 1, v86);
            id v81 = (id)objc_msgSend_mutableCopy(v87, v88, v89, v90, v91);

            uint64_t v84 = (uint64_t)v27;
            uint64_t v61 = v212;
          }

          uint64_t v27 = (void *)v84;
          v94 = objc_msgSend__computeActiveRanges_withIgnoreRanges_(v221, v92, (uint64_t)v81, v84, v93);
          objc_msgSend_setObject_forKeyedSubscript_(v52, v95, (uint64_t)v94, (uint64_t)v65, v96);

          unint64_t v62 = 0x1E4F29000;
        }
        uint64_t v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v236, (uint64_t)v242, 16);
      }
      while (v217);
    }

    v101 = objc_msgSend_regexExecutionQueue(v221, v97, v98, v99, v100);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A6706D78;
    block[3] = &unk_1E5C69CC0;
    block[4] = v221;
    unint64_t v231 = v208;
    id v102 = v52;
    id v228 = v102;
    uint64_t v232 = v220;
    uint64_t v233 = v219;
    id v218 = v206;
    id v229 = v218;
    id v103 = v205;
    id v230 = v103;
    dispatch_apply(iterations, v101, block);

    if (!objc_msgSend_count(v103, v104, v105, v106, v107))
    {
      AXTTSLogCommon();
      v125 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v125, OS_LOG_TYPE_DEBUG)) {
        sub_1A688E020(v210, v125, v126, v127, v128);
      }

      id v8 = v211;
      id v124 = v211;
      goto LABEL_42;
    }
    objc_msgSend_sortUsingComparator_(v103, v108, (uint64_t)&unk_1EFB7E458, v109, v110);
    uint64_t v114 = objc_msgSend_indexOfObjectPassingTest_(v103, v111, (uint64_t)&unk_1EFB7E478, v112, v113);
    v203 = v27;
    id v207 = v103;
    id v209 = v102;
    if (v114 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v118 = (uint64_t)v211;
      if (v210 <= 0x31)
      {
        id v142 = v103;
        uint64_t v213 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_26;
      }
      uint64_t v119 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v129 = v114;
      v130 = objc_msgSend_objectAtIndexedSubscript_(v103, v115, v114, v116, v117);
      v135 = objc_msgSend_ruleReplacement(v130, v131, v132, v133, v134);
      uint64_t v119 = objc_msgSend_effectiveIndex(v135, v136, v137, v138, v139);

      uint64_t v118 = (uint64_t)v211;
      if (v210 < 0x32)
      {
        v143 = objc_msgSend_subarrayWithRange_(v103, v140, 0, v129, v141);
        v226[0] = MEMORY[0x1E4F143A8];
        v226[1] = 3221225472;
        v226[2] = sub_1A6707174;
        v226[3] = &unk_1E5C69D20;
        uint64_t v213 = v119;
        v226[4] = v119;
        v147 = objc_msgSend_ax_filteredArrayUsingBlock_(v103, v144, (uint64_t)v226, v145, v146);
        objc_msgSend_arrayByAddingObjectsFromArray_(v143, v148, (uint64_t)v147, v149, v150);
        id v142 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
    }
    uint64_t v213 = v119;
    id v142 = v103;
LABEL_26:
    v151 = [TTSSpeechString alloc];
    v155 = objc_msgSend_initWithParentSpeechString_(v151, v152, v118, v153, v154);
    long long v222 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    id obja = v142;
    uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v156, (uint64_t)&v222, (uint64_t)v240, 16);
    if (v157)
    {
      uint64_t v159 = v157;
      uint64_t v216 = *(void *)v223;
      do
      {
        for (uint64_t j = 0; j != v159; ++j)
        {
          if (*(void *)v223 != v216) {
            objc_enumerationMutation(obja);
          }
          v161 = *(void **)(*((void *)&v222 + 1) + 8 * j);
          v162 = objc_msgSend__processTemplateReplacementTextForText_replacement_cString_(v221, v158, (uint64_t)v218, (uint64_t)v161, v219, v203);
          v167 = objc_msgSend_match(v161, v163, v164, v165, v166);
          uint64_t v172 = objc_msgSend_utf8Range(v167, v168, v169, v170, v171);
          uint64_t v174 = objc_msgSend_utf16RangeFromUTF8Range_chars_size_(TTSUnicodeUtils, v173, v172, (uint64_t)v173, v219, v220);
          uint64_t v176 = v175;

          v181 = objc_msgSend_matchLogger(v221, v177, v178, v179, v180);

          if (v181)
          {
            objc_msgSend_matchLogger(v221, v182, v183, v184, v185);
            v186 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
            v191 = objc_msgSend_originalString(v155, v187, v188, v189, v190);
            v196 = objc_msgSend_ruleReplacement(v161, v192, v193, v194, v195);
            ((void (**)(void, void *, uint64_t, uint64_t, void *, void *))v186)[2](v186, v191, v174, v176, v162, v196);
          }
          objc_msgSend_transformRange_to_(v155, v182, v174, v176, (uint64_t)v162);
        }
        uint64_t v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v158, (uint64_t)&v222, (uint64_t)v240, 16);
      }
      while (v159);
    }

    if (v210 > 0x31 || v213 == 0x7FFFFFFFFFFFFFFFLL)
    {
      AXTTSLogCommon();
      v198 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v203;
      id v103 = v207;
      id v102 = v209;
      if (os_log_type_enabled((os_log_t)v198, OS_LOG_TYPE_DEBUG)) {
        sub_1A688E020(v210, v198, v199, v200, v201);
      }

      id v124 = v155;
      id v8 = v211;
    }
    else
    {
      objc_msgSend__processSpeechString_startingAt_currentRecursionDepth_(v221, v197, (uint64_t)v155, v213 + 1, v210 + 1);
      id v124 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v211;
      uint64_t v27 = v203;
      id v103 = v207;
      id v102 = v209;
    }

LABEL_42:
    goto LABEL_43;
  }
  AXTTSLogCommon();
  v120 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v120, OS_LOG_TYPE_DEBUG)) {
    sub_1A688E020(a5, v120, v121, v122, v123);
  }

  id v124 = v8;
LABEL_43:

  return v124;
}

- (id)_processTemplateReplacementTextForText:(id)a3 replacement:(id)a4 cString:(const char *)a5
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v111 = a4;
  uint64_t v9 = objc_msgSend_replacement(v111, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_copy(v9, v10, v11, v12, v13);

  NSUInteger v19 = objc_msgSend_sharedInstance(TTSRegexCache, v15, v16, v17, v18);
  uint64_t v22 = objc_msgSend_regexForString_atStart_(v19, v20, @"\\$(?<num>\\d+)(?=\\D|$)|(\\$\\{(?<numbrack>\\d+)\\})", 0, v21);

  uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_length(v14, v28, v29, v30, v31);
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = sub_1A6707538;
  v119[3] = &unk_1E5C69D48;
  id v33 = v14;
  id v120 = v33;
  id v34 = v27;
  id v121 = v34;
  uint64_t v109 = v22;
  objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v22, v35, (uint64_t)v33, 2, 0, v32, v119);
  uint64_t v114 = v34;
  uint64_t v40 = objc_msgSend_allKeys(v34, v36, v37, v38, v39);
  uint64_t v44 = objc_msgSend_sortedArrayUsingComparator_(v40, v41, (uint64_t)&unk_1EFB7E4D8, v42, v43);

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id obj = v44;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v115, (uint64_t)v122, 16);
  if (v46)
  {
    uint64_t v50 = v46;
    uint64_t v113 = *(void *)v116;
    uint64_t v51 = v111;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        uint64_t v53 = v33;
        if (*(void *)v116 != v113) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v114, v47, (uint64_t)v54, v48, v49);
        unint64_t v60 = objc_msgSend_unsignedLongValue(v55, v56, v57, v58, v59) - 1;

        uint64_t v65 = objc_msgSend_rangeValue(v54, v61, v62, v63, v64);
        uint64_t v67 = (uint64_t)v66;
        uint64_t v71 = objc_msgSend_match(v51, v66, v68, v69, v70);
        uint64_t v76 = objc_msgSend_captureGroups(v71, v72, v73, v74, v75);
        unint64_t v81 = objc_msgSend_count(v76, v77, v78, v79, v80);

        uint64_t v86 = &stru_1EFB83720;
        if (v60 < v81)
        {
          v87 = objc_msgSend_match(v51, v82, v83, v84, v85);
          v92 = objc_msgSend_captureGroups(v87, v88, v89, v90, v91);
          uint64_t v96 = objc_msgSend_objectAtIndex_(v92, v93, v60, v94, v95);
          uint64_t v101 = objc_msgSend_utf8Range(v96, v97, v98, v99, v100);
          uint64_t v103 = v102;

          uint64_t v51 = v111;
          if (v103) {
            BOOL v104 = v101 == 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            BOOL v104 = 1;
          }
          uint64_t v86 = &stru_1EFB83720;
          if (!v104)
          {
            id v105 = [NSString alloc];
            uint64_t v86 = (__CFString *)objc_msgSend_initWithBytes_length_encoding_(v105, v106, (uint64_t)&a5[v101], v103, 4);
          }
        }
        objc_msgSend_stringByReplacingCharactersInRange_withString_(v53, v82, v65, v67, (uint64_t)v86);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v115, (uint64_t)v122, 16);
    }
    while (v50);
  }
  else
  {
    uint64_t v51 = v111;
  }

  id v107 = v33;
  return v107;
}

- (id)preRuleWriter
{
  return self->_preRuleWriter;
}

- (void)setPreRuleWriter:(id)a3
{
}

- (id)postRuleWriter
{
  return self->_postRuleWriter;
}

- (void)setPostRuleWriter:(id)a3
{
}

- (id)matchLogger
{
  return self->_matchLogger;
}

- (void)setMatchLogger:(id)a3
{
}

- (OS_dispatch_queue)regexExecutionQueue
{
  return self->_regexExecutionQueue;
}

- (void)setRegexExecutionQueue:(id)a3
{
}

- (NSMutableArray)ruleReplacements
{
  return self->_ruleReplacements;
}

- (void)setRuleReplacements:(id)a3
{
}

- (NSMutableArray)ruleSets
{
  return self->_ruleSets;
}

- (void)setRuleSets:(id)a3
{
}

- (BOOL)executing
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (BOOL)shouldAbort
{
  return self->_shouldAbort;
}

- (void)setShouldAbort:(BOOL)a3
{
  self->_shouldAbort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleSets, 0);
  objc_storeStrong((id *)&self->_ruleReplacements, 0);
  objc_storeStrong((id *)&self->_regexExecutionQueue, 0);
  objc_storeStrong(&self->_matchLogger, 0);
  objc_storeStrong(&self->_postRuleWriter, 0);

  objc_storeStrong(&self->_preRuleWriter, 0);
}

@end
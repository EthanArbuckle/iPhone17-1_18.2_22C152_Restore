@interface TTSRuleset
+ (TTSRuleset)rulesetWithData:(id)a3 identifier:(id)a4 priority:(unint64_t)a5;
+ (id)processReplacementStringForSpecialCharacters:(id)a3;
- (NSMutableArray)ruleReplacements;
- (NSNumber)ruleCount;
- (NSString)identifier;
- (TTSRegex)activationRegex;
- (TTSRuleset)init;
- (unint64_t)priority;
- (void)addRuleReplacement:(id)a3;
- (void)addRuleString:(id)a3;
- (void)addRules:(id)a3;
- (void)addRulesFromData:(id)a3;
- (void)setActivationRegex:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRuleReplacements:(id)a3;
@end

@implementation TTSRuleset

- (TTSRuleset)init
{
  v10.receiver = self;
  v10.super_class = (Class)TTSRuleset;
  v6 = [(TTSRuleset *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v2, v3, v4, v5);
    ruleReplacements = v6->_ruleReplacements;
    v6->_ruleReplacements = (NSMutableArray *)v7;
  }
  return v6;
}

+ (TTSRuleset)rulesetWithData:(id)a3 identifier:(id)a4 priority:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [TTSRuleset alloc];
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  objc_msgSend_addRulesFromData_(v14, v15, (uint64_t)v8, v16, v17);

  objc_msgSend_setPriority_(v14, v18, a5, v19, v20);
  objc_msgSend_setIdentifier_(v14, v21, (uint64_t)v7, v22, v23);

  return (TTSRuleset *)v14;
}

- (NSNumber)ruleCount
{
  uint64_t v5 = NSNumber;
  v6 = objc_msgSend_ruleReplacements(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_count(v6, v7, v8, v9, v10);
  v15 = objc_msgSend_numberWithUnsignedInteger_(v5, v12, v11, v13, v14);

  return (NSNumber *)v15;
}

- (void)addRuleString:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)&v12, 1, v7);

  objc_msgSend_addRules_(self, v9, (uint64_t)v8, v10, v11, v12, v13);
}

- (void)addRuleReplacement:(id)a3
{
  id v121 = a3;
  uint64_t v8 = objc_msgSend_ruleReplacements(self, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_lastObject(v8, v9, v10, v11, v12);
  v18 = objc_msgSend_group(v13, v14, v15, v16, v17);

  uint64_t v23 = objc_msgSend_replacement(v121, v19, v20, v21, v22);
  int v27 = objc_msgSend_containsString_(v23, v24, @"_HOMOGRAPH_START", v25, v26);

  v32 = objc_msgSend_replacement(v121, v28, v29, v30, v31);
  char v36 = objc_msgSend_containsString_(v32, v33, @"_ENG_CORE", v34, v35);

  if ((v36 & 1) != 0 || v27)
  {
    v40 = @"ENGCORE";
    if (v27) {
      v40 = @"HOMOGRAPH";
    }
    v45 = v40;
    if (v18
      && (objc_msgSend_key(v18, v41, v42, v43, v44),
          v46 = objc_claimAutoreleasedReturnValue(),
          int isEqualToString = objc_msgSend_isEqualToString_(v46, v47, (uint64_t)v45, v48, v49),
          v46,
          isEqualToString))
    {
      v55 = objc_msgSend_ruleReplacements(self, v51, v52, v53, v54);
      uint64_t v60 = objc_msgSend_count(v55, v56, v57, v58, v59);
      objc_msgSend_setEndIndex_(v18, v61, v60, v62, v63);

      objc_msgSend_setGroup_(v121, v64, (uint64_t)v18, v65, v66);
    }
    else
    {
      v67 = objc_alloc_init(TTSRuleGroup);
      objc_msgSend_setKey_(v67, v68, (uint64_t)v45, v69, v70);
      v75 = objc_msgSend_ruleReplacements(self, v71, v72, v73, v74);
      uint64_t v80 = objc_msgSend_count(v75, v76, v77, v78, v79);
      objc_msgSend_setStartIndex_(v67, v81, v80, v82, v83);

      v88 = objc_msgSend_ruleReplacements(self, v84, v85, v86, v87);
      uint64_t v93 = objc_msgSend_count(v88, v89, v90, v91, v92);
      objc_msgSend_setEndIndex_(v67, v94, v93, v95, v96);

      objc_msgSend_setGroup_(v121, v97, (uint64_t)v67, v98, v99);
    }
  }
  objc_msgSend_setRuleset_(v121, v37, (uint64_t)self, v38, v39);
  v104 = objc_msgSend_ruleReplacements(self, v100, v101, v102, v103);
  uint64_t v109 = objc_msgSend_count(v104, v105, v106, v107, v108);
  objc_msgSend_setIndex_(v121, v110, v109, v111, v112);

  v117 = objc_msgSend_ruleReplacements(self, v113, v114, v115, v116);
  objc_msgSend_addObject_(v117, v118, (uint64_t)v121, v119, v120);
}

- (void)addRules:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v103 = self;
  objc_sync_enter(v103);
  uint64_t v107 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v5, v6, v7, v8);
  uint64_t v102 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v9, @"\"(.*?)\"", 1, 0);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id obj = v4;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v108, (uint64_t)v114, 16);
  if (v14)
  {
    uint64_t v106 = *(void *)v109;
    *(void *)&long long v15 = 138412290;
    long long v101 = v15;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v109 != v106) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        v18 = objc_msgSend_stringByTrimmingCharactersInSet_(v17, v11, (uint64_t)v107, v12, v13, v101);
        if ((objc_msgSend_hasPrefix_(v18, v19, @"#", v20, v21) & 1) == 0
          && objc_msgSend_length(v18, v22, v23, v24, v25))
        {
          uint64_t v29 = objc_msgSend_componentsSeparatedByString_(v18, v26, @"-->", v27, v28);
          if (objc_msgSend_containsString_(v18, v30, @"-->", v31, v32)
            && objc_msgSend_count(v29, v33, v34, v35, v36) == 2)
          {
            v40 = objc_msgSend_objectAtIndexedSubscript_(v29, v37, 0, v38, v39);
            uint64_t v44 = objc_msgSend_stringByTrimmingCharactersInSet_(v40, v41, (uint64_t)v107, v42, v43);

            uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(v29, v45, 1, v46, v47);
            uint64_t v52 = objc_msgSend_stringByTrimmingCharactersInSet_(v48, v49, (uint64_t)v107, v50, v51);

            uint64_t v57 = objc_msgSend_length(v52, v53, v54, v55, v56);
            v104 = objc_msgSend_matchesInString_options_range_(v102, v58, (uint64_t)v52, 2, 0, v57);
            if (objc_msgSend_count(v104, v59, v60, v61, v62))
            {
              v67 = objc_msgSend_firstObject(v104, v63, v64, v65, v66);
              uint64_t v71 = objc_msgSend_rangeAtIndex_(v67, v68, 1, v69, v70);
              objc_msgSend_substringWithRange_(v52, v72, v71, (uint64_t)v72, v73);
            }
            else
            {
              v67 = objc_msgSend_componentsSeparatedByString_(v52, v63, @"#", v65, v66);
              objc_msgSend_firstObject(v67, v74, v75, v76, v77);
            uint64_t v78 = };

            uint64_t v79 = [TTSRegex alloc];
            uint64_t v83 = objc_msgSend_initWithPerlPattern_(v79, v80, (uint64_t)v44, v81, v82);
            if (v83)
            {
              v84 = objc_alloc_init(TTSRuleReplacement);
              objc_msgSend_setRegex_(v84, v85, (uint64_t)v83, v86, v87);
              objc_msgSend_setRuleset_(v84, v88, (uint64_t)v103, v89, v90);
              v94 = objc_msgSend_processReplacementStringForSpecialCharacters_(TTSRuleset, v91, (uint64_t)v78, v92, v93);
              objc_msgSend_setReplacement_(v84, v95, (uint64_t)v94, v96, v97);

              objc_msgSend_addRuleReplacement_(v103, v98, (uint64_t)v84, v99, v100);
            }
            else
            {
              AXTTSLogCommon();
              v84 = (TTSRuleReplacement *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v84->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v101;
                v113 = v17;
                _os_log_error_impl(&dword_1A66D3000, &v84->super, OS_LOG_TYPE_ERROR, "Invalid rule %@", buf, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v44 = AXTTSLogCommon();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v101;
              v113 = v18;
              _os_log_error_impl(&dword_1A66D3000, v44, OS_LOG_TYPE_ERROR, "Invalid rule: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v108, (uint64_t)v114, 16);
    }
    while (v14);
  }

  objc_sync_exit(v103);
}

- (void)addRulesFromData:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v9 = objc_msgSend_initWithData_encoding_(v6, v7, (uint64_t)v5, 4, v8);

  uint64_t v13 = objc_msgSend_componentsSeparatedByString_(v9, v10, @"[data]", v11, v12);
  objc_msgSend_lastObject(v13, v14, v15, v16, v17);
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = objc_msgSend_componentsSeparatedByString_(v25, v18, @"\n", v19, v20);
  objc_msgSend_addRules_(self, v22, (uint64_t)v21, v23, v24);
}

+ (id)processReplacementStringForSpecialCharacters:(id)a3
{
  id v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, @"\\\\", @"\\", v3);
  uint64_t v7 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, @"\\e\\", @"\x1B\\", v6);

  uint64_t v10 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, @"\\e/+", @"\x1B/+", v9);

  uint64_t v13 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, @"\x1B\x1Bos", @"\x1B\\eos", v12);

  return v13;
}

- (TTSRegex)activationRegex
{
  return self->_activationRegex;
}

- (void)setActivationRegex:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableArray)ruleReplacements
{
  return self->_ruleReplacements;
}

- (void)setRuleReplacements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleReplacements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_activationRegex, 0);
}

@end
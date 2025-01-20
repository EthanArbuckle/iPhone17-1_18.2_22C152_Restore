@interface TTSAUMessagingAU
- (TTSFirstPartyAudioUnit)owningAudioUnit;
- (id)callAudioUnit:(id)a3;
- (id)echo:(id)a3;
- (id)hostBlock;
- (void)setCallHostBlock:(id)a3;
- (void)setHostBlock:(id)a3;
- (void)setOwningAudioUnit:(id)a3;
@end

@implementation TTSAUMessagingAU

- (void)setCallHostBlock:(id)a3
{
}

- (id)echo:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)callAudioUnit:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, @"TTSMessageChannelMessageSelectorKey", v6, v7);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (objc_msgSend__validSelectorsForProtocol(TTSAUMessagingHost, v8, v9, v10, v11),
        v13 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v12, v15, v16),
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v13,
        v17))
  {
    v21 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"TTSMessageChannelMessageArgumentsKey", v19, v20);
    SEL v22 = NSSelectorFromString(v12);
    v27 = objc_msgSend_owningAudioUnit(self, v23, v24, v25, v26);
    v31 = objc_msgSend_methodSignatureForSelector_(v27, v28, (uint64_t)v22, v29, v30);

    v35 = objc_msgSend_invocationWithMethodSignature_(MEMORY[0x1E4F1CA18], v32, (uint64_t)v31, v33, v34);
    objc_msgSend_setSelector_(v35, v36, (uint64_t)v22, v37, v38);
    v43 = objc_msgSend_owningAudioUnit(self, v39, v40, v41, v42);
    objc_msgSend_setTarget_(v35, v44, (uint64_t)v43, v45, v46);

    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v47 = v21;
    uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v80, (uint64_t)v85, 16);
    if (v49)
    {
      uint64_t v52 = v49;
      uint64_t v53 = *(void *)v81;
      uint64_t v54 = 2;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v81 != v53) {
            objc_enumerationMutation(v47);
          }
          uint64_t v84 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          objc_msgSend_setArgument_atIndex_(v35, v50, (uint64_t)&v84, v54 + i, v51, (void)v80);
        }
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v80, (uint64_t)v85, 16);
        v54 += i;
      }
      while (v52);
    }

    objc_msgSend_retainArguments(v35, v56, v57, v58, v59);
    objc_msgSend_invoke(v35, v60, v61, v62, v63);
    v68 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v64, v65, v66, v67);
    uint64_t v84 = 0;
    id v69 = v31;
    if (*(unsigned char *)objc_msgSend_methodReturnType(v69, v70, v71, v72, v73) != 118)
    {
      objc_msgSend_getReturnValue_(v35, v74, (uint64_t)&v84, v75, v76);
      if (v84) {
        objc_msgSend_setObject_forKeyedSubscript_(v68, v77, v84, @"TTSMessageChannelMessageReturnValueKey", v78);
      }
    }
  }
  else
  {
    v68 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v68;
}

- (id)hostBlock
{
  return self->_hostBlock;
}

- (void)setHostBlock:(id)a3
{
}

- (TTSFirstPartyAudioUnit)owningAudioUnit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningAudioUnit);

  return (TTSFirstPartyAudioUnit *)WeakRetained;
}

- (void)setOwningAudioUnit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningAudioUnit);

  objc_storeStrong(&self->_hostBlock, 0);
}

@end
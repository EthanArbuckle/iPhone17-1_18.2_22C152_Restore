@interface TTSAUMessagingHost
+ (id)_validSelectorsForProtocol;
- (AUMessageChannel)channel;
- (NSDictionary)methods;
- (NSSet)allowedClasses;
- (TTSAUMessagingHost)initWithMessageChannel:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_loadProtocolMethods;
- (void)forwardInvocation:(id)a3;
- (void)setAllowedClasses:(id)a3;
- (void)setChannel:(id)a3;
- (void)setMethods:(id)a3;
@end

@implementation TTSAUMessagingHost

- (TTSAUMessagingHost)initWithMessageChannel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSAUMessagingHost;
  v6 = [(TTSAUMessagingHost *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_channel, a3);
    objc_msgSend__loadProtocolMethods(v7, v8, v9, v10, v11);
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6, v7, v8);
  objc_super v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12);
  v18 = objc_msgSend_methodSignature(v4, v14, v15, v16, v17);
  unint64_t v23 = objc_msgSend_numberOfArguments(v18, v19, v20, v21, v22);

  if (v23 >= 3)
  {
    v28 = objc_msgSend_methodSignature(v4, v24, v25, v26, v27);
    unint64_t v33 = objc_msgSend_numberOfArguments(v28, v29, v30, v31, v32);

    if (v33 >= 3)
    {
      unint64_t v34 = 2;
      do
      {
        objc_msgSend_methodSignature(v4, v24, v25, v26, v27);
        id v35 = objc_claimAutoreleasedReturnValue();
        ArgumentTypeAtIndex = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v35, v36, v34, v37, v38);

        if (!strcmp(ArgumentTypeAtIndex, "@"))
        {
          id v79 = 0;
          objc_msgSend_getArgument_atIndex_(v4, v40, (uint64_t)&v79, v34, v43);
          objc_msgSend_addObject_(v13, v44, (uint64_t)v79, v45, v46);
        }
        ++v34;
        v47 = objc_msgSend_methodSignature(v4, v40, v41, v42, v43);
        unint64_t v52 = objc_msgSend_numberOfArguments(v47, v48, v49, v50, v51);
      }
      while (v34 < v52);
    }
  }
  v53 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v24, v25, v26, v27);
  v58 = (const char *)objc_msgSend_selector(v4, v54, v55, v56, v57);
  v59 = NSStringFromSelector(v58);
  objc_msgSend_setObject_forKeyedSubscript_(v53, v60, (uint64_t)v59, @"TTSMessageChannelMessageSelectorKey", v61);

  objc_msgSend_setObject_forKeyedSubscript_(v53, v62, (uint64_t)v13, @"TTSMessageChannelMessageArgumentsKey", v63);
  v68 = objc_msgSend_channel(self, v64, v65, v66, v67);
  v72 = objc_msgSend_callAudioUnit_(v68, v69, (uint64_t)v53, v70, v71);

  objc_msgSend_objectForKeyedSubscript_(v72, v73, @"TTSMessageChannelMessageReturnValueKey", v74, v75);
  id v79 = (id)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    objc_msgSend_setReturnValue_(v4, v76, (uint64_t)&v79, v77, v78);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = NSStringFromSelector(a3);
  uint64_t v9 = objc_msgSend_methods(self, v5, v6, v7, v8);
  objc_super v13 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (void)_loadProtocolMethods
{
  v3 = objc_opt_class();
  objc_msgSend__validSelectorsForProtocol(v3, v4, v5, v6, v7);
  self->_methods = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

+ (id)_validSelectorsForProtocol
{
  unsigned int outCount = 0;
  v2 = &unk_1EFB9B3B0;
  v3 = protocol_copyMethodDescriptionList((Protocol *)v2, 1, 1, &outCount);
  uint64_t v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6, v7);
  if (outCount)
  {
    unint64_t v12 = 0;
    p_types = (uint64_t *)&v3->types;
    do
    {
      v14 = (const char *)*(p_types - 1);
      uint64_t v15 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], v8, *p_types, v9, v10);
      uint64_t v16 = NSStringFromSelector(v14);
      objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v15, (uint64_t)v16, v18);

      ++v12;
      p_types += 2;
    }
    while (v12 < outCount);
  }
  free(v3);

  return v11;
}

- (AUMessageChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSDictionary)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void)setAllowedClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_methods, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

@end
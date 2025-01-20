id rbs_monitor_log()
{
  void *v0;
  uint64_t vars8;

  if (rbs_monitor_log_onceToken != -1) {
    dispatch_once(&rbs_monitor_log_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)rbs_monitor_log___logger;
  return v0;
}

BOOL RBSTaskStateIsRunning(int a1)
{
  return a1 == 4 || (a1 & 0xFE) == 2;
}

void _RBSXPCEncodeObjectForKey(void *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v46 = a1;
  id v5 = a2;
  id v47 = a3;
  context = (void *)MEMORY[0x192FEC250]();
  aClass = (objc_class *)objc_opt_class();
  if ([v5 RBSIsXPCObject])
  {
    v6 = (void *)v46[3];
    if (v47)
    {
      if (!v6) {
        v6 = (void *)v46[1];
      }
      id v7 = v6;
      xpc_dictionary_set_value(v7, (const char *)[v47 UTF8String], v5);
    }
    else
    {
      if (!v6) {
        v6 = (void *)v46[1];
      }
      id v16 = v6;
      xpc_array_append_value(v16, v5);
    }
    goto LABEL_42;
  }
  if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
  {
    v8 = v46;
    id v9 = v47;
    id v10 = v5;
    id v11 = v8[3];
    if (!v11) {
      id v11 = v8[1];
    }
    id v12 = v11;
    xpc_object_t v13 = xpc_array_create(0, 0);
    objc_storeStrong(v8 + 3, v13);
    if (v9)
    {
      if (v12 && MEMORY[0x192FECA30](v12) == MEMORY[0x1E4F14590]) {
        goto LABEL_22;
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      [v14 handleFailureInFunction:v15 file:@"RBSXPCCoder.m" lineNumber:269 description:&stru_1EE2E2768];
    }
    else
    {
      if (v12 && MEMORY[0x192FECA30](v12) == MEMORY[0x1E4F14568]) {
        goto LABEL_22;
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      [v14 handleFailureInFunction:v15 file:@"RBSXPCCoder.m" lineNumber:268 description:&stru_1EE2E2768];
    }

LABEL_22:
    if (!v10)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      [v40 handleFailureInFunction:v41 file:@"RBSXPCCoder.m" lineNumber:270 description:&stru_1EE2E2768];
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v58 != v19) {
            objc_enumerationMutation(v17);
          }
          _RBSXPCEncodeObjectForKey(v8, *(void *)(*((void *)&v57 + 1) + 8 * i), 0);
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v18);
    }

    if (v13)
    {
      if (v9)
      {
        v21 = (const char *)[v9 UTF8String];
        id v22 = v12;
        id v23 = v13;
        if (v21)
        {
          if (v12)
          {
            v24 = v23;
            if (MEMORY[0x192FECA30]() == MEMORY[0x1E4F14568]) {
              xpc_dictionary_set_value(v22, v21, v24);
            }
          }
        }
        else
        {
          v42 = [MEMORY[0x1E4F28B00] currentHandler];
          v43 = objc_msgSend(NSString, "stringWithUTF8String:", "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
          [v42 handleFailureInFunction:v43 file:@"RBSXPCUtilities_Project.h" lineNumber:123 description:@"key must not be nil"];
        }
      }
      else
      {
        id v25 = v12;
        id v26 = v13;
        if (v12)
        {
          v27 = v26;
          if (MEMORY[0x192FECA30]() == MEMORY[0x1E4F14568]) {
            xpc_array_append_value(v25, v27);
          }
        }
      }
    }
    id v28 = _BSXPCPopEncodingContext(v8, v12);

    goto LABEL_42;
  }
  if (_NSIsNSDictionary())
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = ___RBSXPCEncodeObjectForKey_block_invoke;
    v54[3] = &unk_1E5741250;
    id v55 = v5;
    v56 = v46;
    _BSXPCEncodeDictionaryWithKey(v56, v47, v54);
  }
  else if ([v5 supportsRBSXPCSecureCoding])
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = ___RBSXPCEncodeObjectForKey_block_invoke_2;
    v51[3] = &unk_1E5741250;
    id v52 = v5;
    v53 = v46;
    _BSXPCEncodeDictionaryWithKey(v53, v47, v51);
  }
  else if ([(objc_class *)aClass supportsSecureCoding])
  {
    v29 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v29)
    {
      v30 = (void *)v46[3];
      if (v47)
      {
        if (!v30) {
          v30 = (void *)v46[1];
        }
        id v31 = v30;
        xpc_dictionary_set_value(v31, (const char *)[v47 UTF8String], v29);
      }
      else
      {
        if (!v30) {
          v30 = (void *)v46[1];
        }
        id v39 = v30;
        xpc_array_append_value(v39, v29);
      }
    }
    else
    {
      v36 = v46;
      if (!v46[4])
      {
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
        v36 = v46;
        v38 = (void *)v46[4];
        v46[4] = v37;
      }
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = ___RBSXPCEncodeObjectForKey_block_invoke_3;
      v48[3] = &unk_1E5741250;
      id v49 = v36;
      id v50 = v5;
      _BSXPCEncodeDictionaryWithKey(v49, v47, v48);
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x1E4F1CA00];
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    v35 = NSStringFromClass(aClass);
    [v32 raise:*MEMORY[0x1E4F1C3C8], @"%@ could not encode object %@ because it supports neither RBSXPC[Secure]Coding nor NSSecureCoding.", v34, v35 format];
  }
LABEL_42:
}

void sub_191FEAB8C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, Class aClass, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint8_t buf,int a42,int a43,__int16 a44,int a45,__int16 a46,__int16 a47,uint64_t a48)
{
}

void sub_191FEAD14(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x191FEACE4);
  }
  JUMPOUT(0x191FEAD2CLL);
}

id _BSXPCDecodeObjectForKey(void *a1, void *a2, objc_class *a3, uint64_t *a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectForKey(RBSXPCCoder *__strong, NSString *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    [v15 handleFailureInFunction:v16, @"RBSXPCCoder.m", 399, @"Invalid parameter not satisfying: %@", @"key != nil" file lineNumber description];
  }
  id v9 = (void *)v7[3];
  if (!v9) {
    id v9 = (void *)v7[1];
  }
  id v10 = v9;
  id v11 = v8;
  id v12 = RBSXPCDictionaryGetValue(v10, (const char *)[v11 UTF8String], 0);

  xpc_object_t v13 = _BSXPCDecodeObjectFromContext(v7, v12, v11, a3, a4);

  return v13;
}

id RBSXPCDictionaryGetValue(void *a1, const char *a2, uint64_t a3)
{
  id v5 = a1;
  v6 = v5;
  if (a2)
  {
    if (!v5) {
      goto LABEL_4;
    }
  }
  else
  {
    xpc_object_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "xpc_object_t  _Nullable RBSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    [v13 handleFailureInFunction:v14 file:@"RBSXPCUtilities_Project.h" lineNumber:112 description:@"key must not be nil"];

    if (!v6)
    {
LABEL_4:
      id v7 = 0;
      id v8 = 0;
      id v9 = 0;
      if (!a3) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  if (MEMORY[0x192FECA30](v6) != MEMORY[0x1E4F14590]) {
    goto LABEL_4;
  }
  id v11 = xpc_dictionary_get_value(v6, a2);
  id v9 = v11;
  if (a3)
  {
    id v12 = v11;
    id v7 = v12;
    if (v12)
    {
      if (MEMORY[0x192FECA30](v12) == a3) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
LABEL_5:
    id v9 = v8;
  }
LABEL_6:

  return v9;
}

id _BSXPCDecodeObjectFromContext(void *a1, void *a2, void *a3, objc_class *a4, uint64_t *a5)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v79 = a2;
  id v76 = a3;
  if (!a4)
  {
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    v69 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectFromContext(RBSXPCCoder *__strong, __strong xpc_object_t, NSString *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    [v68 handleFailureInFunction:v69, @"RBSXPCCoder.m", 405, @"Invalid parameter not satisfying: %@", @"expectedClass != nil" file lineNumber description];
  }
  id v10 = v9 + 3;
  id v11 = v9[3];
  if (!v11) {
    id v11 = v9[1];
  }
  id v78 = v11;
  id v12 = (id)MEMORY[0x1E4F14550];
  if (v79) {
    xpc_object_t v13 = v79;
  }
  else {
    xpc_object_t v13 = (void *)MEMORY[0x1E4F14550];
  }
  objc_storeStrong(v9 + 3, v13);
  context = (void *)MEMORY[0x192FEC250]();
  v14 = v9;
  Class aClass = a4;
  if (!a4)
  {
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    v71 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    [v70 handleFailureInFunction:v71, @"RBSXPCCoder.m", 437, @"Invalid parameter not satisfying: %@", @"expectedClass != nil" file lineNumber description];
  }
  id v15 = *v10;
  if (!*v10) {
    id v15 = v14[1];
  }
  id v16 = v15;
  id v17 = v16;
  if (v16 == v12) {
    goto LABEL_35;
  }
  uint64_t v18 = MEMORY[0x192FECA30](v16);
  NSClassFromString(&cfstr_OsXpcObject.isa);
  if ([(objc_class *)a4 isSubclassOfClass:(id)objc_claimAutoreleasedReturnValue()])
  {
    id v19 = v17;
    goto LABEL_15;
  }
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    if (a5)
    {
      if (v18 != MEMORY[0x1E4F14568])
      {
        v20 = rbs_coder_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_6();
        }
        v21 = @"Invalid decoding context for collection";
LABEL_26:

LABEL_27:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:v21];
LABEL_35:
        id v19 = 0;
        goto LABEL_36;
      }
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id applier = (id)MEMORY[0x1E4F143A8];
      uint64_t v83 = 3221225472;
      v84 = ___BSXPCDecodeObject_block_invoke;
      v85 = &unk_1E5741278;
      v86 = v14;
      v88 = a5;
      id v36 = v35;
      id v87 = v36;
      if (xpc_array_apply(v17, &applier))
      {
        id v19 = (id)[[aClass alloc] initWithArray:v36];
      }
      else
      {
        uint64_t v37 = rbs_coder_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_5();
        }

        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unable to decode array: an object within the array failed to decode"];
        id v19 = 0;
      }

      goto LABEL_15;
    }
    v29 = rbs_coder_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromClass(aClass);
      _BSXPCDecodeObjectFromContext_cold_4(v30, (uint64_t)&applier, v29);
    }

    id v31 = (void *)MEMORY[0x1E4F1CA00];
    v32 = NSStringFromClass(aClass);
    [v31 raise:*MEMORY[0x1E4F1C3C8], @"Attempted to decode a collection (%@) without specifying the class it contains", v32 format];
LABEL_34:

    goto LABEL_35;
  }
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    if (a5)
    {
      if (v18 != MEMORY[0x1E4F14590])
      {
        v20 = rbs_coder_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_10();
        }
        v21 = @"Invalid decoding context for dictionary";
        goto LABEL_26;
      }
      uint64_t v90 = 0;
      v91[0] = &v90;
      v91[1] = 0x3032000000;
      v91[2] = __Block_byref_object_copy_;
      v91[3] = __Block_byref_object_dispose_;
      id v92 = 0;
      v51 = [MEMORY[0x1E4F1CA60] dictionary];
      id applier = (id)MEMORY[0x1E4F143A8];
      uint64_t v83 = 3221225472;
      v84 = ___BSXPCDecodeObject_block_invoke_202;
      v85 = &unk_1E57412A0;
      v86 = v14;
      v89 = a5;
      id v52 = v51;
      id v87 = v52;
      v88 = &v90;
      if (xpc_dictionary_apply(v17, &applier))
      {
        id v19 = (id)[[aClass alloc] initWithDictionary:v52];
      }
      else
      {
        v53 = rbs_coder_log();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_9((uint64_t)v91, v53, v54);
        }

        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unable to decode dictionary key %@", *(void *)(v91[0] + 40) format];
        id v19 = 0;
      }

      _Block_object_dispose(&v90, 8);
LABEL_15:
      if (!v19) {
        goto LABEL_36;
      }
      goto LABEL_16;
    }
    if (xpc_dictionary_get_string(v17, "bsx_index"))
    {
      if (v18 != MEMORY[0x1E4F14590])
      {
        v72 = [MEMORY[0x1E4F28B00] currentHandler];
        v73 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
        [v72 handleFailureInFunction:v73 file:@"RBSXPCCoder.m" lineNumber:596 description:@"RBSXPCEncodingNSSecure expects a dictionary decodingContext"];
      }
      goto LABEL_62;
    }
    goto LABEL_54;
  }
  if (v18 != MEMORY[0x1E4F14590]) {
    goto LABEL_54;
  }
  if ([(objc_class *)a4 supportsRBSXPCSecureCoding])
  {
    id v49 = (NSString *)RBSCreateDeserializedStringFromXPCDictionaryWithKey(v17, "bsx_class");
    if (!v49)
    {
      v74 = [MEMORY[0x1E4F28B00] currentHandler];
      v75 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
      [v74 handleFailureInFunction:v75 file:@"RBSXPCCoder.m" lineNumber:574 description:@"we already verified that this must be true"];
    }
    id v50 = NSClassFromString(v49);
    if (v50)
    {
      if (aClass == v50)
      {
LABEL_104:
        id v19 = (id)[[v50 alloc] initWithRBSXPCCoder:v14];

        goto LABEL_15;
      }
      if ([(objc_class *)aClass isSubclassOfClass:v50])
      {
        id v50 = aClass;
        goto LABEL_104;
      }
      if ([(objc_class *)v50 isSubclassOfClass:aClass]) {
        goto LABEL_104;
      }
      v66 = rbs_coder_log();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        objc_claimAutoreleasedReturnValue();
        _BSXPCDecodeObjectFromContext_cold_12();
      }

      v67 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v62 = NSStringFromClass(aClass);
      [v67 raise:*MEMORY[0x1E4F1C3C8], @"Decoded class %@ is not compatible with expected class %@", v49, v62, v76, context, v78 format];
    }
    else
    {
      long long v60 = rbs_coder_log();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        objc_claimAutoreleasedReturnValue();
        _BSXPCDecodeObjectFromContext_cold_11();
      }

      v61 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v62 = NSStringFromClass(aClass);
      [v61 raise:*MEMORY[0x1E4F1C3C8], @"Unable to reify class %@ for expected class %@", v49, v62, v76, context, v78 format];
    }

    id v50 = 0;
    goto LABEL_104;
  }
  if (![(objc_class *)a4 supportsSecureCoding])
  {
    id v55 = rbs_coder_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = NSStringFromClass(a4);
      _BSXPCDecodeObjectFromContext_cold_13(v56, (uint64_t)&applier, v55);
    }

    long long v57 = (void *)MEMORY[0x1E4F1CA00];
    long long v58 = NSStringFromClass(aClass);
    [v57 raise:*MEMORY[0x1E4F1C3C8], @"No valid encoding type could be determined for expected class: %@", v58 format];

    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v59 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    [v32 handleFailureInFunction:v59 file:@"RBSXPCCoder.m" lineNumber:630 description:@"we should not have been able to vet the class without defining the encoding"];

    goto LABEL_34;
  }
  if (xpc_dictionary_get_string(v17, "bsx_index"))
  {
    if (a5)
    {
      uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", a4, a5, 0, v76, context, v78);
      goto LABEL_63;
    }
LABEL_62:
    uint64_t v38 = [MEMORY[0x1E4F1CAD0] setWithObjects:&aClass count:1];
LABEL_63:
    id v39 = (void *)v38;
    if (!v14[5])
    {
      v40 = RBSDeserializeDataFromXPCDictionaryWithKey(v14[1], "bsx_archive");
      if ([v40 length])
      {
        v41 = v39;
        id v42 = objc_alloc(MEMORY[0x1E4F28DC0]);
        id applier = 0;
        uint64_t v43 = [v42 initForReadingFromData:v40 error:&applier];
        v44 = applier;
        v45 = v14[5];
        v14[5] = (void *)v43;

        [v14[5] setRequiresSecureCoding:1];
        if (v44)
        {
          v46 = rbs_coder_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            _BSXPCDecodeObjectFromContext_cold_8((uint64_t)v44, v46, v47);
          }

          v48 = v14[5];
          v14[5] = 0;
        }
      }
      else
      {
        v44 = rbs_coder_log();
        v41 = v39;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          _BSXPCDecodeObjectFromContext_cold_7();
        }
      }

      id v39 = v41;
    }
    v63 = RBSDeserializeStringFromXPCDictionaryWithKey(v17, "bsx_index");
    v64 = v14[5];
    id v80 = 0;
    id v19 = [v64 decodeTopLevelObjectOfClasses:v39 forKey:v63 error:&v80];
    id v65 = v80;
    if (v65) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Error during decoding of %@: %@", v63, v65 format];
    }

    goto LABEL_15;
  }
LABEL_54:
  id v19 = (id)_CFXPCCreateCFObjectFromXPCObject();
  if (!v19 && v18 == MEMORY[0x1E4F145F8]) {
    id v19 = (id)[objc_alloc(NSNumber) initWithUnsignedLongLong:xpc_uint64_get_value(v17)];
  }
  if (!v19)
  {
    v21 = @"Invalid decoding context for <CFXPCBridge>";
    goto LABEL_27;
  }
LABEL_16:
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = rbs_coder_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(aClass);
      objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_2();
    }

    id v25 = (void *)MEMORY[0x1E4F1CA00];
    id v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    id v28 = NSStringFromClass(aClass);
    [v25 raise:*MEMORY[0x1E4F1C3C8], @"Decoded object class %@ does not match expected class %@", v27, v28 format];
  }
LABEL_36:

  objc_storeStrong(v10, v11);
  id v33 = *v10;
  if (*v10 == v14[1])
  {
    *id v10 = 0;
  }

  return v19;
}

void sub_191FEBC14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, Class aClass, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exception_object);
      JUMPOUT(0x191FEB0C4);
    }
    id v21 = objc_begin_catch(exception_object);
    id v22 = rbs_coder_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(aClass);
      objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_1();
    }

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_191FEBD44(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x191FEBCD4);
  }
  _Unwind_Resume(a1);
}

void sub_191FEBD68(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x191FEBD88);
}

void sub_191FEBD90(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_191FEBDAC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x191FEBDB8);
  }
  _Unwind_Resume(a1);
}

void sub_191FEBEB0(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x191FEBDC0);
  }
  _Unwind_Resume(a1);
}

const char *RBSCreateDeserializedStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  v4 = v3;
  if (v3)
  {
    string = xpc_dictionary_get_string(v3, a2);
    if (string) {
      string = (const char *)[[NSString alloc] initWithCString:string encoding:4];
    }
  }
  else
  {
    string = 0;
  }

  return string;
}

void _BSXPCEncodeDictionaryWithKey(void *a1, void *a2, void *a3)
{
  id v25 = a1;
  id v5 = a2;
  v6 = a3;
  id v7 = (void *)*((void *)v25 + 3);
  if (!v7) {
    id v7 = (void *)*((void *)v25 + 1);
  }
  id v8 = v7;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  objc_storeStrong((id *)v25 + 3, v9);
  if (v5)
  {
    if (!v8 || MEMORY[0x192FECA30](v8) != MEMORY[0x1E4F14590])
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(RBSXPCCoder *__strong, NSString *__strong, void (^__strong)(__strong xpc_object_t))");
      id v12 = v10;
      xpc_object_t v13 = v11;
      uint64_t v14 = 299;
LABEL_10:
      [v12 handleFailureInFunction:v13 file:@"RBSXPCCoder.m" lineNumber:v14 description:&stru_1EE2E2768];
    }
  }
  else if (!v8 || MEMORY[0x192FECA30](v8) != MEMORY[0x1E4F14568])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(RBSXPCCoder *__strong, NSString *__strong, void (^__strong)(__strong xpc_object_t))");
    id v12 = v10;
    xpc_object_t v13 = v11;
    uint64_t v14 = 298;
    goto LABEL_10;
  }
  v6[2](v6, v9);
  if (v9 && xpc_dictionary_get_count(v9))
  {
    if (v5)
    {
      id v15 = (const char *)[v5 UTF8String];
      id v16 = v8;
      id v17 = v9;
      if (v15)
      {
        if (v8)
        {
          uint64_t v18 = v17;
          if (MEMORY[0x192FECA30]() == MEMORY[0x1E4F14590]) {
            xpc_dictionary_set_value(v16, v15, v18);
          }
        }
      }
      else
      {
        id v23 = [MEMORY[0x1E4F28B00] currentHandler];
        id v24 = objc_msgSend(NSString, "stringWithUTF8String:", "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
        [v23 handleFailureInFunction:v24 file:@"RBSXPCUtilities_Project.h" lineNumber:123 description:@"key must not be nil"];
      }
    }
    else
    {
      id v19 = v8;
      id v20 = v9;
      if (v8)
      {
        id v21 = v20;
        if (MEMORY[0x192FECA30]() == MEMORY[0x1E4F14590]) {
          xpc_array_append_value(v19, v21);
        }
      }
    }
  }
  id v22 = _BSXPCPopEncodingContext(v25, v8);
}

void sub_191FEC388()
{
}

void sub_191FEC3D0()
{
}

void sub_191FEC3E0()
{
  if (v0) {
    JUMPOUT(0x191FEC3E8);
  }
  JUMPOUT(0x191FEC3ECLL);
}

id _BSXPCPopEncodingContext(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)*((void *)v3 + 3);
  if (!v5) {
    id v5 = (void *)*((void *)v3 + 1);
  }
  id v6 = v5;
  objc_storeStrong((id *)v3 + 3, a2);
  id v7 = (void *)*((void *)v3 + 3);
  if (v7 == *((void **)v3 + 1))
  {
    *((void *)v3 + 3) = 0;
  }
  return v6;
}

void RBSSerializeStringToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  if (a1 && a2 && a3)
  {
    id v5 = a1;
    xpc_object_t xdict = a2;
    xpc_dictionary_set_string(xdict, a3, (const char *)[v5 UTF8String]);
  }
}

void sub_191FEC988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id rbs_process_log()
{
  if (rbs_process_log_onceToken != -1) {
    dispatch_once(&rbs_process_log_onceToken, &__block_literal_global_25);
  }
  char v0 = (void *)rbs_process_log___logger;
  return v0;
}

char *RBSDeserializeStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  v2 = (char *)RBSCreateDeserializedStringFromXPCDictionaryWithKey(a1, a2);
  return v2;
}

id RBSDeserializeDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  v2 = (void *)RBSCreateDeserializedDataFromXPCDictionaryWithKey(a1, a2);
  return v2;
}

__n128 RBSInvalidRealAuditToken@<Q0>(__n128 *a1@<X8>)
{
  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  *a1 = result;
  a1[1] = result;
  return result;
}

id RBSXPCPackObject(void *a1)
{
  id v1 = a1;
  xpc_object_t values = v1;
  if (!v1) {
    goto LABEL_8;
  }
  uint64_t v2 = _RBSIsXPCObject_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&_RBSIsXPCObject_onceToken, &__block_literal_global_12);
  }
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    xpc_object_t v5 = xpc_dictionary_create((const char *const *)RBSEncodedXPCTypeKey, &values, 1uLL);
    goto LABEL_9;
  }
  xpc_object_t v7 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
  if (v7)
  {
    xpc_object_t v5 = xpc_dictionary_create((const char *const *)RBSEncodedCFTypeKey, &v7, 1uLL);
  }
  else
  {
LABEL_8:
    xpc_object_t v5 = 0;
  }
LABEL_9:

  return v5;
}

BOOL RBSAtomicGetFlag(atomic_uint *a1)
{
  if (!a1) {
    RBSAtomicGetFlag_cold_1();
  }
  unsigned int v1 = 1;
  atomic_compare_exchange_strong_explicit(a1, &v1, v1, memory_order_relaxed, memory_order_relaxed);
  return v1 == 1;
}

void sub_191FF1EA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Unwind_Resume(a1);
}

id rbs_message_log()
{
  if (rbs_message_log_onceToken != -1) {
    dispatch_once(&rbs_message_log_onceToken, &__block_literal_global_55);
  }
  char v0 = (void *)rbs_message_log___logger;
  return v0;
}

BOOL RBSAtomicSetFlag(unsigned int a1, atomic_uint *a2)
{
  if (!a2) {
    RBSAtomicSetFlag_cold_1();
  }
  int v2 = a1 ^ 1;
  atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v2, a1, memory_order_relaxed, memory_order_relaxed);
  return v2 == (a1 ^ 1);
}

uint64_t RBSSandboxCanAccessMachService()
{
  if (RBSSandboxCanAccessMachService_onceToken != -1) {
    dispatch_once(&RBSSandboxCanAccessMachService_onceToken, &__block_literal_global_5);
  }
  return RBSSandboxCanAccessMachService_canAccess;
}

BOOL RBSRealAuditTokenValid(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3) != -1;
}

double RBSMachAbsoluteTime()
{
  if (*(double *)&RBSMachAbsoluteTime___TimeScale == 0.0)
  {
    mach_timebase_info info = 0;
    if (!mach_timebase_info(&info))
    {
      LODWORD(v0) = info.numer;
      LODWORD(v1) = info.denom;
      *(double *)&RBSMachAbsoluteTime___TimeScale = (double)v0 / (double)v1 / 1000000000.0;
    }
  }
  return *(double *)&RBSMachAbsoluteTime___TimeScale * (double)mach_absolute_time();
}

void sub_191FF3E8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromRBSAcquisitionCompletionPolicy(uint64_t a1)
{
  unint64_t v1 = @"(unknown)";
  if (!a1) {
    unint64_t v1 = @"AfterValidation";
  }
  if (a1 == 1) {
    return @"AfterApplication";
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromRBSTerminationResistance(int a1)
{
  if (a1 > 29)
  {
    switch(a1)
    {
      case 30:
        return @"NonInteractive";
      case 40:
        return @"Interactive";
      case 50:
        return @"Absolute";
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return @"(unknown)";
      case 10:
        return @"NotRunning";
      case 20:
        return @"None";
    }
  }
  return @"(undefined)";
}

id RBSXPCUnpackObject(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (!v1) {
    goto LABEL_5;
  }
  uint64_t v3 = MEMORY[0x192FECA30](v1);
  uint64_t v4 = MEMORY[0x1E4F14590];
  if (v3 == MEMORY[0x1E4F14590])
  {
    xpc_object_t v7 = xpc_dictionary_get_value(v2, "@");

    if (v7)
    {
      id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v5 = v2;
  if (MEMORY[0x192FECA30]() == v4)
  {
    id v6 = xpc_dictionary_get_value(v5, "*");
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }
  xpc_object_t v7 = v2;
LABEL_10:

  return v6;
}

void sub_191FF70C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_191FF8648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void RBSDispatchAsyncWithQoS(void *a1, dispatch_qos_class_t a2, void *a3)
{
  queue = a1;
  if (a2)
  {
    id v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, a2, 0, a3);
    dispatch_async(queue, v5);

    id v6 = v5;
  }
  else
  {
    dispatch_async(queue, a3);
    id v6 = queue;
  }
}

__CFString *NSStringFromRBSTaskState(unsigned int a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_1E57417B8[(char)a1];
  }
}

id rbs_sp_assertion_log()
{
  if (rbs_sp_assertion_log_onceToken != -1) {
    dispatch_once(&rbs_sp_assertion_log_onceToken, &__block_literal_global_61);
  }
  unint64_t v0 = (void *)rbs_sp_assertion_log___logger;
  return v0;
}

id rbs_ttl_log()
{
  if (rbs_ttl_log_onceToken != -1) {
    dispatch_once(&rbs_ttl_log_onceToken, &__block_literal_global_52);
  }
  unint64_t v0 = (void *)rbs_ttl_log___logger;
  return v0;
}

__CFString *NSStringFromRBSDurationEndPolicy(unint64_t a1)
{
  if (a1 > 2) {
    return @"(invalid end policy)";
  }
  else {
    return off_1E5741430[a1];
  }
}

__CFString *NSStringFromRBSMemoryLimitStrength(unsigned int a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E57416B0[(char)a1];
  }
}

__CFString *NSStringFromRBSRole(unsigned int a1)
{
  if (a1 > 7) {
    return @"(undefined)";
  }
  else {
    return off_1E5741800[(char)a1];
  }
}

void sub_191FFD1A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id rbs_sp_state_log()
{
  if (rbs_sp_state_log_onceToken != -1) {
    dispatch_once(&rbs_sp_state_log_onceToken, &__block_literal_global_64);
  }
  unint64_t v0 = (void *)rbs_sp_state_log___logger;
  return v0;
}

id rbs_general_log()
{
  if (rbs_general_log_onceToken != -1) {
    dispatch_once(&rbs_general_log_onceToken, &__block_literal_global_10_0);
  }
  unint64_t v0 = (void *)rbs_general_log___logger;
  return v0;
}

BOOL _RBSSandboxCanGetMachTaskName(int a1)
{
  if (getpid() == a1) {
    return 1;
  }
  if (_RBSSandboxCanGetMachTaskName_onceToken != -1) {
    dispatch_once(&_RBSSandboxCanGetMachTaskName_onceToken, &__block_literal_global_9);
  }
  return _RBSSandboxCanGetMachTaskName_allowed != 0;
}

BOOL RBSAcquisitionCompletionPolicyIsValid(unint64_t a1)
{
  return a1 < 2;
}

id RBSEndowmentEncode(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = 0;
    uint64_t v3 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)uuid = 0;
      uint64_t v15 = 0;
      [v1 getUUIDBytes:uuid];
      id v2 = xpc_uuid_create(uuid);
      uint64_t v3 = 2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v2 = [v1 _endpoint];
        uint64_t v3 = 3;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v2 = (id)_CFXPCCreateXPCObjectFromCFObject();
          uint64_t v3 = 4;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            xpc_object_t v6 = xpc_array_create(0, 0);
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __RBSEndowmentEncode_block_invoke;
            v12[3] = &unk_1E57416F8;
            id v2 = v6;
            id v13 = v2;
            [v1 enumerateObjectsUsingBlock:v12];
            size_t count = xpc_array_get_count(v2);
            if (count != [v1 count])
            {

              id v2 = 0;
            }

            uint64_t v3 = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
              v10[0] = MEMORY[0x1E4F143A8];
              v10[1] = 3221225472;
              v10[2] = __RBSEndowmentEncode_block_invoke_2;
              v10[3] = &unk_1E5741720;
              id v2 = v8;
              id v11 = v2;
              [v1 enumerateKeysAndObjectsUsingBlock:v10];
              size_t v9 = xpc_dictionary_get_count(v2);
              if (v9 != [v1 count])
              {

                id v2 = 0;
              }

              uint64_t v3 = 6;
            }
            else
            {
              uint64_t v3 = 0;
              id v2 = 0;
            }
          }
        }
      }
    }
  }
  uint64_t v4 = _RBSEndowmentWrapType(v2, v3);

  return v4;
}

id _RBSEndowmentWrapType(void *a1, uint64_t a2)
{
  objects[2] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2 - 4 >= 3)
  {
    if (a2 - 2 < 2)
    {
      xpc_object_t v5 = v3;
LABEL_10:
      xpc_object_t v6 = v5;
      goto LABEL_12;
    }
    if (a2 == 1)
    {
      xpc_object_t v5 = xpc_null_create();
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (!v3)
  {
LABEL_11:
    xpc_object_t v6 = 0;
    goto LABEL_12;
  }
  objects[0] = xpc_uint64_create(a2);
  objects[1] = v4;
  xpc_object_t v6 = xpc_array_create(objects, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

LABEL_12:
  return v6;
}

id rbs_assertion_log()
{
  if (rbs_assertion_log_onceToken != -1) {
    dispatch_once(&rbs_assertion_log_onceToken, &__block_literal_global_3);
  }
  unint64_t v0 = (void *)rbs_assertion_log___logger;
  return v0;
}

id rbs_state_log()
{
  if (rbs_state_log_onceToken != -1) {
    dispatch_once(&rbs_state_log_onceToken, &__block_literal_global_31);
  }
  unint64_t v0 = (void *)rbs_state_log___logger;
  return v0;
}

id rbs_connection_log()
{
  if (rbs_connection_log_onceToken != -1) {
    dispatch_once(&rbs_connection_log_onceToken, &__block_literal_global_7);
  }
  unint64_t v0 = (void *)rbs_connection_log___logger;
  return v0;
}

__CFString *NSStringFromRBSDurationStartPolicy(uint64_t a1)
{
  if (a1 > 100)
  {
    switch(a1)
    {
      case 'g':
        return @"Delayed-Fixed";
      case 'f':
        return @"Delayed-Relative";
      case 'e':
        return @"Relative";
      default:
        return @"(invalid start policy)";
    }
  }
  else
  {
    __n128 result = @"Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        __n128 result = @"Fixed";
        break;
      case 2:
        __n128 result = @"Proc-Start-Relative";
        break;
      case 3:
        __n128 result = @"After-Originator-Exit";
        break;
      default:
        return @"(invalid start policy)";
    }
  }
  return result;
}

id RBSBundleIDForPID(int a1)
{
  if (getpid() == a1)
  {
    id v1 = [MEMORY[0x1E4F28B50] mainBundle];
    id v2 = [v1 bundleIdentifier];
    goto LABEL_17;
  }
  RBSExecutablePathForPID();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    id v2 = 0;
    goto LABEL_17;
  }
  id v3 = (void *)MEMORY[0x192FEC250]();
  id v1 = v1;
  [v1 UTF8String];
  uint64_t v4 = (void *)xpc_bundle_create();
  if (!v4) {
    goto LABEL_11;
  }
  xpc_object_t v5 = xpc_bundle_get_info_dictionary();
  if (!v5
    || (string = xpc_dictionary_get_string(v5, (const char *)[ (id) *MEMORY[0x1E4F1CFF8] UTF8String])) == 0)
  {

    goto LABEL_11;
  }
  id v2 = (void *)[[NSString alloc] initWithUTF8String:string];

  if (!v2)
  {
LABEL_11:
    xpc_object_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v1];
    if (v7 && (xpc_object_t v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle()) != 0)
    {
      size_t v9 = v8;
      id v2 = CFBundleGetIdentifier(v8);
      CFRelease(v9);
    }
    else
    {
      id v2 = 0;
    }
  }
LABEL_17:

  return v2;
}

BOOL RBSPIDExists(int a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (getpid() == a1) {
    return 1;
  }
  if (a1 < 1) {
    return 0;
  }
  memset(v3, 0, sizeof(v3));
  return _RBShortBSDProcessInfoForPID(a1, v3);
}

BOOL _RBShortBSDProcessInfoForPID(int a1, void *a2)
{
  BOOL result = 0;
  if (a1 >= 1)
  {
    if (a2)
    {
      BOOL result = RBSandboxCanGetProcessInfo(a1);
      if (result)
      {
        if (proc_pidinfo(a1, 13, 0, a2, 64) == 64)
        {
          return 1;
        }
        else
        {
          if (*__error() != 3)
          {
            xpc_object_t v5 = rbs_general_log();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              _RBShortBSDProcessInfoForPID_cold_1(a1, v5);
            }
          }
          return 0;
        }
      }
    }
  }
  return result;
}

id RBSExecutablePathForPID()
{
  int v0 = MEMORY[0x1F4188790]();
  int v1 = v0;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (v0 >= 1 && RBSandboxCanGetProcessInfo(v0))
  {
    int v2 = proc_pidpath(v1, buffer, 0x1000u);
    if (v2 < 1)
    {
      id v3 = rbs_general_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        RBSExecutablePathForPID_cold_2();
      }
      uint64_t v4 = 0;
    }
    else
    {
      id v3 = [[NSString alloc] initWithBytes:buffer length:v2 encoding:4];
      uint64_t v4 = [v3 stringByStandardizingPath];
    }
  }
  else
  {
    xpc_object_t v5 = rbs_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      RBSExecutablePathForPID_cold_1(v1);
    }

    uint64_t v4 = 0;
  }
  return v4;
}

BOOL RBSandboxCanGetProcessInfo(int a1)
{
  if (getpid() == a1) {
    return 1;
  }
  if (RBSandboxCanGetProcessInfo_onceToken != -1) {
    dispatch_once(&RBSandboxCanGetProcessInfo_onceToken, &__block_literal_global_2);
  }
  return RBSandboxCanGetProcessInfo_allowed != 0;
}

BOOL RBSDebugStateIsDebugging(char a1)
{
  return (a1 & 0xFE) == 2;
}

BOOL RBSAuditTokenRepresentsPlatformBinary(_OWORD *a1)
{
  long long v2 = a1[1];
  *(_OWORD *)v7.val = *a1;
  *(_OWORD *)&v7.val[4] = v2;
  id v3 = SecTaskCreateWithAuditToken(0, &v7);
  uint32_t CodeSignStatus = SecTaskGetCodeSignStatus(v3);
  if (v3)
  {
    CFRelease(v3);
  }
  else
  {
    xpc_object_t v5 = rbs_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      RBSAuditTokenRepresentsPlatformBinary_cold_1(a1, v5);
    }
  }
  return (CodeSignStatus & 0xC000001) == 67108865;
}

__CFString *NSStringFromRBSLegacyReason(uint64_t a1)
{
  if (a1 > 9999)
  {
    if (a1 > 49999)
    {
      if (a1 <= 50003)
      {
        if (a1 == 50000) {
          return @"FinishTaskAfterBackgroundContentFetching";
        }
        if (a1 == 50003) {
          return @"FinishTaskAfterNotificationAction";
        }
      }
      else
      {
        switch(a1)
        {
          case 50004:
            return @"FinishTaskAfterWatchConnectivity";
          case 60000:
            return @"Domain";
          case 60001:
            return @"Custom";
        }
      }
      return &stru_1EE2E2768;
    }
    else
    {
      switch(a1)
      {
        case 10000:
          BOOL result = @"Resume";
          break;
        case 10002:
          BOOL result = @"TransientWakeup";
          break;
        case 10004:
          BOOL result = @"FinishTaskUnbounded";
          break;
        case 10005:
          BOOL result = @"Continuous";
          break;
        case 10006:
          BOOL result = @"BackgroundContentFetching";
          break;
        case 10007:
          BOOL result = @"NotificationAction";
          break;
        case 10008:
          BOOL result = @"PIP";
          break;
        default:
          return &stru_1EE2E2768;
      }
    }
  }
  else
  {
    BOOL result = @"None";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        BOOL result = @"MediaPlayback";
        break;
      case 2:
        BOOL result = @"Location";
        break;
      case 3:
        BOOL result = @"ExternalAccessory";
        break;
      case 4:
        BOOL result = @"FinishTask";
        break;
      case 5:
        BOOL result = @"Bluetooth";
        break;
      case 7:
        BOOL result = @"BackgroundUI";
        break;
      case 8:
        BOOL result = @"InterAppAudioStreaming";
        break;
      case 9:
        BOOL result = @"ViewService";
        break;
      case 10:
        BOOL result = @"NewsstandDownload";
        break;
      case 12:
        BOOL result = @"VoIP";
        break;
      case 13:
        BOOL result = @"Extension";
        break;
      case 16:
        BOOL result = @"WatchConnectivity";
        break;
      case 18:
        BOOL result = @"ComplicationUpdate";
        break;
      case 19:
        BOOL result = @"WorkoutProcessing";
        break;
      case 20:
        BOOL result = @"ComplicationPushUpdate";
        break;
      case 21:
        BOOL result = @"BackgroundLocationProcessing";
        break;
      case 23:
        BOOL result = @"AudioRecording";
        break;
      default:
        return &stru_1EE2E2768;
    }
  }
  return result;
}

id NSStringFromRBSLegacyFlags(char a1)
{
  id v2 = [NSString alloc];
  id v3 = @" AllowIdleSleep";
  uint64_t v4 = &stru_1EE2E2768;
  if ((a1 & 4) == 0) {
    id v3 = &stru_1EE2E2768;
  }
  xpc_object_t v5 = @" AllowSuspendOnSleep";
  if ((a1 & 0x10) == 0) {
    xpc_object_t v5 = &stru_1EE2E2768;
  }
  xpc_object_t v6 = @" PreventTaskSuspend";
  if ((a1 & 1) == 0) {
    xpc_object_t v6 = &stru_1EE2E2768;
  }
  audit_token_t v7 = @" PreventTaskThrottleDown";
  if ((a1 & 2) == 0) {
    audit_token_t v7 = &stru_1EE2E2768;
  }
  uint64_t v8 = @" PreventThrottleDownUI";
  if ((a1 & 0x20) == 0) {
    uint64_t v8 = &stru_1EE2E2768;
  }
  if ((a1 & 8) != 0) {
    uint64_t v4 = @" WantsForegroundResourcePriority";
  }
  size_t v9 = (void *)[v2 initWithFormat:@"(%@%@%@%@%@%@)", v3, v5, v6, v7, v8, v4];
  return v9;
}

uint64_t RBSDarwinRoleFromRBSRole(unsigned int a1)
{
  if (a1 > 7) {
    return 3;
  }
  else {
    return dword_19202F098[(char)a1];
  }
}

id rbs_job_log()
{
  if (rbs_job_log_onceToken != -1) {
    dispatch_once(&rbs_job_log_onceToken, &__block_literal_global_13);
  }
  int v0 = (void *)rbs_job_log___logger;
  return v0;
}

const void *RBSCreateDeserializedDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  size_t length = 0;
  if (v3)
  {
    data = xpc_dictionary_get_data(v3, a2, &length);
    if (data)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      data = (const void *)[v6 initWithBytes:data length:length];
    }
  }
  else
  {
    data = 0;
  }

  return data;
}

id RBSStringForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  xpc_object_t v5 = RBObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id RBObjectOfClassForKey(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKey:a2];
  id v3 = v2;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

id RBSExtensionPointFromBundleDict(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"NSExtension"];
  id v3 = [v2 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];

  if (!v3)
  {
    id v4 = [v1 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
    id v3 = [v4 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
  }
  return v3;
}

id RBSDictionaryForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  xpc_object_t v5 = RBObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

void __RBSServiceInitialize_block_invoke(uint64_t a1)
{
  id v2 = -[RBSService _init]([RBSService alloc]);
  id v3 = (void *)RBSServiceInitialize___sharedInstance;
  RBSServiceInitialize___sharedInstance = (uint64_t)v2;

  objc_storeStrong((id *)(RBSServiceInitialize___sharedInstance + 8), *(id *)(a1 + 32));
  id v4 = (void *)RBSServiceInitialize___sharedInstance;
  uint64_t v5 = *(void *)(RBSServiceInitialize___sharedInstance + 32);
  -[RBSConnection registerServiceDelegate:](v5, v4);
}

id rbs_power_log()
{
  if (rbs_power_log_onceToken != -1) {
    dispatch_once(&rbs_power_log_onceToken, &__block_literal_global_22);
  }
  int v0 = (void *)rbs_power_log___logger;
  return v0;
}

void RBSSerializeDoubleToXPCDictionaryWithKey(xpc_object_t xdict, const char *key, double value)
{
  if (xdict)
  {
    if (key) {
      xpc_dictionary_set_double(xdict, key, value);
    }
  }
}

uint64_t __rbs_process_log_block_invoke()
{
  rbs_process_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "process");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_connection_log_block_invoke()
{
  rbs_connection_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "connection");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_message_log_block_invoke()
{
  rbs_message_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "message");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_monitor_log_block_invoke()
{
  rbs_monitor_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "monitor");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_assertion_log_block_invoke()
{
  rbs_assertion_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "assertion");
  return MEMORY[0x1F41817F8]();
}

id rbs_job_oversize_log()
{
  if (rbs_job_oversize_log_onceToken != -1) {
    dispatch_once(&rbs_job_oversize_log_onceToken, &__block_literal_global_16);
  }
  int v0 = (void *)rbs_job_oversize_log___logger;
  return v0;
}

uint64_t __rbs_general_log_block_invoke()
{
  rbs_general_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "general");
  return MEMORY[0x1F41817F8]();
}

void sub_19200754C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RBSDeserializeDoubleFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  double value = 0.0;
  if (a1 && a2)
  {
    uint64_t v3 = xpc_dictionary_get_value(a1, a2);
    id v4 = (void *)v3;
    if (v3 && MEMORY[0x192FECA30](v3) == MEMORY[0x1E4F14598]) {
      double value = xpc_double_get_value(v4);
    }
  }
  return value;
}

uint64_t __RBSSandboxCanAccessMachService_block_invoke()
{
  getpid();
  [@"com.apple.runningboard" UTF8String];
  uint64_t result = sandbox_check();
  RBSSandboxCanAccessMachService_canAccess = result == 0;
  return result;
}

id RBSServiceInitialize(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __RBSServiceInitialize_block_invoke;
  block[3] = &unk_1E57413F8;
  id v7 = v1;
  uint64_t v2 = RBSServiceInitialize_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&RBSServiceInitialize_onceToken, block);
  }
  id v4 = (id)RBSServiceInitialize___sharedInstance;

  return v4;
}

id rbs_shim_log()
{
  if (rbs_shim_log_onceToken != -1) {
    dispatch_once(&rbs_shim_log_onceToken, &__block_literal_global_37);
  }
  int v0 = (void *)rbs_shim_log___logger;
  return v0;
}

__CFString *NSStringFromRBSDebugState(unsigned int a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E57417E0[(char)a1];
  }
}

__CFString *NSStringFromRBSCPUMaximumUsageViolationPolicy(unint64_t a1)
{
  if (a1 > 2) {
    return @"(undefined)";
  }
  else {
    return off_1E5740E60[a1];
  }
}

id rbs_jetsam_log()
{
  if (rbs_jetsam_log_onceToken != -1) {
    dispatch_once(&rbs_jetsam_log_onceToken, &__block_literal_global_49);
  }
  int v0 = (void *)rbs_jetsam_log___logger;
  return v0;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t __rbs_shim_log_block_invoke()
{
  rbs_shim_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "shim");
  return MEMORY[0x1F41817F8]();
}

void RBSSerializeCFValueToXPCDictionaryWithKey(uint64_t a1, void *a2, const char *a3)
{
  id v5 = a2;
  if (a1 && v5 && a3)
  {
    xpc_object_t xdict = v5;
    id v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v6) {
      xpc_dictionary_set_value(xdict, a3, v6);
    }

    id v5 = xdict;
  }
}

uint64_t RBSCreateDeserializedCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v2 = xpc_dictionary_get_value(a1, a2);
  if (!v2) {
    return 0;
  }
  id v3 = (void *)v2;
  uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();

  return v4;
}

id RBSDeserializeCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  uint64_t v2 = (void *)RBSCreateDeserializedCFValueFromXPCDictionaryWithKey(a1, a2);
  return v2;
}

void RBSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    if ([(id)objc_opt_class() supportsSecureCoding])
    {
      if (!v6) {
        goto LABEL_10;
      }
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = objc_msgSend(NSString, "stringWithUTF8String:", "void RBSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(NSObject<NSSecureCoding> *__strong, __strong xpc_object_t, const char *)");
      [v12 handleFailureInFunction:v13, @"RBSXPCSerialization.m", 44, @"Invalid parameter not satisfying: %@", @"!object || [[object class] supportsSecureCoding]" file lineNumber description];

      if (!v6) {
        goto LABEL_10;
      }
    }
    uint64_t v7 = MEMORY[0x192FECA30](v6);
    if (a3 && v7 == MEMORY[0x1E4F14590])
    {
      uint64_t v8 = (void *)MEMORY[0x192FEC250]();
      uint64_t v14 = 0;
      uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v14];
      id v10 = v9;
      if (!v14 && [v9 length])
      {
        id v11 = v10;
        xpc_dictionary_set_data(v6, a3, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
      }
    }
  }
LABEL_10:
}

uint64_t RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5 = a2;
  if (!a1)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    id v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject<NSSecureCoding> *RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    [v16 handleFailureInFunction:v17, @"RBSXPCSerialization.m", 58, @"Invalid parameter not satisfying: %@", @"class != nil" file lineNumber description];
  }
  if (([a1 supportsSecureCoding] & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    id v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject<NSSecureCoding> *RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    [v18 handleFailureInFunction:v19, @"RBSXPCSerialization.m", 59, @"Invalid parameter not satisfying: %@", @"[class supportsSecureCoding]" file lineNumber description];
  }
  uint64_t v6 = 0;
  if (v5 && a3)
  {
    uint64_t v7 = xpc_dictionary_get_value(v5, a3);
    uint64_t v8 = (void *)v7;
    if (v7 && MEMORY[0x192FECA30](v7) == MEMORY[0x1E4F14580])
    {
      uint64_t v9 = (void *)MEMORY[0x192FEC250]();
      id v10 = (void *)MEMORY[0x1E4F1C9B8];
      bytes_ptr = xpc_data_get_bytes_ptr(v8);
      id v12 = [v10 dataWithBytes:bytes_ptr length:xpc_data_get_length(v8)];
      id v20 = 0;
      uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:v12 error:&v20];
      id v13 = v20;
      if (v13)
      {
        uint64_t v14 = rbs_coder_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey_cold_1((objc_class *)a1, (uint64_t)v13, v14);
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

id RBSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v3 = (void *)RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(a1, a2, a3);
  return v3;
}

void RBSSerializeDataToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  if (a1 && a2 && a3)
  {
    id v5 = a1;
    xpc_object_t xdict = a2;
    id v6 = v5;
    uint64_t v7 = (const void *)[v6 bytes];
    size_t v8 = [v6 length];

    xpc_dictionary_set_data(xdict, a3, v7, v8);
  }
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __RBSandboxCanGetProcessInfo_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  RBSandboxCanGetProcessInfo_allowed = result == 0;
  return result;
}

id RBSExecutablePathForBundlePath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = RBSSystemRootDirectory();
  id v3 = [v2 stringByAppendingPathComponent:v1];

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v3];
  id v5 = [v4 executablePath];

  return v5;
}

id RBSSystemRootDirectory()
{
  if (RBSSystemRootDirectory_onceToken != -1) {
    dispatch_once(&RBSSystemRootDirectory_onceToken, &__block_literal_global_12);
  }
  int v0 = (void *)RBSSystemRootDirectory___SystemRootDirectory;
  return v0;
}

id RBSPathForSystemDirectory(NSSearchPathDirectory a1)
{
  return _RBSearchPathForDirectoryInDomain(a1, 8uLL);
}

id _RBSearchPathForDirectoryInDomain(NSSearchPathDirectory a1, NSSearchPathDomainMask domainMask)
{
  char v2 = domainMask;
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)domainMask);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] == 1)
  {
    uint64_t v4 = NSSearchPathForDirectoriesInDomains(a1, domainMask, 1);
    id v5 = [v4 firstObject];

    if (v5)
    {
      if (v2) {
        RBSCurrentUserDirectory();
      }
      else {
      uint64_t v7 = RBSSystemRootDirectory();
      }
      if ([v5 hasPrefix:v7])
      {
        id v6 = v5;
      }
      else
      {
        size_t v8 = [v7 stringByAppendingPathComponent:v5];
        id v6 = [v8 stringByStandardizingPath];
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

id RBSPathForCurrentUserDirectory(NSSearchPathDirectory a1)
{
  return _RBSearchPathForDirectoryInDomain(a1, 1uLL);
}

id RBSCurrentUserDirectory()
{
  if (RBSCurrentUserDirectory___once != -1) {
    dispatch_once(&RBSCurrentUserDirectory___once, &__block_literal_global_10);
  }
  int v0 = (void *)RBSCurrentUserDirectory___userDirectory;
  return v0;
}

uint64_t __RBSCurrentUserDirectory_block_invoke()
{
  id v0 = [NSString alloc];
  uid_t v1 = getuid();
  RBSCurrentUserDirectory___userDirectory = [v0 initWithUTF8String:getpwuid(v1)->pw_dir];
  return MEMORY[0x1F41817F8]();
}

uint64_t __RBSSystemRootDirectory_block_invoke()
{
  RBSSystemRootDirectory___SystemRootDirectory = (uint64_t)CFStringCreateWithFileSystemRepresentation(0, "/");
  return MEMORY[0x1F41817F8]();
}

id RBSNumberForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  id v5 = RBObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id RBSURLForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  id v5 = RBObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id RBSArrayForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  id v5 = RBObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

uint64_t RBSBoolForKey(void *a1, uint64_t a2)
{
  char v2 = [a1 objectForKey:a2];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t RBSPIDIsBeingDebugged(int a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1 < 1) {
    return 0;
  }
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  BOOL v1 = _RBShortBSDProcessInfoForPID(a1, v3);
  return *(_DWORD *)&v1 & ((v4 & 2) >> 1);
}

void RBSDispatchQueueAssert(void *a1)
{
  BOOL v1 = a1;
  uint64_t v3 = v1;
  if (v1 == MEMORY[0x1E4F14428])
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      char v2 = (void *)MEMORY[0x1E4F14428];
      dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    }
  }
  else
  {
    dispatch_assert_queue_V2(v1);
  }
}

BOOL RBSIsBinaryCatalystOriOS(int a1)
{
  int buffer = 0;
  if (proc_pidinfo(a1, 30, 0, &buffer, 4) == 4) {
    return (buffer & 0xFFFFFFFB) == 2;
  }
  uint64_t v3 = rbs_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    RBSIsBinaryCatalystOriOS_cold_1(a1, v3);
  }

  return 0;
}

id RBSContainedExtensionBundleIDs(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  char v2 = [MEMORY[0x1E4F1CA80] setWithObject:v1];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:0];
  long long v4 = rbs_general_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = [v3 applicationExtensionRecords];
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = [v6 count];
      __int16 v22 = 2112;
      id v23 = v1;
      _os_log_impl(&dword_191FE8000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu extensions contained in %@", buf, 0x16u);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v4 = objc_msgSend(v3, "applicationExtensionRecords", 0);
    uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v4);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = rbs_general_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            RBSContainedExtensionBundleIDs_cold_1(buf, v11, &v21, v12);
          }

          id v13 = [v11 bundleIdentifier];
          [v2 addObject:v13];
        }
        uint64_t v8 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = (uint64_t)v1;
    _os_log_impl(&dword_191FE8000, v4, OS_LOG_TYPE_DEFAULT, "failed to get LSApplicationRecord for %@ - probably OK", buf, 0xCu);
  }

  return v2;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
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

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id rbs_best_effort_networking_log()
{
  if (rbs_best_effort_networking_log_onceToken != -1) {
    dispatch_once(&rbs_best_effort_networking_log_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)rbs_best_effort_networking_log___logger;
  return v0;
}

uint64_t __rbs_best_effort_networking_log_block_invoke()
{
  rbs_best_effort_networking_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "best_effort_networking");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_job_log_block_invoke()
{
  rbs_job_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "job");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_job_oversize_log_block_invoke()
{
  rbs_job_oversize_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "job_oversize");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_power_log_block_invoke()
{
  rbs_power_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "power");
  return MEMORY[0x1F41817F8]();
}

id rbs_resource_log()
{
  if (rbs_resource_log_onceToken != -1) {
    dispatch_once(&rbs_resource_log_onceToken, &__block_literal_global_28);
  }
  id v0 = (void *)rbs_resource_log___logger;
  return v0;
}

uint64_t __rbs_resource_log_block_invoke()
{
  rbs_resource_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "resource");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_state_log_block_invoke()
{
  rbs_state_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "state");
  return MEMORY[0x1F41817F8]();
}

id rbs_system_log()
{
  if (rbs_system_log_onceToken != -1) {
    dispatch_once(&rbs_system_log_onceToken, &__block_literal_global_34);
  }
  id v0 = (void *)rbs_system_log___logger;
  return v0;
}

uint64_t __rbs_system_log_block_invoke()
{
  rbs_system_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "system");
  return MEMORY[0x1F41817F8]();
}

id rbs_test_log()
{
  if (rbs_test_log_onceToken != -1) {
    dispatch_once(&rbs_test_log_onceToken, &__block_literal_global_40);
  }
  id v0 = (void *)rbs_test_log___logger;
  return v0;
}

uint64_t __rbs_test_log_block_invoke()
{
  rbs_test_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "test");
  return MEMORY[0x1F41817F8]();
}

id rbs_coder_log()
{
  if (rbs_coder_log_onceToken != -1) {
    dispatch_once(&rbs_coder_log_onceToken, &__block_literal_global_43);
  }
  id v0 = (void *)rbs_coder_log___logger;
  return v0;
}

uint64_t __rbs_coder_log_block_invoke()
{
  rbs_coder_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "coder");
  return MEMORY[0x1F41817F8]();
}

id rbs_adapter_log()
{
  if (rbs_adapter_log_onceToken != -1) {
    dispatch_once(&rbs_adapter_log_onceToken, &__block_literal_global_46);
  }
  id v0 = (void *)rbs_adapter_log___logger;
  return v0;
}

uint64_t __rbs_adapter_log_block_invoke()
{
  rbs_adapter_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "adapter");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_jetsam_log_block_invoke()
{
  rbs_jetsam_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "jetsam");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_ttl_log_block_invoke()
{
  rbs_ttl_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "ttl");
  return MEMORY[0x1F41817F8]();
}

id rbs_sp_telemetry_log()
{
  if (rbs_sp_telemetry_log_onceToken != -1) {
    dispatch_once(&rbs_sp_telemetry_log_onceToken, &__block_literal_global_58);
  }
  id v0 = (void *)rbs_sp_telemetry_log___logger;
  return v0;
}

uint64_t __rbs_sp_telemetry_log_block_invoke()
{
  rbs_sp_telemetry_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "sp_telemetry");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_sp_assertion_log_block_invoke()
{
  rbs_sp_assertion_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "sp_assertion");
  return MEMORY[0x1F41817F8]();
}

uint64_t __rbs_sp_state_log_block_invoke()
{
  rbs_sp_state_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "sp_state");
  return MEMORY[0x1F41817F8]();
}

id rbs_sp_therm_log()
{
  if (rbs_sp_therm_log_onceToken != -1) {
    dispatch_once(&rbs_sp_therm_log_onceToken, &__block_literal_global_67);
  }
  id v0 = (void *)rbs_sp_therm_log___logger;
  return v0;
}

uint64_t __rbs_sp_therm_log_block_invoke()
{
  rbs_sp_therm_log___logger = (uint64_t)os_log_create("com.apple.runningboard", "sp_therm");
  return MEMORY[0x1F41817F8]();
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

void sub_192014574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t a1)
{
  return MEMORY[0x1F40E7228](v2, v1, a1);
}

void sub_192017030(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v3 = objc_begin_catch(exception_object);
      objc_exception_rethrow();
    }
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
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

void __RBSDaemonDidStart(uint64_t a1, uint64_t a2)
{
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

uint64_t RBSMachPortType(mach_port_name_t name)
{
  mach_port_type_t ptype = 0;
  if (mach_port_type(*MEMORY[0x1E4F14960], name, &ptype))
  {
    uint64_t v1 = rbs_general_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      RBSMachPortType_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  return ptype;
}

BOOL RBSMachPortIsType(mach_port_name_t a1, int a2)
{
  return a1 - 1 <= 0xFFFFFFFD && (RBSMachPortType(a1) & a2) != 0;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

id _RBSEndowmentUnwrapTypeAndDecodeWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  if (!v3)
  {
    uint64_t v10 = 0;
    goto LABEL_21;
  }
  uint64_t v5 = MEMORY[0x192FECA30](v3);
  if (v5 == MEMORY[0x1E4F145D8])
  {
    id v9 = v3;
    uint64_t v8 = 1;
    goto LABEL_17;
  }
  if (v5 == MEMORY[0x1E4F14600])
  {
    id v9 = v3;
    uint64_t v8 = 2;
    goto LABEL_17;
  }
  if (v5 == MEMORY[0x1E4F145A0])
  {
    id v9 = v3;
    uint64_t v8 = 3;
    goto LABEL_17;
  }
  if (v5 == MEMORY[0x1E4F14568] && xpc_array_get_count(v3) == 2)
  {
    uint64_t v6 = xpc_array_get_value(v3, 0);
    if (MEMORY[0x192FECA30]() == MEMORY[0x1E4F145F8] && (uint64_t value = xpc_uint64_get_value(v6), value - 4 <= 2))
    {
      uint64_t v8 = value;
      xpc_array_get_value(v3, 1uLL);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = 0;
      id v9 = 0;
    }

LABEL_17:
    uint64_t v10 = 0;
    if (v8 && v9)
    {
      uint64_t v10 = v4[2](v4, v8, v9);
    }
    goto LABEL_20;
  }
  id v9 = 0;
  uint64_t v10 = 0;
LABEL_20:

LABEL_21:
  return v10;
}

uint64_t __RBSEndowmentEncode_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = RBSEndowmentEncode(a2);
  if (v6) {
    xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
  }
  else {
    *a4 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

void __RBSEndowmentEncode_block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = RBSEndowmentEncode(v7);
    if (v8) {
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), (const char *)[v9 UTF8String], v8);
    }
    else {
      *a4 = 1;
    }
  }
}

id RBSEndowmentDecode(void *a1)
{
  return _RBSEndowmentUnwrapTypeAndDecodeWithBlock(a1, &__block_literal_global_10);
}

id __RBSEndowmentDecode_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  switch(a2)
  {
    case 1:
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_6;
    case 2:
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v4)];
      goto LABEL_6;
    case 3:
      id v7 = objc_alloc_init(MEMORY[0x1E4F292A0]);
      [v7 _setEndpoint:v5];
      break;
    case 4:
      uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
LABEL_6:
      id v7 = (id)v6;
      break;
    case 5:
      size_t count = xpc_array_get_count(v4);
      id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __RBSEndowmentDecode_block_invoke_2;
      applier[3] = &unk_1E5741768;
      id v10 = v9;
      id v21 = v10;
      xpc_array_apply(v5, applier);
      if (count == [v10 count]) {
        id v7 = (id)[v10 copy];
      }
      else {
        id v7 = 0;
      }
      id v13 = v21;
      goto LABEL_16;
    case 6:
      size_t v11 = xpc_dictionary_get_count(v4);
      id v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v11];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      long long v17 = __RBSEndowmentDecode_block_invoke_3;
      long long v18 = &unk_1E5741790;
      id v10 = v12;
      id v19 = v10;
      xpc_dictionary_apply(v5, &v15);
      if (v11 == objc_msgSend(v10, "count", v15, v16, v17, v18)) {
        id v7 = (id)[v10 copy];
      }
      else {
        id v7 = 0;
      }
      id v13 = v19;
LABEL_16:

      break;
    default:
      id v7 = 0;
      break;
  }

  return v7;
}

BOOL __RBSEndowmentDecode_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = _RBSEndowmentUnwrapTypeAndDecodeWithBlock(a3, &__block_literal_global_10);
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  return v4 != 0;
}

BOOL __RBSEndowmentDecode_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = _RBSEndowmentUnwrapTypeAndDecodeWithBlock(a3, &__block_literal_global_10);
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [NSString stringWithUTF8String:a2];
    [v6 setObject:v5 forKey:v7];
  }
  return v5 != 0;
}

void ___personalPersonaString_block_invoke()
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class())
  {
    id v0 = [MEMORY[0x1E4FB3718] personaAttributesForPersonaType:0];
    uint64_t v1 = [v0 userPersonaUniqueString];
  }
  else
  {
    uint64_t v1 = 0;
  }
  uint64_t v2 = (void *)_personalPersonaString_personalPersonaString;
  _personalPersonaString_personalPersonaString = v1;

  if (_personalPersonaString_personalPersonaString)
  {
    uid_t v3 = 0x7FFFFFFF;
  }
  else
  {
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    memset(&count[4], 0, 96);
    *(_DWORD *)size_t count = 2;
    if (kpersona_info()) {
      uid_t v3 = getuid();
    }
    else {
      uid_t v3 = HIDWORD(v28);
    }
    id v4 = malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
    *(void *)size_t count = 4;
    if ((kpersona_find_by_type() & 0x80000000) != 0)
    {
      uint64_t v6 = rbs_general_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *__error();
        *(_DWORD *)buf = 67109120;
        int v30 = v7;
        _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_DEFAULT, "RBSProcessIdentity: kpersona_find_by_type() failed: %d", buf, 8u);
      }

LABEL_14:
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v5 = *(void *)count;
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v28 = 0;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v13 = 0u;
        memset(&count[4], 0, 96);
        *(_DWORD *)size_t count = 2;
        if (!__PAIR64__(v3, kpersona_info())) {
          break;
        }
        if (v5 == ++v11) {
          goto LABEL_14;
        }
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", &count[88], *(void *)count, *(_OWORD *)&count[8], *(_OWORD *)&count[24], *(_OWORD *)&count[40], *(_OWORD *)&count[56], *(_OWORD *)&count[72]);
    }
    free(v4);
    id v9 = (void *)_personalPersonaString_personalPersonaString;
    _personalPersonaString_personalPersonaString = v8;
  }
  id v10 = rbs_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)size_t count = 67109378;
    *(_DWORD *)&count[4] = v3;
    *(_WORD *)&count[8] = 2114;
    *(void *)&count[10] = _personalPersonaString_personalPersonaString;
    _os_log_impl(&dword_191FE8000, v10, OS_LOG_TYPE_DEFAULT, "RBSProcessIdentity calculated session %u, persona %{public}@ for persona matching for this process", count, 0x12u);
  }
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

__CFString *NSStringFromRBSGPURole(unsigned int a1)
{
  if (a1 > 4) {
    return @"(undefined)";
  }
  else {
    return off_1E5741840[(char)a1];
  }
}

unint64_t RBSRoleFromDarwinRole(unsigned int a1)
{
  unint64_t v1 = 0x2030504040704uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 4;
  }
  return v1 & 7;
}

BOOL RBSPreventLaunchStateIsPrevented(int a1)
{
  return a1 == 2;
}

__CFString *NSStringFromRBSPreventLaunchState(unsigned int a1)
{
  if (a1 > 2) {
    return @"(undefined)";
  }
  else {
    return off_1E5741868[(char)a1];
  }
}

void RBSCaptureStateToFile(NSObject *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = rbs_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v39 = a1;
    _os_log_impl(&dword_191FE8000, v2, OS_LOG_TYPE_DEFAULT, "RunningBoard capturing state to file %s", buf, 0xCu);
  }

  uid_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [NSString stringWithUTF8String:a1];
  uint64_t v5 = [v4 stringByDeletingLastPathComponent];

  if ([v3 fileExistsAtPath:v5])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    do
    {
      uint64_t v8 = v6;
      uint64_t v9 = +[RBSConnection sharedInstance];
      id v37 = 0;
      id v10 = [v9 captureStateForSubsystem:0 error:&v37];
      uint64_t v6 = v37;

      if (v10) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v7 >= 2;
      }
      ++v7;
    }
    while (!v11);
    if (v10)
    {
      id v12 = [NSString stringWithUTF8String:a1];
      id v36 = v6;
      [v10 writeToFile:v12 atomically:0 encoding:4 error:&v36];
      long long v13 = v36;

      if (v13)
      {
        uint64_t v14 = [v13 code];
        long long v15 = rbs_general_log();
        long long v16 = v15;
        if (v14 == 28)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v39 = v13;
            _os_log_impl(&dword_191FE8000, v16, OS_LOG_TYPE_DEFAULT, "RBSCaptureStateToFile writeToFile failed with expected error %{public}@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          RBSCaptureStateToFile_cold_3((uint64_t)v13, v16, v30, v31, v32, v33, v34, v35);
        }

        uint64_t v6 = v13;
      }
      else
      {
        uint64_t v6 = rbs_general_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v39 = a1;
          _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_DEFAULT, "RunningBoard successfully captured state to file %s", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!v6) {
        RBSCaptureStateToFile_cold_1();
      }
      long long v23 = rbs_general_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        RBSCaptureStateToFile_cold_2((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  else
  {
    id v10 = rbs_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      RBSCaptureStateToFile_cold_4((uint64_t)v5, v10, v17, v18, v19, v20, v21, v22);
    }
  }
}

void sub_192023604(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

BOOL RBSXPCEqualDates(void *a1, void *a2)
{
  id v3 = a2;
  [a1 timeIntervalSinceReferenceDate];
  double v5 = v4;
  [v3 timeIntervalSinceReferenceDate];
  double v7 = v6;

  return vabdd_f64(v5, v7) < 0.00001;
}

__CFString *nsObjFromXPCObj(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (const _xpc_type_s *)MEMORY[0x192FECA30]();
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"(%s)", xpc_type_get_name(v2));
  if (v2 != (const _xpc_type_s *)MEMORY[0x1E4F14570])
  {
    if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F145C0])
    {
      uint64_t v5 = [objc_alloc(NSNumber) initWithLongLong:xpc_int64_get_value(v1)];
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F145F8])
    {
      uint64_t v5 = [objc_alloc(NSNumber) initWithUnsignedLongLong:xpc_uint64_get_value(v1)];
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14598])
    {
      uint64_t v5 = [objc_alloc(NSNumber) initWithDouble:xpc_double_get_value(v1)];
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14588])
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)xpc_date_get_value(v1) / 1000000000.0];
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14580])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      uint64_t v5 = [v8 initWithBytes:bytes_ptr length:xpc_data_get_length(v1)];
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F145F0])
    {
      uint64_t v5 = [[NSString alloc] initWithCString:xpc_string_get_string_ptr(v1) encoding:4];
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14600])
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v1)];
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14590])
    {
      uint64_t v5 = dictFromXPCDict(v1);
    }
    else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14568])
    {
      uint64_t v5 = arrayFromXPCArray(v1);
    }
    else
    {
      if (v2 != (const _xpc_type_s *)MEMORY[0x1E4F145A8]) {
        goto LABEL_30;
      }
      id v4 = [NSString alloc];
      uint64_t v5 = objc_msgSend(v4, "initWithFormat:", @"%s", xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E4F14530]));
    }
    double v7 = (__CFString *)v5;
    if (v5) {
      goto LABEL_27;
    }
LABEL_30:
    double v7 = v3;
    goto LABEL_31;
  }
  if (v1 == (id)MEMORY[0x1E4F14518]) {
    double v6 = @"true";
  }
  else {
    double v6 = @"false";
  }
  double v7 = v6;
LABEL_27:
  if (v2 != (const _xpc_type_s *)MEMORY[0x1E4F14590] && v2 != (const _xpc_type_s *)MEMORY[0x1E4F14568])
  {
    uint64_t v10 = [[NSString alloc] initWithFormat:@"%@: %@", v3, v7];

    double v7 = (__CFString *)v10;
  }
LABEL_31:

  return v7;
}

id dictFromXPCDict(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __dictFromXPCDict_block_invoke;
  applier[3] = &unk_1E5741790;
  id v3 = v2;
  id v6 = v3;
  xpc_dictionary_apply(v1, applier);

  return v3;
}

id arrayFromXPCArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __arrayFromXPCArray_block_invoke;
  applier[3] = &unk_1E5741768;
  id v3 = v2;
  id v6 = v3;
  xpc_array_apply(v1, applier);

  return v3;
}

uint64_t __dictFromXPCDict_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = nsObjFromXPCObj(a3);
  id v6 = *(void **)(a1 + 32);
  double v7 = [NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

uint64_t __arrayFromXPCArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = nsObjFromXPCObj(a3);
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a2];

  return 1;
}

id _service()
{
  if (_service_onceToken != -1) {
    dispatch_once(&_service_onceToken, &__block_literal_global_14);
  }
  id v0 = (void *)__service;
  return v0;
}

void ___service_block_invoke()
{
  if (!__service)
  {
    __service = +[RBSConnection sharedInstance];
    MEMORY[0x1F41817F8]();
  }
}

id rbs_set_assertion_adapter_service(void *a1)
{
  id v1 = a1;
  id v2 = (id)__service;
  id v3 = (void *)__service;
  __service = (uint64_t)v1;
  id v4 = v1;

  return v2;
}

id _assertionMap()
{
  if (_assertionMap_onceToken != -1) {
    dispatch_once(&_assertionMap_onceToken, &__block_literal_global_2_0);
  }
  id v0 = (void *)_assertionMap_map;
  return v0;
}

uint64_t ___assertionMap_block_invoke()
{
  _assertionMap_map = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

id rbs_assertion_adapter_assertion_for_id(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  id v2 = _assertionMap();
  id v3 = (void *)[objc_alloc(NSNumber) initWithLongLong:a1];
  id v4 = [v2 objectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  return v4;
}

uint64_t rbs_assertion_adapter_assertion_count()
{
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  id v0 = _assertionMap();
  uint64_t v1 = [v0 count];
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  return v1;
}

id _lock_nextID()
{
  ++_lock_nextID_counter;
  id v0 = objc_alloc(NSNumber);
  uint64_t v1 = (void *)[v0 initWithLongLong:_lock_nextID_counter];
  return v1;
}

uint64_t rbs_acquire_domain_assertion(uint64_t a1, uint64_t a2, int a3)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = a2;
  return rbs_acquire_domain_assertion_list(a1, (uint64_t)v4, 1, a3);
}

uint64_t rbs_acquire_domain_assertion_list(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4 < 1) {
    return 0;
  }
  uint64_t v30 = [NSString stringWithUTF8String:a1];
  double v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:", a1);
  uint64_t v9 = +[RBSAcquisitionCompletionAttribute attributeWithCompletionPolicy:1];
  uint64_t v10 = v7;
  [v7 addObject:v9];

  if (a3 < 1)
  {
    long long v16 = v8;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 8 * a3;
    do
    {
      long long v13 = [NSString stringWithUTF8String:*(void *)(a2 + v11)];
      uint64_t v14 = +[RBSDomainAttribute attributeWithDomain:v30 name:v13];
      [v7 addObject:v14];

      if (v11) {
        long long v15 = @",%@";
      }
      else {
        long long v15 = @"%@";
      }
      long long v16 = objc_msgSend(v8, "stringByAppendingFormat:", v15, v13);

      v11 += 8;
      id v8 = v16;
    }
    while (v12 != v11);
  }
  uint64_t v18 = [v16 stringByAppendingString:@"}"];

  uint64_t v19 = +[RBSTarget targetWithPid:a4];
  uint64_t v20 = [RBSAssertion alloc];
  uint64_t v21 = +[RBSAssertionDescriptor descriptorWithIdentifier:0 target:v19 explanation:v18 attributes:v7];
  uint64_t v22 = _service();
  id v23 = [(RBSAssertion *)v20 _initWithDescriptor:v21 service:v22];

  id v31 = 0;
  LOBYTE(v22) = [v23 acquireWithError:&v31];
  id v24 = v31;
  if (v22)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    uint64_t v25 = _assertionMap();
    uint64_t v26 = _lock_nextID();
    [v25 setObject:v23 forKey:v26];
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    uint64_t v27 = (void *)v30;
  }
  else
  {
    uint64_t v25 = rbs_assertion_log();
    uint64_t v27 = (void *)v30;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      rbs_acquire_domain_assertion_list_cold_1((uint64_t)v18, (uint64_t)v24, v25);
    }
    uint64_t v26 = &unk_1EE2F2E38;
  }

  uint64_t v17 = [v26 longLongValue];
  return v17;
}

void rbs_invalidate_domain_assertion(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  id v2 = _assertionMap();
  id v3 = (void *)[objc_alloc(NSNumber) initWithLongLong:a1];
  id v4 = [v2 objectForKey:v3];
  if (v4)
  {
    [v2 removeObjectForKey:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    [v4 invalidate];
  }
  else
  {
    uint64_t v5 = rbs_assertion_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      rbs_invalidate_domain_assertion_cold_1(a1, v5);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
}

void sub_19202529C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_192025BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_192025D14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey_cold_1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromClass(a1);
  int v6 = 136315650;
  double v7 = "RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey";
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_191FE8000, a3, OS_LOG_TYPE_ERROR, "%s the encoded object for class %{public}@ failed to decode with error %{public}@", (uint8_t *)&v6, 0x20u);
}

void RBSAtomicGetFlag_cold_1()
{
  __assert_rtn("RBSAtomicGetFlag", "RBSUtilities.m", 29, "value && (sizeof(int32_t) == sizeof(*value))");
}

void RBSAtomicSetFlag_cold_1()
{
  __assert_rtn("RBSAtomicSetFlag", "RBSUtilities.m", 36, "value && (sizeof(int32_t) == sizeof(*value))");
}

void _RBShortBSDProcessInfoForPID_cold_1(int a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = __error();
  uint64_t v5 = strerror(*v4);
  v6[0] = 67109378;
  v6[1] = a1;
  __int16 v7 = 2082;
  __int16 v8 = v5;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "Unable to get short BSD proc info for %d: %{public}s", (uint8_t *)v6, 0x12u);
}

void RBSExecutablePathForPID_cold_1(int a1)
{
  RBSandboxCanGetProcessInfo(a1);
  OUTLINED_FUNCTION_0_0(&dword_191FE8000, v1, v2, "RBSExecutablePathForPID denied for pid %d sandbox access %d", v3, v4, v5, v6, 0);
}

void RBSExecutablePathForPID_cold_2()
{
  __error();
  OUTLINED_FUNCTION_0_0(&dword_191FE8000, v0, v1, "proc_pidpath failed for %d with errno %d", v2, v3, v4, v5, 0);
}

void RBSAuditTokenRepresentsPlatformBinary_cold_1(_OWORD *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v3 = a1[1];
  *(_OWORD *)v5.val = *a1;
  *(_OWORD *)&v5.val[4] = v3;
  pid_t v4 = audit_token_to_pid(&v5);
  v5.val[0] = 67109120;
  v5.val[1] = v4;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken failed for %d", (uint8_t *)&v5, 8u);
}

void RBSIsBinaryCatalystOriOS_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "Error getting platform info for pid %d", (uint8_t *)v2, 8u);
}

void RBSContainedExtensionBundleIDs_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  __int16 v7 = [a2 bundleIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_191FE8000, a4, OS_LOG_TYPE_DEBUG, "Adding %@ to terminate predicate", a1, 0xCu);
}

void _RBSXPCEncodeObjectForKey_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_191FE8000, "Exception thrown while encoding object of class %{public}@: %{public}@", v4, v5);
}

void _BSXPCDecodeObjectFromContext_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_191FE8000, "Exception thrown while decoding class %{public}@: %{public}@", v4, v5);
}

void _BSXPCDecodeObjectFromContext_cold_2()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = (void *)v1;
  OUTLINED_FUNCTION_0_2(v1, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_191FE8000, "Decoded object class %{public}@ does not match expected class %{public}@", v5, v6);
}

void _BSXPCDecodeObjectFromContext_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_191FE8000, a3, (uint64_t)a3, "Attempted to decode a collection (%{public}@) without specifying the class it contains", (uint8_t *)a2);
}

void _BSXPCDecodeObjectFromContext_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "Unable to decode array: an object within the array failed to decode", v2, v3, v4, v5, v6);
}

void _BSXPCDecodeObjectFromContext_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "Invalid decoding context for collection", v2, v3, v4, v5, v6);
}

void _BSXPCDecodeObjectFromContext_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "No data was decoded from which to create an NSKeyedUnarchiver", v2, v3, v4, v5, v6);
}

void _BSXPCDecodeObjectFromContext_cold_8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_6(&dword_191FE8000, a2, a3, "Unable to create NSKeyedUnarchiver for data: %{public}@", (uint8_t *)&v3);
}

void _BSXPCDecodeObjectFromContext_cold_9(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_6(&dword_191FE8000, a2, a3, "Unable to decode dictionary key %{public}@", (uint8_t *)&v4);
}

void _BSXPCDecodeObjectFromContext_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "Invalid decoding context for dictionary", v2, v3, v4, v5, v6);
}

void _BSXPCDecodeObjectFromContext_cold_11()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_191FE8000, "Unable to reify class %{public}@ for expected class %{public}@", v4, v5);
}

void _BSXPCDecodeObjectFromContext_cold_12()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_191FE8000, "Decoded class %{public}@ is not compatible with expected class %{public}@", v4, v5);
}

void _BSXPCDecodeObjectFromContext_cold_13(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_191FE8000, a3, (uint64_t)a3, "No valid encoding type could be determined for expected class: %{public}@", (uint8_t *)a2);
}

void RBSMachPortType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RBSCaptureStateToFile_cold_1()
{
}

void RBSCaptureStateToFile_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RBSCaptureStateToFile_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RBSCaptureStateToFile_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void rbs_acquire_domain_assertion_list_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "Failed to acquire domain assertion %{public}@ with error %{public}@", (uint8_t *)&v3, 0x16u);
}

void rbs_invalidate_domain_assertion_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_191FE8000, a2, OS_LOG_TYPE_FAULT, "Unknown rbs_domain_assertion_id_t %llu, can not invalidate", (uint8_t *)&v2, 0xCu);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1F40F7180](task);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1F40D8C38]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSOrderedSet()
{
  return MEMORY[0x1F40D94D0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1F40D94D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void abort(void)
{
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1F40CA1F8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2B8](atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2C8](atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2D0](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2D8](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2F0](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2F8](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E300](atoken);
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1F40CC730]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1F40CC740]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
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

void objc_exception_rethrow(void)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1F40CE480](*(void *)&target_tport, *(void *)&pid, tn);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1F40CEB30]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x1F40CEB40]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1F40CEB50]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CED00](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1F40CEDA8](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1F40CEDF0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1F40CEE58]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40CEF00](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1F40CEF18]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

uint64_t xpc_endpoint_create_bs_from_port()
{
  return MEMORY[0x1F40CF020]();
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

uint64_t xpc_get_class4NSXPC()
{
  return MEMORY[0x1F40CF128]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1F40CF158](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1F40CF1C0]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1F40CF1C8]();
}

uint64_t xpc_mach_send_create_with_disposition()
{
  return MEMORY[0x1F40CF1D0]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x1F40CF1D8]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1F40CF310](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1F40CF360](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}
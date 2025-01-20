@interface UniKernelInternal
- (CIKernel)ck;
- (MTLComputePipelineState)mk;
- (NSArray)arguments;
- (NSDictionary)constants;
- (UniKernelInternal)initWithName:(id)a3 library:(id)a4 constants:(id)a5;
- (UniKernelInternal)initWithName:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7;
- (id)_dictToConstants:(id)a3 functionConstants:(id)a4 name:(id)a5;
- (id)roiCallback;
- (void)setArguments:(id)a3;
- (void)setCk:(id)a3;
- (void)setConstants:(id)a3;
- (void)setMk:(id)a3;
- (void)setRoiCallback:(id)a3;
@end

@implementation UniKernelInternal

- (id)_dictToConstants:(id)a3 functionConstants:(id)a4 name:(id)a5
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v120 = a5;
  if (v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F128B0]);
    v10 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v13 = objc_msgSend_count(v7, v11, v12);
    v15 = objc_msgSend_dictionaryWithCapacity_(v10, v14, v13);
    v18 = objc_msgSend_set(MEMORY[0x263EFF9C0], v16, v17);
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v116 = v8;
    id v19 = v8;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v142, v152, 16);
    v127 = v19;
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v143;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v143 != v24) {
            objc_enumerationMutation(v19);
          }
          uint64_t v26 = *(void *)(*((void *)&v142 + 1) + 8 * i);
          v27 = objc_msgSend_objectForKeyedSubscript_(v19, v22, v26);
          if (objc_msgSend_required(v27, v28, v29)) {
            objc_msgSend_addObject_(v18, v30, v26);
          }

          id v19 = v127;
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v127, v22, (uint64_t)&v142, v152, 16);
      }
      while (v23);
    }

    v31 = (void *)MEMORY[0x263EFFA08];
    v34 = objc_msgSend_allKeys(v19, v32, v33);
    v36 = objc_msgSend_setWithArray_(v31, v35, (uint64_t)v34);

    v37 = (void *)MEMORY[0x263EFFA08];
    v40 = objc_msgSend_allKeys(v7, v38, v39);
    uint64_t v42 = objc_msgSend_setWithArray_(v37, v41, (uint64_t)v40);

    v118 = (void *)v42;
    v119 = v36;
    if ((objc_msgSend_isEqualToSet_(v36, v43, v42) & 1) == 0)
    {
      v45 = objc_msgSend_setWithSet_(MEMORY[0x263EFF9C0], v44, (uint64_t)v36);
      objc_msgSend_minusSet_(v45, v46, (uint64_t)v118);
      v47 = uni_logger_compile();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_stringWithFormat_(NSString, v48, @"Potentially missing keys = %@", v45);
        id v49 = objc_claimAutoreleasedReturnValue();
        uint64_t v52 = objc_msgSend_UTF8String(v49, v50, v51);
        *(_DWORD *)buf = 136315138;
        uint64_t v151 = v52;
        _os_log_impl(&dword_262E0F000, v47, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
      }
    }
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v117 = v7;
    id v53 = v7;
    v55 = v127;
    uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v138, v149, 16);
    if (v126)
    {
      uint64_t v125 = *(void *)v139;
      id v123 = v53;
      v124 = v18;
      v121 = v15;
      id v122 = v9;
      do
      {
        for (uint64_t j = 0; j != v126; ++j)
        {
          if (*(void *)v139 != v125) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = *(void *)(*((void *)&v138 + 1) + 8 * j);
          v59 = objc_msgSend_objectForKeyedSubscript_(v53, v56, v58);
          objc_msgSend_setObject_forKeyedSubscript_(v15, v60, (uint64_t)v59, v58);

          v62 = objc_msgSend_objectForKeyedSubscript_(v55, v61, v58);

          if (v62)
          {
            v64 = objc_msgSend_objectForKeyedSubscript_(v55, v63, v58);
            uint64_t v67 = objc_msgSend_type(v64, v65, v66);

            uint64_t v136 = 0;
            uint64_t v137 = 0;
            uint64_t v68 = numComponentsForType(v67, &v136, &v137);
            uint64_t v69 = v68;
            if (v68) {
              BOOL v70 = v136 == 0;
            }
            else {
              BOOL v70 = 1;
            }
            BOOL v71 = v70 || v137 == 0;
            if (v71 || (v73 = malloc_type_malloc(v137 * v68, 0x974C10E8uLL)) == 0)
            {
              v74 = uni_logger_compile();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                v92 = NSString;
                uint64_t v93 = v137 * v69;
                v94 = MTLDataTypeAsString(v67, v75);
                uint64_t v115 = v93;
                v55 = v127;
                objc_msgSend_stringWithFormat_(v92, v95, @"Unable to allocate %lu bytes for %lu elements of type %@ for key %@", v115, v69, v94, v58);
                id v96 = objc_claimAutoreleasedReturnValue();
                uint64_t v99 = objc_msgSend_UTF8String(v96, v97, v98);
                *(_DWORD *)buf = 136315138;
                uint64_t v151 = v99;
                _os_log_error_impl(&dword_262E0F000, v74, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);

                id v53 = v123;
              }

              v73 = 0;
            }
            uint64_t v76 = objc_msgSend_objectForKeyedSubscript_(v53, v72, v58);
            v77 = (void *)v76;
            if (v69 == 1)
            {
              if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
                sub_262E4D718();
              }
              packSingleValue(v77, 0, 0, v136, (uint64_t)v73);
            }
            else
            {
              if (!v76
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                || objc_msgSend_count(v77, v80, v81) != v69)
              {
                sub_262E4D744();
              }
              long long v134 = 0u;
              long long v135 = 0u;
              long long v132 = 0u;
              long long v133 = 0u;
              id v82 = v77;
              uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v132, v148, 16);
              if (v84)
              {
                uint64_t v85 = v84;
                uint64_t v86 = 0;
                uint64_t v87 = *(void *)v133;
                do
                {
                  for (uint64_t k = 0; k != v85; ++k)
                  {
                    if (*(void *)v133 != v87) {
                      objc_enumerationMutation(v82);
                    }
                    packSingleValue(*(void **)(*((void *)&v132 + 1) + 8 * k), v86 + k, 0, v136, (uint64_t)v73);
                  }
                  uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v89, (uint64_t)&v132, v148, 16);
                  v86 += k;
                }
                while (v85);
              }

              v15 = v121;
              id v9 = v122;
              v55 = v127;
              id v53 = v123;
            }

            objc_msgSend_setConstantValue_type_withName_(v9, v90, (uint64_t)v73, v67, v58);
            free(v73);
            v18 = v124;
            objc_msgSend_removeObject_(v124, v91, v58);
          }
          else
          {
            v78 = uni_logger_compile();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_stringWithFormat_(NSString, v79, @"%@ is not a valid function constant for %@", v58, v120);
              id v100 = objc_claimAutoreleasedReturnValue();
              uint64_t v103 = objc_msgSend_UTF8String(v100, v101, v102);
              *(_DWORD *)buf = 136315138;
              uint64_t v151 = v103;
              _os_log_error_impl(&dword_262E0F000, v78, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
            }
          }
        }
        uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v138, v149, 16);
      }
      while (v126);
    }

    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v104 = v18;
    uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v128, v147, 16);
    v108 = v104;
    if (v106)
    {
      uint64_t v109 = v106;
      uint64_t v110 = *(void *)v129;
      while (2)
      {
        for (uint64_t m = 0; m != v109; ++m)
        {
          if (*(void *)v129 != v110) {
            objc_enumerationMutation(v104);
          }
          if (*(void *)(*((void *)&v128 + 1) + 8 * m))
          {

            v108 = uni_logger_compile();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
              sub_262E4D674((uint64_t)v120, (const char *)v104);
            }
            goto LABEL_65;
          }
        }
        uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v128, v147, 16);
        if (v109) {
          continue;
        }
        break;
      }
      v108 = v104;
    }
LABEL_65:

    v146[0] = v9;
    v146[1] = v15;
    v112 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v113, (uint64_t)v146, 2);

    id v8 = v116;
    id v7 = v117;
  }
  else
  {
    v112 = 0;
  }

  return v112;
}

- (UniKernelInternal)initWithName:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v79.receiver = self;
  v79.super_class = (Class)UniKernelInternal;
  uint64_t v17 = [(UniKernelInternal *)&v79 init];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v18 = uni_activity();
  id v19 = _os_activity_create(&dword_262E0F000, "compile", v18, OS_ACTIVITY_FLAG_DEFAULT);

  os_activity_scope_enter(v19, &state);
  if (!v17) {
    goto LABEL_25;
  }
  uint64_t v21 = objc_msgSend_newFunctionWithName_(v13, v20, (uint64_t)v12);
  uint64_t v24 = v21;
  BOOL v71 = v19;
  id v72 = v15;
  if (!v16)
  {
    objc_msgSend_setConstants_(v17, v22, 0);
LABEL_9:
    BOOL v70 = 0;
    v73 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_10;
  }
  v25 = objc_msgSend_functionConstantsDictionary(v21, v22, v23);

  if (!v25) {
    goto LABEL_9;
  }
  v28 = objc_msgSend_functionConstantsDictionary(v24, v26, v27);
  v30 = objc_msgSend__dictToConstants_functionConstants_name_(v17, v29, (uint64_t)v16, v28, v12);

  objc_msgSend_setConstants_(v17, v31, (uint64_t)v16);
  if (!v30) {
    goto LABEL_9;
  }
  uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v30, v26, 0);
  v73 = objc_msgSend_objectAtIndexedSubscript_(v30, v33, 1);
  BOOL v70 = v30;
  if (v15 && v32)
  {
    uint64_t v77 = 0;
    id v34 = v15;
    v35 = (id *)&v77;
    uint64_t v69 = (void *)v32;
    uint64_t v36 = objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v13, v26, (uint64_t)v12, v32, v34, &v77);
    goto LABEL_28;
  }
  if (v32)
  {
    uint64_t v76 = 0;
    v35 = (id *)&v76;
    uint64_t v69 = (void *)v32;
    uint64_t v36 = objc_msgSend_newFunctionWithName_constantValues_error_(v13, v26, (uint64_t)v12, v32, &v76);
LABEL_28:
    v37 = (void *)v36;
    id v39 = *v35;

    id v15 = v72;
    if (v37)
    {
      if (v39)
      {
        uni_logger_compile();
        uint64_t v67 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR)) {
          sub_262E4D79C((uint64_t)v39, v67);
        }
      }
      goto LABEL_12;
    }
LABEL_33:
    sub_262E4D770();
  }
LABEL_10:
  v37 = objc_msgSend_newFunctionWithName_(v13, v26, (uint64_t)v12);

  if (!v37) {
    goto LABEL_33;
  }
  uint64_t v69 = 0;
  id v39 = 0;
LABEL_12:
  id v40 = v16;
  id v68 = v13;
  if (v14)
  {
    v41 = objc_msgSend_kernelWithFunctionName_constants_(v14, v38, (uint64_t)v12, v73);
    objc_msgSend_setCk_(v17, v42, (uint64_t)v41);
  }
  id v43 = v14;
  v75 = 0;
  v44 = objc_opt_new();
  objc_msgSend_setComputeFunction_(v44, v45, (uint64_t)v37);
  objc_msgSend_setLabel_(v44, v46, (uint64_t)v12);
  objc_msgSend_setPipelineLibrary_(v44, v47, (uint64_t)v15);
  v50 = objc_msgSend_device(v37, v48, v49);
  id v74 = v39;
  uint64_t v52 = objc_msgSend_newComputePipelineStateWithDescriptor_options_reflection_error_(v50, v51, (uint64_t)v44, 3, &v75, &v74);
  id v53 = v74;

  objc_msgSend_setMk_(v17, v54, (uint64_t)v52);
  v57 = objc_msgSend_mk(v17, v55, v56);

  if (v57)
  {
    id v14 = v43;
    id v16 = v40;
    id v19 = v71;
    if (v53)
    {
      uni_logger_compile();
      v60 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR)) {
        sub_262E4D79C((uint64_t)v53, v60);
      }
    }
    v61 = objc_msgSend_arguments(v75, v58, v59, v68, v69, v70);
    objc_msgSend_setArguments_(v17, v62, (uint64_t)v61);

    objc_msgSend_arguments(v17, v63, v64);
    v65 = (char *)objc_claimAutoreleasedReturnValue();
    id v15 = v72;
    if (!v65) {
      sub_262E4D840();
    }
  }
  else
  {

    uni_logger_compile();
    v65 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR)) {
      sub_262E4D79C((uint64_t)v53, v65);
    }
    uint64_t v17 = 0;
    id v14 = v43;
    id v16 = v40;
    id v19 = v71;
    id v15 = v72;
  }

  id v13 = v68;
LABEL_25:
  os_activity_scope_leave(&state);

  return v17;
}

- (UniKernelInternal)initWithName:(id)a3 library:(id)a4 constants:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = objc_msgSend_library(v9, v11, v12);
  id v16 = objc_msgSend_coreImageLibrary(v9, v14, v15);
  id v19 = objc_msgSend_pipelineLibrary(v9, v17, v18);

  uint64_t v21 = (UniKernelInternal *)objc_msgSend_initWithName_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(self, v20, (uint64_t)v10, v13, v16, v19, v8);
  return v21;
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setArguments:(id)a3
{
}

- (CIKernel)ck
{
  return (CIKernel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCk:(id)a3
{
}

- (MTLComputePipelineState)mk
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMk:(id)a3
{
}

- (NSDictionary)constants
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConstants:(id)a3
{
}

- (id)roiCallback
{
  return self->_roiCallback;
}

- (void)setRoiCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_roiCallback, 0);
  objc_storeStrong((id *)&self->constants, 0);
  objc_storeStrong((id *)&self->mk, 0);
  objc_storeStrong((id *)&self->ck, 0);

  objc_storeStrong((id *)&self->arguments, 0);
}

@end
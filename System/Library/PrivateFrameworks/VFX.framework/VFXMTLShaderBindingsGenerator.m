@interface VFXMTLShaderBindingsGenerator
+ (void)allocateRegistry;
+ (void)deallocateRegistry;
+ (void)registerArgument:(id)a3 frequency:(int)a4 block:(id)a5;
+ (void)registerArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6;
+ (void)registerSemantic:(id)a3 withBlock:(id)a4;
+ (void)registerShadableArgumentBindingBlockForBuffers:(id)a3 textures:(id)a4 samplers:(id)a5;
+ (void)registerUserBlockTrampoline:(id)a3;
- (BOOL)addPassResourceBindingsForArgument:(id)a3;
- (VFXMTLShaderBindingsGenerator)init;
- (id)_dictionaryForFrequency:(int)a3;
- (int64_t)_searchBindings:(id)a3 forArgumentNamed:(id)a4 type:(int64_t)a5;
- (void)_checkForAssociatedSamplerOnBinding:(id)a3 argument:(id)a4;
- (void)_parseBindings:(id)a3 function:(id)a4 renderPipeline:(id)a5;
- (void)addResourceBindingsForArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6;
- (void)dealloc;
- (void)generateBindingsForPipeline:(id)a3 withReflection:(id)a4 program:(__CFXFXProgram *)a5 material:(__CFXMaterial *)a6 geometry:(__CFXGeometry *)a7 pass:(__CFXFXPass *)a8;
@end

@implementation VFXMTLShaderBindingsGenerator

+ (void)allocateRegistry
{
  if (qword_1EB9956F8) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. You can't allocate a registry twice", v2, v3, v4, v5, v6, v7, (uint64_t)"__semanticRegistry == NULL");
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  qword_1EB9956F8 = objc_msgSend_initWithCapacity_(v8, v9, 0, v10);
  id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
  qword_1EB9956E8 = objc_msgSend_initWithCapacity_(v11, v12, 0, v13);
}

+ (void)deallocateRegistry
{
  id v8 = (void *)qword_1EB9956F8;
  if (!qword_1EB9956F8)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. You can't deallocate a registry that wasn't allocated", v2, v3, v4, v5, v6, v7, (uint64_t)"__semanticRegistry != NULL");
    id v8 = (void *)qword_1EB9956F8;
  }

  qword_1EB9956F8 = 0;
  qword_1EB9956E8 = 0;
}

+ (void)registerSemantic:(id)a3 withBlock:(id)a4
{
  if (objc_msgSend_objectForKey_((void *)qword_1EB9956F8, a2, (uint64_t)a3, (uint64_t)a4)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. You can't register twice the same semantic", v6, v7, v8, v9, v10, v11, (uint64_t)"[__semanticRegistry objectForKey:semanticName] == nil");
  }
  v12 = (void *)qword_1EB9956F8;
  v14 = _Block_copy(a4);

  objc_msgSend_setObject_forKey_(v12, v13, (uint64_t)v14, (uint64_t)a3);
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  if (objc_msgSend_objectForKey_((void *)qword_1EB9956E8, a2, (uint64_t)a3, *(uint64_t *)&a4)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. You can't register twice the same argument name", v8, v9, v10, v11, v12, v13, (uint64_t)"[__argumentRegistry objectForKey:argumentName] == nil");
  }
  v14 = [VFXMTLArgumentBinder alloc];
  id v17 = (id)objc_msgSend_initWithBlock_frequency_needsRenderResource_(v14, v15, (uint64_t)a5, v6, 0);
  v18 = (void *)qword_1EB9956E8;

  objc_msgSend_setObject_forKey_(v18, v16, (uint64_t)v17, (uint64_t)a3);
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  if (objc_msgSend_objectForKey_((void *)qword_1EB9956E8, a2, (uint64_t)a3, *(uint64_t *)&a4)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. You can't register twice the same argument name", v10, v11, v12, v13, v14, v15, (uint64_t)"[__argumentRegistry objectForKey:argumentName] == nil");
  }
  v16 = [VFXMTLArgumentBinder alloc];
  id v19 = (id)objc_msgSend_initWithBlock_frequency_needsRenderResource_(v16, v17, (uint64_t)a6, v8, v7);
  v20 = (void *)qword_1EB9956E8;

  objc_msgSend_setObject_forKey_(v20, v18, (uint64_t)v19, (uint64_t)a3);
}

+ (void)registerUserBlockTrampoline:(id)a3
{
  qword_1EB995708 = (uint64_t)_Block_copy(a3);
}

+ (void)registerShadableArgumentBindingBlockForBuffers:(id)a3 textures:(id)a4 samplers:(id)a5
{
  qword_1EB995710 = (uint64_t)_Block_copy(a3);
  qword_1EB995720 = (uint64_t)_Block_copy(a4);
  qword_1EB995728 = (uint64_t)_Block_copy(a5);
}

- (VFXMTLShaderBindingsGenerator)init
{
  v20.receiver = self;
  v20.super_class = (Class)VFXMTLShaderBindingsGenerator;
  uint64_t v2 = [(VFXMTLShaderBindingsGenerator *)&v20 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_generateLock._os_unfair_lock_opaque = 0;
    id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v3->_passBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v4, v5, 16, v6);
    id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v3->_nodeBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v7, v8, 16, v9);
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v3->_frameBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v10, v11, 16, v12);
    id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v3->_shadableBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v13, v14, 16, v15);
    id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v3->_lightBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v16, v17, 16, v18);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLShaderBindingsGenerator;
  [(VFXMTLShaderBindingsGenerator *)&v3 dealloc];
}

- (int64_t)_searchBindings:(id)a3 forArgumentNamed:(id)a4 type:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v28;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(a3);
      }
      uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
      id v16 = objc_msgSend_name(v15, v9, v10, v11);
      if (objc_msgSend_isEqualToString_(v16, v17, (uint64_t)a4, v18)) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v27, (uint64_t)v31, 16);
        if (v12) {
          goto LABEL_3;
        }
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (objc_msgSend_type(v15, v9, v10, v11) == a5) {
      return objc_msgSend_index(v15, v19, v20, v21);
    }
    sub_1B63F2F54(0, @"Warning: arguments named %@ is reserved for type %d", v20, v21, v22, v23, v24, v25, (uint64_t)a4);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_parseBindings:(id)a3 function:(id)a4 renderPipeline:(id)a5
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", (uint64_t)a3, 0, (uint64_t)a5, v5, v6, v7, (uint64_t)"function");
  }
  uint64_t v11 = objc_msgSend_functionType(a4, a2, (uint64_t)a3, (uint64_t)a4, a5);
  int v187 = sub_1B64D86C8(v11, v12, v13, v14, v15, v16, v17, v18);
  self->_current.stage = v187;
  v188 = self;
  self->_current.bindings = (NSArray *)a3;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v19, (uint64_t)&v197, (uint64_t)v202, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v198;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v198 != v24) {
          objc_enumerationMutation(a3);
        }
        v26 = *(void **)(*((void *)&v197 + 1) + 8 * v25);
        if (objc_msgSend_isUsed(v26, v20, v21, v22))
        {
          if (objc_msgSend_type(v26, v20, v21, v22) != 3)
          {
            if (objc_msgSend_type(v26, v20, v21, v22)
              || (long long v27 = objc_msgSend_name(v26, v20, v21, v22),
                  (objc_msgSend_hasPrefix_(v27, v28, @"vertexBuffer.", v29) & 1) == 0))
            {
              long long v30 = objc_msgSend_name(v26, v20, v21, v22);
              if ((objc_msgSend_isEqualToString_(v30, v31, @"osdIndicesBuffer", v32) & 1) == 0)
              {
                v33 = objc_msgSend_name(v26, v20, v21, v22);
                if ((objc_msgSend_isEqualToString_(v33, v34, @"osdTessellationLevel", v35) & 1) == 0)
                {
                  v36 = objc_msgSend_name(v26, v20, v21, v22);
                  if ((objc_msgSend_isEqualToString_(v36, v37, @"osdVertexBuffer", v38) & 1) == 0)
                  {
                    v39 = objc_msgSend_name(v26, v20, v21, v22);
                    if ((objc_msgSend_isEqualToString_(v39, v40, @"osdFaceVaryingData", v41) & 1) == 0)
                    {
                      v42 = objc_msgSend_name(v26, v20, v21, v22);
                      if ((objc_msgSend_isEqualToString_(v42, v43, @"osdFaceVaryingIndices", v44) & 1) == 0)
                      {
                        v45 = objc_msgSend_name(v26, v20, v21, v22);
                        if ((objc_msgSend_isEqualToString_(v45, v46, @"osdFaceVaryingPatchParams", v47) & 1) == 0)
                        {
                          v48 = objc_msgSend_name(v26, v20, v21, v22);
                          if ((objc_msgSend_isEqualToString_(v48, v49, @"osdFaceVaryingPatchArray", v50) & 1) == 0)
                          {
                            v51 = objc_msgSend_name(v26, v20, v21, v22);
                            if ((objc_msgSend_isEqualToString_(v51, v52, @"osdFaceVaryingChannelCount", v53) & 1) == 0)
                            {
                              v54 = objc_msgSend_name(v26, v20, v21, v22);
                              if ((objc_msgSend_isEqualToString_(v54, v55, @"osdFaceVaryingChannelDescriptors", v56) & 1) == 0)
                              {
                                v57 = objc_msgSend_name(v26, v20, v21, v22);
                                if ((objc_msgSend_isEqualToString_(v57, v58, @"osdFaceVaryingPatchArrayIndex", v59) & 1) == 0)
                                {
                                  v60 = objc_msgSend_name(v26, v20, v21, v22);
                                  if ((objc_msgSend_isEqualToString_(v60, v61, @"osdFaceVaryingChannelsPackedData", v62) & 1) == 0)
                                  {
                                    v63 = objc_msgSend_name(v26, v20, v21, v22);
                                    if ((objc_msgSend_isEqualToString_(v63, v64, @"vertexBuffer", v65) & 1) == 0)
                                    {
                                      v66 = objc_msgSend_name(v26, v20, v21, v22);
                                      if ((objc_msgSend_isEqualToString_(v66, v67, @"indexBuffer", v68) & 1) == 0)
                                      {
                                        v69 = objc_msgSend_name(v26, v20, v21, v22);
                                        if ((objc_msgSend_isEqualToString_(v69, v70, @"patchParamBuffer", v71) & 1) == 0)
                                        {
                                          v72 = objc_msgSend_name(v26, v20, v21, v22);
                                          if ((objc_msgSend_isEqualToString_(v72, v73, @"perPatchVertexBuffer", v74) & 1) == 0)
                                          {
                                            v75 = objc_msgSend_name(v26, v20, v21, v22);
                                            if ((objc_msgSend_isEqualToString_(v75, v76, @"patchTessBuffer", v77) & 1) == 0)
                                            {
                                              __na = (void *)qword_1EB9956E8;
                                              uint64_t v78 = objc_msgSend_name(v26, v20, v21, v22);
                                              uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(__na, v79, v78, v80);
                                              if (v81)
                                              {
                                                objc_msgSend_addResourceBindingsForArgument_frequency_needsRenderResource_block_(v188, v82, (uint64_t)v26, *(unsigned int *)(v81 + 16), *(unsigned __int8 *)(v81 + 20), *(void *)(v81 + 8));
                                                goto LABEL_60;
                                              }
                                              if (objc_msgSend_type(v26, v82, v83, v84))
                                              {
                                                if (objc_msgSend_type(v26, v85, v86, v87) == 2 && v188->_current.pass)
                                                {
LABEL_33:
                                                  if (objc_msgSend_addPassResourceBindingsForArgument_(v188, v20, (uint64_t)v26, v22))goto LABEL_60; {
                                                }
                                                  }
LABEL_34:
                                                uint64_t v88 = objc_msgSend_type(v26, v20, v21, v22);
                                                objc_msgSend_addResourceBindingsForArgument_frequency_needsRenderResource_block_(v188, v89, (uint64_t)v26, 2, 1, qword_1EB995710[v88]);
                                                goto LABEL_60;
                                              }
                                              v90 = objc_msgSend_name(v26, v85, v86, v87);
                                              if (objc_msgSend_isEqualToString_(v90, v91, @"vfx_node", v92) & 1) != 0|| (v96 = objc_msgSend_name(v26, v93, v94, v95), (objc_msgSend_isEqualToString_(v96, v97, @"vfx_nodes", v98))|| (v99 = objc_msgSend_name(v26, v93, v94, v95), objc_msgSend_isEqualToString_(v99, v100, @"vfx_lights", v101)))
                                              {
                                                nodeBindings = v188->_nodeBindings;
                                                v102 = objc_msgSend_name(v26, v93, v94, v95);
                                                if (objc_msgSend_isEqualToString_(v102, v103, @"vfx_lights", v104))nodeBindings = v188->_lightBindings; {
                                                uint64_t v108 = objc_msgSend_name(v26, v105, v106, v107);
                                                }
                                                v111 = (VFXMTLSemanticResourceBinding *)objc_msgSend_objectForKeyedSubscript_(nodeBindings, v109, v108, v110);
                                                v177 = v111;
                                                if (v111)
                                                {
                                                  v112 = v111;
                                                }
                                                else
                                                {
                                                  v177 = objc_alloc_init(VFXMTLSemanticResourceBinding);
                                                  objc_msgSend_setBinding_(v177, v116, (uint64_t)v26, v117);
                                                  if (objc_msgSend_bufferDataType(v26, v118, v119, v120) == 1)
                                                  {
                                                    __src = 0;
                                                    v195 = 0;
                                                    uint64_t v196 = 0;
                                                    long long v190 = 0u;
                                                    long long v191 = 0u;
                                                    long long v192 = 0u;
                                                    long long v193 = 0u;
                                                    v121 = objc_msgSend_bufferStructType(v26, v113, v114, v115);
                                                    id obj = (id)objc_msgSend_members(v121, v122, v123, v124);
                                                    uint64_t v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v125, (uint64_t)&v190, (uint64_t)v201, 16);
                                                    if (v180)
                                                    {
                                                      uint64_t v179 = *(void *)v191;
                                                      do
                                                      {
                                                        for (size_t __n = 0; __n != v180; ++__n)
                                                        {
                                                          if (*(void *)v191 != v179) {
                                                            objc_enumerationMutation(obj);
                                                          }
                                                          v181 = (void *)qword_1EB9956F8;
                                                          v182 = *(void **)(*((void *)&v190 + 1) + 8 * __n);
                                                          uint64_t v129 = objc_msgSend_name(v182, v126, v127, v128);
                                                          uint64_t v132 = objc_msgSend_objectForKeyedSubscript_(v181, v130, v129, v131);
                                                          if (v132)
                                                          {
                                                            long long v189 = (unint64_t)v132;
                                                            DWORD2(v189) = objc_msgSend_offset(v182, v133, v134, v135);
                                                            HIDWORD(v189) = sub_1B65D85FC(v182, v136, v137, v138);
                                                            sub_1B65D8E28(&__src, &v189);
                                                          }
                                                          else
                                                          {
                                                            uint64_t v139 = objc_msgSend_name(v182, v133, v134, v135);
                                                            sub_1B63F2F54(0, @"Warning: unknown member in vfx automated buffer : %@", v140, v141, v142, v143, v144, v145, v139);
                                                          }
                                                        }
                                                        uint64_t v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v126, (uint64_t)&v190, (uint64_t)v201, 16);
                                                      }
                                                      while (v180);
                                                    }
                                                    objc_msgSend_setSemanticsCount_(v177, v126, (v195 - (unsigned char *)__src) >> 4, v128);
                                                    if (objc_msgSend_semanticsCount(v177, v146, v147, v148))
                                                    {
                                                      uint64_t __nb = 16 * objc_msgSend_semanticsCount(v177, v149, v150, v151);
                                                      v177->_semantics = ($416A025297F085A8C4D13FE1DBBBD127 *)malloc_type_malloc(__nb, 0xAF09B7ADuLL);
                                                      memcpy(v177->_semantics, __src, __nb);
                                                      uint64_t v155 = objc_msgSend_bufferDataSize(v26, v152, v153, v154);
                                                      objc_msgSend_setBufferSize_(v177, v156, v155, v157);
                                                    }
                                                    uint64_t v158 = objc_msgSend_name(v26, v149, v150, v151);
                                                    objc_msgSend_setObject_forKeyedSubscript_(nodeBindings, v159, (uint64_t)v177, v158);
                                                    if (__src)
                                                    {
                                                      v195 = __src;
                                                      operator delete(__src);
                                                    }
                                                  }
                                                }
                                                char v160 = objc_msgSend_index(v26, v113, v114, v115);
                                                p_indices = &v177->super._indices;
                                                if (v187) {
                                                  p_indices = ($E8FEF9D34A3DFDCB69CDC2374B44012F *)&v177->super._indices.fragmentIndex;
                                                }
                                                p_indices->vertexIndex = v160;
                                              }
                                              else if (objc_msgSend_bufferDataType(v26, v93, v94, v95) == 1 {
                                                     && ((v165 = objc_msgSend_name(v26, v162, v163, v164),
                                              }
                                                          (objc_msgSend_isEqualToString_(v165, v166, @"vfx_frame", v167) & 1) != 0)|| (v168 = objc_msgSend_name(v26, v162, v163, v164), objc_msgSend_isEqualToString_(v168, v169, @"vfx_frame_multi", v170))))
                                              {
                                                char v171 = objc_msgSend_index(v26, v162, v163, v164);
                                                if (v187) {
                                                  v188->_worldBuffer.fragmentIndex = v171;
                                                }
                                                else {
                                                  v188->_worldBuffer.vertexIndex = v171;
                                                }
                                              }
                                              else
                                              {
                                                __nc = v188->_current.customBlocks;
                                                uint64_t v172 = objc_msgSend_name(v26, v162, v163, v164);
                                                uint64_t v20 = (const char *)objc_msgSend_objectForKey_(__nc, v173, v172, v174);
                                                if (!v20)
                                                {
                                                  if (v188->_current.pass
                                                    && objc_msgSend_bufferDataType(v26, 0, v21, v22) == 1)
                                                  {
                                                    goto LABEL_33;
                                                  }
                                                  goto LABEL_34;
                                                }
                                                (*(void (**)(uint64_t, const char *, void *, VFXMTLShaderBindingsGenerator *))(qword_1EB995708 + 16))(qword_1EB995708, v20, v26, v188);
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_60:
        ++v25;
      }
      while (v25 != v23);
      uint64_t v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v20, (uint64_t)&v197, (uint64_t)v202, 16);
      uint64_t v23 = v175;
    }
    while (v175);
  }
}

- (void)generateBindingsForPipeline:(id)a3 withReflection:(id)a4 program:(__CFXFXProgram *)a5 material:(__CFXMaterial *)a6 geometry:(__CFXGeometry *)a7 pass:(__CFXFXPass *)a8
{
  p_generateLock = &self->_generateLock;
  os_unfair_lock_lock(&self->_generateLock);
  self->_current.customBlocks = (NSDictionary *)sub_1B6450F7C((uint64_t)a5, v15, v16, v17, v18, v19, v20, v21);
  self->_current.pass = a8;
  if (a6) {
    sub_1B64AF488((uint64_t)a6, (uint64_t)v22, v23, v24, v25, v26, v27, v28);
  }
  self->_worldBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  if (objc_msgSend_vertexFunction(a3, v22, v23, v24))
  {
    uint64_t v32 = objc_msgSend_vertexBindings(a4, v29, v30, v31);
    uint64_t v36 = objc_msgSend_vertexFunction(a3, v33, v34, v35);
    objc_msgSend__parseBindings_function_renderPipeline_(self, v37, v32, v36, a3);
  }
  if (objc_msgSend_fragmentFunction(a3, v29, v30, v31))
  {
    uint64_t v41 = objc_msgSend_fragmentBindings(a4, v38, v39, v40);
    uint64_t v45 = objc_msgSend_fragmentFunction(a3, v42, v43, v44);
    objc_msgSend__parseBindings_function_renderPipeline_(self, v46, v41, v45, a3);
  }
  if (self->_worldBuffer.vertexIndex != 255
    || self->_worldBuffer.fragmentIndex != 255)
  {
    *((_WORD *)a3 + 4) = self->_worldBuffer;
  }
  if (objc_msgSend_count(self->_frameBindings, v38, v39, v40))
  {
    uint64_t v50 = objc_msgSend_allValues(self->_frameBindings, v47, v48, v49);
    objc_msgSend_setFrameBufferBindings_(a3, v51, v50, v52);
    objc_msgSend_removeAllObjects(self->_frameBindings, v53, v54, v55);
  }
  if (objc_msgSend_count(self->_nodeBindings, v47, v48, v49))
  {
    uint64_t v59 = objc_msgSend_allValues(self->_nodeBindings, v56, v57, v58);
    objc_msgSend_setNodeBufferBindings_(a3, v60, v59, v61);
    objc_msgSend_removeAllObjects(self->_nodeBindings, v62, v63, v64);
  }
  if (objc_msgSend_count(self->_passBindings, v56, v57, v58))
  {
    uint64_t v68 = objc_msgSend_allValues(self->_passBindings, v65, v66, v67);
    objc_msgSend_setPassBufferBindings_(a3, v69, v68, v70);
    objc_msgSend_removeAllObjects(self->_passBindings, v71, v72, v73);
  }
  if (objc_msgSend_count(self->_shadableBindings, v65, v66, v67))
  {
    uint64_t v77 = objc_msgSend_allValues(self->_shadableBindings, v74, v75, v76);
    objc_msgSend_setShadableBufferBindings_(a3, v78, v77, v79);
    objc_msgSend_removeAllObjects(self->_shadableBindings, v80, v81, v82);
  }
  if (objc_msgSend_count(self->_lightBindings, v74, v75, v76))
  {
    uint64_t v86 = objc_msgSend_allValues(self->_lightBindings, v83, v84, v85);
    objc_msgSend_setLightBufferBindings_(a3, v87, v86, v88);
    objc_msgSend_removeAllObjects(self->_lightBindings, v89, v90, v91);
  }
  uint64_t v92 = objc_msgSend_vertexBindings(a4, v83, v84, v85);
  uint64_t v96 = objc_msgSend_vertexFunction(a3, v93, v94, v95);
  objc_msgSend__computeUsageForBindings_function_(a3, v97, v92, v96);
  uint64_t v101 = objc_msgSend_fragmentBindings(a4, v98, v99, v100);
  uint64_t v105 = objc_msgSend_fragmentFunction(a3, v102, v103, v104);
  objc_msgSend__computeUsageForBindings_function_(a3, v106, v101, v105);

  os_unfair_lock_unlock(p_generateLock);
}

- (id)_dictionaryForFrequency:(int)a3
{
  if (a3 <= 3) {
    return *(Class *)((char *)&self->super.isa + qword_1B6E72A50[a3]);
  }
  return v3;
}

- (void)_checkForAssociatedSamplerOnBinding:(id)a3 argument:(id)a4
{
  uint64_t v6 = objc_msgSend_name(a4, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v9 = objc_msgSend_stringByAppendingString_(v6, v7, @"Sampler", v8);
  uint64_t v11 = objc_msgSend__searchBindings_forArgumentNamed_type_(self, v10, (uint64_t)self->_current.bindings, v9, 3);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int stage = self->_current.stage;
    if (stage == 1)
    {
      *((unsigned char *)a3 + 12) = v11;
    }
    else if (stage)
    {
      sub_1B63F2F54(16, @"Unreachable code: invalid program stage %d", v12, v13, v14, v15, v16, v17, self->_current.stage);
    }
    else
    {
      *((unsigned char *)a3 + 11) = v11;
    }
  }
}

- (void)addResourceBindingsForArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  uint64_t v10 = objc_msgSend__dictionaryForFrequency_(self, a2, *(uint64_t *)&a4, *(uint64_t *)&a4);
  uint64_t v14 = objc_msgSend_name(a3, v11, v12, v13);
  uint64_t v17 = (VFXMTLResourceBinding *)objc_msgSend_objectForKeyedSubscript_(v10, v15, v14, v16);
  if (v17)
  {
    uint64_t v21 = v17;
    uint64_t v22 = objc_msgSend_type(v17, v18, v19, v20);
    if (v22 != objc_msgSend_type(a3, v23, v24, v25))
    {
      objc_msgSend_type(a3, v26, v27, v28);
      objc_msgSend_type(v21, v29, v30, v31);
      sub_1B63F2F54(17, @"Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)", v32, v33, v34, v35, v36, v37, (uint64_t)"bufferBinding.type == argument.type");
    }
    if ((id)objc_msgSend_bindBlock(v21, v26, v27, v28) != a6) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Argument with the same name cannot have different blocks", v39, v40, v41, v42, v43, v44, (uint64_t)"(VFXArgumentBindingBlock)bufferBinding.bindBlock == block");
    }
  }
  else
  {
    uint64_t v21 = objc_alloc_init(VFXMTLResourceBinding);
    objc_msgSend_setBindBlock_(v21, v45, (uint64_t)a6, v46);
    objc_msgSend_setNeedsRenderResource_(v21, v47, v7, v48);
    objc_msgSend_setBinding_(v21, v49, (uint64_t)a3, v50);
    uint64_t v54 = objc_msgSend_name(a3, v51, v52, v53);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v55, (uint64_t)v21, v54);
  }
  int stage = self->_current.stage;
  if (stage == 1)
  {
    v21->_indices.fragmentIndex = objc_msgSend_index(a3, v38, v39, v40);
  }
  else if (stage)
  {
    sub_1B63F2F54(16, @"Unreachable code: invalid program stage %d", v39, v40, v41, v42, v43, v44, self->_current.stage);
  }
  else
  {
    v21->_indices.vertexIndex = objc_msgSend_index(a3, v38, v39, v40);
  }
  if (objc_msgSend_type(a3, v57, v58, v59) == 2)
  {
    objc_msgSend__checkForAssociatedSamplerOnBinding_argument_(self, v60, (uint64_t)v21, (uint64_t)a3);
  }
}

- (BOOL)addPassResourceBindingsForArgument:(id)a3
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend__dictionaryForFrequency_(self, a2, 3, v3);
  uint64_t v10 = objc_msgSend_name(a3, v7, v8, v9);
  uint64_t v13 = (VFXMTLPassResourceBinding *)objc_msgSend_objectForKeyedSubscript_(v6, v11, v10, v12);
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Argument with the same name cannot have different class type", v15, v16, v17, v18, v19, v20, (uint64_t)"[bufferBinding isKindOfClass:[VFXMTLPassResourceBinding class]]");
    }
    uint64_t v21 = objc_msgSend_type(v13, v14, v15, v16);
    if (v21 != objc_msgSend_type(a3, v22, v23, v24))
    {
      objc_msgSend_type(a3, v25, v26, v27);
      objc_msgSend_type(v13, v28, v29, v30);
      sub_1B63F2F54(17, @"Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)", v31, v32, v33, v34, v35, v36, (uint64_t)"bufferBinding.type == argument.type");
    }
    uint64_t v44 = v13;
    if (objc_msgSend_bindBlock(v13, v25, v26, v27))
    {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Argument with the same name cannot have different blocks", v38, v39, v40, v41, v42, v43, (uint64_t)"(VFXArgumentBindingBlock)bufferBinding.bindBlock == nil");
      uint64_t v44 = v13;
    }
  }
  else
  {
    uint64_t v44 = objc_alloc_init(VFXMTLPassResourceBinding);
    objc_msgSend_setBindBlock_(v44, v45, 0, v46);
    objc_msgSend_setNeedsRenderResource_(v44, v47, 0, v48);
    objc_msgSend_setBinding_(v44, v49, (uint64_t)a3, v50);
  }
  int stage = self->_current.stage;
  if (stage == 1)
  {
    v44->super._indices.fragmentIndex = objc_msgSend_index(a3, v37, v38, v39);
  }
  else if (stage)
  {
    sub_1B63F2F54(16, @"Unreachable code: invalid program stage %d", v38, v39, v40, v41, v42, v43, self->_current.stage);
  }
  else
  {
    v44->super._indices.vertexIndex = objc_msgSend_index(a3, v37, v38, v39);
  }
  if (objc_msgSend_type(a3, v52, v53, v54) == 2)
  {
    if (v13)
    {
LABEL_18:
      objc_msgSend__checkForAssociatedSamplerOnBinding_argument_(self, v55, (uint64_t)v44, (uint64_t)a3);
      goto LABEL_20;
    }
    pass = self->_current.pass;
    uint64_t v59 = objc_msgSend_name(a3, v55, v56, v57);
    uint64_t v66 = (__CFXFXPassInput *)sub_1B65F84B0((uint64_t)pass, v59, v60, v61, v62, v63, v64, v65);
    if (v66)
    {
      v44->_samplerInput = v66;
      goto LABEL_18;
    }
  }
  else
  {
    if (objc_msgSend_type(a3, v55, v56, v57))
    {
LABEL_20:
      if (v13)
      {
LABEL_22:
        LOBYTE(v66) = 1;
        return (char)v66;
      }
LABEL_21:
      uint64_t v70 = objc_msgSend_name(a3, v67, v68, v69);
      objc_msgSend_setObject_forKeyedSubscript_(v6, v71, (uint64_t)v44, v70);
      goto LABEL_22;
    }
    if (objc_msgSend_bufferDataType(a3, v67, v68, v69) != 1) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Only supports pass buffer arguments as struct", v73, v74, v75, v76, v77, v78, (uint64_t)"((id <MTLBufferBinding>)argument).bufferDataType == MTLDataTypeStruct");
    }
    if (v13)
    {
      uint64_t v79 = objc_msgSend_bufferSize(v44, v72, v73, v74);
      if (v79 != objc_msgSend_bufferDataSize(a3, v80, v81, v82)) {
        sub_1B63F2F54(17, @"Assertion '%s' failed. buffers of the same name in different stages need to have the same type", v83, v84, v85, v86, v87, v88, (uint64_t)"(NSUInteger)bufferBinding.bufferSize == ((id<MTLBufferBinding>)argument).bufferDataSize");
      }
      goto LABEL_22;
    }
    id v179 = a3;
    p_isa = (void **)&v44->super.super.isa;
    v178 = v6;
    __src = 0;
    v186 = 0;
    unint64_t v187 = 0;
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    v89 = objc_msgSend_bufferStructType(a3, v72, v73, v74);
    v93 = objc_msgSend_members(v89, v90, v91, v92);
    uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v181, (uint64_t)v188, 16);
    if (v98)
    {
      uint64_t v99 = *(void *)v182;
      do
      {
        for (uint64_t i = 0; i != v98; ++i)
        {
          if (*(void *)v182 != v99) {
            objc_enumerationMutation(v93);
          }
          uint64_t v101 = *(void **)(*((void *)&v181 + 1) + 8 * i);
          v102 = self->_current.pass;
          uint64_t v103 = objc_msgSend_name(v101, (const char *)v95, v96, v97);
          uint64_t v110 = (__int16 *)sub_1B65F84B0((uint64_t)v102, v103, v104, v105, v106, v107, v108, v109);
          if (v110)
          {
            v111 = objc_msgSend_arrayType(v101, (const char *)v95, v96, v97);
            if (objc_msgSend_dataType(v101, v112, v113, v114) == 2
              && (uint64_t v118 = objc_msgSend_elementType(v111, v115, v116, v117),
                  v118 == sub_1B64D8030(v110[10], v119, v120, v121, v122, v123, v124, v125))
              || (uint64_t v126 = objc_msgSend_dataType(v101, v115, v116, v117),
                  v126 == sub_1B64D8030(v110[10], v127, v128, v129, v130, v131, v132, v133))
              && *((void *)v110 + 3) == 1)
            {
              int v137 = objc_msgSend_offset(v101, v115, v116, v117);
              if (v111)
              {
                objc_msgSend_arrayLength(v111, v134, v135, v136);
                uint64_t v141 = objc_msgSend_elementType(v111, v138, v139, v140);
                int v142 = sub_1B64D80F0(v141);
                uint64_t v146 = objc_msgSend_arrayLength(v111, v143, v144, v145);
                uint64_t v147 = *((void *)v110 + 3);
                if (v146 < v147) {
                  LODWORD(v147) = v146;
                }
              }
              else
              {
                uint64_t v155 = objc_msgSend_dataType(v101, v134, v135, v136);
                int v142 = sub_1B64D80F0(v155);
                uint64_t v147 = *((void *)v110 + 3);
              }
              int v156 = v142 * v147;
              uint64_t v157 = v186;
              if ((unint64_t)v186 >= v187)
              {
                int64_t v159 = (v186 - (unsigned char *)__src) >> 4;
                unint64_t v160 = v159 + 1;
                if ((unint64_t)(v159 + 1) >> 60) {
                  abort();
                }
                uint64_t v161 = v187 - (void)__src;
                if ((uint64_t)(v187 - (void)__src) >> 3 > v160) {
                  unint64_t v160 = v161 >> 3;
                }
                if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v95 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v95 = v160;
                }
                if (v95) {
                  v162 = (char *)sub_1B6427C8C((uint64_t)&v187, v95);
                }
                else {
                  v162 = 0;
                }
                uint64_t v163 = &v162[16 * v159];
                *(void *)uint64_t v163 = v110;
                *((_DWORD *)v163 + 2) = v137;
                *((_DWORD *)v163 + 3) = v156;
                v165 = (char *)__src;
                uint64_t v164 = v186;
                v166 = v163;
                if (v186 != __src)
                {
                  do
                  {
                    *((_OWORD *)v166 - 1) = *((_OWORD *)v164 - 1);
                    v166 -= 16;
                    v164 -= 16;
                  }
                  while (v164 != v165);
                  uint64_t v164 = (char *)__src;
                }
                uint64_t v158 = v163 + 16;
                __src = v166;
                v186 = v163 + 16;
                unint64_t v187 = (unint64_t)&v162[16 * v95];
                if (v164) {
                  operator delete(v164);
                }
              }
              else
              {
                *(void *)v186 = v110;
                uint64_t v158 = v157 + 16;
                *((_DWORD *)v157 + 2) = v137;
                *((_DWORD *)v157 + 3) = v156;
              }
              v186 = v158;
            }
            else
            {
              uint64_t v148 = objc_msgSend_name(v101, v115, v116, v117);
              sub_1B63F2F54(0, @"Warning: struct member does not match pass description : %@", v149, v150, v151, v152, v153, v154, v148);
            }
          }
        }
        uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, (const char *)v95, (uint64_t)&v181, (uint64_t)v188, 16);
      }
      while (v98);
    }
    if (v186 != __src)
    {
      uint64_t v44 = (VFXMTLPassResourceBinding *)p_isa;
      objc_msgSend_setInputsCount_(p_isa, (const char *)v95, (v186 - (unsigned char *)__src) >> 4, v97);
      uint64_t v6 = v178;
      a3 = v179;
      size_t v170 = 16 * objc_msgSend_inputsCount(p_isa, v167, v168, v169);
      p_isa[6] = malloc_type_malloc(v170, 0x3707311FuLL);
      memcpy(p_isa[6], __src, v170);
      uint64_t v174 = objc_msgSend_bufferDataSize(v179, v171, v172, v173);
      objc_msgSend_setBufferSize_(p_isa, v175, v174, v176);
      if (__src)
      {
        v186 = __src;
        operator delete(__src);
      }
      goto LABEL_21;
    }
    if (v186) {
      operator delete(v186);
    }
    LOBYTE(v66) = 0;
  }
  return (char)v66;
}

@end
@interface VFXMTLLibraryManager
+ (id)hashCodeForSource:(id)a3 macros:(id)a4;
- (VFXMTLLibraryManager)initWithDevice:(id)a3;
- (id)commonProfileCacheLibrary;
- (id)defaultLibrary;
- (id)device;
- (id)deviceQueue;
- (id)frameworkLibrary;
- (id)hotReloadableLibrary;
- (id)libraryForFile:(id)a3;
- (id)libraryForSourceCode:(id)a3 options:(id)a4;
- (id)shaderCompilationGroup;
- (void)_setEngineStats:(__CFXEngineStats *)a3;
- (void)clearCompiledLibraries;
- (void)dealloc;
- (void)libraryForProgramDesc:(id *)a3 completionHandler:(id)a4;
- (void)waitForShadersCompilation;
@end

@implementation VFXMTLLibraryManager

- (VFXMTLLibraryManager)initWithDevice:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)VFXMTLLibraryManager;
  v4 = [(VFXMTLLibraryManager *)&v67 init];
  v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v6 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v7 = objc_opt_class();
    v10 = objc_msgSend_bundleForClass_(v6, v8, v7, v9);
    uint64_t v12 = objc_msgSend_pathForResource_ofType_(v10, v11, @"default", @"metallib");
    v13 = [VFXMTLLibrary alloc];
    v5->_frameworkLibrary = (VFXMTLLibrary *)objc_msgSend_initWithPath_manager_(v13, v14, v12, (uint64_t)v5);
    v5->_availableLibraries = (NSMapTable *)(id)objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v15, v16, v17);
    v5->_availableCompiledLibraries = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
    v5->_availableCompiledLibrariesLock._os_unfair_lock_opaque = 0;
    v5->_deviceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.vfx.device", 0);
    v5->_shaderCompilationGroup = (OS_dispatch_group *)dispatch_group_create();
    v21 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v18, v19, v20);
    v26 = objc_msgSend_URLForResource_withExtension_(v21, v22, @"vfx", @"metallib");
    if (!v26)
    {
      v26 = (void *)sub_1B63CC800();
      if (!v26)
      {
        v27 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v23, v24, v25);
        v26 = objc_msgSend_URLForResource_withExtension_(v27, v28, @"default", @"metallib");
      }
    }
    uint64_t v66 = 0;
    v29 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v23, v24, v25);
    uint64_t v33 = objc_msgSend_path(v26, v30, v31, v32);
    if (objc_msgSend_fileExistsAtPath_(v29, v34, v33, v35))
    {
      v37 = (MTLLibrary *)objc_msgSend_newLibraryWithURL_error_(v5->_device, v36, (uint64_t)v26, (uint64_t)&v66);
      v5->_commonProfileCacheLibrary = v37;
      if (v37)
      {
        v45 = objc_msgSend_functionNames(v37, v38, v39, v40);
        id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v62, (uint64_t)v68, 16);
        if (v48)
        {
          uint64_t v52 = v48;
          uint64_t v53 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v63 != v53) {
                objc_enumerationMutation(v45);
              }
              v55 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              if ((objc_msgSend_hasPrefix_(v55, v49, @"commonprofile_vert", v51) & 1) != 0
                || objc_msgSend_hasPrefix_(v55, v49, @"commonprofile_frag", v51))
              {
                v56 = objc_msgSend_newFunctionWithName_(v5->_commonProfileCacheLibrary, v49, (uint64_t)v55, v51);
                objc_msgSend_setObject_forKeyedSubscript_(v46, v57, (uint64_t)v56, (uint64_t)v55);
              }
            }
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v49, (uint64_t)&v62, (uint64_t)v68, 16);
          }
          while (v52);
        }
        if (objc_msgSend_count(v46, v49, v50, v51))
        {
          v5->_commonProfilePrecompiledFunctions = (NSDictionary *)objc_msgSend_copy(v46, v58, v59, v60);
        }
        else
        {

          v5->_commonProfileCacheLibrary = 0;
        }
      }
      else
      {
        sub_1B63F2F54(16, @"Error: Failed to load common profile chache library : %@", v39, v40, v41, v42, v43, v44, v66);
      }
    }
  }
  return v5;
}

- (id)hotReloadableLibrary
{
  return 0;
}

- (void)dealloc
{
  CFRelease(self->_availableCompiledLibraries);

  dispatch_release((dispatch_object_t)self->_deviceQueue);
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLLibraryManager;
  [(VFXMTLLibraryManager *)&v3 dealloc];
}

+ (id)hashCodeForSource:(id)a3 macros:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  CC_SHA256_Init(&c);
  sub_1B6604178((uint64_t)a3, (uint64_t)&c);
  uint64_t v9 = objc_msgSend_allKeys(a4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_compare_, v11);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v36, (uint64_t)v44, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v21 = objc_msgSend_objectForKeyedSubscript_(a4, v15, v20, v16);
        sub_1B6604178(v20, (uint64_t)&c);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          sub_1B6604178((uint64_t)v21, (uint64_t)&c);
        }
        else
        {
          data[0] = 0;
          data[0] = objc_msgSend_hash(v21, v22, v23, v24);
          CC_SHA256_Update(&c, data, 8u);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v36, (uint64_t)v44, 16);
    }
    while (v17);
  }
  CC_SHA256_Final(md, &c);
  uint64_t v26 = 0;
  v27 = (char *)data;
  v28.i64[0] = 0xA0A0A0A0A0A0A0A0;
  v28.i64[1] = 0xA0A0A0A0A0A0A0A0;
  v29.i64[0] = 0x3737373737373737;
  v29.i64[1] = 0x3737373737373737;
  v30.i64[0] = 0x3030303030303030;
  v30.i64[1] = 0x3030303030303030;
  v31.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v31.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v32.i64[0] = 0xA0A0A0A0A0A0A0ALL;
  v32.i64[1] = 0xA0A0A0A0A0A0A0ALL;
  do
  {
    int8x16_t v33 = *(int8x16_t *)&md[v26];
    v46.val[0] = (int8x16_t)vsraq_n_u8((uint8x16_t)vbslq_s8((int8x16_t)vcgtq_u8(v28, (uint8x16_t)v33), v30, v29), (uint8x16_t)v33, 4uLL);
    int8x16_t v34 = vandq_s8(v33, v31);
    v46.val[1] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8(v32, (uint8x16_t)v34), v30, v29), v34);
    vst2q_s8(v27, v46);
    v27 += 32;
    v26 += 16;
  }
  while (v26 != 32);
  char v42 = 0;
  return (id)objc_msgSend_stringWithCString_encoding_(NSString, v25, (uint64_t)data, 1);
}

- (id)device
{
  return self->_device;
}

- (void)clearCompiledLibraries
{
  p_availableCompiledLibrariesLock = &self->_availableCompiledLibrariesLock;
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  CFDictionaryRemoveAllValues(self->_availableCompiledLibraries);

  os_unfair_lock_unlock(p_availableCompiledLibrariesLock);
}

- (id)frameworkLibrary
{
  return (id)objc_msgSend_library(self->_frameworkLibrary, a2, v2, v3);
}

- (id)defaultLibrary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B653776C;
  block[3] = &unk_1E61422C0;
  block[4] = self;
  if (qword_1E9DDB280 != -1) {
    dispatch_once(&qword_1E9DDB280, block);
  }
  return (id)objc_msgSend_library(self->_defaultLibrary, a2, v2, v3);
}

- (id)commonProfileCacheLibrary
{
  return self->_commonProfileCacheLibrary;
}

- (id)shaderCompilationGroup
{
  return self->_shaderCompilationGroup;
}

- (void)waitForShadersCompilation
{
}

- (void)_setEngineStats:(__CFXEngineStats *)a3
{
  self->__engineStats = a3;
}

- (id)deviceQueue
{
  return self->_deviceQueue;
}

- (id)libraryForFile:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1B65378D0;
  uint64_t v11 = sub_1B65378E0;
  uint64_t v12 = 0;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B65378EC;
  block[3] = &unk_1E6143D80;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(deviceQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)libraryForSourceCode:(id)a3 options:(id)a4
{
  uint64_t v7 = objc_msgSend_preprocessorMacros(a4, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v9 = (const void *)objc_msgSend_hashCodeForSource_macros_(VFXMTLLibraryManager, v8, (uint64_t)a3, v7);
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  Value = (void *)CFDictionaryGetValue(self->_availableCompiledLibraries, v9);
  if (!Value)
  {
    uint64_t v20 = 0;
    ++self->__engineStats->onlineShaderCount;
    double v11 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"newLibraryWithSource", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLLibraryManager.mm", 467);
    Value = objc_msgSend_newLibraryWithSource_options_error_(self->_device, v12, (uint64_t)a3, (uint64_t)a4, &v20);
    self->__engineStats->onlineShaderCompilationTime = CACurrentMediaTime()
                                                     - v11
                                                     + self->__engineStats->onlineShaderCompilationTime;
    prof_endFlame();
    if (Value)
    {
      CFDictionarySetValue(self->_availableCompiledLibraries, v9, Value);
    }
    else
    {
      sub_1B63F2F54(16, @"Error: Compilation failed %@", v13, v14, v15, v16, v17, v18, v20);
    }
  }
  os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
  return Value;
}

- (void)libraryForProgramDesc:(id *)a3 completionHandler:(id)a4
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  var0 = a3->var0;
  uint64_t v8 = sub_1B6451064((uint64_t)a3->var0);
  if (v8)
  {
    uint64_t v16 = (void (*)(id, MTLLibrary *, void))*((void *)a4 + 2);
    commonProfileCacheLibrary = (MTLLibrary *)v8;
LABEL_3:
    id v18 = a4;
LABEL_4:
    v16(v18, commonProfileCacheLibrary, 0);
    return;
  }
  uint64_t v19 = sub_1B6450DB4((uint64_t)var0, v9, v10, v11, v12, v13, v14, v15);
  if (!v19)
  {
    if (sub_1B645106C((uint64_t)a3->var0, v20, v21, v22, v23, v24, v25, v26)) {
      uint64_t v35 = objc_msgSend_defaultLibrary(self, v32, v33, v34);
    }
    else {
      uint64_t v35 = objc_msgSend_frameworkLibrary(self, v32, v33, v34);
    }
    commonProfileCacheLibrary = (MTLLibrary *)v35;
    goto LABEL_17;
  }
  uint64_t v27 = v19;
  uint64_t v28 = sub_1B6450E4C((uint64_t)var0, v20, v21, v22, v23, v24, v25, v26);
  int8x16_t v30 = (const void *)objc_msgSend_hashCodeForSource_macros_(VFXMTLLibraryManager, v29, v27, v28);
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  Value = (MTLLibrary *)CFDictionaryGetValue(self->_availableCompiledLibraries, v30);
  os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
  if (Value)
  {
    uint64_t v16 = (void (*)(id, MTLLibrary *, void))*((void *)a4 + 2);
    id v18 = a4;
    commonProfileCacheLibrary = Value;
    goto LABEL_4;
  }
  BOOL v36 = sub_1B64F53A4();
  uint64_t v42 = objc_msgSend_count(self->_commonProfilePrecompiledFunctions, v37, v38, v39);
  if (!v42 && !v36)
  {
    v106 = 0;
    uint64_t v43 = 0;
    goto LABEL_23;
  }
  uint64_t v43 = (const void *)objc_msgSend_stringByAppendingString_(@"commonprofile_vert", v40, (uint64_t)v30, v41);
  v106 = (const void *)objc_msgSend_stringByAppendingString_(@"commonprofile_frag", v44, (uint64_t)v30, v45);
  if (v42)
  {
    if (objc_msgSend_objectForKeyedSubscript_(self->_commonProfilePrecompiledFunctions, v46, (uint64_t)v43, v47)
      && objc_msgSend_objectForKeyedSubscript_(self->_commonProfilePrecompiledFunctions, v48, (uint64_t)v106, v50))
    {
      sub_1B6450D28((uint64_t)var0, 0, v43, v50, v51, v52, v53, v54);
      sub_1B6450D28((uint64_t)var0, 1, v106, v55, v56, v57, v58, v59);
      sub_1B6450C88(var0, self->_commonProfileCacheLibrary, v60, v61, v62, v63, v64, v65);
      commonProfileCacheLibrary = self->_commonProfileCacheLibrary;
LABEL_17:
      uint64_t v16 = (void (*)(id, MTLLibrary *, void))*((void *)a4 + 2);
      goto LABEL_3;
    }
    sub_1B63F2F54(16, @"Error: Failed to find pre-compiled combination %@ + %@", v49, v50, v51, v52, v53, v54, (uint64_t)v43);
  }
LABEL_23:
  if (v36)
  {
    uint64_t v66 = sub_1B63CC7A0();
    if (v66)
    {
      uint64_t v67 = v66;
      if (qword_1E9DDB290 != -1) {
        dispatch_once(&qword_1E9DDB290, &unk_1F0FB5CA8);
      }
      CFRetain(var0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B653807C;
      block[3] = &unk_1E6143DF8;
      block[4] = v67;
      void block[5] = v30;
      block[6] = v43;
      void block[7] = v106;
      block[8] = var0;
      dispatch_async((dispatch_queue_t)qword_1E9DDB288, block);
    }
  }
  uint64_t v68 = sub_1B63CD09C((uint64_t)var0);
  unint64_t v69 = sub_1B64D9870();
  unsigned int v77 = sub_1B6450EE4((uint64_t)var0, v70, v71, v72, v73, v74, v75, v76);
  if (v69 <= v77) {
    uint64_t v78 = v77;
  }
  else {
    uint64_t v78 = v69;
  }
  id v79 = objc_alloc_init(MEMORY[0x1E4F351F8]);
  objc_msgSend_setPreprocessorMacros_(v79, v80, v28, v81);
  objc_msgSend_setLanguageVersion_(v79, v82, v78, v83);
  objc_msgSend_setAdditionalCompilerArguments_(v79, v84, @" -w ", v85);
  v86 = sub_1B63F2EE0();
  os_signpost_id_t v87 = os_signpost_id_generate(v86);
  v88 = sub_1B63F2EE0();
  if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v96 = v88;
    if (os_signpost_enabled(v88))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = var0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v96, OS_SIGNPOST_INTERVAL_BEGIN, v87, "CompileShader", "programID=%d", buf, 8u);
    }
  }
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v110 = sub_1B6538318;
  v111 = &unk_1E6143E20;
  $FA47EB92040BDE94132BF6335E7008C0 var15 = a3->var15;
  long long v120 = *(_OWORD *)&a3->var8;
  $FA47EB92040BDE94132BF6335E7008C0 v121 = var15;
  unint64_t var16 = a3->var16;
  long long v99 = *(_OWORD *)&a3->var2;
  long long v116 = *(_OWORD *)&a3->var0;
  long long v117 = v99;
  long long v100 = *(_OWORD *)&a3->var4;
  long long v119 = *(_OWORD *)&a3->var6;
  long long v118 = v100;
  unint64_t v122 = var16;
  uint64_t v123 = v68;
  uint64_t v112 = v27;
  v113 = self;
  v114 = v30;
  id v115 = a4;
  os_signpost_id_t v124 = v87;
  int v125 = (int)var0;
  ++self->__engineStats->onlineShaderCount;
  int var13 = a3->var13;
  if (a3->var13)
  {
    if (var13 == 2)
    {
      device = self->_device;
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = sub_1B6538574;
      v107[3] = &unk_1E6143E70;
      v107[4] = self;
      v107[5] = v109;
      objc_msgSend_newLibraryWithSource_options_completionHandler_(device, v89, v27, (uint64_t)v79, v107);
    }
    else if (var13 == 1)
    {
      dispatch_group_enter((dispatch_group_t)self->_shaderCompilationGroup);
      v102 = self->_device;
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = sub_1B65384AC;
      v108[3] = &unk_1E6143E70;
      v108[4] = self;
      v108[5] = v109;
      objc_msgSend_newLibraryWithSource_options_completionHandler_(v102, v103, v27, (uint64_t)v79, v108);
    }
    else
    {
      sub_1B63F2F54(16, @"Unreachable code: Unknown compilation mode %d", v90, v91, v92, v93, v94, v95, a3->var13);
    }
  }
  else
  {
    *(void *)buf = 0;
    v104 = objc_msgSend_newLibraryWithSource_options_error_(self->_device, v89, v27, (uint64_t)v79, buf);
    ((void (*)(void *, void *, void))v110)(v109, v104, *(void *)buf);
  }
}

@end
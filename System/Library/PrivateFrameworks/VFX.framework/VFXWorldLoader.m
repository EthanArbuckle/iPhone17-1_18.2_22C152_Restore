@interface VFXWorldLoader
+ (id)loader;
+ (void)transferWorld:(id)a3 to:(id)a4;
- (BOOL)_loadURL:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7;
- (BOOL)isPrecompiled;
- (BOOL)loadData:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7;
- (BOOL)loadNonNativeFormatAt:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7;
- (BOOL)loadURL:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7;
- (BOOL)loadWorldDescriptionAt:(id)a3 into:(id)a4 options:(id)a5 compressed:(BOOL)a6 statusHandler:(id)a7 error:(id *)a8;
- (BOOL)loadWorldDescriptionFromData:(id)a3 into:(id)a4 options:(id)a5 compressed:(BOOL)a6 sourceURL:(id)a7 statusHandler:(id)a8 error:(id *)a9;
- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
- (NSError)warnings;
- (NSUUID)documentUUID;
- (VFXWorldLoader)init;
- (int64_t)version;
@end

@implementation VFXWorldLoader

- (VFXWorldLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXWorldLoader;
  return [(VFXWorldLoader *)&v3 init];
}

+ (id)loader
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (BOOL)loadURL:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  v13 = sub_1B63F2EE0();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  v15 = sub_1B63F2EE0();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v15;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LoadWorld", "", buf, 2u);
    }
  }
  char URL_into_options_statusHandler_error = objc_msgSend__loadURL_into_options_statusHandler_error_(self, v16, (uint64_t)a3, (uint64_t)a4, a5, a6, a7);
  v19 = sub_1B63F2EE0();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v19;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v20, OS_SIGNPOST_INTERVAL_END, v14, "LoadWorld", "", v22, 2u);
    }
  }
  return URL_into_options_statusHandler_error;
}

- (BOOL)_loadURL:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  if (a5) {
    id v13 = (id)objc_msgSend_mutableCopy(a5, a2, (uint64_t)a3, (uint64_t)a4);
  }
  else {
    id v13 = (id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, (uint64_t)a3, (uint64_t)a4);
  }
  v17 = v13;
  v18 = objc_msgSend_pathExtension(a3, v14, v15, v16);
  v22 = objc_msgSend_lowercaseString(v18, v19, v20, v21);
  if ((objc_msgSend_isEqualToString_(v22, v23, @"vfxproj", v24) & 1) != 0
    || objc_msgSend_isEqualToString_(v22, v25, @"vfx", v27))
  {
    v28 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v25, v26, v27);
    int CoreEntityManagerFromURL_options_infoOut_error = objc_msgSend_loadCoreEntityManagerFromURL_options_infoOut_error_(a4, v29, (uint64_t)a3, (uint64_t)v17, v28, a7);
    if (CoreEntityManagerFromURL_options_infoOut_error)
    {
      uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v28, v31, @"serializationContext", v32);
      objc_msgSend_setObject_forKeyedSubscript_(v17, v34, v33, @"serializationContext");
      uint64_t v37 = objc_msgSend_URLByAppendingPathComponent_(a3, v35, @"world.plist", v36);
      int WorldDescriptionAt_into_options_compressed_statusHandler_error = objc_msgSend_loadWorldDescriptionAt_into_options_compressed_statusHandler_error_(self, v38, v37, (uint64_t)a4, v17, 0, a6, a7);
      LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = 0;
      if (WorldDescriptionAt_into_options_compressed_statusHandler_error)
      {
        objc_msgSend_resolveVFXCoreAndTagReferences(a4, v39, v40, v41);
        int CoreEntityManagerFromURL_options_infoOut_error = objc_msgSend_migrateCoreEntityManagerWithInfo_error_(a4, v43, (uint64_t)v28, (uint64_t)a7);
        if (CoreEntityManagerFromURL_options_infoOut_error)
        {
          objc_msgSend_replicateToRuntimeAndStartReplicationWithOptions_(a4, v44, (uint64_t)a5, v45);
          int CoreEntityManagerFromURL_options_infoOut_error = objc_msgSend_initializeCoreEntityManagerWithInfo_error_(a4, v46, (uint64_t)v28, (uint64_t)a7);
          if (CoreEntityManagerFromURL_options_infoOut_error)
          {
            v49 = objc_msgSend_objectForKeyedSubscript_(v28, v47, @"version", v48);
            self->_version = (int)objc_msgSend_intValue(v49, v50, v51, v52);
            self->_documentUUID = (NSUUID *)objc_msgSend_objectForKeyedSubscript_(v28, v53, @"documentUUID", v54);
            self->_warnings = (NSError *)objc_msgSend_objectForKeyedSubscript_(v28, v55, @"warnings", v56);
            v59 = objc_msgSend_objectForKeyedSubscript_(v28, v57, @"precompiled", v58);
            self->_precompiled = objc_msgSend_BOOLValue(v59, v60, v61, v62);
            if (a7 && *a7)
            {
              sub_1B63F2F54(16, @"Error: error loading core entity manager: %@", v63, v64, v65, v66, v67, v68, (uint64_t)*a7);
              LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = 0;
              return CoreEntityManagerFromURL_options_infoOut_error;
            }
LABEL_18:
            LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = 1;
          }
        }
      }
    }
  }
  else
  {
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v22, v25, @"vfxz-world", v27);
    v72 = objc_msgSend_valueForKey_(a5, v70, @"kWorldSourceFormat", v71);
    if (((objc_msgSend_isEqualToString_(v72, v73, @"vfx-world", v74) & 1) != 0
       || (objc_msgSend_isEqualToString_(v22, v75, @"plist", v76) & 1) != 0
       || (objc_msgSend_isEqualToString_(v22, v75, @"vfx-world", v77) | isEqualToString) == 1)
      && objc_msgSend_loadWorldDescriptionAt_into_options_compressed_statusHandler_error_(self, v75, (uint64_t)a3, (uint64_t)a4, a5, isEqualToString, a6, a7))
    {
      objc_msgSend_resolveVFXCoreAndTagReferences(a4, v78, v79, v80);
      goto LABEL_18;
    }
    LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = MEMORY[0x1F4181798](self, sel_loadNonNativeFormatAt_into_options_statusHandler_error_, a3, a4);
  }
  return CoreEntityManagerFromURL_options_infoOut_error;
}

- (BOOL)loadData:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  id v13 = sub_1B63F2EE0();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  uint64_t v15 = sub_1B63F2EE0();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v15;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LoadWorld", "", buf, 2u);
    }
  }
  char WorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error = objc_msgSend_loadWorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error_(self, v16, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, a6, a7);
  v19 = sub_1B63F2EE0();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v20 = v19;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v20, OS_SIGNPOST_INTERVAL_END, v14, "LoadWorld", "", v22, 2u);
    }
  }
  return WorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error;
}

- (BOOL)loadNonNativeFormatAt:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  v11 = (void *)MEMORY[0x1E4F35BB0];
  uint64_t v12 = objc_msgSend_pathExtension(a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7);
  LODWORD(v11) = objc_msgSend_canImportFileExtension_(v11, v13, v12, v14);
  objc_msgSend_begin(VFXTransaction, v15, v16, v17);
  objc_msgSend_setImmediateMode_(VFXTransaction, v18, 1, v19);
  if (v11)
  {
    sub_1B6465358(a4, (char *)a3, a5, (uint64_t)a6);
    objc_msgSend_commit(VFXTransaction, v21, v22, v23);
    if (a4)
    {
      uint64_t v27 = objc_msgSend_worldRef(a4, v24, v25, v26);
      sub_1B6567CF8(v27, (uint64_t)a5, 0, -1, v28, v29, v30, v31);
    }
  }
  else
  {
    uint64_t v40 = 0;
    objc_msgSend_loadSCN_options_error_(a4, v20, (uint64_t)a3, (uint64_t)a5, &v40);
    if (v40) {
      sub_1B63F2F54(16, @"Error: error importing VFX world: %@", v33, v34, v35, v36, v37, v38, v40);
    }
    objc_msgSend_commit(VFXTransaction, v32, v33, v34);
  }
  return 1;
}

- (BOOL)loadWorldDescriptionAt:(id)a3 into:(id)a4 options:(id)a5 compressed:(BOOL)a6 statusHandler:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v15 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, 0, a8);
  if (v15) {
    return objc_msgSend_loadWorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error_(self, v16, v15, (uint64_t)a4, a5, v10, a3, a7, a8);
  }
  if (a7)
  {
    char v19 = 1;
    if (a8) {
      id v18 = *a8;
    }
    else {
      id v18 = 0;
    }
    (*((void (**)(id, uint64_t, id, char *, float))a7 + 2))(a7, -1, v18, &v19, 1.0);
  }
  return 0;
}

- (BOOL)loadWorldDescriptionFromData:(id)a3 into:(id)a4 options:(id)a5 compressed:(BOOL)a6 sourceURL:(id)a7 statusHandler:(id)a8 error:(id *)a9
{
  BOOL v10 = a6;
  v66[2] = *MEMORY[0x1E4F143B8];
  if (!a7)
  {
    uint64_t v15 = 1;
    if (!a6) {
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v16 = objc_msgSend_vfx_uncompressedDataUsingCompressionAlgorithm_(a3, a2, 517, (uint64_t)a4);
    a3 = v16;
    if (!v16) {
      return (char)v16;
    }
    goto LABEL_6;
  }
  uint64_t v15 = sub_1B6568FA4((const __CFURL *)a7, (CFDictionaryRef)a5);
  if (v10) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v17 = [VFXKeyedUnarchiver alloc];
  char v19 = objc_msgSend_initForReadingWithData_secure_(v17, v18, (uint64_t)a3, v15);
  uint64_t v22 = v19;
  if (v19)
  {
    uint64_t v23 = objc_msgSend_setDelegate_(v19, v20, (uint64_t)self, v21);
    uint64_t v27 = (void *)MEMORY[0x1BA9B76E0](v23);
    if (a7)
    {
      uint64_t v28 = sub_1B6581390((CFDictionaryRef)a5, (const __CFURL *)a7);
      objc_msgSend_setContext_(v22, v29, (uint64_t)v28, v30);
      objc_msgSend_setDocumentURL_(v22, v31, (uint64_t)a7, v32);
    }
    else
    {
      uint64_t v28 = 0;
    }
    uint64_t v33 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v24, v25, v26);
    uint64_t v36 = v33;
    if (a7) {
      objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)a7, @"url");
    }
    uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(a5, v34, @"serializationContext", v35);
    objc_msgSend_setObject_forKeyedSubscript_(v36, v38, v37, @"serializationContext");
    objc_msgSend_setValue_forKey_(VFXTransaction, v39, (uint64_t)v36, @"VFXWorldLoadingContextKey");
    uint64_t v40 = (void *)MEMORY[0x1E4F1CAD0];
    v66[0] = objc_opt_class();
    v66[1] = objc_opt_class();
    uint64_t v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v41, (uint64_t)v66, 2);
    uint64_t v45 = objc_msgSend_setWithArray_(v40, v43, v42, v44);
    v47 = objc_msgSend_decodeObjectOfClasses_forKey_(v22, v46, v45, @"root");
    objc_msgSend_transferWorld_to_(VFXWorldLoader, v48, (uint64_t)v47, (uint64_t)a4);
    uint64_t v52 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v49, v50, v51);
    uint64_t v56 = objc_msgSend_processName(v52, v53, v54, v55);
    if (!objc_msgSend_isEqualToString_(v56, v57, @"VFX Studio", v58)
      || !objc_msgSend_assetPathResolver(a4, v59, v60, v61))
    {
      uint64_t v62 = objc_msgSend_assetPathResolver(v47, v59, v60, v61);
      objc_msgSend_setAssetPathResolver_(a4, v63, v62, v64);
    }
    objc_msgSend_finishDecoding(v22, v59, v60, v61);

    if (v28) {
      CFRelease(v28);
    }
    LOBYTE(v16) = 1;
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  return (char)v16;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v7 = (void *)sub_1B64BA000();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a5, v8, (uint64_t)&v37, (uint64_t)v42, 16);
  if (!v9) {
    return 0;
  }
  uint64_t v12 = v9;
  uint64_t v13 = *(void *)v38;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v38 != v13) {
        objc_enumerationMutation(a5);
      }
      uint64_t v15 = objc_msgSend_classNamed_(v7, v10, *(void *)(*((void *)&v37 + 1) + 8 * i), v11);
      if (v15)
      {
        uint64_t v17 = (objc_class *)v15;
        if (!objc_msgSend_requiresSecureCoding(a3, v10, v16, v11)) {
          return v17;
        }
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v21 = objc_msgSend_allowedClasses(a3, v18, v19, v20);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v33, (uint64_t)v41, 16);
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v34;
          uint64_t v32 = v12;
LABEL_10:
          id v26 = a3;
          id v27 = a5;
          uint64_t v28 = v7;
          uint64_t v29 = v13;
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v34 != v25) {
              objc_enumerationMutation(v21);
            }
            if (objc_msgSend_isSubclassOfClass_(v17, v10, *(void *)(*((void *)&v33 + 1) + 8 * v30), v11)) {
              return v17;
            }
            if (v24 == ++v30)
            {
              uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v10, (uint64_t)&v33, (uint64_t)v41, 16);
              uint64_t v13 = v29;
              v7 = v28;
              a5 = v27;
              a3 = v26;
              uint64_t v12 = v32;
              if (v24) {
                goto LABEL_10;
              }
              break;
            }
          }
        }
      }
    }
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a5, v10, (uint64_t)&v37, (uint64_t)v42, 16);
    uint64_t v17 = 0;
    if (v12) {
      continue;
    }
    return v17;
  }
}

+ (void)transferWorld:(id)a3 to:(id)a4
{
  uint64_t v290 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_rootNode(a4, a2, (uint64_t)a3, (uint64_t)a4);
  BOOL v10 = objc_msgSend_childNodes(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);
  id v18 = objc_msgSend_physicsWorld(a3, v15, v16, v17);
  uint64_t v22 = objc_msgSend_physicsJoints(v18, v19, v20, v21);
  id v26 = objc_msgSend_copy(v22, v23, v24, v25);
  uint64_t v30 = objc_msgSend_rootNode(a3, v27, v28, v29);
  objc_msgSend_setWorld_(v30, v31, 0, v32);
  long long v36 = objc_msgSend_assetRegistry(a3, v33, v34, v35);
  objc_msgSend_setWorld_(v36, v37, 0, v38);
  long long v284 = 0u;
  long long v285 = 0u;
  long long v282 = 0u;
  long long v283 = 0u;
  uint64_t v42 = objc_msgSend_rootNode(a3, v39, v40, v41);
  v46 = objc_msgSend_childNodes(v42, v43, v44, v45);
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v282, (uint64_t)v289, 16);
  if (v48)
  {
    uint64_t v52 = v48;
    uint64_t v53 = *(void *)v283;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v283 != v53) {
          objc_enumerationMutation(v46);
        }
        uint64_t v55 = *(void *)(*((void *)&v282 + 1) + 8 * v54);
        uint64_t v56 = objc_msgSend_rootNode(a4, v49, v50, v51);
        objc_msgSend_addChildNode_(v56, v57, v55, v58);
        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v282, (uint64_t)v289, 16);
    }
    while (v52);
  }
  v59 = objc_msgSend_rootNode(a3, v49, v50, v51);
  objc_msgSend_setWorld_(v59, v60, (uint64_t)a3, v61);
  long long v280 = 0u;
  long long v281 = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v62, (uint64_t)&v278, (uint64_t)v288, 16);
  if (v63)
  {
    uint64_t v67 = v63;
    uint64_t v68 = *(void *)v279;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v279 != v68) {
          objc_enumerationMutation(v26);
        }
        uint64_t v70 = *(void *)(*((void *)&v278 + 1) + 8 * v69);
        uint64_t v71 = objc_msgSend_physicsWorld(a4, v64, v65, v66);
        objc_msgSend_addPhysicsJoint_(v71, v72, v70, v73);
        ++v69;
      }
      while (v67 != v69);
      uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v64, (uint64_t)&v278, (uint64_t)v288, 16);
    }
    while (v67);
  }

  if (!v14)
  {
    if (objc_msgSend_background(a3, v74, v75, v76))
    {
      uint64_t v80 = objc_msgSend_background(a4, v77, v78, v79);
      uint64_t v84 = objc_msgSend_background(a3, v81, v82, v83);
      objc_msgSend_copyPropertiesFrom_(v80, v85, v84, v86);
    }
    if (objc_msgSend_lightingEnvironment(a3, v77, v78, v79))
    {
      v90 = objc_msgSend_lightingEnvironment(a4, v87, v88, v89);
      uint64_t v94 = objc_msgSend_lightingEnvironment(a3, v91, v92, v93);
      objc_msgSend_copyPropertiesFrom_(v90, v95, v94, v96);
    }
    v97 = objc_msgSend_physicsWorld(a3, v87, v88, v89);
    objc_msgSend_gravity(v97, v98, v99, v100);
    double v269 = v101;
    v105 = objc_msgSend_physicsWorld(a4, v102, v103, v104);
    objc_msgSend_setGravity_(v105, v106, v107, v108, v269);
    v112 = objc_msgSend_physicsWorld(a3, v109, v110, v111);
    objc_msgSend_speed(v112, v113, v114, v115);
    int v117 = v116;
    v121 = objc_msgSend_physicsWorld(a4, v118, v119, v120);
    LODWORD(v122) = v117;
    objc_msgSend_setSpeed_(v121, v123, v124, v125, v122);
    v129 = objc_msgSend_physicsWorld(a3, v126, v127, v128);
    objc_msgSend_timeStep(v129, v130, v131, v132);
    double v134 = v133;
    v138 = objc_msgSend_physicsWorld(a4, v135, v136, v137);
    objc_msgSend_setTimeStep_(v138, v139, v140, v141, v134);
    objc_msgSend_endTime(a3, v142, v143, v144);
    objc_msgSend_setEndTime_(a4, v145, v146, v147);
    objc_msgSend_startTime(a3, v148, v149, v150);
    objc_msgSend_setStartTime_(a4, v151, v152, v153);
    objc_msgSend_fogStartDistance(a3, v154, v155, v156);
    objc_msgSend_setFogStartDistance_(a4, v157, v158, v159);
    objc_msgSend_fogEndDistance(a3, v160, v161, v162);
    objc_msgSend_setFogEndDistance_(a4, v163, v164, v165);
    objc_msgSend_fogDensityExponent(a3, v166, v167, v168);
    objc_msgSend_setFogDensityExponent_(a4, v169, v170, v171);
    uint64_t v175 = objc_msgSend_fogColor(a3, v172, v173, v174);
    objc_msgSend_setFogColor_(a4, v176, v175, v177);
    uint64_t v181 = objc_msgSend_wantsScreenSpaceReflection(a3, v178, v179, v180);
    objc_msgSend_setWantsScreenSpaceReflection_(a4, v182, v181, v183);
    uint64_t v187 = objc_msgSend_screenSpaceReflectionSampleCount(a3, v184, v185, v186);
    objc_msgSend_setScreenSpaceReflectionSampleCount_(a4, v188, v187, v189);
    objc_msgSend_screenSpaceReflectionMaximumDistance(a3, v190, v191, v192);
    objc_msgSend_setScreenSpaceReflectionMaximumDistance_(a4, v193, v194, v195);
    objc_msgSend_screenSpaceReflectionStride(a3, v196, v197, v198);
    objc_msgSend_setScreenSpaceReflectionStride_(a4, v199, v200, v201);
  }
  v202 = objc_msgSend_assetRegistry(a3, v74, v75, v76);
  v206 = objc_msgSend_rootNode(v202, v203, v204, v205);
  v210 = objc_msgSend_childNodes(v206, v207, v208, v209);
  v214 = objc_msgSend_copy(v210, v211, v212, v213);
  long long v274 = 0u;
  long long v275 = 0u;
  long long v276 = 0u;
  long long v277 = 0u;
  uint64_t v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v215, (uint64_t)&v274, (uint64_t)v287, 16);
  if (v216)
  {
    uint64_t v220 = v216;
    uint64_t v221 = *(void *)v275;
    do
    {
      uint64_t v222 = 0;
      do
      {
        if (*(void *)v275 != v221) {
          objc_enumerationMutation(v214);
        }
        uint64_t v223 = *(void *)(*((void *)&v274 + 1) + 8 * v222);
        v224 = objc_msgSend_assetRegistry(a4, v217, v218, v219);
        v228 = objc_msgSend_rootNode(v224, v225, v226, v227);
        objc_msgSend_addChildNode_(v228, v229, v223, v230);
        ++v222;
      }
      while (v220 != v222);
      uint64_t v220 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v217, (uint64_t)&v274, (uint64_t)v287, 16);
    }
    while (v220);
  }
  long long v272 = 0u;
  long long v273 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  v231 = objc_msgSend_stateManager(a3, v217, v218, v219);
  v235 = objc_msgSend_states(v231, v232, v233, v234);
  uint64_t v237 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v236, (uint64_t)&v270, (uint64_t)v286, 16);
  if (v237)
  {
    uint64_t v241 = v237;
    uint64_t v242 = *(void *)v271;
    do
    {
      uint64_t v243 = 0;
      do
      {
        if (*(void *)v271 != v242) {
          objc_enumerationMutation(v235);
        }
        uint64_t v244 = *(void *)(*((void *)&v270 + 1) + 8 * v243);
        v245 = objc_msgSend_stateManager(a4, v238, v239, v240);
        objc_msgSend_addState_(v245, v246, v244, v247);
        ++v243;
      }
      while (v241 != v243);
      uint64_t v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v238, (uint64_t)&v270, (uint64_t)v286, 16);
    }
    while (v241);
  }
  v248 = objc_msgSend_assetRegistry(a3, v238, v239, v240);
  objc_msgSend_setWorld_(v248, v249, (uint64_t)a3, v250);
  uint64_t v254 = objc_msgSend_defaultRenderGraph(a3, v251, v252, v253);
  objc_msgSend_setDefaultRenderGraph_(a4, v255, v254, v256);
  uint64_t v260 = objc_msgSend_behaviorGraph(a3, v257, v258, v259);
  objc_msgSend_setBehaviorGraph_(a4, v261, v260, v262);
  uint64_t v266 = objc_msgSend_identifier(a3, v263, v264, v265);
  objc_msgSend_setIdentifier_(a4, v267, v266, v268);
}

- (int64_t)version
{
  return self->_version;
}

- (NSUUID)documentUUID
{
  return self->_documentUUID;
}

- (BOOL)isPrecompiled
{
  return self->_precompiled;
}

- (NSError)warnings
{
  return self->_warnings;
}

@end
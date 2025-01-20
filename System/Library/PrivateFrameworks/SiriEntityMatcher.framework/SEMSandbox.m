@interface SEMSandbox
+ (id)_sandboxBaseNameWithId:(id)a3;
+ (id)loadWithSandboxId:(id)a3 error:(id *)a4;
+ (id)sandboxWithKVProfile:(id)a3 locale:(id)a4 error:(id *)a5;
+ (id)sandboxWithRawSpeechProfile:(id)a3 error:(id *)a4;
+ (id)sandboxWithSerializedSets:(id)a3 locale:(id)a4 error:(id *)a5;
+ (id)sandboxWithSetEnumerator:(id)a3 locale:(id)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)_saveSettings;
- (NSString)sandboxId;
- (SEMIndexSiteManager)indexSiteManager;
- (SEMSandbox)init;
- (SEMSandbox)initWithSandboxId:(id)a3 sandboxIsSaved:(BOOL)a4 setEnumerator:(id)a5 settings:(id)a6;
- (SEMSandboxIndexSiteCache)readerCache;
- (SEMSandboxIndexSiteCache)writerCache;
- (id)_loadSavedProfile;
- (id)_loadSavedSettings;
- (id)appCustomVocabularySearcher;
- (id)appCustomVocabularySearcherWithUserId:(id)a3;
- (id)indexMatcher;
- (id)rootDirectoryURL;
- (id)save;
- (void)dealloc;
- (void)reset;
@end

@implementation SEMSandbox

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (SEMSandbox)init
{
  v5 = objc_msgSend_UUID(MEMORY[0x263F08C38], a2, v2, v3);
  v9 = objc_msgSend_UUIDString(v5, v6, v7, v8);
  IsSaved_setEnumerator_settings = (SEMSandbox *)objc_msgSend_initWithSandboxId_sandboxIsSaved_setEnumerator_settings_(self, v10, (uint64_t)v9, 0, 0, 0);

  return IsSaved_setEnumerator_settings;
}

- (SEMSandbox)initWithSandboxId:(id)a3 sandboxIsSaved:(BOOL)a4 setEnumerator:(id)a5 settings:(id)a6
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v92.receiver = self;
  v92.super_class = (Class)SEMSandbox;
  v16 = [(SEMSandbox *)&v92 init];
  if (!v16)
  {
LABEL_14:
    v84 = v16;
    goto LABEL_16;
  }
  uint64_t v17 = objc_msgSend_copy(v10, v13, v14, v15);
  v18 = (void *)*((void *)v16 + 10);
  *((void *)v16 + 10) = v17;

  v16[56] = a4;
  v19 = objc_opt_class();
  uint64_t v22 = objc_msgSend__sandboxBaseNameWithId_(v19, v20, (uint64_t)v10, v21);
  v23 = (void *)*((void *)v16 + 2);
  *((void *)v16 + 2) = v22;

  uint64_t v26 = *((void *)v16 + 2);
  if (a4)
  {
    uint64_t v27 = objc_msgSend_savedBaseWithName_(SEMAuxiliaryFilesystemBase, v24, v26, v25);
    v28 = (void *)*((void *)v16 + 6);
    *((void *)v16 + 6) = v27;

    v31 = (const char *)objc_msgSend_cStringUsingEncoding_(*((void **)v16 + 2), v29, 4, v30);
    v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v33 = dispatch_queue_create(v31, v32);
    v34 = (void *)*((void *)v16 + 1);
    *((void *)v16 + 1) = v33;

    objc_msgSend__loadSavedSettings(v16, v35, v36, v37);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v39 = objc_msgSend_temporaryBaseWithName_(SEMAuxiliaryFilesystemBase, v24, v26, v25);
    v40 = (void *)*((void *)v16 + 6);
    *((void *)v16 + 6) = v39;

    v43 = (const char *)objc_msgSend_cStringUsingEncoding_(*((void **)v16 + 2), v41, 4, v42);
    v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v45 = dispatch_queue_create(v43, v44);
    v46 = (void *)*((void *)v16 + 1);
    *((void *)v16 + 1) = v45;

    if (v12)
    {
      id v38 = v12;
    }
    else
    {
      objc_msgSend_defaultSandboxSettings(SEMSandboxSettings, v47, v48, v49);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v50 = (void *)*((void *)v16 + 4);
  *((void *)v16 + 4) = v38;

  if (!*((void *)v16 + 4))
  {
    v84 = 0;
    goto LABEL_16;
  }
  v51 = (void **)(v16 + 64);
  objc_storeStrong((id *)v16 + 8, a5);
  if (!*((void *)v16 + 8))
  {
    uint64_t v54 = objc_msgSend_setEnumeratorWithSerializedSets_(MEMORY[0x263F31768], v52, MEMORY[0x263EFFA68], v53);
    v55 = *v51;
    *v51 = (void *)v54;
  }
  id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v57 = (void *)*((void *)v16 + 9);
  *((void *)v16 + 9) = v56;

  v58 = [SEMSandboxIndexSiteCache alloc];
  v62 = objc_msgSend_rootDirectory(*((void **)v16 + 6), v59, v60, v61);
  uint64_t Only = objc_msgSend_initWithManagerDirectory_sharedOverrideCache_readOnly_(v58, v63, (uint64_t)v62, *((void *)v16 + 9), 0);
  v65 = (void *)*((void *)v16 + 12);
  *((void *)v16 + 12) = Only;

  v66 = [SEMSandboxIndexSiteCache alloc];
  v70 = objc_msgSend_rootDirectory(*((void **)v16 + 6), v67, v68, v69);
  uint64_t v72 = objc_msgSend_initWithManagerDirectory_sharedOverrideCache_readOnly_(v66, v71, (uint64_t)v70, *((void *)v16 + 9), 1);
  v73 = (void *)*((void *)v16 + 11);
  *((void *)v16 + 11) = v72;

  v74 = [SEMIndexSiteManager alloc];
  v78 = objc_msgSend_rootDirectory(*((void **)v16 + 6), v75, v76, v77);
  uint64_t v80 = objc_msgSend_initWithManagerDirectory_indexSiteCache_setEnumerator_settings_(v74, v79, (uint64_t)v78, *((void *)v16 + 12), *((void *)v16 + 8), *((void *)v16 + 4));
  v81 = (void *)*((void *)v16 + 13);
  *((void *)v16 + 13) = v80;

  if (v16[56] || (v84 = 0, objc_msgSend_performMaintenance_(*((void **)v16 + 13), v82, 0, v83)))
  {
    v85 = [SEMIndexSiteReadAccess alloc];
    uint64_t v87 = objc_msgSend_initWithIndexSiteCache_settings_(v85, v86, *((void *)v16 + 11), *((void *)v16 + 4));
    v88 = (void *)*((void *)v16 + 5);
    *((void *)v16 + 5) = v87;

    v89 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v90 = *((void *)v16 + 2);
      *(_DWORD *)buf = 136315394;
      v94 = "-[SEMSandbox initWithSandboxId:sandboxIsSaved:setEnumerator:settings:]";
      __int16 v95 = 2112;
      uint64_t v96 = v90;
      _os_log_impl(&dword_25C7CA000, v89, OS_LOG_TYPE_INFO, "%s Initialized %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_16:

  return v84;
}

+ (id)loadWithSandboxId:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_copy(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v6 = objc_opt_class();
  v9 = objc_msgSend__sandboxBaseNameWithId_(v6, v7, (uint64_t)v5, v8);
  char v12 = objc_msgSend_savedBaseExistsWithName_(SEMAuxiliaryFilesystemBase, v10, (uint64_t)v9, v11);

  if (v12)
  {
    id v15 = objc_alloc((Class)objc_opt_class());
    IsSaved_setEnumerator_settings = objc_msgSend_initWithSandboxId_sandboxIsSaved_setEnumerator_settings_(v15, v16, (uint64_t)v5, 1, 0, 0);
    if (IsSaved_setEnumerator_settings)
    {
      id v20 = IsSaved_setEnumerator_settings;
      uint64_t v21 = v20;
      goto LABEL_13;
    }
    v28 = (void *)MEMORY[0x263F087E8];
    v29 = objc_msgSend_stringWithFormat_(NSString, v18, @"Could not load saved sandbox. Required sandbox state failed to be loaded from the filesystem. SandboxId: %@", v19, v5, *MEMORY[0x263F07F80]);
    uint64_t v37 = v29;
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)&v37, (uint64_t)&v36, 1);
    dispatch_queue_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, @"com.apple.siri.inference.EntityMatcher.sandbox", 2, v31);
    v34 = v33;
    if (a4 && v33) {
      *a4 = v33;
    }

    id v20 = 0;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F07F80];
    objc_msgSend_stringWithFormat_(NSString, v13, @"Could not load saved sandbox. No sandbox with id: %@ exists on the filesystem.", v14, v5);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v39[0] = v20;
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v39, (uint64_t)&v38, 1);
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(v22, v25, @"com.apple.siri.inference.EntityMatcher.sandbox", 1, v24);
    uint64_t v27 = v26;
    if (a4 && v26) {
      *a4 = v26;
    }
  }
  uint64_t v21 = 0;
LABEL_13:

  return v21;
}

+ (id)sandboxWithRawSpeechProfile:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(v5, v6, @"language", v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x263EFF960], v9, (uint64_t)v8, v10);
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2050000000;
    char v12 = (void *)qword_26B354A68;
    uint64_t v41 = qword_26B354A68;
    if (!qword_26B354A68)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_25C807890;
      dispatch_queue_t v45 = &unk_2654DED28;
      v46 = &v38;
      sub_25C807890((uint64_t)buf);
      char v12 = (void *)v39[3];
    }
    v13 = v12;
    _Block_object_dispose(&v38, 8);
    id v14 = [v13 alloc];
    uint64_t v17 = objc_msgSend_initWithOmittedItemTypes_(v14, v15, 0, v16);
    id v37 = 0;
    LODWORD(v13) = objc_msgSend_setPrimaryRawSpeechProfile_error_(v17, v18, (uint64_t)v5, (uint64_t)&v37);
    id v19 = v37;
    uint64_t v22 = v19;
    if (v13)
    {
      id v36 = v19;
      v23 = objc_msgSend_convertToKVProfileWithError_(v17, v20, (uint64_t)&v36, v21);
      id v24 = v36;

      if (v23)
      {
        uint64_t v25 = objc_opt_class();
        uint64_t v27 = objc_msgSend_sandboxWithKVProfile_locale_error_(v25, v26, (uint64_t)v23, (uint64_t)v11, a4);

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v22 = v24;
    }
    v34 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "+[SEMSandbox sandboxWithRawSpeechProfile:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_error_impl(&dword_25C7CA000, v34, OS_LOG_TYPE_ERROR, "%s Failed to convert rawSpeechProfile using CESRRawSpeechProfileConverter due to error: %@", buf, 0x16u);
    }
    uint64_t v27 = 0;
    if (a4 && v22)
    {
      id v24 = v22;
      uint64_t v27 = 0;
      *a4 = v24;
    }
    else
    {
      id v24 = v22;
    }
    goto LABEL_19;
  }
  v28 = (void *)MEMORY[0x263F087E8];
  uint64_t v42 = *MEMORY[0x263F08320];
  v29 = objc_msgSend_stringWithFormat_(NSString, v9, @"Failed to extract locale identifier from profile: %@", v10, v5);
  v43 = v29;
  v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)&v43, (uint64_t)&v42, 1);
  objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, @"com.apple.siri.inference.EntityMatcher.sandbox", 3, v31);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v33 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[SEMSandbox sandboxWithRawSpeechProfile:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v24;
    _os_log_error_impl(&dword_25C7CA000, v33, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  uint64_t v27 = 0;
  if (a4 && v24)
  {
    id v24 = v24;
    uint64_t v27 = 0;
    *a4 = v24;
  }
LABEL_20:

  return v27;
}

+ (id)sandboxWithKVProfile:(id)a3 locale:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = 0;
    uint64_t v11 = objc_msgSend_toSerializedSets_(v8, v9, (uint64_t)&v32, v10);

    id v12 = v32;
    v13 = v12;
    if (v11)
    {
      id v14 = objc_opt_class();
      uint64_t v16 = objc_msgSend_sandboxWithSerializedSets_locale_error_(v14, v15, (uint64_t)v11, (uint64_t)v7, a5);
    }
    else
    {
      if (a5 && v12) {
        *a5 = v12;
      }
      uint64_t v30 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "+[SEMSandbox sandboxWithKVProfile:locale:error:]";
        __int16 v35 = 2112;
        id v36 = v13;
        _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F08320];
    v18 = NSString;
    id v19 = (objc_class *)objc_opt_class();

    id v20 = NSStringFromClass(v19);
    uint64_t v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    uint64_t v25 = objc_msgSend_stringWithFormat_(v18, v23, @"Invalid profile: %@ expected %@", v24, v20, v22);
    v38[0] = v25;
    uint64_t v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)v38, (uint64_t)&v37, 1);
    v13 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v28, @"com.apple.siri.inference.EntityMatcher.sandbox", 3, v27);

    if (a5 && v13) {
      *a5 = v13;
    }
    v29 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "+[SEMSandbox sandboxWithKVProfile:locale:error:]";
      __int16 v35 = 2112;
      id v36 = v13;
      _os_log_error_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)sandboxWithSerializedSets:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F31768];
  id v8 = a4;
  uint64_t v11 = objc_msgSend_setEnumeratorWithSerializedSets_(v7, v9, (uint64_t)a3, v10);
  id v12 = objc_opt_class();
  id v14 = objc_msgSend_sandboxWithSetEnumerator_locale_error_(v12, v13, (uint64_t)v11, (uint64_t)v8, a5);

  return v14;
}

+ (id)sandboxWithSetEnumerator:(id)a3 locale:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v33 = 0;
  v9 = objc_msgSend_sandboxSettingsWithLocale_error_(SEMSandboxSettings, v8, (uint64_t)a4, (uint64_t)&v33);
  id v10 = v33;
  uint64_t v11 = v10;
  if (v9)
  {
    id v12 = objc_alloc((Class)objc_opt_class());
    uint64_t v16 = objc_msgSend_UUID(MEMORY[0x263F08C38], v13, v14, v15);
    id v20 = objc_msgSend_UUIDString(v16, v17, v18, v19);
    IsSaved_setEnumerator_settings = objc_msgSend_initWithSandboxId_sandboxIsSaved_setEnumerator_settings_(v12, v21, (uint64_t)v20, 0, v7, v9);

    if (IsSaved_setEnumerator_settings)
    {
      uint64_t v24 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v37 = "+[SEMSandbox sandboxWithSetEnumerator:locale:error:]";
        _os_log_impl(&dword_25C7CA000, v24, OS_LOG_TYPE_INFO, "%s Successfully staged profile data in SiriEntityMatcher Sandbox.", buf, 0xCu);
      }
      id v25 = IsSaved_setEnumerator_settings;
    }
    else
    {
      uint64_t v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      __int16 v35 = @"Failed to initialize SiriEntityMatcher Sandbox";
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)&v35, (uint64_t)&v34, 1);
      uint64_t v30 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v29, @"com.apple.siri.inference.EntityMatcher.sandbox", 2, v28);

      if (a5 && v30) {
        *a5 = v30;
      }
      v31 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "+[SEMSandbox sandboxWithSetEnumerator:locale:error:]";
        __int16 v38 = 2112;
        uint64_t v39 = v30;
        _os_log_error_impl(&dword_25C7CA000, v31, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      uint64_t v11 = v30;
    }
  }
  else
  {
    if (a5 && v10) {
      *a5 = v10;
    }
    uint64_t v26 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = "+[SEMSandbox sandboxWithSetEnumerator:locale:error:]";
      __int16 v38 = 2112;
      uint64_t v39 = v11;
      _os_log_error_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    IsSaved_setEnumerator_settings = 0;
  }

  return IsSaved_setEnumerator_settings;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C806B5C;
  block[3] = &unk_2654DE398;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)SEMSandbox;
  [(SEMSandbox *)&v4 dealloc];
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C806CCC;
  block[3] = &unk_2654DE398;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)save
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C806E40;
  block[3] = &unk_2654DE398;
  block[4] = self;
  dispatch_sync(queue, block);
  return self->_sandboxId;
}

- (BOOL)_saveSettings
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v4 = objc_msgSend_getOrCreateDirectoryWithRelativePath_(self->_base, a2, @"sandbox", v2);
  char v6 = objc_msgSend_writeObject_toFileWithName_inDirectory_(self->_base, v5, (uint64_t)self->_settings, @"settings", v4);
  if ((v6 & 1) == 0)
  {
    id v7 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[SEMSandbox _saveSettings]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, "%s Failed to save settings file to storage directory: %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return v6;
}

- (id)_loadSavedSettings
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v4 = objc_msgSend_getOrCreateDirectoryWithRelativePath_(self->_base, a2, @"sandbox", v2);
  base = self->_base;
  uint64_t v6 = objc_opt_class();
  id v8 = objc_msgSend_readFileWithName_objectClass_inDirectory_(base, v7, @"settings", v6, v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315650;
      uint64_t v13 = "-[SEMSandbox _loadSavedSettings]";
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Failed to load settings file from saved sandbox storage directory: %@ got: %@", (uint8_t *)&v12, 0x20u);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_loadSavedProfile
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend_getOrCreateDirectoryWithRelativePath_(self->_base, a2, @"sandbox", v2);
  id v5 = objc_msgSend_fileURLWithPath_relativeToURL_(NSURL, v4, @"profile", (uint64_t)v3);
  id v12 = 0;
  id v7 = objc_msgSend_profileWithContentsOfURL_error_(MEMORY[0x263F510D0], v6, (uint64_t)v5, (uint64_t)&v12);
  id v8 = v12;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "-[SEMSandbox _loadSavedProfile]";
      __int16 v15 = 2112;
      __int16 v16 = v3;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Failed to load profile from saved sandbox storage directory: %@ error: %@", buf, 0x20u);
    }
  }

  return v7;
}

+ (id)_sandboxBaseNameWithId:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Sandbox-%@", v3, a3);
}

- (id)rootDirectoryURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_25C80757C;
  id v10 = sub_25C80758C;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_25C807594;
  v5[3] = &unk_2654DE430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)appCustomVocabularySearcher
{
  id v3 = [SEMFTSMatcher alloc];
  uint64_t v6 = objc_msgSend_initWithFTSAccessProvider_(v3, v4, (uint64_t)self->_indexSiteReadAccess, v5);
  id v7 = [SEMAppCustomVocabularySearcher alloc];
  id v10 = objc_msgSend_initWithFtsMatcher_(v7, v8, (uint64_t)v6, v9);

  return v10;
}

- (id)appCustomVocabularySearcherWithUserId:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      id v12 = "-[SEMSandbox appCustomVocabularySearcherWithUserId:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, "%s Ignoring userId (%@) from deprecated API", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v9 = objc_msgSend_appCustomVocabularySearcher(self, v4, v5, v6);

  return v9;
}

- (id)indexMatcher
{
  id v3 = [SEMSpanMatcher alloc];
  indexSiteReadAccess = self->_indexSiteReadAccess;
  uint64_t v5 = objc_alloc_init(SEMSpanMatchResultInterpreter);
  id v7 = objc_msgSend_initWithSkitAccessProvider_resultInterpreter_(v3, v6, (uint64_t)indexSiteReadAccess, (uint64_t)v5);

  return v7;
}

- (NSString)sandboxId
{
  return self->_sandboxId;
}

- (SEMSandboxIndexSiteCache)readerCache
{
  return self->_readerCache;
}

- (SEMSandboxIndexSiteCache)writerCache
{
  return self->_writerCache;
}

- (SEMIndexSiteManager)indexSiteManager
{
  return self->_indexSiteManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSiteManager, 0);
  objc_storeStrong((id *)&self->_writerCache, 0);
  objc_storeStrong((id *)&self->_readerCache, 0);
  objc_storeStrong((id *)&self->_sandboxId, 0);
  objc_storeStrong((id *)&self->_sharedOverrideCache, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_indexSiteReadAccess, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
  objc_storeStrong((id *)&self->_sandboxBaseName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
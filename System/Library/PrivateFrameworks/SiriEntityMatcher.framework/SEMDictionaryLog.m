@interface SEMDictionaryLog
+ (void)initialize;
- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (BOOL)clear:(id *)a3;
- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionaryLog:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5;
- (SEMDictionaryLog)init;
- (SEMDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6;
- (SEMDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8;
- (id)allKeys;
- (id)description;
- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
@end

@implementation SEMDictionaryLog

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (SEMDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return (SEMDictionaryLog *)objc_msgSend_initWithFilename_protectionClass_directory_readOnly_create_error_(self, a2, (uint64_t)a3, 0xFFFFFFFFLL, a4, a5, 1, a6);
}

- (SEMDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v33[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  v31.receiver = self;
  v31.super_class = (Class)SEMDictionaryLog;
  v18 = [(SEMDictionaryLog *)&v31 init];
  if (!v18) {
    goto LABEL_5;
  }
  if (!v14 || !v15)
  {
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v24 = objc_msgSend_stringWithFormat_(NSString, v16, @"Invalid {filename: %@, directory: %@}", v17, v14, v15);
    v33[0] = v24;
    v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)v33, (uint64_t)&v32, 1);
    v28 = objc_msgSend_errorWithDomain_code_userInfo_(v23, v27, @"com.apple.SEMDictionaryLog", 2, v26);
    v29 = v28;
    if (a8 && v28) {
      *a8 = v28;
    }

    goto LABEL_10;
  }
  uint64_t v19 = objc_msgSend_fileURLWithPath_relativeToURL_(NSURL, v16, (uint64_t)v14, (uint64_t)v15);
  logFileURL = v18->_logFileURL;
  v18->_logFileURL = (NSURL *)v19;

  v18->_protectionClass = a4;
  if (!objc_msgSend__loadLogOrCreate_readOnly_error_(v18, v21, v9, v10, a8))
  {
LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v22 = v18;
LABEL_11:

  return v22;
}

- (SEMDictionaryLog)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v67[1] = *MEMORY[0x263EF8340];
  BOOL v9 = objc_msgSend_path(self->_logFileURL, a2, a3, a4);
  logFileURL = self->_logFileURL;
  id v53 = 0;
  sub_25C7F0098((uint64_t)logFileURL, (const char *)!v6, (uint64_t)&v53);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v12 = v53;
  log = self->_log;
  self->_log = v11;

  if (!self->_log)
  {
    uint64_t v29 = objc_msgSend_code(v12, v14, v15, v16);
    v30 = qword_26B3549D8;
    if (v29 == 260)
    {
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v9;
        _os_log_debug_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_DEBUG, "%s No prior log found at path: %@", buf, 0x16u);
      }
      uint64_t v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v62 = *MEMORY[0x263F08608];
      id v63 = v12;
      v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)&v63, (uint64_t)&v62, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, @"com.apple.SEMDictionaryLog", 6, v33);
      uint64_t v49 = LABEL_26:;

      id v12 = (id)v49;
      if (a3) {
        goto LABEL_14;
      }
LABEL_27:
      char v44 = 0;
      if (a5 && v12)
      {
        id v12 = v12;
        char v44 = 0;
        *a5 = v12;
      }
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v57 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v9;
      __int16 v60 = 2112;
      id v61 = v12;
      _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, "%s Failed to read prior log file at path: %@ error: %@", buf, 0x20u);
      if (v12) {
        goto LABEL_22;
      }
    }
    else if (v12)
    {
LABEL_22:
      uint64_t v54 = *MEMORY[0x263F08608];
      id v55 = v12;
      v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v48, (uint64_t)&v55, (uint64_t)&v54, 1);
LABEL_25:
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v48, @"com.apple.SEMDictionaryLog", 7, v33);
      goto LABEL_26;
    }
    v33 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6) {
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
    v52 = a5;
    v51 = (void *)MEMORY[0x263F087E8];
    uint64_t v66 = *MEMORY[0x263F08320];
    uint64_t v17 = NSString;
    v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v24 = objc_msgSend_stringWithFormat_(v17, v22, @"Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@", v23, v19, v21, self->_log, v9);
    v67[0] = v24;
    uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)v67, (uint64_t)&v66, 1);
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(v51, v27, @"com.apple.SEMDictionaryLog", 5, v26);

    id v12 = (id)v26;
  }
  else
  {
    v52 = a5;
    v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F08320];
    v36 = NSString;
    v37 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v37);
    v21 = objc_msgSend_stringWithFormat_(v36, v38, @"Unexpected plist class (%@) of object: %@ at path: %@", v39, v19, self->_log, v9);
    v65 = v21;
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v40, (uint64_t)&v65, (uint64_t)&v64, 1);
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v41, @"com.apple.SEMDictionaryLog", 5, v24);
  }

  v42 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
    __int16 v58 = 2112;
    uint64_t v59 = v28;
    _os_log_error_impl(&dword_25C7CA000, v42, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  id v12 = (id)v28;
  a5 = v52;
  if (!a3) {
    goto LABEL_27;
  }
LABEL_14:
  if (v6)
  {
    v43 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x263EFFA78];

LABEL_16:
    char v44 = 1;
    goto LABEL_30;
  }
  v45 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[SEMDictionaryLog _loadLogOrCreate:readOnly:error:]";
    __int16 v58 = 2112;
    uint64_t v59 = (uint64_t)v9;
    _os_log_impl(&dword_25C7CA000, v45, OS_LOG_TYPE_INFO, "%s Initializing empty log file at path: %@", buf, 0x16u);
  }
  v46 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v47 = self->_log;
  self->_log = v46;

  char v44 = sub_25C7EFEA8((uint64_t)self->_log, self->_logFileURL, self->_protectionClass, (uint64_t)a5);
LABEL_30:

  return v44;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)SEMDictionaryLog;
  v3 = [(SEMDictionaryLog *)&v12 description];
  v7 = objc_msgSend_path(self->_logFileURL, v4, v5, v6);
  BOOL v10 = objc_msgSend_stringByAppendingFormat_(v3, v8, @" logFile: %@", v9, v7);

  return v10;
}

- (BOOL)isReadOnly
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_log, a2, v2, v3);
}

- (id)allKeys
{
  return (id)objc_msgSend_allKeys(self->_log, a2, v2, v3);
}

- (id)objectForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_log, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_objectForKey_(self, v7, (uint64_t)v6, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
LABEL_13:
    uint64_t v26 = v10;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (id)objc_msgSend_mutableCopy(v9, v11, v12, v13);
    goto LABEL_13;
  }
  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    goto LABEL_13;
  }
  id v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v32 = *MEMORY[0x263F08320];
  uint64_t v15 = NSString;
  uint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  v20 = objc_msgSend_stringWithFormat_(v15, v18, @"Unexpected object: %@ for key: %@ expected: %@", v19, v9, v6, v17);
  v33[0] = v20;
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v33, (uint64_t)&v32, 1);
  v24 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v23, @"com.apple.SEMDictionaryLog", 4, v22);

  if (a4 && v24) {
    *a4 = v24;
  }
  v25 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v29 = "-[SEMDictionaryLog mutableDictionaryForKey:error:]";
    __int16 v30 = 2112;
    objc_super v31 = v24;
    _os_log_error_impl(&dword_25C7CA000, v25, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  uint64_t v26 = 0;
LABEL_14:

  return v26;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    id v28 = a3;
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = a4;
    id v10 = a3;
    uint64_t v12 = objc_msgSend_arrayWithObjects_count_(v8, v11, (uint64_t)&v28, 1);
    id v27 = v9;
    id v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)&v27, 1);

    char v16 = objc_msgSend_writeUpdatedObjects_forKeys_error_(self, v15, (uint64_t)v12, (uint64_t)v14, a5);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v18 = NSString;
    id v19 = a4;
    id v20 = a3;
    uint64_t v12 = objc_msgSend_stringWithFormat_(v18, v21, @"Invalid {object: %@ key: %@}", v22, v20, v19);
    v30[0] = v12;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v30, (uint64_t)&v29, 1);
    v25 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v24, @"com.apple.SEMDictionaryLog", 1, v14);

    if (a5 && v25) {
      *a5 = v25;
    }

    char v16 = 0;
  }

  return v16;
}

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  v111[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_isReadOnly(self, v10, v11, v12))
  {
    char v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v110 = *MEMORY[0x263F08320];
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v13, @"instance: %@ is read only.", v15, self);
    v111[0] = v17;
    id v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v111, (uint64_t)&v110, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v20, @"com.apple.SEMDictionaryLog", 3, v19);
    goto LABEL_17;
  }
  uint64_t v21 = objc_msgSend_count(v8, v13, v14, v15);
  if (v21 != objc_msgSend_count(v9, v22, v23, v24))
  {
    __int16 v58 = (void *)MEMORY[0x263F087E8];
    uint64_t v108 = *MEMORY[0x263F08320];
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v25, @"Unexpected number of objects: %@ for keys: %@", v26, v8, v9);
    v109 = v17;
    id v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)&v109, (uint64_t)&v108, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v58, v60, @"com.apple.SEMDictionaryLog", 1, v19);
    id v61 = LABEL_17:;
    uint64_t v62 = v61;
    if (a5 && v61) {
      *a5 = v61;
    }

    goto LABEL_21;
  }
  v93 = a5;
  id v27 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v31 = objc_msgSend_count(v9, v28, v29, v30);
  uint64_t v17 = objc_msgSend_initWithCapacity_(v27, v32, v31, v33);
  uint64_t v37 = objc_msgSend_count(v8, v34, v35, v36);
  if (objc_msgSend_count(v8, v38, v39, v40))
  {
    for (unint64_t i = 0; i < objc_msgSend_count(v8, v55, v56, v57); ++i)
    {
      char v44 = objc_msgSend_objectAtIndex_(v8, v41, i, v42);
      v47 = objc_msgSend_objectAtIndex_(v9, v45, i, v46);
      v52 = objc_msgSend_objectForKey_(v17, v48, (uint64_t)v47, v49);
      if (v52
        || (objc_msgSend_objectForKey_(self->_log, v50, (uint64_t)v47, v51),
            (v52 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (objc_msgSend_isEqual_(v52, v50, (uint64_t)v44, v51))
        {
          uint64_t v54 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v100 = "-[SEMDictionaryLog writeUpdatedObjects:forKeys:error:]";
            __int16 v101 = 2112;
            id v102 = v44;
            __int16 v103 = 2112;
            id v104 = v47;
            _os_log_debug_impl(&dword_25C7CA000, v54, OS_LOG_TYPE_DEBUG, "%s object: %@ is already recorded for key: %@", buf, 0x20u);
          }
          --v37;
          goto LABEL_14;
        }
        objc_msgSend_setObject_forKey_(v17, v53, (uint64_t)v52, (uint64_t)v47);
      }
      objc_msgSend_setObject_forKey_(self->_log, v50, (uint64_t)v44, (uint64_t)v47);
LABEL_14:
    }
  }
  if (!v37)
  {
    BOOL v63 = 1;
    goto LABEL_23;
  }
  logFileURL = self->_logFileURL;
  log = self->_log;
  int protectionClass = self->_protectionClass;
  id v98 = 0;
  char v68 = sub_25C7EFEA8((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v98);
  id v69 = v98;
  id v70 = v69;
  if (v68)
  {
    v71 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v100 = "-[SEMDictionaryLog writeUpdatedObjects:forKeys:error:]";
      __int16 v101 = 2112;
      id v102 = v8;
      __int16 v103 = 2112;
      id v104 = v9;
      __int16 v105 = 2112;
      v106 = v17;
      _os_log_debug_impl(&dword_25C7CA000, v71, OS_LOG_TYPE_DEBUG, "%s Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x2Au);
    }
    BOOL v63 = 1;
    id v19 = v70;
    goto LABEL_22;
  }
  v92 = v69;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v72 = v9;
  uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v94, (uint64_t)v107, 16);
  if (v74)
  {
    uint64_t v77 = v74;
    uint64_t v78 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v77; ++j)
      {
        if (*(void *)v95 != v78) {
          objc_enumerationMutation(v72);
        }
        uint64_t v80 = *(void *)(*((void *)&v94 + 1) + 8 * j);
        v83 = objc_msgSend_objectForKey_(v17, v75, v80, v76);
        v84 = self->_log;
        if (v83) {
          objc_msgSend_setObject_forKey_(v84, v81, (uint64_t)v83, v80);
        }
        else {
          objc_msgSend_removeObjectForKey_(v84, v81, v80, v82);
        }
      }
      uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v94, (uint64_t)v107, 16);
    }
    while (v77);
  }

  id v85 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v88 = objc_msgSend_stringWithFormat_(NSString, v86, @"Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@", v87, v8, v72, v17);
  objc_msgSend_setObject_forKey_(v85, v89, (uint64_t)v88, *MEMORY[0x263F08320]);

  if (v92) {
    objc_msgSend_setObject_forKey_(v85, v90, (uint64_t)v92, *MEMORY[0x263F08608]);
  }
  id v19 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v90, @"com.apple.SEMDictionaryLog", 8, v85);

  if (v93 && v19) {
    id *v93 = v19;
  }
  v91 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v100 = "-[SEMDictionaryLog writeUpdatedObjects:forKeys:error:]";
    __int16 v101 = 2112;
    id v102 = v19;
    _os_log_error_impl(&dword_25C7CA000, v91, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

LABEL_21:
  BOOL v63 = 0;
LABEL_22:

LABEL_23:
  return v63;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend_isReadOnly(self, v7, v8, v9))
  {
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F08320];
    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v10, @"instance: %@ is read only.", v11, self);
    v52[0] = v13;
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v52, (uint64_t)&v51, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, @"com.apple.SEMDictionaryLog", 3, v15);
    goto LABEL_10;
  }
  if (!v6)
  {
    id v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08320];
    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v10, @"Invalid key: %@", v11, 0);
    v50 = v13;
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)&v50, (uint64_t)&v49, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, @"com.apple.SEMDictionaryLog", 1, v15);
    uint64_t v31 = LABEL_10:;
    uint64_t v32 = v31;
    if (a4 && v31) {
      *a4 = v31;
    }

    char v23 = 0;
    goto LABEL_26;
  }
  uint64_t v17 = objc_msgSend_objectForKey_(self->_log, v10, (uint64_t)v6, v11);
  if (v17)
  {
    uint64_t v13 = (void *)v17;
    objc_msgSend_removeObjectForKey_(self->_log, v18, (uint64_t)v6, v19);
    logFileURL = self->_logFileURL;
    log = self->_log;
    int protectionClass = self->_protectionClass;
    id v42 = 0;
    char v23 = sub_25C7EFEA8((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v42);
    id v25 = v42;
    if (v23)
    {
      uint64_t v26 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        char v44 = "-[SEMDictionaryLog clearObjectForKey:error:]";
        __int16 v45 = 2112;
        id v46 = v13;
        __int16 v47 = 2112;
        id v48 = v6;
        _os_log_debug_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_DEBUG, "%s Removed object: %@ for key: %@", buf, 0x20u);
      }
      id v27 = v25;
    }
    else
    {
      objc_msgSend_setObject_forKey_(self->_log, v24, (uint64_t)v13, (uint64_t)v6);
      id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v37 = objc_msgSend_stringWithFormat_(NSString, v35, @"Failed to write removal for key: %@ reverting to prior object: %@", v36, v6, v13);
      objc_msgSend_setObject_forKey_(v34, v38, (uint64_t)v37, *MEMORY[0x263F08320]);

      if (v25) {
        objc_msgSend_setObject_forKey_(v34, v39, (uint64_t)v25, *MEMORY[0x263F08608]);
      }
      id v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v39, @"com.apple.SEMDictionaryLog", 8, v34);

      if (a4 && v27) {
        *a4 = v27;
      }
      uint64_t v40 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        char v44 = "-[SEMDictionaryLog clearObjectForKey:error:]";
        __int16 v45 = 2112;
        id v46 = v27;
        _os_log_error_impl(&dword_25C7CA000, v40, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v33 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      char v44 = "-[SEMDictionaryLog clearObjectForKey:error:]";
      __int16 v45 = 2112;
      id v46 = v6;
      _os_log_debug_impl(&dword_25C7CA000, v33, OS_LOG_TYPE_DEBUG, "%s No object exists for key: %@", buf, 0x16u);
    }
    uint64_t v13 = 0;
    char v23 = 1;
  }
LABEL_26:

  return v23;
}

- (BOOL)clear:(id *)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  if (objc_msgSend_isReadOnly(self, a2, (uint64_t)a3, v3))
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    id v10 = objc_msgSend_stringWithFormat_(NSString, v6, @"instance: %@ is read only.", v8, self);
    v40[0] = v10;
    uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v40, (uint64_t)&v39, 1);
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(v9, v13, @"com.apple.SEMDictionaryLog", 3, v12);
    id v15 = v14;
    BOOL v16 = 0;
    if (a3 && v14)
    {
      id v15 = v14;
      BOOL v16 = 0;
      *a3 = v15;
    }
    goto LABEL_18;
  }
  uint64_t v12 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8);
  objc_msgSend_path(self->_logFileURL, v17, v18, v19);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15 || !objc_msgSend_fileExistsAtPath_(v12, v20, (uint64_t)v15, v22))
  {
    id v25 = 0;
    goto LABEL_17;
  }
  logFileURL = self->_logFileURL;
  id v34 = 0;
  char v24 = objc_msgSend_removeItemAtURL_error_(v12, v20, (uint64_t)logFileURL, (uint64_t)&v34);
  id v25 = v34;
  if (v24)
  {
LABEL_17:
    objc_msgSend_removeAllObjects(self->_log, v20, v21, v22);
    BOOL v16 = 1;
    id v10 = v25;
    goto LABEL_18;
  }
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v29 = objc_msgSend_stringWithFormat_(NSString, v27, @"Failed to remove log file at path: %@", v28, v15);
  objc_msgSend_setObject_forKey_(v26, v30, (uint64_t)v29, *MEMORY[0x263F08320]);

  if (v25) {
    objc_msgSend_setObject_forKey_(v26, v31, (uint64_t)v25, *MEMORY[0x263F08608]);
  }
  id v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"com.apple.SEMDictionaryLog", 8, v26);

  if (a3 && v10) {
    *a3 = v10;
  }
  uint64_t v32 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v36 = "-[SEMDictionaryLog clear:]";
    __int16 v37 = 2112;
    v38 = v10;
    _os_log_error_impl(&dword_25C7CA000, v32, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  BOOL v16 = 0;
LABEL_18:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char isEqualToDictionaryLog = objc_msgSend_isEqualToDictionaryLog_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToDictionaryLog = 0;
  }

  return isEqualToDictionaryLog;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqual_(self->_logFileURL, v5, v4[1], v6)
    && self->_protectionClass == *((_DWORD *)v4 + 6))
  {
    char isEqual = objc_msgSend_isEqual_(self->_log, v7, v4[2], v8);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_logFileURL, a2, v2, v3);
  uint64_t v8 = objc_msgSend_numberWithInt_(NSNumber, v6, self->_protectionClass, v7);
  uint64_t v12 = objc_msgSend_hash(v8, v9, v10, v11);
  unint64_t v16 = v12 ^ v5 ^ objc_msgSend_hash(self->_log, v13, v14, v15);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
}

@end
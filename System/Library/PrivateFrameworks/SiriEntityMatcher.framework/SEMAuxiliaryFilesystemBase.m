@interface SEMAuxiliaryFilesystemBase
+ (BOOL)savedBaseExistsWithName:(id)a3;
+ (id)_savedBaseDirectoryURLWithName:(id)a3;
+ (id)savedBaseWithName:(id)a3;
+ (id)temporaryBaseWithName:(id)a3;
- (SEMAuxiliaryFilesystemBase)initWithName:(id)a3 isSaved:(BOOL)a4;
- (id)save;
- (void)remove;
@end

@implementation SEMAuxiliaryFilesystemBase

+ (id)temporaryBaseWithName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  isSaved = objc_msgSend_initWithName_isSaved_(v4, v5, (uint64_t)v3, 0);

  return isSaved;
}

+ (id)savedBaseWithName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  isSaved = objc_msgSend_initWithName_isSaved_(v4, v5, (uint64_t)v3, 1);

  return isSaved;
}

- (SEMAuxiliaryFilesystemBase)initWithName:(id)a3 isSaved:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!objc_msgSend_length(v6, v7, v8, v9))
  {
    v17 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      v31 = 0;
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315394;
    v35 = "-[SEMAuxiliaryFilesystemBase initWithName:isSaved:]";
    __int16 v36 = 2112;
    id v37 = v6;
    v18 = "%s Invalid name: %@";
LABEL_18:
    _os_log_error_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    goto LABEL_15;
  }
  if (!v4)
  {
    objc_msgSend_stringWithFormat_(NSString, v10, @"com.apple.siri.vocabulary/%@", v11, v6);
    goto LABEL_8;
  }
  v12 = objc_opt_class();
  if ((objc_msgSend_savedBaseExistsWithName_(v12, v13, (uint64_t)v6, v14) & 1) == 0)
  {
    v17 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315394;
    v35 = "-[SEMAuxiliaryFilesystemBase initWithName:isSaved:]";
    __int16 v36 = 2112;
    id v37 = v6;
    v18 = "%s No saved filesystem base exists with name: %@";
    goto LABEL_18;
  }
  objc_msgSend_stringWithFormat_(NSString, v15, @"Library/Assistant/SiriVocabulary-Staged/%@", v16, v6);
  v19 = LABEL_8:;
  if (v4)
  {
    id v20 = (id)CPSharedResourcesDirectory();
  }
  else
  {
    NSTemporaryDirectory();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  v22 = objc_opt_class();
  v24 = objc_msgSend_baseURLWithTargetDirectoryPath_relativeToDirectoryPath_(v22, v23, (uint64_t)v19, (uint64_t)v21);
  v33.receiver = self;
  v33.super_class = (Class)SEMAuxiliaryFilesystemBase;
  v28 = [(SEMFilesystemBase *)&v33 initWithRootDirectoryURL:v24];
  if (v28)
  {
    uint64_t v29 = objc_msgSend_copy(v6, v25, v26, v27);
    name = v28->_name;
    v28->_name = (NSString *)v29;

    v28->_isSaved = v4;
  }
  self = v28;

  v31 = self;
LABEL_16:

  return v31;
}

- (id)save
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (!self->_isSaved)
  {
    uint64_t v8 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend__savedBaseDirectoryURLWithName_(v9, v10, (uint64_t)self->_name, v11);
    uint64_t v16 = objc_msgSend_URLByDeletingLastPathComponent(v12, v13, v14, v15);
    id v20 = objc_msgSend_path(v16, v17, v18, v19);
    char v23 = objc_msgSend_fileExistsAtPath_(v8, v21, (uint64_t)v20, v22);

    if (v23)
    {
      uint64_t v27 = objc_msgSend_path(v12, v24, v25, v26);
      int v30 = objc_msgSend_fileExistsAtPath_(v8, v28, (uint64_t)v27, v29);

      if (v30)
      {
        v34 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v53 = "-[SEMAuxiliaryFilesystemBase save]";
          __int16 v54 = 2112;
          v55 = (NSString *)v12;
          _os_log_impl(&dword_25C7CA000, v34, OS_LOG_TYPE_INFO, "%s Overwriting saved base directory at URL: %@", buf, 0x16u);
        }
        id v50 = 0;
        char v36 = objc_msgSend_removeItemAtURL_error_(v8, v35, (uint64_t)v12, (uint64_t)&v50);
        id v37 = (NSString *)v50;
        if ((v36 & 1) == 0)
        {
          uint64_t v38 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v53 = "-[SEMAuxiliaryFilesystemBase save]";
            __int16 v54 = 2112;
            v55 = v37;
            v39 = "%s Failed to remove saved based directory. error: %@";
LABEL_25:
            _os_log_error_impl(&dword_25C7CA000, v38, OS_LOG_TYPE_ERROR, v39, buf, 0x16u);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else
      {
        id v37 = 0;
      }
    }
    else
    {
      id v51 = 0;
      char v40 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v8, v24, (uint64_t)v16, 1, 0, &v51);
      id v37 = (NSString *)v51;
      if ((v40 & 1) == 0)
      {
        uint64_t v38 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v53 = "-[SEMAuxiliaryFilesystemBase save]";
          __int16 v54 = 2112;
          v55 = v37;
          v39 = "%s Failed to create save directory. error: %@";
          goto LABEL_25;
        }
LABEL_19:
        v7 = 0;
        goto LABEL_20;
      }
    }
    v41 = v37;
    v42 = objc_msgSend_rootDirectory(self, v31, v32, v33);
    v49 = v37;
    char v44 = objc_msgSend_copyItemAtURL_toURL_error_(v8, v43, (uint64_t)v42, (uint64_t)v12, &v49);
    id v37 = v49;

    if (v44)
    {
      v45 = objc_opt_class();
      objc_msgSend_savedBaseWithName_(v45, v46, (uint64_t)self->_name, v47);
      v7 = (SEMAuxiliaryFilesystemBase *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v38 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[SEMAuxiliaryFilesystemBase save]";
      __int16 v54 = 2112;
      v55 = v37;
      v39 = "%s Failed to copy base to saved directory. error: %@";
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  v5 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    name = self->_name;
    *(_DWORD *)buf = 136315394;
    v53 = "-[SEMAuxiliaryFilesystemBase save]";
    __int16 v54 = 2112;
    v55 = name;
    _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s base with name: %@ is already saved.", buf, 0x16u);
  }
  v7 = self;
LABEL_21:
  return v7;
}

- (void)remove
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend_rootDirectory(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_path(v4, v5, v6, v7);

  v12 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v9, v10, v11);
  id v17 = 0;
  char v14 = objc_msgSend_removeItemAtPath_error_(v12, v13, (uint64_t)v8, (uint64_t)&v17);
  id v15 = v17;

  if ((v14 & 1) == 0)
  {
    uint64_t v16 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = "-[SEMAuxiliaryFilesystemBase remove]";
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Failed to remove base directory at path: %@ error: %@", buf, 0x20u);
    }
  }
}

+ (id)_savedBaseDirectoryURLWithName:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v5, @"Library/Assistant/SiriVocabulary-Staged/%@", v6, v3);

  uint64_t v8 = CPSharedResourcesDirectory();
  uint64_t v10 = objc_msgSend_baseURLWithTargetDirectoryPath_relativeToDirectoryPath_(v4, v9, (uint64_t)v7, v8);

  return v10;
}

+ (BOOL)savedBaseExistsWithName:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend__savedBaseDirectoryURLWithName_(v4, v5, (uint64_t)v3, v6);

  char v20 = 0;
  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10);
  id v15 = objc_msgSend_path(v7, v12, v13, v14);
  char isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v11, v16, (uint64_t)v15, (uint64_t)&v20);

  if (v20) {
    BOOL v18 = isDirectory;
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
}

@end
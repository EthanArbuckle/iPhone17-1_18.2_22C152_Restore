@interface SEMFilesystemBase
+ (id)baseURLWithTargetDirectoryPath:(id)a3 relativeToDirectoryPath:(id)a4;
- (BOOL)_fileExistsAtURL:(id)a3;
- (BOOL)fileExistsWithName:(id)a3 inDirectory:(id)a4;
- (BOOL)isChildOfRootDirectory:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFileManager:(id)a3;
- (BOOL)removeAllContents;
- (BOOL)removeItemAtURL:(id)a3;
- (BOOL)writeDictionary:(id)a3 toPlistFileWithName:(id)a4 inDirectory:(id)a5;
- (BOOL)writeObject:(id)a3 toFileWithName:(id)a4 inDirectory:(id)a5;
- (NSURL)rootDirectory;
- (SEMFilesystemBase)init;
- (SEMFilesystemBase)initWithRootDirectoryURL:(id)a3;
- (id)_resolveFileURLFromName:(id)a3 directory:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getOrCreateDirectoryWithRelativePath:(id)a3;
- (id)readDictionaryFromPlistFileWithName:(id)a3 inDirectory:(id)a4;
- (id)readFileWithName:(id)a3 objectClass:(Class)a4 inDirectory:(id)a5;
- (unint64_t)hash;
@end

@implementation SEMFilesystemBase

- (BOOL)writeObject:(id)a3 toFileWithName:(id)a4 inDirectory:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v10 = objc_msgSend__resolveFileURLFromName_directory_(self, v9, (uint64_t)a4, (uint64_t)a5);
  if (!v10)
  {
LABEL_10:
    char v28 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v31 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SEMFilesystemBase(FileStorage) writeObject:toFileWithName:inDirectory:]";
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_error_impl(&dword_25C7CA000, v31, OS_LOG_TYPE_ERROR, "%s Cannot archive object: %@ which does not conform to NSSecureCoding.", buf, 0x16u);
    }
    goto LABEL_10;
  }
  id v11 = objc_alloc(MEMORY[0x263F08910]);
  inited = objc_msgSend_initRequiringSecureCoding_(v11, v12, 1, v13);
  objc_msgSend_encodeWithCoder_(v8, v15, (uint64_t)inited, v16);
  objc_msgSend_finishEncoding(inited, v17, v18, v19);
  v23 = objc_msgSend_encodedData(inited, v20, v21, v22);
  if (objc_msgSend_length(v23, v24, v25, v26))
  {
    id v34 = 0;
    char v28 = objc_msgSend_writeToURL_options_error_(v23, v27, (uint64_t)v10, 0, &v34);
    id v29 = v34;
    if ((v28 & 1) == 0)
    {
      v30 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "-[SEMFilesystemBase(FileStorage) writeObject:toFileWithName:inDirectory:]";
        __int16 v37 = 2112;
        id v38 = v10;
        __int16 v39 = 2112;
        id v40 = v29;
        _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, "%s Failed to write encoded object to file at URL: %@ error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v32 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SEMFilesystemBase(FileStorage) writeObject:toFileWithName:inDirectory:]";
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_error_impl(&dword_25C7CA000, v32, OS_LOG_TYPE_ERROR, "%s Failed to encode object: %@", buf, 0x16u);
    }
    char v28 = 0;
  }

LABEL_15:
  return v28;
}

- (id)_resolveFileURLFromName:(id)a3 directory:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_length(v6, v8, v9, v10))
  {
    if (!v7)
    {
      id v29 = NSURL;
      v30 = objc_msgSend_rootDirectory(self, v11, v12, v13);
      uint64_t v26 = objc_msgSend_fileURLWithPath_relativeToURL_(v29, v31, (uint64_t)v6, (uint64_t)v30);

      goto LABEL_15;
    }
    if (objc_msgSend_isChildOfRootDirectory_(self, v11, (uint64_t)v7, v13))
    {
      v17 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v14, v15, v16);
      uint64_t v21 = objc_msgSend_path(v7, v18, v19, v20);
      char v24 = objc_msgSend_fileExistsAtPath_(v17, v22, (uint64_t)v21, v23);

      if (v24)
      {
        uint64_t v26 = objc_msgSend_fileURLWithPath_relativeToURL_(NSURL, v25, (uint64_t)v6, (uint64_t)v7);
        goto LABEL_15;
      }
      v27 = qword_26B3549D8;
      if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v33 = 136315394;
      id v34 = "-[SEMFilesystemBase(FileStorage) _resolveFileURLFromName:directory:]";
      __int16 v35 = 2112;
      id v36 = v7;
      char v28 = "%s No directory exists at URL: %@";
      goto LABEL_13;
    }
    v27 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v33 = 136315394;
      id v34 = "-[SEMFilesystemBase(FileStorage) _resolveFileURLFromName:directory:]";
      __int16 v35 = 2112;
      id v36 = v7;
      char v28 = "%s directory: %@ is not a child directory of filesystem base root directory.";
      goto LABEL_13;
    }
  }
  else
  {
    v27 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v33 = 136315394;
      id v34 = "-[SEMFilesystemBase(FileStorage) _resolveFileURLFromName:directory:]";
      __int16 v35 = 2112;
      id v36 = v6;
      char v28 = "%s Invalid file name: %@";
LABEL_13:
      _os_log_error_impl(&dword_25C7CA000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v33, 0x16u);
    }
  }
LABEL_14:
  uint64_t v26 = 0;
LABEL_15:

  return v26;
}

- (BOOL)fileExistsWithName:(id)a3 inDirectory:(id)a4
{
  id v7 = objc_msgSend__resolveFileURLFromName_directory_(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v7) {
    char v8 = objc_msgSend__fileExistsAtURL_(self, v5, (uint64_t)v7, v6);
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_fileExistsAtURL:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  char v8 = objc_msgSend_defaultManager(v3, v5, v6, v7);
  uint64_t v12 = objc_msgSend_path(v4, v9, v10, v11);

  LOBYTE(v4) = objc_msgSend_fileExistsAtPath_(v8, v13, (uint64_t)v12, v14);
  return (char)v4;
}

- (id)readFileWithName:(id)a3 objectClass:(Class)a4 inDirectory:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v10 = a5;
  if (a4)
  {
    uint64_t v13 = objc_msgSend__resolveFileURLFromName_directory_(self, v9, (uint64_t)v8, (uint64_t)v10);
    if (v13)
    {
      if (objc_msgSend__fileExistsAtURL_(self, v11, (uint64_t)v13, v12))
      {
        id v37 = 0;
        uint64_t v15 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x263EFF8F8], v14, (uint64_t)v13, 0, &v37);
        id v16 = v37;
        id v17 = v16;
        if (!v15 || v16)
        {
          uint64_t v25 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v39 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
            __int16 v40 = 2112;
            uint64_t v41 = v13;
            __int16 v42 = 2112;
            id v43 = v17;
            _os_log_error_impl(&dword_25C7CA000, v25, OS_LOG_TYPE_ERROR, "%s Failed to read binary file at path: %@ due to error: %@", buf, 0x20u);
          }
          uint64_t v22 = 0;
          goto LABEL_19;
        }
        id v18 = objc_alloc(MEMORY[0x263F08928]);
        id v36 = 0;
        uint64_t v20 = objc_msgSend_initForReadingFromData_error_(v18, v19, (uint64_t)v15, (uint64_t)&v36);
        id v17 = v36;
        if (v17)
        {
          uint64_t v21 = qword_26B3549D8;
          if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 136315650;
          __int16 v39 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
          __int16 v40 = 2112;
          uint64_t v41 = v13;
          __int16 v42 = 2112;
          id v43 = v17;
          v32 = "%s Failed to decode object from binary file contents at path: %@ error: %@";
          int v33 = v21;
          uint32_t v34 = 32;
        }
        else
        {
          if (v20)
          {
            id v27 = [a4 alloc];
            uint64_t v22 = objc_msgSend_initWithCoder_(v27, v28, (uint64_t)v20, v29);
            if (v22) {
              goto LABEL_9;
            }
            v30 = (id)qword_26B3549D8;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              __int16 v35 = NSStringFromClass(a4);
              *(_DWORD *)buf = 136315650;
              __int16 v39 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
              __int16 v40 = 2112;
              uint64_t v41 = v35;
              __int16 v42 = 2112;
              id v43 = v13;
              _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, "%s Failed to decode object type: %@ for file: '%@'", buf, 0x20u);
            }
LABEL_8:
            uint64_t v22 = 0;
LABEL_9:

LABEL_19:
            goto LABEL_20;
          }
          uint64_t v31 = qword_26B3549D8;
          if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 136315394;
          __int16 v39 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
          __int16 v40 = 2112;
          uint64_t v41 = v13;
          v32 = "%s Failed to get an instance of unarchiver from the serialized data for file: '%@'";
          int v33 = v31;
          uint32_t v34 = 22;
        }
        _os_log_error_impl(&dword_25C7CA000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
        goto LABEL_8;
      }
      char v24 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v39 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
        __int16 v40 = 2112;
        uint64_t v41 = v13;
        _os_log_error_impl(&dword_25C7CA000, v24, OS_LOG_TYPE_ERROR, "%s No file exists at path: %@", buf, 0x16u);
      }
    }
    uint64_t v22 = 0;
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v23 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v39 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
    _os_log_error_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_ERROR, "%s Cannot decode object from file with nil objectClass.", buf, 0xCu);
  }
  uint64_t v22 = 0;
LABEL_21:

  return v22;
}

- (BOOL)writeDictionary:(id)a3 toPlistFileWithName:(id)a4 inDirectory:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = objc_msgSend__resolveFileURLFromName_directory_(self, v11, (uint64_t)v9, (uint64_t)v10);
    if (v12) {
      char v13 = sub_25C7EFEA8((uint64_t)v8, v12, -1, 0);
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    uint64_t v14 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      id v16 = v14;
      id v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      int v21 = 136315650;
      uint64_t v22 = "-[SEMFilesystemBase(FileStorage) writeDictionary:toPlistFileWithName:inDirectory:]";
      __int16 v23 = 2112;
      char v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Unexpected object class: %@ object must be of class: %@", (uint8_t *)&v21, 0x20u);
    }
    char v13 = 0;
  }

  return v13;
}

- (id)readDictionaryFromPlistFileWithName:(id)a3 inDirectory:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend__resolveFileURLFromName_directory_(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (!v7)
  {
LABEL_7:
    id v10 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend__fileExistsAtURL_(self, v5, (uint64_t)v7, v6) & 1) == 0)
  {
    uint64_t v11 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[SEMFilesystemBase(FileStorage) readDictionaryFromPlistFileWithName:inDirectory:]";
      __int16 v22 = 2112;
      __int16 v23 = v7;
      _os_log_error_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_ERROR, "%s No file exists at path: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  id v19 = 0;
  id v8 = sub_25C7F0098((uint64_t)v7, 0, (uint64_t)&v19);
  id v9 = v19;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
  }
  else
  {
    if (v8)
    {
      uint64_t v12 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v12;
        uint64_t v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        id v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 136316162;
        int v21 = "-[SEMFilesystemBase(FileStorage) readDictionaryFromPlistFileWithName:inDirectory:]";
        __int16 v22 = 2112;
        __int16 v23 = v7;
        __int16 v24 = 2112;
        __int16 v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        id v29 = v9;
        _os_log_error_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_ERROR, "%s Read Plist file at path: %@ and got unexpected class: %@ expected: %@ error: %@", buf, 0x34u);
      }
    }
    id v10 = 0;
  }

LABEL_13:
  return v10;
}

- (SEMFilesystemBase)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMFilesystemBase)initWithRootDirectoryURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SEMFilesystemBase;
  v5 = [(SEMFilesystemBase *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  id v12 = 0;
  uint64_t v6 = sub_25C7EFC30(v4, &v12);
  id v7 = v12;
  rootDirectory = v5->_rootDirectory;
  v5->_rootDirectory = (NSURL *)v6;

  if (v5->_rootDirectory)
  {

LABEL_4:
    id v9 = v5;
    goto LABEL_8;
  }
  id v10 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[SEMFilesystemBase initWithRootDirectoryURL:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Failed to resolve/create base directory: %@", buf, 0x16u);
  }

  id v9 = 0;
LABEL_8:

  return v9;
}

+ (id)baseURLWithTargetDirectoryPath:(id)a3 relativeToDirectoryPath:(id)a4
{
  v5 = NSURL;
  id v6 = a3;
  id v8 = objc_msgSend_fileURLWithPath_isDirectory_(v5, v7, (uint64_t)a4, 1);
  id v10 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(NSURL, v9, (uint64_t)v6, 1, v8);

  uint64_t v14 = objc_msgSend_absoluteURL(v10, v11, v12, v13);

  return v14;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMFilesystemBase;
  v3 = [(SEMFilesystemBase *)&v8 description];
  id v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" rootDirectory: %@", v5, self->_rootDirectory);

  return v6;
}

- (id)getOrCreateDirectoryWithRelativePath:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(NSURL, v8, (uint64_t)v4, 1, self->_rootDirectory);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isChildOfRootDirectory_(self, v10, (uint64_t)v9, v11))
    {
      id v20 = 0;
      uint64_t v12 = sub_25C7EFC30(v9, &v20);
      uint64_t v13 = (NSURL *)v20;

      if (!v12)
      {
        uint64_t v14 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v22 = "-[SEMFilesystemBase getOrCreateDirectoryWithRelativePath:]";
          __int16 v23 = 2112;
          id v24 = v4;
          __int16 v25 = 2112;
          __int16 v26 = v13;
          _os_log_error_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get or create directory (path: %@) error: %@", buf, 0x20u);
        }
      }
      id v9 = v12;

      uint64_t v15 = v9;
    }
    else
    {
      id v17 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        rootDirectory = self->_rootDirectory;
        *(_DWORD *)buf = 136315650;
        __int16 v22 = "-[SEMFilesystemBase getOrCreateDirectoryWithRelativePath:]";
        __int16 v23 = 2112;
        id v24 = v4;
        __int16 v25 = 2112;
        __int16 v26 = rootDirectory;
        _os_log_error_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_ERROR, "%s Cannot get or create directory (path: %@) which is not a child path of root directory: %@", buf, 0x20u);
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    __int16 v16 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[SEMFilesystemBase getOrCreateDirectoryWithRelativePath:]";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Cannot get or create directory with invalid path: %@", buf, 0x16u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)removeItemAtURL:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_isChildOfRootDirectory_(self, v5, (uint64_t)v4, v6))
  {
    id v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9);
    uint64_t v14 = objc_msgSend_path(v4, v11, v12, v13);
    char v17 = objc_msgSend_fileExistsAtPath_(v10, v15, (uint64_t)v14, v16);

    if (v17)
    {
      int v21 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v18, v19, v20);
      id v30 = 0;
      char v23 = objc_msgSend_removeItemAtURL_error_(v21, v22, (uint64_t)v4, (uint64_t)&v30);
      id v24 = (NSURL *)v30;

      if ((v23 & 1) == 0)
      {
        __int16 v25 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "-[SEMFilesystemBase removeItemAtURL:]";
          __int16 v33 = 2112;
          id v34 = v4;
          __int16 v35 = 2112;
          id v36 = v24;
          _os_log_error_impl(&dword_25C7CA000, v25, OS_LOG_TYPE_ERROR, "%s Failed to remove item at URL: %@ error: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v27 = qword_26B3549D8;
      char v23 = 1;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[SEMFilesystemBase removeItemAtURL:]";
        __int16 v33 = 2112;
        id v34 = v4;
        _os_log_impl(&dword_25C7CA000, v27, OS_LOG_TYPE_INFO, "%s No item exists at path: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    __int16 v26 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      rootDirectory = self->_rootDirectory;
      *(_DWORD *)buf = 136315650;
      v32 = "-[SEMFilesystemBase removeItemAtURL:]";
      __int16 v33 = 2112;
      id v34 = v4;
      __int16 v35 = 2112;
      id v36 = rootDirectory;
      _os_log_error_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_ERROR, "%s Cannot remove item (URL: %@) which is not a child path of root directory: %@", buf, 0x20u);
    }
    char v23 = 0;
  }

  return v23;
}

- (BOOL)removeAllContents
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  uint64_t v9 = objc_msgSend_rootDirectory(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_path(v9, v10, v11, v12);

  uint64_t v16 = objc_msgSend_enumeratorAtPath_(v5, v14, (uint64_t)v13, v15);
  uint64_t v20 = objc_msgSend_nextObject(v16, v17, v18, v19);
  if (v20)
  {
    id v24 = (void *)v20;
    char v25 = 1;
    *(void *)&long long v23 = 136315650;
    long long v36 = v23;
    do
    {
      __int16 v26 = objc_msgSend_stringByAppendingPathComponent_(v13, v21, (uint64_t)v24, v22, v36);
      id v37 = 0;
      char v28 = objc_msgSend_removeItemAtPath_error_(v5, v27, (uint64_t)v26, (uint64_t)&v37);
      id v29 = v37;
      if ((v28 & 1) == 0)
      {
        id v30 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v36;
          __int16 v39 = "-[SEMFilesystemBase removeAllContents]";
          __int16 v40 = 2112;
          uint64_t v41 = v26;
          __int16 v42 = 2112;
          id v43 = v29;
          _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, "%s Failed to remove item at path: %@ error: %@", buf, 0x20u);
        }
        char v25 = 0;
      }

      uint64_t v34 = objc_msgSend_nextObject(v16, v31, v32, v33);

      id v24 = (void *)v34;
    }
    while (v34);
  }
  else
  {
    char v25 = 1;
  }

  return v25 & 1;
}

- (BOOL)isChildOfRootDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_pathComponents(self->_rootDirectory, v5, v6, v7);
  uint64_t v12 = objc_msgSend_absoluteURL(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend_pathComponents(v12, v13, v14, v15);

  unint64_t v20 = objc_msgSend_count(v16, v17, v18, v19);
  if (v20 <= objc_msgSend_count(v8, v21, v22, v23))
  {
    char isEqualToString = 0;
  }
  else if (objc_msgSend_count(v8, v24, v25, v26))
  {
    unint64_t v29 = 0;
    do
    {
      id v30 = objc_msgSend_objectAtIndex_(v8, v27, v29, v28);
      uint64_t v33 = objc_msgSend_objectAtIndex_(v16, v31, v29, v32);
      char isEqualToString = objc_msgSend_isEqualToString_(v30, v34, (uint64_t)v33, v35);

      if ((isEqualToString & 1) == 0) {
        break;
      }
      ++v29;
    }
    while (v29 < objc_msgSend_count(v8, v37, v38, v39));
  }
  else
  {
    char isEqualToString = 1;
  }

  return isEqualToString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_rootDirectory, v9, (uint64_t)a3, v10);
  uint64_t v12 = (void *)v8[1];
  v8[1] = v11;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SEMFilesystemBase *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToFileManager = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToFileManager = objc_msgSend_isEqualToFileManager_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToFileManager = 0;
  }

  return isEqualToFileManager;
}

- (BOOL)isEqualToFileManager:(id)a3
{
  if (!a3) {
    return 0;
  }
  rootDirectory = self->_rootDirectory;
  uint64_t v5 = objc_msgSend_rootDirectory(a3, a2, (uint64_t)a3, v3);
  LOBYTE(rootDirectory) = objc_msgSend_isEqual_(rootDirectory, v6, (uint64_t)v5, v7);

  return (char)rootDirectory;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_rootDirectory, a2, v2, v3);
}

- (NSURL)rootDirectory
{
  return self->_rootDirectory;
}

- (void).cxx_destruct
{
}

@end
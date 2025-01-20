@interface APOdmlAllowListReader
- (NSString)vectorVersion;
- (__sFILE)file;
- (id)nextLine;
- (id)openForReadingContentsOfURL:(id)a3;
- (id)readFile;
- (unint64_t)numberOfIDs;
- (unsigned)nextIndex;
- (void)dealloc;
- (void)setFile:(__sFILE *)a3;
- (void)setNextIndex:(unsigned int)a3;
- (void)setNumberOfIDs:(unint64_t)a3;
- (void)setVectorVersion:(id)a3;
@end

@implementation APOdmlAllowListReader

- (void)dealloc
{
  file = self->_file;
  if (file)
  {
    fclose(file);
    self->_file = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)APOdmlAllowListReader;
  [(APOdmlAllowListReader *)&v4 dealloc];
}

- (id)openForReadingContentsOfURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = (const char *)objc_msgSend_fileSystemRepresentation(v4, v5, v6);
  v8 = fopen(v7, "r");
  if (!v8)
  {
    v13 = OdmlLogForCategory(7uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = (id)objc_opt_class();
      id v14 = v29;
      _os_log_impl(&dword_1BBC44000, v13, OS_LOG_TYPE_ERROR, "[%@] ERROR: Unable to open file.", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v15, @"APOdmlFeatureCalculatorErrorDomain", 3001, 0);
    goto LABEL_20;
  }
  v9 = v8;
  uint64_t __ptr = 0;
  if (fread(&__ptr, 8uLL, 1uLL, v8) != 1)
  {
    if (feof(v9))
    {
      v16 = OdmlLogForCategory(7uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v29 = v17;
        id v18 = v17;
        v19 = "[%@] Reached EOF reading header of file.";
LABEL_17:
        _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
      }
    }
    else
    {
      if (!ferror(v9))
      {
LABEL_19:
        fclose(v9);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v25, @"APOdmlFeatureCalculatorErrorDomain", 3002, 0);
        goto LABEL_20;
      }
      v16 = OdmlLogForCategory(7uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v29 = v24;
        id v18 = v24;
        v19 = "[%@] Internal inconsistency reading file. Failed to read header.";
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  if (__ptr == 1447253107)
  {
    objc_msgSend_setFile_(self, v10, (uint64_t)v9);
    objc_msgSend_setNumberOfIDs_(self, v11, HIDWORD(__ptr));
    id v12 = 0;
    goto LABEL_21;
  }
  v20 = OdmlLogForCategory(7uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v29 = v21;
    id v22 = v21;
    _os_log_impl(&dword_1BBC44000, v20, OS_LOG_TYPE_ERROR, "[%@] Internal inconsistency reading file. Invalid header for file.", buf, 0xCu);
  }
  fclose(v9);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v23, @"APOdmlFeatureCalculatorErrorDomain", 3003, 0);
LABEL_20:
  id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v12;
}

- (id)readFile
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = objc_msgSend_nextLine(self, v4, v5);
  if (v6)
  {
    v9 = (void *)v6;
    do
    {
      objc_msgSend_addObject_(v3, v7, (uint64_t)v9);
      uint64_t v12 = objc_msgSend_nextLine(self, v10, v11);

      v9 = (void *)v12;
    }
    while (v12);
  }
  v13 = objc_msgSend_copy(v3, v7, v8);

  return v13;
}

- (void)setNumberOfIDs:(unint64_t)a3
{
  self->_numberOfIDs = a3;
}

- (void)setFile:(__sFILE *)a3
{
  file = self->_file;
  if (file) {
    fclose(file);
  }
  self->_file = a3;
}

- (unint64_t)numberOfIDs
{
  return self->_numberOfIDs;
}

- (id)nextLine
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unsigned int Index = objc_msgSend_nextIndex(self, a2, v2);
  if (objc_msgSend_numberOfIDs(self, v5, v6) <= (unint64_t)Index) {
    goto LABEL_16;
  }
  uint64_t __ptr = 0;
  uint64_t v30 = 0;
  v9 = (FILE *)objc_msgSend_file(self, v7, v8);
  if (fread(&__ptr, 0x10uLL, 1uLL, v9) == 1)
  {
    if (__ptr == 1447253074)
    {
      int v12 = objc_msgSend_nextIndex(self, v10, v11);
      objc_msgSend_setNextIndex_(self, v13, (v12 + 1));
      v15 = objc_msgSend_stringWithFormat_(NSString, v14, @"%llu", v30);
      goto LABEL_17;
    }
    v19 = OdmlLogForCategory(7uLL);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v23 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v32 = v23;
    id v21 = v23;
    id v22 = "[%@] Internal inconsistency reading file. Missing signature for start of next ID.";
    v24 = v19;
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_14;
  }
  v16 = (FILE *)objc_msgSend_file(self, v10, v11);
  if (feof(v16))
  {
    v19 = OdmlLogForCategory(7uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      id v21 = v20;
      id v22 = "[%@] Reached EOF reading ID.";
LABEL_13:
      v24 = v19;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
LABEL_14:
      _os_log_impl(&dword_1BBC44000, v24, v25, v22, buf, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v26 = (FILE *)objc_msgSend_file(self, v17, v18);
  if (ferror(v26))
  {
    v19 = OdmlLogForCategory(7uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v32 = v27;
      id v21 = v27;
      id v22 = "[%@] Internal inconsistency reading file. Failed to read header for ID.";
      goto LABEL_13;
    }
LABEL_15:
  }
LABEL_16:
  v15 = 0;
LABEL_17:

  return v15;
}

- (unsigned)nextIndex
{
  return self->_nextIndex;
}

- (void).cxx_destruct
{
}

- (NSString)vectorVersion
{
  return self->_vectorVersion;
}

- (void)setVectorVersion:(id)a3
{
}

- (__sFILE)file
{
  return self->_file;
}

- (void)setNextIndex:(unsigned int)a3
{
  self->_nextunsigned int Index = a3;
}

@end
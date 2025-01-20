@interface APOdmlAppVectorsFile
- (NSString)vectorVersion;
- (__sFILE)file;
- (id)initForReadingContentsOfURL:(id)a3 version:(id)a4;
- (id)nextVector;
- (unint64_t)numberOfVectors;
- (unsigned)nextIndex;
- (void)dealloc;
- (void)setFile:(__sFILE *)a3;
- (void)setNextIndex:(unsigned int)a3;
- (void)setNumberOfVectors:(unint64_t)a3;
- (void)setVectorVersion:(id)a3;
@end

@implementation APOdmlAppVectorsFile

- (id)initForReadingContentsOfURL:(id)a3 version:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v11 = (const char *)objc_msgSend_fileSystemRepresentation(v8, v9, v10);
  v12 = fopen(v11, "r");
  if (!v12)
  {
    v16 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = (id)objc_opt_class();
      __int16 v32 = 2112;
      id v33 = v8;
      id v17 = v31;
      _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_DEFAULT, "[%@] Could not open file for reading at %@.", buf, 0x16u);
    }
    goto LABEL_21;
  }
  v13 = v12;
  uint64_t __ptr = 0;
  if (fread(&__ptr, 8uLL, 1uLL, v12) != 1)
  {
    if (feof(v13))
    {
      v18 = OdmlLogForCategory(2uLL);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v31 = v19;
      id v20 = v19;
      v21 = "[%@] Reached EOF reading header of AppVectorFile.";
    }
    else
    {
      if (!ferror(v13))
      {
LABEL_20:
        fclose(v13);
LABEL_21:
        v26 = 0;
        goto LABEL_22;
      }
      v18 = OdmlLogForCategory(2uLL);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      v25 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v31 = v25;
      id v20 = v25;
      v21 = "[%@] Internal inconsistency reading AppVectorFile.  Failed to read header.";
    }
    v23 = v18;
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    goto LABEL_18;
  }
  if (__ptr != 1447253107)
  {
    v18 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v31 = v22;
      id v20 = v22;
      v21 = "[%@] Internal inconsistency reading AppVectorFile.  Invalid header for vector file.";
      v23 = v18;
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_1BBC44000, v23, v24, v21, buf, 0xCu);
    }
LABEL_19:

    goto LABEL_20;
  }
  v28.receiver = self;
  v28.super_class = (Class)APOdmlAppVectorsFile;
  v14 = [(APOdmlAppVectorsFile *)&v28 init];
  v15 = v14;
  if (v14)
  {
    v14->_numberOfVectors = HIDWORD(__ptr);
    objc_storeStrong((id *)&v14->_vectorVersion, a4);
    v15->_file = v13;
    v15->_nextIndex = 0;
  }
  else
  {
    fclose(v13);
  }
  self = v15;
  v26 = self;
LABEL_22:

  return v26;
}

- (void)dealloc
{
  file = self->_file;
  if (file) {
    fclose(file);
  }
  v4.receiver = self;
  v4.super_class = (Class)APOdmlAppVectorsFile;
  [(APOdmlAppVectorsFile *)&v4 dealloc];
}

- (id)nextVector
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t nextIndex = self->_nextIndex;
  if (objc_msgSend_numberOfVectors(self, a2, v2) <= nextIndex) {
    goto LABEL_20;
  }
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (fread(&v24, 0x10uLL, 1uLL, self->_file) != 1)
  {
    if (feof(self->_file))
    {
      v14 = OdmlLogForCategory(2uLL);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      id v16 = v15;
      id v17 = "[%@] Reached EOF reading vector.";
    }
    else
    {
      if (!ferror(self->_file)) {
        goto LABEL_20;
      }
      v14 = OdmlLogForCategory(2uLL);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v21;
      id v16 = v21;
      id v17 = "[%@] Internal inconsistency reading AppVectorFile.  Failed to read header for vector.";
    }
LABEL_17:
    v19 = v14;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_18;
  }
  if (v25 != *(_DWORD *)"RTCV")
  {
    v14 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      id v16 = v18;
      id v17 = "[%@] Internal inconsistency reading AppVectorFile.  Missing signature for start of next vector.";
      v19 = v14;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_1BBC44000, v19, v20, v17, buf, 0xCu);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  size_t v5 = 4 * HIDWORD(v25);
  id v6 = malloc_type_malloc(v5, 0x444E3FF4uLL);
  if (v6)
  {
    id v7 = v6;
    if (fread(v6, 1uLL, v5, self->_file) == v5)
    {
      id v8 = [APOdmlAppVector alloc];
      v11 = objc_msgSend_vectorVersion(self, v9, v10);
      v13 = objc_msgSend_initWithVersion_header_floats_(v8, v12, (uint64_t)v11, &v24, v7);

      free(v7);
      ++self->_nextIndex;
      goto LABEL_21;
    }
    v14 = OdmlLogForCategory(2uLL);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    v22 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v27 = v22;
    id v16 = v22;
    id v17 = "[%@] Internal inconsistency reading AppVectorFile.  Couldn't read required number of bytes.";
    goto LABEL_17;
  }
LABEL_20:
  v13 = 0;
LABEL_21:

  return v13;
}

- (unint64_t)numberOfVectors
{
  return self->_numberOfVectors;
}

- (void)setNumberOfVectors:(unint64_t)a3
{
  self->_numberOfVectors = a3;
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

- (void)setFile:(__sFILE *)a3
{
  self->_file = a3;
}

- (unsigned)nextIndex
{
  return self->_nextIndex;
}

- (void)setNextIndex:(unsigned int)a3
{
  self->_unint64_t nextIndex = a3;
}

- (void).cxx_destruct
{
}

@end
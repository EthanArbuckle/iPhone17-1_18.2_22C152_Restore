@interface CoreFileHandlerV2
- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5;
- (BOOL)isZeroes:(id)a3;
- (CoreFileHandlerV2)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5;
- (const)getCoreDumpNameWithIndex:(unint64_t)a3;
- (id)getCoreDumpEncryptionKey:(unint64_t)a3;
- (id)getCorefileLogEncryptionKey;
- (id)getCorefileZeroRanges;
- (unint64_t)getNumCoreDumps;
- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6;
@end

@implementation CoreFileHandlerV2

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionPublicKey, 0);

  objc_storeStrong((id *)&self->_headerData, 0);
}

- (id)getCorefileLogEncryptionKey
{
  return self->_encryptionPublicKey;
}

- (id)getCoreDumpEncryptionKey:(unint64_t)a3
{
  if (self->_corefileHeader->num_files <= a3)
  {
    _os_assert_log();
    id result = (id)_os_crash();
    __break(1u);
  }
  else
  {
    encryptionPublicKey = self->_encryptionPublicKey;
    return encryptionPublicKey;
  }
  return result;
}

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  if (!a3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_9:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (!a4) {
    goto LABEL_9;
  }
  corefileHeader = self->_corefileHeader;
  *a4 = corefileHeader->log_length;
  uint64_t log_length = corefileHeader->log_length;
  if (log_length)
  {
    *a3 = corefileHeader->log_offset;
    *a5 = 0;
    uint64_t flags = corefileHeader->flags;
    if (flags)
    {
      if ((flags & 0x100) == 0)
      {
        v9 = qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v13 = flags;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unsupported encryption key format in corefile flags: %llu", buf, 0xCu);
        }
        v10 = +[NSString stringWithFormat:@"%s must be implemented", "Encryption key format"];
        id v11 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v10 userInfo:0];

        objc_exception_throw(v11);
      }
      *a5 = 4;
    }
  }
  return log_length != 0;
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  corefileHeader = self->_corefileHeader;
  if (corefileHeader->num_files <= a3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_16;
  }
  if (!a4)
  {
LABEL_16:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_17;
  }
  if (!a5)
  {
LABEL_17:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_18:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (!a6) {
    goto LABEL_18;
  }
  v7 = &corefileHeader->signature + 5 * a3;
  uint64_t v8 = v7[8];
  *a4 = v7[9];
  *a5 = v7[10];
  *a6 = 0;
  if ((v8 & 0x100) != 0)
  {
    unsigned int v9 = 5;
    unsigned int v10 = 1;
    goto LABEL_11;
  }
  if ((v8 & 0x200) != 0)
  {
    unsigned int v9 = 6;
    unsigned int v10 = 2;
LABEL_11:
    *a6 = v10;
    if ((v8 & 1) == 0) {
      return;
    }
    goto LABEL_12;
  }
  unsigned int v9 = 4;
  if ((v8 & 1) == 0) {
    return;
  }
LABEL_12:
  uint64_t flags = corefileHeader->flags;
  if ((flags & 0x100) == 0)
  {
    v12 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = flags;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unsupported encryption key format in corefile flags: %llu", buf, 0xCu);
    }
    uint64_t v13 = +[NSString stringWithFormat:@"%s must be implemented", "Encryption key format"];
    id v14 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  *a6 = v9;
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  corefileHeader = self->_corefileHeader;
  if (corefileHeader->num_files > a3) {
    return (const char *)(&corefileHeader[1].pub_key_offset + 5 * a3);
  }
  _os_assert_log();
  id result = (const char *)_os_crash();
  __break(1u);
  return result;
}

- (unint64_t)getNumCoreDumps
{
  return self->_corefileHeader->num_files;
}

- (id)getCorefileZeroRanges
{
  return &off_100037C10;
}

- (CoreFileHandlerV2)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5
{
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v5 = [(CoreFileHandler *)self initWithCoreFilePath:a3 :a4 :a5 :0x63614D2073736F42 :&v50 :64];
  if (!v5) {
    goto LABEL_39;
  }
  v6 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v55 = *((void *)&v53 + 1);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "opened corefile, header indicates %llu files present", buf, 0xCu);
  }
  uint64_t v7 = *((void *)&v51 + 1);
  int v8 = (unsigned __int16)v52;
  if (__CFADD__(*((void *)&v51 + 1), (unsigned __int16)v52)
    || (unint64_t v9 = v5->super._corefileSize, *((void *)&v51 + 1) + (unint64_t)(unsigned __int16)v52 > v9))
  {
    uint64_t v10 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      unint64_t corefileSize = v5->super._corefileSize;
      *(_DWORD *)buf = 134218496;
      uint64_t v55 = v7;
      __int16 v56 = 1024;
      *(_DWORD *)v57 = v8;
      *(_WORD *)&v57[4] = 2048;
      *(void *)&v57[6] = corefileSize;
      v37 = "Corefile corrupted. Public key (offset %llu, length %hu) extends past end of file (length %zu).";
      v38 = v10;
      uint32_t v39 = 28;
      goto LABEL_36;
    }
    goto LABEL_7;
  }
  uint64_t v13 = *((void *)&v52 + 1);
  uint64_t v12 = v53;
  if (__CFADD__(*((void *)&v52 + 1), (void)v53) || *((void *)&v52 + 1) + (void)v53 > v9)
  {
    uint64_t v36 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v55 = v13;
      __int16 v56 = 2048;
      *(void *)v57 = v12;
      *(_WORD *)&v57[8] = 2048;
      *(void *)&v57[10] = v9;
      v37 = "Corefile corrupted. Log (offset %llu, length %llu) extends past end of file (length %zu).";
      v38 = v36;
      uint32_t v39 = 32;
      goto LABEL_36;
    }
    goto LABEL_7;
  }
  uint64_t v14 = *((void *)&v53 + 1);
  unint64_t v15 = 40 * *((void *)&v53 + 1) + 64;
  if (!is_mul_ok(*((unint64_t *)&v53 + 1), 0x28uLL)
    || (unint64_t)(40 * *((void *)&v53 + 1)) >= 0xFFFFFFFFFFFFFFC0
    || v15 > v9)
  {
    uint64_t v40 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      uint64_t v55 = 64;
      __int16 v56 = 2048;
      *(void *)v57 = v14;
      *(_WORD *)&v57[8] = 2048;
      *(void *)&v57[10] = 40;
      __int16 v58 = 2048;
      unint64_t v59 = v9;
      v37 = "Corefile corrupted. Header (size %zu) and %llu file headers (each of size %zu) extend past end of file (length %zu).";
      v38 = v40;
      uint32_t v39 = 42;
      goto LABEL_36;
    }
    goto LABEL_7;
  }
  uint64_t v16 = [(CoreFileHandler *)v5 getCoreDumpContentsWithOffset:0 AndLength:40 * *((void *)&v53 + 1) + 64];
  headerData = v5->_headerData;
  v5->_headerData = (NSData *)v16;

  corefileHeader = [(NSData *)v5->_headerData bytes];
  v5->_corefileHeader = corefileHeader;
  v19 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v55 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Successfully read %llu bytes for the corefile headers", buf, 0xCu);
    corefileHeader = v5->_corefileHeader;
  }
  if (!corefileHeader->num_files)
  {
LABEL_22:
    uint64_t pub_key_offset = corefileHeader->pub_key_offset;
    if (pub_key_offset && (unsigned int pub_key_length = corefileHeader->pub_key_length) != 0)
    {
      v28 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reading public encryption key from corefile", buf, 2u);
        v29 = v5->_corefileHeader;
        uint64_t pub_key_offset = v29->pub_key_offset;
        unsigned int pub_key_length = v29->pub_key_length;
      }
      uint64_t v30 = [(CoreFileHandler *)v5 getCoreDumpContentsWithOffset:pub_key_offset AndLength:pub_key_length];
      p_encryptionPublicKey = &v5->_encryptionPublicKey;
      encryptionPublicKey = v5->_encryptionPublicKey;
      v5->_encryptionPublicKey = (NSData *)v30;

      v33 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = v5->_corefileHeader->pub_key_length;
        *(_DWORD *)buf = 67109120;
        LODWORD(v55) = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Successfully read %hu bytes for the public encryption key", buf, 8u);
      }
      if (![(CoreFileHandlerV2 *)v5 isZeroes:*p_encryptionPublicKey])
      {
        uint64_t flags = v5->_corefileHeader->flags;
        if ((flags & 0x100) == 0)
        {
          v49 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v55 = flags;
            _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Unsupported encryption key format in corefile flags: %llu", buf, 0xCu);
          }
          id v11 = 0;
          v5->super._zero_on_close = 0;
          goto LABEL_40;
        }
LABEL_39:
        id v11 = v5;
        goto LABEL_40;
      }
      v35 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Public encryption key is empty. Corefile is not encrypted", buf, 2u);
      }
    }
    else
    {
      p_encryptionPublicKey = &v5->_encryptionPublicKey;
    }
    v42 = *p_encryptionPublicKey;
    *p_encryptionPublicKey = 0;

    goto LABEL_39;
  }
  uint64_t v20 = 0;
  unint64_t v21 = 0;
  while (1)
  {
    if (strnlen((const char *)&corefileHeader[1].pub_key_offset + v20, 0x10uLL) == 16)
    {
      uint64_t v44 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = v21;
      v37 = "Corefile corrupted. File %zu's name was not terminated.";
LABEL_45:
      v38 = v44;
      uint32_t v39 = 12;
      goto LABEL_36;
    }
    v22 = +[NSString stringWithUTF8String:(char *)&corefileHeader[1].pub_key_offset + v20];

    if (!v22)
    {
      uint64_t v44 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = v21;
      v37 = "Corefile corrupted. File %zu's name is not a valid string.";
      goto LABEL_45;
    }
    v23 = (char *)corefileHeader + v20;
    uint64_t v25 = *(void *)((char *)&corefileHeader[1].version + v20);
    unint64_t v24 = *(uint64_t *)((char *)&corefileHeader[1].flags + v20);
    if (__CFADD__(v25, v24)) {
      goto LABEL_47;
    }
    if (v25 + v24 > v5->super._corefileSize) {
      break;
    }
    ++v21;
    corefileHeader = v5->_corefileHeader;
    v20 += 40;
    if (v21 >= corefileHeader->num_files) {
      goto LABEL_22;
    }
  }
  v23 = (char *)corefileHeader + v20;
LABEL_47:
  v45 = v23 + 88;
  uint64_t v46 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    unint64_t v47 = v5->super._corefileSize;
    *(_DWORD *)buf = 134219010;
    uint64_t v55 = v21;
    __int16 v56 = 2080;
    *(void *)v57 = v45;
    *(_WORD *)&v57[8] = 2048;
    *(void *)&v57[10] = v25;
    __int16 v58 = 2048;
    unint64_t v59 = v24;
    __int16 v60 = 2048;
    unint64_t v61 = v47;
    v37 = "Corefile corrupted. File %zu's (name %s, offset %llu, length %llu) extends past end of file (length %zu).";
    v38 = v46;
    uint32_t v39 = 52;
LABEL_36:
    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
  }
LABEL_7:
  id v11 = 0;
LABEL_40:

  return v11;
}

- (BOOL)isZeroes:(id)a3
{
  id v3 = a3;
  v4 = [v3 bytes];
  if ([v3 length])
  {
    uint64_t v5 = 0;
    while (1)
    {
      BOOL v6 = v4[v5] == 0;
      if (v4[v5]) {
        break;
      }
      if (++v5 >= (unint64_t)[v3 length]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    BOOL v6 = 1;
  }

  return v6;
}

@end
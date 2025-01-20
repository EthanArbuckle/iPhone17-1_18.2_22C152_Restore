@interface TTSStreamingZipReader
- (BOOL)enumerateFiles:(id)a3;
- (NSString)password;
- (NSString)zipPath;
- (TTSStreamingZipReader)initWithPath:(id)a3 andPassword:(id)a4;
- (void)setPassword:(id)a3;
- (void)setZipPath:(id)a3;
@end

@implementation TTSStreamingZipReader

- (TTSStreamingZipReader)initWithPath:(id)a3 andPassword:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTSStreamingZipReader;
  v9 = [(TTSStreamingZipReader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zipPath, a3);
    objc_storeStrong((id *)&v10->_password, a4);
  }

  return v10;
}

- (BOOL)enumerateFiles:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  uint64_t v5 = archive_read_new();
  if (archive_read_support_format_zip())
  {
    v10 = AXTTSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A688DE94();
    }

    goto LABEL_12;
  }
  objc_msgSend_password(self, v6, v7, v8, v9);
  id v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
  int add_passphrase = archive_read_add_passphrase();

  if (add_passphrase)
  {
    AXTTSLogCommon();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
      sub_1A688DE08(self, v21, v22, v23, v24);
    }
LABEL_11:

    archive_read_free();
    goto LABEL_12;
  }
  objc_msgSend_zipPath(self, v17, v18, v19, v20);
  id v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileSystemRepresentation(v25, v26, v27, v28, v29);
  int open_filename = archive_read_open_filename();

  if (open_filename)
  {
    AXTTSLogCommon();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
      sub_1A688DD7C(self, v21, v31, v32, v33);
    }
    goto LABEL_11;
  }
  v45[5] = 0;
  if (archive_read_next_header())
  {
LABEL_17:
    archive_read_free();
    BOOL v34 = 1;
    goto LABEL_13;
  }
  while (1)
  {
    uint64_t v36 = archive_entry_pathname();
    v39 = objc_msgSend_stringWithCString_encoding_(NSString, v37, v36, 4, v38);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1A670321C;
    v45[3] = &unk_1E5C69BC0;
    v45[4] = v5;
    v40 = _Block_copy(v45);
    if (!v36) {
      break;
    }
    v4[2](v4, v39, v40);

    if (archive_read_next_header()) {
      goto LABEL_17;
    }
  }
  AXTTSLogCommon();
  v41 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR)) {
    sub_1A688DCF8(self, v41, v42, v43, v44);
  }

LABEL_12:
  BOOL v34 = 0;
LABEL_13:

  return v34;
}

- (NSString)zipPath
{
  return self->_zipPath;
}

- (void)setZipPath:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_zipPath, 0);
}

@end
@interface SEMSkitWriter
+ (void)initialize;
- (BOOL)_beginTransactionWithError:(id *)a3;
- (BOOL)addCascadeSharedItemContent:(id)a3 allMetaContent:(id)a4 sourceIdentifier:(id)a5 personaIdentifier:(id)a6 externalId:(id)a7 error:(id *)a8;
- (BOOL)cleanup:(id *)a3;
- (BOOL)clearWithError:(id *)a3;
- (BOOL)commitChanges:(BOOL *)a3 error:(id *)a4;
- (BOOL)removeItemWithExternalId:(id)a3 error:(id *)a4;
- (BOOL)rollbackChanges:(id *)a3;
- (BOOL)setTransactionIndexFeatures:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)setTransactionLocale:(int64_t)a3 assetPath:(id)a4 error:(id *)a5;
- (BOOL)shouldMerge:(BOOL *)a3 error:(id *)a4;
- (SEMSkitWriter)init;
- (SEMSkitWriter)initWithSkitDirectoryURL:(id)a3 dataProtectionClass:(int)a4 flushThreshold:(unint64_t)a5;
- (id).cxx_construct;
- (int64_t)indexLocale;
- (unint64_t)flushThreshold;
- (unsigned)indexFeatures;
@end

@implementation SEMSkitWriter

+ (void)initialize
{
  sub_25C7D8EA4();
  if (qword_26B3549D0 != -1)
  {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (SEMSkitWriter)initWithSkitDirectoryURL:(id)a3 dataProtectionClass:(int)a4 flushThreshold:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SEMSkitWriter;
  v11 = [(SEMSkitWriter *)&v41 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10);
    directoryURL = v11->_directoryURL;
    v11->_directoryURL = (NSURL *)v12;

    uint64_t v15 = (uint64_t)v11->_directoryURL;
    if (v15)
    {
      id v40 = 0;
      uint64_t v16 = objc_msgSend_writableSkitInfoAtDirectory_error_(SEMSkitInfo, v14, v15, (uint64_t)&v40);
      id v17 = v40;
      info = v11->_info;
      v11->_info = (SEMSkitInfo *)v16;

      if (v11->_info)
      {
        v11->_flushThreshold = a5;
        v11->_inTransaction = 0;
        objc_msgSend_path(v11->_directoryURL, v19, v20, v21);
        id v22 = objc_claimAutoreleasedReturnValue();
        uint64_t v39 = objc_msgSend_UTF8String(v22, v23, v24, v25);
        sub_25C80DB5C(v26, v27, &v38);
        sub_25C80DC10(v28, v29, &v37);
        sub_25C81EEE4();
        objc_msgSend_indexFeatures(v11, v30, v31, v32);
        operator new();
      }
      v35 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 136315394;
        *(void *)&buf[1] = "-[SEMSkitWriter initWithSkitDirectoryURL:dataProtectionClass:flushThreshold:]";
        __int16 v43 = 2112;
        id v44 = v17;
        _os_log_error_impl(&dword_25C7CA000, v35, OS_LOG_TYPE_ERROR, "%s Failed to create a _info under SEMSkitWriter: %@", (uint8_t *)buf, 0x16u);
      }
    }
    else
    {
      v34 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 136315138;
        *(void *)&buf[1] = "-[SEMSkitWriter initWithSkitDirectoryURL:dataProtectionClass:flushThreshold:]";
        _os_log_error_impl(&dword_25C7CA000, v34, OS_LOG_TYPE_ERROR, "%s Cannot create SKIT writer with nil directory URL.", (uint8_t *)buf, 0xCu);
      }
    }
    v33 = 0;
  }
  else
  {
    v33 = (SEMSkitWriter *)0;
  }

  return v33;
}

- (SEMSkitWriter)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_beginTransactionWithError:(id *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_25C80FA74;
  v7[3] = &unk_2654DED70;
  v7[4] = self;
  int v4 = sub_25C808CD8((uint64_t)"-[SEMSkitWriter _beginTransactionWithError:]", a3, v7);
  if (v4)
  {
    self->_inTransaction = 1;
    v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = "-[SEMSkitWriter _beginTransactionWithError:]";
      _os_log_debug_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_DEBUG, "%s SKIT transaction activated", buf, 0xCu);
    }
  }
  return v4;
}

- (BOOL)commitChanges:(BOOL *)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!self->_inTransaction)
  {
    uint64_t v12 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v19) = 136315138;
      *(void *)((char *)&v19 + 4) = "-[SEMSkitWriter commitChanges:error:]";
      _os_log_debug_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_DEBUG, "%s No changes to commit", (uint8_t *)&v19, 0xCu);
      if (!a3) {
        return 1;
      }
    }
    else if (!a3)
    {
      return 1;
    }
    *a3 = 0;
    return 1;
  }
  *(void *)&long long v19 = 0;
  *((void *)&v19 + 1) = &v19;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_25C80FCA8;
  v14[3] = &unk_2654DEE58;
  v14[4] = self;
  v14[5] = &v19;
  if (sub_25C808CD8((uint64_t)"-[SEMSkitWriter commitChanges:error:]", a4, v14)
    && objc_msgSend_commitUpdates_(self->_info, v7, (uint64_t)a4, v8))
  {
    self->_inTransaction = 0;
    uint64_t v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(*((void *)&v19 + 1) + 24)) {
        uint64_t v10 = @" (MERGE REQUIRED)";
      }
      else {
        uint64_t v10 = &stru_2709E04D0;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[SEMSkitWriter commitChanges:error:]";
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s SKIT transaction committed%@", buf, 0x16u);
    }
    if (a3) {
      *a3 = *(unsigned char *)(*((void *)&v19 + 1) + 24);
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v19, 8);
  return v11;
}

- (BOOL)rollbackChanges:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_25C810020;
    v11[3] = &unk_2654DED70;
    v11[4] = self;
    int v7 = sub_25C808CD8((uint64_t)"-[SEMSkitWriter rollbackChanges:]", a3, v11);
    if (v7)
    {
      objc_msgSend_rollbackUpdates(self->_info, v4, v5, v6);
      self->_inTransaction = 0;
      uint64_t v8 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[SEMSkitWriter rollbackChanges:]";
        _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, "%s SKIT transaction aborted", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SEMSkitWriter rollbackChanges:]";
      _os_log_debug_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_DEBUG, "%s No changes to rollback", buf, 0xCu);
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (int64_t)indexLocale
{
  int v4 = objc_msgSend_localeType(self->_info, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4)
  {
    unsigned int v9 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);
    if ((unint64_t)v9 - 1 >= 0x2C) {
      int64_t v10 = 0;
    }
    else {
      int64_t v10 = v9;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (unsigned)indexFeatures
{
  int v4 = objc_msgSend_indexFeatures(self->_info, a2, v2, v3);
  unsigned __int16 v8 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);

  return v8;
}

- (BOOL)setTransactionLocale:(int64_t)a3 assetPath:(id)a4 error:(id *)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  if ((unint64_t)(a3 - 1) >= 0x2C)
  {
    uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v8, 0x2709E2730, 1, 0);
    sub_25C81F288(a5, v32);

    goto LABEL_6;
  }
  uint64_t v15 = objc_msgSend_indexLocale(self, v8, v9, v10);
  if (v15 != a3)
  {
    uint64_t v16 = objc_msgSend_localeType(self->_info, v12, v13, v14);

    if (v16)
    {
      uint64_t v20 = NSString;
      char v21 = sub_25C800B98(a3, v17);
      v23 = sub_25C800B98(v15, v22);
      v26 = objc_msgSend_stringWithFormat_(v20, v24, @"Attempting to set SKIT transaction locale: %@ which is incompatible with the existing index locale: %@. The index must be cleared and rebuilt following a locale change.", v25, v21, v23);

      uint64_t v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v47[0] = v26;
      uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v47, (uint64_t)&v46, 1);
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, 0x2709E2730, 3, v29);
      sub_25C81F288(a5, v31);

LABEL_6:
      char v33 = 0;
      goto LABEL_12;
    }
    info = self->_info;
    v35 = sub_25C800988(a3, v17, v18, v19);
    objc_msgSend_updateLocaleType_(info, v36, (uint64_t)v35, v37);
  }
  if (v11)
  {
    objc_msgSend_path(v11, v12, v13, v14);
    id v38 = objc_claimAutoreleasedReturnValue();
    v42 = (const char *)objc_msgSend_UTF8String(v38, v39, v40, v41);
    size_t v43 = strlen(v42);
  }
  else
  {
    size_t v43 = 0;
    v42 = 0;
  }
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_25C8103E8;
  v45[3] = &unk_2654DEE80;
  v45[4] = self;
  v45[5] = a3;
  v45[6] = v42;
  v45[7] = v43;
  char v33 = sub_25C808CD8((uint64_t)"-[SEMSkitWriter setTransactionLocale:assetPath:error:]", a5, v45);
LABEL_12:

  return v33;
}

- (BOOL)setTransactionIndexFeatures:(unsigned __int16)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  if (self->_indexer.__ptr_.__value_->index_locale)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v33[0] = @"Transaction locale already set. -setTransactionIndexFeatures: must be called before -setTransactionLocale:.";
    uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v33, (uint64_t)&v32, 1);
    unsigned __int16 v8 = objc_msgSend_errorWithDomain_code_userInfo_(v5, v7, 0x2709E2730, 8, v6);
    sub_25C81F288(a4, v8);

    return 0;
  }
  uint64_t v10 = a3;
  uint64_t v12 = objc_msgSend_indexFeatures(self, a2, a3, (uint64_t)a4);
  if (v12 != v10)
  {
    uint64_t v16 = v12;
    __int16 v17 = objc_msgSend_indexFeatures(self->_info, v13, v14, v15);

    if (v17)
    {
      uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v18, @"Attempting to set SKIT transaction index features: %u incompatible with the built index features: %u. The index must be cleared and rebuilt following an index features change.", v19, v10, v16);
      char v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      uint64_t v31 = v20;
      v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)&v31, (uint64_t)&v30, 1);
      uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v24, 0x2709E2730, 4, v23);
      sub_25C81F288(a4, v25);

      return 0;
    }
    info = self->_info;
    uint64_t v27 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v18, v10, v19);
    objc_msgSend_updateIndexFeatures_(info, v28, (uint64_t)v27, v29);
  }
  return 1;
}

- (BOOL)addCascadeSharedItemContent:(id)a3 allMetaContent:(id)a4 sourceIdentifier:(id)a5 personaIdentifier:(id)a6 externalId:(id)a7 error:(id *)a8
{
  v59[2] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v46 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v59[0] = 0;
  v59[1] = 0;
  objc_msgSend_getUUIDBytes_(v17, v18, (uint64_t)v59, v19);
  if (v15)
  {
    id v22 = v15;
    v26 = (const char *)objc_msgSend_UTF8String(v22, v23, v24, v25);
    size_t v27 = strlen(v26);
    if (v16) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v32 = 0;
    size_t v33 = 0;
    if (v14) {
      goto LABEL_4;
    }
LABEL_10:
    v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F08320];
    v36 = objc_msgSend_stringWithFormat_(NSString, v20, @"Cannot add Cascade item with nil sharedItemContent. externalId: %@ sourceIdentifier: %@", v21, v17, v15);
    v58 = v36;
    id v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)&v58, (uint64_t)&v57, 1);
    uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v39, 0x2709E2730, 7, v38);
    sub_25C81F288(a8, v40);

LABEL_12:
    char v34 = 0;
    goto LABEL_13;
  }
  size_t v27 = 0;
  v26 = 0;
  if (!v16) {
    goto LABEL_9;
  }
LABEL_3:
  id v28 = v16;
  uint64_t v32 = (const char *)objc_msgSend_UTF8String(v28, v29, v30, v31);
  size_t v33 = strlen(v32);
  if (!v14) {
    goto LABEL_10;
  }
LABEL_4:
  if (!self->_inTransaction && !objc_msgSend__beginTransactionWithError_(self, v20, (uint64_t)a8, v21)) {
    goto LABEL_12;
  }
  if (!self->_indexer.__ptr_.__value_->index_locale)
  {
    uint64_t v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v55 = *MEMORY[0x263F08320];
    v56 = @"Transaction locale not set. -setTransactionLocale: must be called successfully before adding items.";
    v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)&v56, (uint64_t)&v55, 1);
    id v44 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v43, 0x2709E2730, 2, v42);
    sub_25C81F288(a8, v44);

    goto LABEL_12;
  }
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  void v47[2] = sub_25C810A30;
  v47[3] = &unk_2654DEEA8;
  v47[4] = self;
  v50 = v59;
  id v48 = v14;
  id v49 = v46;
  v51 = v26;
  size_t v52 = v27;
  v53 = v32;
  size_t v54 = v33;
  char v34 = sub_25C808CD8((uint64_t)"-[SEMSkitWriter addCascadeSharedItemContent:allMetaContent:sourceIdentifier:personaIdentifier:externalId:error:]", a8, v47);

LABEL_13:
  return v34;
}

- (BOOL)removeItemWithExternalId:(id)a3 error:(id *)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v11[0] = 0;
  v11[1] = 0;
  objc_msgSend_getUUIDBytes_(a3, a2, (uint64_t)v11, (uint64_t)a4);
  if (self->_inTransaction || (int v8 = objc_msgSend__beginTransactionWithError_(self, v6, (uint64_t)a4, v7)) != 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_25C810B38;
    v10[3] = &unk_2654DEED0;
    v10[4] = self;
    v10[5] = v11;
    LOBYTE(v8) = sub_25C808CD8((uint64_t)"-[SEMSkitWriter removeItemWithExternalId:error:]", a4, v10);
  }
  return v8;
}

- (BOOL)clearWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_inTransaction || objc_msgSend__beginTransactionWithError_(self, a2, (uint64_t)a3, v3))
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_25C810CE8;
    v12[3] = &unk_2654DED70;
    v12[4] = self;
    int v9 = sub_25C808CD8((uint64_t)"-[SEMSkitWriter clearWithError:]", a3, v12);
    if (v9)
    {
      objc_msgSend_clear(self->_info, v6, v7, v8);
      uint64_t v10 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "-[SEMSkitWriter clearWithError:]";
        _os_log_debug_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_DEBUG, "%s skit index cleared.", buf, 0xCu);
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)cleanup:(id *)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_25C810D74;
  v4[3] = &unk_2654DED70;
  v4[4] = self;
  return sub_25C808CD8((uint64_t)"-[SEMSkitWriter cleanup:]", a3, v4);
}

- (BOOL)shouldMerge:(BOOL *)a3 error:(id *)a4
{
  if (self->_inTransaction || (int v7 = objc_msgSend__beginTransactionWithError_(self, a2, (uint64_t)a4, (uint64_t)a4)) != 0)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_25C810E30;
    v9[3] = &unk_2654DEED0;
    v9[4] = self;
    v9[5] = a3;
    LOBYTE(v7) = sub_25C808CD8((uint64_t)"-[SEMSkitWriter shouldMerge:error:]", a4, v9);
  }
  return v7;
}

- (unint64_t)flushThreshold
{
  return self->_flushThreshold;
}

- (void).cxx_destruct
{
  value = self->_indexer.__ptr_.__value_;
  self->_indexer.__ptr_.__value_ = 0;
  if (value) {
    sub_25C810FE4((uint64_t)value);
  }
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end
@interface SEMSkitReader
+ (void)initialize;
- (BOOL)deactivate;
- (BOOL)isEmpty;
- (NSString)description;
- (SEMSkitReader)init;
- (SEMSkitReader)initWithSkitDirectoryURL:(id)a3 description:(id)a4;
- (SEMSkitReader)initWithSkitDirectoryURL:(id)a3 description:(id)a4 lifespan:(double)a5;
- (id)_activationBlock;
- (id)_deactivationBlock;
- (id)indexLocale;
- (id)matchSpans:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)prewarm;
@end

@implementation SEMSkitReader

+ (void)initialize
{
  sub_25C7D8EA4();
  if (qword_26B3549D0 != -1)
  {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (SEMSkitReader)initWithSkitDirectoryURL:(id)a3 description:(id)a4
{
  return (SEMSkitReader *)MEMORY[0x270F9A6D0](self, sel_initWithSkitDirectoryURL_description_lifespan_, a3, a4);
}

- (SEMSkitReader)initWithSkitDirectoryURL:(id)a3 description:(id)a4 lifespan:(double)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SEMSkitReader;
  id v13 = [(SEMSkitReader *)&v45 init];
  if (!v13) {
    goto LABEL_5;
  }
  uint64_t v14 = objc_msgSend_copy(v8, v10, v11, v12);
  v15 = (void *)*((void *)v13 + 1);
  *((void *)v13 + 1) = v14;

  if (!*((void *)v13 + 1))
  {
    v42 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[SEMSkitReader initWithSkitDirectoryURL:description:lifespan:]";
      _os_log_error_impl(&dword_25C7CA000, v42, OS_LOG_TYPE_ERROR, "%s Cannot create connection with nil directory URL.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)v13 + 2, a4);
  v16 = [SEMSkitWrapper alloc];
  uint64_t v19 = objc_msgSend_initWithSkitDirectoryURL_(v16, v17, *((void *)v13 + 1), v18);
  v20 = (void *)*((void *)v13 + 4);
  *((void *)v13 + 4) = v19;

  v21 = NSString;
  uint64_t v22 = dword_26B3549E0++;
  v25 = objc_msgSend_numberWithInt_(NSNumber, v23, v22, v24);
  v28 = objc_msgSend_stringWithFormat_(v21, v26, @"sv-skit-r-%@", v27, v25);

  v29 = [SEMProvisionalResourceManager alloc];
  v33 = objc_msgSend__activationBlock(v13, v30, v31, v32);
  v37 = objc_msgSend__deactivationBlock(v13, v34, v35, v36);
  uint64_t v39 = objc_msgSend_initWithResourceName_lifespan_activationBlock_deactivationBlock_serializeOperations_(v29, v38, (uint64_t)v28, (uint64_t)v33, v37, 1, a5);
  v40 = (void *)*((void *)v13 + 3);
  *((void *)v13 + 3) = v39;

  if (!*((void *)v13 + 3))
  {
    v43 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[SEMSkitReader initWithSkitDirectoryURL:description:lifespan:]";
      __int16 v48 = 2112;
      v49 = v28;
      _os_log_error_impl(&dword_25C7CA000, v43, OS_LOG_TYPE_ERROR, "%s Failed to initialize resource manager for resource: %@", buf, 0x16u);
    }

LABEL_11:
    v41 = 0;
    goto LABEL_12;
  }

LABEL_5:
  v41 = (SEMSkitReader *)v13;
LABEL_12:

  return v41;
}

- (SEMSkitReader)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  objc_msgSend_deactivate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)SEMSkitReader;
  [(SEMSkitReader *)&v5 dealloc];
}

- (NSString)description
{
  return self->_description;
}

- (id)_activationBlock
{
  uint64_t v2 = self->_skit;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_25C80B50C;
  v6[3] = &unk_2654DED98;
  v7 = v2;
  uint64_t v3 = v2;
  v4 = (void *)MEMORY[0x2611949C0](v6);

  return v4;
}

- (id)_deactivationBlock
{
  uint64_t v2 = self->_skit;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_25C80B6E8;
  v6[3] = &unk_2654DED98;
  v7 = v2;
  uint64_t v3 = v2;
  v4 = (void *)MEMORY[0x2611949C0](v6);

  return v4;
}

- (BOOL)deactivate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  resourceManager = self->_resourceManager;
  id v9 = 0;
  uint64_t v4 = objc_msgSend_deactivateWithError_(resourceManager, a2, (uint64_t)&v9, v2);
  id v5 = v9;
  unint64_t v6 = v4 - 1;
  if ((unint64_t)(v4 - 1) >= 4)
  {
    v7 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[SEMSkitReader deactivate]";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, "%s Failed to deactivate. error: %@", buf, 0x16u);
    }
  }

  return v6 < 4;
}

- (id)indexLocale
{
  uint64_t v4 = objc_msgSend_readInfo(self->_skit, a2, v2, v3);
  id v8 = objc_msgSend_localeType(v4, v5, v6, v7);
  unsigned int v12 = objc_msgSend_unsignedShortValue(v8, v9, v10, v11);

  if ((unint64_t)v12 - 45 < 0xFFFFFFFFFFFFFFD4 || v12 == 0)
  {
    uint64_t v19 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x263EFF960];
    v16 = sub_25C8009D0(v12, v13);
    uint64_t v19 = objc_msgSend_localeWithLocaleIdentifier_(v15, v17, (uint64_t)v16, v18);
  }
  return v19;
}

- (BOOL)isEmpty
{
  return 0;
}

- (void)prewarm
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[SEMSkitReader prewarm]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_INFO, "%s (%@) prewarming", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend_activateAsyncWithCompletion_(self->_resourceManager, v4, (uint64_t)&unk_2709E0308, v5);
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_25C80BDE4;
  v30 = sub_25C80BDF4;
  id v31 = 0;
  uint64_t v10 = (uint64_t *)objc_msgSend_query(v6, v7, v8, v9);
  uint64_t v13 = *v10;
  unsigned int v12 = (std::__shared_weak_count *)v10[1];
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v13)
  {
    uint64_t v14 = self->_skit;
    resourceManager = self->_resourceManager;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3321888768;
    v21[2] = sub_25C80BDFC;
    v21[3] = &unk_2709E0330;
    v17 = v14;
    uint64_t v22 = v17;
    uint64_t v24 = v13;
    v25 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v23 = &v26;
    objc_msgSend_activateWithError_operationBlock_(resourceManager, v16, (uint64_t)a4, (uint64_t)v21);
    id v18 = (id)v27[5];
    if (v25) {
      sub_25C7D2280(v25);
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, 0x2709E2730, 5, 0);
    uint64_t v19 = (SEMSkitWrapper *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    id v18 = 0;
    if (a4 && v19)
    {
      v17 = v19;
      id v18 = 0;
      *a4 = v17;
    }
  }

  if (v12) {
    sub_25C7D2280(v12);
  }
  _Block_object_dispose(&v26, 8);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skit, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
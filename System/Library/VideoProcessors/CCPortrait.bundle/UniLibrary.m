@interface UniLibrary
- (CoreImageLibrary)coreImageLibrary;
- (MTLLibrary)library;
- (MTLPipelineLibrarySPI)pipelineLibrary;
- (UniLibrary)initWithDevice:(id)a3 metalOnly:(BOOL)a4;
- (id)_identifyGPU:(id)a3;
- (void)setCoreImageLibrary:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setPipelineLibrary:(id)a3;
@end

@implementation UniLibrary

- (UniLibrary)initWithDevice:(id)a3 metalOnly:(BOOL)a4
{
  id v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)UniLibrary;
  v9 = [(UniLibrary *)&v48 init];
  if (!v9)
  {
LABEL_14:
    v41 = v9;
    goto LABEL_18;
  }
  if (!v6)
  {
    objc_msgSend_metalDevice(MEMORY[0x263F2EE30], v7, v8);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x263F086E0];
  uint64_t v11 = objc_opt_class();
  v14 = objc_msgSend_bundleForClass_(v10, v12, v11);
  if (!a4)
  {
    v15 = objc_opt_new();
    objc_msgSend_setCoreImageLibrary_(v9, v16, (uint64_t)v15);

    v19 = objc_msgSend_coreImageLibrary(v9, v17, v18);
    if (!v19) {
      sub_262E4E65C();
    }
  }
  uint64_t v20 = objc_msgSend_pathForResource_ofType_(v14, v13, @"default", @"metallib");
  if (v20)
  {
    v22 = (void *)v20;
    id v47 = 0;
    v23 = objc_msgSend_newLibraryWithFile_error_(v6, v21, v20, &v47);
    id v24 = v47;
    objc_msgSend_setLibrary_(v9, v25, (uint64_t)v23);

    v28 = objc_msgSend_resourcePath(v14, v26, v27);
    v30 = objc_msgSend__identifyGPU_(v9, v29, (uint64_t)v6);
    v32 = objc_msgSend_stringWithFormat_(NSString, v31, @"%@/%@", v28, v30);
    id v46 = v24;
    v34 = objc_msgSend_newPipelineLibraryWithFilePath_error_(v6, v33, (uint64_t)v32, &v46);
    id v35 = v46;

    objc_msgSend_setPipelineLibrary_(v9, v36, (uint64_t)v34);
    v39 = objc_msgSend_library(v9, v37, v38);

    if (!v39 || v35)
    {
      uni_logger_api();
      v40 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
        sub_262E4E590((uint64_t)v35, v40);
      }
    }
    goto LABEL_14;
  }
  v42 = uni_logger_compile();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    sub_262E4E4EC(v42, v43, v44);
  }

  v41 = 0;
LABEL_18:

  return v41;
}

- (id)_identifyGPU:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_name(v3, v4, v5);
  if (objc_msgSend_containsString_(v6, v7, @"Apple"))
  {
    NSSelectorFromString(&cfstr_Architecture.isa);
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      v15 = &stru_270E15D18;
      goto LABEL_15;
    }
    id v6 = objc_msgSend_architecture(v3, v9, v10);
    v13 = objc_msgSend_name(v6, v11, v12);
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, @"applegpu_", &stru_270E15D18);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_revision(v6, v16, v17);
    if (objc_msgSend_containsString_(v18, v19, @"A"))
    {
      char v21 = 0;
    }
    else if (objc_msgSend_containsString_(v15, v20, @"g16p"))
    {
      id v24 = objc_msgSend_revision(v6, v22, v23);
      char v21 = objc_msgSend_containsString_(v24, v25, @"B0") ^ 1;
    }
    else
    {
      char v21 = 1;
    }

    char v27 = objc_msgSend_containsString_(v15, v26, @"g17p");
    if ((v21 & 1) == 0 && (v27 & 1) == 0)
    {
      v30 = NSString;
      v31 = objc_msgSend_revision(v6, v28, v29);
      v34 = objc_msgSend_lowercaseString(v31, v32, v33);
      uint64_t v36 = objc_msgSend_stringWithFormat_(v30, v35, @"%@_%@", v15, v34);

      v15 = (__CFString *)v36;
    }
  }
  else
  {
    v15 = &stru_270E15D18;
  }

LABEL_15:

  return v15;
}

- (MTLLibrary)library
{
  return (MTLLibrary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLibrary:(id)a3
{
}

- (MTLPipelineLibrarySPI)pipelineLibrary
{
  return self->pipelineLibrary;
}

- (void)setPipelineLibrary:(id)a3
{
}

- (CoreImageLibrary)coreImageLibrary
{
  return (CoreImageLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoreImageLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->coreImageLibrary, 0);
  objc_storeStrong((id *)&self->pipelineLibrary, 0);

  objc_storeStrong((id *)&self->library, 0);
}

@end
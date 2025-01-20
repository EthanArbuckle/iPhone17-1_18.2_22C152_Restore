@interface SNNMILProgram
+ (void)loadContentsOfURL:(id)a3 withContext:(id)a4 completion:(id)a5;
- (BOOL)isReferencingBlobFile;
- (NSArray)functionNames;
- (NSString)milFilePath;
- (SNNMILProgram)initWithProgram:()unique_ptr<MIL:(std:(id)a4 :default_delete<MIL::IRProgram>>)a3 :IRProgram sourceFilePath:;
- (SNNMILProgram)initWithProgram:()unique_ptr<MIL:(std::default_delete<MIL::IRProgram>>)a3 :IRProgram;
- (id).cxx_construct;
- (id)description;
- (id)functionWithName:(id)a3;
- (id)serializeToProtobufWithError:(id *)a3;
- (shared_ptr<MIL::IRProgram>)milProgram;
- (void)writeToFile:(id)a3;
@end

@implementation SNNMILProgram

+ (void)loadContentsOfURL:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *, void))a5;
  v10 = (void *)MEMORY[0x25A2BA3A0]();
  uint64_t v11 = [v7 hasPathExtension:@"mil"];
  if ((v11 & 1) != 0 || (uint64_t v11 = [v7 hasPathExtension:@"txt"], v11))
  {
    MIL::ParserOptions::Make(&v36, (MIL::ParserOptions *)v11);
    uint64_t v12 = v36;
    v13 = [v7 path];
    v14 = v13;
    if (v13)
    {
      [v13 cxxString];
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v35 = 0;
    }
    (*(void (**)(uint64_t, void **, uint64_t))(*(void *)v12 + 32))(v12, __p, 1);
    if (SHIBYTE(v35) < 0) {
      operator delete(__p[0]);
    }

    if (v8)
    {
      [v8 context];
    }
    else
    {
      v31[1] = 0;
      v32 = 0;
    }
    MIL::Text::ParseProgramFromFile();
    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    v15 = [SNNMILProgram alloc];
    uint64_t v16 = v33;
    uint64_t v33 = 0;
    v31[0] = v16;
    v17 = [v7 path];
    v18 = [(SNNMILProgram *)v15 initWithProgram:v31 sourceFilePath:v17];

    uint64_t v19 = v31[0];
    v31[0] = 0;
    if (v19) {
      (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
    }
    v9[2](v9, v18, 0);

    uint64_t v20 = v33;
    uint64_t v33 = 0;
    if (v20) {
      (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
    }
    uint64_t v21 = v36;
    uint64_t v36 = 0;
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
    }
  }
  else if ([v7 hasPathExtension:@"mlpackage"])
  {
    v22 = (void *)MEMORY[0x263F00D80];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __58__SNNMILProgram_loadContentsOfURL_withContext_completion___block_invoke;
    v28[3] = &unk_26542BAD8;
    v30 = v9;
    id v29 = v8;
    [v22 compileModelAtURL:v7 completionHandler:v28];
  }
  else
  {
    if ([v7 hasPathExtension:@"mlmodelc"])
    {
      v23 = [v7 URLByAppendingPathComponent:@"model.mil"];
      v24 = [MEMORY[0x263F08850] defaultManager];
      v25 = [v23 path];
      char v26 = [v24 fileExistsAtPath:v25];

      if (v26)
      {
        +[SNNMILProgram loadContentsOfURL:v23 withContext:v8 completion:v9];
      }
      else
      {
        v27 = +[SNNError errorWithCode:-8 description:@"Model package must be exported as a MLProgram."];
        ((void (**)(id, void *, void *))v9)[2](v9, 0, v27);
      }
    }
    else {
      v23 = {;
    }
      ((void (**)(id, void *, void *))v9)[2](v9, 0, v23);
    }
  }
}

void __58__SNNMILProgram_loadContentsOfURL_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = [v11 URLByAppendingPathComponent:@"model.mil"];
    id v7 = [MEMORY[0x263F08850] defaultManager];
    id v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      +[SNNMILProgram loadContentsOfURL:v6 withContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    }
    else
    {
      v10 = +[SNNError errorWithCode:-8 description:@"Model package must be exported as a MLProgram."];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (SNNMILProgram)initWithProgram:()unique_ptr<MIL:(std:(id)a4 :default_delete<MIL::IRProgram>>)a3 :IRProgram sourceFilePath:
{
  v6 = (NSString *)a4;
  v10.receiver = self;
  v10.super_class = (Class)SNNMILProgram;
  id v7 = [(SNNMILProgram *)&v10 init];
  std::shared_ptr<MIL::IRProgram>::operator=[abi:ne180100]<MIL::IRProgram,std::default_delete<MIL::IRProgram>,void>(&v7->_program.__ptr_, (uint64_t *)a3.var0.var0);
  milFilePath = v7->_milFilePath;
  v7->_milFilePath = v6;

  return v7;
}

- (SNNMILProgram)initWithProgram:()unique_ptr<MIL:(std::default_delete<MIL::IRProgram>>)a3 :IRProgram
{
  uint64_t v3 = *(void *)a3.var0.var0;
  *(void *)a3.var0.var0 = 0;
  uint64_t v7 = v3;
  v4 = [(SNNMILProgram *)self initWithProgram:&v7 sourceFilePath:0];
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  return v4;
}

- (shared_ptr<MIL::IRProgram>)milProgram
{
  cntrl = self->_program.__cntrl_;
  *v2 = self->_program.__ptr_;
  v2[1] = (IRProgram *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (IRProgram *)self;
  return result;
}

- (BOOL)isReferencingBlobFile
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!self->_milFilePath) {
    return 0;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(SNNMILProgram *)self functionNames];
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v3)
  {
    uint64_t v20 = v3;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v23 = 0;
      while (2)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(id *)(*((void *)&v35 + 1) + 8 * v23);
        v25 = -[SNNMILProgram functionWithName:](self, "functionWithName:");
        for (uint64_t i = 0; [v25 operationCount] > i; ++i)
        {
          v4 = objc_msgSend(v25, "operationAtIndex:");
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v5 = [v4 attributes];
          uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v32;
LABEL_11:
            uint64_t v8 = 0;
            while (1)
            {
              if (*(void *)v32 != v7) {
                objc_enumerationMutation(v5);
              }
              id v9 = *(id *)(*((void *)&v31 + 1) + 8 * v8);
              objc_super v10 = [v9 value];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass) {
                goto LABEL_29;
              }
              if (v6 == ++v8)
              {
                uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v40 count:16];
                if (v6) {
                  goto LABEL_11;
                }
                break;
              }
            }
          }

          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v5 = [v4 inputs];
          uint64_t v12 = [v5 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v28;
LABEL_19:
            uint64_t v14 = 0;
            while (1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v5);
              }
              id v15 = *(id *)(*((void *)&v27 + 1) + 8 * v14);
              uint64_t v16 = [v15 value];
              objc_opt_class();
              char v17 = objc_opt_isKindOfClass();

              if (v17) {
                break;
              }
              if (v12 == ++v14)
              {
                uint64_t v12 = [v5 countByEnumeratingWithState:&v27 objects:v39 count:16];
                if (v12) {
                  goto LABEL_19;
                }
                goto LABEL_25;
              }
            }
LABEL_29:

            BOOL v18 = 1;
            goto LABEL_32;
          }
LABEL_25:
        }
        if (++v23 != v20) {
          continue;
        }
        break;
      }
      BOOL v18 = 0;
      uint64_t v20 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v20);
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_32:

  return v18;
}

- (NSArray)functionNames
{
  uint64_t v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  for (uint64_t i = *(void **)((*(uint64_t (**)(IRProgram *))(*(void *)self->_program.__ptr_ + 72))(self->_program.__ptr_)
                       + 16); i; uint64_t i = (void *)*i)
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithCXXString:i + 2];
    [v3 addObject:v5];
  }
  return (NSArray *)v3;
}

- (id)functionWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 cxxString];
  }
  else {
    memset(&v22, 0, sizeof(v22));
  }
  uint64_t v6 = *(uint64_t ***)((*(uint64_t (**)(IRProgram *))(*(void *)self->_program.__ptr_ + 72))(self->_program.__ptr_)
                    + 16);
  if (!v6)
  {
LABEL_22:
    id v15 = 0;
    goto LABEL_32;
  }
  uint64_t v7 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
  long long v8 = *(_OWORD *)&v22.__r_.__value_.__l.__data_;
  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v22.__r_.__value_.__l.__size_;
  }
  while (1)
  {
    objc_super v10 = (uint64_t *)*((unsigned __int8 *)v6 + 39);
    int v11 = (char)v10;
    if ((char)v10 < 0) {
      objc_super v10 = v6[3];
    }
    if ((uint64_t *)size != v10) {
      goto LABEL_21;
    }
    uint64_t v12 = v11 >= 0 ? v6 + 2 : (uint64_t **)v6[2];
    if ((v7 & 0x80) != 0) {
      break;
    }
    if (!v7) {
      goto LABEL_23;
    }
    uint64_t v13 = &v22;
    uint64_t v14 = v7;
    while (v13->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v12)
    {
      uint64_t v13 = (std::string *)((char *)v13 + 1);
      uint64_t v12 = (uint64_t **)((char *)v12 + 1);
      if (!--v14) {
        goto LABEL_23;
      }
    }
LABEL_21:
    uint64_t v6 = (uint64_t **)*v6;
    if (!v6) {
      goto LABEL_22;
    }
  }
  if (memcmp((const void *)v8, v12, *((size_t *)&v8 + 1))) {
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v16 = [SNNMILFunction alloc];
  char v17 = (std::__shared_weak_count *)v6[6];
  uint64_t v20 = v6[5];
  uint64_t v21 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v22;
  }
  id v15 = [(SNNMILFunction *)v16 initWithFunction:&v20 name:&__p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
LABEL_32:
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }

  return v15;
}

- (void)writeToFile:(id)a3
{
  uint64_t v3 = (MIL::Text::SerializerOptions *)a3;
  MIL::Text::SerializerOptions::Make(&v8, v3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 88))(v8, 1);
  uint64_t v4 = v8;
  if (v3)
  {
    [(MIL::Text::SerializerOptions *)v3 cxxString];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v7 = 0;
  }
  (*(void (**)(uint64_t, void **))(*(void *)v4 + 24))(v4, __p);
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  MIL::Text::SerializeToFile();
  uint64_t v5 = v8;
  uint64_t v8 = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
}

- (id)serializeToProtobufWithError:(id *)a3
{
  MIL::Opsets::Common::CreateMILContext(v12, (MIL::Opsets::Common *)self);
  if (v12[0]) {
    operator new();
  }
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  MIL::Proto::SerializeProgram();
  std::stringbuf::str();
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  if ((v9 & 0x80u) == 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    unint64_t v5 = v9;
  }
  else {
    unint64_t v5 = (unint64_t)__p[1];
  }
  uint64_t v6 = (void *)[v3 initWithBytes:v4 length:v5];
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  v12[0] = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)v12 + *(void *)(v12[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v12[1] = MEMORY[0x263F8C318] + 16;
  if (v13 < 0) {
    operator delete((void *)v12[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x25A2BA050](&v14);
  return v6;
}

- (id)description
{
  (*(void (**)(void **__return_ptr))(*(void *)self->_program.__ptr_ + 16))(__p);
  v2 = (void *)[[NSString alloc] initWithCXXString:__p];
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  return v2;
}

- (NSString)milFilePath
{
  return self->_milFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_milFilePath, 0);
  cntrl = self->_program.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (uint64_t)initWithProgram:.cold.1()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

@end
@interface PluginDecoder
+ (id)persistentContext:(id)a3;
+ (void)decoderWithData:(uint64_t)a1;
- (id).cxx_construct;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)p_data;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)p_data;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)p_data;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)p_data;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)p_data;
- (void)classChecker;
- (void)initWithData:(void *)a1;
@end

@implementation PluginDecoder

+ (void)decoderWithData:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = -[PluginDecoder initWithData:]([PluginDecoder alloc], v2);

  return v3;
}

- (void)initWithData:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)PluginDecoder;
    a1 = [super init];
    if (a1)
    {
      OVM::Deserialize(v3, (uint64_t)v12);
      if (v13)
      {
        v4 = (uint64_t *)caulk::expected<std::shared_ptr<OVM::Script>,OVM::Error>::value((uint64_t)v12);
        uint64_t v6 = *v4;
        uint64_t v5 = v4[1];
        if (v5) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
        }
        v7 = (std::__shared_weak_count *)a1[2];
        a1[1] = v6;
        a1[2] = v5;
        if (v7) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        }
        caulk::__expected_detail::base<std::shared_ptr<OVM::Script>,OVM::Error>::~base((uint64_t)v12);
      }
      else
      {
        v8 = ATLLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          ctu::join<std::__wrap_iter<std::string const*>>(v12[0], v12[1], ", ", 2uLL, &__p);
          v9 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
             ? &__p
             : (std::string *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 136315138;
          v16 = v9;
          _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed to deserialize script %s", buf, 0xCu);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }

        caulk::__expected_detail::base<std::shared_ptr<OVM::Script>,OVM::Error>::~base((uint64_t)v12);
        a1 = 0;
      }
    }
  }

  return a1;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)p_data
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v52 = 3;
  id v53 = 0;
  int v54 = 2;
  v16 = operator new(0x78uLL);
  v50 = v16 + 15;
  v51 = (char *)(v16 + 15);
  *(_DWORD *)v16 = 3;
  v16[1] = v12;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v13;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v14;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v15;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v52;
  *((_DWORD *)v16 + 28) = 3;
  std::string __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v44 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&v69, "getAppletStateAndHistory");
  [(PluginDecoder *)self classChecker];
  if (-[PluginDecoder globals]::onceToken != -1) {
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  }
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v69, (uint64_t *)&__p, &v41, -[PluginDecoder globals]::_globals, (uint64_t)&v45);
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v69.__r_.__value_.__l.__data_);
  }
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v44);
  }
  if (!v48)
  {
    v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v45, v46, ", ", 2uLL, &v69);
      v20 = (v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v69
          : (std::string *)v69.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v68 = v20;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v69.__r_.__value_.__l.__data_);
      }
    }

    id v21 = [NSString alloc];
    ctu::join<std::__wrap_iter<std::string const*>>(v45, v46, ", ", 2uLL, &v69);
    if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v22 = &v69;
    }
    else {
      v22 = (std::string *)v69.__r_.__value_.__r.__words[0];
    }
    v18 = (std::string *)[v21 initWithFormat:@"Script execution failure: %s", v22];
    if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v69.__r_.__value_.__l.__data_);
      if (!p_data) {
        goto LABEL_53;
      }
    }
    else if (!p_data)
    {
      goto LABEL_53;
    }
    id v29 = *p_data;
    v27 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v30 = *MEMORY[0x1E4F28A50];
      v63[0] = *MEMORY[0x1E4F28568];
      v63[1] = v30;
      v64[0] = v18;
      v64[1] = v29;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
    }
    else
    {
      uint64_t v65 = *MEMORY[0x1E4F28568];
      v66 = v18;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    }
    goto LABEL_47;
  }
  if (p_data)
  {
    if (v52 != 3) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    if (v54 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    *p_data = v53;
  }
  if (v45 == 3)
  {
    if (v47 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    v18 = v46;
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v18 = v18;
      p_data = (id *)&v18->__r_.__value_.__l.__data_;
      goto LABEL_53;
    }
    v32 = ATLLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_opt_class();
      LODWORD(v69.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v69.__r_.__value_.__r.__words + 4) = v33;
      _os_log_impl(&dword_1CA552000, v32, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v69, 0xCu);
    }

    uint64_t v34 = [[NSString alloc] initWithFormat:@"Plugin returned wrong class %@", objc_opt_class()];
    v35 = (void *)v34;
    if (p_data)
    {
      id v36 = *p_data;
      v37 = (void *)MEMORY[0x1E4F28C58];
      if (*p_data)
      {
        uint64_t v38 = *MEMORY[0x1E4F28A50];
        v55[0] = *MEMORY[0x1E4F28568];
        v55[1] = v38;
        v56[0] = v34;
        v56[1] = v36;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
      }
      else
      {
        uint64_t v57 = *MEMORY[0x1E4F28568];
        uint64_t v58 = v34;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      v39 = };
      *p_data = [v37 errorWithDomain:@"ATL" code:8 userInfo:v39];
    }
    goto LABEL_52;
  }
  v23 = ATLLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v69.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v69.__r_.__value_.__r.__words[0]) = v45;
    _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v69, 8u);
  }

  id v24 = [NSString alloc];
  uint64_t v25 = [v24 initWithFormat:@"Plugin returned wrong dynamic type %d", v45];
  v18 = (std::string *)v25;
  if (p_data)
  {
    id v26 = *p_data;
    v27 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v59[0] = *MEMORY[0x1E4F28568];
      v59[1] = v28;
      v60[0] = v25;
      v60[1] = v26;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
    }
    else
    {
      uint64_t v61 = *MEMORY[0x1E4F28568];
      uint64_t v62 = v25;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    }
    v31 = LABEL_47:;
    *p_data = [v27 errorWithDomain:@"ATL" code:8 userInfo:v31];

LABEL_52:
    p_data = 0;
  }
LABEL_53:

  if (!v48)
  {
    v69.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v69);
  }
  if (__p)
  {
    v50 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (void)classChecker
{
  if (result)
  {
    if (-[PluginDecoder classChecker]::onceToken != -1) {
      dispatch_once(&-[PluginDecoder classChecker]::onceToken, &__block_literal_global_518);
    }
    result = operator new(0x28uLL);
    result[1] = 0;
    result[2] = 0;
    *result = &unk_1F24D3A28;
    uint64_t v3 = -[PluginDecoder classChecker]::_allowlistedClases;
    result[3] = &unk_1F24D3990;
    result[4] = v3;
    *a2 = result + 3;
    a2[1] = result;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)p_data
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  int v55 = 3;
  id v56 = 0;
  int v57 = 2;
  v19 = operator new(0x90uLL);
  int v54 = (char *)(v19 + 18);
  *(_DWORD *)v19 = 3;
  v19[1] = v14;
  *((_DWORD *)v19 + 4) = 2;
  *((_DWORD *)v19 + 6) = 3;
  v19[4] = v15;
  *((_DWORD *)v19 + 10) = 2;
  *((_DWORD *)v19 + 12) = 3;
  v19[7] = v16;
  *((_DWORD *)v19 + 16) = 2;
  *((_DWORD *)v19 + 18) = 3;
  v19[10] = v17;
  *((_DWORD *)v19 + 22) = 2;
  *((_DWORD *)v19 + 24) = 3;
  v19[13] = v18;
  *((_DWORD *)v19 + 28) = 2;
  *((_DWORD *)v19 + 30) = 4;
  v19[16] = &v55;
  *((_DWORD *)v19 + 34) = 3;
  std::string __p = v19;
  id v53 = v19 + 18;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  int v47 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&v72, "parseHCIEvent");
  [(PluginDecoder *)self classChecker];
  if (-[PluginDecoder globals]::onceToken != -1) {
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  }
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v72, (uint64_t *)&__p, &v44, -[PluginDecoder globals]::_globals, (uint64_t)&v48);
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v72.__r_.__value_.__l.__data_);
  }
  if (v47) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v47);
  }
  if (!v51)
  {
    v22 = ATLLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v48, v49, ", ", 2uLL, &v72);
      v23 = (v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v72
          : (std::string *)v72.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v71 = v23;
      _os_log_impl(&dword_1CA552000, v22, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v72.__r_.__value_.__l.__data_);
      }
    }

    id v24 = [NSString alloc];
    ctu::join<std::__wrap_iter<std::string const*>>(v48, v49, ", ", 2uLL, &v72);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v25 = &v72;
    }
    else {
      uint64_t v25 = (std::string *)v72.__r_.__value_.__r.__words[0];
    }
    id v21 = (std::string *)[v24 initWithFormat:@"Script execution failure: %s", v25];
    if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v72.__r_.__value_.__l.__data_);
      if (!p_data) {
        goto LABEL_53;
      }
    }
    else if (!p_data)
    {
      goto LABEL_53;
    }
    id v32 = *p_data;
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      v66[0] = *MEMORY[0x1E4F28568];
      v66[1] = v33;
      v67[0] = v21;
      v67[1] = v32;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
    }
    else
    {
      uint64_t v68 = *MEMORY[0x1E4F28568];
      std::string v69 = v21;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    }
    goto LABEL_47;
  }
  if (p_data)
  {
    if (v55 != 3) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    if (v57 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    *p_data = v56;
  }
  if (v48 == 3)
  {
    if (v50 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    id v21 = v49;
    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v21 = v21;
      p_data = (id *)&v21->__r_.__value_.__l.__data_;
      goto LABEL_53;
    }
    v35 = ATLLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_opt_class();
      LODWORD(v72.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v72.__r_.__value_.__r.__words + 4) = v36;
      _os_log_impl(&dword_1CA552000, v35, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v72, 0xCu);
    }

    uint64_t v37 = [[NSString alloc] initWithFormat:@"Plugin returned wrong class %@", objc_opt_class()];
    uint64_t v38 = (void *)v37;
    if (p_data)
    {
      id v39 = *p_data;
      v40 = (void *)MEMORY[0x1E4F28C58];
      if (*p_data)
      {
        uint64_t v41 = *MEMORY[0x1E4F28A50];
        v58[0] = *MEMORY[0x1E4F28568];
        v58[1] = v41;
        v59[0] = v37;
        v59[1] = v39;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
      }
      else
      {
        uint64_t v60 = *MEMORY[0x1E4F28568];
        uint64_t v61 = v37;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      v42 = };
      *p_data = [v40 errorWithDomain:@"ATL" code:8 userInfo:v42];
    }
    goto LABEL_52;
  }
  id v26 = ATLLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v72.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v72.__r_.__value_.__r.__words[0]) = v48;
    _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v72, 8u);
  }

  id v27 = [NSString alloc];
  uint64_t v28 = [v27 initWithFormat:@"Plugin returned wrong dynamic type %d", v48];
  id v21 = (std::string *)v28;
  if (p_data)
  {
    id v29 = *p_data;
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v62[0] = *MEMORY[0x1E4F28568];
      v62[1] = v31;
      v63[0] = v28;
      v63[1] = v29;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
    }
    else
    {
      uint64_t v64 = *MEMORY[0x1E4F28568];
      uint64_t v65 = v28;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    }
    uint64_t v34 = LABEL_47:;
    *p_data = [v30 errorWithDomain:@"ATL" code:8 userInfo:v34];

LABEL_52:
    p_data = 0;
  }
LABEL_53:

  if (!v51)
  {
    v72.__r_.__value_.__r.__words[0] = (std::string::size_type)&v48;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v72);
  }
  if (__p)
  {
    id v53 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)p_data
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v52 = 3;
  id v53 = 0;
  int v54 = 2;
  id v16 = operator new(0x78uLL);
  int v50 = v16 + 15;
  char v51 = (char *)(v16 + 15);
  *(_DWORD *)id v16 = 3;
  v16[1] = v12;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v13;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v14;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v15;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v52;
  *((_DWORD *)v16 + 28) = 3;
  std::string __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  uint64_t v44 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&v69, "GetAppletProperties");
  [(PluginDecoder *)self classChecker];
  if (-[PluginDecoder globals]::onceToken != -1) {
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  }
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v69, (uint64_t *)&__p, &v41, -[PluginDecoder globals]::_globals, (uint64_t)&v45);
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v69.__r_.__value_.__l.__data_);
  }
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v44);
  }
  if (!v48)
  {
    v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v45, v46, ", ", 2uLL, &v69);
      v20 = (v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v69
          : (std::string *)v69.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      uint64_t v68 = v20;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v69.__r_.__value_.__l.__data_);
      }
    }

    id v21 = [NSString alloc];
    ctu::join<std::__wrap_iter<std::string const*>>(v45, v46, ", ", 2uLL, &v69);
    if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v22 = &v69;
    }
    else {
      v22 = (std::string *)v69.__r_.__value_.__r.__words[0];
    }
    id v18 = (std::string *)[v21 initWithFormat:v22];
    if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v69.__r_.__value_.__l.__data_);
      if (!p_data) {
        goto LABEL_53;
      }
    }
    else if (!p_data)
    {
      goto LABEL_53;
    }
    id v29 = *p_data;
    id v27 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v30 = *MEMORY[0x1E4F28A50];
      v63[0] = *MEMORY[0x1E4F28568];
      v63[1] = v30;
      v64[0] = v18;
      v64[1] = v29;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
    }
    else
    {
      uint64_t v65 = *MEMORY[0x1E4F28568];
      v66 = v18;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    }
    goto LABEL_47;
  }
  if (p_data)
  {
    if (v52 != 3) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    if (v54 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    *p_data = v53;
  }
  if (v45 == 3)
  {
    if (v47 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    id v18 = v46;
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v18 = v18;
      p_data = (id *)&v18->__r_.__value_.__l.__data_;
      goto LABEL_53;
    }
    id v32 = ATLLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_opt_class();
      LODWORD(v69.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v69.__r_.__value_.__r.__words + 4) = v33;
      _os_log_impl(&dword_1CA552000, v32, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v69, 0xCu);
    }

    uint64_t v34 = [[NSString alloc] initWithFormat:@"Plugin returned wrong class %@", objc_opt_class()];
    v35 = (void *)v34;
    if (p_data)
    {
      id v36 = *p_data;
      uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
      if (*p_data)
      {
        uint64_t v38 = *MEMORY[0x1E4F28A50];
        v55[0] = *MEMORY[0x1E4F28568];
        v55[1] = v38;
        v56[0] = v34;
        v56[1] = v36;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
      }
      else
      {
        uint64_t v57 = *MEMORY[0x1E4F28568];
        uint64_t v58 = v34;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      id v39 = };
      *p_data = [v37 errorWithDomain:@"ATL" code:8 userInfo:v39];
    }
    goto LABEL_52;
  }
  v23 = ATLLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v69.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v69.__r_.__value_.__r.__words[0]) = v45;
    _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v69, 8u);
  }

  id v24 = [NSString alloc];
  uint64_t v25 = [v24 initWithFormat:@"Plugin returned wrong dynamic type %d", v45];
  id v18 = (std::string *)v25;
  if (p_data)
  {
    id v26 = *p_data;
    id v27 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v59[0] = *MEMORY[0x1E4F28568];
      v59[1] = v28;
      v60[0] = v25;
      v60[1] = v26;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
    }
    else
    {
      uint64_t v61 = *MEMORY[0x1E4F28568];
      uint64_t v62 = v25;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    }
    uint64_t v31 = LABEL_47:;
    *p_data = [v27 errorWithDomain:@"ATL" code:8 userInfo:v31];

LABEL_52:
    p_data = 0;
  }
LABEL_53:

  if (!v48)
  {
    v69.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v69);
  }
  if (__p)
  {
    int v50 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)p_data
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v53 = 3;
  id v54 = 0;
  int v55 = 2;
  id v16 = operator new(0x78uLL);
  char v51 = v16 + 15;
  int v52 = (char *)(v16 + 15);
  *(_DWORD *)id v16 = 3;
  v16[1] = v13;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v14;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v15;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v12;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v53;
  *((_DWORD *)v16 + 28) = 3;
  std::string __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v45 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&v70, "processEndOfTransaction");
  [(PluginDecoder *)self classChecker];
  if (-[PluginDecoder globals]::onceToken != -1) {
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  }
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v70, (uint64_t *)&__p, &v42, -[PluginDecoder globals]::_globals, (uint64_t)&v46);
  if (v43) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v43);
  }
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v45);
  }
  if (!v49)
  {
    v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v46, v47, ", ", 2uLL, &v70);
      v20 = (v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v70
          : (std::string *)v70.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      std::string v69 = v20;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v70.__r_.__value_.__l.__data_);
      }
    }

    id v21 = [NSString alloc];
    ctu::join<std::__wrap_iter<std::string const*>>(v46, v47, ", ", 2uLL, &v70);
    if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v22 = &v70;
    }
    else {
      v22 = (std::string *)v70.__r_.__value_.__r.__words[0];
    }
    v23 = (std::string *)[v21 initWithFormat:@"Script execution failure: %s", v22];
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v70.__r_.__value_.__l.__data_);
      if (!p_data) {
        goto LABEL_55;
      }
    }
    else if (!p_data)
    {
      goto LABEL_55;
    }
    id v30 = *p_data;
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v64[0] = *MEMORY[0x1E4F28568];
      v64[1] = v31;
      v65[0] = v23;
      v65[1] = v30;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
    }
    else
    {
      uint64_t v66 = *MEMORY[0x1E4F28568];
      v67 = v23;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    }
    goto LABEL_49;
  }
  if (p_data)
  {
    if (v53 == 3)
    {
      if (v55 != 2) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      id v18 = v54;
    }
    else
    {
      id v18 = 0;
    }
    *p_data = v18;
  }
  if (v46 == 3)
  {
    if (v48 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    v23 = v47;
    if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = v23;
      p_data = (id *)&v23->__r_.__value_.__l.__data_;
      goto LABEL_55;
    }
    uint64_t v33 = ATLLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_opt_class();
      LODWORD(v70.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v70.__r_.__value_.__r.__words + 4) = v34;
      _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v70, 0xCu);
    }

    uint64_t v35 = [[NSString alloc] initWithFormat:@"Plugin returned wrong class %@", objc_opt_class()];
    id v36 = (void *)v35;
    if (p_data)
    {
      id v37 = *p_data;
      uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
      if (*p_data)
      {
        uint64_t v39 = *MEMORY[0x1E4F28A50];
        v56[0] = *MEMORY[0x1E4F28568];
        v56[1] = v39;
        v57[0] = v35;
        v57[1] = v37;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
      }
      else
      {
        uint64_t v58 = *MEMORY[0x1E4F28568];
        uint64_t v59 = v35;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      v40 = };
      *p_data = [v38 errorWithDomain:@"ATL" code:8 userInfo:v40];
    }
    goto LABEL_54;
  }
  id v24 = ATLLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v70.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v70.__r_.__value_.__r.__words[0]) = v46;
    _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v70, 8u);
  }

  id v25 = [NSString alloc];
  uint64_t v26 = [v25 initWithFormat:v46];
  v23 = (std::string *)v26;
  if (p_data)
  {
    id v27 = *p_data;
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v29 = *MEMORY[0x1E4F28A50];
      v60[0] = *MEMORY[0x1E4F28568];
      v60[1] = v29;
      v61[0] = v26;
      v61[1] = v27;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
    }
    else
    {
      uint64_t v62 = *MEMORY[0x1E4F28568];
      uint64_t v63 = v26;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    }
    id v32 = LABEL_49:;
    *p_data = [v28 errorWithDomain:@"ATL" code:8 userInfo:v32];

LABEL_54:
    p_data = 0;
  }
LABEL_55:

  if (!v49)
  {
    v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v46;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
  }
  if (__p)
  {
    char v51 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  int v58 = 3;
  id v59 = 0;
  int v60 = 2;
  id v21 = operator new(0xA8uLL);
  uint64_t v57 = (char *)(v21 + 21);
  *(_DWORD *)id v21 = 3;
  v21[1] = v15;
  *((_DWORD *)v21 + 4) = 2;
  *((_DWORD *)v21 + 6) = 3;
  v21[4] = v16;
  *((_DWORD *)v21 + 10) = 2;
  *((_DWORD *)v21 + 12) = 3;
  v21[7] = v17;
  *((_DWORD *)v21 + 16) = 2;
  *((_DWORD *)v21 + 18) = 3;
  v21[10] = v18;
  *((_DWORD *)v21 + 22) = 2;
  *((_DWORD *)v21 + 24) = 3;
  v21[13] = v19;
  *((_DWORD *)v21 + 28) = 2;
  *((_DWORD *)v21 + 30) = 3;
  v21[16] = v20;
  *((_DWORD *)v21 + 34) = 2;
  *((_DWORD *)v21 + 36) = 4;
  v21[19] = &v58;
  *((_DWORD *)v21 + 40) = 3;
  std::string __p = v21;
  id v56 = v21 + 21;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  int v50 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&v75, "getServiceProviderDataWithEncryptionScheme");
  [(PluginDecoder *)self classChecker];
  if (-[PluginDecoder globals]::onceToken != -1) {
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  }
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v75, (uint64_t *)&__p, &v47, -[PluginDecoder globals]::_globals, (uint64_t)&v51);
  if (v48) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  if (v50) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v50);
  }
  if (!v54)
  {
    id v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v51, v52, ", ", 2uLL, &v75);
      id v25 = (v75.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v75
          : (std::string *)v75.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v74 = v25;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v75.__r_.__value_.__l.__data_);
      }
    }

    id v26 = [NSString alloc];
    ctu::join<std::__wrap_iter<std::string const*>>(v51, v52, ", ", 2uLL, &v75);
    if ((v75.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      id v27 = &v75;
    }
    else {
      id v27 = (std::string *)v75.__r_.__value_.__r.__words[0];
    }
    uint64_t v28 = (std::string *)[v26 initWithFormat:@"Script execution failure: %s", v27];
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v75.__r_.__value_.__l.__data_);
      if (!a9) {
        goto LABEL_54;
      }
    }
    else if (!a9)
    {
      goto LABEL_54;
    }
    id v36 = *a9;
    uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
    if (*a9)
    {
      uint64_t v37 = *MEMORY[0x1E4F28A50];
      v69[0] = *MEMORY[0x1E4F28568];
      v69[1] = v37;
      v70[0] = v28;
      v70[1] = v36;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
    }
    else
    {
      uint64_t v71 = *MEMORY[0x1E4F28568];
      std::string v72 = v28;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    }
    uint64_t v38 = LABEL_49:;
    *a9 = [v34 errorWithDomain:@"ATL" code:8 userInfo:v38];

    goto LABEL_54;
  }
  if (a9)
  {
    if (v58 == 3)
    {
      if (v60 != 2) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      id v23 = v59;
    }
    else
    {
      id v23 = 0;
    }
    *a9 = v23;
  }
  if (v51 != 3)
  {
    id v30 = ATLLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v75.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(v75.__r_.__value_.__r.__words[0]) = v51;
      _os_log_impl(&dword_1CA552000, v30, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v75, 8u);
    }

    id v31 = [NSString alloc];
    uint64_t v32 = [v31 initWithFormat:@"Plugin returned wrong dynamic type %d", v51];
    uint64_t v28 = (std::string *)v32;
    if (!a9) {
      goto LABEL_54;
    }
    id v33 = *a9;
    uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
    if (*a9)
    {
      uint64_t v35 = *MEMORY[0x1E4F28A50];
      v65[0] = *MEMORY[0x1E4F28568];
      v65[1] = v35;
      v66[0] = v32;
      v66[1] = v33;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
    }
    else
    {
      uint64_t v67 = *MEMORY[0x1E4F28568];
      uint64_t v68 = v32;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    }
    goto LABEL_49;
  }
  if (v53 != 2) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v28 = v52;
  if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v28 = v28;
    uint64_t v29 = v28;
    goto LABEL_55;
  }
  uint64_t v39 = ATLLogObject();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    uint64_t v40 = objc_opt_class();
    LODWORD(v75.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)v75.__r_.__value_.__r.__words + 4) = v40;
    _os_log_impl(&dword_1CA552000, v39, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v75, 0xCu);
  }

  v46 = (void *)[[NSString alloc] initWithFormat:@"Plugin returned wrong class %@", objc_opt_class()];
  if (a9)
  {
    id v41 = *a9;
    uint64_t v42 = (void *)MEMORY[0x1E4F28C58];
    if (*a9)
    {
      uint64_t v43 = *MEMORY[0x1E4F28A50];
      v61[0] = *MEMORY[0x1E4F28568];
      v61[1] = v43;
      v62[0] = v46;
      v62[1] = v41;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
    }
    else
    {
      uint64_t v63 = *MEMORY[0x1E4F28568];
      uint64_t v64 = v46;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    uint64_t v44 = };
    *a9 = [v42 errorWithDomain:@"ATL" code:8 userInfo:v44];
  }
LABEL_54:
  uint64_t v29 = 0;
LABEL_55:

  if (!v54)
  {
    v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&v51;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v75);
  }
  if (__p)
  {
    id v56 = __p;
    operator delete(__p);
  }

  return v29;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)p_data
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v53 = 3;
  id v54 = 0;
  int v55 = 2;
  id v16 = operator new(0x78uLL);
  char v51 = v16 + 15;
  int v52 = (char *)(v16 + 15);
  *(_DWORD *)id v16 = 3;
  v16[1] = v12;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v13;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v14;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v15;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v53;
  *((_DWORD *)v16 + 28) = 3;
  std::string __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v45 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&v70, "getServiceProviderData");
  [(PluginDecoder *)self classChecker];
  if (-[PluginDecoder globals]::onceToken != -1) {
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  }
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v70, (uint64_t *)&__p, &v42, -[PluginDecoder globals]::_globals, (uint64_t)&v46);
  if (v43) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v43);
  }
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v45);
  }
  if (!v49)
  {
    id v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v46, v47, ", ", 2uLL, &v70);
      id v20 = (v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v70
          : (std::string *)v70.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      std::string v69 = v20;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v70.__r_.__value_.__l.__data_);
      }
    }

    id v21 = [NSString alloc];
    ctu::join<std::__wrap_iter<std::string const*>>(v46, v47, ", ", 2uLL, &v70);
    if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v22 = &v70;
    }
    else {
      v22 = (std::string *)v70.__r_.__value_.__r.__words[0];
    }
    id v23 = (std::string *)[v21 initWithFormat:@"Script execution failure: %s", v22];
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v70.__r_.__value_.__l.__data_);
      if (!p_data) {
        goto LABEL_55;
      }
    }
    else if (!p_data)
    {
      goto LABEL_55;
    }
    id v30 = *p_data;
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v64[0] = *MEMORY[0x1E4F28568];
      v64[1] = v31;
      v65[0] = v23;
      v65[1] = v30;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
    }
    else
    {
      uint64_t v66 = *MEMORY[0x1E4F28568];
      uint64_t v67 = v23;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    }
    goto LABEL_49;
  }
  if (p_data)
  {
    if (v53 == 3)
    {
      if (v55 != 2) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      id v18 = v54;
    }
    else
    {
      id v18 = 0;
    }
    *p_data = v18;
  }
  if (v46 == 3)
  {
    if (v48 != 2) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    id v23 = v47;
    if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v23 = v23;
      p_data = (id *)&v23->__r_.__value_.__l.__data_;
      goto LABEL_55;
    }
    id v33 = ATLLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_opt_class();
      LODWORD(v70.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v70.__r_.__value_.__r.__words + 4) = v34;
      _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v70, 0xCu);
    }

    uint64_t v35 = [[NSString alloc] initWithFormat:@"Plugin returned wrong class %@", objc_opt_class()];
    id v36 = (void *)v35;
    if (p_data)
    {
      id v37 = *p_data;
      uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
      if (*p_data)
      {
        uint64_t v39 = *MEMORY[0x1E4F28A50];
        v56[0] = *MEMORY[0x1E4F28568];
        v56[1] = v39;
        v57[0] = v35;
        v57[1] = v37;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
      }
      else
      {
        uint64_t v58 = *MEMORY[0x1E4F28568];
        uint64_t v59 = v35;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      uint64_t v40 = };
      *p_data = [v38 errorWithDomain:@"ATL" code:8 userInfo:v40];
    }
    goto LABEL_54;
  }
  id v24 = ATLLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v70.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v70.__r_.__value_.__r.__words[0]) = v46;
    _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v70, 8u);
  }

  id v25 = [NSString alloc];
  uint64_t v26 = [v25 initWithFormat:@"Plugin returned wrong dynamic type %d", v46];
  id v23 = (std::string *)v26;
  if (p_data)
  {
    id v27 = *p_data;
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    if (*p_data)
    {
      uint64_t v29 = *MEMORY[0x1E4F28A50];
      v60[0] = *MEMORY[0x1E4F28568];
      v60[1] = v29;
      v61[0] = v26;
      v61[1] = v27;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
    }
    else
    {
      uint64_t v62 = *MEMORY[0x1E4F28568];
      uint64_t v63 = v26;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    }
    uint64_t v32 = LABEL_49:;
    *p_data = [v28 errorWithDomain:@"ATL" code:8 userInfo:v32];

LABEL_54:
    p_data = 0;
  }
LABEL_55:

  if (!v49)
  {
    v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v46;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
  }
  if (__p)
  {
    char v51 = __p;
    operator delete(__p);
  }

  return p_data;
}

void __24__PluginDecoder_globals__block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

void __29__PluginDecoder_classChecker__block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (void).cxx_destruct
{
  cntrl = self->script.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

+ (id)persistentContext:(id)a3
{
  id v3 = a3;
  if (+[PluginDecoder(IndirectMethods) persistentContext:]::onceToken[0] != -1) {
    dispatch_once(+[PluginDecoder(IndirectMethods) persistentContext:]::onceToken, &__block_literal_global_604);
  }
  v4 = [(id)+[PluginDecoder(IndirectMethods) persistentContext:]::persistentStore objectForKeyedSubscript:v3];
  if (!v4)
  {
    uint64_t v5 = (void *)+[PluginDecoder(IndirectMethods) persistentContext:]::persistentStore;
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

uint64_t __52__PluginDecoder_IndirectMethods__persistentContext___block_invoke()
{
  +[PluginDecoder(IndirectMethods) persistentContext:]::persistentStore = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

@end
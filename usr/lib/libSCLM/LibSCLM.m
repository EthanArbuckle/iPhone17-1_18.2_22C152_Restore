@interface LibSCLM
+ (BOOL)InspectSEFW:(id)a3 closure:(id)a4 error:(id *)a5;
+ (id)PerformOnlyScriptInSEFW:(id)a3 seHandle:(id)a4 logSink:(id)a5;
+ (id)PerformScript:(unint64_t)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6;
+ (id)PerformScriptWithName:(id)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6;
+ (uint64_t)InspectSEFW:closure:error:;
+ (void)InspectSEFW:closure:error:;
@end

@implementation LibSCLM

+ (id)PerformScript:(unint64_t)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6
{
  v44[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_weak_owners_ = 0;
  v12->__shared_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB13E8;
  id v13 = v10;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1420;
  v12[1].__shared_owners_ = (uint64_t)v13;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  v14 = (std::__shared_weak_count *)operator new(0x28uLL);
  v14->__shared_weak_owners_ = 0;
  v14->__shared_owners_ = 0;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1448;
  id v15 = v11;
  v14[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1480;
  v14[1].__shared_owners_ = (uint64_t)v15;
  atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  if (v9)
  {
    [v9 asCXXString];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v38 = 0;
  }
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v39);
  if (SHIBYTE(v38) < 0) {
    operator delete(__p[0]);
  }
  if (v40)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    v33 = v12 + 1;
    v34 = v12;
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    v31 = v14 + 1;
    v32 = v14;
    v16 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v39);
    v17 = (std::__shared_weak_count *)v16[1];
    uint64_t v29 = *v16;
    v30 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    SCLM::SCLMPrivateInterface::PerformScript(a3, (uint64_t *)&v33, (uint64_t *)&v31, &v29, (uint64_t)&v35);
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    }
    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    if (v36)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F08320];
      v19 = NSString;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v35.__r_.__value_.__l.__data_, (std::string *)v35.__r_.__value_.__l.__size_, ", ", 2uLL, &v28);
      v20 = [v19 stringWithCXXString:&v28];
      v42 = v20;
      v21 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      v22 = [v18 errorWithDomain:@"SCLM" code:0 userInfo:v21];

      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v28.__r_.__value_.__l.__data_);
      }
      if (v36)
      {
        v28.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v24 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v39[0], v39[1], ", ", 2uLL, &v35);
    v25 = [v24 stringWithCXXString:&v35];
    v44[0] = v25;
    v26 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v22 = [v23 errorWithDomain:@"SCLM" code:0 userInfo:v26];

    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v39);
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);

  return v22;
}

+ (id)PerformScriptWithName:(id)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6
{
  v48[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v29 = v11;
  id v13 = (std::__shared_weak_count *)operator new(0x28uLL);
  v13->__shared_weak_owners_ = 0;
  v13->__shared_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB13E8;
  id v14 = v11;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1420;
  v13[1].__shared_owners_ = (uint64_t)v14;
  atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  id v15 = (std::__shared_weak_count *)operator new(0x28uLL);
  v15->__shared_weak_owners_ = 0;
  v15->__shared_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1448;
  id v16 = v12;
  v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1480;
  v15[1].__shared_owners_ = (uint64_t)v16;
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  if (v10)
  {
    [v10 asCXXString:v29];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v42 = 0;
  }
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v43);
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  if (v44)
  {
    if (v9)
    {
      [v9 asCXXString];
    }
    else
    {
      v37[0] = 0;
      v37[1] = 0;
      uint64_t v38 = 0;
    }
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    std::string v35 = v13 + 1;
    char v36 = v13;
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    v33 = v15 + 1;
    v34 = v15;
    v22 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v43);
    v23 = (std::__shared_weak_count *)v22[1];
    uint64_t v31 = *v22;
    v32 = v23;
    if (v23) {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    SCLM::SCLMPrivateInterface::PerformScript((uint64_t)v37, (uint64_t *)&v35, (uint64_t *)&v33, &v31, (uint64_t)&v39);
    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    if (v36) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v36);
    }
    if (SHIBYTE(v38) < 0) {
      operator delete(v37[0]);
    }
    if (v40)
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v45 = *MEMORY[0x263F08320];
      v25 = NSString;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v39.__r_.__value_.__l.__data_, (std::string *)v39.__r_.__value_.__l.__size_, ", ", 2uLL, &v30);
      v26 = [v25 stringWithCXXString:&v30];
      v46 = v26;
      v27 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      v21 = [v24 errorWithDomain:@"SCLM" code:0 userInfo:v27];

      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v30.__r_.__value_.__l.__data_);
      }
      if (v40)
      {
        v30.__r_.__value_.__r.__words[0] = (std::string::size_type)&v39;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F08320];
    v18 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v43[0], v43[1], ", ", 2uLL, &v39);
    v19 = [v18 stringWithCXXString:&v39];
    v48[0] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    v21 = [v17 errorWithDomain:@"SCLM" code:0 userInfo:v20];

    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v43);
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  std::__shared_weak_count::__release_shared[abi:ne180100](v13);

  return v21;
}

+ (id)PerformOnlyScriptInSEFW:(id)a3 seHandle:(id)a4 logSink:(id)a5
{
  v42[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (std::__shared_weak_count *)operator new(0x28uLL);
  v10->__shared_weak_owners_ = 0;
  v10->__shared_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB13E8;
  id v11 = v8;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1420;
  v10[1].__shared_owners_ = (uint64_t)v11;
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  id v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_weak_owners_ = 0;
  v12->__shared_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1448;
  id v13 = v9;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1480;
  v12[1].__shared_owners_ = (uint64_t)v13;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  if (v7)
  {
    [v7 asCXXString];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v36 = 0;
  }
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v37);
  if (SHIBYTE(v36) < 0) {
    operator delete(__p[0]);
  }
  if (v38)
  {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v31 = v10 + 1;
    v32 = v10;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    id v29 = v12 + 1;
    std::string v30 = v12;
    id v14 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v37);
    id v15 = (std::__shared_weak_count *)v14[1];
    uint64_t v27 = *v14;
    std::string v28 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW((uint64_t *)&v31, (uint64_t *)&v29, &v27, (uint64_t)&v33);
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    }
    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    if (v34)
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F08320];
      v17 = NSString;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v33.__r_.__value_.__l.__data_, (std::string *)v33.__r_.__value_.__l.__size_, ", ", 2uLL, &v26);
      v18 = [v17 stringWithCXXString:&v26];
      char v40 = v18;
      v19 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      v20 = [v16 errorWithDomain:@"SCLM" code:0 userInfo:v19];

      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v26.__r_.__value_.__l.__data_);
      }
      if (v34)
      {
        v26.__r_.__value_.__r.__words[0] = (std::string::size_type)&v33;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
      }
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08320];
    v22 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v37[0], v37[1], ", ", 2uLL, &v33);
    v23 = [v22 stringWithCXXString:&v33];
    v42[0] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    v20 = [v21 errorWithDomain:@"SCLM" code:0 userInfo:v24];

    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v37);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);

  return v20;
}

+ (BOOL)InspectSEFW:(id)a3 closure:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v29 = a4;
  if (v7)
  {
    [v7 asCXXString];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v26 = 0;
  }
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v27);
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  if (v28)
  {
    id v8 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v27);
    uint64_t v9 = *v8;
    id v10 = (std::__shared_weak_count *)v8[1];
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v32[0] = &unk_270EB14A8;
    v32[1] = &v29;
    v32[3] = v32;
    SCLM::DefaultSCLMScriptProvider::InspectScriptsWithBlock(v9, (uint64_t)v32, &v23);
    std::__function::__value_func<BOOL ()(ScriptInfo *)>::~__value_func[abi:ne180100](v32);
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    int v11 = v24;
    BOOL v12 = v24 != 0;
    if (a5 && !v24)
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      id v14 = NSString;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v23.__r_.__value_.__l.__data_, (std::string *)v23.__r_.__value_.__l.__size_, ", ", 2uLL, &v22);
      id v15 = [v14 stringWithCXXString:&v22];
      uint64_t v31 = v15;
      id v16 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a5 = [v13 errorWithDomain:@"SCLM" code:0 userInfo:v16];

      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      int v11 = v24;
    }
    if (!v11)
    {
      v22.__r_.__value_.__r.__words[0] = (std::string::size_type)&v23;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    }
  }
  else
  {
    if (a5)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      v18 = NSString;
      ctu::join<std::__wrap_iter<std::string const*>>(v27[0], v27[1], ", ", 2uLL, &v23);
      v19 = [v18 stringWithCXXString:&v23];
      v34[0] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
      *a5 = [v17 errorWithDomain:@"SCLM" code:0 userInfo:v20];

      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v23.__r_.__value_.__l.__data_);
      }
    }
    BOOL v12 = 0;
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v27);

  return v12;
}

+ (void)InspectSEFW:closure:error:
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 8) + 16))(*(void **)(a1 + 8));
}

+ (uint64_t)InspectSEFW:closure:error:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270EB14A8;
  a2[1] = v2;
  return result;
}

@end
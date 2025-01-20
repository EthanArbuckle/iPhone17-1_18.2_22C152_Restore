@interface SLAMObjC
+ (id)PerformRecovery:(id)a3 logSink:(id)a4;
+ (id)PerformScript:(unint64_t)a3 seHandle:(id)a4 logSink:(id)a5;
+ (id)PerformScript:(unint64_t)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6;
+ (id)PerformScriptWithName:(id)a3 seHandle:(id)a4 logSink:(id)a5;
+ (id)PerformScriptWithName:(id)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6;
@end

@implementation SLAMObjC

+ (id)PerformScript:(unint64_t)a3 seHandle:(id)a4 logSink:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = (std::__shared_weak_count *)operator new(0x28uLL);
  v9->__shared_weak_owners_ = 0;
  v9->__shared_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165148;
  id v10 = v7;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165198;
  v9[1].__shared_owners_ = (uint64_t)v10;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  v11 = (std::__shared_weak_count *)operator new(0x28uLL);
  v11->__shared_weak_owners_ = 0;
  v11->__shared_owners_ = 0;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D1651D8;
  id v12 = v8;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165228;
  v11[1].__shared_owners_ = (uint64_t)v12;
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  v22 = v9 + 1;
  v23 = v9;
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  v20 = v11 + 1;
  v21 = v11;
  SLAM::SLAM::PerformScript(a3, (uint64_t *)&v22, (uint64_t *)&v20, (uint64_t)v24);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (v25)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v14 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v24[0], v24[1], ", ", 2uLL, &__p);
    v15 = [v14 stringWithCXXString:&__p];
    v27[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v17 = [v13 errorWithDomain:@"SLAM" code:0 userInfo:v16];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v25)
    {
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v24;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    }
  }
  else
  {
    v17 = 0;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);

  return v17;
}

+ (id)PerformScriptWithName:(id)a3 seHandle:(id)a4 logSink:(id)a5
{
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (std::__shared_weak_count *)operator new(0x28uLL);
  v10->__shared_weak_owners_ = 0;
  v10->__shared_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165148;
  id v11 = v8;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165198;
  v10[1].__shared_owners_ = (uint64_t)v11;
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  id v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_weak_owners_ = 0;
  v12->__shared_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D1651D8;
  id v13 = v9;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165228;
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
    uint64_t v26 = 0;
  }
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  v23 = v10 + 1;
  v24 = v10;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  v21 = v12 + 1;
  v22 = v12;
  SLAM::SLAM::PerformScript((uint64_t)__p, (uint64_t *)&v23, (uint64_t *)&v21, (uint64_t)v27);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  if (v28)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v15 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v27[0], v27[1], ", ", 2uLL, &v20);
    v16 = [v15 stringWithCXXString:&v20];
    v30[0] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v18 = [v14 errorWithDomain:@"SLAM" code:0 userInfo:v17];

    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
    if (v28)
    {
      v20.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
    }
  }
  else
  {
    v18 = 0;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);

  return v18;
}

+ (id)PerformRecovery:(id)a3 logSink:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_weak_owners_ = 0;
  v7->__shared_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165148;
  id v8 = v5;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165198;
  v7[1].__shared_owners_ = (uint64_t)v8;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  id v9 = (std::__shared_weak_count *)operator new(0x28uLL);
  v9->__shared_weak_owners_ = 0;
  v9->__shared_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D1651D8;
  id v10 = v6;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165228;
  v9[1].__shared_owners_ = (uint64_t)v10;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  std::string v20 = v7 + 1;
  v21 = v7;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  v18 = v9 + 1;
  v19 = v9;
  SLAM::SLAM::PerformRecovery((uint64_t *)&v20, (uint64_t *)&v18, (uint64_t)v22);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v23)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    id v12 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v22[0], v22[1], ", ", 2uLL, &__p);
    id v13 = [v12 stringWithCXXString:&__p];
    v25[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v15 = [v11 errorWithDomain:@"SLAM" code:0 userInfo:v14];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v23)
    {
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v22;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    }
  }
  else
  {
    v15 = 0;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  std::__shared_weak_count::__release_shared[abi:ne180100](v7);

  return v15;
}

+ (id)PerformScript:(unint64_t)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6
{
  v45[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_weak_owners_ = 0;
  v12->__shared_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165148;
  id v13 = v10;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165198;
  v12[1].__shared_owners_ = (uint64_t)v13;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  v14 = (std::__shared_weak_count *)operator new(0x28uLL);
  v14->__shared_weak_owners_ = 0;
  v14->__shared_owners_ = 0;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D1651D8;
  id v15 = v11;
  v14[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165228;
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
    uint64_t v39 = 0;
  }
  SLAM::DefaultScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v40);
  if (SHIBYTE(v39) < 0) {
    operator delete(__p[0]);
  }
  if (v41)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    v34 = v12 + 1;
    v35 = v12;
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    v32 = v14 + 1;
    v33 = v14;
    v16 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::value((uint64_t)v40);
    uint64_t v30 = 0;
    v31 = 0;
    uint64_t v17 = *v16;
    v18 = (std::__shared_weak_count *)v16[1];
    if (v18)
    {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v30 = v17;
      v31 = v18;
    }
    else
    {
      uint64_t v30 = *v16;
      v31 = 0;
    }
    SLAM::SLAMPrivateInterface::PerformScript(a3, (uint64_t *)&v34, (uint64_t *)&v32, &v30, (uint64_t)&v36);
    if (v31) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v31);
    }
    if (v33) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v33);
    }
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v35);
    }
    if (v37)
    {
      uint64_t v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F08320];
      char v25 = NSString;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v36.__r_.__value_.__l.__data_, (std::string *)v36.__r_.__value_.__l.__size_, ", ", 2uLL, &v29);
      uint64_t v26 = [v25 stringWithCXXString:&v29];
      v43 = v26;
      v27 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      char v23 = [v24 errorWithDomain:@"SLAM" code:0 userInfo:v27];

      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v29.__r_.__value_.__l.__data_);
      }
      if (v37)
      {
        v29.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
      }
    }
    else
    {
      char v23 = 0;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    std::string v20 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v40[0], v40[1], ", ", 2uLL, &v36);
    v21 = [v20 stringWithCXXString:&v36];
    v45[0] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
    char v23 = [v19 errorWithDomain:@"SLAM" code:0 userInfo:v22];

    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v36.__r_.__value_.__l.__data_);
    }
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::~base((uint64_t)v40);
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);

  return v23;
}

+ (id)PerformScriptWithName:(id)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6
{
  v49[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v30 = v11;
  id v13 = (std::__shared_weak_count *)operator new(0x28uLL);
  v13->__shared_weak_owners_ = 0;
  v13->__shared_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165148;
  id v14 = v11;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165198;
  v13[1].__shared_owners_ = (uint64_t)v14;
  atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  id v15 = (std::__shared_weak_count *)operator new(0x28uLL);
  v15->__shared_weak_owners_ = 0;
  v15->__shared_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D1651D8;
  id v16 = v12;
  v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26D165228;
  v15[1].__shared_owners_ = (uint64_t)v16;
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  if (v10)
  {
    [v10 asCXXString:v30];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v43 = 0;
  }
  SLAM::DefaultScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v44);
  if (SHIBYTE(v43) < 0) {
    operator delete(__p[0]);
  }
  if (v45)
  {
    if (v9)
    {
      [v9 asCXXString];
    }
    else
    {
      v38[0] = 0;
      v38[1] = 0;
      uint64_t v39 = 0;
    }
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    std::string v36 = v13 + 1;
    char v37 = v13;
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    v34 = v15 + 1;
    v35 = v15;
    v22 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::value((uint64_t)v44);
    uint64_t v32 = 0;
    v33 = 0;
    uint64_t v23 = *v22;
    uint64_t v24 = (std::__shared_weak_count *)v22[1];
    if (v24)
    {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v32 = v23;
      v33 = v24;
    }
    else
    {
      uint64_t v32 = *v22;
      v33 = 0;
    }
    SLAM::SLAMPrivateInterface::PerformScript((uint64_t)v38, (uint64_t *)&v36, (uint64_t *)&v34, &v32, (uint64_t)&v40);
    if (v33) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v33);
    }
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v35);
    }
    if (v37) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v37);
    }
    if (SHIBYTE(v39) < 0) {
      operator delete(v38[0]);
    }
    if (v41)
    {
      char v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      uint64_t v26 = NSString;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v40.__r_.__value_.__l.__data_, (std::string *)v40.__r_.__value_.__l.__size_, ", ", 2uLL, &v31);
      v27 = [v26 stringWithCXXString:&v31];
      v47 = v27;
      char v28 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v21 = [v25 errorWithDomain:@"SLAM" code:0 userInfo:v28];

      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      if (v41)
      {
        v31.__r_.__value_.__r.__words[0] = (std::string::size_type)&v40;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v18 = NSString;
    ctu::join<std::__wrap_iter<std::string const*>>(v44[0], v44[1], ", ", 2uLL, &v40);
    v19 = [v18 stringWithCXXString:&v40];
    v49[0] = v19;
    std::string v20 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    v21 = [v17 errorWithDomain:@"SLAM" code:0 userInfo:v20];

    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v40.__r_.__value_.__l.__data_);
    }
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::~base((uint64_t)v44);
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  std::__shared_weak_count::__release_shared[abi:ne180100](v13);

  return v21;
}

@end
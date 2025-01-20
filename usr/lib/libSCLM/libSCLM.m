void SLAM::SLAM::PerformScript(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  void v12[4];
  uint64_t v13[2];
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16[2];

  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v12);
  v8 = v12[0];
  v9 = (std::__shared_weak_count *)v12[1];
  v10 = (std::__shared_weak_count *)a2[1];
  v16[0] = *a2;
  v16[1] = (uint64_t)v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v11 = (std::__shared_weak_count *)a3[1];
  v14 = *a3;
  v15 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v13[0] = v8;
  v13[1] = (uint64_t)v9;
  if (!v8) {
    std::terminate();
  }
  SLAM::SLAMPrivateInterface::PerformScript(a1, v16, &v14, v13, a4);
  if (v9)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

{
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  void v13[4];
  uint64_t v14[2];
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17[2];
  std::string v18;

  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v13);
  v9 = v13[0];
  v8 = (std::__shared_weak_count *)v13[1];
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    v18 = *(std::string *)a1;
  }
  v10 = *a2;
  v11 = (std::__shared_weak_count *)a2[1];
  v17[0] = v10;
  v17[1] = (uint64_t)v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12 = (std::__shared_weak_count *)a3[1];
  v15 = *a3;
  v16 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v8)
  {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v14[0] = v9;
  v14[1] = (uint64_t)v8;
  if (!v9) {
    std::terminate();
  }
  SLAM::SLAMPrivateInterface::PerformScript((uint64_t)&v18, v17, &v15, v14, a4);
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

#error "263813FD4: call analysis failed (funcsize=50)"

void SLAM::SLAMPrivateInterface::PerformScript(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a3, &v26);
  *(unsigned char *)a5 = 0;
  *(unsigned char *)(a5 + 24) = 0;
  v10 = (std::__shared_weak_count *)a2[1];
  uint64_t v24 = *a2;
  v25 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (uint64_t)v26;
  v12 = v27;
  if (v27)
  {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    v23 = v12;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    v23 = 0;
  }
  uint64_t v22 = v11;
  if (!v11) {
    std::terminate();
  }
  v13 = (std::__shared_weak_count *)a4[1];
  uint64_t v20 = *a4;
  v21 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Impl::Impl(__p, &v24, &v22, &v20);
  SLAM::Impl::PerformScript((SLAM::Impl *)__p, &v31);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a5, (uint64_t)&v31);
  if (v32)
  {
    v28 = &v31;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
  }
  SLAM::Impl::~Impl((SLAM::Impl *)__p);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if (*(unsigned char *)(a5 + 24))
  {
    SLAM::Error::Add((std::vector<std::string> *)a5, "While performing script 0x%llx", a1);
    v15 = (void (***)(void, std::string *))*a3;
    v14 = (std::__shared_weak_count *)a3[1];
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a5, *(std::string **)(a5 + 8), ", ", 2uLL, __p);
    (**v15)(v15, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    v16 = v26;
    uint64_t v17 = *a3;
    v18 = (std::__shared_weak_count *)a3[1];
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v29[0] = &unk_270EB11D0;
    v29[1] = v17;
    v29[2] = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v29[3] = v29;
    if (v16[6]) {
      uint64_t v19 = v16[4];
    }
    else {
      uint64_t v19 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v31, (uint64_t)v29);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v16 + 2, v19, 0, (uint64_t)&v31, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v31);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v29);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
}

{
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  void (***v14)(void, std::string *);
  std::__shared_weak_count *v15;
  uint64_t *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::string v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t *v27;
  std::__shared_weak_count *v28;
  std::string *v29;
  void v30[4];
  std::string __p[3];
  std::string v32;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a3, &v27);
  *(unsigned char *)a5 = 0;
  *(unsigned char *)(a5 + 24) = 0;
  v10 = (std::__shared_weak_count *)a2[1];
  v25 = *a2;
  v26 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (uint64_t)v27;
  v12 = v28;
  if (v28)
  {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v24 = v12;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v24 = 0;
  }
  v23 = v11;
  if (!v11) {
    std::terminate();
  }
  v13 = (std::__shared_weak_count *)a4[1];
  v21 = *a4;
  uint64_t v22 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Impl::Impl(__p, &v25, &v23, &v21);
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    uint64_t v20 = *(std::string *)a1;
  }
  SLAM::Impl::PerformScript((SLAM::Impl *)__p, (const char *)&v20, &v32);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a5, (uint64_t)&v32);
  if (v33)
  {
    v29 = &v32;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  SLAM::Impl::~Impl((SLAM::Impl *)__p);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  if (*(unsigned char *)(a5 + 24))
  {
    v14 = (void (***)(void, std::string *))*a3;
    v15 = (std::__shared_weak_count *)a3[1];
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a5, *(std::string **)(a5 + 8), ", ", 2uLL, __p);
    (**v14)(v14, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    v16 = v27;
    uint64_t v17 = *a3;
    v18 = (std::__shared_weak_count *)a3[1];
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v30[0] = &unk_270EB1218;
    v30[1] = v17;
    v30[2] = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v30[3] = v30;
    if (v16[6]) {
      uint64_t v19 = v16[4];
    }
    else {
      uint64_t v19 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v32, (uint64_t)v30);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v16 + 2, v19, 0, (uint64_t)&v32, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v32);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v30);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
}

void sub_2638142E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100]((void *)(v31 - 104));
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&a20);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  if (*(unsigned char *)(v29 + 24))
  {
    a19 = v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

std::vector<std::string> *SLAM::Error::Error(std::vector<std::string> *this, const char *a2, ...)
{
  va_start(va, a2);
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  va_copy(v18, va);
  __v.__first_ = 0;
  vasprintf((char **)&__v, a2, va);
  if (__v.__first_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)__v.__first_);
    free(__v.__first_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  value = this->__end_cap_.__value_;
  std::vector<std::string>::pointer end = this->__end_;
  if (end >= value)
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v7 = v6 + 1;
    if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v9 = v7;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&this->__end_cap_;
    if (v9) {
      v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&this->__end_cap_, v9);
    }
    else {
      v10 = 0;
    }
    uint64_t v11 = v10 + v6;
    __v.__first_ = v10;
    __v.__begin_ = v11;
    __v.__end_cap_.__value_ = &v10[v9];
    long long v12 = *(_OWORD *)__p;
    v11->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
    __p[1] = 0;
    std::string::size_type v17 = 0;
    __p[0] = 0;
    __v.__end_ = v11 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(this, &__v);
    v13 = this->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v14 = SHIBYTE(v17);
    this->__end_ = v13;
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v5 = *(_OWORD *)__p;
    end->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    this->__end_ = end + 1;
  }
  return this;
}

void sub_2638145D0(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__pa);
  }
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

#error "263814800: call analysis failed (funcsize=40)"

#error "263814C58: call analysis failed (funcsize=55)"

void SLAM::SLAM::PerformRecovery(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v10);
  uint64_t v6 = v10[0];
  unint64_t v7 = (std::__shared_weak_count *)v10[1];
  unint64_t v8 = (std::__shared_weak_count *)a1[1];
  v14[0] = *a1;
  v14[1] = (uint64_t)v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v9 = (std::__shared_weak_count *)a2[1];
  uint64_t v12 = *a2;
  v13 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v11[0] = v6;
  v11[1] = (uint64_t)v7;
  if (!v6) {
    std::terminate();
  }
  SLAM::SLAMPrivateInterface::PerformRecovery(v14, &v12, v11, a3);
  if (v7)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

#error "263814E38: call analysis failed (funcsize=50)"

void SLAM::SLAMPrivateInterface::PerformRecovery(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a2, &v24);
  *(unsigned char *)a4 = 0;
  *(unsigned char *)(a4 + 24) = 0;
  unint64_t v8 = (std::__shared_weak_count *)a1[1];
  uint64_t v22 = *a1;
  v23 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = (uint64_t)v24;
  v10 = v25;
  if (v25)
  {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    v21 = v10;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    v21 = 0;
  }
  uint64_t v20 = v9;
  if (!v9) {
    std::terminate();
  }
  uint64_t v11 = (std::__shared_weak_count *)a3[1];
  uint64_t v18 = *a3;
  uint64_t v19 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Impl::Impl(__p, &v22, &v20, &v18);
  SLAM::Impl::PerformRecovery((SLAM::Impl *)__p, &v29);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a4, (uint64_t)&v29);
  if (v30)
  {
    v26 = &v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
  }
  SLAM::Impl::~Impl((SLAM::Impl *)__p);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (*(unsigned char *)(a4 + 24))
  {
    SLAM::Error::Add((std::vector<std::string> *)a4, "While performing recovery");
    uint64_t v12 = (void (***)(void, std::string *))*a2;
    v13 = (std::__shared_weak_count *)a2[1];
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a4, *(std::string **)(a4 + 8), ", ", 2uLL, __p);
    (**v12)(v12, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    int v14 = v24;
    uint64_t v15 = *a2;
    v16 = (std::__shared_weak_count *)a2[1];
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v27[0] = &unk_270EB1260;
    v27[1] = v15;
    v27[2] = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v27[3] = v27;
    if (v14[6]) {
      uint64_t v17 = v14[4];
    }
    else {
      uint64_t v17 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v29, (uint64_t)v27);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v14 + 2, v17, 0, (uint64_t)&v29, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v29);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v27);
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
}

void sub_26381512C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100]((void *)(v31 - 88));
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&a20);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  if (*(unsigned char *)(v29 + 24))
  {
    a19 = v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformScript@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 6);
  long long v5 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(long long **__return_ptr))(*(void *)v4 + 8))(&v12);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (v14)
  {
    SLAM::Impl::QueryMigrationInfo(this, (uint64_t)&v9);
    if (v11)
    {
      uint64_t v6 = caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v12);
      uint64_t v7 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v9);
      (*(void (**)(SLAM::Impl *, uint64_t, uint64_t))(*(void *)this + 16))(this, v6, v7);
    }
    else
    {
      a2->__r_.__value_.__r.__words[0] = 0;
      a2->__r_.__value_.__l.__size_ = 0;
      a2->__r_.__value_.__r.__words[2] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, v9, v10, 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)v9) >> 3));
      a2[1].__r_.__value_.__s.__data_[0] = 1;
    }
    caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v9);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, v12, v13, 0xAAAAAAAAAAAAAAABLL * (((char *)v13 - (char *)v12) >> 3));
    a2[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&v12);
}

void sub_26381542C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

std::vector<std::string> *std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>(std::vector<std::string> *this, std::vector<std::string> *a2)
{
  if (LOBYTE(this[1].__begin_))
  {
    std::vector<std::string>::__vdeallocate(this);
    *(_OWORD *)&this->__begin_ = *(_OWORD *)&a2->__begin_;
    this->__end_cap_.__value_ = a2->__end_cap_.__value_;
    a2->__begin_ = 0;
    a2->__end_ = 0;
    a2->__end_cap_.__value_ = 0;
  }
  else
  {
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
    *this = *a2;
    a2->__begin_ = 0;
    a2->__end_ = 0;
    a2->__end_cap_.__value_ = 0;
    LOBYTE(this[1].__begin_) = 1;
  }
  return this;
}

std::vector<std::string> *SLAM::Error::Add(std::vector<std::string> *this, const char *a2, ...)
{
  va_start(va, a2);
  va_copy(v18, va);
  __v.__first_ = 0;
  vasprintf((char **)&__v, a2, va);
  if (__v.__first_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)__v.__first_);
    free(__v.__first_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  value = this->__end_cap_.__value_;
  std::vector<std::string>::pointer end = this->__end_;
  if (end >= value)
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v7 = v6 + 1;
    if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v9 = v7;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&this->__end_cap_;
    if (v9) {
      v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&this->__end_cap_, v9);
    }
    else {
      v10 = 0;
    }
    char v11 = v10 + v6;
    __v.__first_ = v10;
    __v.__begin_ = v11;
    __v.__end_cap_.__value_ = &v10[v9];
    long long v12 = *(_OWORD *)__p;
    v11->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
    __p[1] = 0;
    std::string::size_type v17 = 0;
    __p[0] = 0;
    __v.__end_ = v11 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(this, &__v);
    v13 = this->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v14 = SHIBYTE(v17);
    this->__end_ = v13;
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v5 = *(_OWORD *)__p;
    end->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    this->__end_ = end + 1;
  }
  return this;
}

void sub_263815658(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__pa);
  }
  _Unwind_Resume(a1);
}

void SLAM::Impl::PerformScript(SLAM::Impl *a1@<X0>, const char *a2@<X1>, std::string *a3@<X8>)
{
  void (***v10)(void ***__return_ptr, void, std::string *, void **, uint64_t);
  std::__shared_weak_count *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17[2];
  char v18;
  std::string v19;
  void *__p;
  void *v21;
  uint64_t v22;
  std::string v23;
  void *v24;
  unsigned char *v25;
  uint64_t v26;
  long long *v27;
  long long *v28;
  char v29;
  void **v30;
  long long *v31;
  char v32;
  long long *v33;
  long long *v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x263EF8340];
  SLAM::Impl::GetChipId(a1, (uint64_t)&v27);
  if (!v29)
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, v27, v28, 0xAAAAAAAAAAAAAAABLL * (((char *)v28 - (char *)v27) >> 3));
    a3[1].__r_.__value_.__s.__data_[0] = 1;
    goto LABEL_42;
  }
  unsigned int v6 = *(unsigned __int8 *)caulk::expected<unsigned char,SLAM::Error>::value((uint64_t)&v27);
  uint64_t v7 = 1;
  if (v6 > 0xC7)
  {
    if (v6 == 200 || v6 == 210) {
      goto LABEL_10;
    }
  }
  else if (v6 == 100 || v6 == 115)
  {
    goto LABEL_10;
  }
  uint64_t v7 = 2;
LABEL_10:
  SLAM::Impl::QueryMigrationInfo(a1, (uint64_t)&v33);
  if (v35)
  {
    uint64_t v8 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v33);
    uint64_t v24 = 0;
    v25 = 0;
    v26 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v24, *(const void **)(v8 + 16), *(void *)(v8 + 24), *(void *)(v8 + 24) - *(void *)(v8 + 16));
    v10 = (void (***)(void ***__return_ptr, void, std::string *, void **, uint64_t))*((void *)a1 + 6);
    unint64_t v9 = (std::__shared_weak_count *)*((void *)a1 + 7);
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (a2[23] < 0) {
      std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    }
    else {
      v23 = *(std::string *)a2;
    }
    __p = 0;
    v21 = 0;
    uint64_t v22 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v24, (uint64_t)v25, v25 - (unsigned char *)v24);
    (**v10)(&v30, v10, &v23, &__p, v7);
    if (__p)
    {
      v21 = __p;
      operator delete(__p);
    }
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    if (v32)
    {
      long long v12 = *((void *)a1 + 8);
      char v11 = (std::__shared_weak_count *)*((void *)a1 + 9);
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (a2[23] < 0) {
        a2 = *(const char **)a2;
      }
      v13 = (void *)caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v30);
      SLAM::Logger::Log(v12, 1, (uint64_t)"PerformScript", 179, "Executing script %s ID 0x%llX", a2, *v13);
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
      int v14 = caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v30);
      uint64_t v15 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v33);
      (*(void (**)(SLAM::Impl *, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, v14, v15);
    }
    else
    {
      memset(&v19, 0, sizeof(v19));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v19, (long long *)v30, v31, 0xAAAAAAAAAAAAAAABLL * (((char *)v31 - (char *)v30) >> 3));
      if (a2[23] < 0) {
        a2 = *(const char **)a2;
      }
      ctu::hex();
      if (v18 >= 0) {
        v16 = v17;
      }
      else {
        v16 = (void **)v17[0];
      }
      SLAM::Error::Add((std::vector<std::string> *)&v19, "with name %s, pkHash %s, platformCategory %d", a2, (const char *)v16, v7);
      if (v18 < 0) {
        operator delete(v17[0]);
      }
      *a3 = v19;
      memset(&v19, 0, sizeof(v19));
      a3[1].__r_.__value_.__s.__data_[0] = 1;
      v17[0] = &v19;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v17);
    }
    caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&v30);
    if (v24)
    {
      v25 = v24;
      operator delete(v24);
    }
  }
  else
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, v33, v34, 0xAAAAAAAAAAAAAAABLL * (((char *)v34 - (char *)v33) >> 3));
    a3[1].__r_.__value_.__s.__data_[0] = 1;
  }
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v33);
LABEL_42:
  if (!v29)
  {
    char v30 = (void **)&v27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v30);
  }
}

void sub_263815A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,char a36,char *a37)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  __p = &a18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&a37);
  if (a30)
  {
    a31 = (uint64_t)a30;
    operator delete(a30);
  }
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base(v37 - 128);
  if (!a36)
  {
    a37 = &a33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a37);
  }
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformRecovery@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  SLAM::Impl::QueryMigrationInfo(this, (uint64_t)&v7);
  if (v9)
  {
    v5[0] = this;
    v5[1] = this;
    if (v8 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    unsigned int v6 = v5;
    ((void (*)(void **, long long **))off_270EB1128[v8])(&v6, &v7);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, v7, v8, 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)v7) >> 3));
    a2[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v7);
}

void sub_263815C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::QueryMigrationInfo@<X0>(SLAM::Impl *this@<X0>, uint64_t a2@<X8>)
{
  void (***v3)(long long *__return_ptr);
  char *v4;
  unsigned char *v5;
  unint64_t *v6;
  void *v7;
  unint64_t *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  const void *v17;
  long long v18;
  std::string::size_type v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  BOOL v34;
  void *v35;
  unsigned int v36;
  long long **v37;
  long long **v38;
  long long **v39;
  long long **v40;
  long long **v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  BOOL v57;
  void *v58;
  unsigned int v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  BOOL v68;
  void *v69;
  std::string v70;
  std::string v71;
  char v72;
  std::string __p;
  char v74;
  std::vector<std::string> v75;
  char v76;
  std::string *v77;
  std::string v78;
  std::string v79;
  char v80;
  uint64_t v81;

  v81 = *MEMORY[0x263EF8340];
  v3 = (void (***)(long long *__return_ptr))((char *)this + 8);
  uint64_t v4 = (char *)operator new(0xEuLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v4 + 14);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v4 + 14);
  *(void *)uint64_t v4 = 0xA0080004A400;
  *((_WORD *)v4 + 4) = 20737;
  *(_DWORD *)(v4 + 10) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v4;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v75);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v76)
  {
    caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
    long long v5 = operator new(5uLL);
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v5 + 5);
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v5 + 5);
    *(_DWORD *)long long v5 = 240256;
    v5[4] = 0;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
    SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v75);
    if (__p.__r_.__value_.__r.__words[0])
    {
      __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v76)
    {
      unsigned int v6 = (unint64_t *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v75);
      v79.__r_.__value_.__r.__words[0] = 0xC000000000000000;
      SLAM::DERParseSequenceToMap(v6, (uint64_t *)&v79, 1, (uint64_t)&__p);
      if (!v74)
      {
        v39 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&__p, "While parsing migration state");
        memset(&v79, 0, sizeof(v79));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v79, *v39, v39[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v39[1] - (char *)*v39) >> 3));
        SLAM::Error::Unexpected((long long **)&v79, &v71);
        *(std::string *)a2 = v71;
        memset(&v71, 0, sizeof(v71));
        *(unsigned char *)(a2 + 48) = 0;
        v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v71;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
        v71.__r_.__value_.__r.__words[0] = (std::string::size_type)&v79;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v71);
LABEL_60:
        caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&__p);
        return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
      }
      uint64_t v7 = operator new(8uLL);
      v71.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
      *uint64_t v7 = 0x53DF02FE00CA80;
      v71.__r_.__value_.__l.__size_ = (std::string::size_type)(v7 + 1);
      v71.__r_.__value_.__r.__words[2] = (std::string::size_type)(v7 + 1);
      SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v79);
      if (v71.__r_.__value_.__r.__words[0])
      {
        v71.__r_.__value_.__l.__size_ = v71.__r_.__value_.__r.__words[0];
        operator delete(v71.__r_.__value_.__l.__data_);
      }
      if (!v80)
      {
        v40 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&v79, "While querying SLAM state");
        SLAM::Error::Unexpected(v40, &v71);
        *(std::string *)a2 = v71;
        memset(&v71, 0, sizeof(v71));
        *(unsigned char *)(a2 + 48) = 0;
        v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v71;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
LABEL_59:
        caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v79);
        goto LABEL_60;
      }
      uint64_t v8 = (unint64_t *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v79);
      *(_OWORD *)&v78.__r_.__value_.__l.__data_ = xmmword_263824850;
      SLAM::DERParseSequenceToMap(v8, (uint64_t *)&v78, 2, (uint64_t)&v71);
      if (v72)
      {
        char v9 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
        long long v12 = *(void **)(v9 + 8);
        uint64_t v10 = (void *)(v9 + 8);
        char v11 = v12;
        if (v12)
        {
          v13 = v10;
          do
          {
            int v14 = v11[4];
            uint64_t v15 = v14 >= 0x8000000000000003;
            if (v14 >= 0x8000000000000003) {
              v16 = v11;
            }
            else {
              v16 = v11 + 1;
            }
            if (v15) {
              v13 = v11;
            }
            char v11 = (void *)*v16;
          }
          while (*v16);
          if (v13 != v10 && v13[4] <= 0x8000000000000003 && v13[6] == 32)
          {
            std::string::size_type v17 = (const void *)v13[5];
            memset(&v78, 0, sizeof(v78));
            std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v78, v17, (uint64_t)v17 + 32, 0x20uLL);
            va_list v18 = *(_OWORD *)&v78.__r_.__value_.__l.__data_;
            uint64_t v19 = v78.__r_.__value_.__r.__words[2];
            uint64_t v20 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
            v23 = *(void **)(v20 + 8);
            v21 = v20 + 8;
            uint64_t v22 = v23;
            if (!v23) {
              goto LABEL_62;
            }
            uint64_t v24 = (void *)v21;
            do
            {
              v25 = v22[4];
              v26 = v25 < 0;
              if (v25 < 0) {
                v27 = v22;
              }
              else {
                v27 = v22 + 1;
              }
              if (v26) {
                uint64_t v24 = v22;
              }
              uint64_t v22 = (void *)*v27;
            }
            while (*v27);
            if (v24 == (void *)v21 || v24[4] > 0x8000000000000000 || v24[6] != 1)
            {
LABEL_62:
              SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000000);
              goto LABEL_63;
            }
            if (*(unsigned __int8 *)v24[5] < 2u)
            {
              v36 = 0;
            }
            else
            {
              v28 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
              uint64_t v31 = *(void **)(v28 + 8);
              uint64_t v29 = v28 + 8;
              char v30 = v31;
              if (!v31) {
                goto LABEL_82;
              }
              char v32 = (void *)v29;
              do
              {
                uint64_t v33 = v30[4];
                v34 = v33 >= 0x8000000000000004;
                if (v33 >= 0x8000000000000004) {
                  v35 = v30;
                }
                else {
                  v35 = v30 + 1;
                }
                if (v34) {
                  char v32 = v30;
                }
                char v30 = (void *)*v35;
              }
              while (*v35);
              if (v32 == (void *)v29 || v32[4] > 0x8000000000000004 || v32[6] != 2)
              {
LABEL_82:
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000004);
                goto LABEL_63;
              }
              v36 = bswap32(*(unsigned __int16 *)v32[5]) >> 16;
            }
            v43 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&__p);
            v46 = *(void **)(v43 + 8);
            v44 = v43 + 8;
            v45 = v46;
            if (!v46) {
              goto LABEL_81;
            }
            v47 = (void *)v44;
            do
            {
              v48 = v45[4];
              v49 = v48 >= 0xC000000000000009;
              if (v48 >= 0xC000000000000009) {
                v50 = v45;
              }
              else {
                v50 = v45 + 1;
              }
              if (v49) {
                v47 = v45;
              }
              v45 = (void *)*v50;
            }
            while (*v50);
            if (v47 != (void *)v44 && v47[4] <= 0xC000000000000009 && v47[6] == 2)
            {
              if (*(_WORD *)v47[5] == 23130)
              {
                *(void *)a2 = 0;
                *(void *)(a2 + 8) = 1;
LABEL_80:
                *(_OWORD *)(a2 + 16) = v18;
                *(void *)(a2 + 32) = v19;
                *(_DWORD *)(a2 + 40) = v36;
                *(unsigned char *)(a2 + 48) = 1;
                goto LABEL_58;
              }
              v51 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&__p);
              v54 = *(void **)(v51 + 8);
              v52 = v51 + 8;
              v53 = v54;
              if (!v54) {
                goto LABEL_99;
              }
              v55 = (void *)v52;
              do
              {
                v56 = v53[4];
                v57 = v56 >= 0xC00000000000000BLL;
                if (v56 >= 0xC00000000000000BLL) {
                  v58 = v53;
                }
                else {
                  v58 = v53 + 1;
                }
                if (v57) {
                  v55 = v53;
                }
                v53 = (void *)*v58;
              }
              while (*v58);
              if (v55 != (void *)v52 && v55[4] <= 0xC00000000000000BLL && v55[6] == 2)
              {
                v59 = bswap32(*(unsigned __int16 *)v55[5]) >> 16;
                if (v59 != 13260)
                {
                  if (v59 == 52275)
                  {
                    v60 = 0;
                    v61 = 3;
                  }
                  else if (v59 == 42405)
                  {
                    v60 = 0;
                    v61 = 2;
                  }
                  else
                  {
                    v61 = 0;
                    v60 = 0;
                  }
                  goto LABEL_115;
                }
                v62 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
                v65 = *(void **)(v62 + 8);
                v63 = v62 + 8;
                v64 = v65;
                if (v65)
                {
                  v66 = (void *)v63;
                  do
                  {
                    v67 = v64[4];
                    v68 = v67 >= 0x8000000000000002;
                    if (v67 >= 0x8000000000000002) {
                      v69 = v64;
                    }
                    else {
                      v69 = v64 + 1;
                    }
                    if (v68) {
                      v66 = v64;
                    }
                    v64 = (void *)*v69;
                  }
                  while (*v69);
                  if (v66 != (void *)v63 && v66[4] <= 0x8000000000000002 && v66[6] == 8)
                  {
                    v60 = bswap64(*(void *)v66[5]);
                    v61 = 4;
LABEL_115:
                    *(void *)a2 = v60;
                    *(_DWORD *)(a2 + 8) = v61;
                    *(_DWORD *)(a2 + 12) = 0;
                    goto LABEL_80;
                  }
                }
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000002);
              }
              else
              {
LABEL_99:
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0xC00000000000000BLL);
              }
            }
            else
            {
LABEL_81:
              SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0xC000000000000009);
            }
LABEL_63:
            *(std::string *)a2 = v78;
            memset(&v78, 0, sizeof(v78));
            *(unsigned char *)(a2 + 48) = 0;
            v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v78;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
            if ((void)v18) {
              operator delete((void *)v18);
            }
            goto LABEL_58;
          }
        }
        SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000003);
        *(std::string *)a2 = v78;
        memset(&v78, 0, sizeof(v78));
        *(unsigned char *)(a2 + 48) = 0;
      }
      else
      {
        v41 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&v71, "While parsing the respons from SLAM state");
        memset(&v78, 0, sizeof(v78));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v78, *v41, v41[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v41[1] - (char *)*v41) >> 3));
        SLAM::Error::Unexpected((long long **)&v78, &v70);
        *(std::string *)a2 = v70;
        memset(&v70, 0, sizeof(v70));
        *(unsigned char *)(a2 + 48) = 0;
        v77 = &v70;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v77);
      }
      v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v78;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
LABEL_58:
      caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&v71);
      goto LABEL_59;
    }
    v38 = (long long **)SLAM::Error::Add(&v75, "While querying migration state");
    SLAM::Error::Unexpected(v38, &__p);
  }
  else
  {
    uint64_t v37 = (long long **)SLAM::Error::Add(&v75, "While selecting ISD");
    SLAM::Error::Unexpected(v37, &__p);
  }
  *(std::string *)a2 = __p;
  memset(&__p, 0, sizeof(__p));
  *(unsigned char *)(a2 + 48) = 0;
  v79.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v79);
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
}

void sub_2638163E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (v24) {
    operator delete(v24);
  }
  caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&__p);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v25 - 88);
  caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&a19);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a24);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<SLAM::Script,SLAM::Error>::value(uint64_t result)
{
  v1 = (long long **)result;
  if (!*(unsigned char *)(result + 72))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_263816590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value(uint64_t result)
{
  v1 = (long long **)result;
  if (!*(unsigned char *)(result + 48))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_263816674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::GetChipId@<X0>(SLAM::Impl *this@<X0>, uint64_t a2@<X8>)
{
  void (***v4)(long long *__return_ptr);
  char *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  long long **v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  char v12;
  long long v14;
  uint64_t v15;
  void v16[2];
  void *p_p;
  unsigned char *v18;
  unint64_t v19;
  std::string __p;
  char v21;
  std::vector<std::string> v22;
  char v23;
  void **v24;

  uint64_t v4 = (void (***)(long long *__return_ptr))((char *)this + 8);
  long long v5 = (char *)operator new(0xEuLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v5 + 14);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v5 + 14);
  *(void *)long long v5 = 0xA0080004A400;
  *((_WORD *)v5 + 4) = 20737;
  *(_DWORD *)(v5 + 10) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v4, (uint64_t)&v22);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v23)
  {
    unsigned int v6 = (char *)operator new(5uLL);
    va_list v18 = v6 + 5;
    uint64_t v19 = (unint64_t)(v6 + 5);
    *(_DWORD *)unsigned int v6 = 2141178496;
    v6[4] = 0;
    p_p = v6;
    SLAM::TransceiverWrapper::TransceiveAndCheckSW(v4, (uint64_t)&__p);
    if (p_p)
    {
      va_list v18 = p_p;
      operator delete(p_p);
    }
    if (v21)
    {
      p_p = 0;
      va_list v18 = 0;
      uint64_t v19 = 0;
      v16[0] = *(void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&__p);
      uint64_t v7 = (void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&__p);
      v16[1] = v7[1] - *v7;
      uint64_t v8 = DERDecodeItem((uint64_t)v16, (unint64_t *)&p_p);
      if (v8)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode CPLC data top level tag %d", (uint64_t)&v14, v8);
LABEL_20:
        *(_OWORD *)a2 = v14;
        *(void *)(a2 + 16) = v15;
        uint64_t v15 = 0;
        int v14 = 0uLL;
        *(unsigned char *)(a2 + 24) = 0;
        uint64_t v24 = (void **)&v14;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v24);
        goto LABEL_21;
      }
      if (p_p != (void *)0x800000000000007FLL)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Unexpected CPLC data top level tag %llu", (uint64_t)&v14, p_p);
        goto LABEL_20;
      }
      if (v19 <= 3)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Unexpected length for CPLC data %zu", (uint64_t)&v14, v19);
        goto LABEL_20;
      }
      long long v12 = v18[3];
    }
    else
    {
      uint64_t v10 = *((void *)this + 8);
      char v11 = (std::__shared_weak_count *)*((void *)this + 9);
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      SLAM::Logger::Log(v10, 1, (uint64_t)"GetChipId", 477, "Failed to read CPLC data; defaulting to SN210V");
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
      long long v12 = -46;
    }
    *(unsigned char *)a2 = v12;
    *(unsigned char *)(a2 + 24) = 1;
LABEL_21:
    caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&__p);
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v22);
  }
  char v9 = (long long **)SLAM::Error::Add(&v22, "Failed to select ISD");
  SLAM::Error::Unexpected(v9, &__p);
  *(std::string *)a2 = __p;
  memset(&__p, 0, sizeof(__p));
  *(unsigned char *)(a2 + 24) = 0;
  p_p = &__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v22);
}

void sub_263816910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19)
{
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a19);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v19 - 72);
  _Unwind_Resume(a1);
}

void sub_263816974(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  JUMPOUT(0x26381696CLL);
}

uint64_t caulk::expected<unsigned char,SLAM::Error>::value(uint64_t result)
{
  v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_263816A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SLAM::Logger::Log(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char *a5, ...)
{
  va_start(va, a5);
  va_copy(v15, va);
  __s.__r_.__value_.__r.__words[0] = 0;
  vasprintf(&__s.__r_.__value_.__l.__data_, a5, va);
  if (__s.__r_.__value_.__r.__words[0])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, __s.__r_.__value_.__l.__data_);
    free(__s.__r_.__value_.__l.__data_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  char v9 = __p;
  if (v14 < 0) {
    char v9 = (void **)__p[0];
  }
  SLAM::StringUtil::Format((SLAM::StringUtil *)"%s/%d : %s", &__s, a3, a4, v9);
  boost::circular_buffer<std::string,std::allocator<std::string>>::push_back_impl<std::string const&>(a1 + 16, &__s);
  if (a2 == 1)
  {
    uint64_t v10 = *(void (****)(void, std::string *))a1;
    char v11 = *(std::__shared_weak_count **)(a1 + 8);
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (**v10)(v10, &__s);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

void sub_263816B9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

void SLAM::Impl::PerformScript(std::string::size_type a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  std::string::size_type v5 = *a2;
  v18.__r_.__value_.__r.__words[0] = a1;
  v18.__r_.__value_.__l.__size_ = a1;
  v18.__r_.__value_.__r.__words[2] = v5;
  uint64_t v6 = *(unsigned int *)(a3 + 8);
  if (v6 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v22[0] = &v18;
  ((void (*)(long long *__return_ptr, void **, uint64_t))off_270EB1100[v6])(&v24, v22, a3);
  if (v26)
  {
    *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v24;
    a4->__r_.__value_.__r.__words[2] = v25;
    std::string::size_type v25 = 0;
    long long v24 = 0uLL;
    a4[1].__r_.__value_.__s.__data_[0] = 1;
  }
  else
  {
    uint64_t v10 = *(const void **)(a3 + 16);
    size_t v11 = *(void *)(a3 + 24) - (void)v10;
    long long v12 = (const void *)a2[1];
    if (v11 == a2[2] - (void)v12 && !memcmp(v10, v12, v11))
    {
      SLAM::Impl::ExecuteScript(a1, a2 + 5, &v18);
      if (v19)
      {
        std::string::size_type v17 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&v18, "While executing script 0x%llx", v5);
        a4->__r_.__value_.__r.__words[0] = 0;
        a4->__r_.__value_.__l.__size_ = 0;
        a4->__r_.__value_.__r.__words[2] = 0;
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a4, *v17, v17[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v17[1] - (char *)*v17) >> 3));
        a4[1].__r_.__value_.__s.__data_[0] = 1;
        if (v19)
        {
          v22[0] = &v18;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v22);
        }
      }
      else
      {
        a4->__r_.__value_.__s.__data_[0] = 0;
        a4[1].__r_.__value_.__s.__data_[0] = 0;
      }
    }
    else
    {
      ctu::hex();
      int v13 = v23;
      char v14 = (void **)v22[0];
      ctu::hex();
      va_list v15 = v22;
      if (v13 < 0) {
        va_list v15 = v14;
      }
      if (v21 >= 0) {
        p_p = (const char *)&__p;
      }
      else {
        p_p = (const char *)__p;
      }
      SLAM::Error::Error((std::vector<std::string> *)&v18, "Mismatched signing keys device %s script %s", (const char *)v15, p_p);
      *a4 = v18;
      memset(&v18, 0, sizeof(v18));
      a4[1].__r_.__value_.__s.__data_[0] = 1;
      v27 = &v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
      if (v21 < 0) {
        operator delete(__p);
      }
      if (v23 < 0) {
        operator delete(v22[0]);
      }
    }
  }
  if (v26)
  {
    v18.__r_.__value_.__r.__words[0] = (std::string::size_type)&v24;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
}

void sub_263816DF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a30)
  {
    a11 = &a27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLAM::Impl::ExecuteScript@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (v5 != *a2)
  {
    uint64_t v7 = result;
    LODWORD(v8) = 0;
    unint64_t v9 = (v5 - *a2) >> 3;
    uint64_t v10 = (void *)(result + 8);
    do
    {
      int v11 = 0;
      while (1)
      {
        SLAM::TransceiverWrapper::Transceive(v10, v4, (uint64_t)&v21);
        if (!v22)
        {
          char v19 = (long long **)SLAM::Error::Add(&v21, "While executing APDU %d", v11);
          a3->__r_.__value_.__r.__words[0] = 0;
          a3->__r_.__value_.__l.__size_ = 0;
          a3->__r_.__value_.__r.__words[2] = 0;
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, *v19, v19[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v19[1] - (char *)*v19) >> 3));
          a3[1].__r_.__value_.__s.__data_[0] = 1;
          return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
        }
        long long v12 = (void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v21);
        uint64_t v13 = v12[1];
        if ((unint64_t)(v13 - *v12) < 2)
        {
          unsigned int v15 = 49068;
LABEL_23:
          SLAM::Error::Error(&__p, "Failed SW 0x%hX at idx %d", v15, v11);
          *(std::vector<std::string> *)a3 = __p;
          memset(&__p, 0, sizeof(__p));
          a3[1].__r_.__value_.__s.__data_[0] = 1;
          p_p = &__p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
          return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
        }
        unsigned int v14 = *(unsigned __int16 *)(v13 - 2);
        unsigned int v15 = __rev16(v14);
        if ((v15 & 0xFFF0) == 0x63C0)
        {
          unint64_t v8 = (v8 + 1);
          if (v9 > v8) {
            break;
          }
        }
        if (v14 != 144) {
          goto LABEL_23;
        }
        result = caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
        v4 += 24;
        ++v11;
        if (v4 == v5) {
          goto LABEL_20;
        }
      }
      uint64_t v17 = *(void *)(v7 + 64);
      v16 = *(std::__shared_weak_count **)(v7 + 72);
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v21);
      ctu::hex();
      std::vector<std::string>::pointer begin = (std::vector<std::string>::pointer)&__p;
      if (SHIBYTE(__p.__end_cap_.__value_) < 0) {
        std::vector<std::string>::pointer begin = __p.__begin_;
      }
      SLAM::Logger::Log(v17, 1, (uint64_t)"ExecuteScript", 292, "Warning APDU: %s idx %d replaying %d", (const char *)begin, v11, v8);
      if (SHIBYTE(__p.__end_cap_.__value_) < 0) {
        operator delete(__p.__begin_);
      }
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      }
      result = caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
      uint64_t v4 = *a2;
      uint64_t v5 = a2[1];
    }
    while (*a2 != v5);
  }
LABEL_20:
  a3->__r_.__value_.__s.__data_[0] = 0;
  a3[1].__r_.__value_.__s.__data_[0] = 0;
  return result;
}

void sub_263817088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void SLAM::TransceiverWrapper::Transceive(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = a1[3];
  uint64_t v6 = (std::__shared_weak_count *)a1[4];
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::hex();
  if (v15 >= 0) {
    unint64_t v8 = __p;
  }
  else {
    unint64_t v8 = (void **)__p[0];
  }
  SLAM::Logger::Log(v7, 0, (uint64_t)"Transceive", 49, "> %s", (const char *)v8);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  unint64_t v9 = (void (***)(void, uint64_t))a1[1];
  uint64_t v10 = (std::__shared_weak_count *)a1[2];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v9)(v9, a2);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (*(unsigned char *)(a3 + 24))
  {
    uint64_t v12 = a1[3];
    int v11 = (std::__shared_weak_count *)a1[4];
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    caulk::expected<std::vector<unsigned char>,SLAM::Error>::value(a3);
    ctu::hex();
    if (v15 >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = (void **)__p[0];
    }
    SLAM::Logger::Log(v12, 0, (uint64_t)"Transceive", 54, "< %s", (const char *)v13);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_263817250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v15);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<std::vector<unsigned char>,SLAM::Error>::value(uint64_t result)
{
  v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_26381735C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformTermination@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  void (***v3)(long long *__return_ptr);
  char v4;
  long long **v5;
  _DWORD *__p;
  std::vector<std::string> v8;
  char v9;

  std::string v3 = (void (***)(long long *__return_ptr))((char *)this + 8);
  std::vector<std::string> __p = operator new(4uLL);
  void *__p = 371328;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v8);
  if (__p) {
    operator delete(__p);
  }
  if (v9)
  {
    uint64_t v4 = 0;
    a2->__r_.__value_.__s.__data_[0] = 0;
  }
  else
  {
    uint64_t v5 = (long long **)SLAM::Error::Add(&v8, "While terminating");
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *v5, v5[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v5[1] - (char *)*v5) >> 3));
    uint64_t v4 = 1;
  }
  a2[1].__r_.__value_.__s.__data_[0] = v4;
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v8);
}

void sub_263817460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
}

uint64_t SLAM::TransceiverWrapper::TransceiveAndCheckSW@<X0>(void (***a1)(long long *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  (**a1)(&v12);
  if (!v14)
  {
    *(unsigned char *)(a2 + 24) = 0;
    *(_OWORD *)a2 = v12;
    *(void *)(a2 + 16) = v13;
    long long v12 = 0uLL;
    uint64_t v13 = 0;
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
  }
  std::string v3 = (void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v12);
  uint64_t v4 = v3[1];
  if ((unint64_t)(v4 - *v3) < 2)
  {
    unsigned int v7 = 49068;
LABEL_9:
    SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SW 0x%hX", (uint64_t)&v10, v7);
    *(_OWORD *)a2 = v10;
    *(void *)(a2 + 16) = v11;
    uint64_t v11 = 0;
    long long v10 = 0uLL;
    *(unsigned char *)(a2 + 24) = 0;
    uint64_t v15 = (void **)&v10;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v15);
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
  }
  unsigned int v5 = *(unsigned __int16 *)(v4 - 2);
  if (v5 != 144)
  {
    unsigned int v7 = __rev16(v5);
    goto LABEL_9;
  }
  uint64_t v6 = v12;
  if (*((void *)&v12 + 1) - (void)v12 > 1uLL)
  {
    *((void *)&v12 + 1) -= 2;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&v12, 0xFFFFFFFFFFFFFFFELL);
    uint64_t v6 = v12;
  }
  *(unsigned char *)(a2 + 24) = v14;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = v6;
  uint64_t v8 = v13;
  *(void *)(a2 + 8) = *((void *)&v12 + 1);
  *(void *)(a2 + 16) = v8;
  uint64_t v13 = 0;
  long long v12 = 0uLL;
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
}

void sub_2638175D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

void SLAM::Error::Unexpected(long long **this@<X0>, std::string *a2@<X8>)
{
  memset(&v4, 0, sizeof(v4));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v4, *this, this[1], 0xAAAAAAAAAAAAAAABLL * (((char *)this[1] - (char *)*this) >> 3));
  *a2 = v4;
  memset(&v4, 0, sizeof(v4));
  unsigned int v5 = &v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void SLAM::DERParseSequenceToMap(unint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = a1[1] - *a1;
  v20[0] = *a1;
  v20[1] = v5;
  if (a3)
  {
    uint64_t v7 = 8 * a3;
    while (1)
    {
      unint64_t v12 = 0;
      long long v13 = 0uLL;
      uint64_t v8 = DERDecodeItem((uint64_t)v20, &v12);
      uint64_t v9 = *a2;
      if (v8 || v12 != v9) {
        break;
      }
      *(_OWORD *)uint64_t v20 = v13;
      ++a2;
      v7 -= 8;
      if (!v7) {
        goto LABEL_6;
      }
    }
    SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode ret %d tag 0x%llx exoected 0x%llx", (uint64_t)&v18, v8, v12, v9);
    *(_OWORD *)a4 = v18;
    *(void *)(a4 + 16) = v19;
    uint64_t v19 = 0;
    long long v18 = 0uLL;
    *(unsigned char *)(a4 + 24) = 0;
    std::vector<std::string> v21 = (void **)&v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
  }
  else
  {
LABEL_6:
    unint64_t v12 = 0;
    *(void *)&long long v13 = &v12;
    *((void *)&v13 + 1) = 0x4002000000;
    char v14 = __Block_byref_object_copy_;
    v17[0] = 0;
    v17[1] = 0;
    uint64_t v15 = __Block_byref_object_dispose_;
    v16 = v17;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    uint64_t v11[2] = ___ZN4SLAML21DERParseSequenceToMapERNSt3__16vectorIhNS0_9allocatorIhEEEESt16initializer_listIyE_block_invoke;
    v11[3] = &unk_2655D6130;
    v11[4] = &v12;
    uint64_t v10 = DERDecodeSequenceContentWithBlock(v20, (uint64_t)v11);
    if (v10)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"DecodeSequenceContent returned %d", (uint64_t)&v18, v10);
      *(_OWORD *)a4 = v18;
      *(void *)(a4 + 16) = v19;
      uint64_t v19 = 0;
      long long v18 = 0uLL;
      *(unsigned char *)(a4 + 24) = 0;
      std::vector<std::string> v21 = (void **)&v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
    }
    else
    {
      std::map<unsigned long long,DERItem>::map[abi:ne180100](a4, v13 + 40);
      *(unsigned char *)(a4 + 24) = 1;
    }
    _Block_object_dispose(&v12, 8);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy((uint64_t)&v16, v17[0]);
  }
}

void sub_263817854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Block_object_dispose(&a17, 8);
  std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(v23, a23);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value(uint64_t result)
{
  v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_263817920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SLAM::Error::Unexpected(SLAM::Error *this@<X0>, uint64_t a2@<X8>, ...)
{
  va_start(va, a2);
  va_copy(v8, va);
  __s[0] = 0;
  vasprintf(__s, (const char *)this, va);
  if (__s[0])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, __s[0]);
    free(__s[0]);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  SLAM::Error::Error((std::string **)__s, (uint64_t)__p);
  *(_OWORD *)a2 = *(_OWORD *)__s;
  *(void *)(a2 + 16) = v5;
  __s[1] = 0;
  uint64_t v5 = 0;
  __s[0] = 0;
  uint64_t v9 = __s;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_263817A14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SLAM::Impl::~Impl(SLAM::Impl *this)
{
  SLAM::Impl::~Impl(this);

  JUMPOUT(0x263E6B170);
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;

  *(void *)this = &unk_270EB0FB0;
  v2 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::string v3 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  *((void *)this + 1) = &unk_270EB1038;
  std::string v4 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::string>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::vector<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_263817BB4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    std::string v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void *SLAM::Impl::Impl(void *a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  *a1 = &unk_270EB0FB0;
  uint64_t v7 = *a2;
  uint64_t v8 = (std::__shared_weak_count *)a2[1];
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *a3;
  uint64_t v9 = (std::__shared_weak_count *)a3[1];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  a1[1] = &unk_270EB1038;
  a1[2] = v7;
  a1[3] = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  a1[4] = v10;
  a1[5] = v9;
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  uint64_t v11 = a4[1];
  a1[6] = *a4;
  a1[7] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = a3[1];
  a1[8] = *a3;
  a1[9] = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void SLAM::TransceiverWrapper::~TransceiverWrapper(SLAM::TransceiverWrapper *this)
{
  *(void *)this = &unk_270EB1038;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::string v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_270EB1038;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::string v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  JUMPOUT(0x263E6B170);
}

__n128 std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>(std::vector<std::string> *this, uint64_t a2)
{
  if (LOBYTE(this[1].__begin_) == *(unsigned __int8 *)(a2 + 24))
  {
    if (LOBYTE(this[1].__begin_))
    {
      std::vector<std::string>::__vdeallocate(this);
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)&this->__begin_ = *(_OWORD *)a2;
      this->__end_cap_.__value_ = *(std::string **)(a2 + 16);
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
    }
  }
  else if (LOBYTE(this[1].__begin_))
  {
    size_t v5 = this;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
    LOBYTE(this[1].__begin_) = 0;
  }
  else
  {
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
    __n128 result = *(__n128 *)a2;
    *this = *(std::vector<std::string> *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    LOBYTE(this[1].__begin_) = 1;
  }
  return result;
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

std::string *ctu::join<std::__wrap_iter<std::string const*>>@<X0>(std::string *__str@<X0>, std::string *a2@<X1>, void *a3@<X2>, size_t a4@<X3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (__str != a2)
  {
    uint64_t v8 = __str;
    __str = std::string::operator=(a5, __str);
    for (uint64_t i = v8 + 1; i != a2; ++i)
    {
      if (a3)
      {
        std::string::basic_string[abi:ne180100](&__p, a3, a4);
        std::string::size_type v11 = HIBYTE(v21);
        uint64_t v12 = (void **)__p;
        std::string::size_type v13 = v20;
      }
      else
      {
        std::string::size_type v13 = 0;
        uint64_t v12 = 0;
        std::string::size_type v11 = 0;
        std::vector<std::string> __p = 0;
        std::string::size_type v20 = 0;
        uint64_t v21 = 0;
      }
      if ((v11 & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = v12;
      }
      if ((v11 & 0x80u) == 0) {
        std::string::size_type v15 = v11;
      }
      else {
        std::string::size_type v15 = v13;
      }
      std::string::append(a5, (const std::string::value_type *)p_p, v15);
      if (SHIBYTE(v21) < 0) {
        operator delete(__p);
      }
      int v16 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
      if (v16 >= 0) {
        uint64_t v17 = (const std::string::value_type *)i;
      }
      else {
        uint64_t v17 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
      }
      if (v16 >= 0) {
        std::string::size_type size = HIBYTE(i->__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = i->__r_.__value_.__l.__size_;
      }
      __str = std::string::append(a5, v17, size);
    }
  }
  return __str;
}

void sub_2638183D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

uint64_t std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  if (a2 != a3)
  {
    uint64_t v8 = a2;
    do
    {
      uint64_t v10 = *(void *)(a4 + 24);
      if (!v10) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 48))(v10, v8);
      uint64_t v11 = v8 + 24;
      if (v8 + 24 == a1[1]) {
        uint64_t v11 = *a1;
      }
      if (v11 == a1[3]) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v11;
      }
    }
    while (v8 != a3);
  }

  return std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](a5, a4);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x263E6B170);
}

uint64_t std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  std::string v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    std::string v3 = (void *)(a1 + 24);
  }
  *std::string v3 = 0;
  return a1;
}

{
  uint64_t v3;

  std::string v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void caulk::bad_expected_access<SLAM::Error>::~bad_expected_access(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB10D0;
  uint64_t v2 = a1 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v2);
  std::exception::~exception(a1);
}

uint64_t caulk::bad_expected_access<SLAM::Error>::bad_expected_access(uint64_t a1, long long **a2)
{
  *(void *)a1 = &unk_270EB10D0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 8), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

void sub_2638187D8(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::bad_expected_access<SLAM::Error>::~bad_expected_access(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB10D0;
  std::string v3 = a1 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
  std::exception::~exception(a1);
  return MEMORY[0x263E6B170]();
}

uint64_t caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 16);
    if (v2)
    {
      *(void *)(a1 + 24) = v2;
      operator delete(v2);
    }
  }
  else
  {
    uint64_t v4 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
  return a1;
}

uint64_t caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    caulk::__expected_detail::destroy<SLAM::Script,(void *)0>(a1);
  }
  else
  {
    std::string v3 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void caulk::__expected_detail::destroy<SLAM::Script,(void *)0>(uint64_t a1)
{
  std::string v3 = (void **)(a1 + 40);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<unsigned char>>::__clear[abi:ne180100]((uint64_t *)v2);
    std::string v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<unsigned char>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      size_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_263818A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_263818B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

void SLAM::StringUtil::Format(SLAM::StringUtil *this@<X0>, void *a2@<X8>, ...)
{
  va_start(va, a2);
  std::string __s = 0;
  vasprintf(&__s, (const char *)this, va);
  if (__s)
  {
    std::string::basic_string[abi:ne180100]<0>(a2, __s);
    free(__s);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "<FAILED TO VASPRINTF>");
  }
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::push_back_impl<std::string const&>(uint64_t a1, const std::string *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v3 - *(void *)a1) >> 3) == *(void *)(a1 + 32))
  {
    if (v3 != *(void *)a1)
    {
      std::string::operator=(*(std::string **)(a1 + 24), a2);
      uint64_t v4 = *(void *)(a1 + 24) + 24;
      *(void *)(a1 + 24) = v4;
      if (v4 == *(void *)(a1 + 8))
      {
        uint64_t v4 = *(void *)a1;
        *(void *)(a1 + 24) = *(void *)a1;
      }
      *(void *)(a1 + 16) = v4;
    }
  }
  else
  {
    size_t v5 = *(std::string **)(a1 + 24);
    if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v5, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    }
    else
    {
      long long v6 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
      v5->__r_.__value_.__r.__words[2] = a2->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
    }
    uint64_t v7 = *(void *)(a1 + 24) + 24;
    *(void *)(a1 + 24) = v7;
    if (v7 == *(void *)(a1 + 8)) {
      *(void *)(a1 + 24) = *(void *)a1;
    }
    ++*(void *)(a1 + 32);
  }
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  SLAM::Error::Error(&v2, "Cannot proceed in OSU state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(unsigned char *)(a1 + 24) = 1;
  uint64_t v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  SLAM::Error::Error(&v2, "Cannot proceed in SC state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(unsigned char *)(a1 + 24) = 1;
  uint64_t v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>@<X0>(SLAM::Impl ***a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v3 = **a1;
  uint64_t v4 = *((void *)v3 + 8);
  size_t v5 = (std::__shared_weak_count *)*((void *)v3 + 9);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Logger::Log(v4, 1, (uint64_t)"operator()", 198, "Recovering incomplete termination");
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  return SLAM::Impl::PerformTermination(v3, a2);
}

void sub_263818F00(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4 = *a1;
  long long v6 = *(SLAM::Impl **)(*a1 + 8);
  uint64_t v5 = *(void *)(*a1 + 16);
  uint64_t v7 = *a2;
  uint64_t v8 = *((void *)v6 + 8);
  uint64_t v9 = (std::__shared_weak_count *)*((void *)v6 + 9);
  if (v5 == *a2)
  {
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v5 = *(void *)(v4 + 16);
    }
    SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 211, "Resuming interrupted script 0x%llx", v5);
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
LABEL_11:
    a3->__r_.__value_.__s.__data_[0] = 0;
    a3[1].__r_.__value_.__s.__data_[0] = 0;
    return;
  }
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v7 = *a2;
    uint64_t v5 = *(void *)(v4 + 16);
  }
  SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 206, "Recover interrupted script 0x%llx before running 0x%llx", v7, v5);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  SLAM::Impl::PerformRecovery(v6, a3);
  if (!a3[1].__r_.__value_.__s.__data_[0]) {
    goto LABEL_11;
  }
}

void sub_263819004(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>@<X0>(SLAM::Impl ***a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v3 = **a1;
  uint64_t v4 = *((void *)v3 + 8);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)v3 + 9);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Logger::Log(v4, 1, (uint64_t)"operator()", 252, "Recovering incomplete termination");
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  return SLAM::Impl::PerformTermination(v3, a2);
}

void sub_2638190C8(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(SLAM::Impl **)(*(void *)a1 + 8);
  uint64_t v6 = *((void *)v5 + 6);
  uint64_t v7 = (std::__shared_weak_count *)*((void *)v5 + 7);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(void *__return_ptr))(*(void *)v6 + 8))(v18);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v20)
  {
    SLAM::Impl::ExecuteScript((uint64_t)v5, v19, &v16);
    if (v17)
    {
      uint64_t v9 = *((void *)v5 + 8);
      uint64_t v8 = (std::__shared_weak_count *)*((void *)v5 + 9);
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v10 = *a2;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v16.__r_.__value_.__l.__data_, (std::string *)v16.__r_.__value_.__l.__size_, ", ", 2uLL, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      SLAM::Logger::Log(v9, 1, (uint64_t)"operator()", 267, "Failed recovery with scriptID 0x%llx, error was %s", v10, (const char *)p_p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      SLAM::Impl::PerformTermination(v5, a3);
      if (v17)
      {
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      }
    }
    else
    {
      a3->__r_.__value_.__s.__data_[0] = 0;
      a3[1].__r_.__value_.__s.__data_[0] = 0;
    }
  }
  else
  {
    uint64_t v12 = *((void *)v5 + 8);
    std::string::size_type v13 = (std::__shared_weak_count *)*((void *)v5 + 9);
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    SLAM::Logger::Log(v12, 1, (uint64_t)"operator()", 260, "Recovery script 0x%llx not found, terminating!", *a2);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    SLAM::Impl::PerformTermination(v5, a3);
  }
  return caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)v18);
}

void sub_2638192D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20,int a21,__int16 a22,char a23,char a24)
{
}

void sub_263819348()
{
  if (v0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v0);
  }
  JUMPOUT(0x263819340);
}

uint64_t caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    std::vector<std::string> v2 = *(void **)a1;
    if (*(void *)a1)
    {
      *(void *)(a1 + 8) = v2;
      operator delete(v2);
    }
  }
  else
  {
    uint64_t v4 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
  return a1;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  uint64_t v5 = (char *)a1[1];
  uint64_t v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = &v7[v11];
    std::string::size_type v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      long long v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      uint64_t v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void *__Block_byref_object_copy_(void *result, void *a2)
{
  result[5] = a2[5];
  std::vector<std::string> v2 = a2 + 6;
  uint64_t v3 = a2[6];
  result[6] = v3;
  uint64_t v4 = result + 6;
  uint64_t v5 = a2[7];
  result[7] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[5] = v2;
    *std::vector<std::string> v2 = 0;
    a2[7] = 0;
  }
  else
  {
    result[5] = v4;
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t ___ZN4SLAML21DERParseSequenceToMapERNSt3__16vectorIhNS0_9allocatorIhEEEESt16initializer_listIyE_block_invoke(uint64_t a1, uint64_t a2)
{
  std::vector<std::string> v2 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = (uint64_t *)a2;
  *(_OWORD *)(std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v2, (unint64_t *)a2, (uint64_t)&std::piecewise_construct, &v4)+ 5) = *(_OWORD *)(a2 + 8);
  return 0;
}

void std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        unint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      unint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v9 = a1 + 1;
LABEL_10:
    unint64_t v11 = (uint64_t *)operator new(0x38uLL);
    v11[4] = **a4;
    void v11[5] = 0;
    v11[6] = 0;
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      std::vector<std::string> v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            std::vector<std::string> v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *std::vector<std::string> v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        std::vector<std::string> v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *std::vector<std::string> v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::map<unsigned long long,DERItem>::map[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = a1 + 8;
  std::map<unsigned long long,DERItem>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,DERItem>,std::__tree_node<std::__value_type<unsigned long long,DERItem>,void *> *,long>>>((_OWORD *)a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_26381991C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *std::map<unsigned long long,DERItem>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,DERItem>,std::__tree_node<std::__value_type<unsigned long long,DERItem>,void *> *,long>>>(_OWORD *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    int v6 = (void *)result + 1;
    do
    {
      __n128 result = std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_hint_unique_key_args<unsigned long long,std::pair<unsigned long long const,DERItem> const&>(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

_OWORD *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_hint_unique_key_args<unsigned long long,std::pair<unsigned long long const,DERItem> const&>(uint64_t **a1, void *a2, unint64_t *a3, uint64_t a4)
{
  int v6 = (void **)std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__find_equal<unsigned long long>(a1, a2, &v11, &v10, a3);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x38uLL);
    v7[2] = *(_OWORD *)a4;
    *((void *)v7 + 6) = *(void *)(a4 + 16);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, v11, v8, (uint64_t *)v7);
  }
  return v7;
}

void *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__find_equal<unsigned long long>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (unint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    std::string v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          char v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          std::string v16 = (void *)*v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        std::string v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      char v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    char v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          char v20 = (void *)*v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        char v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

std::string **SLAM::Error::Error(std::string **a1, uint64_t a2)
{
  *(void *)&long long v6 = *MEMORY[0x263EF8340];
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v5, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v5 = *(std::string *)a2;
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v3 = (std::string *)operator new(0x18uLL);
  *a1 = v3;
  a1[1] = v3;
  a1[2] = v3 + 1;
  a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)(a1 + 2), (long long *)&v5, &v6, v3);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_263819CD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    long long v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      long long v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_263819DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, *(void **)(a1 + 8));
  }
  else
  {
    uint64_t v3 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    std::string v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void *std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](void *a1)
{
  std::vector<std::string> v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *_ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  std::vector<std::string> v2 = operator new(0x30uLL);
  __n128 result = _ZNSt3__120__shared_ptr_emplaceIN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_263819F78(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__120__shared_ptr_emplaceIN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270EB1160;
  std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider>((uint64_t)&v3, a1 + 3);
  return a1;
}

void sub_263819FE4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1160;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1160;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6B170);
}

uint64_t std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider>(uint64_t a1, void *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "/usr/standalone/firmware/SLAM/SLAM.sefw");
  SLAM::DefaultScriptProvider::DefaultScriptProvider(a2, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
}

void sub_26381A0E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  char v4 = operator new(0x50uLL);
  __n128 result = std::__shared_ptr_emplace<SLAM::Logger>::__shared_ptr_emplace[abi:ne180100]<gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,std::allocator<SLAM::Logger>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_26381A14C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SLAM::Logger>::__shared_ptr_emplace[abi:ne180100]<gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,std::allocator<SLAM::Logger>,0>(void *a1, uint64_t *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270EB1198;
  std::allocator<SLAM::Logger>::construct[abi:ne180100]<SLAM::Logger,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&>((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_26381A1BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SLAM::Logger>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1198;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::Logger>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1198;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6B170);
}

void std::allocator<SLAM::Logger>::construct[abi:ne180100]<SLAM::Logger,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&>(uint64_t a1, void *a2, uint64_t *a3)
{
  char v3 = (std::__shared_weak_count *)a3[1];
  uint64_t v4 = *a3;
  std::string v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Logger::Logger(a2, &v4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void sub_26381A2A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void *SLAM::Logger::Logger(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  a1[6] = 0;
  uint64_t v4 = (char *)operator new(0x1E0uLL);
  a1[2] = v4;
  a1[3] = v4 + 480;
  a1[4] = v4;
  a1[5] = v4;
  return a1;
}

void sub_26381A30C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<SLAM::Logger>::__on_zero_shared_impl[abi:ne180100]<std::allocator<SLAM::Logger>,0>(uint64_t a1)
{
  boost::circular_buffer<std::string,std::allocator<std::string>>::destroy((uint64_t *)(a1 + 40));
  std::vector<std::string> v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::destroy(uint64_t *a1)
{
  if (*a1) {
    operator delete((void *)*a1);
  }
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::destroy_content(uint64_t *a1)
{
  if (a1[4])
  {
    unint64_t v2 = 0;
    uint64_t v3 = a1[2];
    do
    {
      if (*(char *)(v3 + 23) < 0)
      {
        operator delete(*(void **)v3);
        uint64_t v3 = a1[2];
      }
      v3 += 24;
      a1[2] = v3;
      if (v3 == a1[1])
      {
        uint64_t v3 = *a1;
        a1[2] = *a1;
      }
      ++v2;
    }
    while (v2 < a1[4]);
  }
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB11D0;
  unint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB11D0;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x263E6B170);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EB11D0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EB11D0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_26381A63C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1218;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1218;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x263E6B170);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EB1218;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EB1218;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_26381A870(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1260;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1260;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x263E6B170);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EB1260;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EB1260;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_26381AAA4(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    std::string::size_type v6 = result;
    __n128 result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_26381AB1C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void SLAM::DefaultScriptProvider::CreateWithPath(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  std::allocate_shared[abi:ne180100]<SLAM::DefaultScriptProvider,std::allocator<SLAM::DefaultScriptProvider>,std::string &,void>(a1, &v5);
  uint64_t v4 = v5;
  uint64_t v3 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v4) {
    std::terminate();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v3;
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    *(unsigned char *)(a2 + 24) = 1;
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  else
  {
    *(unsigned char *)(a2 + 24) = 1;
  }
}

void *SLAM::DefaultScriptProvider::DefaultScriptProvider(void *a1, uint64_t a2)
{
  *a1 = &unk_270EB12A8;
  applesauce::v1::mapped_file::mapped_file(a1 + 1, a2, 1);
  return a1;
}

void *SLAM::DefaultScriptProvider::GetScriptByID@<X0>(SLAM::DefaultScriptProvider *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  v5[0] = &unk_270EB1358;
  v5[1] = &v4;
  v5[3] = v5;
  SLAM::DefaultScriptProvider::FindScriptMatching((uint64_t)this, (uint64_t)v5, a3);
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v5);
}

void sub_26381AE78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void SLAM::DefaultScriptProvider::FindScriptMatching(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v66[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5 < 7
    || (SLAM::DefaultScriptProvider::FindScriptMatching(std::function<BOOL ()(SLAMScriptDERObj const&)>)::plist_header == *(_DWORD *)v6
      ? (BOOL v7 = word_26A9A0AA4 == *(_WORD *)(v6 + 4))
      : (BOOL v7 = 0),
        !v7))
  {
    v64[0] = *(void *)(a1 + 8);
    v64[1] = v5;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v8 = DERParseSequence((uint64_t)v64, (unsigned __int16)slamSEFWItemSpecLen, (uint64_t)&slamSEFWItemSpec, (unint64_t)&v62, 0x20uLL);
    if (v8)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Failed to parse top level %d", (uint64_t)&v54, v8);
LABEL_18:
      *(std::string *)a3 = v54;
      memset(&v54, 0, sizeof(v54));
      *(unsigned char *)(a3 + 72) = 0;
      *(void *)&long long v40 = &v54;
      uint64_t v12 = (void ***)&v40;
      goto LABEL_19;
    }
    if (*((void *)&v62 + 1) != 4)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM version length %zu", (uint64_t)&v54, *((void *)&v62 + 1));
      goto LABEL_18;
    }
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    int v61 = 0;
    uint64_t v9 = bswap32(*(_DWORD *)v62);
    int v61 = v9;
    if ((v9 - 1) >= 2)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM SEFW version %u", (uint64_t)&v54, v9);
      *(std::string *)a3 = v54;
      memset(&v54, 0, sizeof(v54));
      *(unsigned char *)(a3 + 72) = 0;
      *(void *)&long long v40 = &v54;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
LABEL_22:
      _Block_object_dispose(v60, 8);
      return;
    }
    v54.__r_.__value_.__r.__words[0] = 0;
    v54.__r_.__value_.__l.__size_ = (std::string::size_type)&v54;
    v54.__r_.__value_.__r.__words[2] = 0xA812000000;
    v55 = __Block_byref_object_copy__0;
    v56 = __Block_byref_object_dispose__0;
    uint64_t v57 = 0;
    char v58 = 0;
    char v59 = 0;
    v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x5012000000;
    v49 = __Block_byref_object_copy__5;
    v50 = __Block_byref_object_dispose__6;
    uint64_t v51 = 0;
    char v52 = 0;
    char v53 = 0;
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3321888768;
    v65[2] = ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke;
    v65[3] = &unk_270EB12D0;
    v65[4] = v60;
    v65[5] = &v46;
    std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100]((uint64_t)v66, a2);
    v65[6] = &v54;
    uint64_t v10 = DERDecodeSequenceContentWithBlock((unint64_t *)&v63, (uint64_t)v65);
    if (v10)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode script %d", (uint64_t)&v40, v10);
      *(_OWORD *)a3 = v40;
      *(void *)(a3 + 16) = v41;
      *(void *)&long long v41 = 0;
      long long v40 = 0uLL;
      *(unsigned char *)(a3 + 72) = 0;
      v35.__begin_ = (std::vector<std::string>::pointer)&v40;
      p_p = &v35;
    }
    else
    {
      if (*((unsigned char *)v47 + 72))
      {
        ctu::join<std::__wrap_iter<std::string const*>>(v47[6], v47[7], ", ", 2uLL, &__p);
        SLAM::Error::Error(&v35.__begin_, (uint64_t)&__p);
        long long v40 = 0uLL;
        *(void *)&long long v41 = 0;
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v40, (long long *)v35.__begin_, (long long *)v35.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3));
        *(_OWORD *)a3 = v40;
        *(void *)(a3 + 16) = v41;
        *(void *)&long long v41 = 0;
        long long v40 = 0uLL;
        *(unsigned char *)(a3 + 72) = 0;
        v32[0] = &v40;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
        v32[0] = &v35;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        goto LABEL_13;
      }
      if (*(unsigned char *)(v54.__r_.__value_.__l.__size_ + 160))
      {
        long long v13 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 96);
        long long v14 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 128);
        long long v15 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 144);
        v44[0] = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 112);
        v44[1] = v14;
        long long v45 = v15;
        long long v16 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 64);
        long long v42 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 80);
        long long v43 = v13;
        long long v40 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 48);
        long long v41 = v16;
        v35.__begin_ = 0;
        v35.__end_ = (std::vector<std::string>::pointer)&v35;
        v35.__end_cap_.__value_ = (std::string *)0x4812000000;
        v36 = __Block_byref_object_copy__11;
        uint64_t v37 = __Block_byref_object_dispose__12;
        v38 = "";
        memset(v39, 0, sizeof(v39));
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke_13;
        v34[3] = &unk_2655D6158;
        v34[4] = &v35;
        uint64_t v17 = DERDecodeSequenceContentWithBlock((unint64_t *)v44, (uint64_t)v34);
        if (v17)
        {
          SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode APDUs %d", (uint64_t)&__p, v17);
          *(std::string *)a3 = __p;
          memset(&__p, 0, sizeof(__p));
          *(unsigned char *)(a3 + 72) = 0;
          v32[0] = &__p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
        }
        else
        {
          v32[1] = 0;
          uint64_t v33 = 0;
          v32[0] = 0;
          std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v32, (const void *)v42, v42 + *((void *)&v42 + 1), *((size_t *)&v42 + 1));
          unsigned int v18 = v45;
          if ((void)v45) {
            unsigned int v18 = bswap32(*(_DWORD *)v45);
          }
          unint64_t v19 = bswap64(*(void *)v40);
          uint64_t v20 = v33;
          long long v21 = *(_OWORD *)v32;
          v32[1] = 0;
          uint64_t v33 = 0;
          v32[0] = 0;
          std::vector<std::string>::pointer end = v35.__end_;
          std::string::pointer data = v35.__end_[2].__r_.__value_.__l.__data_;
          long long v24 = *(_OWORD *)&v35.__end_[2].__r_.__value_.__r.__words[1];
          *(_OWORD *)(a3 + 48) = v24;
          end[2].__r_.__value_.__l.__size_ = 0;
          end[2].__r_.__value_.__r.__words[2] = 0;
          end[2].__r_.__value_.__r.__words[0] = 0;
          unsigned int v31 = v18;
          *(void *)a3 = v19;
          *(_OWORD *)(a3 + 8) = v21;
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
          __p.__r_.__value_.__r.__words[2] = 0;
          uint64_t v26 = 0;
          *(void *)(a3 + 24) = v20;
          *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (void)data) >> 3);
          *(void *)(a3 + 40) = data;
          unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (void)data) >> 3);
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          uint64_t v30 = 0;
          *(_DWORD *)(a3 + 64) = v18;
          *(unsigned char *)(a3 + 72) = 1;
          SLAM::Script::~Script((SLAM::Script *)&__p);
          if (v32[0])
          {
            v32[1] = v32[0];
            operator delete(v32[0]);
          }
        }
        _Block_object_dispose(&v35, 8);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
        std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        goto LABEL_13;
      }
      SLAM::Error::Error(&v35, "Could not find script within SEFW");
      long long v40 = 0uLL;
      *(void *)&long long v41 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v40, (long long *)v35.__begin_, (long long *)v35.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3));
      *(_OWORD *)a3 = v40;
      *(void *)(a3 + 16) = v41;
      *(void *)&long long v41 = 0;
      long long v40 = 0uLL;
      *(unsigned char *)(a3 + 72) = 0;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v40;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
      p_p = (std::vector<std::string> *)&__p;
    }
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)p_p);
LABEL_13:
    std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v66);
    _Block_object_dispose(&v46, 8);
    if (v53)
    {
      *(void *)&long long v40 = &v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
    }
    _Block_object_dispose(&v54, 8);
    goto LABEL_22;
  }
  SLAM::Error::Error((std::vector<std::string> *)&v40, "Legacy (plist) SLAM SEFW path is no longer supported");
  memset(&v54, 0, sizeof(v54));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v54, (long long *)v40, *((long long **)&v40 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v40 + 1) - v40) >> 3));
  *(std::string *)a3 = v54;
  memset(&v54, 0, sizeof(v54));
  *(unsigned char *)(a3 + 72) = 0;
  v46 = &v54;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v46);
  v46 = (std::string *)&v40;
  uint64_t v12 = (void ***)&v46;
LABEL_19:
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v12);
}

void sub_26381B53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,int a63)
{
  _Block_object_dispose(&a30, 8);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v64);
  _Block_object_dispose(&a53, 8);
  if (a62) {
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a39);
  }
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v65 - 224), 8);
  _Unwind_Resume(a1);
}

void *SLAM::DefaultScriptProvider::GetScript@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  v12[4] = *MEMORY[0x263EF8340];
  int v11 = a4;
  uint64_t v9 = operator new(0x20uLL);
  *uint64_t v9 = &unk_270EB13A0;
  v9[1] = a2;
  v9[2] = a3;
  void v9[3] = &v11;
  void v12[3] = v9;
  SLAM::DefaultScriptProvider::FindScriptMatching(a1, (uint64_t)v12, a5);
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v12);
}

void sub_26381B6E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v3;
  __n128 result = *(__n128 *)(a2 + 112);
  long long v6 = *(_OWORD *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a1 + 128) = v6;
  *(_OWORD *)(a1 + 144) = v7;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

__n128 __Block_byref_object_copy__5(uint64_t a1, __n128 *a2)
{
  *(unsigned char *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  if (a2[4].n128_u8[8])
  {
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
    __n128 result = a2[3];
    *(__n128 *)(a1 + 48) = result;
    *(void *)(a1 + 64) = a2[4].n128_u64[0];
    a2[3].n128_u64[0] = 0;
    a2[3].n128_u64[1] = 0;
    a2[4].n128_u64[0] = 0;
    *(unsigned char *)(a1 + 72) = 1;
  }
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v1 = (void **)(a1 + 48);
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
  }
}

unint64_t *___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  unint64_t v5 = DERParseSequenceContent((unint64_t *)(a2 + 8), (unsigned __int16)slamScriptItemSpecLen, (uint64_t)&slamScriptItemSpec, (unint64_t)&v20, 0x70uLL);
  if (!v5)
  {
    if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24) >= 2u && *((void *)&v25 + 1) != 4)
    {
      std::string::basic_string[abi:ne180100](__p, (void *)v21, *((size_t *)&v21 + 1));
      if (v18 >= 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      SLAM::Error::Error(&v19, "Platform Category absent for a script with name %s", (const char *)v7);
      std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>((std::vector<std::string> *)(*(void *)(a1[5] + 8) + 48), &v19);
      unint64_t v27 = &v19;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      *a3 = 1;
    }
    uint64_t v8 = a1[10];
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    if ((*(unsigned int (**)(uint64_t, long long *))(*(void *)v8 + 48))(v8, &v20))
    {
      uint64_t v9 = *(void *)(a1[6] + 8);
      long long v11 = v25;
      long long v10 = v26;
      *(_OWORD *)(v9 + 112) = v24;
      *(_OWORD *)(v9 + 128) = v11;
      *(_OWORD *)(v9 + 144) = v10;
      long long v12 = v21;
      long long v14 = v22;
      long long v13 = v23;
      *(_OWORD *)(v9 + 48) = v20;
      *(_OWORD *)(v9 + 64) = v12;
      int v15 = *(unsigned __int8 *)(v9 + 160);
      *(_OWORD *)(v9 + 80) = v14;
      *(_OWORD *)(v9 + 96) = v13;
      if (!v15) {
        *(unsigned char *)(v9 + 160) = 1;
      }
      *a3 = 1;
    }
  }
  return v5;
}

void sub_26381B91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  *(void *)(v17 - 40) = v16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v17 - 40));
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_56c46_ZTSNSt3__18functionIFbRK16SLAMScriptDERObjEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100](a1 + 56, a2 + 56);
}

void *__destroy_helper_block_ea8_56c46_ZTSNSt3__18functionIFbRK16SLAMScriptDERObjEEE(uint64_t a1)
{
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100]((void *)(a1 + 56));
}

__n128 __Block_byref_object_copy__11(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke_13(uint64_t a1, void *a2)
{
  if (*a2 != 4) {
    return 2;
  }
  long long v2 = *(uint64_t **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = (const void *)a2[1];
  size_t v4 = a2[2];
  long long v3 = (const void **)(a2 + 1);
  uint64_t v9 = (uint64_t)v5 + v4;
  long long v6 = (void *)v2[7];
  if ((unint64_t)v6 >= v2[8])
  {
    uint64_t v7 = std::vector<std::vector<unsigned char>>::__emplace_back_slow_path<unsigned char *&,unsigned char *>(v2 + 6, v3, &v9);
  }
  else
  {
    *long long v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v6, v5, (uint64_t)v5 + v4, v4);
    uint64_t v7 = (uint64_t)(v6 + 3);
    v2[7] = (uint64_t)(v6 + 3);
  }
  uint64_t result = 0;
  v2[7] = v7;
  return result;
}

void sub_26381BA40(_Unwind_Exception *a1)
{
  *(void *)(v2 + 56) = v1;
  _Unwind_Resume(a1);
}

void SLAM::Script::~Script(SLAM::Script *this)
{
  long long v3 = (void **)((char *)this + 40);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void SLAM::DefaultScriptProvider::~DefaultScriptProvider(SLAM::DefaultScriptProvider *this)
{
  *(void *)this = &unk_270EB12A8;
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2) {
    munmap(v2, *((void *)this + 2));
  }
  *((void *)this + 2) = 0;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_270EB12A8;
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2) {
    munmap(v2, *((void *)this + 2));
  }
  *((void *)this + 2) = 0;

  JUMPOUT(0x263E6B170);
}

void *applesauce::v1::mapped_file::mapped_file(void *a1, uint64_t a2, __int16 a3)
{
  *a1 = 0;
  a1[1] = 0;
  if (*(char *)(a2 + 23) >= 0) {
    long long v6 = (const char *)a2;
  }
  else {
    long long v6 = *(const char **)a2;
  }
  int v7 = open(v6, 0);
  if (v7 < 0)
  {
    exception = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v22, "open()");
    int v15 = __error();
  }
  int v8 = v7;
  if (fstat(v7, &v22) < 0)
  {
    uint64_t v16 = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v20, "fstat()");
    uint64_t v17 = __error();
  }
  st_std::string::size_type size = v22.st_size;
  a1[1] = v22.st_size;
  if (a3)
  {
    int v10 = 0x7FFFFFFF;
    if (st_size < 0x7FFFFFFF) {
      int v10 = st_size;
    }
    int v21 = v10;
    long long v20 = 0;
    fcntl(v8, 44, &v20);
    st_std::string::size_type size = a1[1];
  }
  if ((a3 & 0x100) != 0) {
    int v11 = 1;
  }
  else {
    int v11 = 1025;
  }
  long long v12 = mmap(0, st_size, 1, v11, v8, 0);
  *a1 = v12;
  if (v12 == (void *)-1)
  {
    char v18 = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v20, "mmap()");
    std::vector<std::string> v19 = __error();
  }
  close(v8);
  return a1;
}

void sub_26381BD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v23 & 1) == 0)
    {
LABEL_6:
      close(v21);
      _Unwind_Resume(a1);
    }
  }
  else if (!v23)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v22);
  goto LABEL_6;
}

void applesauce::v1::anonymous namespace'::io_failure_exception(const void **a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, std::ios_base::failure *a4@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v8 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v8 = (size_t)a1[1];
  }
  uint64_t v9 = &v19;
  std::string::basic_string[abi:ne180100]((uint64_t)&v19, v8 + 13);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v9 = (std::string *)v19.__r_.__value_.__r.__words[0];
  }
  if (v8)
  {
    if (*((char *)a1 + 23) >= 0) {
      int v10 = a1;
    }
    else {
      int v10 = *a1;
    }
    memmove(v9, v10, v8);
  }
  strcpy((char *)v9 + v8, " failed for '");
  int v11 = *(char *)(a2 + 23);
  if (v11 >= 0) {
    long long v12 = (const std::string::value_type *)a2;
  }
  else {
    long long v12 = *(const std::string::value_type **)a2;
  }
  if (v11 >= 0) {
    std::string::size_type v13 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v13 = *(void *)(a2 + 8);
  }
  long long v14 = std::string::append(&v19, v12, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v20.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  uint64_t v16 = std::string::append(&v20, "'");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  __msg.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__msg.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  *(void *)&__ec.__val_ = a3;
  __ec.__cat_ = std::generic_category();
  std::ios_base::failure::failure(a4, &__msg, &__ec);
  if (SHIBYTE(__msg.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__msg.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
}

void sub_26381BF50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    long long v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void *std::allocate_shared[abi:ne180100]<SLAM::DefaultScriptProvider,std::allocator<SLAM::DefaultScriptProvider>,std::string &,void>@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x30uLL);
  uint64_t result = std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::allocator<SLAM::DefaultScriptProvider>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_26381C06C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::allocator<SLAM::DefaultScriptProvider>,0>(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270EB1160;
  std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider,std::string &>((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_26381C0DC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider,std::string &>(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  *a2 = &unk_270EB12A8;
  applesauce::v1::mapped_file::mapped_file(a2 + 1, (uint64_t)&__p, 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_26381C17C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::~__func()
{
}

void *std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_270EB1358;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270EB1358;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::operator()(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 8) == 8 && bswap64(**(void **)a2) == **(void **)(a1 + 8);
}

void *std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::~__func()
{
}

__n128 std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_270EB13A0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_270EB13A0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::operator()(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 88) == 4) {
    unsigned int v4 = bswap32(**(_DWORD **)(a2 + 80));
  }
  else {
    unsigned int v4 = 1;
  }
  size_t v5 = *(void *)(a2 + 24);
  long long v6 = *(void **)(a1 + 8);
  if (*((char *)v6 + 23) < 0)
  {
    if (v5 != v6[1]) {
      return 0;
    }
    long long v6 = (void *)*v6;
  }
  else if (v5 != *((unsigned __int8 *)v6 + 23))
  {
    return 0;
  }
  if (memcmp(v6, *(const void **)(a2 + 16), v5)) {
    return 0;
  }
  size_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v7 != *(void *)(v8 + 8) - *(void *)v8 || memcmp(*(const void **)v8, *(const void **)(a2 + 32), v7)) {
    return 0;
  }
  return !v4 || **(_DWORD **)(a1 + 24) == v4;
}

uint64_t std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::vector<std::vector<unsigned char>>::__emplace_back_slow_path<unsigned char *&,unsigned char *>(uint64_t *a1, const void **a2, uint64_t *a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 3);
  if (2 * v10 > v6) {
    unint64_t v6 = 2 * v10;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v11 = v6;
  }
  stat v22 = a1 + 2;
  if (v11) {
    long long v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v9, v11);
  }
  else {
    long long v12 = 0;
  }
  std::string::size_type v13 = &v12[24 * v5];
  v19[0] = v12;
  v19[1] = v13;
  std::string v20 = v13;
  int v21 = &v12[24 * v11];
  long long v14 = *a2;
  uint64_t v15 = *a3;
  size_t v16 = *a3 - (void)*a2;
  *(void *)std::string::size_type v13 = 0;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v13, v14, v15, v16);
  v20 += 24;
  std::vector<std::vector<unsigned char>>::__swap_out_circular_buffer(a1, v19);
  uint64_t v17 = a1[1];
  std::__split_buffer<std::vector<unsigned char>>::~__split_buffer((uint64_t)v19);
  return v17;
}

void sub_26381C5E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<unsigned char>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<unsigned char>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  uint64_t v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<unsigned char>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<unsigned char>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void sub_26381CC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,char a36)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)&a36);
  std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  std::__shared_weak_count::__release_shared[abi:ne180100](v37);

  _Unwind_Resume(a1);
}

uint64_t caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value(uint64_t result)
{
  uint64_t v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_26381CDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void sub_26381D220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void **__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,char a41)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a34)
  {
    std::string __p = &a28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&__p);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)&a41);
  std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  std::__shared_weak_count::__release_shared[abi:ne180100](v43);

  _Unwind_Resume(a1);
}

void sub_26381D724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)&a34);
  std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  std::__shared_weak_count::__release_shared[abi:ne180100](v35);

  _Unwind_Resume(a1);
}

void sub_26381DB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)&a28);

  _Unwind_Resume(a1);
}

uint64_t caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
  }
  else
  {
    uint64_t v4 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
  return a1;
}

void std::__shared_ptr_emplace<SLAM::ObjC::SEHandleShim>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB13E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::ObjC::SEHandleShim>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB13E8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6B170);
}

uint64_t std::__shared_ptr_emplace<SLAM::ObjC::SEHandleShim>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))();
}

void SLAM::ObjC::SEHandleShim::Transceive(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = (void *)MEMORY[0x263E6B2C0]();
  uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithCXXVector:a2];
  long long v8 = *(void **)(a1 + 8);
  id v21 = 0;
  uint64_t v9 = [v8 transceive:v7 error:&v21];
  id v10 = v21;
  unint64_t v11 = v10;
  if (v9)
  {
    [v9 asCXXVector];
    *(_OWORD *)a3 = v22;
    *(void *)(a3 + 16) = v23;
    *(unsigned char *)(a3 + 24) = 1;
  }
  else if (v10)
  {
    char v12 = [v10 description];
    long long v13 = v12;
    if (v12)
    {
      [v12 asCXXString];
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v17 = 0;
    }
    SLAM::Error::Error((std::string **)&v18, (uint64_t)__p);
    uint64_t v14 = v19;
    long long v15 = v18;
    uint64_t v19 = 0;
    long long v18 = 0uLL;
    uint64_t v23 = 0;
    long long v22 = 0uLL;
    long long v24 = (void **)&v22;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v24);
    *(_OWORD *)a3 = v15;
    *(void *)(a3 + 16) = v14;
    memset(v20, 0, sizeof(v20));
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)&long long v22 = v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    *(void *)&long long v22 = &v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    SLAM::Error::Unexpected((SLAM::Error *)"%s", (uint64_t)&v22, "Transceive return nil and no error?");
    *(_OWORD *)a3 = v22;
    *(void *)(a3 + 16) = v23;
    uint64_t v23 = 0;
    long long v22 = 0uLL;
    *(unsigned char *)(a3 + 24) = 0;
    v20[0] = (void **)&v22;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v20);
  }
}

void sub_26381DEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  _Unwind_Resume(a1);
}

void SLAM::ObjC::SEHandleShim::~SEHandleShim(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x263E6B170);
}

void std::__shared_ptr_emplace<SLAM::ObjC::LogSinkShim>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1448;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::ObjC::LogSinkShim>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1448;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6B170);
}

uint64_t std::__shared_ptr_emplace<SLAM::ObjC::LogSinkShim>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))();
}

void SLAM::ObjC::LogSinkShim::Log(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x263E6B2C0]();
  uint64_t v5 = *(void **)(a1 + 8);
  uint64_t v6 = [NSString stringWithCXXString:a2];
  [v5 log:v6];
}

void sub_26381E090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SLAM::ObjC::LogSinkShim::~LogSinkShim(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x263E6B170);
}

void *std::__function::__value_func<BOOL ()(ScriptInfo *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_26381E4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, char *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char a24)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a24)
  {
    std::string __p = &a21;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  std::__shared_weak_count::__release_shared[abi:ne180100](v24);

  _Unwind_Resume(a1);
}

void sub_26381E864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,uint64_t a27,uint64_t a28,char a29)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a29)
  {
    std::string __p = &a26;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  std::__shared_weak_count::__release_shared[abi:ne180100](v30);

  _Unwind_Resume(a1);
}

void sub_26381EBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22)
  {
    std::string __p = &a19;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  std::__shared_weak_count::__release_shared[abi:ne180100](v22);

  _Unwind_Resume(a1);
}

void sub_26381F050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void **__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,char a36)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a29)
  {
    std::string __p = &a23;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&__p);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)&a36);
  std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  std::__shared_weak_count::__release_shared[abi:ne180100](v37);

  _Unwind_Resume(a1);
}

uint64_t caulk::expected<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::value(uint64_t result)
{
  uint64_t v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_26381F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void sub_26381F680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void **__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,char a41)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a34)
  {
    std::string __p = &a28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&__p);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)&a41);
  std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  std::__shared_weak_count::__release_shared[abi:ne180100](v43);

  _Unwind_Resume(a1);
}

void SCLM::SCLMPrivateInterface::PerformScript(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a3, &v26);
  *(unsigned char *)a5 = 0;
  *(unsigned char *)(a5 + 24) = 0;
  id v10 = (std::__shared_weak_count *)a2[1];
  uint64_t v24 = *a2;
  long long v25 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (uint64_t)v26;
  char v12 = v27;
  if (v27)
  {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v23 = v12;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v22 = v11;
  if (!v11) {
    std::terminate();
  }
  long long v13 = (std::__shared_weak_count *)a4[1];
  uint64_t v20 = *a4;
  id v21 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SCLM::SCLMImpl::SCLMImpl(__p, &v24, &v22, &v20);
  SLAM::Impl::PerformScript((SLAM::Impl *)__p, &v31);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a5, (uint64_t)&v31);
  if (v32)
  {
    uint64_t v28 = &v31;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
  }
  SCLM::SCLMImpl::~SCLMImpl((SCLM::SCLMImpl *)__p);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if (*(unsigned char *)(a5 + 24))
  {
    SLAM::Error::Add((std::vector<std::string> *)a5, "While performing script 0x%llx", a1);
    long long v15 = (void (***)(void, std::string *))*a3;
    uint64_t v14 = (std::__shared_weak_count *)a3[1];
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a5, *(std::string **)(a5 + 8), ", ", 2uLL, __p);
    (**v15)(v15, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    size_t v16 = v26;
    uint64_t v17 = *a3;
    long long v18 = (std::__shared_weak_count *)a3[1];
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v29[0] = &unk_270EB1540;
    v29[1] = v17;
    v29[2] = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v29[3] = v29;
    if (v16[6]) {
      uint64_t v19 = v16[4];
    }
    else {
      uint64_t v19 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v31, (uint64_t)v29);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v16 + 2, v19, 0, (uint64_t)&v31, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v31);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v29);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
}

{
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  void (***v14)(void, std::string *);
  std::__shared_weak_count *v15;
  uint64_t *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::string v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t *v27;
  std::__shared_weak_count *v28;
  std::string *v29;
  void v30[4];
  std::string __p[4];
  std::string v32;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a3, &v27);
  *(unsigned char *)a5 = 0;
  *(unsigned char *)(a5 + 24) = 0;
  id v10 = (std::__shared_weak_count *)a2[1];
  long long v25 = *a2;
  long long v26 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (uint64_t)v27;
  char v12 = v28;
  if (v28)
  {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v24 = v12;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v23 = v11;
  if (!v11) {
    std::terminate();
  }
  long long v13 = (std::__shared_weak_count *)a4[1];
  id v21 = *a4;
  uint64_t v22 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SCLM::SCLMImpl::SCLMImpl(__p, &v25, &v23, &v21);
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    uint64_t v20 = *(std::string *)a1;
  }
  SLAM::Impl::PerformScript((SLAM::Impl *)__p, (const char *)&v20, &v32);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a5, (uint64_t)&v32);
  if (v33)
  {
    uint64_t v29 = &v32;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  SCLM::SCLMImpl::~SCLMImpl((SCLM::SCLMImpl *)__p);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  if (*(unsigned char *)(a5 + 24))
  {
    uint64_t v14 = (void (***)(void, std::string *))*a3;
    long long v15 = (std::__shared_weak_count *)a3[1];
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a5, *(std::string **)(a5 + 8), ", ", 2uLL, __p);
    (**v14)(v14, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    size_t v16 = v27;
    uint64_t v17 = *a3;
    long long v18 = (std::__shared_weak_count *)a3[1];
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v30[0] = &unk_270EB1588;
    v30[1] = v17;
    v30[2] = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v30[3] = v30;
    if (v16[6]) {
      uint64_t v19 = v16[4];
    }
    else {
      uint64_t v19 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v32, (uint64_t)v30);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v16 + 2, v19, 0, (uint64_t)&v32, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v32);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v30);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
}

void sub_26381FA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100]((void *)(v31 - 104));
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&a20);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  if (*(unsigned char *)(v29 + 24))
  {
    a19 = v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

#error "26381FFFC: call analysis failed (funcsize=55)"

void SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a2, &v24);
  *(unsigned char *)a4 = 0;
  *(unsigned char *)(a4 + 24) = 0;
  long long v8 = (std::__shared_weak_count *)a1[1];
  uint64_t v22 = *a1;
  uint64_t v23 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = (uint64_t)v24;
  id v10 = v25;
  if (v25)
  {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    id v21 = v10;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    id v21 = 0;
  }
  uint64_t v20 = v9;
  if (!v9) {
    std::terminate();
  }
  uint64_t v11 = (std::__shared_weak_count *)a3[1];
  uint64_t v18 = *a3;
  uint64_t v19 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SCLM::SCLMImpl::SCLMImpl(__p, &v22, &v20, &v18);
  SCLM::SCLMImpl::PerformScript((SCLM::SCLMImpl *)__p, &v29);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a4, (uint64_t)&v29);
  if (v30)
  {
    long long v26 = &v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
  }
  SCLM::SCLMImpl::~SCLMImpl((SCLM::SCLMImpl *)__p);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (*(unsigned char *)(a4 + 24))
  {
    char v12 = (void (***)(void, std::string *))*a2;
    long long v13 = (std::__shared_weak_count *)a2[1];
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a4, *(std::string **)(a4 + 8), ", ", 2uLL, __p);
    (**v12)(v12, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    uint64_t v14 = v24;
    uint64_t v15 = *a2;
    size_t v16 = (std::__shared_weak_count *)a2[1];
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v27[0] = &unk_270EB15D0;
    v27[1] = v15;
    v27[2] = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v27[3] = v27;
    if (v14[6]) {
      uint64_t v17 = v14[4];
    }
    else {
      uint64_t v17 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v29, (uint64_t)v27);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v14 + 2, v17, 0, (uint64_t)&v29, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v29);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v27);
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
}

void sub_2638202F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100]((void *)(v31 - 88));
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&a20);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  if (*(unsigned char *)(v29 + 24))
  {
    a19 = v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

uint64_t SCLM::SCLMImpl::PerformScript@<X0>(SCLM::SCLMImpl *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = (SCLM::DefaultSCLMScriptProvider *)*((void *)this + 10);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SCLM::DefaultSCLMScriptProvider::GetScript(v4, (uint64_t)&v15);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (v17)
  {
    SLAM::Impl::QueryMigrationInfo(this, (uint64_t)v13);
    if (v14)
    {
      uint64_t v7 = *((void *)this + 8);
      uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 9);
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v8 = (void *)caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v15);
      SLAM::Logger::Log(v7, 1, (uint64_t)"PerformScript", 167, "Executing script with ID 0x%llX", *v8);
      if (v6) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
      uint64_t v9 = caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v15);
      uint64_t v10 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)v13);
      (*(void (**)(SCLM::SCLMImpl *, uint64_t, uint64_t))(*(void *)this + 16))(this, v9, v10);
    }
    else
    {
      a2->__r_.__value_.__r.__words[0] = 0;
      a2->__r_.__value_.__l.__size_ = 0;
      a2->__r_.__value_.__r.__words[2] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, (long long *)v13[0].__r_.__value_.__l.__data_, (long long *)v13[0].__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13[0].__r_.__value_.__l.__size_ - v13[0].__r_.__value_.__r.__words[0]) >> 3));
      a2[1].__r_.__value_.__s.__data_[0] = 1;
    }
    caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)v13);
  }
  else
  {
    memset(v13, 0, 24);
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v13, v15, v16, 0xAAAAAAAAAAAAAAABLL * (((char *)v16 - (char *)v15) >> 3));
    *a2 = v13[0];
    char v12 = (void **)v13;
    memset(v13, 0, 24);
    a2[1].__r_.__value_.__s.__data_[0] = 1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  return caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&v15);
}

void sub_263820644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

void SCLM::SCLMImpl::PerformScript(std::string::size_type a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  std::string::size_type v5 = *(void *)a2;
  v18.__r_.__value_.__r.__words[0] = a1;
  v18.__r_.__value_.__l.__size_ = a1;
  v18.__r_.__value_.__r.__words[2] = v5;
  uint64_t v6 = *(unsigned int *)(a3 + 8);
  if (v6 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v22[0] = &v18;
  ((void (*)(long long *__return_ptr, void **, uint64_t))off_270EB1508[v6])(&v24, v22, a3);
  if (v26)
  {
    *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v24;
    a4->__r_.__value_.__r.__words[2] = v25;
    std::string::size_type v25 = 0;
    long long v24 = 0uLL;
    a4[1].__r_.__value_.__s.__data_[0] = 1;
  }
  else if (*(_DWORD *)(a2 + 64) == 1 {
         || (uint64_t v11 = *(const void **)(a3 + 16),
  }
             size_t v12 = *(void *)(a3 + 24) - (void)v11,
             long long v13 = *(const void **)(a2 + 8),
             v12 == *(void *)(a2 + 16) - (void)v13)
         && !memcmp(v11, v13, v12))
  {
    SLAM::Impl::ExecuteScript(a1, (uint64_t *)(a2 + 40), &v18);
    if (v19)
    {
      uint64_t v10 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&v18, "While executing script 0x%llx", v5);
      a4->__r_.__value_.__r.__words[0] = 0;
      a4->__r_.__value_.__l.__size_ = 0;
      a4->__r_.__value_.__r.__words[2] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a4, *v10, v10[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v10[1] - (char *)*v10) >> 3));
      a4[1].__r_.__value_.__s.__data_[0] = 1;
      if (v19)
      {
        v22[0] = &v18;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v22);
      }
    }
    else
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      a4[1].__r_.__value_.__s.__data_[0] = 0;
    }
  }
  else
  {
    ctu::hex();
    int v14 = v23;
    uint64_t v15 = (void **)v22[0];
    ctu::hex();
    size_t v16 = v22;
    if (v14 < 0) {
      size_t v16 = v15;
    }
    if (v21 >= 0) {
      p_p = (const char *)&__p;
    }
    else {
      p_p = (const char *)__p;
    }
    SLAM::Error::Error((std::vector<std::string> *)&v18, "Mismatched signing keys device %s script %s", (const char *)v16, p_p);
    *a4 = v18;
    memset(&v18, 0, sizeof(v18));
    a4[1].__r_.__value_.__s.__data_[0] = 1;
    unint64_t v27 = &v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
    if (v21 < 0) {
      operator delete(__p);
    }
    if (v23 < 0) {
      operator delete(v22[0]);
    }
  }
  if (v26)
  {
    v18.__r_.__value_.__r.__words[0] = (std::string::size_type)&v24;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
}

void sub_2638208B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a30)
  {
    a11 = &a27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  }
  _Unwind_Resume(exception_object);
}

void SCLM::SCLMImpl::~SCLMImpl(SCLM::SCLMImpl *this)
{
  SCLM::SCLMImpl::~SCLMImpl(this);

  JUMPOUT(0x263E6B170);
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_270EB14F0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  SLAM::Impl::~Impl(this);
}

void *SCLM::SCLMImpl::SCLMImpl(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v16 = *a2;
  char v17 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = (std::__shared_weak_count *)a3[1];
  uint64_t v14 = *a3;
  uint64_t v15 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = 0;
  long long v13 = 0;
  uint64_t v8 = *a4;
  uint64_t v9 = (std::__shared_weak_count *)a4[1];
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v12 = v8;
    long long v13 = v9;
  }
  else
  {
    uint64_t v12 = *a4;
  }
  SLAM::Impl::Impl(a1, &v16, &v14, &v12);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  *a1 = &unk_270EB14F0;
  uint64_t v10 = a4[1];
  a1[10] = *a4;
  a1[11] = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_263820A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  SCLM::SCLMImpl::SCLMImpl(v11, v10);
  _Unwind_Resume(a1);
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SCLM::overloaded<SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  SLAM::Error::Error(&v2, "Cannot proceed in OSU state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(unsigned char *)(a1 + 24) = 1;
  std::string v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SCLM::overloaded<SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SCLM::overloaded<SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  SLAM::Error::Error(&v2, "Cannot proceed in SC state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(unsigned char *)(a1 + 24) = 1;
  std::string v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SCLM::overloaded<SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>@<X0>(SLAM::Impl ***a1@<X0>, std::string *a2@<X8>)
{
  std::string v3 = **a1;
  uint64_t v4 = *((void *)v3 + 8);
  std::string::size_type v5 = (std::__shared_weak_count *)*((void *)v3 + 9);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Logger::Log(v4, 1, (uint64_t)"operator()", 114, "Recovering incomplete termination");
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  return SLAM::Impl::PerformTermination(v3, a2);
}

void sub_263820C4C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SCLM::overloaded<SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SCLM::SCLMImpl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v6 = *(SLAM::Impl **)(*a1 + 8);
  uint64_t v5 = *(void *)(*a1 + 16);
  uint64_t v7 = *a2;
  uint64_t v8 = *((void *)v6 + 8);
  uint64_t v9 = (std::__shared_weak_count *)*((void *)v6 + 9);
  if (v5 == *a2)
  {
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v5 = *(void *)(v4 + 16);
    }
    SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 128, "Resuming interrupted script 0x%llx", v5);
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
LABEL_11:
    a3->__r_.__value_.__s.__data_[0] = 0;
    a3[1].__r_.__value_.__s.__data_[0] = 0;
    return;
  }
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v7 = *a2;
    uint64_t v5 = *(void *)(v4 + 16);
  }
  SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 123, "Recover interrupted script 0x%llx before running 0x%llx", v7, v5);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  SLAM::Impl::PerformRecovery(v6, a3);
  if (!a3[1].__r_.__value_.__s.__data_[0]) {
    goto LABEL_11;
  }
}

void sub_263820D50(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1540;
  std::vector<std::string> v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1540;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x263E6B170);
}

void *std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EB1540;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EB1540;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_263820F88(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1588;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB1588;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x263E6B170);
}

void *std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EB1588;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EB1588;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_2638211BC(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB15D0;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_270EB15D0;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x263E6B170);
}

void *std::__function::__func<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EB15D0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EB15D0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0,std::allocator<SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_2638213F0(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_263821498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SCLM::DefaultSCLMScriptProvider::CreateWithPath(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  std::allocate_shared[abi:ne180100]<SCLM::DefaultSCLMScriptProvider,std::allocator<SCLM::DefaultSCLMScriptProvider>,std::string &,void>(a1, &v5);
  uint64_t v4 = v5;
  uint64_t v3 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v4) {
    std::terminate();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v3;
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    *(unsigned char *)(a2 + 24) = 1;
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  else
  {
    *(unsigned char *)(a2 + 24) = 1;
  }
}

void *SCLM::DefaultSCLMScriptProvider::DefaultSCLMScriptProvider(void *a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  SLAM::DefaultScriptProvider::DefaultScriptProvider(a1, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *a1 = &unk_270EB1618;
  return a1;
}

void sub_2638216DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *SCLM::DefaultSCLMScriptProvider::GetScript@<X0>(SCLM::DefaultSCLMScriptProvider *this@<X0>, uint64_t a2@<X8>)
{
  v3[4] = *MEMORY[0x263EF8340];
  v3[0] = &unk_270EB16B8;
  v3[3] = v3;
  SLAM::DefaultScriptProvider::FindScriptMatching((uint64_t)this, (uint64_t)v3, a2);
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v3);
}

void sub_26382177C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void SCLM::DefaultSCLMScriptProvider::InspectScriptsWithBlock(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  v35[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5 >= 7
    && SCLM::DefaultSCLMScriptProvider::InspectScriptsWithBlock(std::function<BOOL ()(ScriptInfo *)>)::plist_header == *(_DWORD *)v6
    && word_26A9A0AAA == *(_WORD *)(v6 + 4))
  {
    SLAM::Error::Error(&v16, "Legacy (plist) SLAM SEFW path is no longer supported");
    memset(&v22, 0, sizeof(v22));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v22, (long long *)v16.__begin_, (long long *)v16.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v16.__end_ - (char *)v16.__begin_) >> 3));
    *a3 = v22;
    memset(&v22, 0, sizeof(v22));
    a3[1].__r_.__value_.__s.__data_[0] = 0;
    *(void *)&long long v30 = &v22;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
    *(void *)&long long v30 = &v16;
    uint64_t v11 = (std::vector<std::string> *)&v30;
LABEL_18:
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v11);
    return;
  }
  v32[0] = *(void *)(a1 + 8);
  v32[1] = v5;
  long long v30 = 0u;
  *(_OWORD *)uint64_t v31 = 0u;
  uint64_t v8 = DERParseSequence((uint64_t)v32, (unsigned __int16)slamSEFWItemSpecLen, (uint64_t)&slamSEFWItemSpec, (unint64_t)&v30, 0x20uLL);
  if (v8)
  {
    SLAM::Error::Unexpected((SLAM::Error *)"Failed to parse top level %d", (uint64_t)&v22, v8);
LABEL_17:
    *a3 = v22;
    memset(&v22, 0, sizeof(v22));
    a3[1].__r_.__value_.__s.__data_[0] = 0;
    v16.__begin_ = &v22;
    uint64_t v11 = &v16;
    goto LABEL_18;
  }
  if (*((void *)&v30 + 1) != 4)
  {
    SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM version length %zu", (uint64_t)&v22, *((void *)&v30 + 1));
    goto LABEL_17;
  }
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  int v29 = 0;
  uint64_t v9 = bswap32(*(_DWORD *)v30);
  int v29 = v9;
  if ((v9 - 1) >= 2)
  {
    SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM SEFW version %u", (uint64_t)&v22, v9);
    *a3 = v22;
    memset(&v22, 0, sizeof(v22));
    a3[1].__r_.__value_.__s.__data_[0] = 0;
    v16.__begin_ = &v22;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  }
  else
  {
    v22.__r_.__value_.__r.__words[0] = 0;
    v22.__r_.__value_.__l.__size_ = (std::string::size_type)&v22;
    v22.__r_.__value_.__r.__words[2] = 0xA812000000;
    char v23 = __Block_byref_object_copy__1;
    long long v24 = __Block_byref_object_dispose__1;
    uint64_t v25 = 0;
    char v26 = 0;
    char v27 = 0;
    v16.__begin_ = 0;
    v16.__end_ = (std::vector<std::string>::pointer)&v16;
    v16.__end_cap_.__value_ = (std::string *)0x5012000000;
    char v17 = __Block_byref_object_copy__5_0;
    std::string v18 = __Block_byref_object_dispose__6_0;
    uint64_t v19 = 0;
    char v20 = 0;
    char v21 = 0;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3321888768;
    v34[2] = ___ZN4SCLM25DefaultSCLMScriptProvider23InspectScriptsWithBlockENSt3__18functionIFbP10ScriptInfoEEE_block_invoke;
    v34[3] = &unk_270EB1640;
    v34[4] = v28;
    void v34[5] = &v16;
    std::__function::__value_func<BOOL ()(ScriptInfo *)>::__value_func[abi:ne180100]((uint64_t)v35, a2);
    v34[6] = &v22;
    uint64_t v10 = DERDecodeSequenceContentWithBlock(v31, (uint64_t)v34);
    if (v10)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode script %d", (uint64_t)&v15, v10);
      *a3 = v15;
      memset(&v15, 0, sizeof(v15));
      a3[1].__r_.__value_.__s.__data_[0] = 0;
      long long v13 = (void **)&v15;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v13);
    }
    else if (v16.__end_[3].__r_.__value_.__s.__data_[0])
    {
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v16.__end_[2].__r_.__value_.__l.__data_, (std::string *)v16.__end_[2].__r_.__value_.__l.__size_, ", ", 2uLL, &__p);
      SLAM::Error::Error((std::string **)&v13, (uint64_t)&__p);
      memset(&v15, 0, sizeof(v15));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v15, (long long *)v13, v14, 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (char *)v13) >> 3));
      *a3 = v15;
      memset(&v15, 0, sizeof(v15));
      a3[1].__r_.__value_.__s.__data_[0] = 0;
      uint64_t v33 = (void ***)&v15;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
      uint64_t v33 = &v13;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      a3->__r_.__value_.__s.__data_[0] = 1;
      a3[1].__r_.__value_.__s.__data_[0] = 1;
    }
    std::__function::__value_func<BOOL ()(ScriptInfo *)>::~__value_func[abi:ne180100](v35);
    _Block_object_dispose(&v16, 8);
    if (v21)
    {
      v15.__r_.__value_.__r.__words[0] = (std::string::size_type)&v20;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
    }
    _Block_object_dispose(&v22, 8);
  }
  _Block_object_dispose(v28, 8);
}

void sub_263821BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,int a34,__int16 a35,char a36,char a37)
{
  *(void *)(v38 - 152) = &a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v38 - 152));
  if (a16 < 0) {
    operator delete(__p);
  }
  std::__function::__value_func<BOOL ()(ScriptInfo *)>::~__value_func[abi:ne180100](v37);
  _Block_object_dispose(&a24, 8);
  if (a33) {
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a20);
  }
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v38 - 240), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v3;
  __n128 result = *(__n128 *)(a2 + 112);
  long long v6 = *(_OWORD *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a1 + 128) = v6;
  *(_OWORD *)(a1 + 144) = v7;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

__n128 __Block_byref_object_copy__5_0(uint64_t a1, __n128 *a2)
{
  *(unsigned char *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  if (a2[4].n128_u8[8])
  {
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
    __n128 result = a2[3];
    *(__n128 *)(a1 + 48) = result;
    *(void *)(a1 + 64) = a2[4].n128_u64[0];
    a2[3].n128_u64[0] = 0;
    a2[3].n128_u64[1] = 0;
    a2[4].n128_u64[0] = 0;
    *(unsigned char *)(a1 + 72) = 1;
  }
  return result;
}

void __Block_byref_object_dispose__6_0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v1 = (void **)(a1 + 48);
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
  }
}

unint64_t *___ZN4SCLM25DefaultSCLMScriptProvider23InspectScriptsWithBlockENSt3__18functionIFbP10ScriptInfoEEE_block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  unint64_t v5 = DERParseSequenceContent((unint64_t *)(a2 + 8), (unsigned __int16)slamScriptItemSpecLen, (uint64_t)&slamScriptItemSpec, (unint64_t)&v25, 0x70uLL);
  if (!v5)
  {
    if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24) >= 2u && *((void *)&v30 + 1) != 4)
    {
      std::string::basic_string[abi:ne180100](__p, (void *)v26, *((size_t *)&v26 + 1));
      if (v23 >= 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      SLAM::Error::Error(&__dst, "Platform Category absent for a script with name %s", (const char *)v7);
      std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>((std::vector<std::string> *)(*(void *)(a1[5] + 8) + 48), &__dst);
      p_dst = &__dst;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dst);
      if (v23 < 0) {
        operator delete(__p[0]);
      }
      *a3 = 1;
    }
    id v8 = [NSString alloc];
    std::string::basic_string[abi:ne180100](&__dst, (void *)v26, *((size_t *)&v26 + 1));
    if (SHIBYTE(__dst.__end_cap_.__value_) >= 0) {
      std::vector<std::string>::pointer begin = (std::vector<std::string>::pointer)&__dst;
    }
    else {
      std::vector<std::string>::pointer begin = __dst.__begin_;
    }
    uint64_t v10 = (void *)[v8 initWithUTF8String:begin];
    if (SHIBYTE(__dst.__end_cap_.__value_) < 0) {
      operator delete(__dst.__begin_);
    }
    if ((void)v31) {
      uint64_t v11 = bswap32(*(_DWORD *)v31);
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [ScriptInfo alloc];
    long long v13 = [(ScriptInfo *)v12 initWithScriptID:bswap64(*(void *)v25) scriptName:v10 apduCount:bswap32(*(_DWORD *)v28) scriptType:v11];
    if (std::function<BOOL ()(ScriptInfo *)>::operator()((uint64_t)(a1 + 7), v13))
    {
      uint64_t v14 = *(void *)(a1[6] + 8);
      long long v16 = v30;
      long long v15 = v31;
      *(_OWORD *)(v14 + 112) = v29;
      *(_OWORD *)(v14 + 128) = v16;
      *(_OWORD *)(v14 + 144) = v15;
      long long v17 = v26;
      long long v19 = v27;
      long long v18 = v28;
      *(_OWORD *)(v14 + 48) = v25;
      *(_OWORD *)(v14 + 64) = v17;
      int v20 = *(unsigned __int8 *)(v14 + 160);
      *(_OWORD *)(v14 + 80) = v19;
      *(_OWORD *)(v14 + 96) = v18;
      if (!v20) {
        *(unsigned char *)(v14 + 160) = 1;
      }
      *a3 = 1;
    }
  }
  return v5;
}

void sub_263821F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  *(void *)(v23 - 56) = v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 56));
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<BOOL ()(ScriptInfo *)>::operator()(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, id *))(*(void *)v3 + 48))(v3, &v6);

  return v4;
}

void sub_263822010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_56c39_ZTSNSt3__18functionIFbP10ScriptInfoEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<BOOL ()(ScriptInfo *)>::__value_func[abi:ne180100](a1 + 56, a2 + 56);
}

void *__destroy_helper_block_ea8_56c39_ZTSNSt3__18functionIFbP10ScriptInfoEEE(uint64_t a1)
{
  return std::__function::__value_func<BOOL ()(ScriptInfo *)>::~__value_func[abi:ne180100]((void *)(a1 + 56));
}

void SCLM::DefaultSCLMScriptProvider::~DefaultSCLMScriptProvider(SCLM::DefaultSCLMScriptProvider *this)
{
  *(void *)this = &unk_270EB12A8;
  long long v2 = (void *)*((void *)this + 1);
  if (v2) {
    munmap(v2, *((void *)this + 2));
  }
  *((void *)this + 2) = 0;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_270EB12A8;
  long long v2 = (void *)*((void *)this + 1);
  if (v2) {
    munmap(v2, *((void *)this + 2));
  }
  *((void *)this + 2) = 0;

  JUMPOUT(0x263E6B170);
}

void *std::allocate_shared[abi:ne180100]<SCLM::DefaultSCLMScriptProvider,std::allocator<SCLM::DefaultSCLMScriptProvider>,std::string &,void>@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x30uLL);
  __n128 result = std::__shared_ptr_emplace<SCLM::DefaultSCLMScriptProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::allocator<SCLM::DefaultSCLMScriptProvider>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_263822150(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SCLM::DefaultSCLMScriptProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::allocator<SCLM::DefaultSCLMScriptProvider>,0>(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270EB1680;
  std::allocator<SCLM::DefaultSCLMScriptProvider>::construct[abi:ne180100]<SCLM::DefaultSCLMScriptProvider,std::string &>((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_2638221C0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SCLM::DefaultSCLMScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1680;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SCLM::DefaultSCLMScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB1680;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6B170);
}

uint64_t std::__shared_ptr_emplace<SCLM::DefaultSCLMScriptProvider>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void std::allocator<SCLM::DefaultSCLMScriptProvider>::construct[abi:ne180100]<SCLM::DefaultSCLMScriptProvider,std::string &>(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  SCLM::DefaultSCLMScriptProvider::DefaultSCLMScriptProvider(a2, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2638222DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0,std::allocator<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::~__func()
{
}

void *std::__function::__func<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0,std::allocator<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_270EB16B8;
  return result;
}

void std::__function::__func<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0,std::allocator<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_270EB16B8;
}

BOOL std::__function::__func<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0,std::allocator<SCLM::DefaultSCLMScriptProvider::GetScript(void)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::operator()(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 8) == 8;
}

uint64_t std::__function::__value_func<BOOL ()(ScriptInfo *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  char v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  id v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            __n128 result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          __n128 result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          long long v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  __n128 result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  char v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  unint64_t v5 = &v4[v3];
  id v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          __n128 result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          __n128 result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  __n128 result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          __n128 result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  void v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    long long v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

void SCLM::SCLMImpl::SCLMImpl(std::__shared_weak_count **a1, std::__shared_weak_count **a2)
{
  unint64_t v3 = *a1;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::hex()
{
  return MEMORY[0x270F97630]();
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x270F98310](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::ios_base::failure *__cdecl std::ios_base::failure::failure(std::ios_base::failure *this, const std::string *__msg, const std::error_code *__ec)
{
  return (std::ios_base::failure *)MEMORY[0x270F98D78](this, __msg, __ec);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}
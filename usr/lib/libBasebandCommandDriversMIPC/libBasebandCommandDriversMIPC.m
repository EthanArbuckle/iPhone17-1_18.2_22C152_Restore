void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t *std::ifstream::basic_ifstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C308] + 64;
  a1[53] = MEMORY[0x263F8C308] + 64;
  v3 = a1 + 2;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  a1[1] = 0;
  v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 2);
  uint64_t v7 = MEMORY[0x263F8C308] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[53] = v2;
  MEMORY[0x263E67290](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_263656834(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x263E67440](v1);
  _Unwind_Resume(a1);
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x263E672A0](a1 + 2);
  std::istream::~istream();
  MEMORY[0x263E67440](a1 + 53);
  return a1;
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  uint64_t v1 = this;
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    this = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  std::locale::~locale(this);
}

BOOL support::fs::getFilteredFiles(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  *__error() = 0;
  if (a1[23] < 0)
  {
    uint64_t v7 = opendir(*(const char **)a1);
    if (v7) {
      goto LABEL_3;
    }
LABEL_78:
    v45 = GetOsLogContext()[1];
    BOOL result = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (result)
    {
      if (a1[23] < 0) {
        a1 = *(const char **)a1;
      }
      v47 = __error();
      v48 = strerror(*v47);
      v58.st_dev = 136315394;
      *(void *)&v58.st_mode = a1;
      WORD2(v58.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v58.st_ino + 6) = (__darwin_ino64_t)v48;
      _os_log_error_impl(&dword_263655000, v45, OS_LOG_TYPE_ERROR, "Error %s (%s)\n", (uint8_t *)&v58, 0x16u);
      return 0;
    }
    return result;
  }
  uint64_t v7 = opendir(a1);
  if (!v7) {
    goto LABEL_78;
  }
LABEL_3:
  v8 = v7;
  v9 = readdir(v7);
  if (v9)
  {
    v51 = a1;
    char v49 = 0;
    while (1)
    {
      d_name = v9->d_name;
      memset(__dst, 170, sizeof(__dst));
      size_t v11 = strlen(v9->d_name);
      if (v11 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v12 = v11;
      if (v11 >= 0x17) {
        break;
      }
      __dst[23] = v11;
      v13 = __dst;
      if (v11) {
        goto LABEL_12;
      }
LABEL_13:
      v13[v12] = 0;
      uint64_t v16 = __dst[23];
      int v17 = __dst[23];
      uint64_t v18 = *(void *)&__dst[8];
      if (__dst[23] >= 0) {
        std::string::size_type v19 = __dst[23];
      }
      else {
        std::string::size_type v19 = *(void *)&__dst[8];
      }
      if (v19 == 2)
      {
        v21 = *(_WORD **)__dst;
        if (__dst[23] >= 0) {
          v21 = __dst;
        }
        if (*v21 == 11822) {
          goto LABEL_73;
        }
      }
      else if (v19 == 1)
      {
        v20 = *(unsigned char **)__dst;
        if (__dst[23] >= 0) {
          v20 = __dst;
        }
        if (*v20 == 46) {
          goto LABEL_73;
        }
      }
      if (a4) {
        goto LABEL_53;
      }
      v22 = v8;
      uint64_t v23 = a4;
      uint64_t v24 = a3;
      v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v58.st_blksize = v25;
      *(timespec *)v58.st_qspare = v25;
      v58.st_birthtimespec = v25;
      *(timespec *)&v58.st_size = v25;
      v58.st_mtimespec = v25;
      v58.st_ctimespec = v25;
      *(timespec *)&v58.st_uid = v25;
      v58.st_atimespec = v25;
      *(timespec *)&v58.st_dev = v25;
      int v26 = v51[23];
      if (v26 >= 0) {
        size_t v27 = *((unsigned __int8 *)v51 + 23);
      }
      else {
        size_t v27 = *((void *)v51 + 1);
      }
      unint64_t v28 = v27 + 1;
      memset(&v52, 170, sizeof(v52));
      if (v27 + 1 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v28 >= 0x17)
      {
        uint64_t v30 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v28 | 7) != 0x17) {
          uint64_t v30 = v28 | 7;
        }
        uint64_t v31 = v30 + 1;
        v29 = (char *)operator new(v30 + 1);
        v52.__r_.__value_.__l.__size_ = v27 + 1;
        v52.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
        v52.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
      }
      else
      {
        memset(&v52, 0, sizeof(v52));
        v29 = (char *)&v52;
        *((unsigned char *)&v52.__r_.__value_.__s + 23) = v27 + 1;
        if (!v27) {
          goto LABEL_40;
        }
      }
      if (v26 >= 0) {
        v32 = v51;
      }
      else {
        v32 = *(const char **)v51;
      }
      memmove(v29, v32, v27);
LABEL_40:
      a3 = v24;
      *(_WORD *)&v29[v27] = 47;
      if (v17 >= 0) {
        v33 = __dst;
      }
      else {
        v33 = *(const std::string::value_type **)__dst;
      }
      v34 = std::string::append(&v52, v33, v19);
      a4 = v23;
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v55[0] = *((void *)&v34->__r_.__value_.__l + 2);
      *(_OWORD *)__p = v35;
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      if (v55[0] >= 0) {
        v36 = __p;
      }
      else {
        v36 = (void **)__p[0];
      }
      lstat((const char *)v36, &v58);
      v8 = v22;
      if (SHIBYTE(v55[0]) < 0)
      {
        operator delete(__p[0]);
        if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_48:
          if ((v58.st_mode & 0xF000) != 0xA000) {
            goto LABEL_52;
          }
          goto LABEL_73;
        }
      }
      else if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_48;
      }
      operator delete(v52.__r_.__value_.__l.__data_);
      if ((v58.st_mode & 0xF000) != 0xA000)
      {
LABEL_52:
        uint64_t v16 = __dst[23];
        uint64_t v18 = *(void *)&__dst[8];
        LOBYTE(v17) = __dst[23];
LABEL_53:
        if ((v17 & 0x80u) == 0) {
          v37 = (std::sub_match<const char *> *)__dst;
        }
        else {
          v37 = *(std::sub_match<const char *> **)__dst;
        }
        if ((v17 & 0x80u) != 0) {
          uint64_t v16 = v18;
        }
        v38 = (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v37 + v16);
        *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v56 = v39;
        v55[6] = 0xAAAAAAAAAAAAAA00;
        v55[3] = 0xAAAAAAAAAAAAAAAALL;
        v55[4] = 0;
        v55[5] = 0;
        v55[7] = 0;
        v55[8] = 0;
        LOBYTE(v56) = 0;
        BYTE8(v56) = 0;
        uint64_t v57 = 0;
        *(_OWORD *)__p = 0u;
        memset(v55, 0, 25);
        *(_OWORD *)&v58.st_birthtimespec.tv_nsec = v39;
        v58.st_ctimespec.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v58.st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        memset(&v58.st_mtimespec, 0, 17);
        memset(&v58.st_ctimespec.tv_nsec, 0, 17);
        LOBYTE(v58.st_size) = 0;
        v58.st_blocks = 0;
        memset(&v58, 0, 41);
        int v40 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a2, v37, (std::sub_match<const char *> *)((char *)v37 + v16), (std::vector<std::csub_match> *)&v58, 4160);
        std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)__p, (uint64_t)v37, v38, (uint64_t *)&v58.st_dev, 0);
        if (*(void *)&v58.st_dev)
        {
          v58.st_ino = *(void *)&v58.st_dev;
          operator delete(*(void **)&v58.st_dev);
        }
        if ((_BYTE)v56) {
          int v41 = v40 ^ 1;
        }
        else {
          int v41 = 1;
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if ((v40 & v41) != 0)
        {
          unint64_t v42 = *(void *)(a3 + 8);
          if (v42 >= *(void *)(a3 + 16))
          {
            v44 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)a3, (uint64_t)__dst);
          }
          else
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              std::string::__init_copy_ctor_external(*(std::string **)(a3 + 8), *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
            }
            else
            {
              long long v43 = *(_OWORD *)__dst;
              *(void *)(v42 + 16) = *(void *)&__dst[16];
              *(_OWORD *)unint64_t v42 = v43;
            }
            v44 = (std::string *)(v42 + 24);
            *(void *)(a3 + 8) = v42 + 24;
          }
          *(void *)(a3 + 8) = v44;
          char v49 = 1;
        }
      }
LABEL_73:
      if ((__dst[23] & 0x80000000) != 0) {
        operator delete(*(void **)__dst);
      }
      v9 = readdir(v8);
      if (!v9) {
        goto LABEL_83;
      }
    }
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    v13 = operator new(v14 + 1);
    *(void *)&__dst[8] = v12;
    *(void *)&__dst[16] = v15 | 0x8000000000000000;
    *(void *)__dst = v13;
LABEL_12:
    memmove(v13, d_name, v12);
    goto LABEL_13;
  }
  char v49 = 0;
LABEL_83:
  closedir(v8);
  return v49 & 1;
}

void sub_263656F54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49)
{
  *(void *)(v49 + 8) = v50;
  if (a30 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *support::fs::readCurrentLine@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::istream::tellg();
  uint64_t v4 = v10;
  if (v10 >= 2)
  {
    do
    {
      std::istream::seekg();
      if (std::istream::peek() == 10) {
        break;
      }
    }
    while (v4-- > 1);
  }
  std::istream::seekg();
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  v6 = std::locale::use_facet(v9, MEMORY[0x263F8C108]);
  unsigned __int8 v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(v9);
  return std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a1, (uint64_t)a2, v7);
}

void sub_263657118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_26365712C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0)
  {
    operator delete(*(void **)v1);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D2FB8, MEMORY[0x263F8C060]);
}

void sub_2636571B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
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
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

std::string *std::vector<std::string>::__push_back_slow_path<std::string const&>(char **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * ((a1[2] - v3) >> 3) > v6) {
    unint64_t v6 = 0x5555555555555556 * ((a1[2] - v3) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v9 = (char *)operator new(24 * v8);
  }
  else
  {
    v9 = 0;
  }
  uint64_t v10 = (std::string *)&v9[24 * v5];
  uint64_t v16 = v10;
  int v17 = v10;
  uint64_t v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    uint64_t v3 = *a1;
    uint64_t v4 = a1[1];
    uint64_t v10 = v16;
    uint64_t v11 = v17 + 1;
    if (v4 == *a1)
    {
LABEL_17:
      v13 = v3;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v10->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
    uint64_t v11 = v10 + 1;
    if (v4 == v3) {
      goto LABEL_17;
    }
  }
  do
  {
    long long v12 = *(_OWORD *)(v4 - 24);
    v10[-1].__r_.__value_.__r.__words[2] = *((void *)v4 - 1);
    *(_OWORD *)&v10[-1].__r_.__value_.__l.__data_ = v12;
    --v10;
    *((void *)v4 - 2) = 0;
    *((void *)v4 - 1) = 0;
    *((void *)v4 - 3) = 0;
    v4 -= 24;
  }
  while (v4 != v3);
  v13 = *a1;
  uint64_t v3 = a1[1];
LABEL_18:
  *a1 = (char *)v10;
  a1[1] = (char *)v11;
  a1[2] = v18;
  if (v3 != v13)
  {
    uint64_t v14 = (void **)(v3 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0) {
        operator delete(*v14);
      }
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    uint64_t v3 = v13;
  }
  if (v3) {
    operator delete(v3);
  }
  return v11;
}

void sub_2636574A8(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D2FC0, MEMORY[0x263F8C068]);
}

void sub_26365759C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void *std::string::__assign_no_alias<true>(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    unint64_t v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unint64_t v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      unint64_t v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v10 = v7 - 1;
  uint64_t v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1, char *a2, int a3)
{
  unint64_t v6 = (const std::locale *)MEMORY[0x263E673F0]();
  *(void *)(a1 + 8) = std::locale::use_facet(v6, MEMORY[0x263F8C108]);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x263F8C130]);
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  size_t v7 = strlen(a2);
  if (std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(a1, a2, &a2[v7]) != &a2[v7]) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  }
  return a1;
}

void sub_263657910(_Unwind_Exception *a1)
{
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v2);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_26365792C(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(uint64_t a1, char *a2, char *a3)
{
  unint64_t v6 = operator new(8uLL);
  void *v6 = &unk_270EA2880;
  size_t v7 = operator new(0x10uLL);
  v7[1] = v6;
  size_t v8 = operator new(0x20uLL);
  void *v8 = &unk_270EA28D8;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  size_t v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    uint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 56) = v10;
    unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v11 <= 0x3F) {
      goto LABEL_4;
    }
LABEL_9:
    if (v11 != 64)
    {
      if (v11 == 128)
      {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(a1, a2, a3);
      }
      if (v11 == 256)
      {
        return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
      }
LABEL_31:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
    }
LABEL_15:
    return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 56) = v10;
  unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v11 > 0x3F) {
    goto LABEL_9;
  }
LABEL_4:
  if (v11)
  {
    if (v11 == 16)
    {
      return std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, a2, a3);
    }
    if (v11 != 32) {
      goto LABEL_31;
    }
    goto LABEL_15;
  }
  unint64_t v13 = a2;
  while (1)
  {
    uint64_t v14 = (std::basic_regex<char> *)v13;
    unint64_t v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v13, a3);
    if (v13 == (char *)v14) {
      break;
    }
LABEL_19:
    if (v13 == (char *)v14) {
      goto LABEL_29;
    }
  }
  uint64_t v15 = *(std::__owns_one_state<char> **)(a1 + 56);
  int v16 = *(_DWORD *)(a1 + 28);
  int v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v14, (std::basic_regex<char> *)a3);
  if (v17 != (unsigned __int8 *)v14)
  {
    unint64_t v13 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, (std::basic_regex<char> *)v17, (std::basic_regex<char> *)a3, v15, (v16 + 1), (*(_DWORD *)(a1 + 28) + 1));
    goto LABEL_19;
  }
LABEL_29:
  if (v14 == (std::basic_regex<char> *)a2)
  {
    uint64_t v18 = operator new(0x10uLL);
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(v19 + 8);
    v18[1] = v20;
    *(void *)(v19 + 8) = v18;
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    goto LABEL_32;
  }
LABEL_33:
  if (v14 != (std::basic_regex<char> *)a3)
  {
    if (LOBYTE(v14->__traits_.__loc_.__locale_) == 124)
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = (std::basic_regex<char> *)((char *)&v14->__traits_.__loc_.__locale_ + 1);
      uint64_t v24 = (char *)&v14->__traits_.__loc_.__locale_ + 1;
      while (1)
      {
        uint64_t v14 = (std::basic_regex<char> *)v24;
        uint64_t v24 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v24, a3);
        if (v24 == (char *)v14)
        {
          timespec v25 = *(std::__owns_one_state<char> **)(a1 + 56);
          int v26 = *(_DWORD *)(a1 + 28);
          size_t v27 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v14, (std::basic_regex<char> *)a3);
          if (v27 == (unsigned __int8 *)v14)
          {
LABEL_40:
            if (v14 == v23)
            {
              unint64_t v28 = operator new(0x10uLL);
              uint64_t v29 = *(void *)(a1 + 56);
              uint64_t v30 = *(void *)(v29 + 8);
              v28[1] = v30;
              *(void *)(v29 + 8) = v28;
              *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
            }
            uint64_t v31 = operator new(0x18uLL);
            uint64_t v32 = *(void *)(v22 + 8);
            v31[1] = *(void *)(v10 + 8);
            v31[2] = v32;
            *uint64_t v31 = &unk_270EA2E98;
            *(void *)(v10 + 8) = v31;
            *(void *)(v22 + 8) = 0;
            v33 = operator new(0x10uLL);
            uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
            v33[1] = v34;
            *(void *)(v22 + 8) = v33;
            *(void *)(*(void *)(a1 + 56) + 8) = 0;
            long long v35 = operator new(0x10uLL);
            uint64_t v36 = *(void *)(v22 + 8);
            *long long v35 = &unk_270EA2EE0;
            v35[1] = v36;
            *(void *)(*(void *)(a1 + 56) + 8) = v35;
            uint64_t v21 = *(void *)(v22 + 8);
LABEL_32:
            *(void *)(a1 + 56) = v21;
            goto LABEL_33;
          }
          uint64_t v24 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, (std::basic_regex<char> *)v27, (std::basic_regex<char> *)a3, v25, (v26 + 1), (*(_DWORD *)(a1 + 28) + 1));
        }
        if (v24 == (char *)v14) {
          goto LABEL_40;
        }
      }
    }
    return (char *)v14;
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263657E3C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  size_t v7 = a2;
  do
  {
    size_t v8 = (std::basic_regex<char> *)v7;
    size_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v7, a3);
    if (v7 != (char *)v8) {
      continue;
    }
    size_t v9 = a1->__end_;
    unsigned int marked_count = a1->__marked_count_;
    unsigned int v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, v8);
    if (v11 == v8) {
      break;
    }
    size_t v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
  }
  while (v7 != (char *)v8);
  if (v8 == (std::basic_regex<char> *)a2)
  {
    long long v12 = (std::__node<char> *)operator new(0x10uLL);
    unint64_t v13 = a1->__end_;
    first = v13->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)first;
    v13->__first_ = v12;
    uint64_t v15 = (std::__owns_one_state<char> *)a1->__end_->__first_;
    goto LABEL_8;
  }
LABEL_9:
  if (v8 != (std::basic_regex<char> *)a3)
  {
    if (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
    {
      int v16 = a1->__end_;
      int v17 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
      uint64_t v18 = (char *)&v8->__traits_.__loc_.__locale_ + 1;
      while (1)
      {
        size_t v8 = (std::basic_regex<char> *)v18;
        uint64_t v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v18, a3);
        if (v18 == (char *)v8)
        {
          uint64_t v19 = a1->__end_;
          unsigned int v20 = a1->__marked_count_;
          uint64_t v21 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, v8);
          if (v21 == v8)
          {
LABEL_16:
            if (v8 == v17)
            {
              uint64_t v22 = (std::__node<char> *)operator new(0x10uLL);
              uint64_t v23 = a1->__end_;
              uint64_t v24 = v23->__first_;
              v22[1].__vftable = (std::__node<char>_vtbl *)v24;
              v23->__first_ = v22;
              a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
            }
            timespec v25 = (std::__node<char> *)operator new(0x18uLL);
            int v26 = v16->__first_;
            v25[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
            v25[2].__vftable = (std::__node<char>_vtbl *)v26;
            v25->__vftable = (std::__node<char>_vtbl *)&unk_270EA2E98;
            end->__first_ = v25;
            v16->__first_ = 0;
            size_t v27 = (std::__node<char> *)operator new(0x10uLL);
            unint64_t v28 = a1->__end_->__first_;
            v27[1].__vftable = (std::__node<char>_vtbl *)v28;
            v16->__first_ = v27;
            a1->__end_->__first_ = 0;
            uint64_t v29 = (std::__node<char> *)operator new(0x10uLL);
            uint64_t v30 = v16->__first_;
            v29->__vftable = (std::__node<char>_vtbl *)&unk_270EA2EE0;
            v29[1].__vftable = (std::__node<char>_vtbl *)v30;
            a1->__end_->__first_ = v29;
            uint64_t v15 = (std::__owns_one_state<char> *)v16->__first_;
LABEL_8:
            a1->__end_ = v15;
            goto LABEL_9;
          }
          uint64_t v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v21, (std::basic_regex<char> *)a3, v19, v20 + 1, a1->__marked_count_ + 1);
        }
        if (v18 == (char *)v8) {
          goto LABEL_16;
        }
      }
    }
    return (char *)v8;
  }
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = (std::basic_regex<char> *)a2;
  if (a2 == a3) {
    return a2;
  }
  if (*a2 == 94)
  {
    unint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    void *v6 = &unk_270EA29D0;
    v6[1] = v9;
    *((unsigned char *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      uint64_t v10 = v3;
      unsigned int v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 28);
      unint64_t v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, (uint64_t)v10, a3);
      if (v13 != (char *)v10)
      {
        uint64_t v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v3 != v10) {
          continue;
        }
      }
      if ((char *)&v10->__traits_.__loc_.__locale_ + 1 != a3 || LOBYTE(v10->__traits_.__loc_.__locale_) != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      uint64_t v14 = operator new(0x18uLL);
      BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(v16 + 8);
      *uint64_t v14 = &unk_270EA2A18;
      v14[1] = v17;
      *((unsigned char *)v14 + 16) = v15;
      *(void *)(v16 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v7 == a2) {
    goto LABEL_12;
  }
  do
  {
    uint64_t v8 = v7;
    BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2) {
LABEL_12:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == a3) {
    return a3;
  }
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1), a3);
    if (v11 == (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1)) {
      goto LABEL_12;
    }
    do
    {
      uint64_t v8 = v11;
      unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, v11, a3);
    }
    while (v11 != v8);
    if (v8 == v10) {
      goto LABEL_12;
    }
    int v12 = operator new(0x18uLL);
    uint64_t v13 = *(void *)(v9 + 8);
    v12[1] = *(void *)(v6 + 8);
    v12[2] = v13;
    *int v12 = &unk_270EA2E98;
    *(void *)(v6 + 8) = v12;
    *(void *)(v9 + 8) = 0;
    uint64_t v14 = operator new(0x10uLL);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    v14[1] = v15;
    *(void *)(v9 + 8) = v14;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v16 = operator new(0x10uLL);
    uint64_t v17 = *(void *)(v9 + 8);
    *uint64_t v16 = &unk_270EA2EE0;
    v16[1] = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = v16;
    *(void *)(a1 + 56) = *(void *)(v9 + 8);
    if (v8 == a3) {
      return a3;
    }
  }
  return v8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v10 = operator new(0x10uLL);
    uint64_t v11 = *(void *)(v6 + 8);
    v10[1] = v11;
    *(void *)(v6 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    if (v9 == a3) {
      return a3;
    }
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, __s, v8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    if (v9 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    uint64_t v21 = (char *)memchr(v9, 10, a3 - v9);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v9)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, v9, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    *uint64_t v15 = &unk_270EA2E98;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    *uint64_t v19 = &unk_270EA2EE0;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      uint64_t v9 = v22;
    }
    else {
      uint64_t v9 = v22 + 1;
    }
  }
  while (v9 != a3);
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(uint64_t a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v10 = operator new(0x10uLL);
    uint64_t v11 = *(void *)(v6 + 8);
    v10[1] = v11;
    *(void *)(v6 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    }
    if (v9 == a3) {
      return a3;
    }
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, __s, v8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    }
    if (v9 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    uint64_t v21 = (std::basic_regex<char> *)memchr(v9, 10, (char *)a3 - (char *)v9);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v9)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, v9, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    *uint64_t v15 = &unk_270EA2E98;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    *uint64_t v19 = &unk_270EA2EE0;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      uint64_t v9 = v22;
    }
    else {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&v22->__traits_.__loc_.__locale_ + 1);
    }
  }
  while (v9 != a3);
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263658820(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000263677BB1) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000263677BB1 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000263677BB1)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000263677BB1 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
}

{
  std::__node<char> *first;
  uint64_t vars8;

  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }

  operator delete(this);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        int v14 = a2[1];
        if (v14 == 66)
        {
          uint64_t v15 = (char *)operator new(0x30uLL);
          uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v15 = &unk_270EA2A60;
          *((void *)v15 + 1) = v23;
          std::locale::locale((std::locale *)v15 + 2, (const std::locale *)a1);
          *(_OWORD *)(v15 + 24) = *(_OWORD *)(a1 + 8);
          v15[40] = 1;
        }
        else
        {
          if (v14 != 98) {
            return a2;
          }
          uint64_t v15 = (char *)operator new(0x30uLL);
          uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v15 = &unk_270EA2A60;
          *((void *)v15 + 1) = v16;
          std::locale::locale((std::locale *)v15 + 2, (const std::locale *)a1);
          *(_OWORD *)(v15 + 24) = *(_OWORD *)(a1 + 8);
          v15[40] = 0;
        }
        *(void *)(*(void *)(a1 + 56) + 8) = v15;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return a2 + 2;
      }
      return a2;
    }
    if (v6 != 94) {
      return a2;
    }
    uint64_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    v10[1] = *(void *)(v12 + 8);
    uint64_t v13 = &unk_270EA29D0;
LABEL_14:
    *uint64_t v10 = v13;
    *((unsigned char *)v10 + 16) = v11;
    *(void *)(v12 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    return a2 + 1;
  }
  if (v6 == 36)
  {
    uint64_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    v10[1] = *(void *)(v12 + 8);
    uint64_t v13 = &unk_270EA2A18;
    goto LABEL_14;
  }
  BOOL v8 = v6 == 40;
  BOOL v7 = a2 + 1;
  BOOL v8 = !v8 || v7 == a3;
  if (v8) {
    return a2;
  }
  BOOL v8 = *v7 == 63;
  uint64_t v17 = a2 + 2;
  if (!v8 || v17 == a3) {
    return a2;
  }
  int v19 = *v17;
  if (v19 == 33)
  {
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v26.__loop_count_ = v24;
    *(_OWORD *)&v26.__start_.__cntrl_ = v24;
    *(_OWORD *)&v26.__traits_.__loc_.__locale_ = v24;
    *(_OWORD *)&v26.__traits_.__col_ = v24;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v26);
    v26.__flags_ = *(_DWORD *)(a1 + 24);
    uint64_t v21 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v26, a2 + 3, a3);
    unsigned int marked_count = v26.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v26, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v21 == a3 || *v21 != 41) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    goto LABEL_32;
  }
  if (v19 != 61) {
    return a2;
  }
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v26.__loop_count_ = v20;
  *(_OWORD *)&v26.__start_.__cntrl_ = v20;
  *(_OWORD *)&v26.__traits_.__loc_.__locale_ = v20;
  *(_OWORD *)&v26.__traits_.__col_ = v20;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v26);
  v26.__flags_ = *(_DWORD *)(a1 + 24);
  uint64_t v21 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v26, a2 + 3, a3);
  unsigned int v22 = v26.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v26, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v22;
  if (v21 == a3 || *v21 != 41) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
LABEL_32:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v26.__traits_.__loc_);
  return v21 + 1;
}

void sub_263658E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_263658E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_263658E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_263658E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    switch(LOBYTE(a2->__traits_.__loc_.__locale_))
    {
      case '(':
        if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1) == a3) {
          goto LABEL_32;
        }
        if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 2) != a3
          && BYTE1(a2->__traits_.__loc_.__locale_) == 63
          && BYTE2(a2->__traits_.__loc_.__locale_) == 58)
        {
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, (char *)&a2->__traits_.__loc_.__locale_ + 3, (char *)a3);
          if (v7 == (char *)a3) {
            goto LABEL_32;
          }
          uint64_t v3 = (std::basic_regex<char> *)v7;
          if (*v7 != 41) {
            goto LABEL_32;
          }
        }
        else
        {
          if ((this->__flags_ & 2) != 0)
          {
            unsigned int marked_count = this->__marked_count_;
          }
          else
          {
            uint64_t v12 = (std::__node<char> *)operator new(0x18uLL);
            unsigned int marked_count = this->__marked_count_ + 1;
            this->__marked_count_ = marked_count;
            std::__split_buffer<std::string>::pointer end = this->__end_;
            first = end->__first_;
            v12->__vftable = (std::__node<char>_vtbl *)&unk_270EA2D30;
            v12[1].__vftable = (std::__node<char>_vtbl *)first;
            LODWORD(v12[2].__vftable) = marked_count;
            end->__first_ = v12;
            this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
          }
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          uint64_t v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, (char *)&v3->__traits_.__loc_.__locale_ + 1, (char *)a3);
          if (v16 == (char *)a3 || (uint64_t v3 = (std::basic_regex<char> *)v16, *v16 != 41)) {
LABEL_32:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
          if ((this->__flags_ & 2) == 0)
          {
            uint64_t v17 = (std::__node<char> *)operator new(0x18uLL);
            uint64_t v18 = this->__end_;
            int v19 = v18->__first_;
            v17->__vftable = (std::__node<char>_vtbl *)&unk_270EA2D78;
            v17[1].__vftable = (std::__node<char>_vtbl *)v19;
            LODWORD(v17[2].__vftable) = marked_count;
            v18->__first_ = v17;
            this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
          }
        }
        --*p_open_count;
LABEL_29:
        uint64_t v3 = (std::basic_regex<char> *)((char *)v3 + 1);
        break;
      case ')':
      case ',':
      case '-':
      case '/':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ':':
      case ';':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'M':
      case 'N':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
        goto LABEL_20;
      case '*':
      case '+':
      case '?':
        goto LABEL_31;
      case '.':
        BOOL v8 = (std::__node<char> *)operator new(0x10uLL);
        uint64_t v9 = this->__end_;
        uint64_t v10 = v9->__first_;
        v8->__vftable = (std::__node<char>_vtbl *)&unk_270EA2AF0;
        v8[1].__vftable = (std::__node<char>_vtbl *)v10;
        v9->__first_ = v8;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        goto LABEL_29;
      case '[':
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, (char *)a2, (char *)a3);
      case '\\':
        return std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(this, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      default:
        if (LOBYTE(a2->__traits_.__loc_.__locale_) == 123) {
LABEL_31:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
LABEL_20:
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
    }
  }
  return (unsigned __int8 *)v3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      BOOL v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v8 == a3;
      }
      if (!v20 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        uint64_t v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::__split_buffer<std::string>::pointer begin = __mexp_begin;
        __mexp_std::__split_buffer<std::string>::pointer end = __mexp_end;
        size_t v10 = 0;
        goto LABEL_35;
      }
      __mexp_std::__split_buffer<std::string>::pointer begin = __mexp_begin;
      __mexp_std::__split_buffer<std::string>::pointer end = __mexp_end;
      size_t v24 = 0;
      goto LABEL_44;
    }
    if (locale_low == 43)
    {
      BOOL v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        uint64_t v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::__split_buffer<std::string>::pointer begin = __mexp_begin;
        __mexp_std::__split_buffer<std::string>::pointer end = __mexp_end;
        size_t v10 = 1;
LABEL_35:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v10, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v9;
      }
      __mexp_std::__split_buffer<std::string>::pointer begin = __mexp_begin;
      __mexp_std::__split_buffer<std::string>::pointer end = __mexp_end;
      size_t v24 = 1;
      goto LABEL_44;
    }
    return this;
  }
  if (locale_low == 63)
  {
    uint64_t v21 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v21 == a3;
    }
    if (v22 || LOBYTE(v21->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v21;
    }
    else
    {
      uint64_t v23 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v23;
    }
  }
  else
  {
    if (locale_low != 123) {
      return this;
    }
    BOOL v11 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
      goto LABEL_71;
    }
    int v12 = *v11;
    if ((v12 & 0xF8) != 0x30 && (v12 & 0xFE) != 0x38) {
      goto LABEL_71;
    }
    int v13 = v12 - 48;
    int v14 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_19:
      int v14 = (char *)a3;
    }
    else
    {
      while (1)
      {
        int v15 = *v14;
        if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38) {
          break;
        }
        if (v13 >= 214748364) {
          goto LABEL_71;
        }
        int v13 = v15 + 10 * v13 - 48;
        if (++v14 == (char *)a3) {
          goto LABEL_19;
        }
      }
    }
    if (v14 == v11) {
      goto LABEL_71;
    }
    if (v14 == (char *)a3) {
      goto LABEL_72;
    }
    int v16 = *v14;
    if (v16 != 44)
    {
      if (v16 == 125)
      {
        uint64_t v17 = (std::basic_regex<char> *)(v14 + 1);
        if (v6 || v17 == a3 || LOBYTE(v17->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 1);
          return v17;
        }
        else
        {
          uint64_t v18 = (unsigned __int8 *)(v14 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v18;
        }
      }
LABEL_71:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    timespec v25 = (std::basic_regex<char> *)(v14 + 1);
    if (v14 + 1 == (char *)a3) {
      goto LABEL_71;
    }
    int v26 = LOBYTE(v25->__traits_.__loc_.__locale_);
    if (v26 == 125)
    {
      BOOL v8 = (std::basic_regex<char> *)(v14 + 2);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        size_t v10 = v13;
        uint64_t v9 = v14 + 3;
        __mexp_std::__split_buffer<std::string>::pointer begin = __mexp_begin;
        __mexp_std::__split_buffer<std::string>::pointer end = __mexp_end;
        goto LABEL_35;
      }
      size_t v24 = v13;
      __mexp_std::__split_buffer<std::string>::pointer begin = __mexp_begin;
      __mexp_std::__split_buffer<std::string>::pointer end = __mexp_end;
LABEL_44:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v24, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v8;
    }
    if ((v26 & 0xF8) != 0x30 && (v26 & 0xFE) != 0x38) {
      goto LABEL_72;
    }
    int v27 = v26 - 48;
    unint64_t v28 = (std::basic_regex<char> *)(v14 + 2);
    if (v28 == a3)
    {
LABEL_60:
      unint64_t v28 = a3;
    }
    else
    {
      while (1)
      {
        int v29 = LOBYTE(v28->__traits_.__loc_.__locale_);
        if ((v29 & 0xF8) != 0x30 && (v29 & 0xFE) != 0x38) {
          break;
        }
        if (v27 >= 214748364) {
          goto LABEL_71;
        }
        int v27 = v29 + 10 * v27 - 48;
        unint64_t v28 = (std::basic_regex<char> *)((char *)v28 + 1);
        if (v28 == a3) {
          goto LABEL_60;
        }
      }
    }
    if (v28 == v25 || v28 == a3 || LOBYTE(v28->__traits_.__loc_.__locale_) != 125) {
LABEL_72:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v27 < v13) {
      goto LABEL_71;
    }
    uint64_t v30 = (std::basic_regex<char> *)((char *)&v28->__traits_.__loc_.__locale_ + 1);
    if (v6 || v30 == a3 || LOBYTE(v30->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 1);
      return v30;
    }
    else
    {
      uint64_t v31 = (char *)&v28->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v31;
    }
  }
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = (const std::locale *)MEMORY[0x263E673F0]();
  *(void *)(a1 + 8) = std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x263F8C130]);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  return a1;
}

void sub_263659674(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  BOOL v8 = (char *)operator new(0x58uLL);
  first = this->__end_->__first_;
  *(void *)BOOL v8 = &unk_270EA2AA8;
  *((void *)v8 + 1) = first;
  std::locale::locale((std::locale *)v8 + 2, &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *((void *)v8 + 7) = a2->__start_.__ptr_;
  *((void *)v8 + 8) = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *((void *)v8 + 9) = a2->__end_;
  *((_DWORD *)v8 + 20) = a4;
  v8[84] = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365978C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 92))
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
LABEL_11:
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
    return result;
  }
  if (*(void *)(a2 + 16) == *(void *)(a2 + 8) && (*(unsigned char *)(a2 + 88) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  *(_DWORD *)a2 = -993;
  *(void *)(a2 + 80) = 0;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((v3 = *v2, v3 != 13) ? (BOOL v4 = v3 == 10) : (BOOL v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2A60;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2A60;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_19;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 != v3)
  {
    if (v4 == v2)
    {
      int v5 = *(_DWORD *)(a2 + 88);
      if ((v5 & 0x80) == 0)
      {
        if ((v5 & 4) == 0)
        {
          uint64_t v6 = *v2;
          if (v6 == 95) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    uint64_t v7 = *(v4 - 1);
    uint64_t v8 = *v4;
    if (v7 == 95
      || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
    {
      int v9 = 1;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    else
    {
      int v9 = 0;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
    {
      if (*(unsigned char *)(result + 40) == (v9 != 0)) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
LABEL_24:
    if (*(unsigned char *)(result + 40) != (v9 != 1)) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  if ((*(unsigned char *)(a2 + 88) & 8) == 0)
  {
    uint64_t v6 = *(v3 - 1);
    if (v6 == 95) {
      goto LABEL_17;
    }
LABEL_15:
    if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
    {
LABEL_17:
      if (*(unsigned char *)(result + 40) != 1) {
        goto LABEL_27;
      }
LABEL_20:
      *(_DWORD *)a2 = -993;
      *(void *)(a2 + 80) = 0;
      return result;
    }
  }
LABEL_19:
  if (!*(unsigned char *)(result + 40)) {
    goto LABEL_20;
  }
LABEL_27:
  uint64_t v10 = *(void *)(result + 8);
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = v10;
  return result;
}

std::locale *std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2AA8;
  int v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    std::locale::~locale(v2);
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      return a1;
    }
    goto LABEL_4;
  }
  std::locale::~locale(a1 + 2);
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2AA8;
  int v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (!locale || atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    std::locale::~locale(a1 + 2);
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
  std::__shared_weak_count::__release_weak(locale);
  std::locale::~locale(v2);
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
LABEL_5:

  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v22 = 0xAAAAAAAAAAAAAA00;
  long long v24 = v4;
  uint64_t v21 = 0;
  long long v23 = 0uLL;
  LOBYTE(v24) = 0;
  BYTE8(v24) = 0;
  uint64_t v25 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v5 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)&long long v19 = *(void *)(a2 + 24);
  *((void *)&v19 + 1) = v19;
  LOBYTE(v20) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v5, (std::vector<std::csub_match>::const_reference)&v19);
  *((void *)&v20 + 1) = v6;
  uint64_t v21 = v6;
  LOBYTE(v22) = 0;
  long long v23 = v19;
  LOBYTE(v24) = v20;
  uint64_t v25 = v6;
  BYTE8(v24) = 1;
  uint64_t v7 = *(const char **)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v8 = v7 == *(const char **)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v7, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    std::__split_buffer<std::string>::pointer begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  std::__split_buffer<std::string>::pointer begin = __p.__begin_;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!begin) {
      return;
    }
    goto LABEL_14;
  }
  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1;
  do
  {
    int v16 = &begin[v15];
    uint64_t v17 = v14 + 24 * (v13 + v12);
    *(std::pair<const char *, const char *> *)uint64_t v17 = v16->std::pair<const char *, const char *>;
    *(unsigned char *)(v17 + 16) = v16->matched;
    unint64_t v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_26365A054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  v48 = 0;
  uint64_t v49 = 0;
  unint64_t v50 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    return 0;
  }
  __x.second = a3;
  *(void *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.first = a3;
  *(_DWORD *)v46 = 0;
  memset(&v46[8], 0, 85);
  uint64_t v49 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v48, (uint64_t)v46);
  if (*(void *)&v46[56])
  {
    *(void *)&v46[64] = *(void *)&v46[56];
    operator delete(*(void **)&v46[56]);
  }
  if (*(void *)&v46[32])
  {
    *(void *)&v46[40] = *(void *)&v46[32];
    operator delete(*(void **)&v46[32]);
  }
  int v13 = v49;
  *((_DWORD *)v49 - 24) = 0;
  *((void *)v13 - 11) = a2;
  *((void *)v13 - 10) = a2;
  *((void *)v13 - 9) = a3;
  uint64_t v14 = *((void *)v13 - 8);
  unint64_t v15 = *(unsigned int *)(a1 + 28);
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v13 - 7) - v14) >> 3);
  if (v15 <= v16)
  {
    if (v15 < v16) {
      *((void *)v13 - 7) = v14 + 24 * v15;
    }
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v13 - 64), v15 - v16, &__x);
    int v13 = v49;
  }
  uint64_t v18 = *((void *)v13 - 5);
  unint64_t v19 = *(unsigned int *)(a1 + 32);
  unint64_t v20 = (*((void *)v13 - 4) - v18) >> 4;
  if (v19 <= v20)
  {
    if (v19 < v20) {
      *((void *)v13 - 4) = v18 + 16 * v19;
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v13 - 40), v19 - v20);
    int v13 = v49;
  }
  *((void *)v13 - 2) = v6;
  *((_DWORD *)v13 - 2) = a5;
  *(v13 - 4) = a6;
  unsigned int v21 = 1;
  while (2)
  {
    if ((v21 & 0xFFF) == 0 && (int)(v21 >> 12) >= (int)a3 - (int)a2) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    uint64_t v23 = *((void *)v13 - 2);
    if (v23) {
      (*(void (**)(uint64_t, char *))(*(void *)v23 + 16))(v23, v13 - 96);
    }
    switch(*((_DWORD *)v13 - 24))
    {
      case 0xFFFFFC18:
        long long v24 = (const char *)*((void *)v13 - 10);
        if ((a5 & 0x20) != 0 && v24 == a2 || (a5 & 0x1000) != 0 && v24 != a3) {
          goto LABEL_27;
        }
        uint64_t v37 = *a4;
        *(void *)uint64_t v37 = a2;
        *(void *)(v37 + 8) = v24;
        *(unsigned char *)(v37 + 16) = 1;
        uint64_t v38 = *((void *)v13 - 8);
        uint64_t v39 = *((void *)v13 - 7) - v38;
        if (v39)
        {
          unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 3);
          int v41 = (unsigned char *)(v38 + 16);
          unsigned int v42 = 1;
          do
          {
            uint64_t v43 = v37 + 24 * v42;
            *(_OWORD *)uint64_t v43 = *((_OWORD *)v41 - 1);
            char v44 = *v41;
            v41 += 24;
            *(unsigned char *)(v43 + 16) = v44;
          }
          while (v40 > v42++);
        }
        uint64_t v17 = 1;
        unint64_t v22 = v48;
        if (!v48) {
          return v17;
        }
        goto LABEL_38;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_17;
      case 0xFFFFFC1F:
LABEL_27:
        uint64_t v25 = v49;
        int v26 = (void *)*((void *)v49 - 5);
        if (v26)
        {
          *((void *)v49 - 4) = v26;
          operator delete(v26);
        }
        int v27 = (void *)*((void *)v25 - 8);
        if (v27)
        {
          *((void *)v25 - 7) = v27;
          operator delete(v27);
        }
        uint64_t v49 = v25 - 96;
        goto LABEL_17;
      case 0xFFFFFC20:
        *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v46[64] = v28;
        *(_OWORD *)&v46[80] = v28;
        *(_OWORD *)&v46[32] = v28;
        *(_OWORD *)&v46[48] = v28;
        *(_OWORD *)v46 = v28;
        *(_OWORD *)&v46[16] = v28;
        std::__state<char>::__state((uint64_t)v46, (long long *)v13 - 6);
        (*(void (**)(void, uint64_t, char *))(**((void **)v13 - 2) + 24))(*((void *)v13 - 2), 1, v13 - 96);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v46[80] + 24))(*(void *)&v46[80], 0, v46);
        int v29 = v49;
        if ((unint64_t)v49 >= v50)
        {
          uint64_t v49 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v48, (uint64_t)v46);
          if (*(void *)&v46[56])
          {
            *(void *)&v46[64] = *(void *)&v46[56];
            operator delete(*(void **)&v46[56]);
          }
        }
        else
        {
          long long v30 = *(_OWORD *)&v46[16];
          *(_OWORD *)uint64_t v49 = *(_OWORD *)v46;
          *((_OWORD *)v29 + 1) = v30;
          *((void *)v29 + 4) = 0;
          *((void *)v29 + 5) = 0;
          *((void *)v29 + 6) = 0;
          *((void *)v29 + 7) = 0;
          *((_OWORD *)v29 + 2) = *(_OWORD *)&v46[32];
          *((void *)v29 + 6) = *(void *)&v46[48];
          memset(&v46[32], 0, 24);
          *((void *)v29 + 8) = 0;
          *((void *)v29 + 9) = 0;
          *(_OWORD *)(v29 + 56) = *(_OWORD *)&v46[56];
          *((void *)v29 + 9) = *(void *)&v46[72];
          memset(&v46[56], 0, 24);
          uint64_t v31 = *(void *)&v46[80];
          *(void *)(v29 + 85) = *(void *)&v46[85];
          *((void *)v29 + 10) = v31;
          uint64_t v49 = v29 + 96;
        }
        if (*(void *)&v46[32])
        {
          *(void *)&v46[40] = *(void *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }
LABEL_17:
        unint64_t v22 = v48;
        int v13 = v49;
        ++v21;
        if (v48 != v49) {
          continue;
        }
        uint64_t v17 = 0;
        if (v48)
        {
LABEL_38:
          uint64_t v32 = v49;
          v33 = v22;
          if (v49 != v22)
          {
            do
            {
              uint64_t v34 = (void *)*((void *)v32 - 5);
              if (v34)
              {
                *((void *)v32 - 4) = v34;
                operator delete(v34);
              }
              long long v35 = (void *)*((void *)v32 - 8);
              if (v35)
              {
                *((void *)v32 - 7) = v35;
                operator delete(v35);
              }
              v32 -= 96;
            }
            while (v32 != v22);
            v33 = v48;
          }
          uint64_t v49 = v22;
          operator delete(v33);
        }
        break;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    return v17;
  }
}

void sub_26365A4D4(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_26365A4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__state<char>::~__state((uint64_t *)va);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_26365A530(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_26365A544(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  value = this->__end_cap_.__value_;
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) < __n)
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_26;
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    std::vector<std::csub_match>::size_type v9 = 2 * v8;
    if (2 * v8 <= __n) {
      std::vector<std::csub_match>::size_type v9 = __n;
    }
    unint64_t v10 = v8 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v9;
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
LABEL_26:
    }
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    uint64_t v11 = v10;
    int v12 = (std::sub_match<const char *> *)operator new(24 * v10);
    this->__begin_ = v12;
    this->__end_ = v12;
    this->__end_cap_.__value_ = &v12[v11];
    std::vector<std::csub_match>::size_type v13 = 24 * __n;
    uint64_t v14 = &v12[__n];
    do
    {
      v12->std::pair<const char *, const char *> = __u->std::pair<const char *, const char *>;
      *(void *)&v12->matched = *(void *)&__u->matched;
      ++v12;
      v13 -= 24;
    }
    while (v13);
    goto LABEL_25;
  }
  std::vector<std::csub_match>::pointer end = this->__end_;
  unint64_t v16 = end - begin;
  if (v16 >= __n) {
    std::vector<std::csub_match>::size_type v17 = __n;
  }
  else {
    std::vector<std::csub_match>::size_type v17 = end - begin;
  }
  if (v17)
  {
    uint64_t v18 = begin;
    do
    {
      *v18++ = *__u;
      --v17;
    }
    while (v17);
  }
  if (__n <= v16)
  {
    uint64_t v14 = &begin[__n];
LABEL_25:
    this->__end_ = v14;
    return;
  }
  unint64_t v19 = &end[__n - v16];
  std::vector<std::csub_match>::size_type v20 = 24 * __n - 24 * v16;
  do
  {
    std::pair<const char *, const char *> v21 = __u->std::pair<const char *, const char *>;
    *(void *)&end->matched = *(void *)&__u->matched;
    end->std::pair<const char *, const char *> = v21;
    ++end;
    v20 -= 24;
  }
  while (v20);
  this->__end_ = v19;
}

void *std::__state<char>::~__state(void *a1)
{
  int v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365A7A4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365A7FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::__state<char>>::~vector[abi:ne180100](void **a1)
{
  int v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    long long v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        std::vector<std::csub_match>::size_type v5 = (void *)*((void *)v3 - 5);
        if (v5)
        {
          *((void *)v3 - 4) = v5;
          operator delete(v5);
        }
        uint64_t v6 = (void *)*((void *)v3 - 8);
        if (v6)
        {
          *((void *)v3 - 7) = v6;
          operator delete(v6);
        }
        v3 -= 96;
      }
      while (v3 != v2);
      long long v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 5);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) >= 0x155555555555555) {
    unint64_t v6 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v7 = (char *)operator new(96 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  std::vector<std::csub_match>::size_type v9 = &v7[96 * v3];
  *(_OWORD *)std::vector<std::csub_match>::size_type v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  unint64_t v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v9 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(v9 + 85) = *(void *)(a2 + 85);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  *((void *)v9 + 9) = 0;
  *((void *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v9 + 9) = v11;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  std::vector<std::csub_match>::size_type v13 = v9 + 96;
  uint64_t v14 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      std::vector<std::csub_match>::size_type v17 = &v9[v16];
      uint64_t v18 = &v15[v16];
      long long v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((void *)v17 - 7) = 0;
      *((void *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((void *)v17 - 6) = *(void *)&v15[v16 - 48];
      *((void *)v18 - 8) = 0;
      *((void *)v18 - 7) = 0;
      *((void *)v18 - 6) = 0;
      *((void *)v17 - 4) = 0;
      *((void *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((void *)v17 - 3) = *(void *)&v15[v16 - 24];
      *((void *)v18 - 5) = 0;
      *((void *)v18 - 4) = 0;
      *((void *)v18 - 3) = 0;
      uint64_t v20 = *(void *)&v15[v16 - 16];
      *(void *)(v17 - 11) = *(void *)&v15[v16 - 11];
      *((void *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    unint64_t v15 = (char *)*a1;
    std::pair<const char *, const char *> v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      unint64_t v22 = (void *)*((void *)v21 - 5);
      if (v22)
      {
        *((void *)v21 - 4) = v22;
        operator delete(v22);
      }
      uint64_t v23 = (void *)*((void *)v21 - 8);
      if (v23)
      {
        *((void *)v21 - 7) = v23;
        operator delete(v23);
      }
      v21 -= 96;
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      std::vector<std::csub_match>::size_type v13 = &end[__n];
      std::vector<std::csub_match>::size_type v14 = 24 * __n;
      do
      {
        std::pair<const char *, const char *> v15 = __x->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__x->matched;
        end->std::pair<const char *, const char *> = v15;
        ++end;
        v14 -= 24;
      }
      while (v14);
      std::vector<std::csub_match>::pointer end = v13;
    }
    this->__end_ = end;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v12 = (char *)operator new(24 * v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v16 = (std::sub_match<const char *> *)&v12[24 * v8];
    std::vector<std::csub_match>::size_type v17 = 24 * __n;
    uint64_t v18 = &v16[__n];
    long long v19 = v16;
    do
    {
      std::pair<const char *, const char *> v20 = __x->std::pair<const char *, const char *>;
      v19[1].first = *(const char **)&__x->matched;
      *long long v19 = v20;
      long long v19 = (std::pair<const char *, const char *> *)((char *)v19 + 24);
      v17 -= 24;
    }
    while (v17);
    std::vector<std::csub_match>::pointer begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<const char *, const char *> v22 = end[-1].std::pair<const char *, const char *>;
        *(void *)&v16[-1].matched = *(void *)&end[-1].matched;
        v16[-1].std::pair<const char *, const char *> = v22;
        --v16;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v16;
    this->__end_ = v18;
    this->__end_cap_.__value_ = (std::sub_match<const char *> *)&v12[24 * v11];
    if (end)
    {
      operator delete(end);
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      std::vector<std::pair<unsigned long, const char *>>::size_type v12 = 16 * __n;
      bzero(this->__end_, 16 * __n);
      std::vector<std::csub_match>::pointer end = (std::pair<unsigned long, const char *> *)((char *)end + v12);
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<std::pair<unsigned long, const char *>>::pointer begin = this->__begin_;
    uint64_t v7 = end - this->__begin_;
    unint64_t v8 = v7 + __n;
    if ((v7 + __n) >> 60) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = (char *)value - (char *)begin;
    if (v9 >> 3 > v8) {
      unint64_t v8 = v9 >> 3;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v11 = (char *)operator new(16 * v10);
    }
    else
    {
      unint64_t v11 = 0;
    }
    std::vector<std::csub_match>::size_type v13 = (std::pair<unsigned long, const char *> *)&v11[16 * v7];
    size_t v14 = __n;
    std::pair<const char *, const char *> v15 = (std::pair<unsigned long, const char *> *)&v11[16 * v10];
    bzero(v13, v14 * 16);
    uint64_t v16 = &v13[v14];
    if (end != begin)
    {
      do
      {
        v13[-1] = end[-1];
        --v13;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
    {
      operator delete(end);
    }
  }
}

uint64_t std::__state<char>::__state(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v7 = (unsigned char *)*((void *)a2 + 4);
  unint64_t v6 = (unsigned char *)*((void *)a2 + 5);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v8 >> 3) >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = (char *)operator new(v8);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = &v9[8 * (v8 >> 3)];
    size_t v10 = 24 * ((v8 - 24) / 0x18uLL) + 24;
    memcpy(v9, v7, v10);
    *(void *)(a1 + 40) = &v9[v10];
  }
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  std::vector<std::pair<unsigned long, const char *>>::size_type v12 = (unsigned char *)*((void *)a2 + 7);
  unint64_t v11 = (unsigned char *)*((void *)a2 + 8);
  uint64_t v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    size_t v14 = (char *)operator new(v11 - v12);
    *(void *)(a1 + 56) = v14;
    *(void *)(a1 + 64) = v14;
    *(void *)(a1 + 72) = &v14[16 * (v13 >> 4)];
    memcpy(v14, v12, v13 & 0xFFFFFFFFFFFFFFF0);
    *(void *)(a1 + 64) = &v14[v13 & 0xFFFFFFFFFFFFFFF0];
  }
  uint64_t v15 = *((void *)a2 + 10);
  *(void *)(a1 + 85) = *(void *)((char *)a2 + 85);
  *(void *)(a1 + 80) = v15;
  return a1;
}

void sub_26365AEA0(_Unwind_Exception *exception_object)
{
  long long v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 64) = v5;
    operator delete(v5);
  }
  unint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  long long v5 = a2 + 1;
  if (a2 + 1 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  int v7 = *v5;
  unsigned int v8 = v7 - 48;
  if (v7 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
    return a2 + 2;
  }
  if ((v7 - 49) > 8) {
    goto LABEL_18;
  }
  size_t v10 = a2 + 2;
  if (a2 + 2 == a3)
  {
    size_t v10 = a3;
  }
  else
  {
    while (1)
    {
      int v11 = *v10;
      if ((v11 - 48) > 9) {
        break;
      }
      if (v8 >= 0x19999999) {
        goto LABEL_23;
      }
      ++v10;
      unsigned int v8 = v11 + 10 * v8 - 48;
      if (v10 == a3)
      {
        size_t v10 = a3;
        break;
      }
    }
    if (!v8) {
LABEL_23:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  if (v8 > this->__marked_count_) {
    goto LABEL_23;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v8);
  if (v10 == v5)
  {
LABEL_18:
    size_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>((uint64_t)this, a2 + 1, a3);
    if (v10 == v5)
    {
      std::vector<std::pair<unsigned long, const char *>>::size_type v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(this, a2 + 1, a3, 0);
      if (v12 == v5) {
        return a2;
      }
      else {
        return v12;
      }
    }
  }
  return v10;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    int v5 = a2[1];
    char v6 = v5 == 94;
    int v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    unsigned int v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(void *)(*(void *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    *(void *)(a1 + 56) = v8;
    if (v7 == a3) {
      goto LABEL_20;
    }
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v9 = v7;
      int v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(a1, v7, a3, (uint64_t)v8);
    }
    while (v7 != v9);
    if (v9 == a3) {
      goto LABEL_20;
    }
    if (*v9 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
      ++v9;
    }
    if (v9 == a3 || *v9 != 93) {
LABEL_20:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v9 + 1;
  }
  return a2;
}

void sub_26365B190(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365B1E8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  if (this == a3) {
    return this;
  }
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '{':
    case '|':
    case '}':
      return this;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
      uint64_t result = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      break;
  }
  return result;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365B50C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  unint64_t v3 = a2;
  if (a2 != a3)
  {
    switch(*a2)
    {
      case 'D':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_7;
      case 'S':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_11;
      case 'W':
        char v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_9;
      case 'd':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_7:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x400;
        goto LABEL_12;
      case 's':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_11:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x4000;
LABEL_12:
        v5[40] = v7;
        goto LABEL_13;
      case 'w':
        char v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_9:
        *(void *)(*(void *)(a1 + 56) + 8) = v6;
        *(void *)(a1 + 56) = v6;
        v6[40] |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v6, 95);
LABEL_13:
        ++v3;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_26365B6FC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_26365B710(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_26365B724(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_26365B738(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_26365B74C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_26365B760(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  long long v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  std::basic_regex<char>::value_type v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v8 = v4[1];
      if (((v8 & 0xDF) - 65) > 0x19u) {
        goto LABEL_81;
      }
      std::basic_regex<char>::value_type v9 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v9;
        *((unsigned char *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v9);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        int v10 = v4[1];
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38 || (v10 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            int v11 = *v4;
            if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6) {
              goto LABEL_38;
            }
          }
        }
      }
      goto LABEL_81;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char>::value_type v6 = 11;
LABEL_65:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_38:
      if (v4 + 1 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v12 = v4[1];
      char v13 = -48;
      if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
        goto LABEL_43;
      }
      v12 |= 0x20u;
      if ((v12 - 97) >= 6u) {
        goto LABEL_81;
      }
      char v13 = -87;
LABEL_43:
      if (v4 + 2 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v14 = v4[2];
      char v15 = -48;
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      {
        v14 |= 0x20u;
        if ((v14 - 97) >= 6u) {
LABEL_81:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        char v15 = -87;
      }
      std::basic_regex<char>::value_type v16 = v14 + 16 * (v12 + v13) + v15;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v16;
      *((unsigned char *)a4 + 1) = 0;
      uint64_t result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0) {
        goto LABEL_81;
      }
      if (!a4) {
        goto LABEL_65;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2 = __c;
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    unsigned __int8 v8 = (char *)operator new(0x30uLL);
    first = this->__end_->__first_;
    *(void *)unsigned __int8 v8 = &unk_270EA2B38;
    *((void *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    unsigned __int8 v8 = (char *)operator new(0x30uLL);
    int v10 = this->__end_->__first_;
    *(void *)unsigned __int8 v8 = &unk_270EA2B80;
    *((void *)v8 + 1) = v10;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  uint64_t v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  int v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_270EA2BC8;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_26365BF7C(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  long long v4 = v1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365C028(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    unsigned __int8 v8 = (std::locale *)operator new(0x30uLL);
    std::basic_regex<char>::value_type v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    int v10 = (std::locale::__imp *)&unk_270EA2C10;
LABEL_6:
    v8->__locale_ = v10;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    unsigned __int8 v8 = (std::locale *)operator new(0x30uLL);
    std::basic_regex<char>::value_type v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    int v10 = (std::locale::__imp *)&unk_270EA2C58;
    goto LABEL_6;
  }
  uint64_t v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  first = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_270EA2CA0;
  v5[1].__vftable = (std::__node<char>_vtbl *)first;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2B38;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2B38;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    *(void *)(a2 + 80) = *(void *)(v4 + 8);
  }
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2B80;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2B80;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2C10;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2C10;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (!*(unsigned char *)(v3 + 16)
    || (uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3, v5 = *(void *)(a2 + 16), *(void *)(a2 + 24) - v5 < v4))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  uint64_t v6 = result;
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)v3 + v7));
      uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)(a2 + 16) + v7));
      if (v8 != result) {
        goto LABEL_3;
      }
      if (v4 == ++v7)
      {
        uint64_t v5 = *(void *)(a2 + 16);
        break;
      }
    }
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v5 + v4;
  *(void *)(a2 + 80) = *(void *)(v6 + 8);
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2C58;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EA2C58;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (!*(unsigned char *)(v3 + 24 * v2 + 16)
    || (uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2),
        uint64_t v5 = *v4,
        uint64_t v6 = v4[1] - *v4,
        uint64_t v7 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v7 < v6))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  if (v6 >= 1)
  {
    uint64_t v8 = v6;
    std::basic_regex<char>::value_type v9 = *(unsigned __int8 **)(a2 + 16);
    do
    {
      int v11 = *v5++;
      int v10 = v11;
      int v12 = *v9++;
      if (v10 != v12) {
        goto LABEL_3;
      }
    }
    while (--v8);
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v7 + v6;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unsigned int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    *(void *)(a2 + 80) = *((void *)v6 + 1);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v6 = (void *)(a1 + 40);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v16 = *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v5 < v16) {
        goto LABEL_24;
      }
      std::vector<std::csub_match>::size_type v17 = (unsigned char *)*v6;
      unint64_t v18 = (unint64_t)&v5[-*v6];
      unint64_t v19 = v18 + 1;
      if ((uint64_t)(v18 + 1) >= 0)
      {
        unint64_t v20 = v16 - (void)v17;
        if (2 * v20 > v19) {
          unint64_t v19 = 2 * v20;
        }
        if (v20 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v21 = v19;
        }
        if (v21)
        {
          int v12 = operator new(v21);
          char v13 = &v12[v18];
          unsigned __int8 v14 = &v12[v21];
          v12[v18] = v2;
          uint64_t v15 = (uint64_t)&v12[v18 + 1];
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        else
        {
          int v12 = 0;
          char v13 = &v5[-*v6];
          unsigned __int8 v14 = 0;
          *(unsigned char *)unint64_t v18 = a2;
          uint64_t v15 = v18 + 1;
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        if (v18 >= 8 && (unint64_t)(v17 - v12) >= 0x20)
        {
          if (v18 >= 0x20)
          {
            unint64_t v28 = v18 & 0xFFFFFFFFFFFFFFE0;
            uint64_t v38 = (long long *)(v5 - 16);
            uint64_t v39 = &v12[v5 - 16 - v17];
            unint64_t v40 = v18 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v41 = *v38;
              *(v39 - 1) = *(v38 - 1);
              *uint64_t v39 = v41;
              v39 -= 2;
              v38 -= 2;
              v40 -= 32;
            }
            while (v40);
            if (v18 == v28) {
              goto LABEL_86;
            }
            if ((v18 & 0x18) == 0)
            {
              v13 -= v28;
              v5 -= v28;
              goto LABEL_80;
            }
          }
          else
          {
            unint64_t v28 = 0;
          }
          v13 -= v18 & 0xFFFFFFFFFFFFFFF8;
          unsigned int v42 = &v5[-v28 - 8];
          uint64_t v43 = &v12[v42 - v17];
          unint64_t v44 = v28 - (v18 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v45 = *(void *)v42;
            v42 -= 8;
            *v43-- = v45;
            v44 += 8;
          }
          while (v44);
          v5 -= v18 & 0xFFFFFFFFFFFFFFF8;
          if (v18 == (v18 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_86;
          }
        }
LABEL_80:
        long long v56 = v13 - 1;
        do
        {
          char v57 = *--v5;
          *v56-- = v57;
        }
        while (v5 != v17);
        goto LABEL_86;
      }
LABEL_89:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if ((unint64_t)v5 < v16) {
      goto LABEL_24;
    }
    uint64_t v23 = (unsigned char *)*v6;
    unint64_t v24 = (unint64_t)&v5[-*v6];
    unint64_t v25 = v24 + 1;
    if ((uint64_t)(v24 + 1) < 0) {
      goto LABEL_89;
    }
    unint64_t v26 = v16 - (void)v23;
    if (2 * v26 > v25) {
      unint64_t v25 = 2 * v26;
    }
    if (v26 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v27 = v25;
    }
    if (v27)
    {
      int v12 = operator new(v27);
      char v13 = &v12[v24];
      unsigned __int8 v14 = &v12[v27];
      v12[v24] = v2;
      uint64_t v15 = (uint64_t)&v12[v24 + 1];
      if (v5 == v23)
      {
LABEL_49:
        *(void *)(a1 + 40) = v13;
        *(void *)(a1 + 48) = v15;
        *(void *)(a1 + 56) = v14;
        if (!v5) {
          goto LABEL_88;
        }
        goto LABEL_87;
      }
    }
    else
    {
      int v12 = 0;
      char v13 = &v5[-*v6];
      unsigned __int8 v14 = 0;
      *(unsigned char *)unint64_t v24 = a2;
      uint64_t v15 = v24 + 1;
      if (v5 == v23) {
        goto LABEL_49;
      }
    }
    if (v24 >= 8 && (unint64_t)(v23 - v12) >= 0x20)
    {
      if (v24 >= 0x20)
      {
        unint64_t v29 = v24 & 0xFFFFFFFFFFFFFFE0;
        v46 = (long long *)(v5 - 16);
        v47 = &v12[v5 - 16 - v23];
        unint64_t v48 = v24 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v49 = *v46;
          *(v47 - 1) = *(v46 - 1);
          _OWORD *v47 = v49;
          v47 -= 2;
          v46 -= 2;
          v48 -= 32;
        }
        while (v48);
        if (v24 == v29) {
          goto LABEL_86;
        }
        if ((v24 & 0x18) == 0)
        {
          v13 -= v29;
          v5 -= v29;
          goto LABEL_84;
        }
      }
      else
      {
        unint64_t v29 = 0;
      }
      v13 -= v24 & 0xFFFFFFFFFFFFFFF8;
      unint64_t v50 = &v5[-v29 - 8];
      v51 = &v12[v50 - v23];
      unint64_t v52 = v29 - (v24 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v53 = *(void *)v50;
        v50 -= 8;
        *v51-- = v53;
        v52 += 8;
      }
      while (v52);
      v5 -= v24 & 0xFFFFFFFFFFFFFFF8;
      if (v24 == (v24 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_86;
      }
    }
LABEL_84:
    stat v58 = v13 - 1;
    do
    {
      char v59 = *--v5;
      *v58-- = v59;
    }
    while (v5 != v23);
    goto LABEL_86;
  }
  char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v4 = *(void *)(a1 + 56);
  if ((unint64_t)v5 < v4)
  {
LABEL_24:
    *unsigned int v5 = v2;
    uint64_t v15 = (uint64_t)(v5 + 1);
    goto LABEL_88;
  }
  uint64_t v6 = (void *)(a1 + 40);
  uint64_t v7 = *(unsigned char **)(a1 + 40);
  unint64_t v8 = v5 - v7;
  uint64_t v9 = v5 - v7 + 1;
  if (v9 < 0) {
    goto LABEL_89;
  }
  unint64_t v10 = v4 - (void)v7;
  if (2 * v10 > v9) {
    uint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v11 = v9;
  }
  if (v11)
  {
    int v12 = operator new(v11);
    char v13 = &v12[v8];
    unsigned __int8 v14 = &v12[v11];
    v12[v8] = v2;
    uint64_t v15 = (uint64_t)&v12[v8 + 1];
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  else
  {
    int v12 = 0;
    char v13 = (char *)(v5 - v7);
    unsigned __int8 v14 = 0;
    *(unsigned char *)unint64_t v8 = v2;
    uint64_t v15 = v8 + 1;
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20) {
    goto LABEL_76;
  }
  if (v8 < 0x20)
  {
    unint64_t v22 = 0;
    goto LABEL_55;
  }
  unint64_t v22 = v8 & 0xFFFFFFFFFFFFFFE0;
  long long v30 = (long long *)(v5 - 16);
  uint64_t v31 = &v12[v5 - 16 - v7];
  unint64_t v32 = v8 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v33 = *v30;
    *(v31 - 1) = *(v30 - 1);
    *uint64_t v31 = v33;
    v31 -= 2;
    v30 -= 2;
    v32 -= 32;
  }
  while (v32);
  if (v8 != v22)
  {
    if ((v8 & 0x18) == 0)
    {
      v13 -= v22;
      v5 -= v22;
      goto LABEL_76;
    }
LABEL_55:
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v34 = &v5[-v22 - 8];
    long long v35 = &v12[v34 - v7];
    unint64_t v36 = v22 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v37 = *(void *)v34;
      v34 -= 8;
      *v35-- = v37;
      v36 += 8;
    }
    while (v36);
    v5 -= v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_86;
    }
LABEL_76:
    v54 = v13 - 1;
    do
    {
      char v55 = *--v5;
      *v54-- = v55;
    }
    while (v5 != v7);
  }
LABEL_86:
  unsigned int v5 = (unsigned char *)*v6;
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v14;
  if (v5) {
LABEL_87:
  }
    operator delete(v5);
LABEL_88:
  *(void *)(a1 + 48) = v15;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v16, v11);
  std::locale::name(&v17, &v16);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    char v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v13 = &v17;
    }
    BOOL v14 = v13->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
LABEL_9:
    }
      operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v16);
  *(unsigned char *)(a1 + 171) = v14;
  return a1;
}

void sub_26365D148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v9 + 136));
  uint64_t v15 = *(void **)(v9 + 112);
  if (v15)
  {
    *(void *)(v9 + 120) = v15;
    operator delete(v15);
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16)
    {
LABEL_3:
      std::string v17 = *v13;
      if (!*v13) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16) {
      goto LABEL_3;
    }
  }
  *(void *)(v9 + 72) = v16;
  operator delete(v16);
  std::string v17 = *v13;
  if (!*v13)
  {
LABEL_4:
    std::locale::~locale(v11);
    *(void *)uint64_t v9 = v10;
    uint64_t v18 = *(void *)(v9 + 8);
    if (!v18) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  *(void *)(v9 + 48) = v17;
  operator delete(v17);
  std::locale::~locale(v11);
  *(void *)uint64_t v9 = v10;
  uint64_t v18 = *(void *)(v9 + 8);
  if (!v18) {
LABEL_5:
  }
    _Unwind_Resume(a1);
LABEL_9:
  (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  _Unwind_Resume(a1);
}

void **std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](void **a1)
{
  char v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    unint64_t v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0) {
LABEL_9:
        }
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        unint64_t v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  uint64_t v1 = std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);

  operator delete(v1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  char v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v25 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_245;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_34;
  }
  char v6 = *current;
  LOBYTE(__src) = *current;
  char v7 = current[1];
  HIBYTE(__src) = v7;
  if (this->__icase_)
  {
    LOBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  p_traits = &this->__traits_;
  std::regex_traits<char>::__lookup_collatename<char *>(&__src, (uint64_t)&this->__traits_, __p, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    size_t v27 = __p[1];
    operator delete(__p[0]);
    if (v27) {
      goto LABEL_8;
    }
LABEL_34:
    BOOL negate = 0;
    uint64_t v25 = 1;
    unsigned __int8 v28 = *v2->__current_;
    LOBYTE(__src) = v28;
    if (!this->__icase_) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (!HIBYTE(__p[2])) {
    goto LABEL_34;
  }
LABEL_8:
  std::vector<std::pair<char, char>>::pointer begin = this->__digraphs_.__begin_;
  uint64_t v10 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v10)
  {
    uint64_t v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1) {
      uint64_t v11 = 1;
    }
    p_second = &begin->second;
    while (__src != *(p_second - 1) || HIBYTE(__src) != *p_second)
    {
      p_second += 2;
      if (!--v11) {
        goto LABEL_17;
      }
    }
    goto LABEL_227;
  }
LABEL_17:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
    goto LABEL_167;
  }
  memset(v136, 170, sizeof(v136));
  __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  __p[2] = (void *)0x2AAAAAAAAAAAAAALL;
  __p[0] = (void *)0xAAAAAAAAAA00AAAALL;
  LOWORD(__p[0]) = __src;
  (*(void (**)(void **__return_ptr))(*(void *)this->__traits_.__col_ + 32))(v136);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v14 = this->__ranges_.__begin_;
  char v15 = HIBYTE(v136[2]);
  int64_t v16 = (char *)this->__ranges_.__end_ - (char *)v14;
  if (!v16)
  {
    BOOL v24 = 0;
    int v70 = 0;
    int v69 = 0;
    goto LABEL_164;
  }
  v128 = v2;
  uint64_t v17 = 0;
  unint64_t v18 = v16 / 48;
  if (SHIBYTE(v136[2]) >= 0) {
    unint64_t v19 = v136;
  }
  else {
    unint64_t v19 = (void **)v136[0];
  }
  char v20 = HIBYTE(v136[2]);
  if (SHIBYTE(v136[2]) >= 0) {
    size_t v21 = (void *)HIBYTE(v136[2]);
  }
  else {
    size_t v21 = v136[1];
  }
  if (v18 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v16 / 48;
  }
  uint64_t v23 = (unsigned __int8 *)&v14->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v24 = 1;
  do
  {
    int v59 = (char)*(v23 - 24);
    if (v59 >= 0) {
      v60 = (char *)(v23 - 47);
    }
    else {
      v60 = *(char **)(v23 - 47);
    }
    if (v59 >= 0) {
      size_t v61 = *(v23 - 24);
    }
    else {
      size_t v61 = *(void *)(v23 - 39);
    }
    if ((unint64_t)v21 >= v61) {
      size_t v62 = v61;
    }
    else {
      size_t v62 = (size_t)v21;
    }
    int v63 = memcmp(v60, v19, v62);
    if (v63)
    {
      if ((v63 & 0x80000000) == 0) {
        goto LABEL_98;
      }
    }
    else if (v61 > (unint64_t)v21)
    {
      goto LABEL_98;
    }
    int v64 = (char)*v23;
    if (v64 >= 0) {
      v65 = (char *)(v23 - 23);
    }
    else {
      v65 = *(char **)(v23 - 23);
    }
    if (v64 >= 0) {
      size_t v66 = *v23;
    }
    else {
      size_t v66 = *(void *)(v23 - 15);
    }
    if (v66 >= (unint64_t)v21) {
      size_t v67 = (size_t)v21;
    }
    else {
      size_t v67 = v66;
    }
    int v68 = memcmp(v19, v65, v67);
    if (v68)
    {
      if (v68 < 0)
      {
LABEL_123:
        int v69 = 1;
        int v70 = 5;
        goto LABEL_162;
      }
    }
    else if ((unint64_t)v21 <= v66)
    {
      goto LABEL_123;
    }
LABEL_98:
    BOOL v24 = ++v17 < v18;
    v23 += 48;
  }
  while (v22 != v17);
  int v70 = 0;
  int v69 = 0;
LABEL_162:
  char v2 = v128;
  p_traits = &this->__traits_;
  char v15 = v20;
LABEL_164:
  if (v15 < 0) {
    operator delete(v136[0]);
  }
  BOOL negate = v69;
  if (v24) {
    goto LABEL_207;
  }
LABEL_167:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_209;
  }
  int v133 = negate;
  v88 = v2;
  memset(__p, 170, sizeof(__p));
  std::regex_traits<char>::__transform_primary<char *>(&__src, (uint64_t)p_traits, __p, __p);
  std::vector<std::string>::pointer v89 = this->__equivalences_.__begin_;
  int v90 = SHIBYTE(__p[2]);
  int64_t v91 = (char *)this->__equivalences_.__end_ - (char *)v89;
  if (!v91) {
    goto LABEL_188;
  }
  unint64_t v92 = v91 / 24;
  v93 = __p[1];
  if (SHIBYTE(__p[2]) >= 0) {
    v94 = (void *)HIBYTE(__p[2]);
  }
  else {
    v94 = __p[1];
  }
  if (SHIBYTE(__p[2]) < 0)
  {
    int v135 = SHIBYTE(__p[2]);
    uint64_t v103 = 0;
    v104 = __p[0];
    if (v92 <= 1) {
      uint64_t v105 = 1;
    }
    else {
      uint64_t v105 = v91 / 24;
    }
    BOOL v97 = 1;
    do
    {
      std::string::size_type size = HIBYTE(v89->__r_.__value_.__r.__words[2]);
      int v107 = (char)size;
      if ((size & 0x80u) != 0) {
        std::string::size_type size = v89->__r_.__value_.__l.__size_;
      }
      if (v94 == (void *)size)
      {
        std::vector<std::string>::pointer v108 = v107 >= 0 ? v89 : (std::vector<std::string>::pointer)v89->__r_.__value_.__r.__words[0];
        if (!memcmp(v104, v108, (size_t)v93))
        {
          int v133 = 1;
          int v70 = 5;
          goto LABEL_203;
        }
      }
      BOOL v97 = ++v103 < v92;
      ++v89;
    }
    while (v105 != v103);
    int v70 = 0;
LABEL_203:
    char v2 = v88;
    int v90 = v135;
    goto LABEL_204;
  }
  if (!HIBYTE(__p[2]))
  {
    std::string::size_type v114 = HIBYTE(v89->__r_.__value_.__r.__words[2]);
    if ((v114 & 0x80u) != 0) {
      std::string::size_type v114 = v89->__r_.__value_.__l.__size_;
    }
    if (v114 != HIBYTE(__p[2]))
    {
      unint64_t v119 = 0;
      if (v92 <= 1) {
        uint64_t v120 = 1;
      }
      else {
        uint64_t v120 = v92;
      }
      uint64_t v121 = v120 - 1;
      v122 = &v89[1].__r_.__value_.__s.__data_[8];
      char v2 = v88;
      while (v121 != v119)
      {
        ++v119;
        unint64_t v123 = v122[15];
        unint64_t v125 = *(void *)v122;
        v122 += 24;
        unint64_t v124 = v125;
        if ((v123 & 0x80u) != 0) {
          unint64_t v123 = v124;
        }
        if (v94 == (void *)v123)
        {
          BOOL v97 = v119 < v92;
          int v133 = 1;
          int v70 = 5;
          goto LABEL_204;
        }
      }
      BOOL v97 = 0;
      int v70 = 0;
      goto LABEL_204;
    }
    char v2 = v88;
    BOOL negate = 1;
LABEL_208:
    uint64_t v25 = 2;
    goto LABEL_245;
  }
  uint64_t v95 = 0;
  uint64_t v96 = v92 <= 1 ? 1 : v91 / 24;
  BOOL v97 = 1;
  do
  {
    v98 = &v89[v95];
    v99 = (void *)HIBYTE(v98->__r_.__value_.__r.__words[2]);
    int v100 = (char)v99;
    if ((char)v99 < 0) {
      v99 = (void *)v98->__r_.__value_.__l.__size_;
    }
    if (v94 == v99)
    {
      if (v100 < 0) {
        v98 = (std::string *)v98->__r_.__value_.__r.__words[0];
      }
      v101 = __p;
      uint64_t v102 = HIBYTE(__p[2]);
      while (*(unsigned __int8 *)v101 == v98->__r_.__value_.__s.__data_[0])
      {
        v101 = (void **)((char *)v101 + 1);
        v98 = (std::string *)((char *)v98 + 1);
        if (!--v102)
        {
          int v133 = 1;
          int v70 = 5;
          char v2 = v88;
          goto LABEL_204;
        }
      }
    }
    BOOL v97 = ++v95 < v92;
  }
  while (v95 != v96);
LABEL_188:
  BOOL v97 = 0;
  int v70 = 0;
  char v2 = v88;
LABEL_204:
  if (v90 < 0) {
    operator delete(__p[0]);
  }
  BOOL negate = v133;
  if (!v97)
  {
LABEL_209:
    if ((char)__src < 0)
    {
      neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
    }
    else
    {
      std::regex_traits<char>::char_class_type mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      std::ctype_base::mask v111 = tab[__src];
      if (((v111 & mask) != 0 || __src == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((tab[HIBYTE(__src)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_227;
      }
      neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
      if ((neg_mask & v111) != 0 || __src == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_226:
        int v113 = negate;
LABEL_228:
        BOOL negate = v113;
        uint64_t v25 = 2;
        goto LABEL_245;
      }
    }
    if ((SHIBYTE(__src) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(__src)] & neg_mask) == 0)
      {
        int v113 = 1;
        if (HIBYTE(__src) != 95 || (neg_mask & 0x80) == 0) {
          goto LABEL_228;
        }
      }
      goto LABEL_226;
    }
LABEL_227:
    int v113 = 1;
    goto LABEL_228;
  }
LABEL_207:
  if (v70) {
    goto LABEL_208;
  }
  uint64_t v25 = 2;
  unsigned __int8 v28 = *v2->__current_;
  LOBYTE(__src) = v28;
  if (this->__icase_)
  {
LABEL_35:
    unsigned __int8 v28 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v28);
    LOBYTE(__src) = v28;
  }
LABEL_36:
  std::vector<char>::pointer v29 = this->__chars_.__begin_;
  unint64_t v30 = this->__chars_.__end_ - v29;
  if (v30)
  {
    if (v30 <= 1) {
      unint64_t v30 = 1;
    }
    while (1)
    {
      int v31 = *v29++;
      if (v31 == v28) {
        break;
      }
      if (!--v30) {
        goto LABEL_41;
      }
    }
LABEL_244:
    BOOL negate = 1;
    goto LABEL_245;
  }
LABEL_41:
  std::regex_traits<char>::char_class_type v32 = this->__neg_mask_;
  if (v32 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v28 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v28] & v32) == 0)
    {
      int v34 = (v32 >> 7) & 1;
      char v33 = v28 == 95 ? v34 : 0;
    }
    else
    {
      char v33 = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v36 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v28, end - this->__neg_chars_.__begin_);
    uint64_t v37 = v36 ? v36 : end;
    if ((v33 & 1) == 0 && v37 == end) {
      goto LABEL_244;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v38 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v39 = this->__ranges_.__end_;
  if (v38 == v39) {
    goto LABEL_128;
  }
  memset(v136, 170, sizeof(v136));
  if (!this->__collate_)
  {
    unsigned int v40 = 1;
    HIBYTE(v136[2]) = 1;
    LOWORD(v136[0]) = v28;
    int64_t v41 = (char *)v39 - (char *)v38;
    if (v41) {
      goto LABEL_59;
    }
LABEL_155:
    BOOL v48 = 0;
    if ((v40 & 0x80) != 0) {
      goto LABEL_126;
    }
    goto LABEL_127;
  }
  __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  __p[2] = (void *)0x1AAAAAAAAAAAAAALL;
  __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
  LOWORD(__p[0]) = v28;
  (*(void (**)(void **__return_ptr))(*(void *)this->__traits_.__col_ + 32))(v136);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v38 = this->__ranges_.__begin_;
  unsigned int v40 = HIBYTE(v136[2]);
  int64_t v41 = (char *)this->__ranges_.__end_ - (char *)v38;
  if (!v41) {
    goto LABEL_155;
  }
LABEL_59:
  uint64_t v134 = v25;
  BOOL v131 = negate;
  v129 = v2;
  uint64_t v42 = 0;
  unint64_t v43 = v41 / 48;
  char v126 = v40;
  if ((v40 & 0x80u) == 0) {
    unint64_t v44 = v136;
  }
  else {
    unint64_t v44 = (void **)v136[0];
  }
  if ((v40 & 0x80u) == 0) {
    uint64_t v45 = (void *)v40;
  }
  else {
    uint64_t v45 = v136[1];
  }
  if (v43 <= 1) {
    uint64_t v46 = 1;
  }
  else {
    uint64_t v46 = v41 / 48;
  }
  v47 = (unsigned __int8 *)&v38->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v48 = 1;
  while (2)
  {
    int v49 = (char)*(v47 - 24);
    if (v49 >= 0) {
      unint64_t v50 = (char *)(v47 - 47);
    }
    else {
      unint64_t v50 = *(char **)(v47 - 47);
    }
    if (v49 >= 0) {
      size_t v51 = *(v47 - 24);
    }
    else {
      size_t v51 = *(void *)(v47 - 39);
    }
    if ((unint64_t)v45 >= v51) {
      size_t v52 = v51;
    }
    else {
      size_t v52 = (size_t)v45;
    }
    int v53 = memcmp(v50, v44, v52);
    if (v53)
    {
      if (v53 < 0) {
        goto LABEL_84;
      }
    }
    else if (v51 <= (unint64_t)v45)
    {
LABEL_84:
      int v54 = (char)*v47;
      if (v54 >= 0) {
        char v55 = (char *)(v47 - 23);
      }
      else {
        char v55 = *(char **)(v47 - 23);
      }
      if (v54 >= 0) {
        size_t v56 = *v47;
      }
      else {
        size_t v56 = *(void *)(v47 - 15);
      }
      if (v56 >= (unint64_t)v45) {
        size_t v57 = (size_t)v45;
      }
      else {
        size_t v57 = v56;
      }
      int v58 = memcmp(v44, v55, v57);
      if (v58)
      {
        if (v58 < 0)
        {
LABEL_95:
          BOOL negate = 1;
          char v2 = v129;
          uint64_t v25 = v134;
          if ((v126 & 0x80) == 0) {
            goto LABEL_127;
          }
          goto LABEL_126;
        }
      }
      else if ((unint64_t)v45 <= v56)
      {
        goto LABEL_95;
      }
    }
    BOOL v48 = ++v42 < v43;
    v47 += 48;
    if (v46 != v42) {
      continue;
    }
    break;
  }
  char v2 = v129;
  BOOL negate = v131;
  uint64_t v25 = v134;
  if ((v126 & 0x80) == 0) {
    goto LABEL_127;
  }
LABEL_126:
  operator delete(v136[0]);
LABEL_127:
  if (v48) {
    goto LABEL_245;
  }
LABEL_128:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_239:
    if ((v28 & 0x80) != 0) {
      goto LABEL_245;
    }
    std::regex_traits<char>::char_class_type v115 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v28] & v115) == 0)
    {
      int v116 = (v115 >> 7) & 1;
      if (v28 != 95) {
        int v116 = 0;
      }
      if (v116 != 1) {
        goto LABEL_245;
      }
    }
    goto LABEL_244;
  }
  memset(__p, 170, sizeof(__p));
  std::regex_traits<char>::__transform_primary<char *>(&__src, (uint64_t)&this->__traits_, (unsigned char *)&__src + 1, __p);
  std::vector<std::string>::pointer v71 = this->__equivalences_.__begin_;
  uint64_t v72 = HIBYTE(__p[2]);
  int64_t v73 = (char *)this->__equivalences_.__end_ - (char *)v71;
  if (!v73)
  {
    if ((HIBYTE(__p[2]) & 0x80) != 0) {
      operator delete(__p[0]);
    }
LABEL_238:
    unsigned __int8 v28 = __src;
    goto LABEL_239;
  }
  BOOL v132 = negate;
  v130 = v2;
  unint64_t v74 = 0;
  unint64_t v75 = v73 / 24;
  v76 = __p[0];
  v77 = __p[1];
  if (SHIBYTE(__p[2]) >= 0) {
    v78 = (void *)HIBYTE(__p[2]);
  }
  else {
    v78 = __p[1];
  }
  if (v75 <= 1) {
    uint64_t v79 = 1;
  }
  else {
    uint64_t v79 = v73 / 24;
  }
  BOOL v80 = 1;
  while (2)
  {
    v81 = &v71[v74];
    v82 = (void *)HIBYTE(v81->__r_.__value_.__r.__words[2]);
    int v83 = (char)v82;
    if ((char)v82 < 0) {
      v82 = (void *)v81->__r_.__value_.__l.__size_;
    }
    if (v78 != v82)
    {
LABEL_149:
      if (++v74 == v79)
      {
        if ((v72 & 0x80) != 0) {
LABEL_236:
        }
          operator delete(__p[0]);
        char v2 = v130;
        BOOL negate = v132;
        goto LABEL_238;
      }
      goto LABEL_153;
    }
    if (v83 >= 0) {
      v84 = &v71[v74];
    }
    else {
      v84 = (std::string *)v81->__r_.__value_.__r.__words[0];
    }
    if ((v72 & 0x80) == 0)
    {
      if (!v72)
      {
LABEL_157:
        char v2 = v130;
        BOOL negate = 1;
        if (!v80) {
          goto LABEL_238;
        }
        goto LABEL_245;
      }
      uint64_t v85 = 0;
      while (*((unsigned __int8 *)__p + v85) == v84->__r_.__value_.__s.__data_[v85])
      {
        if (v72 == ++v85) {
          goto LABEL_157;
        }
      }
      goto LABEL_149;
    }
    BOOL v127 = v80;
    v86 = v76;
    v87 = v77;
    if (memcmp(v76, v84, (size_t)v77))
    {
      ++v74;
      v77 = v87;
      v76 = v86;
      if (v74 == v79) {
        goto LABEL_236;
      }
LABEL_153:
      BOOL v80 = v74 < v75;
      continue;
    }
    break;
  }
  operator delete(__p[0]);
  char v2 = v130;
  BOOL negate = 1;
  if (!v127) {
    goto LABEL_238;
  }
LABEL_245:
  if (negate == this->__negate_)
  {
    first = 0;
    int v118 = -993;
  }
  else
  {
    v2->__current_ += v25;
    first = this->__first_;
    int v118 = -995;
  }
  v2->__do_ = v118;
  v2->__node_ = first;
}

void sub_26365DE08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  locale = a1[17].__locale_;
  if (locale)
  {
    uint64_t v3 = a1[18].__locale_;
    unint64_t v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*((void **)v3 - 3));
        }
        uint64_t v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      unint64_t v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  unsigned int v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  char v6 = a1[11].__locale_;
  if (v6)
  {
    char v7 = a1[12].__locale_;
    unint64_t v8 = a1[11].__locale_;
    if (v7 == v6)
    {
LABEL_21:
      a1[12].__locale_ = v6;
      operator delete(v8);
      goto LABEL_22;
    }
    while (1)
    {
      if (*((char *)v7 - 1) < 0)
      {
        operator delete(*((void **)v7 - 3));
        if (*((char *)v7 - 25) < 0) {
LABEL_19:
        }
          operator delete(*((void **)v7 - 6));
      }
      else if (*((char *)v7 - 25) < 0)
      {
        goto LABEL_19;
      }
      char v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        unint64_t v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v9 = a1[8].__locale_;
  if (v9)
  {
    a1[9].__locale_ = v9;
    operator delete(v9);
  }
  uint64_t v10 = a1[5].__locale_;
  if (v10)
  {
    a1[6].__locale_ = v10;
    operator delete(v10);
  }
  std::locale::~locale(a1 + 2);
  uint64_t v11 = a1[1].__locale_;
  if (v11) {
    (*(void (**)(std::locale::__imp *))(*(void *)v11 + 8))(v11);
  }
  return a1;
}

void std::regex_traits<char>::__lookup_collatename<char *>(unsigned char *__src@<X1>, uint64_t a2@<X0>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  size_t v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v5 <= 0x16)
  {
    __dst[23] = (_BYTE)a3 - (_BYTE)__src;
    uint64_t v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v5);
    v9 += v5;
    goto LABEL_9;
  }
  uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v10 = v5 | 7;
  }
  uint64_t v11 = v10 + 1;
  uint64_t v9 = operator new(v10 + 1);
  *(void *)&__dst[8] = v5;
  *(void *)&__dst[16] = v11 | 0x8000000000000000;
  *(void *)__dst = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  unsigned char *v9 = 0;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    int v12 = *(char **)__dst;
    if (!*(void *)&__dst[8]) {
      goto LABEL_18;
    }
  }
  else
  {
    if (!__dst[23]) {
      return;
    }
    int v12 = __dst;
  }
  std::__get_collation_name(&v19, v12);
  *(_OWORD *)a4 = *(_OWORD *)&v19.__r_.__value_.__l.__data_;
  unint64_t v13 = v19.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v19.__r_.__value_.__l + 2);
  unint64_t v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0) {
    unint64_t v14 = *(void *)(a4 + 8);
  }
  if (v14) {
    goto LABEL_16;
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
    int v12 = *(char **)__dst;
    if (*(void *)&__dst[8] < 3uLL)
    {
LABEL_24:
      (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v19);
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      *(std::string *)a4 = v19;
      if (*(char *)(a4 + 23) < 0)
      {
        uint64_t v16 = *(void *)(a4 + 8);
        if (v16 == 1 || v16 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if (__dst[23] >= 0) {
              uint64_t v17 = __dst;
            }
            else {
              uint64_t v17 = *(unsigned char **)__dst;
            }
            if (__dst[23] >= 0) {
              size_t v18 = __dst[23];
            }
            else {
              size_t v18 = *(void *)&__dst[8];
            }
            std::string::__assign_no_alias<false>((void **)a4, v17, v18);
          }
        }
        else
        {
          **(unsigned char **)a4 = 0;
          *(void *)(a4 + 8) = 0;
        }
      }
      else
      {
        int v15 = *(unsigned __int8 *)(a4 + 23);
        if (v15 == 1 || v15 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              std::string::__assign_no_alias<true>((void *)a4, *(void **)__dst, *(size_t *)&__dst[8]);
            }
            else
            {
              *(_OWORD *)a4 = *(_OWORD *)__dst;
              *(void *)(a4 + 16) = *(void *)&__dst[16];
            }
          }
        }
        else
        {
          *(unsigned char *)a4 = 0;
          *(unsigned char *)(a4 + 23) = 0;
        }
      }
LABEL_16:
      if ((__dst[23] & 0x80000000) == 0) {
        return;
      }
      int v12 = *(char **)__dst;
    }
LABEL_18:
    operator delete(v12);
    return;
  }
  if (__dst[23] < 3u) {
    goto LABEL_24;
  }
}

void sub_26365E26C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<char *>(unsigned char *__src@<X1>, uint64_t a2@<X0>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  size_t v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v5 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a3 - (_BYTE)__src;
    uint64_t v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v5);
    uint64_t v9 = (void **)((char *)v9 + v5);
    goto LABEL_9;
  }
  uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v10 = v5 | 7;
  }
  uint64_t v11 = v10 + 1;
  uint64_t v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v5;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)uint64_t v9 = 0;
  memset(a4, 170, 24);
  int v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unint64_t v13 = __dst;
  }
  else {
    unint64_t v13 = (void **)__dst[0];
  }
  if (SHIBYTE(__dst[2]) < 0) {
    int v12 = (char *)__dst[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v13, &v12[(void)v13]);
  uint64_t v14 = *((unsigned __int8 *)a4 + 23);
  int v15 = (char)v14;
  if ((v14 & 0x80u) != 0) {
    uint64_t v14 = a4[1];
  }
  if (v14 == 1)
  {
LABEL_25:
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_26;
  }
  if (v14 == 12)
  {
    if (v15 >= 0) {
      uint64_t v16 = a4;
    }
    else {
      uint64_t v16 = (unsigned char *)*a4;
    }
    v16[11] = v16[3];
    if (SHIBYTE(__dst[2]) < 0) {
      goto LABEL_26;
    }
    return;
  }
  if ((v15 & 0x80000000) == 0)
  {
    *(unsigned char *)a4 = 0;
    *((unsigned char *)a4 + 23) = 0;
    goto LABEL_25;
  }
  *(unsigned char *)*a4 = 0;
  a4[1] = 0;
  if (SHIBYTE(__dst[2]) < 0) {
LABEL_26:
  }
    operator delete(__dst[0]);
}

void sub_26365E45C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365E4BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  char v6 = (char *)a4;
  int v9 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v40 = 0;
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_38:
    int v24 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_33;
  }
  int v10 = a2[1];
  if (v10 != 46)
  {
    if (v10 != 58)
    {
      if (v10 == 61)
      {
        char v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(a1, a2 + 2, a3, a4);
        char v11 = 0;
        if ((SHIBYTE(v40) & 0x80000000) == 0) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
      int v9 = 0;
      goto LABEL_38;
    }
    int v12 = a2 + 2;
    if (a3 - (v4 + 2) >= 2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = (unsigned __int8 *)v4;
      if (v4[2] == 58) {
        goto LABEL_14;
      }
      do
      {
        do
        {
          if (a3 - v4 - 4 == v13) {
            goto LABEL_89;
          }
          uint64_t v14 = (unsigned __int8 *)&v4[++v13];
        }
        while (v4[v13 + 2] != 58);
LABEL_14:
        ;
      }
      while (v14[3] != 93);
      int v15 = &v4[v13 + 2];
      if (v15 != a3)
      {
        int v16 = std::regex_traits<char>::__lookup_classname<char const*>(a1, v12, v15, *(_DWORD *)(a1 + 24) & 1);
        if (!v16) {
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
        }
        char v11 = 0;
        *((_DWORD *)v6 + 40) |= v16;
        char v6 = &v4[v13 + 4];
        if (SHIBYTE(v40) < 0) {
          goto LABEL_63;
        }
        goto LABEL_64;
      }
    }
LABEL_89:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  uint64_t v17 = a2 + 2;
  if (a3 - (v4 + 2) < 2) {
    goto LABEL_89;
  }
  uint64_t v18 = a3 - v4 - 4;
  std::string v19 = v4 + 2;
  char v20 = v17 + 1;
  if (*v17 == 46) {
    goto LABEL_23;
  }
  do
  {
    do
    {
      if (!v18) {
        goto LABEL_89;
      }
      --v18;
      std::string v19 = v20;
      int v21 = *v20++;
    }
    while (v21 != 46);
LABEL_23:
    ;
  }
  while (*v20 != 93);
  if (v19 == a3) {
    goto LABEL_89;
  }
  std::regex_traits<char>::__lookup_collatename<char const*>(v17, a1, v19, (uint64_t)&v41);
  if (SHIBYTE(v40) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v40 = v42;
  *(_OWORD *)std::vector<std::csub_match> __p = v41;
  uint64_t v22 = (char *)HIBYTE(v42);
  int v9 = SHIBYTE(v42);
  uint64_t v23 = *((void *)&v41 + 1);
  if (v42 < 0) {
    uint64_t v22 = (char *)__p[1];
  }
  if ((unint64_t)(v22 - 1) >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  unint64_t v4 = v19 + 2;
  int v24 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v42 >= 0) {
    uint64_t v23 = HIBYTE(v42);
  }
  if (v23)
  {
    unsigned __int8 v28 = v4;
    if (v4 == a3) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_33:
  if ((v24 | 0x40) != 0x40)
  {
    LOBYTE(v25) = *v4;
LABEL_57:
    if (v9 < 0)
    {
      int v34 = __p[0];
      __p[1] = (void *)1;
      *(unsigned char *)__p[0] = v25;
      v34[1] = 0;
      unsigned __int8 v28 = v4 + 1;
      if (v4 + 1 == a3) {
        goto LABEL_41;
      }
    }
    else
    {
      HIBYTE(v40) = 1;
      LOWORD(__p[0]) = v25;
      unsigned __int8 v28 = v4 + 1;
      if (v4 + 1 == a3) {
        goto LABEL_41;
      }
    }
    goto LABEL_40;
  }
  int v25 = *v4;
  if (v25 != 92) {
    goto LABEL_57;
  }
  unint64_t v26 = v4 + 1;
  if (v24) {
    size_t v27 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v26, a3, (uint64_t *)__p);
  }
  else {
    size_t v27 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v26, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v6);
  }
  unsigned __int8 v28 = v27;
  if (v27 == a3)
  {
LABEL_41:
    if (SHIBYTE(v40) < 0)
    {
      if (!__p[1]) {
        goto LABEL_62;
      }
      if (__p[1] != (void *)1)
      {
        unint64_t v30 = (void **)__p[0];
LABEL_61:
        std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v6, *(char *)v30, *((char *)v30 + 1));
LABEL_62:
        char v11 = 1;
        unint64_t v4 = v28;
        if ((SHIBYTE(v40) & 0x80000000) == 0) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
      unint64_t v30 = (void **)__p[0];
    }
    else
    {
      if (!HIBYTE(v40)) {
        goto LABEL_62;
      }
      unint64_t v30 = __p;
      if (HIBYTE(v40) != 1) {
        goto LABEL_61;
      }
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v6, *(char *)v30);
    goto LABEL_62;
  }
LABEL_40:
  int v29 = *v28;
  if (v29 == 93) {
    goto LABEL_41;
  }
  int v31 = v28 + 1;
  if (v28 + 1 == a3 || v29 != 45 || *v31 == 93) {
    goto LABEL_41;
  }
  long long v41 = 0uLL;
  int64_t v42 = 0;
  unint64_t v4 = v28 + 2;
  if (v28 + 2 == a3 || *v31 != 91 || *v4 != 46)
  {
    if ((v24 | 0x40) == 0x40)
    {
      LODWORD(v31) = *v31;
      if (v31 == 92)
      {
        if (v24) {
          std::regex_traits<char>::char_class_type v32 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v28 + 2, a3, (uint64_t *)&v41);
        }
        else {
          std::regex_traits<char>::char_class_type v32 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v28 + 2, (unsigned __int8 *)a3, (uint64_t)&v41, (uint64_t)v6);
        }
        goto LABEL_79;
      }
    }
    else
    {
      LOBYTE(v31) = *v31;
    }
    HIBYTE(v42) = 1;
    LOWORD(v41) = v31;
    goto LABEL_80;
  }
  std::regex_traits<char>::char_class_type v32 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v28 + 3, a3, (uint64_t)&v41);
LABEL_79:
  unint64_t v4 = v32;
LABEL_80:
  *(_OWORD *)uint64_t v37 = *(_OWORD *)__p;
  uint64_t v38 = v40;
  __p[1] = 0;
  uint64_t v40 = 0;
  __p[0] = 0;
  *(_OWORD *)long long v35 = v41;
  uint64_t v36 = v42;
  long long v41 = 0uLL;
  int64_t v42 = 0;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v6, (char *)v37, (uint64_t)v35);
  if (SHIBYTE(v36) < 0)
  {
    operator delete(v35[0]);
    if ((SHIBYTE(v38) & 0x80000000) == 0)
    {
LABEL_82:
      if ((SHIBYTE(v42) & 0x80000000) == 0) {
        goto LABEL_83;
      }
LABEL_87:
      operator delete((void *)v41);
      char v11 = 1;
      if (SHIBYTE(v40) < 0) {
        goto LABEL_63;
      }
      goto LABEL_64;
    }
  }
  else if ((SHIBYTE(v38) & 0x80000000) == 0)
  {
    goto LABEL_82;
  }
  operator delete(v37[0]);
  if (SHIBYTE(v42) < 0) {
    goto LABEL_87;
  }
LABEL_83:
  char v11 = 1;
  if (SHIBYTE(v40) < 0) {
LABEL_63:
  }
    operator delete(__p[0]);
LABEL_64:
  if (v11) {
    return v4;
  }
  return v6;
}

void sub_26365E9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (*(char *)(v28 - 49) < 0)
  {
    operator delete(*(void **)(v28 - 72));
    if (a28 < 0)
    {
LABEL_5:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(uint64_t a1, char *__src, char *a3, uint64_t a4)
{
  if (a3 - __src < 2 || a3 - 1 == __src) {
    goto LABEL_39;
  }
  uint64_t v7 = 0;
  unint64_t v8 = __src;
  if (*__src != 61) {
    goto LABEL_5;
  }
LABEL_4:
  if (v8[1] != 93)
  {
LABEL_5:
    while (a3 - __src - 2 != v7)
    {
      unint64_t v8 = &__src[++v7];
      if (__src[v7] == 61) {
        goto LABEL_4;
      }
    }
LABEL_39:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (&__src[v7] == a3) {
    goto LABEL_39;
  }
  memset(v18, 170, sizeof(v18));
  std::regex_traits<char>::__lookup_collatename<char const*>(__src, a1, &__src[v7], (uint64_t)v18);
  if ((SHIBYTE(v18[2]) & 0x80000000) == 0)
  {
    int v9 = (char *)HIBYTE(v18[2]);
    if (HIBYTE(v18[2]))
    {
      memset(__p, 170, sizeof(__p));
      int v10 = v18;
      goto LABEL_14;
    }
LABEL_40:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  int v9 = (char *)v18[1];
  if (!v18[1]) {
    goto LABEL_40;
  }
  memset(__p, 170, sizeof(__p));
  int v10 = (void **)v18[0];
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, (uint64_t)v10, &v9[(void)v10], (unsigned char **)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    if (__p[1])
    {
LABEL_16:
      unint64_t v11 = *(void *)(a4 + 144);
      if (v11 >= *(void *)(a4 + 152))
      {
        *(void *)(a4 + 144) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)(a4 + 136), (uint64_t)__p);
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      else
      {
        if ((HIBYTE(__p[2]) & 0x80) != 0)
        {
          std::string::__init_copy_ctor_external(*(std::string **)(a4 + 144), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          long long v12 = *(_OWORD *)__p;
          *(void **)(v11 + 16) = __p[2];
          *(_OWORD *)unint64_t v11 = v12;
        }
        *(void *)(a4 + 144) = v11 + 24;
        *(void *)(a4 + 144) = v11 + 24;
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      goto LABEL_33;
    }
  }
  else if (HIBYTE(__p[2]))
  {
    goto LABEL_16;
  }
  uint64_t v13 = (void *)HIBYTE(v18[2]);
  if (SHIBYTE(v18[2]) < 0) {
    uint64_t v13 = v18[1];
  }
  if (v13 == (void *)2)
  {
    int v15 = v18;
    if (SHIBYTE(v18[2]) < 0) {
      int v15 = (void **)v18[0];
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](a4, *(char *)v15, *((char *)v15 + 1));
  }
  else
  {
    if (v13 != (void *)1) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
    }
    uint64_t v14 = v18;
    if (SHIBYTE(v18[2]) < 0) {
      uint64_t v14 = (void **)v18[0];
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a4, *(char *)v14);
  }
  if (SHIBYTE(__p[2]) < 0)
  {
LABEL_37:
    operator delete(__p[0]);
    if (SHIBYTE(v18[2]) < 0) {
      goto LABEL_38;
    }
    return &__src[v7 + 2];
  }
LABEL_33:
  if (SHIBYTE(v18[2]) < 0) {
LABEL_38:
  }
    operator delete(v18[0]);
  return &__src[v7 + 2];
}

void sub_26365ECA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *__src, char *a3, uint64_t a4)
{
  if (a3 - __src < 2 || a3 - 1 == __src) {
    goto LABEL_15;
  }
  uint64_t v6 = 0;
  uint64_t v7 = __src;
  if (*__src != 46) {
    goto LABEL_5;
  }
LABEL_4:
  if (v7[1] != 93)
  {
LABEL_5:
    while (a3 - __src - 2 != v6)
    {
      uint64_t v7 = &__src[++v6];
      if (__src[v6] == 46) {
        goto LABEL_4;
      }
    }
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (&__src[v6] == a3) {
    goto LABEL_15;
  }
  std::regex_traits<char>::__lookup_collatename<char const*>(__src, a1, &__src[v6], (uint64_t)&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v11;
  unint64_t v8 = v12;
  *(void *)(a4 + 16) = v12;
  unint64_t v9 = HIBYTE(v8);
  if ((v9 & 0x80u) != 0) {
    unint64_t v9 = *(void *)(a4 + 8);
  }
  if (v9 - 1 >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  return &__src[v6 + 2];
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
      uint64_t result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      uint64_t result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      uint64_t result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 1) = 0;
        uint64_t result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_70:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  std::basic_regex<char>::value_type v5 = *a2;
  switch(*a2)
  {
    case '""':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v5;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30) {
        goto LABEL_70;
      }
      std::basic_regex<char>::value_type v7 = *a2 - 48;
      unint64_t v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        unint64_t v8 = a3;
LABEL_42:
        if (a4) {
          goto LABEL_43;
        }
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30) {
        goto LABEL_42;
      }
      std::basic_regex<char>::value_type v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        unint64_t v8 = a3;
        if (a4) {
          goto LABEL_43;
        }
        goto LABEL_69;
      }
      std::basic_regex<char>::value_type v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::basic_regex<char>::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        unint64_t v8 = a2 + 3;
      }
      else {
        unint64_t v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::basic_regex<char>::value_type v7 = v11;
      }
      if (!a4) {
        goto LABEL_69;
      }
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v7;
      *((unsigned char *)a4 + 1) = 0;
      return v8;
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = (uint64_t)a2;
  if (!*(unsigned char *)(a1 + 170))
  {
    uint64_t v16 = a2[23];
    if (a2[23] < 0)
    {
      if (*((void *)a2 + 1) != 1) {
        goto LABEL_74;
      }
    }
    else if (v16 != 1)
    {
LABEL_74:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    }
    if (*(char *)(a3 + 23) < 0)
    {
      if (*(void *)(a3 + 8) != 1) {
        goto LABEL_74;
      }
    }
    else if (*(unsigned char *)(a3 + 23) != 1)
    {
      goto LABEL_74;
    }
    if (!*(unsigned char *)(a1 + 169))
    {
LABEL_67:
      *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v4;
      uint64_t v49 = *(void *)(v4 + 16);
      *(void *)(v4 + 8) = 0;
      *(void *)(v4 + 16) = 0;
      *(void *)uint64_t v4 = 0;
      *(_OWORD *)unint64_t v50 = *(_OWORD *)v3;
      uint64_t v51 = *(void *)(v3 + 16);
      *(void *)(v3 + 8) = 0;
      *(void *)(v3 + 16) = 0;
      *(void *)uint64_t v3 = 0;
      unint64_t v39 = *(void *)(a1 + 96);
      if (v39 < *(void *)(a1 + 104))
      {
        long long v40 = *(_OWORD *)__p;
        *(void *)(v39 + 16) = v49;
        *(_OWORD *)unint64_t v39 = v40;
        __p[1] = 0;
        uint64_t v49 = 0;
        __p[0] = 0;
        uint64_t v41 = v51;
        *(_OWORD *)(v39 + 24) = *(_OWORD *)v50;
        *(void *)(v39 + 40) = v41;
        v50[1] = 0;
        uint64_t v51 = 0;
        v50[0] = 0;
        *(void *)(a1 + 96) = v39 + 48;
        if (SHIBYTE(v49) < 0) {
          goto LABEL_69;
        }
        return;
      }
      int64_t v42 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
      int v43 = SHIBYTE(v51);
      *(void *)(a1 + 96) = v42;
      if ((v43 & 0x80000000) == 0)
      {
        if (SHIBYTE(v49) < 0) {
          goto LABEL_69;
        }
        return;
      }
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0) {
        return;
      }
LABEL_69:
      operator delete(__p[0]);
      return;
    }
    int v34 = a2;
    if ((v16 & 0x80) != 0) {
      int v34 = *(char **)a2;
    }
    char v35 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v34);
    if (*(char *)(v4 + 23) < 0)
    {
      **(unsigned char **)uint64_t v4 = v35;
      uint64_t v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0) {
        goto LABEL_64;
      }
    }
    else
    {
      *(unsigned char *)uint64_t v4 = v35;
      uint64_t v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0)
      {
LABEL_64:
        char v37 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v36);
        uint64_t v38 = (unsigned char *)v3;
        if (*(char *)(v3 + 23) < 0) {
          uint64_t v38 = *(unsigned char **)v3;
        }
        unsigned char *v38 = v37;
        goto LABEL_67;
      }
    }
    uint64_t v36 = *(char **)v3;
    goto LABEL_64;
  }
  if (*(unsigned char *)(a1 + 169))
  {
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v7 = *(unsigned __int8 *)(v4 + 23);
      if (*(char *)(v4 + 23) < 0)
      {
        if (i >= *(void *)(v4 + 8))
        {
LABEL_13:
          for (unint64_t j = 0; ; ++j)
          {
            unint64_t v12 = *(unsigned __int8 *)(v3 + 23);
            if (*(char *)(v3 + 23) < 0)
            {
              if (j >= *(void *)(v3 + 8)) {
                goto LABEL_44;
              }
            }
            else if (j >= v12)
            {
              goto LABEL_44;
            }
            uint64_t v13 = v3;
            if ((v12 & 0x80) != 0) {
              uint64_t v13 = *(void *)v3;
            }
            char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *(char *)(v13 + j));
            uint64_t v15 = v3;
            if (*(char *)(v3 + 23) < 0) {
              uint64_t v15 = *(void *)v3;
            }
            *(unsigned char *)(v15 + j) = v14;
          }
        }
      }
      else if (i >= v7)
      {
        goto LABEL_13;
      }
      uint64_t v8 = v4;
      if ((v7 & 0x80) != 0) {
        uint64_t v8 = *(void *)v4;
      }
      char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *(char *)(v8 + i));
      uint64_t v10 = v4;
      if (*(char *)(v4 + 23) < 0) {
        uint64_t v10 = *(void *)v4;
      }
      *(unsigned char *)(v10 + i) = v9;
    }
  }
  for (unint64_t k = 0; ; ++k)
  {
    unint64_t v19 = a2[23];
    if (a2[23] < 0) {
      break;
    }
    if (k >= v19) {
      goto LABEL_35;
    }
LABEL_33:
    uint64_t v18 = a2;
    if ((v19 & 0x80) != 0)
    {
      uint64_t v18 = *(char **)a2;
      uint64_t v20 = *(char **)a2;
    }
    else
    {
      uint64_t v20 = a2;
    }
    v20[k] = v18[k];
  }
  if (k < *((void *)a2 + 1)) {
    goto LABEL_33;
  }
LABEL_35:
  for (unint64_t m = 0; ; ++m)
  {
    unint64_t v23 = *(unsigned __int8 *)(a3 + 23);
    if (*(char *)(a3 + 23) < 0) {
      break;
    }
    if (m >= v23) {
      goto LABEL_44;
    }
LABEL_42:
    uint64_t v22 = a3;
    if ((v23 & 0x80) != 0)
    {
      uint64_t v22 = *(void *)a3;
      uint64_t v24 = *(void *)a3;
    }
    else
    {
      uint64_t v24 = a3;
    }
    *(unsigned char *)(v24 + m) = *(unsigned char *)(v22 + m);
  }
  if (m < *(void *)(a3 + 8)) {
    goto LABEL_42;
  }
LABEL_44:
  if (*(char *)(v4 + 23) < 0)
  {
    uint64_t v26 = v4;
    uint64_t v4 = *(void *)v4;
    uint64_t v25 = *(void *)(v26 + 8);
  }
  else
  {
    uint64_t v25 = *(unsigned __int8 *)(v4 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v4, (char *)(v4 + v25));
  if (*(char *)(v3 + 23) < 0)
  {
    uint64_t v28 = v3;
    uint64_t v3 = *(void *)v3;
    uint64_t v27 = *(void *)(v28 + 8);
  }
  else
  {
    uint64_t v27 = *(unsigned __int8 *)(v3 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v3, (char *)(v3 + v27));
  *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v46;
  uint64_t v49 = v47;
  *(_OWORD *)unint64_t v50 = *(_OWORD *)v44;
  uint64_t v51 = v45;
  unint64_t v29 = *(void *)(a1 + 96);
  if (v29 >= *(void *)(a1 + 104))
  {
    std::regex_traits<char>::char_class_type v32 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
    int v33 = SHIBYTE(v51);
    *(void *)(a1 + 96) = v32;
    if (v33 < 0)
    {
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0) {
        return;
      }
    }
    else if ((SHIBYTE(v49) & 0x80000000) == 0)
    {
      return;
    }
    goto LABEL_69;
  }
  long long v30 = *(_OWORD *)__p;
  *(void *)(v29 + 16) = v49;
  *(_OWORD *)unint64_t v29 = v30;
  __p[1] = 0;
  uint64_t v49 = 0;
  __p[0] = 0;
  uint64_t v31 = v51;
  *(_OWORD *)(v29 + 24) = *(_OWORD *)v50;
  *(void *)(v29 + 40) = v31;
  v50[1] = 0;
  uint64_t v51 = 0;
  v50[0] = 0;
  *(void *)(a1 + 96) = v29 + 48;
  if (SHIBYTE(v49) < 0) {
    goto LABEL_69;
  }
}

void sub_26365FB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::pair<std::string,std::string>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_26365FB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    __int16 v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3) << 8);
    uint64_t v8 = *(char **)(a1 + 120);
    unint64_t v7 = *(void *)(a1 + 128);
    if ((unint64_t)v8 >= v7)
    {
      char v9 = (char **)(a1 + 112);
      uint64_t v10 = *(char **)(a1 + 112);
      uint64_t v11 = v8 - v10;
      if (v8 - v10 > -3)
      {
        uint64_t v12 = v11 >> 1;
        unint64_t v13 = v7 - (void)v10;
        if (v13 <= (v11 >> 1) + 1) {
          unint64_t v14 = v12 + 1;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v13 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v15 = v14;
        }
        if (!v15)
        {
          uint64_t v16 = 0;
          uint64_t v17 = (_WORD *)(2 * v12);
          uint64_t v18 = 0;
          *(_WORD *)(2 * v12) = v6;
          uint64_t v19 = 2 * v12 + 2;
          uint64_t v20 = (char *)(v8 - v10);
          if (v8 == v10) {
            goto LABEL_64;
          }
LABEL_30:
          unint64_t v30 = (unint64_t)(v20 - 2);
          if (v30 < 0x1E) {
            goto LABEL_71;
          }
          if (v8 - v16 - (v11 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
            goto LABEL_71;
          }
          uint64_t v31 = (v30 >> 1) + 1;
          unint64_t v32 = 2 * (v31 & 0xFFFFFFFFFFFFFFF0);
          int v33 = &v8[-v32];
          uint64_t v17 = (_WORD *)((char *)v17 - v32);
          int v34 = &v16[2 * v12 - 16];
          char v35 = v8 - 16;
          unint64_t v36 = v31 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            long long v37 = *(_OWORD *)v35;
            *(v34 - 1) = *((_OWORD *)v35 - 1);
            _OWORD *v34 = v37;
            v34 -= 2;
            v35 -= 32;
            v36 -= 16;
          }
          while (v36);
          uint64_t v8 = v33;
          if (v31 != (v31 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_71:
            do
            {
              __int16 v38 = *((_WORD *)v8 - 1);
              v8 -= 2;
              *--uint64_t v17 = v38;
            }
            while (v8 != v10);
          }
LABEL_63:
          uint64_t v8 = *v9;
          goto LABEL_64;
        }
        if ((v15 & 0x8000000000000000) == 0)
        {
          uint64_t v16 = operator new(2 * v15);
          uint64_t v17 = &v16[2 * v12];
          uint64_t v18 = &v16[2 * v15];
          *uint64_t v17 = v6;
          uint64_t v19 = (uint64_t)(v17 + 1);
          uint64_t v20 = (char *)(v8 - v10);
          if (v8 == v10) {
            goto LABEL_64;
          }
          goto LABEL_30;
        }
LABEL_68:
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
LABEL_67:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
LABEL_28:
    *(_WORD *)uint64_t v8 = v6;
    uint64_t v19 = (uint64_t)(v8 + 2);
    goto LABEL_66;
  }
  char v9 = (char **)(a1 + 112);
  __int16 v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
  uint64_t v8 = *(char **)(a1 + 120);
  unint64_t v21 = *(void *)(a1 + 128);
  if (*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v8 < v21) {
      goto LABEL_28;
    }
    uint64_t v22 = *v9;
    uint64_t v23 = v8 - *v9;
    if (v23 <= -3) {
      goto LABEL_67;
    }
    uint64_t v24 = v23 >> 1;
    unint64_t v25 = v21 - (void)v22;
    if (v25 <= (v23 >> 1) + 1) {
      unint64_t v26 = v24 + 1;
    }
    else {
      unint64_t v26 = v25;
    }
    if (v25 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v27 = v26;
    }
    if (v27)
    {
      if (v27 < 0) {
        goto LABEL_68;
      }
      uint64_t v28 = operator new(2 * v27);
      uint64_t v17 = &v28[2 * v24];
      uint64_t v18 = &v28[2 * v27];
      *uint64_t v17 = v6;
      uint64_t v19 = (uint64_t)(v17 + 1);
      unint64_t v29 = (char *)(v8 - v22);
      if (v8 == v22) {
        goto LABEL_64;
      }
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v17 = (_WORD *)(2 * v24);
      uint64_t v18 = 0;
      *(_WORD *)(2 * v24) = v6;
      uint64_t v19 = 2 * v24 + 2;
      unint64_t v29 = (char *)(v8 - v22);
      if (v8 == v22) {
        goto LABEL_64;
      }
    }
    unint64_t v47 = (unint64_t)(v29 - 2);
    if (v47 < 0x1E) {
      goto LABEL_72;
    }
    if ((unint64_t)(v8 - &v28[v23 & 0xFFFFFFFFFFFFFFFELL]) < 0x20) {
      goto LABEL_72;
    }
    uint64_t v48 = (v47 >> 1) + 1;
    unint64_t v49 = 2 * (v48 & 0xFFFFFFFFFFFFFFF0);
    unint64_t v50 = &v8[-v49];
    uint64_t v17 = (_WORD *)((char *)v17 - v49);
    uint64_t v51 = &v28[2 * v24 - 16];
    size_t v52 = v8 - 16;
    unint64_t v53 = v48 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v54 = *(_OWORD *)v52;
      *(v51 - 1) = *((_OWORD *)v52 - 1);
      _OWORD *v51 = v54;
      v51 -= 2;
      v52 -= 32;
      v53 -= 16;
    }
    while (v53);
    uint64_t v8 = v50;
    if (v48 != (v48 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        __int16 v55 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--uint64_t v17 = v55;
      }
      while (v8 != v22);
    }
    goto LABEL_63;
  }
  if ((unint64_t)v8 < v21) {
    goto LABEL_28;
  }
  unint64_t v39 = *v9;
  uint64_t v40 = v8 - *v9;
  if (v40 <= -3) {
    goto LABEL_67;
  }
  uint64_t v41 = v40 >> 1;
  unint64_t v42 = v21 - (void)v39;
  if (v42 <= (v40 >> 1) + 1) {
    unint64_t v43 = v41 + 1;
  }
  else {
    unint64_t v43 = v42;
  }
  if (v42 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v44 = v43;
  }
  if (!v44)
  {
    uint64_t v45 = 0;
    uint64_t v17 = (_WORD *)(2 * v41);
    uint64_t v18 = 0;
    *(_WORD *)(2 * v41) = v6;
    uint64_t v19 = 2 * v41 + 2;
    uint64_t v46 = (char *)(v8 - v39);
    if (v8 == v39) {
      goto LABEL_64;
    }
    goto LABEL_57;
  }
  if (v44 < 0) {
    goto LABEL_68;
  }
  uint64_t v45 = operator new(2 * v44);
  uint64_t v17 = &v45[2 * v41];
  uint64_t v18 = &v45[2 * v44];
  *uint64_t v17 = v6;
  uint64_t v19 = (uint64_t)(v17 + 1);
  uint64_t v46 = (char *)(v8 - v39);
  if (v8 != v39)
  {
LABEL_57:
    unint64_t v56 = (unint64_t)(v46 - 2);
    if (v56 < 0x1E) {
      goto LABEL_73;
    }
    if ((unint64_t)(v8 - &v45[v40 & 0xFFFFFFFFFFFFFFFELL]) < 0x20) {
      goto LABEL_73;
    }
    uint64_t v57 = (v56 >> 1) + 1;
    unint64_t v58 = 2 * (v57 & 0xFFFFFFFFFFFFFFF0);
    int v59 = &v8[-v58];
    uint64_t v17 = (_WORD *)((char *)v17 - v58);
    v60 = &v45[2 * v41 - 16];
    size_t v61 = v8 - 16;
    unint64_t v62 = v57 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v63 = *(_OWORD *)v61;
      *(v60 - 1) = *((_OWORD *)v61 - 1);
      _OWORD *v60 = v63;
      v60 -= 2;
      v61 -= 32;
      v62 -= 16;
    }
    while (v62);
    uint64_t v8 = v59;
    if (v57 != (v57 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_73:
      do
      {
        __int16 v64 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--uint64_t v17 = v64;
      }
      while (v8 != v39);
    }
    goto LABEL_63;
  }
LABEL_64:
  *(void *)(a1 + 112) = v17;
  *(void *)(a1 + 120) = v19;
  *(void *)(a1 + 128) = v18;
  if (v8) {
    operator delete(v8);
  }
LABEL_66:
  *(void *)(a1 + 120) = v19;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26365FFDC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::__lookup_collatename<char const*>(unsigned char *__src@<X1>, uint64_t a2@<X0>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  size_t v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v5 <= 0x16)
  {
    __dst[23] = (_BYTE)a3 - (_BYTE)__src;
    char v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v5);
    v9 += v5;
    goto LABEL_9;
  }
  uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v10 = v5 | 7;
  }
  uint64_t v11 = v10 + 1;
  char v9 = operator new(v10 + 1);
  *(void *)&__dst[8] = v5;
  *(void *)&__dst[16] = v11 | 0x8000000000000000;
  *(void *)__dst = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  unsigned char *v9 = 0;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    uint64_t v12 = *(char **)__dst;
    if (!*(void *)&__dst[8]) {
      goto LABEL_18;
    }
  }
  else
  {
    if (!__dst[23]) {
      return;
    }
    uint64_t v12 = __dst;
  }
  std::__get_collation_name(&v19, v12);
  *(_OWORD *)a4 = *(_OWORD *)&v19.__r_.__value_.__l.__data_;
  unint64_t v13 = v19.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v19.__r_.__value_.__l + 2);
  unint64_t v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0) {
    unint64_t v14 = *(void *)(a4 + 8);
  }
  if (v14) {
    goto LABEL_16;
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
    uint64_t v12 = *(char **)__dst;
    if (*(void *)&__dst[8] < 3uLL)
    {
LABEL_24:
      (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v19);
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      *(std::string *)a4 = v19;
      if (*(char *)(a4 + 23) < 0)
      {
        uint64_t v16 = *(void *)(a4 + 8);
        if (v16 == 1 || v16 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if (__dst[23] >= 0) {
              uint64_t v17 = __dst;
            }
            else {
              uint64_t v17 = *(unsigned char **)__dst;
            }
            if (__dst[23] >= 0) {
              size_t v18 = __dst[23];
            }
            else {
              size_t v18 = *(void *)&__dst[8];
            }
            std::string::__assign_no_alias<false>((void **)a4, v17, v18);
          }
        }
        else
        {
          **(unsigned char **)a4 = 0;
          *(void *)(a4 + 8) = 0;
        }
      }
      else
      {
        int v15 = *(unsigned __int8 *)(a4 + 23);
        if (v15 == 1 || v15 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              std::string::__assign_no_alias<true>((void *)a4, *(void **)__dst, *(size_t *)&__dst[8]);
            }
            else
            {
              *(_OWORD *)a4 = *(_OWORD *)__dst;
              *(void *)(a4 + 16) = *(void *)&__dst[16];
            }
          }
        }
        else
        {
          *(unsigned char *)a4 = 0;
          *(unsigned char *)(a4 + 23) = 0;
        }
      }
LABEL_16:
      if ((__dst[23] & 0x80000000) == 0) {
        return;
      }
      uint64_t v12 = *(char **)__dst;
    }
LABEL_18:
    operator delete(v12);
    return;
  }
  if (__dst[23] < 3u) {
    goto LABEL_24;
  }
}

void sub_263660264(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, unsigned char **a4@<X8>)
{
  unint64_t v5 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v5 > 0x16)
  {
    uint64_t v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v16 = v5 | 7;
    }
    uint64_t v17 = v16 + 1;
    char v9 = operator new(v16 + 1);
    __p[1] = (void *)v5;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    uint64_t v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  char v9 = __p;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v5 < 0x20 || (unint64_t)v9 - a2 < 0x20)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (char *)a2;
  }
  else
  {
    uint64_t v10 = (char *)v9 + (v5 & 0xFFFFFFFFFFFFFFE0);
    uint64_t v11 = (char *)(a2 + (v5 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v12 = (long long *)(a2 + 16);
    unint64_t v13 = v9 + 1;
    unint64_t v14 = v5 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      _OWORD *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v5 == (v5 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a3);
LABEL_16:
  *uint64_t v10 = 0;
  memset(a4, 170, 24);
  std::string v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    uint64_t v20 = __p;
  }
  else {
    uint64_t v20 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    std::string v19 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v20, &v19[(void)v20]);
  unint64_t v21 = (unsigned char *)*((unsigned __int8 *)a4 + 23);
  int v22 = (char)v21;
  if ((char)v21 < 0) {
    unint64_t v21 = a4[1];
  }
  if (v21 == (unsigned char *)1) {
    goto LABEL_32;
  }
  if (v21 != (unsigned char *)12)
  {
    if (v22 < 0)
    {
      **a4 = 0;
      a4[1] = 0;
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
        return;
      }
LABEL_35:
      operator delete(__p[0]);
      return;
    }
    *(unsigned char *)a4 = 0;
    *((unsigned char *)a4 + 23) = 0;
LABEL_32:
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_35;
  }
  if (v22 >= 0) {
    uint64_t v23 = a4;
  }
  else {
    uint64_t v23 = *a4;
  }
  v23[11] = v23[3];
  if (SHIBYTE(__p[2]) < 0) {
    goto LABEL_35;
  }
}

void sub_2636604B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263660514(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<char const*>(uint64_t a1, unsigned char *__src, unsigned char *a3, BOOL a4)
{
  size_t v4 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a3 - (_BYTE)__src;
    char v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v4);
    char v9 = (void **)((char *)v9 + v4);
    goto LABEL_9;
  }
  uint64_t v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v10 = v4 | 7;
  }
  uint64_t v11 = v10 + 1;
  char v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v4;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)char v9 = 0;
  uint64_t v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unint64_t v13 = __dst;
  }
  else {
    unint64_t v13 = (void **)__dst[0];
  }
  if (SHIBYTE(__dst[2]) < 0) {
    uint64_t v12 = (char *)__dst[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v13, &v12[(void)v13]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unint64_t v14 = (const char *)__dst;
  }
  else {
    unint64_t v14 = (const char *)__dst[0];
  }
  uint64_t classname = std::__get_classname(v14, a4);
  if (SHIBYTE(__dst[2]) < 0) {
    operator delete(__dst[0]);
  }
  return classname;
}

void sub_26366067C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (!*(unsigned char *)(a1 + 169))
  {
    __int16 v6 = (void *)(a1 + 64);
    unint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v16 = *(void *)(a1 + 80);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v5 < v16) {
        goto LABEL_24;
      }
      uint64_t v17 = (unsigned char *)*v6;
      unint64_t v18 = (unint64_t)&v5[-*v6];
      unint64_t v19 = v18 + 1;
      if ((uint64_t)(v18 + 1) >= 0)
      {
        unint64_t v20 = v16 - (void)v17;
        if (2 * v20 > v19) {
          unint64_t v19 = 2 * v20;
        }
        if (v20 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v21 = v19;
        }
        if (v21)
        {
          uint64_t v12 = operator new(v21);
          unint64_t v13 = &v12[v18];
          unint64_t v14 = &v12[v21];
          v12[v18] = v2;
          uint64_t v15 = (uint64_t)&v12[v18 + 1];
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v12 = 0;
          unint64_t v13 = &v5[-*v6];
          unint64_t v14 = 0;
          *(unsigned char *)unint64_t v18 = a2;
          uint64_t v15 = v18 + 1;
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        if (v18 >= 8 && (unint64_t)(v17 - v12) >= 0x20)
        {
          if (v18 >= 0x20)
          {
            unint64_t v28 = v18 & 0xFFFFFFFFFFFFFFE0;
            __int16 v38 = (long long *)(v5 - 16);
            unint64_t v39 = &v12[v5 - 16 - v17];
            unint64_t v40 = v18 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v41 = *v38;
              *(v39 - 1) = *(v38 - 1);
              *unint64_t v39 = v41;
              v39 -= 2;
              v38 -= 2;
              v40 -= 32;
            }
            while (v40);
            if (v18 == v28) {
              goto LABEL_86;
            }
            if ((v18 & 0x18) == 0)
            {
              v13 -= v28;
              v5 -= v28;
              goto LABEL_80;
            }
          }
          else
          {
            unint64_t v28 = 0;
          }
          v13 -= v18 & 0xFFFFFFFFFFFFFFF8;
          unint64_t v42 = &v5[-v28 - 8];
          unint64_t v43 = &v12[v42 - v17];
          unint64_t v44 = v28 - (v18 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v45 = *(void *)v42;
            v42 -= 8;
            *v43-- = v45;
            v44 += 8;
          }
          while (v44);
          v5 -= v18 & 0xFFFFFFFFFFFFFFF8;
          if (v18 == (v18 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_86;
          }
        }
LABEL_80:
        unint64_t v56 = v13 - 1;
        do
        {
          char v57 = *--v5;
          *v56-- = v57;
        }
        while (v5 != v17);
        goto LABEL_86;
      }
LABEL_89:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if ((unint64_t)v5 < v16) {
      goto LABEL_24;
    }
    uint64_t v23 = (unsigned char *)*v6;
    unint64_t v24 = (unint64_t)&v5[-*v6];
    unint64_t v25 = v24 + 1;
    if ((uint64_t)(v24 + 1) < 0) {
      goto LABEL_89;
    }
    unint64_t v26 = v16 - (void)v23;
    if (2 * v26 > v25) {
      unint64_t v25 = 2 * v26;
    }
    if (v26 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v27 = v25;
    }
    if (v27)
    {
      uint64_t v12 = operator new(v27);
      unint64_t v13 = &v12[v24];
      unint64_t v14 = &v12[v27];
      v12[v24] = v2;
      uint64_t v15 = (uint64_t)&v12[v24 + 1];
      if (v5 == v23)
      {
LABEL_49:
        *(void *)(a1 + 64) = v13;
        *(void *)(a1 + 72) = v15;
        *(void *)(a1 + 80) = v14;
        if (!v5) {
          goto LABEL_88;
        }
        goto LABEL_87;
      }
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v5[-*v6];
      unint64_t v14 = 0;
      *(unsigned char *)unint64_t v24 = a2;
      uint64_t v15 = v24 + 1;
      if (v5 == v23) {
        goto LABEL_49;
      }
    }
    if (v24 >= 8 && (unint64_t)(v23 - v12) >= 0x20)
    {
      if (v24 >= 0x20)
      {
        unint64_t v29 = v24 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v46 = (long long *)(v5 - 16);
        unint64_t v47 = &v12[v5 - 16 - v23];
        unint64_t v48 = v24 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v49 = *v46;
          *(v47 - 1) = *(v46 - 1);
          _OWORD *v47 = v49;
          v47 -= 2;
          v46 -= 2;
          v48 -= 32;
        }
        while (v48);
        if (v24 == v29) {
          goto LABEL_86;
        }
        if ((v24 & 0x18) == 0)
        {
          v13 -= v29;
          v5 -= v29;
          goto LABEL_84;
        }
      }
      else
      {
        unint64_t v29 = 0;
      }
      v13 -= v24 & 0xFFFFFFFFFFFFFFF8;
      unint64_t v50 = &v5[-v29 - 8];
      uint64_t v51 = &v12[v50 - v23];
      unint64_t v52 = v29 - (v24 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v53 = *(void *)v50;
        v50 -= 8;
        *v51-- = v53;
        v52 += 8;
      }
      while (v52);
      v5 -= v24 & 0xFFFFFFFFFFFFFFF8;
      if (v24 == (v24 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_86;
      }
    }
LABEL_84:
    unint64_t v58 = v13 - 1;
    do
    {
      char v59 = *--v5;
      *v58-- = v59;
    }
    while (v5 != v23);
    goto LABEL_86;
  }
  char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  unint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v4 = *(void *)(a1 + 80);
  if ((unint64_t)v5 < v4)
  {
LABEL_24:
    *unint64_t v5 = v2;
    uint64_t v15 = (uint64_t)(v5 + 1);
    goto LABEL_88;
  }
  __int16 v6 = (void *)(a1 + 64);
  unint64_t v7 = *(unsigned char **)(a1 + 64);
  unint64_t v8 = v5 - v7;
  uint64_t v9 = v5 - v7 + 1;
  if (v9 < 0) {
    goto LABEL_89;
  }
  unint64_t v10 = v4 - (void)v7;
  if (2 * v10 > v9) {
    uint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v11 = v9;
  }
  if (v11)
  {
    uint64_t v12 = operator new(v11);
    unint64_t v13 = &v12[v8];
    unint64_t v14 = &v12[v11];
    v12[v8] = v2;
    uint64_t v15 = (uint64_t)&v12[v8 + 1];
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v13 = (char *)(v5 - v7);
    unint64_t v14 = 0;
    *(unsigned char *)unint64_t v8 = v2;
    uint64_t v15 = v8 + 1;
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20) {
    goto LABEL_76;
  }
  if (v8 < 0x20)
  {
    unint64_t v22 = 0;
    goto LABEL_55;
  }
  unint64_t v22 = v8 & 0xFFFFFFFFFFFFFFE0;
  unint64_t v30 = (long long *)(v5 - 16);
  uint64_t v31 = &v12[v5 - 16 - v7];
  unint64_t v32 = v8 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v33 = *v30;
    *(v31 - 1) = *(v30 - 1);
    *uint64_t v31 = v33;
    v31 -= 2;
    v30 -= 2;
    v32 -= 32;
  }
  while (v32);
  if (v8 != v22)
  {
    if ((v8 & 0x18) == 0)
    {
      v13 -= v22;
      v5 -= v22;
      goto LABEL_76;
    }
LABEL_55:
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    int v34 = &v5[-v22 - 8];
    char v35 = &v12[v34 - v7];
    unint64_t v36 = v22 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v37 = *(void *)v34;
      v34 -= 8;
      *v35-- = v37;
      v36 += 8;
    }
    while (v36);
    v5 -= v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_86;
    }
LABEL_76:
    long long v54 = v13 - 1;
    do
    {
      char v55 = *--v5;
      *v54-- = v55;
    }
    while (v5 != v7);
  }
LABEL_86:
  unint64_t v5 = (unsigned char *)*v6;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v15;
  *(void *)(a1 + 80) = v14;
  if (v5) {
LABEL_87:
  }
    operator delete(v5);
LABEL_88:
  *(void *)(a1 + 72) = v15;
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, char *a3)
{
  unint64_t v3 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v3 > 0x16)
  {
    uint64_t v14 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v14 = v3 | 7;
    }
    uint64_t v15 = v14 + 1;
    unint64_t v7 = operator new(v14 + 1);
    __p[1] = (void *)v3;
    __p[2] = (void *)(v15 | 0x8000000000000000);
    __p[0] = v7;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    unint64_t v8 = v7;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  unint64_t v7 = __p;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v3 < 0x20 || (unint64_t)v7 - a2 < 0x20)
  {
    unint64_t v8 = v7;
    uint64_t v9 = (char *)a2;
  }
  else
  {
    unint64_t v8 = (char *)v7 + (v3 & 0xFFFFFFFFFFFFFFE0);
    uint64_t v9 = (char *)(a2 + (v3 & 0xFFFFFFFFFFFFFFE0));
    unint64_t v10 = (long long *)(a2 + 16);
    size_t v11 = v7 + 1;
    unint64_t v12 = v3 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v13 = *v10;
      *(v11 - 1) = *(v10 - 1);
      *size_t v11 = v13;
      v10 += 2;
      v11 += 2;
      v12 -= 32;
    }
    while (v12);
    if (v3 == (v3 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v16 = *v9++;
    *v8++ = v16;
  }
  while (v9 != a3);
LABEL_16:
  unsigned char *v8 = 0;
  uint64_t v17 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v18 = __p;
  }
  else {
    unint64_t v18 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    uint64_t v17 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v18, &v17[(void)v18]);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
}

void sub_263660CC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263660D28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x555555555555555) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v6 = 0x555555555555555;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x555555555555555) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    unint64_t v7 = (char *)operator new(48 * v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  unint64_t v8 = &v7[48 * v3];
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  uint64_t v9 = &v7[48 * v6];
  long long v10 = *(_OWORD *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((void *)v8 + 5) = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  size_t v11 = v8 + 48;
  unint64_t v12 = (void **)*a1;
  long long v13 = (void **)a1[1];
  if (v13 != *a1)
  {
    do
    {
      long long v14 = *((_OWORD *)v13 - 3);
      *((void *)v8 - 4) = *(v13 - 4);
      *((_OWORD *)v8 - 3) = v14;
      *(v13 - 5) = 0;
      *(v13 - 4) = 0;
      *(v13 - 6) = 0;
      long long v15 = *(_OWORD *)(v13 - 3);
      *((void *)v8 - 1) = *(v13 - 1);
      *(_OWORD *)(v8 - 24) = v15;
      v8 -= 48;
      *(v13 - 2) = 0;
      *(v13 - 1) = 0;
      *(v13 - 3) = 0;
      v13 -= 6;
    }
    while (v13 != v12);
    long long v13 = (void **)*a1;
    char v16 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    while (1)
    {
      if (v16 == v13) {
        goto LABEL_22;
      }
      if (*((char *)v16 - 1) < 0)
      {
        operator delete(*(v16 - 3));
        if ((*((char *)v16 - 25) & 0x80000000) == 0) {
          goto LABEL_14;
        }
      }
      else if ((*((char *)v16 - 25) & 0x80000000) == 0)
      {
        goto LABEL_14;
      }
      operator delete(*(v16 - 6));
LABEL_14:
      v16 -= 6;
    }
  }
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
LABEL_22:
  if (v13) {
    operator delete(v13);
  }
  return v11;
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  char v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  char v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  char v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  char v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8 = __mexp_end;
  int v9 = __mexp_begin;
  long long v14 = operator new(0x10uLL);
  std::vector<char>::pointer end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  uint64_t v17 = operator new(0x38uLL);
  unsigned int loop_count = this->__loop_count_;
  *((void *)v17 + 1) = __s->__first_;
  *((void *)v17 + 2) = v14;
  *(void *)uint64_t v17 = &unk_270EA2DC0;
  *((void *)v17 + 3) = __min;
  *((void *)v17 + 4) = __max;
  *((_DWORD *)v17 + 10) = loop_count;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((unsigned char *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  unint64_t v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)&unk_270EA2E50;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((void *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = loop_count + 1;
}

void sub_263661228(_Unwind_Exception *a1)
{
  std::__loop<char>::~__loop(v1);
  _Unwind_Resume(a1);
}

void sub_26366123C(_Unwind_Exception *a1)
{
  std::__empty_state<char>::~__empty_state(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263661294(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_2636612EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EA2E20;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  unint64_t v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::vector<std::csub_match> __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EA2E20;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  unint64_t v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }

  operator delete(__p);
}

uint64_t std::__loop<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 40);
  uint64_t v3 = *(void *)(a2 + 56);
  unint64_t v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 != -991)
  {
    *unint64_t v4 = 0;
    if (!*(void *)(result + 32))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_28;
    }
    if (*(void *)(result + 24))
    {
      *(_DWORD *)a2 = -994;
      *(void *)(a2 + 80) = *(void *)(result + 8);
      *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
      int v20 = *(_DWORD *)(result + 44);
      int v21 = *(_DWORD *)(result + 48);
      if (v20 == v21) {
        return result;
      }
      uint64_t v22 = (v21 - 1);
      uint64_t v23 = (v20 - 1);
      uint64_t v24 = *(void *)(a2 + 24);
      uint64_t v25 = *(void *)(a2 + 32);
      uint64_t v26 = v22 - v23;
      if ((unint64_t)(v22 - v23) >= 2)
      {
        uint64_t v27 = (v26 & 0xFFFFFFFFFFFFFFFELL) + v23;
        uint64_t v28 = v25 + 24 * v23 + 24;
        unint64_t v29 = v26 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *(void *)(v28 - 24) = v24;
          *(void *)(v28 - 16) = v24;
          *(void *)uint64_t v28 = v24;
          *(void *)(v28 + 8) = v24;
          *(unsigned char *)(v28 - 8) = 0;
          *(unsigned char *)(v28 + 16) = 0;
          v28 += 48;
          v29 -= 2;
        }
        while (v29);
        if (v26 == (v26 & 0xFFFFFFFFFFFFFFFELL)) {
          return result;
        }
      }
      else
      {
        uint64_t v27 = v23;
      }
      uint64_t v30 = v22 - v27;
      uint64_t v31 = (unsigned char *)(v25 + 24 * v27 + 16);
      do
      {
        *((void *)v31 - 2) = v24;
        *((void *)v31 - 1) = v24;
        *uint64_t v31 = 0;
        v31 += 24;
        --v30;
      }
      while (v30);
      return result;
    }
LABEL_26:
    *(_DWORD *)a2 = -992;
    return result;
  }
  unint64_t v5 = *v4 + 1;
  *unint64_t v4 = v5;
  unint64_t v6 = *(void *)(result + 24);
  unint64_t v7 = *(void *)(result + 32);
  BOOL v8 = v5 < v7;
  if (v5 < v7 && v5 >= v6) {
    BOOL v8 = v5 < v7 && *(void *)(v3 + 16 * v2 + 8) != *(void *)(a2 + 16);
  }
  if (v8 && v5 >= v6) {
    goto LABEL_26;
  }
  *(_DWORD *)a2 = -994;
  if (!v8)
  {
LABEL_28:
    *(void *)(a2 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a2 + 80) = *(void *)(result + 8);
  *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
  int v12 = *(_DWORD *)(result + 44);
  int v13 = *(_DWORD *)(result + 48);
  if (v12 == v13) {
    return result;
  }
  uint64_t v14 = (v13 - 1);
  uint64_t v15 = (v12 - 1);
  uint64_t v16 = *(void *)(a2 + 24);
  uint64_t v17 = *(void *)(a2 + 32);
  uint64_t v18 = v14 - v15;
  if ((unint64_t)(v14 - v15) < 2)
  {
    uint64_t v19 = v15;
LABEL_39:
    uint64_t v34 = v14 - v19;
    char v35 = (unsigned char *)(v17 + 24 * v19 + 16);
    do
    {
      *((void *)v35 - 2) = v16;
      *((void *)v35 - 1) = v16;
      *char v35 = 0;
      v35 += 24;
      --v34;
    }
    while (v34);
    return result;
  }
  uint64_t v19 = (v18 & 0xFFFFFFFFFFFFFFFELL) + v15;
  uint64_t v32 = v17 + 24 * v15 + 24;
  unint64_t v33 = v18 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    *(void *)(v32 - 24) = v16;
    *(void *)(v32 - 16) = v16;
    *(void *)uint64_t v32 = v16;
    *(void *)(v32 + 8) = v16;
    *(unsigned char *)(v32 - 8) = 0;
    *(unsigned char *)(v32 + 16) = 0;
    v32 += 48;
    v33 -= 2;
  }
  while (v33);
  if (v18 != (v18 & 0xFFFFFFFFFFFFFFFELL)) {
    goto LABEL_39;
  }
  return result;
}

uint64_t std::__loop<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  if (*(unsigned __int8 *)(result + 52) == a2)
  {
    *(void *)(a3 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a3 + 80) = *(void *)(result + 8);
  int v3 = *(_DWORD *)(result + 44);
  *(void *)(*(void *)(a3 + 56) + 16 * *(unsigned int *)(result + 40) + 8) = *(void *)(a3 + 16);
  int v4 = *(_DWORD *)(result + 48);
  if (v3 != v4)
  {
    uint64_t v5 = (v4 - 1);
    uint64_t v6 = (v3 - 1);
    uint64_t v7 = *(void *)(a3 + 24);
    uint64_t v8 = *(void *)(a3 + 32);
    uint64_t v9 = v5 - v6;
    if ((unint64_t)(v5 - v6) < 2)
    {
      uint64_t v10 = v6;
LABEL_9:
      uint64_t v13 = v5 - v10;
      uint64_t v14 = (unsigned char *)(v8 + 24 * v10 + 16);
      do
      {
        *((void *)v14 - 2) = v7;
        *((void *)v14 - 1) = v7;
        *uint64_t v14 = 0;
        v14 += 24;
        --v13;
      }
      while (v13);
      return result;
    }
    uint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFFELL) + v6;
    uint64_t v11 = v8 + 24 * v6 + 24;
    unint64_t v12 = v9 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(void *)(v11 - 24) = v7;
      *(void *)(v11 - 16) = v7;
      *(void *)uint64_t v11 = v7;
      *(void *)(v11 + 8) = v7;
      *(unsigned char *)(v11 - 8) = 0;
      *(unsigned char *)(v11 + 16) = 0;
      v11 += 48;
      v12 -= 2;
    }
    while (v12);
    if (v9 != (v9 & 0xFFFFFFFFFFFFFFFELL)) {
      goto LABEL_9;
    }
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EA2E20;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::vector<std::csub_match> __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EA2E20;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }

  operator delete(__p);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EA2E20;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::vector<std::csub_match> __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EA2E20;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }

  operator delete(__p);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E67240](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263661AC0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>((std::basic_regex<char> *)a1, (char *)a2, a3);
  uint64_t v7 = v6;
  if (v6 != (char *)a2 || v6 == a3) {
    return v7;
  }
  if ((char *)(a2 + 1) == a3) {
    return (char *)a2;
  }
  if (*(unsigned char *)a2 != 92) {
    return (char *)a2;
  }
  int v8 = *(unsigned __int8 *)(a2 + 1);
  if (v8 == 40)
  {
    uint64_t v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      uint64_t v10 = operator new(0x18uLL);
      int v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(v12 + 8);
      *uint64_t v10 = &unk_270EA2D30;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(void *)(v12 + 8) = v10;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3) {
        goto LABEL_25;
      }
      uint64_t v15 = v9;
      uint64_t v16 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v17 = *(_DWORD *)(a1 + 28);
      uint64_t v18 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, v15, a3);
      if (v18 == v15) {
        break;
      }
      uint64_t v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, v18, (std::basic_regex<char> *)a3, v16, (v17 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v9 != v15);
    if ((char *)&v15->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v15->__traits_.__loc_.__locale_) != 92
      || BYTE1(v15->__traits_.__loc_.__locale_) != 41)
    {
LABEL_25:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    uint64_t v7 = (char *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 41);
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      uint64_t v19 = operator new(0x18uLL);
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(v20 + 8);
      *uint64_t v19 = &unk_270EA2D78;
      v19[1] = v21;
      *((_DWORD *)v19 + 4) = v11;
      *(void *)(v20 + 8) = v19;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return v7;
    }
    return v7;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8) {
    return (char *)a2;
  }
  if ((v8 - 48) > *(_DWORD *)(a1 + 28)) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return (char *)(a2 + 2);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  uint64_t v6 = this;
  if (this == a3) {
    return v6;
  }
  int locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)v6 + 1);
  }
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return v6;
  }
  uint64_t v9 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v9 == a3) {
    goto LABEL_43;
  }
  int v10 = LOBYTE(v9->__traits_.__loc_.__locale_);
  if ((v10 & 0xF8) != 0x30 && (v10 & 0xFE) != 0x38) {
    goto LABEL_43;
  }
  int v11 = v10 - 48;
  uint64_t v12 = (std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_16:
    uint64_t v12 = a3;
  }
  else
  {
    while (1)
    {
      int v13 = LOBYTE(v12->__traits_.__loc_.__locale_);
      if ((v13 & 0xF8) != 0x30 && (v13 & 0xFE) != 0x38) {
        break;
      }
      if (v11 >= 214748364) {
        goto LABEL_43;
      }
      int v11 = v13 + 10 * v11 - 48;
      uint64_t v12 = (std::basic_regex<char> *)((char *)v12 + 1);
      if (v12 == a3) {
        goto LABEL_16;
      }
    }
  }
  if (v12 == v9) {
    goto LABEL_43;
  }
  if (v12 == a3) {
    goto LABEL_41;
  }
  uint64_t v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 1);
  int v15 = LOBYTE(v12->__traits_.__loc_.__locale_);
  if (v15 != 44)
  {
    if (v14 != a3 && v15 == 92 && LOBYTE(v14->__traits_.__loc_.__locale_) == 125)
    {
      uint64_t v19 = (unsigned __int8 *)&v12->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v11, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_41;
  }
  if (v14 == a3) {
    goto LABEL_41;
  }
  int v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
  if ((v16 & 0xF8) == 0x30 || (v16 & 0xFE) == 0x38)
  {
    uint64_t v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2) == a3) {
      goto LABEL_41;
    }
    int v17 = v16 - 48;
    while (1)
    {
      int v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
      if ((v16 & 0xF8) != 0x30 && (v16 & 0xFE) != 0x38) {
        break;
      }
      if (v17 >= 214748364) {
        goto LABEL_43;
      }
      int v17 = v16 + 10 * v17 - 48;
      uint64_t v14 = (std::basic_regex<char> *)((char *)v14 + 1);
      if (v14 == a3) {
        goto LABEL_41;
      }
    }
  }
  else
  {
    int v17 = -1;
  }
  if (v14 == a3
    || (std::basic_regex<char> *)((char *)&v14->__traits_.__loc_.__locale_ + 1) == a3
    || v16 != 92
    || BYTE1(v14->__traits_.__loc_.__locale_) != 125)
  {
LABEL_41:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  }
  uint64_t v18 = (unsigned __int8 *)v14 + 2 * (BYTE1(v14->__traits_.__loc_.__locale_) == 125);
  if (v17 != -1)
  {
    if (v17 >= v11)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v17, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v18;
    }
LABEL_43:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v18;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  if (a2 != a3)
  {
    uint64_t v6 = a2 + 1;
    int v5 = *a2;
    if (a2 + 1 != a3 || v5 != 36)
    {
      if ((v5 - 46) > 0x2E || ((1 << (v5 - 46)) & 0x600000000001) == 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
        return a2 + 1;
      }
      if (v6 == a3 || v5 != 92)
      {
        if (v5 == 46)
        {
          int v10 = (std::__node<char> *)operator new(0x10uLL);
          std::vector<char>::pointer end = this->__end_;
          first = end->__first_;
          v10->__vftable = (std::__node<char>_vtbl *)&unk_270EA2F28;
          v10[1].__vftable = (std::__node<char>_vtbl *)first;
          end->__first_ = v10;
          this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
          return a2 + 1;
        }
      }
      else
      {
        int v9 = *v6;
        if ((v9 - 36) <= 0x3A && ((1 << (v9 - 36)) & 0x580000000000441) != 0)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v9);
          return a2 + 2;
        }
      }
    }
  }

  return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > this->__marked_count_) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>((std::basic_regex<char> *)a1, a2, a3);
  if (v8 != a2
    || (int v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(a1, a2, a3), v8 != a2))
  {
    if (v8 != a2) {
      goto LABEL_25;
    }
LABEL_4:
    if (v8 != a3)
    {
      int locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
      if (locale_low == 36)
      {
        int v10 = operator new(0x18uLL);
        BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
        uint64_t v12 = *(void *)(a1 + 56);
        v10[1] = *(void *)(v12 + 8);
        int v13 = &unk_270EA2A18;
        goto LABEL_13;
      }
      if (locale_low != 40)
      {
        if (locale_low == 94)
        {
          int v10 = operator new(0x18uLL);
          BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
          uint64_t v12 = *(void *)(a1 + 56);
          v10[1] = *(void *)(v12 + 8);
          int v13 = &unk_270EA29D0;
LABEL_13:
          *int v10 = v13;
          *((unsigned char *)v10 + 16) = v11;
          *(void *)(v12 + 8) = v10;
          goto LABEL_14;
        }
        return a2;
      }
      if ((*(unsigned char *)(a1 + 24) & 2) != 0)
      {
        int v18 = *(_DWORD *)(a1 + 28);
      }
      else
      {
        int v17 = operator new(0x18uLL);
        int v18 = *(_DWORD *)(a1 + 28) + 1;
        *(_DWORD *)(a1 + 28) = v18;
        uint64_t v19 = *(void *)(a1 + 56);
        uint64_t v20 = *(void *)(v19 + 8);
        *int v17 = &unk_270EA2D30;
        v17[1] = v20;
        *((_DWORD *)v17 + 4) = v18;
        *(void *)(v19 + 8) = v17;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      }
      ++*(_DWORD *)(a1 + 36);
      uint64_t v21 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
      if (v21 == a3 || (uint64_t v22 = v21, LOBYTE(v21->__traits_.__loc_.__locale_) != 41)) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if ((*(unsigned char *)(a1 + 24) & 2) == 0)
      {
        uint64_t v23 = operator new(0x18uLL);
        uint64_t v24 = *(void *)(a1 + 56);
        uint64_t v25 = *(void *)(v24 + 8);
        *uint64_t v23 = &unk_270EA2D78;
        v23[1] = v25;
        *((_DWORD *)v23 + 4) = v18;
        *(void *)(v24 + 8) = v23;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      }
      --*(_DWORD *)(a1 + 36);
      int v8 = (std::basic_regex<char> *)((char *)&v22->__traits_.__loc_.__locale_ + 1);
    }
LABEL_25:
    if (v8 != a2) {
      goto LABEL_26;
    }
    return a2;
  }
  if (a2 == a3 || LOBYTE(a2->__traits_.__loc_.__locale_) != 46)
  {
    int v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(a1, (char *)a2, (char *)a3);
    if (v8 != a2) {
      goto LABEL_25;
    }
    goto LABEL_4;
  }
  uint64_t v14 = operator new(0x10uLL);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(v15 + 8);
  *uint64_t v14 = &unk_270EA2F28;
  v14[1] = v16;
  *(void *)(v15 + 8) = v14;
LABEL_14:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  int v8 = (std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1);
LABEL_26:
  size_t v26 = (*(_DWORD *)(a1 + 28) + 1);

  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v8, a3, v6, (v7 + 1), v26);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  if (this == a3) {
    return this;
  }
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
      return this;
    case ')':
      if (a1->__open_count_) {
        return this;
      }
      break;
    default:
      break;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
  return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  uint64_t v3 = this;
  if (this == a3) {
    return (std::basic_regex<char>::value_type *)v3;
  }
  int v4 = (char *)&this->__traits_.__loc_.__locale_ + 1;
  if ((std::basic_regex<char> *)((char *)&v3->__traits_.__loc_.__locale_ + 1) == a3
    || LOBYTE(v3->__traits_.__loc_.__locale_) != 92)
  {
    return (std::basic_regex<char>::value_type *)v3;
  }
  std::basic_regex<char>::value_type v5 = *v4;
  switch(*v4)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
    case '}':
      std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v5);
      return (char *)v3 + 2;
    default:
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v4, (std::basic_regex<char>::value_type *)a3, 0);
      }
      else
      {
        BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v5);
        uint64_t v8 = 2;
        if (!v7) {
          uint64_t v8 = 0;
        }
        uint64_t result = (char *)v3 + v8;
      }
      break;
  }
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, std::sub_match<const char *> *a2, std::sub_match<const char *> *a3, std::vector<std::csub_match> *this, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  int v10 = *(_DWORD *)(a1 + 28);
  this[1].__begin_ = a3;
  BOOL v11 = (const std::vector<std::csub_match>::value_type *)&this[1];
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  std::vector<std::sub_match<char const*>>::assign(this, (v10 + 1), (std::vector<std::csub_match>::const_reference)&this[1]);
  this[2].__begin_ = a2;
  this[2].__end_ = a2;
  LOBYTE(this[2].__end_cap_.__value_) = 0;
  *(std::pair<const char *, const char *> *)&this[3].__begin_ = v11->std::pair<const char *, const char *>;
  LOBYTE(this[3].__end_cap_.__value_) = this[1].__end_cap_.__value_;
  if ((v9 & 0x800) == 0) {
    this[4].__end_ = a2;
  }
  LOBYTE(this[4].__begin_) = 1;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
  {
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))goto LABEL_28; {
    goto LABEL_13;
    }
  }
  if (*(_DWORD *)(a1 + 28))
  {
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))goto LABEL_28; {
LABEL_13:
    }
    if (a2 != a3 && (v9 & 0x40) == 0)
    {
      int v12 = v9 | 0x80;
      for (unint64_t i = (char *)&a2->first + 1; i != (const char *)a3; ++i)
      {
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
        if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
        {
          if (*(_DWORD *)(a1 + 28))
          {
            if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28; {
          }
            }
          else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)i, (uint64_t)a3, (uint64_t *)this, v12, 0))
          {
            goto LABEL_28;
          }
        }
        else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0))
        {
          goto LABEL_28;
        }
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      }
      std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
      {
        if (*(_DWORD *)(a1 + 28))
        {
          if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28; {
        }
          }
        else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a3, (uint64_t)a3, (uint64_t *)this, v12, 0))
        {
          goto LABEL_28;
        }
      }
      else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0))
      {
        goto LABEL_28;
      }
    }
    uint64_t result = 0;
    this->__end_ = this->__begin_;
    return result;
  }
  if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0) & 1) == 0)goto LABEL_13; {
LABEL_28:
  }
  if (this->__end_ == this->__begin_) {
    std::vector<std::csub_match>::pointer begin = (std::vector<std::csub_match>::pointer)v11;
  }
  else {
    std::vector<std::csub_match>::pointer begin = this->__begin_;
  }
  first = (std::sub_match<const char *> *)begin->first;
  this[2].__end_ = (std::vector<std::csub_match>::pointer)begin->first;
  LOBYTE(this[2].__end_cap_.__value_) = this[2].__begin_ != first;
  second = (std::sub_match<const char *> *)begin->second;
  this[3].__begin_ = second;
  LOBYTE(this[3].__end_cap_.__value_) = second != this[3].__end_;
  return 1;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(std::vector<std::ssub_match> *this, uint64_t a2, std::sub_match<std::__wrap_iter<const char *>> *a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  std::vector<std::ssub_match>::pointer begin = this->__begin_;
  std::vector<char>::pointer end = this->__end_;
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
  if (v11 <= v14)
  {
    if (v11 < v14)
    {
      std::vector<char>::pointer end = (std::vector<std::ssub_match>::pointer)((char *)begin + 8 * ((a4[1] - *a4) >> 3));
      this->__end_ = end;
    }
  }
  else
  {
    std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(this, v11 - v14);
    std::vector<std::ssub_match>::pointer begin = this->__begin_;
    std::vector<char>::pointer end = this->__end_;
  }
  if (end != begin)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v18 = *a4;
    uint64_t v17 = a4[1];
    do
    {
      unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3);
      uint64_t v20 = (void *)(v18 + v15 * 24);
      if (v19 <= v16) {
        uint64_t v21 = a4 + 3;
      }
      else {
        uint64_t v21 = v20;
      }
      begin[v15].first.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *v21 - v10);
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v16) {
        uint64_t v22 = (uint64_t)(a4 + 3);
      }
      else {
        uint64_t v22 = *a4 + v15 * 24;
      }
      this->__begin_[v15].second.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *(void *)(v22 + 8) - v10);
      uint64_t v18 = *a4;
      uint64_t v17 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v17 - *a4) >> 3) <= v16) {
        uint64_t v23 = (uint64_t)(a4 + 3);
      }
      else {
        uint64_t v23 = *a4 + v15 * 24;
      }
      char v24 = *(unsigned char *)(v23 + 16);
      std::vector<std::ssub_match>::pointer begin = this->__begin_;
      std::vector<std::ssub_match>::pointer v25 = this->__end_;
      this->__begin_[v15].matched = v24;
      ++v16;
      ++v15;
    }
    while (v16 < 0xAAAAAAAAAAAAAAABLL * (((char *)v25 - (char *)begin) >> 3));
  }
  this[1].__begin_ = a3;
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  size_t v26 = (std::sub_match<std::__wrap_iter<const char *>> *)(a2 + a4[6] - v10);
  this[2].__begin_ = v26;
  this[2].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[7] - v10);
  LOBYTE(this[2].__end_cap_.__value_) = *((unsigned char *)a4 + 64);
  this[3].__begin_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[9] - v10);
  this[3].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[10] - v10);
  LOBYTE(this[3].__end_cap_.__value_) = *((unsigned char *)a4 + 88);
  if ((a5 & 1) == 0) {
    this[4].__end_ = v26;
  }
  LOBYTE(this[4].__begin_) = *((unsigned char *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v100 = 0u;
  long long v101 = 0u;
  long long v99 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6)
  {
LABEL_79:
    uint64_t v85 = (void **)*((void *)&v99 + 1);
    v86 = (void **)v100;
    *((void *)&v101 + 1) = 0;
    unint64_t v87 = v100 - *((void *)&v99 + 1);
    if ((void)v100 - *((void *)&v99 + 1) < 0x11uLL) {
      goto LABEL_81;
    }
    do
    {
LABEL_80:
      operator delete(*v85);
      v86 = (void **)v100;
      uint64_t v85 = (void **)(*((void *)&v99 + 1) + 8);
      *((void *)&v99 + 1) = v85;
      unint64_t v87 = v100 - (void)v85;
    }
    while ((void)v100 - (void)v85 > 0x10uLL);
    goto LABEL_81;
  }
  *(_DWORD *)v98 = 0;
  memset(&v98[8], 0, 85);
  std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v99);
  unint64_t v11 = *(void *)(*((void *)&v99 + 1) + 8 * (((void)v101 + *((void *)&v101 + 1)) / 0x2AuLL))
      + 96 * (((void)v101 + *((void *)&v101 + 1)) % 0x2AuLL);
  long long v12 = *(_OWORD *)&v98[16];
  *(_OWORD *)unint64_t v11 = *(_OWORD *)v98;
  *(_OWORD *)(v11 + 16) = v12;
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 32) = 0;
  memset(&v98[32], 0, 24);
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *(void *)(v11 + 72) = 0;
  memset(&v98[56], 0, 24);
  uint64_t v13 = *(void *)&v98[80];
  *(void *)(v11 + 85) = *(void *)&v98[85];
  *(void *)(v11 + 80) = v13;
  uint64_t v15 = *((void *)&v101 + 1);
  uint64_t v14 = v101;
  uint64_t v16 = ++*((void *)&v101 + 1);
  uint64_t v17 = *((void *)&v99 + 1);
  unint64_t v18 = *(unsigned int *)(a1 + 32);
  unint64_t v19 = v101 + v15;
  unint64_t v20 = 8 * (v19 / 0x2A);
  unint64_t v21 = 96 * (v19 % 0x2A);
  unint64_t v22 = *(void *)(*((void *)&v99 + 1) + v20) + v21;
  *(_DWORD *)unint64_t v22 = 0;
  *(void *)(v22 + 8) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 16) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 24) = a3;
  unint64_t v23 = *(void *)(v17 + v20) + v21;
  uint64_t v26 = *(void *)(v23 + 56);
  char v24 = (std::vector<std::pair<unsigned long, const char *>> *)(v23 + 56);
  uint64_t v25 = v26;
  unint64_t v27 = ((uint64_t)v24->__end_ - v26) >> 4;
  unint64_t v92 = a4;
  if (v18 <= v27)
  {
    if (v18 < v27) {
      v24->__end_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)(v25 + 16 * v18);
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(v24, v18 - v27);
    uint64_t v16 = *((void *)&v101 + 1);
    uint64_t v14 = v101;
    uint64_t v17 = *((void *)&v99 + 1);
  }
  uint64_t v94 = 0;
  char v95 = 0;
  unsigned int v28 = 0;
  unint64_t v29 = v14 + v16 - 1;
  unint64_t v30 = 8 * (v29 / 0x2A);
  unint64_t v31 = 96 * (v29 % 0x2A);
  *(void *)(*(void *)(v17 + v30) + v31 + 80) = v6;
  uint64_t v93 = a3;
  uint64_t v32 = a3 - a2;
  unint64_t v33 = *(void *)(v17 + v30) + v31;
  *(_DWORD *)(v33 + 88) = a5;
  *(unsigned char *)(v33 + 92) = a6;
  while (2)
  {
    if ((++v28 & 0xFFF) == 0 && (int)(v28 >> 12) >= (int)v32) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    unint64_t v35 = v16 + v101 - 1;
    uint64_t v36 = *(void *)(*((void *)&v99 + 1) + 8 * (v35 / 0x2A));
    unint64_t v37 = v35 % 0x2A;
    uint64_t v38 = v36 + 96 * (v35 % 0x2A);
    unint64_t v40 = (void *)(v38 + 80);
    uint64_t v39 = *(void *)(v38 + 80);
    if (v39) {
      (*(void (**)(uint64_t, unint64_t))(*(void *)v39 + 16))(v39, v36 + 96 * v37);
    }
    switch(*(_DWORD *)v38)
    {
      case 0xFFFFFC18:
        uint64_t v41 = *(void *)(v36 + 96 * v37 + 16);
        if ((a5 & 0x20) != 0 && v41 == a2 || (a5 & 0x1000) != 0 && v41 != v93) {
          goto LABEL_21;
        }
        uint64_t v65 = v41 - *(void *)(v36 + 96 * v37 + 8);
        uint64_t v66 = v94;
        if ((v95 & (v94 >= v65)) == 0) {
          uint64_t v66 = v65;
        }
        if (v66 == v32)
        {
          size_t v67 = (void **)*((void *)&v99 + 1);
          uint64_t v68 = v100;
          if ((void)v100 == *((void *)&v99 + 1))
          {
            *((void *)&v101 + 1) = 0;
            unint64_t v82 = 0;
          }
          else
          {
            int v69 = (void *)(*((void *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A));
            int v70 = (void *)(*v69 + 96 * ((unint64_t)v101 % 0x2A));
            unint64_t v71 = *(void *)(*((void *)&v99 + 1) + 8 * ((*((void *)&v101 + 1) + (void)v101) / 0x2AuLL))
                + 96 * ((*((void *)&v101 + 1) + (void)v101) % 0x2AuLL);
            if (v70 != (void *)v71)
            {
              do
              {
                uint64_t v72 = (void *)v70[7];
                if (v72)
                {
                  v70[8] = v72;
                  operator delete(v72);
                }
                int64_t v73 = (void *)v70[4];
                if (v73)
                {
                  v70[5] = v73;
                  operator delete(v73);
                }
                v70 += 12;
                if ((void *)((char *)v70 - *v69) == (void *)4032)
                {
                  unint64_t v74 = (void *)v69[1];
                  ++v69;
                  int v70 = v74;
                }
              }
              while (v70 != (void *)v71);
              size_t v67 = (void **)*((void *)&v99 + 1);
              uint64_t v68 = v100;
            }
            *((void *)&v101 + 1) = 0;
            unint64_t v82 = v68 - (void)v67;
            if (v82 >= 0x11)
            {
              do
              {
                operator delete(*v67);
                size_t v67 = (void **)(*((void *)&v99 + 1) + 8);
                *((void *)&v99 + 1) = v67;
                unint64_t v82 = v100 - (void)v67;
              }
              while ((void)v100 - (void)v67 > 0x10uLL);
            }
          }
          if (v82 >> 3 == 1)
          {
            uint64_t v83 = 21;
          }
          else
          {
            if (v82 >> 3 != 2)
            {
LABEL_76:
              char v95 = 1;
              uint64_t v94 = v32;
              goto LABEL_8;
            }
            uint64_t v83 = 42;
          }
          *(void *)&long long v101 = v83;
          goto LABEL_76;
        }
        uint64_t v94 = v66;
        unint64_t v75 = *((void *)&v101 + 1) + v101 - 1;
        uint64_t v76 = *(void *)(*((void *)&v99 + 1) + 8 * (v75 / 0x2A));
        unint64_t v77 = v75 % 0x2A;
        v78 = *(void **)(v76 + 96 * (v75 % 0x2A) + 56);
        if (v78)
        {
          *(void *)(v76 + 96 * v77 + 64) = v78;
          operator delete(v78);
        }
        uint64_t v79 = *(void **)(v76 + 96 * v77 + 32);
        if (v79)
        {
          *(void *)(v76 + 96 * v77 + 40) = v79;
          operator delete(v79);
        }
        uint64_t v80 = 42 * ((uint64_t)(v100 - *((void *)&v99 + 1)) >> 3) - 1;
        long long v81 = v101;
        --*((void *)&v101 + 1);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v80 = 0;
        }
        if ((unint64_t)(v80 - (*((void *)&v81 + 1) + v81) + 1) >= 0x54)
        {
          operator delete(*(void **)(v100 - 8));
          *(void *)&long long v100 = v100 - 8;
        }
        char v95 = 1;
LABEL_8:
        uint64_t v16 = *((void *)&v101 + 1);
        if (*((void *)&v101 + 1)) {
          continue;
        }
        if (v95)
        {
          uint64_t v84 = *v92;
          *(void *)uint64_t v84 = a2;
          *(void *)(v84 + 8) = a2 + v94;
          uint64_t v6 = 1;
          *(unsigned char *)(v84 + 16) = 1;
          goto LABEL_79;
        }
        uint64_t v6 = 0;
        uint64_t v85 = (void **)*((void *)&v99 + 1);
        v86 = (void **)v100;
        *((void *)&v101 + 1) = 0;
        unint64_t v87 = v100 - *((void *)&v99 + 1);
        if ((void)v100 - *((void *)&v99 + 1) >= 0x11uLL) {
          goto LABEL_80;
        }
LABEL_81:
        unint64_t v88 = v87 >> 3;
        if (v88 == 1)
        {
          uint64_t v89 = 21;
LABEL_85:
          *(void *)&long long v101 = v89;
        }
        else if (v88 == 2)
        {
          uint64_t v89 = 42;
          goto LABEL_85;
        }
        if (v85 != v86)
        {
          do
          {
            int v90 = *v85++;
            operator delete(v90);
          }
          while (v85 != v86);
          if ((void)v100 != *((void *)&v99 + 1)) {
            *(void *)&long long v100 = v100 + ((*((void *)&v99 + 1) - v100 + 7) & 0xFFFFFFFFFFFFFFF8);
          }
        }
        if ((void)v99) {
          operator delete((void *)v99);
        }
        return v6;
      case 0xFFFFFC19:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_8;
      case 0xFFFFFC1D:
        unint64_t v49 = v101;
        if (!(void)v101)
        {
          std::deque<std::__state<char>>::__add_front_capacity((uint64_t)&v99);
          unint64_t v49 = v101;
        }
        unint64_t v50 = (void *)(*((void *)&v99 + 1) + 8 * (v49 / 0x2A));
        uint64_t v51 = *v50 + 96 * (v49 % 0x2A);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v51 = 0;
        }
        if (v51 == *v50) {
          uint64_t v51 = *(v50 - 1) + 4032;
        }
        long long v52 = *(_OWORD *)(v38 + 16);
        *(_OWORD *)(v51 - 96) = *(_OWORD *)v38;
        *(_OWORD *)(v51 - 80) = v52;
        uint64_t v53 = v36 + 96 * v37;
        *(void *)(v51 - 56) = 0;
        *(void *)(v51 - 48) = 0;
        *(void *)(v51 - 64) = 0;
        *(_OWORD *)(v51 - 64) = *(_OWORD *)(v53 + 32);
        *(void *)(v51 - 48) = *(void *)(v53 + 48);
        *(void *)(v53 + 32) = 0;
        *(void *)(v53 + 40) = 0;
        *(void *)(v53 + 48) = 0;
        *(void *)(v51 - 40) = 0;
        *(void *)(v51 - 32) = 0;
        *(void *)(v51 - 24) = 0;
        *(_OWORD *)(v51 - 40) = *(_OWORD *)(v53 + 56);
        *(void *)(v51 - 24) = *(void *)(v53 + 72);
        *(void *)(v53 + 56) = 0;
        *(void *)(v53 + 64) = 0;
        *(void *)(v53 + 72) = 0;
        uint64_t v54 = *v40;
        *(void *)(v51 - 11) = *(void *)(v38 + 85);
        *(void *)(v51 - 16) = v54;
        uint64_t v55 = *((void *)&v101 + 1);
        *(void *)&long long v101 = v101 - 1;
        ++*((void *)&v101 + 1);
        uint64_t v56 = v55 + v101;
        unint64_t v57 = (v55 + (uint64_t)v101) / 0x2AuLL;
        uint64_t v43 = *(void *)(*((void *)&v99 + 1) + 8 * v57);
        unint64_t v44 = v56 - 42 * v57;
        uint64_t v45 = *(void **)(v43 + 96 * v44 + 56);
        if (!v45) {
          goto LABEL_23;
        }
        goto LABEL_22;
      case 0xFFFFFC1F:
LABEL_21:
        unint64_t v42 = *((void *)&v101 + 1) + v101 - 1;
        uint64_t v43 = *(void *)(*((void *)&v99 + 1) + 8 * (v42 / 0x2A));
        unint64_t v44 = v42 % 0x2A;
        uint64_t v45 = *(void **)(v43 + 96 * (v42 % 0x2A) + 56);
        if (v45)
        {
LABEL_22:
          *(void *)(v43 + 96 * v44 + 64) = v45;
          operator delete(v45);
        }
LABEL_23:
        uint64_t v46 = *(void **)(v43 + 96 * v44 + 32);
        if (v46)
        {
          *(void *)(v43 + 96 * v44 + 40) = v46;
          operator delete(v46);
        }
        uint64_t v47 = 42 * ((uint64_t)(v100 - *((void *)&v99 + 1)) >> 3) - 1;
        long long v48 = v101;
        --*((void *)&v101 + 1);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v47 = 0;
        }
        if ((unint64_t)(v47 - (*((void *)&v48 + 1) + v48) + 1) >= 0x54)
        {
          operator delete(*(void **)(v100 - 8));
          *(void *)&long long v100 = v100 - 8;
        }
        goto LABEL_8;
      case 0xFFFFFC20:
        *(void *)&long long v58 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v58 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v98[64] = v58;
        *(_OWORD *)&v98[80] = v58;
        *(_OWORD *)&v98[32] = v58;
        *(_OWORD *)&v98[48] = v58;
        *(_OWORD *)v98 = v58;
        *(_OWORD *)&v98[16] = v58;
        std::__state<char>::__state((uint64_t)v98, (long long *)(v36 + 96 * v37));
        (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v40 + 24))(*v40, 1, v36 + 96 * v37);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v98[80] + 24))(*(void *)&v98[80], 0, v98);
        uint64_t v59 = *((void *)&v99 + 1);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v60 = 0;
        }
        else {
          uint64_t v60 = 42 * ((uint64_t)(v100 - *((void *)&v99 + 1)) >> 3) - 1;
        }
        unint64_t v61 = *((void *)&v101 + 1) + v101;
        if (v60 == *((void *)&v101 + 1) + (void)v101)
        {
          std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v99);
          uint64_t v59 = *((void *)&v99 + 1);
          unint64_t v61 = *((void *)&v101 + 1) + v101;
        }
        unint64_t v62 = *(void *)(v59 + 8 * (v61 / 0x2A)) + 96 * (v61 % 0x2A);
        long long v63 = *(_OWORD *)&v98[16];
        *(_OWORD *)unint64_t v62 = *(_OWORD *)v98;
        *(_OWORD *)(v62 + 16) = v63;
        *(void *)(v62 + 40) = 0;
        *(void *)(v62 + 48) = 0;
        *(void *)(v62 + 32) = 0;
        *(_OWORD *)(v62 + 32) = *(_OWORD *)&v98[32];
        *(void *)(v62 + 48) = *(void *)&v98[48];
        memset(&v98[32], 0, 24);
        *(void *)(v62 + 56) = 0;
        *(void *)(v62 + 64) = 0;
        *(void *)(v62 + 72) = 0;
        *(_OWORD *)(v62 + 56) = *(_OWORD *)&v98[56];
        *(void *)(v62 + 72) = *(void *)&v98[72];
        memset(&v98[56], 0, 24);
        uint64_t v64 = *(void *)&v98[80];
        *(void *)(v62 + 85) = *(void *)&v98[85];
        *(void *)(v62 + 80) = v64;
        ++*((void *)&v101 + 1);
        if (*(void *)&v98[56])
        {
          *(void *)&v98[64] = *(void *)&v98[56];
          operator delete(*(void **)&v98[56]);
        }
        if (*(void *)&v98[32])
        {
          *(void *)&v98[40] = *(void *)&v98[32];
          operator delete(*(void **)&v98[32]);
        }
        goto LABEL_8;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
  }
}

void sub_263663738(_Unwind_Exception *a1)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_26366374C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::__state<char>::~__state((uint64_t *)va);
  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v9 - 144));
  _Unwind_Resume(a1);
}

void sub_263663794(_Unwind_Exception *a1)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_2636637A8(_Unwind_Exception *a1)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  size_t v67 = 0;
  uint64_t v68 = 0;
  unint64_t v69 = 0;
  *(_DWORD *)&v66[36] = -1431655766;
  *(void *)uint64_t v64 = 0xAAAAAAAA00000000;
  memset(&v64[8], 0, 32);
  *(_OWORD *)uint64_t v65 = 0u;
  memset(v66, 0, 36);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_63;
  }
  __x.second = a3;
  *(void *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.first = a3;
  *(_DWORD *)unint64_t v62 = 0;
  memset(&v62[8], 0, 85);
  uint64_t v68 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v67, (uint64_t)v62);
  if (*(void *)&v62[56])
  {
    *(void *)&v62[64] = *(void *)&v62[56];
    operator delete(*(void **)&v62[56]);
  }
  if (*(void *)&v62[32])
  {
    *(void *)&v62[40] = *(void *)&v62[32];
    operator delete(*(void **)&v62[32]);
  }
  uint64_t v13 = v68;
  *((_DWORD *)v68 - 24) = 0;
  *((void *)v13 - 11) = a2;
  *((void *)v13 - 10) = a2;
  *((void *)v13 - 9) = a3;
  uint64_t v14 = *((void *)v13 - 8);
  unint64_t v15 = *(unsigned int *)(a1 + 28);
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v13 - 7) - v14) >> 3);
  if (v15 <= v16)
  {
    if (v15 < v16) {
      *((void *)v13 - 7) = v14 + 24 * v15;
    }
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v13 - 64), v15 - v16, &__x);
    uint64_t v13 = v68;
  }
  uint64_t v17 = *((void *)v13 - 5);
  unint64_t v18 = *(unsigned int *)(a1 + 32);
  unint64_t v19 = (*((void *)v13 - 4) - v17) >> 4;
  long long v58 = a4;
  if (v18 <= v19)
  {
    if (v18 < v19) {
      *((void *)v13 - 4) = v17 + 16 * v18;
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v13 - 40), v18 - v19);
    uint64_t v13 = v68;
  }
  char v61 = 0;
  unsigned int v20 = 0;
  unint64_t v21 = (const char *)(a3 - a2);
  *((void *)v13 - 2) = v6;
  *((_DWORD *)v13 - 2) = a5;
  *(v13 - 4) = a6;
  uint64_t v60 = 0;
  uint64_t v59 = a3;
  do
  {
    BOOL v22 = (++v20 & 0xFFF) != 0 || (int)(v20 >> 12) < (int)v21;
    if (!v22) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    char v24 = v13 - 16;
    uint64_t v23 = *((void *)v13 - 2);
    uint64_t v25 = v13 - 96;
    if (v23) {
      (*(void (**)(uint64_t, char *))(*(void *)v23 + 16))(v23, v13 - 96);
    }
    switch(*(_DWORD *)v25)
    {
      case 0xFFFFFC18:
        uint64_t v26 = (const char *)*((void *)v13 - 10);
        if ((a5 & 0x20) != 0 && v26 == a2 || (a5 & 0x1000) != 0 && v26 != v59) {
          goto LABEL_29;
        }
        uint64_t v34 = &v26[-*((void *)v13 - 11)];
        unint64_t v35 = v60;
        if ((v61 & ((uint64_t)v60 >= (uint64_t)v34)) == 0)
        {
          long long v36 = *((_OWORD *)v13 - 5);
          *(_OWORD *)uint64_t v64 = *(_OWORD *)v25;
          *(_OWORD *)&v64[16] = v36;
          if (v64 != v25)
          {
            std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>((char **)&v64[32], *((char **)v13 - 8), *((char **)v13 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v13 - 7) - *((void *)v13 - 8)) >> 3));
            std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((uint64_t)v66, *((const double **)v13 - 5), *((const double **)v13 - 4), (uint64_t)(*((void *)v13 - 4) - *((void *)v13 - 5)) >> 4);
          }
          uint64_t v37 = *(void *)v24;
          *(void *)&v66[29] = *(void *)(v13 - 11);
          *(void *)&v66[24] = v37;
          unint64_t v35 = v34;
        }
        uint64_t v38 = v68;
        if (v35 == v21)
        {
          uint64_t v39 = v67;
          while (v38 != v39)
          {
            unint64_t v40 = (void *)*((void *)v38 - 5);
            if (v40)
            {
              *((void *)v38 - 4) = v40;
              operator delete(v40);
            }
            uint64_t v41 = (void *)*((void *)v38 - 8);
            if (v41)
            {
              *((void *)v38 - 7) = v41;
              operator delete(v41);
            }
            v38 -= 96;
          }
          uint64_t v68 = v39;
          char v61 = 1;
          uint64_t v60 = v21;
        }
        else
        {
          uint64_t v60 = v35;
          unint64_t v42 = (void *)*((void *)v68 - 5);
          if (v42)
          {
            *((void *)v68 - 4) = v42;
            operator delete(v42);
          }
          uint64_t v43 = (void *)*((void *)v38 - 8);
          if (v43)
          {
            *((void *)v38 - 7) = v43;
            operator delete(v43);
          }
          uint64_t v68 = v38 - 96;
          char v61 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_29:
        unint64_t v27 = v68;
        unsigned int v28 = (void *)*((void *)v68 - 5);
        if (v28)
        {
          *((void *)v68 - 4) = v28;
          operator delete(v28);
        }
        unint64_t v29 = (void *)*((void *)v27 - 8);
        if (v29)
        {
          *((void *)v27 - 7) = v29;
          operator delete(v29);
        }
        uint64_t v68 = v27 - 96;
        break;
      case 0xFFFFFC20:
        *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v62[64] = v30;
        *(_OWORD *)&v62[80] = v30;
        *(_OWORD *)&v62[32] = v30;
        *(_OWORD *)&v62[48] = v30;
        *(_OWORD *)unint64_t v62 = v30;
        *(_OWORD *)&v62[16] = v30;
        std::__state<char>::__state((uint64_t)v62, (long long *)v13 - 6);
        (*(void (**)(void, uint64_t, char *))(**(void **)v24 + 24))(*(void *)v24, 1, v13 - 96);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v62[80] + 24))(*(void *)&v62[80], 0, v62);
        unint64_t v31 = v68;
        if ((unint64_t)v68 >= v69)
        {
          uint64_t v68 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v67, (uint64_t)v62);
          if (*(void *)&v62[56])
          {
            *(void *)&v62[64] = *(void *)&v62[56];
            operator delete(*(void **)&v62[56]);
          }
        }
        else
        {
          long long v32 = *(_OWORD *)&v62[16];
          *(_OWORD *)uint64_t v68 = *(_OWORD *)v62;
          *((_OWORD *)v31 + 1) = v32;
          *((void *)v31 + 4) = 0;
          *((void *)v31 + 5) = 0;
          *((void *)v31 + 6) = 0;
          *((void *)v31 + 7) = 0;
          *((_OWORD *)v31 + 2) = *(_OWORD *)&v62[32];
          *((void *)v31 + 6) = *(void *)&v62[48];
          memset(&v62[32], 0, 24);
          *((void *)v31 + 8) = 0;
          *((void *)v31 + 9) = 0;
          *(_OWORD *)(v31 + 56) = *(_OWORD *)&v62[56];
          *((void *)v31 + 9) = *(void *)&v62[72];
          memset(&v62[56], 0, 24);
          uint64_t v33 = *(void *)&v62[80];
          *(void *)(v31 + 85) = *(void *)&v62[85];
          *((void *)v31 + 10) = v33;
          uint64_t v68 = v31 + 96;
        }
        if (*(void *)&v62[32])
        {
          *(void *)&v62[40] = *(void *)&v62[32];
          operator delete(*(void **)&v62[32]);
        }
        break;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    uint64_t v13 = v68;
  }
  while (v67 != v68);
  if ((v61 & 1) == 0)
  {
LABEL_63:
    uint64_t v50 = 0;
    uint64_t v51 = *(void **)v66;
    if (!*(void *)v66) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  uint64_t v44 = *v58;
  *(void *)uint64_t v44 = a2;
  *(void *)(v44 + 8) = &v60[(void)a2];
  *(unsigned char *)(v44 + 16) = 1;
  if (v65[0] != *(void **)&v64[32])
  {
    unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v65[0] - *(void *)&v64[32]) >> 3);
    uint64_t v46 = (unsigned char *)(*(void *)&v64[32] + 16);
    unsigned int v47 = 1;
    do
    {
      uint64_t v48 = v44 + 24 * v47;
      *(_OWORD *)uint64_t v48 = *((_OWORD *)v46 - 1);
      char v49 = *v46;
      v46 += 24;
      *(unsigned char *)(v48 + 16) = v49;
      BOOL v22 = v45 > v47++;
    }
    while (v22);
  }
  uint64_t v50 = 1;
  uint64_t v51 = *(void **)v66;
  if (*(void *)v66)
  {
LABEL_64:
    *(void *)&v66[8] = v51;
    operator delete(v51);
  }
LABEL_65:
  if (*(void *)&v64[32])
  {
    v65[0] = *(void **)&v64[32];
    operator delete(*(void **)&v64[32]);
  }
  long long v52 = v67;
  if (v67)
  {
    uint64_t v53 = v68;
    uint64_t v54 = v67;
    if (v68 != v67)
    {
      do
      {
        uint64_t v55 = (void *)*((void *)v53 - 5);
        if (v55)
        {
          *((void *)v53 - 4) = v55;
          operator delete(v55);
        }
        uint64_t v56 = (void *)*((void *)v53 - 8);
        if (v56)
        {
          *((void *)v53 - 7) = v56;
          operator delete(v56);
        }
        v53 -= 96;
      }
      while (v53 != v52);
      uint64_t v54 = v67;
    }
    uint64_t v68 = v52;
    operator delete(v54);
  }
  return v50;
}

void sub_263663DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  std::__state<char>::~__state(&a33);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v33 - 120));
  _Unwind_Resume(a1);
}

void std::deque<std::__state<char>>::clear(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    a1[5] = 0;
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v4 = a1[4];
    std::basic_regex<char>::value_type v5 = &v2[v4 / 0x2A];
    uint64_t v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    unint64_t v7 = (unint64_t)v2[(a1[5] + v4) / 0x2A] + 96 * ((a1[5] + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        uint64_t v8 = (void *)*((void *)v6 + 7);
        if (v8)
        {
          *((void *)v6 + 8) = v8;
          operator delete(v8);
        }
        uint64_t v9 = (void *)*((void *)v6 + 4);
        if (v9)
        {
          *((void *)v6 + 5) = v9;
          operator delete(v9);
        }
        v6 += 96;
        if (v6 - (unsigned char *)*v5 == 4032)
        {
          uint64_t v10 = (char *)v5[1];
          ++v5;
          uint64_t v6 = v10;
        }
      }
      while (v6 != (char *)v7);
      uint64_t v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
    a1[5] = 0;
    unint64_t v11 = (char *)v3 - (char *)v2;
    if (v11 >= 0x11)
    {
      do
      {
        operator delete(*v2);
        uint64_t v12 = a1[2];
        uint64_t v2 = (void **)(a1[1] + 8);
        a1[1] = v2;
        unint64_t v11 = v12 - (void)v2;
      }
      while (v11 > 0x10);
    }
  }
  if (v11 >> 3 == 1)
  {
    uint64_t v13 = 21;
  }
  else
  {
    if (v11 >> 3 != 2) {
      return;
    }
    uint64_t v13 = 42;
  }
  a1[4] = v13;
}

void **std::deque<std::__state<char>>::~deque[abi:ne180100](void **a1)
{
  std::deque<std::__state<char>>::clear(a1);
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v2 != v3)
  {
    do
    {
      unint64_t v4 = *v2++;
      operator delete(v4);
    }
    while (v2 != v3);
    uint64_t v6 = a1[1];
    std::basic_regex<char>::value_type v5 = a1[2];
    if (v5 != v6) {
      a1[2] = &v5[(v6 - v5 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
  }
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::deque<std::__state<char>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    *(void *)(a1 + 32) = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    std::basic_regex<char>::value_type v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v6 + 1);
    uint64_t v8 = *v6;
    *(void *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_78:
      *(void *)std::basic_regex<char>::value_type v5 = v8;
      *(void *)(a1 + 16) += 8;
      return;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v32 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v32 = 1;
      }
      if (!(v32 >> 61))
      {
        unint64_t v33 = v32 >> 2;
        uint64_t v34 = 8 * v32;
        unint64_t v35 = (char *)operator new(8 * v32);
        long long v36 = &v35[8 * v33];
        uint64_t v37 = &v35[v34];
        int64_t v39 = v5 - v7;
        BOOL v38 = v5 == v7;
        std::basic_regex<char>::value_type v5 = v36;
        if (!v38)
        {
          std::basic_regex<char>::value_type v5 = &v36[v39 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v40 = v39 - 8;
          if ((unint64_t)(v39 - 8) >= 0x38)
          {
            int64_t v73 = &v35[8 * v33];
            uint64_t v41 = v73;
            if ((unint64_t)(v73 - v7) >= 0x20)
            {
              uint64_t v74 = (v40 >> 3) + 1;
              uint64_t v75 = 8 * (v74 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v41 = &v36[v75];
              v7 += v75;
              uint64_t v76 = (long long *)(v6 + 3);
              unint64_t v77 = v73 + 16;
              uint64_t v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v79 = *v76;
                *(v77 - 1) = *(v76 - 1);
                _OWORD *v77 = v79;
                v76 += 2;
                v77 += 2;
                v78 -= 4;
              }
              while (v78);
              if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            uint64_t v41 = &v35[8 * v33];
          }
          do
          {
            uint64_t v80 = *(void *)v7;
            v7 += 8;
            *(void *)uint64_t v41 = v80;
            v41 += 8;
          }
          while (v41 != v5);
        }
        goto LABEL_76;
      }
LABEL_87:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    if (v11 >= -1) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11 + 2;
    }
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = -v13;
    unint64_t v15 = &v7[-8 * v13];
    int64_t v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      unint64_t v7 = *(char **)(a1 + 8);
    }
    std::basic_regex<char>::value_type v5 = &v15[v16];
    *(void *)(a1 + 8) = &v7[8 * v14];
    *(void *)(a1 + 16) = &v15[v16];
    goto LABEL_78;
  }
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = v18 - v19;
  uint64_t v21 = (v18 - v19) >> 3;
  uint64_t v22 = v17 - *(void *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      uint64_t v89 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v89);
      return;
    }
    uint64_t v89 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v89);
    unint64_t v42 = *(void **)(a1 + 8);
    std::basic_regex<char>::value_type v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v42 + 1);
    uint64_t v8 = *v42;
    *(void *)(a1 + 8) = v42 + 1;
    if (v5 != *(char **)(a1 + 24)) {
      goto LABEL_78;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v43 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v43 = 1;
      }
      if (!(v43 >> 61))
      {
        unint64_t v44 = v43 >> 2;
        uint64_t v45 = 8 * v43;
        unint64_t v35 = (char *)operator new(8 * v43);
        long long v36 = &v35[8 * v44];
        uint64_t v37 = &v35[v45];
        int64_t v46 = v5 - v7;
        BOOL v38 = v5 == v7;
        std::basic_regex<char>::value_type v5 = v36;
        if (!v38)
        {
          std::basic_regex<char>::value_type v5 = &v36[v46 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v47 = v46 - 8;
          if ((unint64_t)(v46 - 8) >= 0x38)
          {
            long long v81 = &v35[8 * v44];
            uint64_t v48 = v81;
            if ((unint64_t)(v81 - v7) >= 0x20)
            {
              uint64_t v82 = (v47 >> 3) + 1;
              uint64_t v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v48 = &v36[v83];
              v7 += v83;
              uint64_t v84 = (long long *)(v42 + 3);
              uint64_t v85 = v81 + 16;
              uint64_t v86 = v82 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v87 = *v84;
                *(v85 - 1) = *(v84 - 1);
                *uint64_t v85 = v87;
                v84 += 2;
                v85 += 2;
                v86 -= 4;
              }
              while (v86);
              if (v82 == (v82 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            uint64_t v48 = &v35[8 * v44];
          }
          do
          {
            uint64_t v88 = *(void *)v7;
            v7 += 8;
            *(void *)uint64_t v48 = v88;
            v48 += 8;
          }
          while (v48 != v5);
        }
LABEL_76:
        *(void *)a1 = v35;
        *(void *)(a1 + 8) = v36;
        *(void *)(a1 + 16) = v5;
        *(void *)(a1 + 24) = v37;
        if (v9)
        {
          operator delete(v9);
          std::basic_regex<char>::value_type v5 = *(char **)(a1 + 16);
        }
        goto LABEL_78;
      }
      goto LABEL_87;
    }
    goto LABEL_5;
  }
  uint64_t v23 = v22 >> 2;
  if (v17 == *(void *)a1) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = v23;
  }
  if (v24 >> 61) {
    goto LABEL_87;
  }
  uint64_t v25 = (char *)operator new(8 * v24);
  uint64_t v26 = operator new(0xFC0uLL);
  unint64_t v27 = &v25[8 * v21];
  unsigned int v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    long long v30 = v26;
    if (v20 < 1)
    {
      if (v18 == v19) {
        unint64_t v49 = 1;
      }
      else {
        unint64_t v49 = v20 >> 2;
      }
      if (v49 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v27 = (char *)operator new(8 * v49);
      unsigned int v28 = &v27[8 * v49];
      operator delete(v25);
      uint64_t v50 = *(void *)(a1 + 8);
      uint64_t v18 = *(void *)(a1 + 16);
      uint64_t v25 = v27;
      *(void *)unint64_t v27 = v30;
      unint64_t v29 = v27 + 8;
      if (v18 == v50) {
        goto LABEL_45;
      }
    }
    else
    {
      unint64_t v31 = v21 + 2;
      if (v21 >= -1) {
        unint64_t v31 = v21 + 1;
      }
      v27 -= 8 * (v31 >> 1);
      *(void *)unint64_t v27 = v26;
      unint64_t v29 = v27 + 8;
      if (v18 == v19) {
        goto LABEL_45;
      }
    }
    goto LABEL_51;
  }
  *(void *)unint64_t v27 = v26;
  unint64_t v29 = v27 + 8;
  if (v18 != v19)
  {
    do
    {
LABEL_51:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v25) {
            unint64_t v57 = 1;
          }
          else {
            unint64_t v57 = (v28 - v25) >> 2;
          }
          if (v57 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          long long v58 = (char *)operator new(8 * v57);
          uint64_t v59 = v58;
          unint64_t v60 = (v57 + 3) >> 2;
          unint64_t v27 = &v58[8 * v60];
          int64_t v61 = v29 - v25;
          BOOL v38 = v29 == v25;
          unint64_t v29 = v27;
          if (!v38)
          {
            unint64_t v29 = &v27[v61 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v62 = v61 - 8;
            long long v63 = &v58[8 * v60];
            uint64_t v64 = v25;
            if (v62 < 0x38) {
              goto LABEL_91;
            }
            uint64_t v65 = 8 * v60;
            long long v63 = &v58[8 * v60];
            uint64_t v64 = v25;
            if ((unint64_t)(v63 - v25) < 0x20) {
              goto LABEL_91;
            }
            uint64_t v66 = (v62 >> 3) + 1;
            uint64_t v67 = 8 * (v66 & 0x3FFFFFFFFFFFFFFCLL);
            long long v63 = &v27[v67];
            uint64_t v64 = &v25[v67];
            uint64_t v68 = (long long *)(v25 + 16);
            unint64_t v69 = &v58[v65 + 16];
            uint64_t v70 = v66 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v71 = *v68;
              *((_OWORD *)v69 - 1) = *(v68 - 1);
              *(_OWORD *)unint64_t v69 = v71;
              v68 += 2;
              v69 += 32;
              v70 -= 4;
            }
            while (v70);
            if (v66 != (v66 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_91:
              do
              {
                uint64_t v72 = *(void *)v64;
                v64 += 8;
                *(void *)long long v63 = v72;
                v63 += 8;
              }
              while (v63 != v29);
            }
          }
          unsigned int v28 = &v58[8 * v57];
          operator delete(v25);
          uint64_t v25 = v59;
        }
        else
        {
          uint64_t v53 = (v28 - v29) >> 3;
          if (v53 >= -1) {
            uint64_t v54 = v53 + 1;
          }
          else {
            uint64_t v54 = v53 + 2;
          }
          uint64_t v55 = v54 >> 1;
          unint64_t v27 = &v25[8 * (v54 >> 1)];
          uint64_t v56 = v25;
          if (v29 != v25)
          {
            memmove(v27, v25, v29 - v25);
            uint64_t v56 = v29;
          }
          unint64_t v29 = (char *)v56 + 8 * v55;
        }
      }
      uint64_t v52 = *(void *)(v18 - 8);
      v18 -= 8;
      *((void *)v27 - 1) = v52;
      v27 -= 8;
    }
    while (v18 != *(void *)(a1 + 8));
  }
LABEL_45:
  uint64_t v51 = *(char **)a1;
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v27;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v28;
  if (v51)
  {
    operator delete(v51);
  }
}

void sub_263664588(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(char **a1, void *a2)
{
  unint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_22;
  }
  std::basic_regex<char>::value_type v5 = *a1;
  uint64_t v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    uint64_t v11 = &v6[-8 * v9];
    int64_t v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      unint64_t v4 = a1[1];
    }
    uint64_t v13 = &v4[8 * v10];
    unint64_t v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  unint64_t v14 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v14 = 1;
  }
  if (v14 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v15 = v14 >> 2;
  uint64_t v16 = 8 * v14;
  uint64_t v17 = (char *)operator new(8 * v14);
  uint64_t v18 = &v17[8 * v15];
  int64_t v20 = v4 - v6;
  BOOL v19 = v4 == v6;
  unint64_t v4 = v18;
  if (!v19)
  {
    unint64_t v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      uint64_t v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        uint64_t v31 = *(void *)v6;
        v6 += 8;
        *(void *)uint64_t v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    uint64_t v23 = &v17[8 * v15];
    uint64_t v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20) {
      goto LABEL_19;
    }
    uint64_t v24 = (v21 >> 3) + 1;
    uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v22 = &v18[v25];
    uint64_t v26 = &v6[v25];
    unint64_t v27 = (long long *)(v6 + 16);
    unsigned int v28 = v23 + 16;
    uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *unsigned int v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    uint64_t v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_19;
    }
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    unint64_t v4 = a1[2];
  }
LABEL_22:
  *(void *)unint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(void **a1, void *a2)
{
  unint64_t v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    uint64_t v7 = a1[2];
    uint64_t v6 = a1[3];
    if (v7 >= v6)
    {
      uint64_t v13 = v6 - v4;
      BOOL v12 = v13 == 0;
      unint64_t v14 = v13 >> 2;
      if (v12) {
        unint64_t v14 = 1;
      }
      if (v14 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v15 = (v14 + 3) >> 2;
      uint64_t v16 = 8 * v14;
      uint64_t v17 = (char *)operator new(8 * v14);
      std::basic_regex<char>::value_type v5 = &v17[8 * v15];
      uint64_t v18 = v5;
      uint64_t v19 = v7 - v4;
      if (v7 != v4)
      {
        uint64_t v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = v19 - 8;
        unint64_t v21 = &v17[8 * v15];
        uint64_t v22 = v4;
        if (v20 < 0x38) {
          goto LABEL_27;
        }
        uint64_t v23 = &v17[8 * v15];
        unint64_t v21 = v23;
        uint64_t v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20) {
          goto LABEL_27;
        }
        uint64_t v24 = (v20 >> 3) + 1;
        uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v21 = &v5[v25];
        uint64_t v22 = &v4[v25];
        uint64_t v26 = (long long *)(v4 + 16);
        unint64_t v27 = v23 + 16;
        uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *unint64_t v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            uint64_t v30 = *(void *)v22;
            v22 += 8;
            *(void *)unint64_t v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        std::basic_regex<char>::value_type v5 = (char *)a1[1];
      }
    }
    else
    {
      uint64_t v8 = (v6 - v7) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v11 = &v7[8 * (v9 >> 1)];
      std::basic_regex<char>::value_type v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        unint64_t v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    std::basic_regex<char>::value_type v5 = (char *)a1[1];
  }
  *((void *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

void std::deque<std::__state<char>>::__add_front_capacity(uint64_t a1)
{
  BOOL v3 = *(uint64_t **)(a1 + 8);
  unint64_t v2 = *(uint64_t **)(a1 + 16);
  unint64_t v4 = v2 - v3;
  if (v2 == v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if ((unint64_t)(v5 - (*(void *)(a1 + 40) + v6)) >= 0x2A)
  {
    *(void *)(a1 + 32) = v6 + 42;
    unint64_t v47 = (void *)*(v2 - 1);
    *(void *)(a1 + 16) = v2 - 1;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v47);
    return;
  }
  uint64_t v7 = *(uint64_t **)(a1 + 24);
  uint64_t v8 = *(uint64_t **)a1;
  uint64_t v9 = (uint64_t)v7 - *(void *)a1;
  if (v4 < v9 >> 3)
  {
    if (v3 == v8)
    {
      unint64_t v47 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v47);
      uint64_t v43 = *(void *)(a1 + 16);
      unint64_t v47 = *(void **)(v43 - 8);
      *(void *)(a1 + 16) = v43 - 8;
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v47);
      if (*(void *)(a1 + 16) - *(void *)(a1 + 8) == 8) {
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v47 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v47);
      if (*(void *)(a1 + 16) - *(void *)(a1 + 8) == 8)
      {
LABEL_9:
        uint64_t v10 = 21;
LABEL_45:
        *(void *)(a1 + 32) = v10;
        return;
      }
    }
    uint64_t v10 = *(void *)(a1 + 32) + 42;
    goto LABEL_45;
  }
  if (v7 == v8) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v9 >> 2;
  }
  if (v11 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  BOOL v12 = (char *)operator new(8 * v11);
  uint64_t v13 = operator new(0xFC0uLL);
  unint64_t v14 = v13;
  if (v11)
  {
    unint64_t v15 = &v12[8 * v11];
    *(void *)BOOL v12 = v13;
    uint64_t v16 = v12 + 8;
    if (v3 != v2)
    {
LABEL_16:
      uint64_t v17 = v12;
      while (1)
      {
        if (v16 == v15)
        {
          if (v17 <= v12)
          {
            if (v16 == v12) {
              unint64_t v26 = 1;
            }
            else {
              unint64_t v26 = (v16 - v12) >> 2;
            }
            if (v26 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            unint64_t v27 = (char *)operator new(8 * v26);
            uint64_t v28 = v27;
            unint64_t v29 = v26 >> 2;
            uint64_t v18 = &v27[8 * (v26 >> 2)];
            int64_t v31 = v16 - v17;
            BOOL v30 = v16 == v17;
            uint64_t v16 = v18;
            if (!v30)
            {
              uint64_t v16 = &v18[v31 & 0xFFFFFFFFFFFFFFF8];
              unint64_t v32 = v31 - 8;
              if (v32 < 0x38 || (uint64_t v33 = 8 * v29, (unint64_t)(&v27[8 * v29] - v17) < 0x20))
              {
                uint64_t v34 = &v27[8 * (v26 >> 2)];
                unint64_t v35 = v17;
                goto LABEL_35;
              }
              uint64_t v37 = (v32 >> 3) + 1;
              uint64_t v38 = 8 * (v37 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v34 = &v18[v38];
              unint64_t v35 = &v17[v38];
              int64_t v39 = (long long *)(v17 + 16);
              unint64_t v40 = &v27[v33 + 16];
              uint64_t v41 = v37 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v42 = *v39;
                *((_OWORD *)v40 - 1) = *(v39 - 1);
                *(_OWORD *)unint64_t v40 = v42;
                v39 += 2;
                v40 += 32;
                v41 -= 4;
              }
              while (v41);
              if (v37 != (v37 & 0x3FFFFFFFFFFFFFFCLL))
              {
                do
                {
LABEL_35:
                  uint64_t v36 = *(void *)v35;
                  v35 += 8;
                  *(void *)uint64_t v34 = v36;
                  v34 += 8;
                }
                while (v34 != v16);
              }
            }
            unint64_t v15 = &v27[8 * v26];
            if (v12) {
              operator delete(v12);
            }
            BOOL v12 = v28;
            goto LABEL_18;
          }
          uint64_t v20 = (v17 - v12) >> 3;
          if (v20 >= -1) {
            uint64_t v21 = v20 + 1;
          }
          else {
            uint64_t v21 = v20 + 2;
          }
          uint64_t v22 = v21 >> 1;
          uint64_t v23 = &v17[-8 * (v21 >> 1)];
          uint64_t v24 = v16;
          if (v16 != v17)
          {
            memmove(v23, v17, v16 - v17);
            uint64_t v24 = v17;
          }
          uint64_t v25 = -v22;
          unint64_t v15 = v16;
          uint64_t v16 = &v23[v16 - v17];
          uint64_t v18 = &v24[8 * v25];
        }
        else
        {
          uint64_t v18 = v17;
        }
LABEL_18:
        uint64_t v19 = *v3++;
        *(void *)uint64_t v16 = v19;
        v16 += 8;
        uint64_t v17 = v18;
        if (v3 == *(uint64_t **)(a1 + 16)) {
          goto LABEL_48;
        }
      }
    }
  }
  else
  {
    unint64_t v44 = (char *)operator new(8uLL);
    unint64_t v15 = v44 + 8;
    operator delete(v12);
    BOOL v3 = *(uint64_t **)(a1 + 8);
    uint64_t v45 = *(uint64_t **)(a1 + 16);
    BOOL v12 = v44;
    *(void *)unint64_t v44 = v14;
    uint64_t v16 = v44 + 8;
    if (v3 != v45) {
      goto LABEL_16;
    }
  }
  uint64_t v18 = v12;
LABEL_48:
  int64_t v46 = *(void **)a1;
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v18;
  *(void *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v15;
  if (v16 - v18 == 8)
  {
    *(void *)(a1 + 32) = 21;
    if (!v46) {
      return;
    }
  }
  else
  {
    *(void *)(a1 + 32) += 42;
    if (!v46) {
      return;
    }
  }

  operator delete(v46);
}

void sub_263664C58(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char **a1, char *a2, char *a3, size_t __sz)
{
  uint64_t v6 = a2;
  uint64_t v8 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= __sz)
  {
    uint64_t v18 = a1[1];
    uint64_t v17 = a1 + 1;
    unint64_t v14 = v18;
    unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v18 - result) >> 3);
    if (v19 >= __sz)
    {
      uint64_t v24 = result;
      if (a2 != a3)
      {
        uint64_t v25 = result;
        do
        {
          *(_OWORD *)uint64_t v25 = *(_OWORD *)v6;
          v25[16] = v6[16];
          v24 += 24;
          v6 += 24;
          v25 += 24;
        }
        while (v6 != a3);
      }
      int64_t v16 = v24 - result;
      unint64_t v14 = result;
    }
    else
    {
      uint64_t v20 = &a2[24 * v19];
      if (v14 != result)
      {
        do
        {
          *(_OWORD *)uint64_t result = *(_OWORD *)v6;
          result[16] = v6[16];
          v6 += 24;
          result += 24;
        }
        while (v6 != v20);
      }
      uint64_t v21 = v14;
      if (v20 != a3)
      {
        uint64_t v22 = v14;
        do
        {
          long long v23 = *(_OWORD *)v20;
          *((void *)v22 + 2) = *((void *)v20 + 2);
          *(_OWORD *)uint64_t v22 = v23;
          v22 += 24;
          v20 += 24;
          v21 += 24;
        }
        while (v20 != a3);
      }
      int64_t v16 = v21 - v14;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (__sz > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_26;
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= __sz) {
      uint64_t v11 = __sz;
    }
    unint64_t v12 = v10 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v11;
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
LABEL_26:
    }
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    uint64_t v13 = 24 * v12;
    uint64_t result = (char *)operator new(24 * v12);
    unint64_t v14 = result;
    *a1 = result;
    a1[1] = result;
    a1[2] = &result[v13];
    unint64_t v15 = result;
    if (v6 != a3)
    {
      uint64_t result = (char *)memcpy(result, v6, 24 * ((a3 - v6 - 24) / 0x18uLL) + 24);
      unint64_t v15 = &v14[24 * ((a3 - v6 - 24) / 0x18uLL) + 24];
    }
    int64_t v16 = v15 - v14;
    uint64_t v17 = a1 + 1;
  }
  *uint64_t v17 = &v14[v16];
  return result;
}

double *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(uint64_t a1, const double *a2, const double *a3, size_t __sz)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t result = *(double **)a1;
  if (__sz > (v8 - (uint64_t)result) >> 4)
  {
    if (result)
    {
      *(void *)(a1 + 8) = result;
      operator delete(result);
      uint64_t v8 = 0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    if (__sz >> 60) {
      goto LABEL_62;
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= __sz) {
      uint64_t v10 = __sz;
    }
    BOOL v37 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    if (!v37) {
      unint64_t v11 = v10;
    }
    if (v11 >> 60) {
LABEL_62:
    }
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    uint64_t v12 = 2 * v11;
    uint64_t result = (double *)operator new(16 * v11);
    uint64_t v13 = result;
    *(void *)a1 = result;
    *(void *)(a1 + 8) = result;
    *(void *)(a1 + 16) = &result[v12];
    unint64_t v14 = result;
    if (a2 != a3)
    {
      uint64_t result = (double *)memcpy(result, a2, ((char *)a3 - (char *)a2) & 0xFFFFFFFFFFFFFFF0);
      unint64_t v14 = (double *)((char *)v13 + (((char *)a3 - (char *)a2) & 0xFFFFFFFFFFFFFFF0));
    }
    int64_t v15 = (char *)v14 - (char *)v13;
    int64_t v16 = (void *)(a1 + 8);
    goto LABEL_29;
  }
  uint64_t v17 = *(double **)(a1 + 8);
  int64_t v16 = (void *)(a1 + 8);
  uint64_t v13 = v17;
  int64_t v18 = (char *)v17 - (char *)result;
  unint64_t v19 = ((char *)v17 - (char *)result) >> 4;
  if (v19 >= __sz)
  {
    if (a2 == a3)
    {
      BOOL v30 = (char *)result;
    }
    else
    {
      unint64_t v29 = (char *)a3 - (char *)a2 - 16;
      if (v29 < 0xF0
        || ((unint64_t v47 = v29 & 0xFFFFFFFFFFFFFFF0 | 8,
             uint64_t v48 = (char *)result + v47,
             unint64_t v49 = (unint64_t)a2 + v47,
             unint64_t v50 = (v29 & 0xFFFFFFFFFFFFFFF0) + 16,
             result + 1 < (const double *)((char *)a2 + v50))
          ? (BOOL v51 = a2 + 1 >= (double *)((char *)result + v50))
          : (BOOL v51 = 1),
            v51 ? (char v52 = 0) : (char v52 = 1),
            v48 > (char *)a2 ? (BOOL v53 = (unint64_t)result >= v49) : (BOOL v53 = 1),
            !v53 || (v52 & 1) != 0))
      {
        BOOL v30 = (char *)result;
        int64_t v31 = a2;
      }
      else
      {
        uint64_t v54 = (v29 >> 4) + 1;
        uint64_t v55 = 2 * (v54 & 0x1FFFFFFFFFFFFFFCLL);
        BOOL v30 = (char *)&result[v55];
        int64_t v31 = &a2[v55];
        uint64_t v56 = a2 + 4;
        unint64_t v57 = result + 4;
        uint64_t v58 = v54 & 0x1FFFFFFFFFFFFFFCLL;
        do
        {
          uint64_t v59 = v56 - 4;
          float64x2x2_t v62 = vld2q_f64(v59);
          float64x2x2_t v64 = vld2q_f64(v56);
          unint64_t v60 = v57 - 4;
          vst2q_f64(v60, v62);
          vst2q_f64(v57, v64);
          v56 += 8;
          v57 += 8;
          v58 -= 4;
        }
        while (v58);
        if (v54 == (v54 & 0x1FFFFFFFFFFFFFFCLL)) {
          goto LABEL_28;
        }
      }
      do
      {
        uint64_t v32 = *(void *)v31;
        uint64_t v33 = *((void *)v31 + 1);
        v31 += 2;
        *(void *)BOOL v30 = v32;
        *((void *)v30 + 1) = v33;
        v30 += 16;
      }
      while (v31 != a3);
    }
LABEL_28:
    int64_t v15 = v30 - (char *)result;
    uint64_t v13 = result;
    goto LABEL_29;
  }
  uint64_t v20 = &a2[2 * v19];
  if (v13 != result)
  {
    unint64_t v21 = v18 - 16;
    if ((unint64_t)(v18 - 16) < 0xF0
      || ((unint64_t v34 = v18 & 0xFFFFFFFFFFFFFFF0,
           unint64_t v35 = (char *)result + v34 - 8,
           unint64_t v36 = (unint64_t)a2 + v34 - 8,
           result + 1 < (const double *)((char *)a2 + v34))
        ? (BOOL v37 = a2 + 1 >= (double *)((char *)result + v34))
        : (BOOL v37 = 1),
          v37 ? (char v38 = 0) : (char v38 = 1),
          v35 > (char *)a2 ? (BOOL v39 = (unint64_t)result >= v36) : (BOOL v39 = 1),
          !v39 || (v38 & 1) != 0))
    {
      uint64_t v22 = result;
      long long v23 = a2;
    }
    else
    {
      uint64_t v40 = (v21 >> 4) + 1;
      uint64_t v41 = 2 * (v40 & 0x1FFFFFFFFFFFFFFCLL);
      uint64_t v22 = &result[v41];
      long long v23 = &a2[v41];
      long long v42 = a2 + 4;
      uint64_t v43 = result + 4;
      uint64_t v44 = v40 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        uint64_t v45 = v42 - 4;
        float64x2x2_t v61 = vld2q_f64(v45);
        float64x2x2_t v63 = vld2q_f64(v42);
        int64_t v46 = v43 - 4;
        vst2q_f64(v46, v61);
        vst2q_f64(v43, v63);
        v42 += 8;
        v43 += 8;
        v44 -= 4;
      }
      while (v44);
      if (v40 == (v40 & 0x1FFFFFFFFFFFFFFCLL)) {
        goto LABEL_18;
      }
    }
    do
    {
      uint64_t v24 = *(void *)v23;
      uint64_t v25 = *((void *)v23 + 1);
      v23 += 2;
      *(void *)uint64_t v22 = v24;
      *((void *)v22 + 1) = v25;
      v22 += 2;
    }
    while (v23 != v20);
  }
LABEL_18:
  unint64_t v26 = v13;
  if (v20 != a3)
  {
    unint64_t v27 = v13;
    do
    {
      long long v28 = *(_OWORD *)v20;
      v20 += 2;
      *(_OWORD *)unint64_t v27 = v28;
      v27 += 2;
      v26 += 2;
    }
    while (v20 != a3);
  }
  int64_t v15 = (char *)v26 - (char *)v13;
LABEL_29:
  *int64_t v16 = (char *)v13 + v15;
  return result;
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __n)
{
  std::vector<std::ssub_match>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      unint64_t v11 = &end[__n];
      std::vector<std::ssub_match>::size_type v12 = 24 * __n;
      do
      {
        end->first.__i_ = 0;
        end->second.__i_ = 0;
        end->matched = 0;
        ++end;
        v12 -= 24;
      }
      while (v12);
      std::vector<std::ssub_match>::pointer end = v11;
    }
    this->__end_ = end;
  }
  else
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v7 = v6 + __n;
    if (v6 + __n > 0xAAAAAAAAAAAAAAALL) {
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
    if (v9)
    {
      if (v9 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v10 = (char *)operator new(24 * v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v13 = (std::sub_match<std::__wrap_iter<const char *>> *)&v10[24 * v6];
    std::vector<std::ssub_match>::size_type v14 = 24 * __n;
    int64_t v15 = &v13[__n];
    int64_t v16 = v13;
    do
    {
      v16->first.__i_ = 0;
      v16->second.__i_ = 0;
      v16->matched = 0;
      ++v16;
      v14 -= 24;
    }
    while (v14);
    std::vector<std::ssub_match>::pointer begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v18 = end[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>>;
        *(void *)&v13[-1].matched = *(void *)&end[-1].matched;
        v13[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> = v18;
        --v13;
        --end;
      }
      while (end != begin);
      std::vector<std::ssub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v15;
    this->__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)&v10[24 * v9];
    if (end)
    {
      operator delete(end);
    }
  }
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v6 = (const std::locale *)MEMORY[0x263E673F0]();
  *(void *)(a1 + 8) = std::locale::use_facet(v6, MEMORY[0x263F8C108]);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x263F8C130]);
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0) {
    unint64_t v8 = (char *)a2;
  }
  else {
    unint64_t v8 = *(char **)a2;
  }
  if ((v7 & 0x80u) != 0) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  if (&v8[v7] != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(a1, v8, &v8[v7]))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>(); {
  return a1;
  }
}

void sub_2636653B8(_Unwind_Exception *a1)
{
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v2);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_2636653D4(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  unint64_t v6 = operator new(8uLL);
  void *v6 = &unk_270EA2880;
  uint64_t v7 = operator new(0x10uLL);
  v7[1] = v6;
  unint64_t v8 = operator new(0x20uLL);
  void *v8 = &unk_270EA28D8;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  unint64_t v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    *(void *)(a1 + 56) = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v10 <= 0x3F)
    {
LABEL_4:
      if (v10)
      {
        if (v10 != 16)
        {
          if (v10 != 32) {
LABEL_27:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
          goto LABEL_15;
        }
        return std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, a2, a3);
      }
      else
      {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      }
    }
  }
  else
  {
    *(void *)(a1 + 56) = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v10 <= 0x3F) {
      goto LABEL_4;
    }
  }
  switch(v10)
  {
    case 0x40u:
LABEL_15:
      return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
    case 0x80u:
      return std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>(a1, a2, a3);
    case 0x100u:
      return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
    default:
      goto LABEL_27;
  }
}

void sub_263665628(_Unwind_Exception *a1)
{
  std::__empty_state<char>::~__empty_state(v2);
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::vector<std::ssub_match>::pointer end = a1->__end_;
  uint64_t v7 = a2;
  while (1)
  {
    unint64_t v8 = (std::basic_regex<char> *)v7;
    uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v7, a3);
    if (v8 == (std::basic_regex<char> *)v7) {
      break;
    }
LABEL_2:
    if (v7 == (char *)v8) {
      goto LABEL_6;
    }
  }
  unint64_t v9 = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  unint64_t v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, (std::basic_regex<char> *)a3);
  if (v8 != v11)
  {
    uint64_t v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 == (std::basic_regex<char> *)a2)
  {
    std::vector<std::ssub_match>::size_type v12 = (std::__node<char> *)operator new(0x10uLL);
    uint64_t v13 = a1->__end_;
    first = v13->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)first;
    v13->__first_ = v12;
    int64_t v15 = (std::__owns_one_state<char> *)a1->__end_->__first_;
    goto LABEL_8;
  }
LABEL_9:
  if (v8 == (std::basic_regex<char> *)a3) {
    return a3;
  }
  if (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    int64_t v16 = a1->__end_;
    uint64_t v17 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v18 = (char *)&v8->__traits_.__loc_.__locale_ + 1;
    while (1)
    {
      unint64_t v8 = (std::basic_regex<char> *)v18;
      std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v18, a3);
      if (v8 == (std::basic_regex<char> *)v18)
      {
        unint64_t v19 = a1->__end_;
        unsigned int v20 = a1->__marked_count_;
        unint64_t v21 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, (std::basic_regex<char> *)a3);
        if (v8 == v21)
        {
LABEL_16:
          if (v8 == v17)
          {
            uint64_t v22 = (std::__node<char> *)operator new(0x10uLL);
            long long v23 = a1->__end_;
            uint64_t v24 = v23->__first_;
            v22[1].__vftable = (std::__node<char>_vtbl *)v24;
            v23->__first_ = v22;
            a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
          }
          uint64_t v25 = (std::__node<char> *)operator new(0x18uLL);
          unint64_t v26 = v16->__first_;
          v25[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
          v25[2].__vftable = (std::__node<char>_vtbl *)v26;
          v25->__vftable = (std::__node<char>_vtbl *)&unk_270EA2E98;
          end->__first_ = v25;
          v16->__first_ = 0;
          unint64_t v27 = (std::__node<char> *)operator new(0x10uLL);
          long long v28 = a1->__end_->__first_;
          v27[1].__vftable = (std::__node<char>_vtbl *)v28;
          v16->__first_ = v27;
          a1->__end_->__first_ = 0;
          unint64_t v29 = (std::__node<char> *)operator new(0x10uLL);
          BOOL v30 = v16->__first_;
          v29->__vftable = (std::__node<char>_vtbl *)&unk_270EA2EE0;
          v29[1].__vftable = (std::__node<char>_vtbl *)v30;
          a1->__end_->__first_ = v29;
          int64_t v15 = (std::__owns_one_state<char> *)v16->__first_;
LABEL_8:
          a1->__end_ = v15;
          goto LABEL_9;
        }
        std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v21, (std::basic_regex<char> *)a3, v19, v20 + 1, a1->__marked_count_ + 1);
      }
      if (v18 == (char *)v8) {
        goto LABEL_16;
      }
    }
  }
  return (char *)v8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = (std::basic_regex<char> *)a2;
  if (a2 == a3) {
    return a2;
  }
  if (*a2 == 94)
  {
    unint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    void *v6 = &unk_270EA29D0;
    v6[1] = v9;
    *((unsigned char *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      unsigned int v10 = v3;
      unint64_t v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 28);
      uint64_t v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, (uint64_t)v10, a3);
      if (v10 != v13)
      {
        BOOL v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v10 != (unsigned char *)v3) {
          continue;
        }
      }
      if (v10 + 1 != a3 || *v10 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      std::vector<std::ssub_match>::size_type v14 = operator new(0x18uLL);
      BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(v16 + 8);
      *std::vector<std::ssub_match>::size_type v14 = &unk_270EA2A18;
      v14[1] = v17;
      *((unsigned char *)v14 + 16) = v15;
      *(void *)(v16 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == a2) {
    goto LABEL_12;
  }
  do
  {
    uint64_t v8 = v7;
    BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, v7, a3);
  }
  while (v8 != v7);
  if (v8 == a2) {
LABEL_12:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == a3) {
    return a3;
  }
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    unsigned int v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    unint64_t v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1), a3);
    if ((std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1) == v11) {
      goto LABEL_12;
    }
    do
    {
      uint64_t v8 = v11;
      unint64_t v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, v11, a3);
    }
    while (v8 != v11);
    if (v8 == v10) {
      goto LABEL_12;
    }
    int v12 = operator new(0x18uLL);
    uint64_t v13 = *(void *)(v9 + 8);
    v12[1] = *(void *)(v6 + 8);
    v12[2] = v13;
    *int v12 = &unk_270EA2E98;
    *(void *)(v6 + 8) = v12;
    *(void *)(v9 + 8) = 0;
    std::vector<std::ssub_match>::size_type v14 = operator new(0x10uLL);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    v14[1] = v15;
    *(void *)(v9 + 8) = v14;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v16 = operator new(0x10uLL);
    uint64_t v17 = *(void *)(v9 + 8);
    *uint64_t v16 = &unk_270EA2EE0;
    v16[1] = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = v16;
    *(void *)(a1 + 56) = *(void *)(v9 + 8);
    if (v8 == a3) {
      return a3;
    }
  }
  return v8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      unint64_t v11 = v8;
    }
    else {
      unint64_t v11 = v8 + 1;
    }
    if (v11 == a3) {
      return a3;
    }
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, __s, v8);
    if (v8 == a3) {
      unint64_t v11 = v8;
    }
    else {
      unint64_t v11 = v8 + 1;
    }
    if (v11 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    unint64_t v21 = (char *)memchr(v11, 10, a3 - v11);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v11)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, v11, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    *uint64_t v15 = &unk_270EA2E98;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    unint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    *unint64_t v19 = &unk_270EA2EE0;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      unint64_t v11 = v22;
    }
    else {
      unint64_t v11 = v22 + 1;
    }
  }
  while (v11 != a3);
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      unint64_t v11 = v8;
    }
    else {
      unint64_t v11 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    }
    if (v11 == a3) {
      return a3;
    }
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, __s, v8);
    if (v8 == a3) {
      unint64_t v11 = v8;
    }
    else {
      unint64_t v11 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    }
    if (v11 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    unint64_t v21 = (std::basic_regex<char> *)memchr(v11, 10, (char *)a3 - (char *)v11);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v11)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, v11, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    *uint64_t v15 = &unk_270EA2E98;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    unint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    *unint64_t v19 = &unk_270EA2EE0;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      unint64_t v11 = v22;
    }
    else {
      unint64_t v11 = (std::basic_regex<char> *)((char *)&v22->__traits_.__loc_.__locale_ + 1);
    }
  }
  while (v11 != a3);
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        int v16 = a2[1];
        if (v16 == 66)
        {
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = &unk_270EA2A60;
          *((void *)v17 + 1) = v19;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 1;
        }
        else
        {
          if (v16 != 98) {
            return v3;
          }
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = &unk_270EA2A60;
          *((void *)v17 + 1) = v18;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 0;
        }
        *(void *)(*(void *)(a1 + 56) + 8) = v17;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return v3 + 2;
      }
      return v3;
    }
    if (v6 != 94) {
      return v3;
    }
    unint64_t v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    uint64_t v14 = &unk_270EA29D0;
LABEL_17:
    *unint64_t v11 = v14;
    *((unsigned char *)v11 + 16) = v12;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 == 36)
  {
    unint64_t v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    uint64_t v14 = &unk_270EA2A18;
    goto LABEL_17;
  }
  if (v6 != 40 || a2 + 1 == a3 || a2[1] != 63 || a2 + 2 == a3) {
    return v3;
  }
  int v7 = a2[2];
  if (v7 == 33)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v22.__loop_count_ = v20;
    *(_OWORD *)&v22.__start_.__cntrl_ = v20;
    *(_OWORD *)&v22.__traits_.__loc_.__locale_ = v20;
    *(_OWORD *)&v22.__traits_.__col_ = v20;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v22);
    v22.__flags_ = *(_DWORD *)(a1 + 24);
    uint64_t v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v22, v3 + 3, a3);
    unsigned int marked_count = v22.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v22, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v9 == a3 || *v9 != 41) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    goto LABEL_27;
  }
  if (v7 != 61) {
    return v3;
  }
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v22.__loop_count_ = v8;
  *(_OWORD *)&v22.__start_.__cntrl_ = v8;
  *(_OWORD *)&v22.__traits_.__loc_.__locale_ = v8;
  *(_OWORD *)&v22.__traits_.__col_ = v8;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v22);
  v22.__flags_ = *(_DWORD *)(a1 + 24);
  uint64_t v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v22, v3 + 3, a3);
  unsigned int v10 = v22.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v22, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v10;
  if (v9 == a3 || *v9 != 41) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
LABEL_27:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v22.__traits_.__loc_);
  return v9 + 1;
}

void sub_263666318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_26366632C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_263666340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_263666354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  switch(LOBYTE(a2->__traits_.__loc_.__locale_))
  {
    case '(':
      if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1) == a3) {
        goto LABEL_26;
      }
      if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 2) != a3
        && BYTE1(a2->__traits_.__loc_.__locale_) == 63
        && BYTE2(a2->__traits_.__loc_.__locale_) == 58)
      {
        ++this->__open_count_;
        int v6 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, (char *)&a2->__traits_.__loc_.__locale_ + 3, a3);
        if (v6 != a3 && LOBYTE(v6->__traits_.__loc_.__locale_) == 41)
        {
          --this->__open_count_;
          return (std::basic_regex<char> *)((char *)&v6->__traits_.__loc_.__locale_ + 1);
        }
LABEL_26:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if ((this->__flags_ & 2) != 0)
      {
        unsigned int marked_count = this->__marked_count_;
      }
      else
      {
        unint64_t v11 = (std::__node<char> *)operator new(0x18uLL);
        unsigned int marked_count = this->__marked_count_ + 1;
        this->__marked_count_ = marked_count;
        std::vector<std::ssub_match>::pointer end = this->__end_;
        first = end->__first_;
        v11->__vftable = (std::__node<char>_vtbl *)&unk_270EA2D30;
        v11[1].__vftable = (std::__node<char>_vtbl *)first;
        LODWORD(v11[2].__vftable) = marked_count;
        end->__first_ = v11;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      uint64_t v15 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, (char *)&v3->__traits_.__loc_.__locale_ + 1, a3);
      if (v15 == a3) {
        goto LABEL_26;
      }
      int v16 = v15;
      if (LOBYTE(v15->__traits_.__loc_.__locale_) != 41) {
        goto LABEL_26;
      }
      if ((this->__flags_ & 2) == 0)
      {
        uint64_t v17 = (std::__node<char> *)operator new(0x18uLL);
        uint64_t v18 = this->__end_;
        uint64_t v19 = v18->__first_;
        v17->__vftable = (std::__node<char>_vtbl *)&unk_270EA2D78;
        v17[1].__vftable = (std::__node<char>_vtbl *)v19;
        LODWORD(v17[2].__vftable) = marked_count;
        v18->__first_ = v17;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      uint64_t result = (std::basic_regex<char> *)((char *)&v16->__traits_.__loc_.__locale_ + 1);
      break;
    case ')':
    case ',':
    case '-':
    case '/':
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case ':':
    case ';':
    case '<':
    case '=':
    case '>':
    case '@':
    case 'A':
    case 'B':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
    case '*':
    case '+':
    case '?':
      goto LABEL_25;
    case '.':
      long long v8 = (std::__node<char> *)operator new(0x10uLL);
      uint64_t v9 = this->__end_;
      unsigned int v10 = v9->__first_;
      v8->__vftable = (std::__node<char>_vtbl *)&unk_270EA2AF0;
      v8[1].__vftable = (std::__node<char>_vtbl *)v10;
      v9->__first_ = v8;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return (std::basic_regex<char> *)((char *)v3 + 1);
    case '[':
      return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, (char *)a2, (char *)a3);
    case '\\':
      return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(this, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    default:
      if (LOBYTE(a2->__traits_.__loc_.__locale_) == 123) {
LABEL_25:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
      return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = v9 == a3;
      }
      if (!v21 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        unsigned int v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::vector<std::ssub_match>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::ssub_match>::pointer end = __mexp_end;
        size_t v11 = 0;
        goto LABEL_36;
      }
      __mexp_std::vector<std::ssub_match>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::ssub_match>::pointer end = __mexp_end;
      size_t v25 = 0;
      goto LABEL_45;
    }
    long long v8 = this;
    if (locale_low == 43)
    {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        unsigned int v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::vector<std::ssub_match>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::ssub_match>::pointer end = __mexp_end;
        size_t v11 = 1;
LABEL_36:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v10;
      }
      __mexp_std::vector<std::ssub_match>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::ssub_match>::pointer end = __mexp_end;
      size_t v25 = 1;
      goto LABEL_45;
    }
    return v8;
  }
  if (locale_low == 63)
  {
    std::basic_regex<char> v22 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6) {
      BOOL v23 = 1;
    }
    else {
      BOOL v23 = v22 == a3;
    }
    if (v23 || LOBYTE(v22->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v22;
    }
    else
    {
      uint64_t v24 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v24;
    }
  }
  else
  {
    long long v8 = this;
    if (locale_low != 123) {
      return v8;
    }
    uint64_t v13 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
      goto LABEL_72;
    }
    int v14 = *v13;
    if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
      goto LABEL_72;
    }
    int v15 = v14 - 48;
    int v16 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_21:
      int v16 = (char *)a3;
    }
    else
    {
      while (1)
      {
        int v17 = *v16;
        if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
          break;
        }
        if (v15 >= 214748364) {
          goto LABEL_72;
        }
        int v15 = v17 + 10 * v15 - 48;
        if (++v16 == (char *)a3) {
          goto LABEL_21;
        }
      }
    }
    if (v16 == v13) {
      goto LABEL_72;
    }
    if (v16 == (char *)a3) {
      goto LABEL_73;
    }
    int v18 = *v16;
    if (v18 != 44)
    {
      if (v18 == 125)
      {
        uint64_t v19 = (std::basic_regex<char> *)(v16 + 1);
        if (v6 || v19 == a3 || LOBYTE(v19->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 1);
          return v19;
        }
        else
        {
          long long v20 = (unsigned __int8 *)(v16 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v20;
        }
      }
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    unint64_t v26 = (std::basic_regex<char> *)(v16 + 1);
    if (v16 + 1 == (char *)a3) {
      goto LABEL_72;
    }
    int v27 = LOBYTE(v26->__traits_.__loc_.__locale_);
    if (v27 == 125)
    {
      uint64_t v9 = (std::basic_regex<char> *)(v16 + 2);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        size_t v11 = v15;
        unsigned int v10 = v16 + 3;
        __mexp_std::vector<std::ssub_match>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::ssub_match>::pointer end = __mexp_end;
        goto LABEL_36;
      }
      size_t v25 = v15;
      __mexp_std::vector<std::ssub_match>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::ssub_match>::pointer end = __mexp_end;
LABEL_45:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v25, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v9;
    }
    if ((v27 & 0xF8) != 0x30 && (v27 & 0xFE) != 0x38) {
      goto LABEL_73;
    }
    int v28 = v27 - 48;
    unint64_t v29 = (std::basic_regex<char> *)(v16 + 2);
    if (v29 == a3)
    {
LABEL_61:
      unint64_t v29 = a3;
    }
    else
    {
      while (1)
      {
        int v30 = LOBYTE(v29->__traits_.__loc_.__locale_);
        if ((v30 & 0xF8) != 0x30 && (v30 & 0xFE) != 0x38) {
          break;
        }
        if (v28 >= 214748364) {
          goto LABEL_72;
        }
        int v28 = v30 + 10 * v28 - 48;
        unint64_t v29 = (std::basic_regex<char> *)((char *)v29 + 1);
        if (v29 == a3) {
          goto LABEL_61;
        }
      }
    }
    if (v29 == v26 || v29 == a3 || LOBYTE(v29->__traits_.__loc_.__locale_) != 125) {
LABEL_73:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v28 < v15) {
      goto LABEL_72;
    }
    int64_t v31 = (std::basic_regex<char> *)((char *)&v29->__traits_.__loc_.__locale_ + 1);
    if (v6 || v31 == a3 || LOBYTE(v31->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 1);
      return v31;
    }
    else
    {
      uint64_t v32 = (char *)&v29->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v32;
    }
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  unint64_t v4 = a2;
  if (*a2 == 92)
  {
    int v6 = a2 + 1;
    if (a2 + 1 == a3) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    int v8 = *v6;
    unsigned int v9 = v8 - 48;
    if (v8 == 48)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v9);
      return a2 + 2;
    }
    if ((v8 - 49) <= 8)
    {
      unint64_t v4 = a2 + 2;
      if (a2 + 2 == a3)
      {
        unint64_t v4 = a3;
      }
      else
      {
        while (1)
        {
          int v11 = *v4;
          if ((v11 - 48) > 9) {
            break;
          }
          if (v9 >= 0x19999999) {
            goto LABEL_24;
          }
          ++v4;
          unsigned int v9 = v11 + 10 * v9 - 48;
          if (v4 == a3)
          {
            unint64_t v4 = a3;
            break;
          }
        }
        if (!v9) {
LABEL_24:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
      }
      if (v9 > this->__marked_count_) {
        goto LABEL_24;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v9);
      if (v4 != v6) {
        return v4;
      }
    }
    unint64_t v4 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>((uint64_t)this, a2 + 1, a3);
    if (v6 == v4)
    {
      BOOL v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(this, a2 + 1, a3, 0);
      if (v6 == v12) {
        return a2;
      }
      else {
        return v12;
      }
    }
  }
  return v4;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    int v5 = a2[1];
    char v6 = v5 == 94;
    int v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    int v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(void *)(*(void *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    *(void *)(a1 + 56) = v8;
    if (v7 == a3) {
      goto LABEL_20;
    }
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3) {
      goto LABEL_20;
    }
    do
    {
      unsigned int v9 = v7;
      int v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(a1, v7, a3, (uint64_t)v8);
    }
    while (v9 != v7);
    if (v9 == a3) {
      goto LABEL_20;
    }
    if (*v9 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
      ++v9;
    }
    if (v9 == a3 || *v9 != 93) {
LABEL_20:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v9 + 1;
  }
  return a2;
}

void sub_263666D7C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  if (this == a3) {
    return this;
  }
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '{':
    case '|':
    case '}':
      return this;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
      uint64_t result = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      break;
  }
  return result;
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  BOOL v3 = a2;
  if (a2 != a3)
  {
    switch(*a2)
    {
      case 'D':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_7;
      case 'S':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_11;
      case 'W':
        char v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_9;
      case 'd':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_7:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x400;
        goto LABEL_12;
      case 's':
        int v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_11:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x4000;
LABEL_12:
        v5[40] = v7;
        goto LABEL_13;
      case 'w':
        char v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_9:
        *(void *)(*(void *)(a1 + 56) + 8) = v6;
        *(void *)(a1 + 56) = v6;
        v6[40] |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v6, 95);
LABEL_13:
        ++v3;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_263667150(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_263667164(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_263667178(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_26366718C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2636671A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2636671B4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  std::basic_regex<char>::value_type v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || (char)v4[1] < 65) {
        goto LABEL_85;
      }
      unsigned int v8 = v4[1];
      if (v8 >= 0x5B && (v8 - 97) > 0x19u) {
        goto LABEL_85;
      }
      std::basic_regex<char>::value_type v10 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v10;
        *((unsigned char *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v10);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        int v11 = v4[1];
        if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            int v12 = *v4;
            if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38 || (v12 | 0x20u) - 97 < 6) {
              goto LABEL_42;
            }
          }
        }
      }
      goto LABEL_85;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char>::value_type v6 = 11;
LABEL_68:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_42:
      if (v4 + 1 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v13 = v4[1];
      char v14 = -48;
      if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38) {
        goto LABEL_47;
      }
      v13 |= 0x20u;
      if ((v13 - 97) >= 6u) {
        goto LABEL_85;
      }
      char v14 = -87;
LABEL_47:
      if (v4 + 2 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v15 = v4[2];
      char v16 = -48;
      if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
      {
        v15 |= 0x20u;
        if ((v15 - 97) >= 6u) {
LABEL_85:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        char v16 = -87;
      }
      std::basic_regex<char>::value_type v17 = v15 + 16 * (v13 + v14) + v16;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v17;
      *((unsigned char *)a4 + 1) = 0;
      uint64_t result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0) {
        goto LABEL_85;
      }
      if (!a4) {
        goto LABEL_68;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  unint64_t v4 = a2;
  int64_t v5 = a2 - a3;
  if (a2 == a3) {
    return a2;
  }
  int v6 = *a2;
  int v7 = a2;
  if (v6 == 93) {
    return v7;
  }
  unsigned int v8 = (char *)a4;
  int v11 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v42 = 0;
  if (a2 + 1 == a3 || v6 != 91)
  {
LABEL_36:
    int v27 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_39;
  }
  int v12 = a2[1];
  if (v12 != 46)
  {
    if (v12 == 58)
    {
      uint64_t v14 = (uint64_t)(a2 + 2);
      if (a3 - (v4 + 2) < 2) {
        goto LABEL_91;
      }
      uint64_t v15 = 0;
      int64_t v16 = v5 + 4;
      std::basic_regex<char>::value_type v17 = (unsigned __int8 *)v4;
      uint64_t v18 = v16;
      if (v4[2] == 58) {
        goto LABEL_15;
      }
      do
      {
        do
        {
          if (!v18) {
            goto LABEL_91;
          }
          std::basic_regex<char>::value_type v17 = (unsigned __int8 *)&v4[++v15];
          uint64_t v18 = v16 + v15;
        }
        while (v4[v15 + 2] != 58);
LABEL_15:
        ;
      }
      while (v17[3] != 93);
      uint64_t v19 = &v4[v15 + 2];
      if (v19 == a3) {
LABEL_91:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      int v20 = std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(a1, v14, v19, *(_DWORD *)(a1 + 24) & 1);
      if (!v20) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
      }
      char v13 = 0;
      *((_DWORD *)v8 + 40) |= v20;
      unsigned int v8 = &v4[v15 + 4];
      int v7 = v4;
      if (SHIBYTE(v42) < 0) {
        goto LABEL_70;
      }
      goto LABEL_71;
    }
    if (v12 == 61)
    {
      unsigned int v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, a4);
      char v13 = 0;
      int v7 = v4;
      if ((SHIBYTE(v42) & 0x80000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_70;
    }
    int v11 = 0;
    goto LABEL_36;
  }
  BOOL v21 = a2 + 2;
  if (a3 - (v4 + 2) < 2) {
    goto LABEL_92;
  }
  std::basic_regex<char> v22 = (unsigned __int8 *)(v4 + 2);
  BOOL v23 = (unsigned __int8 *)(v4 + 3);
  if (*v21 == 46) {
    goto LABEL_24;
  }
  do
  {
    do
    {
      if (a3 - 4 == v4) {
        goto LABEL_92;
      }
      ++v4;
      std::basic_regex<char> v22 = v23;
      int v24 = *v23++;
    }
    while (v24 != 46);
LABEL_24:
    ;
  }
  while (*v23 != 93);
  if (v22 == (unsigned __int8 *)a3) {
LABEL_92:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, (uint64_t)v21, v4 + 2, (uint64_t)&v43);
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v42 = v44;
  *(_OWORD *)std::vector<std::csub_match> __p = v43;
  size_t v25 = (char *)HIBYTE(v44);
  int v11 = SHIBYTE(v44);
  uint64_t v26 = *((void *)&v43 + 1);
  if (v44 < 0) {
    size_t v25 = (char *)__p[1];
  }
  if ((unint64_t)(v25 - 1) >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  unint64_t v4 = (char *)(v22 + 2);
  int v27 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v44 >= 0) {
    uint64_t v26 = HIBYTE(v44);
  }
  if (v26)
  {
    if (v4 == a3) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_39:
  if ((v27 | 0x40) != 0x40)
  {
    LOBYTE(v28) = *v4;
LABEL_44:
    if (v11 < 0)
    {
      int64_t v31 = __p[0];
      __p[1] = (void *)1;
      *(unsigned char *)__p[0] = v28;
      v31[1] = 0;
      if (++v4 == a3) {
        goto LABEL_52;
      }
    }
    else
    {
      HIBYTE(v42) = 1;
      LOWORD(__p[0]) = v28;
      if (++v4 == a3) {
        goto LABEL_52;
      }
    }
    goto LABEL_51;
  }
  int v28 = *v4;
  if (v28 != 92) {
    goto LABEL_44;
  }
  unint64_t v29 = v4 + 1;
  if (v27) {
    int v30 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v29, a3, (uint64_t *)__p);
  }
  else {
    int v30 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v29, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
  }
  unint64_t v4 = v30;
  if (v30 == a3)
  {
LABEL_52:
    if (SHIBYTE(v42) < 0)
    {
      if (!__p[1]) {
        goto LABEL_69;
      }
      if (__p[1] != (void *)1)
      {
        uint64_t v33 = (void **)__p[0];
LABEL_68:
        std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v33, *((char *)v33 + 1));
LABEL_69:
        char v13 = 1;
        int v7 = v4;
        if ((SHIBYTE(v42) & 0x80000000) == 0) {
          goto LABEL_71;
        }
        goto LABEL_70;
      }
      uint64_t v33 = (void **)__p[0];
    }
    else
    {
      if (!HIBYTE(v42)) {
        goto LABEL_69;
      }
      uint64_t v33 = __p;
      if (HIBYTE(v42) != 1) {
        goto LABEL_68;
      }
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v33);
    goto LABEL_69;
  }
LABEL_51:
  int v32 = *v4;
  if (v32 == 93) {
    goto LABEL_52;
  }
  unint64_t v34 = v4 + 1;
  if (v4 + 1 == a3 || v32 != 45 || *v34 == 93) {
    goto LABEL_52;
  }
  long long v43 = 0uLL;
  int64_t v44 = 0;
  int v7 = v4 + 2;
  if (v4 + 2 == a3 || *v34 != 91 || *v7 != 46)
  {
    if ((v27 | 0x40) == 0x40)
    {
      LODWORD(v34) = *v34;
      if (v34 == 92)
      {
        if (v27) {
          unint64_t v35 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v4 + 2, a3, (uint64_t *)&v43);
        }
        else {
          unint64_t v35 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v4 + 2, (unsigned __int8 *)a3, (uint64_t)&v43, (uint64_t)v8);
        }
        goto LABEL_81;
      }
    }
    else
    {
      LOBYTE(v34) = *v34;
    }
    HIBYTE(v44) = 1;
    LOWORD(v43) = v34;
    goto LABEL_82;
  }
  unint64_t v35 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, v4 + 3, a3, (uint64_t)&v43);
LABEL_81:
  int v7 = v35;
LABEL_82:
  *(_OWORD *)BOOL v39 = *(_OWORD *)__p;
  uint64_t v40 = v42;
  __p[1] = 0;
  uint64_t v42 = 0;
  __p[0] = 0;
  *(_OWORD *)BOOL v37 = v43;
  uint64_t v38 = v44;
  long long v43 = 0uLL;
  int64_t v44 = 0;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v8, (char *)v39, (uint64_t)v37);
  if (SHIBYTE(v38) < 0)
  {
    operator delete(v37[0]);
    if ((SHIBYTE(v40) & 0x80000000) == 0)
    {
LABEL_84:
      if ((SHIBYTE(v44) & 0x80000000) == 0) {
        goto LABEL_85;
      }
LABEL_89:
      operator delete((void *)v43);
      char v13 = 1;
      if (SHIBYTE(v42) < 0) {
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_84;
  }
  operator delete(v39[0]);
  if (SHIBYTE(v44) < 0) {
    goto LABEL_89;
  }
LABEL_85:
  char v13 = 1;
  if (SHIBYTE(v42) < 0) {
LABEL_70:
  }
    operator delete(__p[0]);
LABEL_71:
  if (v13) {
    return v7;
  }
  return v8;
}

void sub_263667DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (*(char *)(v28 - 49) < 0)
  {
    operator delete(*(void **)(v28 - 72));
    if (a28 < 0)
    {
LABEL_5:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_39;
  }
  int v6 = a3 - 2;
  int v7 = a2;
  unsigned int v8 = a2;
  unsigned int v9 = a2 + 1;
  if (*a2 != 61) {
    goto LABEL_5;
  }
LABEL_4:
  if (*v9 != 93)
  {
LABEL_5:
    while (a2 != v6)
    {
      ++v7;
      --v6;
      unsigned int v8 = v9;
      int v10 = *v9++;
      if (v10 == 61) {
        goto LABEL_4;
      }
    }
LABEL_39:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (v8 == a3) {
    goto LABEL_39;
  }
  memset(v20, 170, sizeof(v20));
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, (uint64_t)a2, v7, (uint64_t)v20);
  if ((SHIBYTE(v20[2]) & 0x80000000) == 0)
  {
    int v11 = (char *)HIBYTE(v20[2]);
    if (HIBYTE(v20[2]))
    {
      memset(__p, 170, sizeof(__p));
      int v12 = v20;
      goto LABEL_14;
    }
LABEL_40:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  int v11 = (char *)v20[1];
  if (!v20[1]) {
    goto LABEL_40;
  }
  memset(__p, 170, sizeof(__p));
  int v12 = (void **)v20[0];
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, (uint64_t)v12, &v11[(void)v12], (unsigned char **)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    if (__p[1])
    {
LABEL_16:
      unint64_t v13 = *(void *)(a4 + 144);
      if (v13 >= *(void *)(a4 + 152))
      {
        *(void *)(a4 + 144) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)(a4 + 136), (uint64_t)__p);
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      else
      {
        if ((HIBYTE(__p[2]) & 0x80) != 0)
        {
          std::string::__init_copy_ctor_external(*(std::string **)(a4 + 144), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          long long v14 = *(_OWORD *)__p;
          *(void **)(v13 + 16) = __p[2];
          *(_OWORD *)unint64_t v13 = v14;
        }
        *(void *)(a4 + 144) = v13 + 24;
        *(void *)(a4 + 144) = v13 + 24;
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      goto LABEL_33;
    }
  }
  else if (HIBYTE(__p[2]))
  {
    goto LABEL_16;
  }
  uint64_t v15 = (void *)HIBYTE(v20[2]);
  if (SHIBYTE(v20[2]) < 0) {
    uint64_t v15 = v20[1];
  }
  if (v15 == (void *)2)
  {
    std::basic_regex<char>::value_type v17 = v20;
    if (SHIBYTE(v20[2]) < 0) {
      std::basic_regex<char>::value_type v17 = (void **)v20[0];
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](a4, *(char *)v17, *((char *)v17 + 1));
  }
  else
  {
    if (v15 != (void *)1) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
    }
    int64_t v16 = v20;
    if (SHIBYTE(v20[2]) < 0) {
      int64_t v16 = (void **)v20[0];
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a4, *(char *)v16);
  }
  if (SHIBYTE(__p[2]) < 0)
  {
LABEL_37:
    operator delete(__p[0]);
    if (SHIBYTE(v20[2]) < 0) {
      goto LABEL_38;
    }
    return v7 + 2;
  }
LABEL_33:
  if ((SHIBYTE(v20[2]) & 0x80000000) == 0) {
    return v7 + 2;
  }
LABEL_38:
  operator delete(v20[0]);
  return v7 + 2;
}

void sub_2636680C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  int64_t v5 = a3 - 2;
  int v6 = a2;
  int v7 = a2;
  unsigned int v8 = a2 + 1;
  if (*a2 != 46) {
    goto LABEL_5;
  }
LABEL_4:
  if (*v8 != 93)
  {
LABEL_5:
    while (a2 != v5)
    {
      ++v6;
      --v5;
      int v7 = v8;
      int v9 = *v8++;
      if (v9 == 46) {
        goto LABEL_4;
      }
    }
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (v7 == a3) {
    goto LABEL_15;
  }
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, (uint64_t)a2, v6, (uint64_t)&v13);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v13;
  unint64_t v10 = v14;
  *(void *)(a4 + 16) = v14;
  unint64_t v11 = HIBYTE(v10);
  if ((v11 & 0x80u) != 0) {
    unint64_t v11 = *(void *)(a4 + 8);
  }
  if (v11 - 1 >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  return v6 + 2;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
      uint64_t result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      uint64_t result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      uint64_t result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 1) = 0;
        uint64_t result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_70:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  std::basic_regex<char>::value_type v5 = *a2;
  switch(*a2)
  {
    case '""':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v5;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30) {
        goto LABEL_70;
      }
      std::basic_regex<char>::value_type v7 = *a2 - 48;
      unsigned int v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        unsigned int v8 = a3;
LABEL_42:
        if (a4) {
          goto LABEL_43;
        }
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30) {
        goto LABEL_42;
      }
      std::basic_regex<char>::value_type v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        unsigned int v8 = a3;
        if (a4) {
          goto LABEL_43;
        }
        goto LABEL_69;
      }
      std::basic_regex<char>::value_type v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::basic_regex<char>::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        unsigned int v8 = a2 + 3;
      }
      else {
        unsigned int v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::basic_regex<char>::value_type v7 = v11;
      }
      if (!a4) {
        goto LABEL_69;
      }
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v7;
      *((unsigned char *)a4 + 1) = 0;
      return v8;
  }
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = (unint64_t)&a3[-a2];
  memset(__s, 170, sizeof(__s));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v5 <= 0x16)
  {
    __s[23] = (_BYTE)a3 - a2;
    std::basic_regex<char>::value_type v9 = __s;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    int v10 = v9;
    goto LABEL_16;
  }
  uint64_t v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v16 = v5 | 7;
  }
  uint64_t v17 = v16 + 1;
  std::basic_regex<char>::value_type v9 = (char *)operator new(v16 + 1);
  *(void *)&__s[8] = v5;
  *(void *)&__s[16] = v17 | 0x8000000000000000;
  *(void *)__s = v9;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v5 < 0x20 || (unint64_t)&v9[-a2] < 0x20)
  {
    int v10 = v9;
    std::basic_regex<char>::value_type v11 = (char *)a2;
    do
    {
LABEL_15:
      char v18 = *v11++;
      *v10++ = v18;
    }
    while (v11 != a3);
    goto LABEL_16;
  }
  int v10 = &v9[v5 & 0xFFFFFFFFFFFFFFE0];
  std::basic_regex<char>::value_type v11 = (char *)(a2 + (v5 & 0xFFFFFFFFFFFFFFE0));
  int v12 = (long long *)(a2 + 16);
  long long v13 = v9 + 16;
  unint64_t v14 = v5 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v15 = *v12;
    *(v13 - 1) = *(v12 - 1);
    _OWORD *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  if (v5 != (v5 & 0xFFFFFFFFFFFFFFE0)) {
    goto LABEL_15;
  }
LABEL_16:
  *int v10 = 0;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (__s[23] < 0)
  {
    uint64_t v19 = *(char **)__s;
    if (!*(void *)&__s[8]) {
      goto LABEL_29;
    }
  }
  else
  {
    if (!__s[23]) {
      return;
    }
    uint64_t v19 = __s;
  }
  std::__get_collation_name(&v26, v19);
  *(_OWORD *)a4 = *(_OWORD *)&v26.__r_.__value_.__l.__data_;
  unint64_t v20 = v26.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v26.__r_.__value_.__l + 2);
  unint64_t v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0) {
    unint64_t v21 = *(void *)(a4 + 8);
  }
  if (v21)
  {
LABEL_23:
    if ((__s[23] & 0x80000000) == 0) {
      return;
    }
    uint64_t v19 = *(char **)__s;
LABEL_29:
    operator delete(v19);
    return;
  }
  if (__s[23] < 0)
  {
    uint64_t v19 = *(char **)__s;
    if (*(void *)&__s[8] >= 3uLL) {
      goto LABEL_29;
    }
    goto LABEL_31;
  }
  if (__s[23] < 3u)
  {
LABEL_31:
    (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v26);
    if (*(char *)(a4 + 23) < 0) {
      operator delete(*(void **)a4);
    }
    *(std::string *)a4 = v26;
    if (*(char *)(a4 + 23) < 0)
    {
      uint64_t v23 = *(void *)(a4 + 8);
      if (v23 == 1 || v23 == 12)
      {
        if (__s != (char *)a4)
        {
          if (__s[23] >= 0) {
            int v24 = __s;
          }
          else {
            int v24 = *(char **)__s;
          }
          if (__s[23] >= 0) {
            size_t v25 = __s[23];
          }
          else {
            size_t v25 = *(void *)&__s[8];
          }
          std::string::__assign_no_alias<false>((void **)a4, v24, v25);
        }
      }
      else
      {
        **(unsigned char **)a4 = 0;
        *(void *)(a4 + 8) = 0;
      }
    }
    else
    {
      int v22 = *(unsigned __int8 *)(a4 + 23);
      if (v22 == 1 || v22 == 12)
      {
        if (__s != (char *)a4)
        {
          if (__s[23] < 0)
          {
            std::string::__assign_no_alias<true>((void *)a4, *(void **)__s, *(size_t *)&__s[8]);
          }
          else
          {
            *(_OWORD *)a4 = *(_OWORD *)__s;
            *(void *)(a4 + 16) = *(void *)&__s[16];
          }
        }
      }
      else
      {
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 23) = 0;
      }
    }
    goto LABEL_23;
  }
}

void sub_263668CF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, char *a3, BOOL a4)
{
  unint64_t v4 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 > 0x16)
  {
    uint64_t v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v16 = v4 | 7;
    }
    uint64_t v17 = v16 + 1;
    std::basic_regex<char>::value_type v9 = operator new(v16 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    int v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  std::basic_regex<char>::value_type v9 = __p;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v9 - a2 < 0x20)
  {
    int v10 = v9;
    std::basic_regex<char>::value_type v11 = (char *)a2;
  }
  else
  {
    int v10 = (char *)v9 + (v4 & 0xFFFFFFFFFFFFFFE0);
    std::basic_regex<char>::value_type v11 = (char *)(a2 + (v4 & 0xFFFFFFFFFFFFFFE0));
    int v12 = (long long *)(a2 + 16);
    long long v13 = v9 + 1;
    unint64_t v14 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      _OWORD *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a3);
LABEL_16:
  *int v10 = 0;
  uint64_t v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v20 = __p;
  }
  else {
    unint64_t v20 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    uint64_t v19 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v20, &v19[(void)v20]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v21 = __p;
  }
  else {
    unint64_t v21 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v21, a4);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_263668EDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, char *a3)
{
  int v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (char *)a2, a3);
  if ((char *)a2 != v6 || (char *)a2 == a3 || (char *)(a2 + 1) == a3 || *(unsigned char *)a2 != 92) {
    return v6;
  }
  int v8 = *(unsigned __int8 *)(a2 + 1);
  if (v8 == 40)
  {
    std::basic_regex<char>::value_type v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      int v10 = operator new(0x18uLL);
      int v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(v12 + 8);
      *int v10 = &unk_270EA2D30;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(void *)(v12 + 8) = v10;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3) {
        goto LABEL_23;
      }
      unint64_t v14 = v9;
      long long v15 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v16 = *(_DWORD *)(a1 + 28);
      uint64_t v17 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v14, a3);
      if (v14 == v17) {
        break;
      }
      std::basic_regex<char>::value_type v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v17, (std::basic_regex<char> *)a3, v15, (v16 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v14 != v9);
    if ((char *)&v14->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v14->__traits_.__loc_.__locale_) != 92
      || BYTE1(v14->__traits_.__loc_.__locale_) != 41)
    {
LABEL_23:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    int v6 = (char *)v14 + 2 * (BYTE1(v14->__traits_.__loc_.__locale_) == 41);
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      char v18 = operator new(0x18uLL);
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = *(void *)(v19 + 8);
      *char v18 = &unk_270EA2D78;
      v18[1] = v20;
      *((_DWORD *)v18 + 4) = v11;
      *(void *)(v19 + 8) = v18;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return v6;
    }
    return v6;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8) {
    return v6;
  }
  if ((v8 - 48) > *(_DWORD *)(a1 + 28)) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return (char *)(a2 + 2);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  std::basic_regex<char>::value_type v9 = (unsigned __int8 *)a3;
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return this;
  }
  int v10 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v10 == a3) {
    goto LABEL_45;
  }
  int v11 = LOBYTE(v10->__traits_.__loc_.__locale_);
  if ((v11 & 0xF8) != 0x30 && (v11 & 0xFE) != 0x38) {
    goto LABEL_45;
  }
  int v12 = v11 - 48;
  uint64_t v13 = (std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_15:
    uint64_t v13 = a3;
  }
  else
  {
    while (1)
    {
      int v14 = LOBYTE(v13->__traits_.__loc_.__locale_);
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
        break;
      }
      if (v12 >= 214748364) {
        goto LABEL_45;
      }
      int v12 = v14 + 10 * v12 - 48;
      uint64_t v13 = (std::basic_regex<char> *)((char *)v13 + 1);
      if (v13 == a3) {
        goto LABEL_15;
      }
    }
  }
  if (v13 == v10) {
    goto LABEL_45;
  }
  if (v13 == a3) {
LABEL_46:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  long long v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 1);
  int v16 = LOBYTE(v13->__traits_.__loc_.__locale_);
  if (v16 != 44)
  {
    if (v15 != a3 && v16 == 92 && LOBYTE(v15->__traits_.__loc_.__locale_) == 125)
    {
      uint64_t v19 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v12, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_46;
  }
  if (v15 == a3) {
    goto LABEL_46;
  }
  int v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
  if ((v17 & 0xF8) == 0x30 || (v17 & 0xFE) == 0x38)
  {
    int v18 = v17 - 48;
    long long v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_37:
      long long v15 = a3;
      goto LABEL_40;
    }
    while (1)
    {
      int v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
      if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
        break;
      }
      if (v18 >= 214748364) {
        goto LABEL_45;
      }
      int v18 = v17 + 10 * v18 - 48;
      long long v15 = (std::basic_regex<char> *)((char *)v15 + 1);
      if (v15 == a3) {
        goto LABEL_37;
      }
    }
  }
  else
  {
    int v18 = -1;
  }
  if (v15 == a3)
  {
    uint64_t v20 = (unsigned __int8 *)v15;
    long long v15 = a3;
    std::basic_regex<char>::value_type v9 = v20;
  }
  else if ((std::basic_regex<char> *)((char *)&v15->__traits_.__loc_.__locale_ + 1) == a3 || v17 != 92)
  {
    std::basic_regex<char>::value_type v9 = (unsigned __int8 *)v15;
  }
  else
  {
    std::basic_regex<char>::value_type v9 = (unsigned __int8 *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 125);
  }
LABEL_40:
  if (v15 == (std::basic_regex<char> *)v9) {
    goto LABEL_46;
  }
  if (v18 != -1)
  {
    if (v18 >= v12)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v18, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v9;
    }
LABEL_45:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v9;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v6 = a2 + 1;
    int v5 = *a2;
    if (a2 + 1 != a3 || v5 != 36)
    {
      if ((v5 - 46) > 0x2E || ((1 << (v5 - 46)) & 0x600000000001) == 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
        return a2 + 1;
      }
      if (v6 != a3 && v5 == 92)
      {
        int v9 = *v6;
        if ((v9 - 36) <= 0x3A && ((1 << (v9 - 36)) & 0x580000000000441) != 0)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v9);
          return a2 + 2;
        }
      }
      if (*a2 == 46)
      {
        int v10 = (std::__node<char> *)operator new(0x10uLL);
        std::vector<std::ssub_match>::pointer end = this->__end_;
        first = end->__first_;
        v10->__vftable = (std::__node<char>_vtbl *)&unk_270EA2F28;
        v10[1].__vftable = (std::__node<char>_vtbl *)first;
        end->__first_ = v10;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        return a2 + 1;
      }
    }
  }

  return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  int v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
  if (v8 == a2)
  {
    int v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)a2, (std::basic_regex<char>::value_type *)a3);
    if (v8 == a2)
    {
      if (a2 == a3 || LOBYTE(a2->__traits_.__loc_.__locale_) != 46)
      {
        int v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, (char *)a2, (char *)a3);
      }
      else
      {
        int v9 = operator new(0x10uLL);
        uint64_t v10 = *(void *)(a1 + 56);
        uint64_t v11 = *(void *)(v10 + 8);
        void *v9 = &unk_270EA2F28;
        v9[1] = v11;
        *(void *)(v10 + 8) = v9;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        int v8 = (std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1);
      }
    }
  }
  if (v8 != a2 || v8 == a3)
  {
LABEL_23:
    if (v8 != a2) {
      goto LABEL_24;
    }
    return a2;
  }
  int locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  if (locale_low == 36)
  {
    uint64_t v13 = operator new(0x18uLL);
    BOOL v14 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v15 = *(void *)(a1 + 56);
    v13[1] = *(void *)(v15 + 8);
    int v16 = &unk_270EA2A18;
    goto LABEL_14;
  }
  if (locale_low == 40)
  {
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v18 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      int v17 = operator new(0x18uLL);
      int v18 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v18;
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = *(void *)(v19 + 8);
      *int v17 = &unk_270EA2D30;
      v17[1] = v20;
      *((_DWORD *)v17 + 4) = v18;
      *(void *)(v19 + 8) = v17;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    ++*(_DWORD *)(a1 + 36);
    unint64_t v21 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
    if (v21 == a3 || (int v22 = v21, LOBYTE(v21->__traits_.__loc_.__locale_) != 41)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      uint64_t v23 = operator new(0x18uLL);
      uint64_t v24 = *(void *)(a1 + 56);
      uint64_t v25 = *(void *)(v24 + 8);
      *uint64_t v23 = &unk_270EA2D78;
      v23[1] = v25;
      *((_DWORD *)v23 + 4) = v18;
      *(void *)(v24 + 8) = v23;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    --*(_DWORD *)(a1 + 36);
    int v8 = (std::basic_regex<char> *)((char *)&v22->__traits_.__loc_.__locale_ + 1);
    goto LABEL_23;
  }
  if (locale_low != 94) {
    return a2;
  }
  uint64_t v13 = operator new(0x18uLL);
  BOOL v14 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
  uint64_t v15 = *(void *)(a1 + 56);
  v13[1] = *(void *)(v15 + 8);
  int v16 = &unk_270EA29D0;
LABEL_14:
  void *v13 = v16;
  *((unsigned char *)v13 + 16) = v14;
  *(void *)(v15 + 8) = v13;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  int v8 = (std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1);
LABEL_24:
  size_t v26 = (*(_DWORD *)(a1 + 28) + 1);

  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v8, a3, v6, (v7 + 1), v26);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  if (this == a3) {
    return this;
  }
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
      return this;
    case ')':
      if (a1->__open_count_) {
        return this;
      }
      break;
    default:
      break;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
  return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  unint64_t v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  std::basic_regex<char>::value_type v5 = *v4;
  switch(*v4)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
    case '}':
      std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v5);
      v3 += 2;
      return v3;
    default:
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v4, a3, 0);
      }
      else
      {
        BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v5);
        uint64_t v8 = 2;
        if (!v7) {
          uint64_t v8 = 0;
        }
        uint64_t result = &v3[v8];
      }
      break;
  }
  return result;
}

void *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, uint64_t a2, unsigned __int8 a3)
{
  char v11 = -86;
  MEMORY[0x263E672E0](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    BOOL v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_263669D98(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x263669D58);
  }
  __cxa_rethrow();
}

void sub_263669E14(_Unwind_Exception *a1)
{
}

std::string *abm::trace::getBasebandTraceDirSuffix@<X0>(abm::trace *this@<X0>, std::string *a2@<X8>)
{
  int v2 = (int)this;
  memset(a2, 170, sizeof(std::string));
  *((unsigned char *)&a2->__r_.__value_.__s + 23) = 0;
  a2->__r_.__value_.__s.__data_[0] = 0;
  uint64_t result = (std::string *)capabilities::radio::vendor(this);
  if ((result - 2) >= 2)
  {
    if (result != 1) {
      return result;
    }
    if (v2)
    {
      *((unsigned char *)&a2->__r_.__value_.__s + 23) = 5;
      strcpy((char *)a2, "-qdss");
      return result;
    }
    std::basic_regex<char>::value_type v5 = abm::trace::kEURTraceSnapshotDirectorySuffix;
  }
  else
  {
    std::basic_regex<char>::value_type v5 = abm::trace::kICETraceSnapshotDirectorySuffix;
  }
  return std::string::__assign_external(a2, *v5);
}

void sub_263669EC4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

size_t std::string::basic_string[abi:ne180100]<0>(const char *a1)
{
  size_t result = strlen(a1);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v3 = result;
  if (result >= 0x17)
  {
    uint64_t v5 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v5 = result | 7;
    }
    uint64_t v6 = v5 + 1;
    unint64_t v4 = (long long *)operator new(v5 + 1);
    *((void *)&xmmword_26B431A10 + 1) = v3;
    unk_26B431A20 = v6 | 0x8000000000000000;
    *(void *)&xmmword_26B431A10 = v4;
  }
  else
  {
    unint64_t v4 = &xmmword_26B431A10;
    byte_26B431A27 = result;
    if (!result)
    {
      LOBYTE(xmmword_26B431A10) = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(v4, a1, v3);
  *((unsigned char *)v4 + v3) = 0;
  return result;
}

void abm::trace::getCoreDumpDirSuffix(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) == 0)
  {
    unint64_t v4 = (capabilities::radio *)__cxa_guard_acquire(&_MergedGlobals);
    if (v4)
    {
      int v5 = capabilities::radio::maverick(v4);
      uint64_t v6 = abm::trace::kEURCoreDumpSnapshotDirectorySuffix;
      if (!v5) {
        uint64_t v6 = abm::trace::kCoreDumpSnapshotDirectorySuffix;
      }
      std::string::basic_string[abi:ne180100]<0>(*v6);
      __cxa_guard_release(&_MergedGlobals);
    }
  }
  if (byte_26B431A27 < 0)
  {
    long long v3 = xmmword_26B431A10;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B431A10;
    a1->__r_.__value_.__r.__words[2] = unk_26B431A20;
  }
}

void sub_26366A064(_Unwind_Exception *a1)
{
}

uint64_t abm::trace::isSupported(uint64_t a1)
{
  uint64_t v1 = (const char *)a1;
  int v2 = *(char *)(a1 + 23);
  if (v2 < 0)
  {
    long long v3 = (capabilities::radio *)strcasecmp(*(const char **)a1, (const char *)abm::trace::kDIAG);
    if (v3)
    {
LABEL_3:
      unint64_t v4 = v1;
      if ((v2 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    long long v3 = (capabilities::radio *)strcasecmp((const char *)a1, (const char *)abm::trace::kDIAG);
    if (v3) {
      goto LABEL_3;
    }
  }
  if (capabilities::radio::maverick(v3)) {
    return 1;
  }
  LOBYTE(v2) = v1[23];
  unint64_t v4 = v1;
  if ((v2 & 0x80) == 0)
  {
LABEL_4:
    int v5 = (capabilities::radio *)strcasecmp(v4, (const char *)abm::trace::kICETrace);
    if (v5) {
      goto LABEL_5;
    }
LABEL_12:
    if (capabilities::radio::ice(v5)) {
      return 1;
    }
    LOBYTE(v2) = v1[23];
    if ((v2 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_11:
  int v5 = (capabilities::radio *)strcasecmp(*(const char **)v1, (const char *)abm::trace::kICETrace);
  if (!v5) {
    goto LABEL_12;
  }
LABEL_5:
  if ((v2 & 0x80) == 0)
  {
LABEL_6:
    uint64_t v6 = v1;
    if (!strcasecmp(v1, (const char *)abm::trace::kBasebandTrace)) {
      return 1;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = *(const char **)v1;
  if (!strcasecmp(*(const char **)v1, (const char *)abm::trace::kBasebandTrace)) {
    return 1;
  }
LABEL_15:
  BOOL v7 = (capabilities::radio *)strcasecmp(v6, (const char *)abm::trace::kEURCoreDump);
  if (v7)
  {
    if ((v2 & 0x80) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
    if (capabilities::radio::maverick(v7)) {
      return 1;
    }
    if ((v1[23] & 0x80) == 0)
    {
LABEL_17:
      if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump)
        || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs))
      {
        return 1;
      }
      if (!strcasecmp(v1, (const char *)abm::trace::kCompression)) {
        goto LABEL_40;
      }
      if (strcasecmp(v1, (const char *)abm::trace::kBasebandIPC))
      {
        if (!strcasecmp(v1, (const char *)abm::trace::kIPC)
          || !strcasecmp(v1, "KernelPCI")
          || !strcasecmp(v1, (const char *)abm::trace::kTapToRadar))
        {
          goto LABEL_40;
        }
LABEL_34:
        if (strcasecmp(v1, (const char *)abm::trace::kProfile))
        {
          if (strcasecmp(v1, (const char *)abm::trace::kTraceTailspin)
            && strcasecmp(v1, "Settings")
            && strcasecmp(v1, "LogFilter"))
          {
            return 0;
          }
          goto LABEL_40;
        }
        return 1;
      }
      goto LABEL_43;
    }
  }
  uint64_t v1 = *(const char **)v1;
  if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump) || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs)) {
    return 1;
  }
  if (!strcasecmp(v1, (const char *)abm::trace::kCompression)) {
    goto LABEL_40;
  }
  if (strcasecmp(v1, (const char *)abm::trace::kBasebandIPC))
  {
    if (!strcasecmp(v1, (const char *)abm::trace::kIPC)
      || !strcasecmp(v1, "KernelPCI")
      || !strcasecmp(v1, (const char *)abm::trace::kTapToRadar))
    {
LABEL_40:
      return MEMORY[0x270F96DB0]();
    }
    goto LABEL_34;
  }
LABEL_43:

  return MEMORY[0x270F96D80]();
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        int v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          BOOL v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22) {
            operator delete(v9);
          }
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        std::string::size_type v12 = 2 * v8;
        if (__n > 2 * v8) {
          std::string::size_type v12 = __n;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = HIBYTE(v10);
    BOOL v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    BOOL v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        int v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);

  return std::string::__assign_external(this, __s, v4);
}

void abm::debug::registerLogServer(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN3abm5debugL14sLogServerInitERNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a1;
  if (abm::debug::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce != -1) {
    dispatch_once(&abm::debug::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, block);
  }
}

void ___ZN3abm5debugL14sLogServerInitERNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  xpc_object_t xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  ctu::LogServer::getConfig((uint64_t *)&xdict, **(ctu::LogServer ***)(a1 + 32));
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kDomainLogLevels");
  xpc_object_t v3 = value;
  uint64_t v4 = MEMORY[0x263EF8708];
  if (value)
  {
    xpc_retain(value);
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    if (!v3)
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x263E67790](v3) == v4)
  {
    xpc_retain(v3);
    xpc_object_t v5 = v3;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
  }
LABEL_8:
  xpc_release(v3);
  if (MEMORY[0x263E67790](v5) == v4)
  {
    xpc_object_t v7 = v5;
  }
  else
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E67790](v6) == v4)
      {
        xpc_retain(v6);
        xpc_object_t v7 = v6;
      }
      else
      {
        xpc_object_t v7 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
    }
    xpc_release(v6);
    xpc_object_t v8 = xpc_null_create();
    xpc_release(v5);
    xpc_release(v8);
  }
  xpc_object_t v9 = xpc_int64_create(1);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "libetl", v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  xpc_object_t v11 = xpc_int64_create(1);
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "libtu", v11);
  xpc_object_t v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  xpc_object_t v13 = xpc_int64_create(1);
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "trace.diag.cfg", v13);
  xpc_object_t v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  xpc_object_t v15 = xpc_int64_create(1);
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "trace.diag.svc", v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  xpc_object_t v17 = xpc_int64_create(1);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "libktl", v17);
  xpc_object_t v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  if (v7)
  {
    xpc_retain(v7);
    xpc_object_t v19 = v7;
  }
  else
  {
    xpc_object_t v19 = xpc_null_create();
  }
  xpc_dictionary_set_value(xdict, "kDomainLogLevels", v19);
  xpc_object_t v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  xpc_object_t object = xdict;
  if (xdict) {
    xpc_retain(xdict);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  ctu::LogServer::updateConfig();
  xpc_release(object);
  unint64_t v21 = (capabilities::abs *)operator new(0x10uLL);
  int v22 = *(void **)(a1 + 32);
  *(void *)unint64_t v21 = *v22;
  uint64_t v23 = v22[1];
  *((void *)v21 + 1) = v23;
  if (v23) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v23 + 16), 1uLL, memory_order_relaxed);
  }
  _MergedGlobals_0 = (uint64_t)v21;
  if (!qword_26B431A30)
  {
    unint64_t v21 = (capabilities::abs *)os_log_create("com.apple.telephony.abm", "libtu");
    qword_26B431A30 = (uint64_t)v21;
  }
  capabilities::abs::TUDebugFlags(v21);
  TelephonyUtilDebugSetFlags();
  uint64_t v24 = (capabilities::radio *)TelephonyUtilDebugRegisterDelegate();
  uint64_t v25 = (capabilities::radio *)capabilities::radio::ice(v24);
  if ((v25 & 1) == 0) {
    capabilities::radio::maverick(v25);
  }
  if (!qword_26B431A38) {
    qword_26B431A38 = (uint64_t)os_log_create("com.apple.telephony.abm", "bbu");
  }
  BBUpdaterRegisterGlobalLogSink();
  xpc_release(v7);
  xpc_release(xdict);
}

void sub_26366A9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
  xpc_release(object);
  xpc_release(v10);
  xpc_release(a10);
  _Unwind_Resume(a1);
}

void abm::debug::handleDebugPrintTelephonyUtil(abm::debug *this, const char *a2, const char *a3, char *a4)
{
}

void abm::debug::handleDebugPrintBinaryTelephonyUtil(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = "misc";
  if (!a2) {
    uint64_t v4 = "send";
  }
  if (a2 == 1) {
    xpc_object_t v5 = "recv";
  }
  else {
    xpc_object_t v5 = v4;
  }
  xpc_object_t v6 = (void *)_MergedGlobals_0;
  if (_MergedGlobals_0)
  {
    xpc_object_t v8 = *(std::__shared_weak_count **)(_MergedGlobals_0 + 8);
    if (v8)
    {
      xpc_object_t v10 = std::__shared_weak_count::lock(v8);
      if (v10)
      {
        xpc_object_t v11 = v10;
        if (!*v6)
        {
LABEL_22:
          if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
          return;
        }
        unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v27[1] = v12;
        v27[2] = v12;
        v27[0] = v12;
        ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v27);
        uint64_t v13 = MEMORY[0x263E671B0](v27, a1);
        MEMORY[0x263E671B0](v13, " (");
        uint64_t v14 = ctu::operator<<();
        uint64_t v15 = MEMORY[0x263E671B0](v14, ") ");
        uint64_t v16 = MEMORY[0x263E671B0](v15, v5);
        MEMORY[0x263E671B0](v16, "\n");
        v25[1] = (void *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v26 = 0xAAAAAAAAAAAAAALL;
        v25[0] = (void *)0xAAAAAAAAAAAAAA00;
        ctu::assign();
        xpc_object_t v17 = (ctu::Clock *)MEMORY[0x263E671C0](v27, v25);
        ctu::Clock::now_in_nanoseconds(v17);
        xpc_object_t v18 = (std::__shared_weak_count_vtbl *)operator new(0x60uLL);
        char v24 = 5;
        strcpy((char *)__p, "libtu");
        MEMORY[0x263E67090](v27);
        ctu::LogMessageBuffer::takeMetadata((ctu::LogMessageBuffer *)v27);
        ctu::LogMessage::LogMessage();
        xpc_object_t v19 = (std::__shared_weak_count *)operator new(0x20uLL);
        v19->__shared_owners_ = 0;
        p_shared_owners = &v19->__shared_owners_;
        v19->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EA2F80;
        v19->__shared_weak_owners_ = 0;
        v19[1].__vftable = v18;
        if (v24 < 0) {
          operator delete(__p[0]);
        }
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
        ctu::LogServer::log();
        if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
        unint64_t v21 = qword_26B431A30;
        if (qword_26B431A30 && os_log_type_enabled((os_log_t)qword_26B431A30, OS_LOG_TYPE_DEBUG))
        {
          int v22 = v25;
          if (v26 < 0) {
            int v22 = (void **)v25[0];
          }
          *(_DWORD *)buf = 67109634;
          int v30 = a4;
          __int16 v31 = 2080;
          int v32 = v5;
          __int16 v33 = 2080;
          unint64_t v34 = v22;
          _os_log_debug_impl(&dword_263655000, v21, OS_LOG_TYPE_DEBUG, "(%d) %s: %s", buf, 0x1Cu);
          if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
            goto LABEL_19;
          }
        }
        else if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
        {
LABEL_19:
          if (SHIBYTE(v26) < 0) {
            operator delete(v25[0]);
          }
          MEMORY[0x263E670D0](v27);
          goto LABEL_22;
        }
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
        goto LABEL_19;
      }
    }
  }
}

void sub_26366AE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  if (a10 && !atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
    std::__shared_weak_count::__release_weak(a10);
  }
  if (!atomic_fetch_add(v25, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  if (a22 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E670D0](&a23);
  if (!atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  _Unwind_Resume(a1);
}

uint64_t abm::debug::handleDebugPrintBBU(abm::debug *this, void *a2, const char *a3, const char *a4)
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  long long v45 = v5;
  long long v44 = v5;
  long long v43 = v5;
  long long v42 = v5;
  long long v41 = v5;
  long long v40 = v5;
  long long v39 = v5;
  long long v38 = v5;
  long long v37 = v5;
  *(_OWORD *)std::vector<std::csub_match> __p = v5;
  long long v34 = v5;
  long long v31 = v5;
  long long v32 = v5;
  long long v29 = v5;
  long long v30 = v5;
  uint64_t v6 = MEMORY[0x263F8C340] + 64;
  uint64_t v36 = MEMORY[0x263F8C340] + 64;
  xpc_object_t v7 = (uint64_t *)MEMORY[0x263F8C2C8];
  uint64_t v8 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v28 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(uint64_t *)((char *)&v28 + *(void *)(v28 - 24)) = v8;
  xpc_object_t v9 = (std::ios_base *)((char *)&v28 + *(void *)(v28 - 24));
  std::ios_base::init(v9, &v29);
  uint64_t v10 = MEMORY[0x263F8C340] + 24;
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  uint64_t v28 = v10;
  uint64_t v36 = v6;
  std::streambuf::basic_streambuf();
  uint64_t v11 = MEMORY[0x263F8C318] + 16;
  *(void *)&long long v29 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)std::vector<std::csub_match> __p = 0u;
  long long v34 = 0u;
  LODWORD(v35) = 16;
  long long v12 = (void *)std::ostream::operator<<();
  uint64_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)":", 1);
  size_t v14 = strlen(a3);
  uint64_t v15 = (abm::debug *)std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)a3, v14);
  memset(__dst, 170, sizeof(__dst));
  if ((v35 & 0x10) != 0)
  {
    uint64_t v21 = *((void *)&v34 + 1);
    if (*((void *)&v34 + 1) < (unint64_t)v32)
    {
      *((void *)&v34 + 1) = v32;
      uint64_t v21 = v32;
    }
    int v22 = (const void *)*((void *)&v31 + 1);
    size_t v19 = v21 - *((void *)&v31 + 1);
    if ((unint64_t)(v21 - *((void *)&v31 + 1)) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_22;
    }
  }
  else
  {
    if ((v35 & 8) == 0)
    {
      size_t v19 = 0;
      HIBYTE(__dst[2]) = 0;
      xpc_object_t v20 = __dst;
      goto LABEL_14;
    }
    int v22 = (const void *)v30;
    size_t v19 = v31 - v30;
    if ((void)v31 - (void)v30 >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_22:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v19 >= 0x17)
  {
    uint64_t v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v23 = v19 | 7;
    }
    uint64_t v24 = v23 + 1;
    xpc_object_t v20 = (void **)operator new(v23 + 1);
    __dst[1] = (void *)v19;
    __dst[2] = (void *)(v24 | 0x8000000000000000);
    __dst[0] = v20;
    goto LABEL_13;
  }
  HIBYTE(__dst[2]) = v19;
  xpc_object_t v20 = __dst;
  if (v19) {
LABEL_13:
  }
    uint64_t v15 = (abm::debug *)memmove(v20, v22, v19);
LABEL_14:
  *((unsigned char *)v20 + v19) = 0;
  uint64_t v25 = __dst;
  if (SHIBYTE(__dst[2]) < 0) {
    uint64_t v25 = (void **)__dst[0];
  }
  abm::debug::handleDebugPrintBBUHelper(v15, v16, v17, v18, v25);
  if (SHIBYTE(__dst[2]) < 0) {
    operator delete(__dst[0]);
  }
  uint64_t v28 = *v7;
  *(uint64_t *)((char *)&v28 + *(void *)(v28 - 24)) = v7[3];
  *(void *)&long long v29 = v11;
  if (SBYTE7(v34) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E67440](&v36);
}

void sub_26366B348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0)
  {
    operator delete(__p);
    std::ostringstream::~ostringstream((uint64_t)&a17);
    _Unwind_Resume(a1);
  }
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void abm::debug::handleDebugPrint(int a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)_MergedGlobals_0;
  if (!_MergedGlobals_0) {
    return;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(_MergedGlobals_0 + 8);
  if (!v6) {
    return;
  }
  uint64_t v10 = std::__shared_weak_count::lock(v6);
  unint64_t v50 = v10;
  if (!v10) {
    return;
  }
  if (!*v4)
  {
    size_t v19 = v10;
LABEL_62:
    if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
    return;
  }
  unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47[1] = v11;
  v47[2] = v11;
  v47[0] = v11;
  ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v47);
  if (a2 && *a2)
  {
    uint64_t v12 = MEMORY[0x263E671B0](v47, a2);
    MEMORY[0x263E671B0](v12, ": ");
  }
  MEMORY[0x263E670B0](&v45, a3, a4);
  ctu::operator<<();
  uint64_t v13 = (ctu::Clock *)MEMORY[0x263E670D0](&v45);
  ctu::Clock::now_in_nanoseconds(v13);
  size_t v14 = (std::string *)operator new(0x60uLL);
  uint64_t v15 = abm::debug::kLogDomainMap[a1];
  size_t v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v17 = (void *)v16;
  if (v16 >= 0x17)
  {
    uint64_t v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v20 = v16 | 7;
    }
    uint64_t v21 = v20 + 1;
    xpc_object_t v18 = (void **)operator new(v20 + 1);
    __dst[1] = v17;
    unint64_t v44 = v21 | 0x8000000000000000;
    __dst[0] = v18;
    goto LABEL_16;
  }
  HIBYTE(v44) = v16;
  xpc_object_t v18 = __dst;
  if (v16) {
LABEL_16:
  }
    memmove(v18, v15, (size_t)v17);
  *((unsigned char *)v17 + (void)v18) = 0;
  MEMORY[0x263E67090](v47);
  ctu::LogMessageBuffer::takeMetadata((ctu::LogMessageBuffer *)v47);
  ctu::LogMessage::LogMessage();
  long long v45 = v14;
  int v22 = (std::__shared_weak_count *)operator new(0x20uLL);
  v22->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EA2F80;
  v22->__shared_owners_ = 0;
  v22->__shared_weak_owners_ = 0;
  v22[1].__vftable = (std::__shared_weak_count_vtbl *)v14;
  int64_t v46 = v22;
  if (SHIBYTE(v44) < 0)
  {
    operator delete(__dst[0]);
    uint64_t v23 = v14 + 2;
    int v24 = SHIBYTE(v14[2].__r_.__value_.__r.__words[2]);
    if ((v24 & 0x80000000) == 0) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v23 = v14 + 2;
    int v24 = SHIBYTE(v14[2].__r_.__value_.__r.__words[2]);
    if ((v24 & 0x80000000) == 0)
    {
LABEL_19:
      size_t size = v24;
      data = v23;
      goto LABEL_22;
    }
  }
  data = (std::string *)v14[2].__r_.__value_.__l.__data_;
  size_t size = v14[2].__r_.__value_.__l.__size_;
LABEL_22:
  int v27 = memchr(data, 10, size);
  if (v27) {
    unint64_t v28 = (unint64_t)v27;
  }
  else {
    unint64_t v28 = (unint64_t)data + size;
  }
  if (v28 - (void)data != size)
  {
    long long v29 = (unsigned __int8 *)(v28 + 1);
    if ((std::string *)(v28 + 1) != (std::string *)((char *)data + size))
    {
      long long v30 = (char *)data + size + ~v28;
      do
      {
        int v31 = *v29;
        if (v31 != 10) {
          *(unsigned char *)v28++ = v31;
        }
        ++v29;
        --v30;
      }
      while (v30);
      LOBYTE(v24) = *((unsigned char *)&v14[2].__r_.__value_.__s + 23);
    }
  }
  if ((v24 & 0x80) == 0)
  {
    long long v32 = (char *)v23 + v24;
    std::string::size_type v33 = v28 - (void)v23;
    if (v24 >= v28 - (unint64_t)v23) {
      goto LABEL_34;
    }
LABEL_48:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  std::string::pointer v38 = v14[2].__r_.__value_.__l.__data_;
  std::string::size_type v37 = v14[2].__r_.__value_.__l.__size_;
  long long v32 = &v38[v37];
  std::string::size_type v33 = v28 - (void)v38;
  if (v37 < v28 - (unint64_t)v38) {
    goto LABEL_48;
  }
LABEL_34:
  if (&v32[-v28] == (char *)-1)
  {
    if ((v24 & 0x80) != 0)
    {
      std::string::pointer v41 = v14[2].__r_.__value_.__l.__data_;
      v14[2].__r_.__value_.__l.__size_ = v33;
      v41[v33] = 0;
      long long v34 = v46;
      long long v42 = v46;
      if (!v46) {
        goto LABEL_37;
      }
    }
    else
    {
      *((unsigned char *)&v14[2].__r_.__value_.__s + 23) = v33 & 0x7F;
      v23->__r_.__value_.__s.__data_[v33] = 0;
      long long v34 = v46;
      long long v42 = v46;
      if (!v46) {
        goto LABEL_37;
      }
    }
    goto LABEL_36;
  }
  std::string::__erase_external_with_move(v23, v33, (std::string::size_type)&v32[-v28]);
  long long v34 = v46;
  long long v42 = v46;
  if (v46) {
LABEL_36:
  }
    atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_37:
  ctu::LogServer::log();
  if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
  if (a1)
  {
    if (a1 == 3)
    {
      unint64_t v35 = qword_26B431A38;
      if (qword_26B431A38)
      {
        if (os_log_type_enabled((os_log_t)qword_26B431A38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = (std::string::__raw *)&v45[2];
          if (SHIBYTE(v45[2].__r_.__value_.__r.__words[2]) < 0) {
            uint64_t v36 = (std::string::__raw *)v36->__words[0];
          }
          *(_DWORD *)buf = 136315138;
          char v52 = v36;
LABEL_57:
          _os_log_impl(&dword_263655000, v35, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    unint64_t v35 = qword_26B431A30;
    if (qword_26B431A30 && os_log_type_enabled((os_log_t)qword_26B431A30, OS_LOG_TYPE_DEFAULT))
    {
      long long v39 = (std::string::__raw *)&v45[2];
      if (SHIBYTE(v45[2].__r_.__value_.__r.__words[2]) < 0) {
        long long v39 = (std::string::__raw *)v39->__words[0];
      }
      *(_DWORD *)buf = 136315138;
      char v52 = v39;
      goto LABEL_57;
    }
  }
  long long v40 = v46;
  if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
  MEMORY[0x263E670D0](v47);
  size_t v19 = v50;
  if (v50) {
    goto LABEL_62;
  }
}

void sub_26366B8DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  MEMORY[0x263E670D0](&a24);
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v24 - 112);
  _Unwind_Resume(a1);
}

void sub_26366B98C(_Unwind_Exception *a1)
{
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v1 - 112);
  _Unwind_Resume(a1);
}

void sub_26366B9A0()
{
  operator delete(v0);
  JUMPOUT(0x26366B9E8);
}

void sub_26366B9CC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  operator delete(v16);
  JUMPOUT(0x26366B9E8);
}

void std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000263677FF1) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000263677FF1 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000263677FF1)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000263677FF1 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::string::__erase_external_with_move(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  if (!__n) {
    return;
  }
  int v4 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v4 < 0)
  {
    uint64_t v6 = (std::string *)this->__r_.__value_.__r.__words[0];
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v7 = size - __pos;
    if (size - __pos >= __n) {
      std::string::size_type v8 = __n;
    }
    else {
      std::string::size_type v8 = size - __pos;
    }
    if (size - __pos <= __n) {
      goto LABEL_8;
    }
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    uint64_t v6 = this;
    std::string::size_type v7 = size - __pos;
    if (size - __pos >= __n) {
      std::string::size_type v8 = __n;
    }
    else {
      std::string::size_type v8 = HIBYTE(this->__r_.__value_.__r.__words[2]) - __pos;
    }
    if (v7 <= __n) {
      goto LABEL_8;
    }
  }
  memmove((char *)v6 + __pos, (char *)v6 + __pos + v8, v7 - v8);
  LOBYTE(v4) = *((unsigned char *)&this->__r_.__value_.__s + 23);
LABEL_8:
  std::string::size_type v9 = size - v8;
  if ((v4 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = v9;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = v9 & 0x7F;
  }
  v6->__r_.__value_.__s.__data_[v9] = 0;
}

void abm::debug::handleDebugPrintBBUHelper(abm::debug *this, void *a2, uint64_t a3, const char *a4, ...)
{
  va_start(va, a4);
  abm::debug::handleDebugPrint(3, &unk_26367843A, (uint64_t)"%s", (uint64_t)va);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E67440](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x263E67300](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x263E67310](v13);
  return a1;
}

void sub_26366BE00(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x263E67310](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x26366BDE0);
}

void sub_26366BE54(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        uint64_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        uint64_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0) {
        size_t v16 = __b;
      }
      else {
        size_t v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_26366C048(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Timestamp::Timestamp(Timestamp *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *((void *)this + 1) = 0;
  uint64_t v2 = (void *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  unsigned long long v12 = 0uLL;
  if ((gettimeofday((timeval *)&v12, 0) & 0x80000000) == 0
    || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *v2;
    int v4 = v2;
    if (*v2) {
      goto LABEL_4;
    }
LABEL_10:
    uint64_t v7 = (char *)operator new(0x38uLL);
    *((_DWORD *)v7 + 8) = 0;
    *((void *)v7 + 5) = 0;
    *((void *)v7 + 6) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v4;
    *uint64_t v2 = v7;
    uint64_t v8 = **(void **)this;
    int v9 = (uint64_t *)v7;
    if (v8)
    {
      *(void *)this = v8;
      int v9 = (uint64_t *)*v2;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), v9);
    ++*((void *)this + 2);
    goto LABEL_13;
  }
  uint64_t v10 = __error();
  uint64_t v11 = strerror(*v10);
  *(_DWORD *)buf = 136315138;
  uint64_t v14 = v11;
  _os_log_error_impl(&dword_263655000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to get current time. Error: %s\n", buf, 0xCu);
  uint64_t v3 = *v2;
  int v4 = v2;
  if (!*v2) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v5 = v3;
  while (1)
  {
    while (1)
    {
      int v4 = (void *)v5;
      int v6 = *(_DWORD *)(v5 + 32);
      if (v6 < 1) {
        break;
      }
      uint64_t v5 = *v4;
      uint64_t v2 = v4;
      if (!*v4) {
        goto LABEL_10;
      }
    }
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    uint64_t v5 = v4[1];
    if (!v5)
    {
      uint64_t v2 = v4 + 1;
      goto LABEL_10;
    }
  }
  uint64_t v7 = (char *)v4;
LABEL_13:
  *(_OWORD *)(v7 + 40) = v12;
}

void sub_26366C1F4(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, *v2);
  _Unwind_Resume(a1);
}

void sub_26366C210(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, v2);
  _Unwind_Resume(a1);
}

void Timestamp::Timestamp(Timestamp *this, const Timestamp *a2)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(void **)a2, (void *)a2 + 1);
}

{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(void **)a2, (void *)a2 + 1);
}

void sub_26366C26C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void sub_26366C2C4(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void *Timestamp::Timestamp(void *a1, _OWORD *a2, int a3)
{
  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  void *v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

{
  void *v6;
  char *v7;

  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  void *v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

__n128 Timestamp::set(uint64_t **a1, __n128 *a2, int a3)
{
  uint64_t v7 = a1 + 1;
  int v6 = (char *)a1[1];
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = v6;
        int v9 = *((_DWORD *)v6 + 8);
        if (v9 <= a3) {
          break;
        }
        int v6 = *(char **)v8;
        uint64_t v7 = (uint64_t **)v8;
        if (!*(void *)v8) {
          goto LABEL_8;
        }
      }
      if (v9 >= a3) {
        break;
      }
      int v6 = (char *)*((void *)v8 + 1);
      if (!v6)
      {
        uint64_t v7 = (uint64_t **)(v8 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v8 = (char *)(a1 + 1);
LABEL_8:
    uint64_t v10 = v8;
    uint64_t v8 = (char *)operator new(0x38uLL);
    *((_DWORD *)v8 + 8) = a3;
    *((void *)v8 + 5) = 0;
    *((void *)v8 + 6) = 0;
    *(void *)uint64_t v8 = 0;
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = v10;
    *uint64_t v7 = (uint64_t *)v8;
    uint64_t v11 = (uint64_t *)**a1;
    unsigned long long v12 = (uint64_t *)v8;
    if (v11)
    {
      *a1 = v11;
      unsigned long long v12 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  __n128 result = *a2;
  *(__n128 *)(v8 + 40) = *a2;
  return result;
}

void *Timestamp::Timestamp(void *a1, uint64_t a2, int a3)
{
  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  void *v6 = v7;
  *a1 = v7;
  *((unsigned char *)v7 + 24) = 1;
  a1[2] = 1;
  *((void *)v7 + 5) = a2;
  *((void *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

{
  void *v6;
  _DWORD *v7;

  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  void *v6 = v7;
  *a1 = v7;
  *((unsigned char *)v7 + 24) = 1;
  a1[2] = 1;
  *((void *)v7 + 5) = a2;
  *((void *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

uint64_t **Timestamp::Timestamp(uint64_t **a1, char *a2, char a3, int a4)
{
  uint64_t v5 = a2;
  uint64_t v28 = *MEMORY[0x263EF8340];
  a1[1] = 0;
  uint64_t v7 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  __p[2] = (void *)0x11AAAAAAAAAA0053;
  *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)"%Y-%m-%d-%H-%M-%S";
  if ((a3 & 0x10) != 0)
  {
    HIBYTE(__p[2]) = 19;
    strcpy((char *)__p, "%Y.%m.%d_%H-%M-%S%z");
  }
  *((void *)&v23 + 1) = 0xAAAAAAAA00000000;
  memset(&v24, 0, sizeof(v24));
  if (a2[23] < 0) {
    uint64_t v5 = *(const char **)a2;
  }
  if (strptime(v5, (const char *)__p, &v24))
  {
    v24.tm_isdst = -1;
    *(void *)&unsigned long long v23 = mktime(&v24);
    if ((void)v23 != -1) {
      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = __error();
      uint64_t v20 = strerror(*v19);
      *(_DWORD *)buf = 136315138;
      int v27 = v20;
      _os_log_error_impl(&dword_263655000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to convert to absolute time. Error: %s\n", buf, 0xCu);
      unsigned long long v23 = 0uLL;
      if ((gettimeofday((timeval *)&v23, 0) & 0x80000000) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      unsigned long long v23 = 0uLL;
      if ((gettimeofday((timeval *)&v23, 0) & 0x80000000) == 0) {
        goto LABEL_15;
      }
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v8 = __error();
    int v9 = strerror(*v8);
    *(_DWORD *)buf = 136315138;
    int v27 = v9;
    uint64_t v10 = MEMORY[0x263EF8438];
    uint64_t v11 = "Failed to get current time after absolute time conversion failed. Error: %s\n";
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_263655000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to convert time from string format\n", buf, 2u);
  }
  unsigned long long v23 = 0uLL;
  if (gettimeofday((timeval *)&v23, 0) < 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = __error();
    int v22 = strerror(*v21);
    *(_DWORD *)buf = 136315138;
    int v27 = v22;
    uint64_t v10 = MEMORY[0x263EF8438];
    uint64_t v11 = "Failed to get current time after conversion failure. Error: %s\n";
LABEL_32:
    _os_log_error_impl(&dword_263655000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
  }
LABEL_15:
  unsigned long long v12 = *v7;
  uint64_t v13 = v7;
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v13 = (uint64_t **)v12;
        int v14 = *((_DWORD *)v12 + 8);
        if (v14 <= a4) {
          break;
        }
        unsigned long long v12 = *v13;
        uint64_t v7 = v13;
        if (!*v13) {
          goto LABEL_22;
        }
      }
      if (v14 >= a4) {
        break;
      }
      unsigned long long v12 = v13[1];
      if (!v12)
      {
        uint64_t v7 = v13 + 1;
        goto LABEL_22;
      }
    }
    *(_OWORD *)(v13 + 5) = v23;
    if (SHIBYTE(__p[2]) < 0) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_22:
    uint64_t v15 = (char *)operator new(0x38uLL);
    *((_DWORD *)v15 + 8) = a4;
    *((void *)v15 + 5) = 0;
    *((void *)v15 + 6) = 0;
    *(void *)uint64_t v15 = 0;
    *((void *)v15 + 1) = 0;
    *((void *)v15 + 2) = v13;
    *uint64_t v7 = (uint64_t *)v15;
    size_t v16 = (uint64_t *)**a1;
    uint64_t v17 = (uint64_t *)v15;
    if (v16)
    {
      *a1 = v16;
      uint64_t v17 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v17);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    *(_OWORD *)(v15 + 40) = v23;
    if (SHIBYTE(__p[2]) < 0) {
LABEL_25:
    }
      operator delete(__p[0]);
  }
  return a1;
}

void sub_26366C8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v24, *(void **)(v24 + 8));
  _Unwind_Resume(a1);
}

uint64_t Timestamp::get(uint64_t a1, void *a2, int a3)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v3 = a1 + 8;
  uint64_t v4 = v5;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v3;
  do
  {
    int v7 = *(_DWORD *)(v4 + 32);
    BOOL v8 = v7 < a3;
    if (v7 >= a3) {
      int v9 = (uint64_t *)v4;
    }
    else {
      int v9 = (uint64_t *)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v3 || *(_DWORD *)(v6 + 32) > a3) {
    return 0;
  }
  *(_OWORD *)a2 = *(_OWORD *)(v6 + 40);
  return 1;
}

uint64_t Timestamp::now(timeval *this, timeval *a2)
{
  return gettimeofday(this, 0);
}

uint64_t Timestamp::asString@<X0>(uint64_t a1@<X0>, int a2@<W1>, char a3@<W2>, unsigned char *a4@<X8>)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v62 = v6;
  long long v61 = v6;
  long long v60 = v6;
  long long v59 = v6;
  long long v58 = v6;
  long long v57 = v6;
  long long v56 = v6;
  long long v55 = v6;
  long long v54 = v6;
  unint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
  long long v51 = v6;
  long long __p = v6;
  long long v49 = v6;
  long long v48 = v6;
  long long v47 = v6;
  long long v46 = v6;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = MEMORY[0x263F8C328] + 104;
  uint64_t v53 = MEMORY[0x263F8C328] + 104;
  uint64_t v8 = MEMORY[0x263F8C328] + 64;
  uint64_t v45 = MEMORY[0x263F8C328] + 64;
  int v9 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v10 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v43 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(uint64_t *)((char *)&v43 + *(void *)(v43 - 24)) = v10;
  unint64_t v44 = 0;
  uint64_t v11 = (std::ios_base *)((char *)&v43 + *(void *)(v43 - 24));
  std::ios_base::init(v11, &v46);
  uint64_t v12 = MEMORY[0x263F8C328] + 24;
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  uint64_t v13 = v9[5];
  uint64_t v45 = v9[4];
  *(uint64_t *)((char *)&v45 + *(void *)(v45 - 24)) = v13;
  uint64_t v43 = v9[1];
  *(uint64_t *)((char *)&v43 + *(void *)(v43 - 24)) = v9[6];
  uint64_t v53 = v7;
  uint64_t v43 = v12;
  uint64_t v45 = v8;
  std::streambuf::basic_streambuf();
  uint64_t v14 = MEMORY[0x263F8C318] + 16;
  *(void *)&long long v46 = MEMORY[0x263F8C318] + 16;
  long long __p = 0u;
  long long v51 = 0u;
  LODWORD(v52) = 24;
  uint64_t v17 = *(void *)(a1 + 8);
  uint64_t v16 = a1 + 8;
  uint64_t v15 = v17;
  if (!v17) {
    goto LABEL_13;
  }
  uint64_t v18 = v16;
  do
  {
    int v19 = *(_DWORD *)(v15 + 32);
    BOOL v20 = v19 < a2;
    if (v19 >= a2) {
      uint64_t v21 = (uint64_t *)v15;
    }
    else {
      uint64_t v21 = (uint64_t *)(v15 + 8);
    }
    if (!v20) {
      uint64_t v18 = v15;
    }
    uint64_t v15 = *v21;
  }
  while (*v21);
  if (v18 == v16)
  {
LABEL_13:
    time_t v24 = 0;
    int v22 = a4;
    char v23 = a3;
    if ((a3 & 0x11) != 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
  int v22 = a4;
  char v23 = a3;
  if (*(_DWORD *)(v18 + 32) <= a2)
  {
    time_t v24 = *(void *)(v18 + 40);
    if ((a3 & 0x11) != 0) {
      goto LABEL_14;
    }
LABEL_22:
    std::ostream::operator<<();
    if ((v23 & 4) != 0 || (v23 & 8) != 0)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)".", 1);
      std::ostream::operator<<();
    }
    goto LABEL_25;
  }
  time_t v24 = 0;
  if ((a3 & 0x11) == 0) {
    goto LABEL_22;
  }
LABEL_14:
  v41.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  time_t v42 = v24;
  *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v41.tm_mon = v25;
  *(_OWORD *)&v41.tm_isdst = v25;
  *(_OWORD *)&v41.tm_sec = v25;
  localtime_r(&v42, &v41);
  long long v66 = 0u;
  long long v67 = 0u;
  *(_OWORD *)__s = 0u;
  long long v65 = 0u;
  if ((v23 & 0x10) != 0) {
    uint64_t v26 = "%Y.%m.%d_%H-%M-%S%z";
  }
  else {
    uint64_t v26 = "%Y-%m-%d-%H-%M-%S";
  }
  strftime(__s, 0x40uLL, v26, &v41);
  size_t v27 = strlen(__s);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)__s, v27);
  if ((v23 & 8) != 0)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)"-", 1);
    uint64_t v28 = v45;
    long long v29 = (char *)&v45 + *(void *)(v45 - 24);
    if (*((_DWORD *)v29 + 36) == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v45 + *(void *)(v45 - 24)));
      long long v30 = std::locale::use_facet(&v63, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 32);
      std::locale::~locale(&v63);
      uint64_t v28 = v45;
    }
    *((_DWORD *)v29 + 36) = 48;
    *(void *)((char *)&v47 + *(void *)(v28 - 24)) = 3;
    std::ostream::operator<<();
  }
LABEL_25:
  if ((v52 & 0x10) != 0)
  {
    uint64_t v32 = *((void *)&v51 + 1);
    if (*((void *)&v51 + 1) < (unint64_t)v49)
    {
      *((void *)&v51 + 1) = v49;
      uint64_t v32 = v49;
    }
    std::string::size_type v33 = (const void *)*((void *)&v48 + 1);
    size_t v31 = v32 - *((void *)&v48 + 1);
    if ((unint64_t)(v32 - *((void *)&v48 + 1)) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_42;
    }
  }
  else
  {
    if ((v52 & 8) == 0)
    {
      size_t v31 = 0;
      v22[23] = 0;
      goto LABEL_38;
    }
    std::string::size_type v33 = (const void *)v47;
    size_t v31 = v48 - v47;
    if ((void)v48 - (void)v47 >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_42:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v31 >= 0x17)
  {
    uint64_t v34 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17) {
      uint64_t v34 = v31 | 7;
    }
    uint64_t v35 = v34 + 1;
    uint64_t v36 = operator new(v34 + 1);
    *((void *)v22 + 1) = v31;
    *((void *)v22 + 2) = v35 | 0x8000000000000000;
    *(void *)int v22 = v36;
    int v22 = v36;
    goto LABEL_37;
  }
  v22[23] = v31;
  if (v31) {
LABEL_37:
  }
    memmove(v22, v33, v31);
LABEL_38:
  v22[v31] = 0;
  uint64_t v43 = *MEMORY[0x263F8C2B8];
  uint64_t v37 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(uint64_t *)((char *)&v43 + *(void *)(v43 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v45 = v37;
  *(void *)&long long v46 = v14;
  if (SBYTE7(v51) < 0) {
    operator delete((void *)__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E67440](&v53);
}

void sub_26366D0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_26366D0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::locale::~locale((std::locale *)(v13 - 184));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_26366D0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_26366D0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x263E67440](a1 + 128);
  return a1;
}

uint64_t *Timestamp::convert(uint64_t a1)
{
  memset(v11, 170, sizeof(v11));
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  Timestamp::Timestamp(v11, (char *)&__p, 9, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    uint64_t v1 = v11[1];
    if (!v11[1])
    {
LABEL_18:
      uint64_t v8 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v1 = v11[1];
    if (!v11[1]) {
      goto LABEL_18;
    }
  }
  uint64_t v2 = &v11[1];
  uint64_t v3 = v1;
  do
  {
    uint64_t v4 = (uint64_t **)v3;
    uint64_t v5 = v2;
    int v6 = *((_DWORD *)v3 + 8);
    if (v6 >= 0) {
      uint64_t v2 = (uint64_t **)v3;
    }
    else {
      ++v3;
    }
    uint64_t v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v2 == &v11[1]) {
    goto LABEL_18;
  }
  uint64_t v7 = v6 >= 0 ? v4 : v5;
  if (*((int *)v7 + 8) > 0) {
    goto LABEL_18;
  }
  if (v6 < 0) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = v4[5];
LABEL_19:
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)v11, v1);
  return v8;
}

void sub_26366D384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        int v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        uint64_t *v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    *uint64_t v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    uint64_t v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  uint64_t v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  void v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  uint64_t *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t *std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = result;
    int v6 = result + 1;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      int v8 = (uint64_t *)v5[1];
      int v9 = v6;
      if ((uint64_t *)*v5 == v6) {
        goto LABEL_10;
      }
      uint64_t v10 = v5[1];
      uint64_t v11 = v6;
      if (v8)
      {
        do
        {
          int v9 = (uint64_t *)v10;
          uint64_t v10 = *(void *)(v10 + 8);
        }
        while (v10);
      }
      else
      {
        do
        {
          int v9 = (uint64_t *)v11[2];
          BOOL v12 = *v9 == (void)v11;
          uint64_t v11 = v9;
        }
        while (v12);
      }
      if (*((_DWORD *)v9 + 8) < v7)
      {
LABEL_10:
        if (v8) {
          uint64_t v13 = (uint64_t **)v9;
        }
        else {
          uint64_t v13 = (uint64_t **)v6;
        }
        if (v8) {
          uint64_t v14 = (uint64_t **)(v9 + 1);
        }
        else {
          uint64_t v14 = (uint64_t **)v6;
        }
        if (*v14) {
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v14 = (uint64_t **)v6;
        uint64_t v13 = (uint64_t **)v6;
        if (v8)
        {
          while (1)
          {
            while (1)
            {
              uint64_t v13 = (uint64_t **)v8;
              int v15 = *((_DWORD *)v8 + 8);
              if (v15 <= v7) {
                break;
              }
              int v8 = *v13;
              uint64_t v14 = v13;
              if (!*v13) {
                goto LABEL_25;
              }
            }
            if (v15 >= v7) {
              goto LABEL_29;
            }
            int v8 = v13[1];
            if (!v8)
            {
              uint64_t v14 = v13 + 1;
              break;
            }
          }
        }
      }
LABEL_25:
      uint64_t v16 = operator new(0x38uLL);
      uint64_t v17 = v4[6];
      v16[2] = *((_OWORD *)v4 + 2);
      *((void *)v16 + 6) = v17;
      *(void *)uint64_t v16 = 0;
      *((void *)v16 + 1) = 0;
      *((void *)v16 + 2) = v13;
      *uint64_t v14 = (uint64_t *)v16;
      uint64_t v18 = *(void *)*v5;
      if (v18)
      {
        *uint64_t v5 = v18;
        int v19 = *v14;
      }
      else
      {
        int v19 = (uint64_t *)v16;
      }
      __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v5[1], v19);
      ++v5[2];
LABEL_29:
      BOOL v20 = (void *)v4[1];
      if (v20)
      {
        do
        {
          uint64_t v21 = v20;
          BOOL v20 = (void *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          uint64_t v21 = (void *)v4[2];
          BOOL v12 = *v21 == (void)v4;
          uint64_t v4 = v21;
        }
        while (!v12);
      }
      uint64_t v4 = v21;
    }
    while (v21 != a3);
  }
  return result;
}

uint64_t ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<ServerLogging>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy, &ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance, &dword_263655000);
  }
  return result;
}

uint64_t __cxx_global_var_init_10()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ServerLogging>::~PthreadMutexGuardPolicy, &ctu::Singleton<ServerLogging,ServerLogging,ctu::PthreadMutexGuardPolicy<ServerLogging>>::sInstance, &dword_263655000);
  }
  return result;
}

void util::strip_non_printable(std::string *this)
{
  uint64_t v1 = this;
  std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) == 0) {
    uint64_t v3 = this;
  }
  else {
    uint64_t v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  if ((size & 0x80u) != 0) {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
  }
  if (size)
  {
    uint64_t v4 = (std::string *)((char *)v3 + size);
    std::string::size_type v5 = size - 1;
    uint64_t v6 = MEMORY[0x263EF8318];
    while (1)
    {
      unsigned int v7 = v3->__r_.__value_.__s.__data_[0];
      if ((v7 & 0x80000000) != 0) {
        break;
      }
      int v8 = *(_DWORD *)(v6 + 4 * v7 + 60);
      if ((v8 & 0x40000) == 0 || (v8 & 0x4000) != 0) {
        goto LABEL_15;
      }
LABEL_8:
      uint64_t v3 = (std::string *)((char *)v3 + 1);
      --v5;
      if (v3 == v4) {
        goto LABEL_28;
      }
    }
    if (__maskrune(v3->__r_.__value_.__s.__data_[0], 0x40000uLL) && !__maskrune(v7, 0x4000uLL)) {
      goto LABEL_8;
    }
LABEL_15:
    if (v3 != v4 && (std::string *)((char *)&v3->__r_.__value_.__l.__data_ + 1) != v4)
    {
      uint64_t v9 = 1;
      uint64_t v4 = v3;
      while (1)
      {
        unsigned int v10 = v3->__r_.__value_.__s.__data_[v9];
        if ((v10 & 0x80000000) != 0)
        {
          if (!__maskrune(v3->__r_.__value_.__s.__data_[v9], 0x40000uLL) || __maskrune(v10, 0x4000uLL)) {
            goto LABEL_19;
          }
        }
        else
        {
          int v11 = *(_DWORD *)(v6 + 4 * v10 + 60);
          if ((v11 & 0x40000) == 0 || (v11 & 0x4000) != 0) {
            goto LABEL_19;
          }
        }
        v4->__r_.__value_.__s.__data_[0] = v3->__r_.__value_.__s.__data_[v9];
        uint64_t v4 = (std::string *)((char *)v4 + 1);
LABEL_19:
        ++v9;
        if (!--v5) {
          goto LABEL_28;
        }
      }
    }
  }
  uint64_t v4 = v3;
LABEL_28:
  std::string::size_type v12 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  int v13 = (char)v12;
  uint64_t v14 = (std::string *)v1->__r_.__value_.__r.__words[0];
  int v15 = (char *)(v1->__r_.__value_.__r.__words[0] + v1->__r_.__value_.__l.__size_);
  if ((v12 & 0x80u) != 0)
  {
    std::string::size_type v16 = v1->__r_.__value_.__r.__words[0];
  }
  else
  {
    int v15 = (char *)v1 + v12;
    std::string::size_type v16 = (std::string::size_type)v1;
  }
  if ((v12 & 0x80u) != 0) {
    std::string::size_type v12 = v1->__r_.__value_.__l.__size_;
  }
  std::string::size_type v17 = (std::string::size_type)v4 - v16;
  if (v12 < (unint64_t)v4 - v16) {
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  if (v15 - (char *)v4 == -1)
  {
    if (v13 < 0)
    {
      v1->__r_.__value_.__l.__size_ = v17;
      uint64_t v1 = v14;
    }
    else
    {
      *((unsigned char *)&v1->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
    v1->__r_.__value_.__s.__data_[v17] = 0;
  }
  else
  {
    std::string::__erase_external_with_move(v1, v17, v15 - (char *)v4);
  }
}

uint64_t util::convert_garbage(uint64_t result)
{
  int v1 = *(char *)(result + 23);
  if (v1 >= 0) {
    uint64_t v2 = (unsigned char *)result;
  }
  else {
    uint64_t v2 = *(unsigned char **)result;
  }
  if (v1 >= 0) {
    uint64_t v3 = *(unsigned __int8 *)(result + 23);
  }
  else {
    uint64_t v3 = *(void *)(result + 8);
  }
  if (v3)
  {
    uint64_t v4 = MEMORY[0x263EF8318];
    do
    {
      unsigned int v5 = (char)*v2;
      if ((v5 & 0x80000000) != 0)
      {
        uint64_t result = __maskrune((char)*v2, 0x40000uLL);
        if (result) {
          goto LABEL_10;
        }
        uint64_t result = __maskrune(v5, 0x4000uLL);
        if (result) {
          goto LABEL_10;
        }
      }
      else
      {
        int v6 = *(_DWORD *)(v4 + 4 * v5 + 60);
        if ((v6 & 0x40000) != 0) {
          goto LABEL_10;
        }
        uint64_t result = v6 & 0x4000;
        if ((v6 & 0x4000) != 0) {
          goto LABEL_10;
        }
      }
      *uint64_t v2 = 32;
LABEL_10:
      ++v2;
      --v3;
    }
    while (v3);
  }
  return result;
}

void util::strip_pattern(char *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  memset(a3, 170, sizeof(std::string));
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  int v5 = a1[23];
  int v6 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
  unsigned int v7 = (std::string *)a3->__r_.__value_.__r.__words[0];
  if (v6 >= 0) {
    int v8 = a3;
  }
  else {
    int v8 = (std::string *)a3->__r_.__value_.__r.__words[0];
  }
  if (v5 >= 0) {
    int64_t v9 = a1[23];
  }
  else {
    int64_t v9 = *((void *)a1 + 1);
  }
  std::string::size_type v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if (v5 >= 0) {
    int v11 = a1;
  }
  else {
    int v11 = *(char **)a1;
  }
  if (!v9)
  {
    std::string::size_type v13 = 0;
    goto LABEL_20;
  }
  if (v6 >= 0) {
    uint64_t size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  }
  else {
    uint64_t size = a3->__r_.__value_.__l.__size_;
  }
  if (size >= v9)
  {
    size_t v27 = (char *)v8 + size;
    int v28 = *v11;
    long long v29 = v8;
    do
    {
      uint64_t v30 = size - v9;
      if (v30 == -1) {
        break;
      }
      size_t v31 = (char *)memchr(v29, v28, v30 + 1);
      if (!v31) {
        break;
      }
      uint64_t v32 = v31;
      if (!memcmp(v31, v11, v9))
      {
        if (v32 != v27)
        {
          std::string::size_type v13 = v32 - (char *)v8;
          if (v32 - (char *)v8 != -1)
          {
            if (v9 == -1)
            {
              while (1)
              {
                std::string::size_type v33 = a3->__r_.__value_.__l.__size_;
                if ((v10 & 0x80u) == 0) {
                  std::string::size_type v33 = v10;
                }
                if (v33 < v13) {
                  break;
                }
                if ((char)v10 < 0)
                {
                  a3->__r_.__value_.__l.__size_ = v13;
                }
                else
                {
                  *((unsigned char *)&a3->__r_.__value_.__s + 23) = v13 & 0x7F;
                  unsigned int v7 = a3;
                }
                v7->__r_.__value_.__s.__data_[v13] = 0;
                int v34 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
                std::string::size_type v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                unsigned int v7 = (std::string *)a3->__r_.__value_.__r.__words[0];
                if (v34 >= 0) {
                  uint64_t v35 = a3;
                }
                else {
                  uint64_t v35 = (std::string *)a3->__r_.__value_.__r.__words[0];
                }
                int v36 = a1[23];
                if (v36 >= 0) {
                  uint64_t v37 = a1;
                }
                else {
                  uint64_t v37 = *(char **)a1;
                }
                if (v36 >= 0) {
                  int64_t v38 = a1[23];
                }
                else {
                  int64_t v38 = *((void *)a1 + 1);
                }
                if (v38)
                {
                  if (v34 >= 0) {
                    int64_t v39 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                  }
                  else {
                    int64_t v39 = a3->__r_.__value_.__l.__size_;
                  }
                  if (v39 < v38) {
                    return;
                  }
                  long long v40 = (char *)v35 + v39;
                  int v41 = *v37;
                  time_t v42 = v35;
                  while (1)
                  {
                    int64_t v43 = v39 - v38;
                    if (v43 == -1) {
                      return;
                    }
                    unint64_t v44 = (char *)memchr(v42, v41, v43 + 1);
                    if (!v44) {
                      return;
                    }
                    uint64_t v45 = v44;
                    if (!memcmp(v44, v37, v38)) {
                      break;
                    }
                    time_t v42 = (std::string *)(v45 + 1);
                    int64_t v39 = v40 - (v45 + 1);
                    if (v39 < v38) {
                      return;
                    }
                  }
                  if (v45 == v40) {
                    return;
                  }
                  std::string::size_type v13 = v45 - (char *)v35;
                  if (v45 - (char *)v35 == -1) {
                    return;
                  }
                }
                else
                {
                  std::string::size_type v13 = 0;
                }
              }
            }
            else
            {
LABEL_20:
              while (1)
              {
                std::string::size_type v14 = (v10 & 0x80u) == 0 ? v10 : a3->__r_.__value_.__l.__size_;
                if (v14 < v13) {
                  break;
                }
                std::string::__erase_external_with_move(a3, v13, v9);
                int v15 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
                std::string::size_type v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                if (v15 >= 0) {
                  std::string::size_type v16 = a3;
                }
                else {
                  std::string::size_type v16 = (std::string *)a3->__r_.__value_.__r.__words[0];
                }
                int v17 = a1[23];
                if (v17 >= 0) {
                  uint64_t v18 = a1;
                }
                else {
                  uint64_t v18 = *(char **)a1;
                }
                if (v17 >= 0) {
                  int64_t v19 = a1[23];
                }
                else {
                  int64_t v19 = *((void *)a1 + 1);
                }
                if (v19)
                {
                  if (v15 >= 0) {
                    int64_t v20 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                  }
                  else {
                    int64_t v20 = a3->__r_.__value_.__l.__size_;
                  }
                  if (v20 < v19) {
                    return;
                  }
                  uint64_t v21 = (char *)v16 + v20;
                  int v22 = *v18;
                  char v23 = v16;
                  while (1)
                  {
                    int64_t v24 = v20 - v19;
                    if (v24 == -1) {
                      return;
                    }
                    long long v25 = (char *)memchr(v23, v22, v24 + 1);
                    if (!v25) {
                      return;
                    }
                    uint64_t v26 = v25;
                    if (!memcmp(v25, v18, v19)) {
                      break;
                    }
                    char v23 = (std::string *)(v26 + 1);
                    int64_t v20 = v21 - (v26 + 1);
                    if (v20 < v19) {
                      return;
                    }
                  }
                  if (v26 == v21) {
                    return;
                  }
                  std::string::size_type v13 = v26 - (char *)v16;
                  if (v26 - (char *)v16 == -1) {
                    return;
                  }
                }
                else
                {
                  std::string::size_type v13 = 0;
                }
              }
            }
            std::string::__throw_out_of_range[abi:ne180100]();
          }
        }
        return;
      }
      long long v29 = (std::string *)(v32 + 1);
      uint64_t size = v27 - (v32 + 1);
    }
    while (size >= v9);
  }
}

void sub_26366DED4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *util::strip_leading_trailing@<X0>(void *result@<X0>, void **a2@<X1>, void *a3@<X8>)
{
  unint64_t v4 = *((unsigned __int8 *)result + 23);
  int v5 = (void *)*result;
  unint64_t v6 = result[1];
  if ((v4 & 0x80u) == 0) {
    unsigned int v7 = result;
  }
  else {
    unsigned int v7 = (void *)*result;
  }
  if ((v4 & 0x80u) == 0) {
    uint64_t v8 = *((unsigned __int8 *)result + 23);
  }
  else {
    uint64_t v8 = result[1];
  }
  int v9 = *((char *)a2 + 23);
  if (v9 >= 0) {
    std::string::size_type v10 = a2;
  }
  else {
    std::string::size_type v10 = *a2;
  }
  if (v9 >= 0) {
    size_t v11 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v11 = (size_t)a2[1];
  }
  if (!v8) {
    goto LABEL_26;
  }
  std::string::size_type v12 = result;
  unint64_t v13 = 0;
  if (!v11)
  {
    uint64_t v14 = v8 - 1;
    if ((v4 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t result = memchr(v10, *((char *)v7 + v13), v11);
    if (!result) {
      break;
    }
    if (v8 == ++v13) {
      goto LABEL_26;
    }
  }
  if (v13 == -1)
  {
LABEL_26:
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return result;
  }
  do
  {
    if (!v8)
    {
      uint64_t v14 = -1;
      if ((v4 & 0x80) == 0) {
        goto LABEL_28;
      }
LABEL_24:
      if (v6 >= v13)
      {
        unint64_t v4 = v6;
        std::string::size_type v12 = v5;
        goto LABEL_29;
      }
LABEL_41:
      std::string::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t result = memchr(v10, *((char *)v7 + --v8), v11);
  }
  while (result);
  uint64_t v14 = v8;
  if ((v4 & 0x80) != 0) {
    goto LABEL_24;
  }
LABEL_28:
  if (v13 > v4) {
    goto LABEL_41;
  }
LABEL_29:
  unint64_t v15 = v14 - v13 + 1;
  if (v4 - v13 >= v15) {
    size_t v16 = v15;
  }
  else {
    size_t v16 = v4 - v13;
  }
  if (v16 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    uint64_t v17 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v17 = v16 | 7;
    }
    uint64_t v18 = v17 + 1;
    int64_t v19 = operator new(v17 + 1);
    a3[1] = v16;
    a3[2] = v18 | 0x8000000000000000;
    *a3 = v19;
    a3 = v19;
    goto LABEL_39;
  }
  *((unsigned char *)a3 + 23) = v16;
  if (v16) {
LABEL_39:
  }
    uint64_t result = memmove(a3, (char *)v12 + v13, v16);
  *((unsigned char *)a3 + v16) = 0;
  return result;
}

uint64_t util::to_upper(uint64_t result)
{
  uint64_t v1 = *(unsigned __int8 *)(result + 23);
  int v2 = (char)v1;
  uint64_t v3 = (unsigned char *)(result + v1);
  if (v2 >= 0) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = (unsigned char *)(*(void *)result + *(void *)(result + 8));
  }
  if (v2 >= 0) {
    int v5 = (unsigned char *)result;
  }
  else {
    int v5 = *(unsigned char **)result;
  }
  for (; v5 != v4; ++v5)
  {
    uint64_t result = __toupper((char)*v5);
    *int v5 = result;
  }
  return result;
}

BOOL util::equal_nocase(const char *a1, const char *a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  return strcasecmp(a1, a2) == 0;
}

void util::strip_non_alpha(std::string *a1)
{
  std::string::size_type size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) == 0) {
    uint64_t v3 = (char *)a1;
  }
  else {
    uint64_t v3 = (char *)a1->__r_.__value_.__r.__words[0];
  }
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a1->__r_.__value_.__l.__size_;
  }
  if (!size) {
    goto LABEL_21;
  }
  unint64_t v4 = &v3[size];
  std::string::size_type v5 = size - 1;
  uint64_t v6 = MEMORY[0x263EF8318];
  while (1)
  {
    unsigned int v7 = *v3;
    if ((v7 & 0x80000000) != 0)
    {
      if (!__maskrune(v7, 0x100uLL)) {
        break;
      }
      goto LABEL_9;
    }
    if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x100) == 0) {
      break;
    }
LABEL_9:
    ++v3;
    --v5;
    if (v3 == v4) {
      goto LABEL_22;
    }
  }
  if (v3 != v4 && v3 + 1 != v4)
  {
    uint64_t v8 = 1;
    unint64_t v4 = v3;
    while (1)
    {
      unsigned int v9 = v3[v8];
      if ((v9 & 0x80000000) == 0) {
        break;
      }
      if (__maskrune(v9, 0x100uLL)) {
        goto LABEL_16;
      }
LABEL_17:
      ++v8;
      if (!--v5) {
        goto LABEL_22;
      }
    }
    if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x100) == 0) {
      goto LABEL_17;
    }
LABEL_16:
    *v4++ = v3[v8];
    goto LABEL_17;
  }
LABEL_21:
  unint64_t v4 = v3;
LABEL_22:
  unint64_t v10 = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  int v11 = (char)v10;
  std::string::size_type v12 = a1->__r_.__value_.__r.__words[0];
  unint64_t v13 = (char *)(a1->__r_.__value_.__r.__words[0] + a1->__r_.__value_.__l.__size_);
  if ((v10 & 0x80u) != 0)
  {
    uint64_t v14 = (std::string *)a1->__r_.__value_.__r.__words[0];
  }
  else
  {
    unint64_t v13 = (char *)a1 + v10;
    uint64_t v14 = a1;
  }
  if ((v10 & 0x80u) != 0) {
    unint64_t v10 = a1->__r_.__value_.__l.__size_;
  }
  std::string::size_type v15 = v4 - (char *)v14;
  if (v10 < v4 - (char *)v14) {
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  if (v13 - v4 == -1)
  {
    if (v11 < 0)
    {
      a1->__r_.__value_.__l.__size_ = v15;
      *(unsigned char *)(v12 + v15) = 0;
    }
    else
    {
      *((unsigned char *)&a1->__r_.__value_.__s + 23) = v15 & 0x7F;
      a1->__r_.__value_.__s.__data_[v15] = 0;
    }
  }
  else
  {
    std::string::__erase_external_with_move(a1, v15, v13 - v4);
  }
}

void util::readPlistToCFDictionary(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v2 = (const char *)a1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (*(char *)(a1 + 23) < 0) {
    int v2 = *(const char **)a1;
  }
  std::string::size_type v5 = (__CFError *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0x8000100u);
  error[3] = v5;
  uint64_t v6 = CFURLCreateWithFileSystemPath(v4, (CFStringRef)v5, kCFURLPOSIXPathStyle, 0);
  error[2] = v6;
  *a2 = 0;
  if (v6) {
    unsigned int v7 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = CFReadStreamCreateWithFile(v4, v6);
    unsigned int v9 = v8;
    error[1] = v8;
    if (v8) {
      unint64_t v10 = ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get;
    }
    else {
      unint64_t v10 = 0;
    }
    if (!v10) {
      goto LABEL_16;
    }
    CFReadStreamOpen(v8);
    error[0] = 0;
    CFPropertyListRef v11 = CFPropertyListCreateWithStream(v4, v9, 0, 1uLL, 0, error);
    *a2 = v11;
    CFReadStreamClose(v9);
    if (!error[0]) {
      goto LABEL_16;
    }
    CFErrorGetDomain(error[0]);
    memset(buf, 0, sizeof(buf));
    ctu::cf::assign();
    *(_OWORD *)std::string __p = *(_OWORD *)buf;
    uint64_t v16 = *(void *)&buf[16];
    std::string::size_type v12 = GetOsLogContext()[1];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      CFIndex Code = CFErrorGetCode(error[0]);
      uint64_t v14 = __p;
      if (v16 < 0) {
        uint64_t v14 = (void **)__p[0];
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = Code;
      *(_WORD *)&buf[22] = 2080;
      int64_t v19 = v14;
      _os_log_error_impl(&dword_263655000, v12, OS_LOG_TYPE_ERROR, "Failed to create %@ PropertyList: %ld: %s", buf, 0x20u);
    }
    CFRelease(error[0]);
    *a2 = 0;
    if (v11) {
      CFRelease(v11);
    }
    if ((SHIBYTE(v16) & 0x80000000) == 0)
    {
LABEL_16:
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    operator delete(__p[0]);
    if (v9) {
LABEL_17:
    }
      CFRelease(v9);
  }
LABEL_18:
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
}

void sub_26366E500(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get(uint64_t a1)
{
  return *(void *)a1;
}

const void **ctu::cf::CFSharedRef<__CFReadStream>::~CFSharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void util::moveDirContent(std::string::size_type a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5)
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  BOOL v131 = 0;
  BOOL v132 = 0;
  uint64_t v133 = 0;
  std::locale::locale(&v125, (const std::locale *)a5);
  long long v126 = *(_OWORD *)(a5 + 8);
  long long v127 = *(_OWORD *)(a5 + 24);
  uint64_t v8 = *(std::__shared_weak_count **)(a5 + 48);
  uint64_t v128 = *(void *)(a5 + 40);
  v129 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v130 = *(void *)(a5 + 56);
  int filtered_files = ctu::fs::get_filtered_files();
  unint64_t v10 = v129;
  if (!v129 || atomic_fetch_add(&v129->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    std::locale::~locale(&v125);
    if (filtered_files) {
      goto LABEL_6;
    }
LABEL_104:
    uint64_t v53 = GetOsLogContext()[1];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      std::string::size_type v109 = a1;
      if (*(char *)(a1 + 23) < 0) {
        std::string::size_type v109 = *(void *)a1;
      }
      LODWORD(v139.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v139.__r_.__value_.__r.__words + 4) = v109;
      _os_log_error_impl(&dword_263655000, v53, OS_LOG_TYPE_ERROR, "Failed to find a content in %s", (uint8_t *)&v139, 0xCu);
    }
    goto LABEL_105;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  std::locale::~locale(&v125);
  if (!filtered_files) {
    goto LABEL_104;
  }
LABEL_6:
  CFPropertyListRef v11 = v131;
  int v113 = (char *)v132;
  if (v131 != (char *)v132)
  {
    if (a4)
    {
      while (1)
      {
        memset(&v139, 170, sizeof(v139));
        if (v11[23] < 0)
        {
          std::string::__init_copy_ctor_external(&v139, *(const std::string::value_type **)v11, *((void *)v11 + 1));
        }
        else
        {
          long long v12 = *(_OWORD *)v11;
          v139.__r_.__value_.__r.__words[2] = *((void *)v11 + 2);
          *(_OWORD *)&v139.__r_.__value_.__l.__data_ = v12;
        }
        int v13 = *(char *)(a1 + 23);
        if (v13 >= 0) {
          size_t v14 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v14 = *(void *)(a1 + 8);
        }
        unint64_t v15 = v14 + 1;
        memset(&__p, 170, sizeof(__p));
        if (v14 + 1 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v15 >= 0x17) {
          break;
        }
        memset(&__p, 0, sizeof(__p));
        p_p = &__p;
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = v14 + 1;
        if (v14) {
          goto LABEL_24;
        }
LABEL_28:
        *(_WORD *)((char *)&p_p->__r_.__value_.__l.__data_ + v14) = 47;
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v20 = &v139;
        }
        else {
          uint64_t v20 = (std::string *)v139.__r_.__value_.__r.__words[0];
        }
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v139.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v139.__r_.__value_.__l.__size_;
        }
        int v22 = std::string::append(&__p, (const std::string::value_type *)v20, size);
        long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
        v124.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v124.__r_.__value_.__l.__data_ = v23;
        v22->__r_.__value_.__l.__size_ = 0;
        v22->__r_.__value_.__r.__words[2] = 0;
        v22->__r_.__value_.__r.__words[0] = 0;
        int is_directory = ctu::fs::is_directory();
        if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v124.__r_.__value_.__l.__data_);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_45;
          }
LABEL_36:
          if (is_directory) {
            goto LABEL_37;
          }
LABEL_46:
          long long v29 = GetOsLogContext()[1];
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_83;
          }
          int v30 = *(char *)(a1 + 23);
          if (v30 >= 0) {
            size_t v31 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v31 = *(void *)(a1 + 8);
          }
          unint64_t v32 = v31 + 1;
          memset(&__p, 170, sizeof(__p));
          if (v31 + 1 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v32 >= 0x17)
          {
            int v110 = v30;
            uint64_t v45 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v32 | 7) != 0x17) {
              uint64_t v45 = v32 | 7;
            }
            uint64_t v46 = v45 + 1;
            std::string::size_type v33 = (std::string *)operator new(v45 + 1);
            __p.__r_.__value_.__l.__size_ = v31 + 1;
            __p.__r_.__value_.__r.__words[2] = v46 | 0x8000000000000000;
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
            int v30 = v110;
          }
          else
          {
            memset(&__p, 0, sizeof(__p));
            std::string::size_type v33 = &__p;
            *((unsigned char *)&__p.__r_.__value_.__s + 23) = v31 + 1;
            if (!v31) {
              goto LABEL_93;
            }
          }
          if (v30 >= 0) {
            long long v47 = (const void *)a1;
          }
          else {
            long long v47 = *(const void **)a1;
          }
          memmove(v33, v47, v31);
LABEL_93:
          *(_WORD *)((char *)&v33->__r_.__value_.__l.__data_ + v31) = 47;
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            long long v48 = &v139;
          }
          else {
            long long v48 = (std::string *)v139.__r_.__value_.__r.__words[0];
          }
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v49 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v49 = v139.__r_.__value_.__l.__size_;
          }
          unint64_t v50 = std::string::append(&__p, (const std::string::value_type *)v48, v49);
          long long v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
          v124.__r_.__value_.__r.__words[2] = v50->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v124.__r_.__value_.__l.__data_ = v51;
          v50->__r_.__value_.__l.__size_ = 0;
          v50->__r_.__value_.__r.__words[2] = 0;
          v50->__r_.__value_.__r.__words[0] = 0;
          unint64_t v52 = &v124;
          if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            unint64_t v52 = (std::string *)v124.__r_.__value_.__r.__words[0];
          }
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v52;
          WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = a4;
          _os_log_error_impl(&dword_263655000, v29, OS_LOG_TYPE_ERROR, "%s is not a directory. So, skip to move it with the depth (%d)", (uint8_t *)&buf, 0x12u);
          if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_82;
          }
LABEL_77:
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_83;
          }
LABEL_9:
          operator delete(__p.__r_.__value_.__l.__data_);
          if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_84;
          }
LABEL_10:
          v11 += 24;
          if (v11 == v113) {
            goto LABEL_105;
          }
        }
        else
        {
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_36;
          }
LABEL_45:
          operator delete(__p.__r_.__value_.__l.__data_);
          if (!is_directory) {
            goto LABEL_46;
          }
LABEL_37:
          int v25 = *(char *)(a1 + 23);
          if (v25 >= 0) {
            size_t v26 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v26 = *(void *)(a1 + 8);
          }
          unint64_t v27 = v26 + 1;
          memset(&__p, 170, sizeof(__p));
          if (v26 + 1 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v27 >= 0x17)
          {
            uint64_t v34 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v27 | 7) != 0x17) {
              uint64_t v34 = v27 | 7;
            }
            uint64_t v35 = v34 + 1;
            int v28 = (std::string *)operator new(v34 + 1);
            __p.__r_.__value_.__l.__size_ = v26 + 1;
            __p.__r_.__value_.__r.__words[2] = v35 | 0x8000000000000000;
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v28;
          }
          else
          {
            memset(&__p, 0, sizeof(__p));
            int v28 = &__p;
            *((unsigned char *)&__p.__r_.__value_.__s + 23) = v26 + 1;
            if (!v26) {
              goto LABEL_61;
            }
          }
          if (v25 >= 0) {
            int v36 = (const void *)a1;
          }
          else {
            int v36 = *(const void **)a1;
          }
          memmove(v28, v36, v26);
LABEL_61:
          *(_WORD *)((char *)&v28->__r_.__value_.__l.__data_ + v26) = 47;
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v37 = &v139;
          }
          else {
            uint64_t v37 = (std::string *)v139.__r_.__value_.__r.__words[0];
          }
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v38 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v38 = v139.__r_.__value_.__l.__size_;
          }
          int64_t v39 = std::string::append(&__p, (const std::string::value_type *)v37, v38);
          long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
          v124.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v124.__r_.__value_.__l.__data_ = v40;
          v39->__r_.__value_.__l.__size_ = 0;
          v39->__r_.__value_.__r.__words[2] = 0;
          v39->__r_.__value_.__r.__words[0] = 0;
          int v41 = std::string::append(&v124, "/", 1uLL);
          long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
          std::string::size_type v122 = v41->__r_.__value_.__r.__words[2];
          *(_OWORD *)uint64_t v121 = v42;
          v41->__r_.__value_.__l.__size_ = 0;
          v41->__r_.__value_.__r.__words[2] = 0;
          v41->__r_.__value_.__r.__words[0] = 0;
          if (*(char *)(a2 + 23) < 0) {
            std::string::__init_copy_ctor_external(&v120, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
          }
          else {
            std::string v120 = *(std::string *)a2;
          }
          std::locale::locale(&v114, (const std::locale *)a5);
          long long v115 = *(_OWORD *)(a5 + 8);
          long long v116 = *(_OWORD *)(a5 + 24);
          int64_t v43 = *(std::__shared_weak_count **)(a5 + 48);
          uint64_t v117 = *(void *)(a5 + 40);
          int v118 = v43;
          if (v43) {
            atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v119 = *(void *)(a5 + 56);
          util::moveDirContent(v121, &v120, a3, (a4 - 1), &v114);
          unint64_t v44 = v118;
          if (v118 && !atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
            std::__shared_weak_count::__release_weak(v44);
            std::locale::~locale(&v114);
            if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_75:
              if ((SHIBYTE(v122) & 0x80000000) == 0) {
                goto LABEL_76;
              }
LABEL_81:
              operator delete(v121[0]);
              if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
                goto LABEL_82;
              }
              goto LABEL_77;
            }
          }
          else
          {
            std::locale::~locale(&v114);
            if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_75;
            }
          }
          operator delete(v120.__r_.__value_.__l.__data_);
          if (SHIBYTE(v122) < 0) {
            goto LABEL_81;
          }
LABEL_76:
          if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_77;
          }
LABEL_82:
          operator delete(v124.__r_.__value_.__l.__data_);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_9;
          }
LABEL_83:
          if ((SHIBYTE(v139.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_10;
          }
LABEL_84:
          operator delete(v139.__r_.__value_.__l.__data_);
          v11 += 24;
          if (v11 == v113) {
            goto LABEL_105;
          }
        }
      }
      uint64_t v17 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v15 | 7) != 0x17) {
        uint64_t v17 = v15 | 7;
      }
      uint64_t v18 = v17 + 1;
      p_p = (std::string *)operator new(v17 + 1);
      __p.__r_.__value_.__l.__size_ = v14 + 1;
      __p.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
LABEL_24:
      if (v13 >= 0) {
        int64_t v19 = (const void *)a1;
      }
      else {
        int64_t v19 = *(const void **)a1;
      }
      memmove(p_p, v19, v14);
      goto LABEL_28;
    }
    while (1)
    {
      memset(&v139, 170, sizeof(v139));
      if (v11[23] < 0)
      {
        std::string::__init_copy_ctor_external(&v139, *(const std::string::value_type **)v11, *((void *)v11 + 1));
      }
      else
      {
        long long v57 = *(_OWORD *)v11;
        v139.__r_.__value_.__r.__words[2] = *((void *)v11 + 2);
        *(_OWORD *)&v139.__r_.__value_.__l.__data_ = v57;
      }
      memset(&v124, 170, sizeof(v124));
      int v58 = *(char *)(a2 + 23);
      if (v58 >= 0) {
        size_t v59 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        size_t v59 = *(void *)(a2 + 8);
      }
      unint64_t v60 = v59 + 1;
      memset(&buf, 170, sizeof(buf));
      if (v59 + 1 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v60 >= 0x17)
      {
        uint64_t v62 = (v60 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v60 | 7) != 0x17) {
          uint64_t v62 = v60 | 7;
        }
        uint64_t v63 = v62 + 1;
        p_std::string buf = (std::string *)operator new(v62 + 1);
        buf.__r_.__value_.__l.__size_ = v59 + 1;
        buf.__r_.__value_.__r.__words[2] = v63 | 0x8000000000000000;
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)p_buf;
      }
      else
      {
        memset(&buf, 0, sizeof(buf));
        p_std::string buf = &buf;
        *((unsigned char *)&buf.__r_.__value_.__s + 23) = v59 + 1;
        if (!v59) {
          goto LABEL_136;
        }
      }
      if (v58 >= 0) {
        float64x2x2_t v64 = (const void *)a2;
      }
      else {
        float64x2x2_t v64 = *(const void **)a2;
      }
      memmove(p_buf, v64, v59);
LABEL_136:
      *(_WORD *)((char *)&p_buf->__r_.__value_.__l.__data_ + v59) = 47;
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v65 = &v139;
      }
      else {
        long long v65 = (std::string *)v139.__r_.__value_.__r.__words[0];
      }
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v66 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v66 = v139.__r_.__value_.__l.__size_;
      }
      long long v67 = std::string::append(&buf, (const std::string::value_type *)v65, v66);
      long long v68 = *(_OWORD *)&v67->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v67->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v68;
      v67->__r_.__value_.__l.__size_ = 0;
      v67->__r_.__value_.__r.__words[2] = 0;
      v67->__r_.__value_.__r.__words[0] = 0;
      ctu::fs::get_unique_filename();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_144;
        }
      }
      else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_144;
      }
      operator delete(buf.__r_.__value_.__l.__data_);
LABEL_144:
      int v69 = *(char *)(a1 + 23);
      if (v69 >= 0) {
        size_t v70 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        size_t v70 = *(void *)(a1 + 8);
      }
      unint64_t v71 = v70 + 1;
      memset(&buf, 170, sizeof(buf));
      if (v70 + 1 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v71 >= 0x17)
      {
        uint64_t v73 = (v71 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v71 | 7) != 0x17) {
          uint64_t v73 = v71 | 7;
        }
        uint64_t v74 = v73 + 1;
        uint64_t v72 = (std::string *)operator new(v73 + 1);
        buf.__r_.__value_.__l.__size_ = v70 + 1;
        buf.__r_.__value_.__r.__words[2] = v74 | 0x8000000000000000;
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v72;
LABEL_154:
        if (v69 >= 0) {
          uint64_t v75 = (const void *)a1;
        }
        else {
          uint64_t v75 = *(const void **)a1;
        }
        memmove(v72, v75, v70);
        goto LABEL_158;
      }
      memset(&buf, 0, sizeof(buf));
      uint64_t v72 = &buf;
      *((unsigned char *)&buf.__r_.__value_.__s + 23) = v70 + 1;
      if (v70) {
        goto LABEL_154;
      }
LABEL_158:
      *(_WORD *)((char *)&v72->__r_.__value_.__l.__data_ + v70) = 47;
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v76 = &v139;
      }
      else {
        uint64_t v76 = (std::string *)v139.__r_.__value_.__r.__words[0];
      }
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v77 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v77 = v139.__r_.__value_.__l.__size_;
      }
      uint64_t v78 = std::string::append(&buf, (const std::string::value_type *)v76, v77);
      long long v79 = *(_OWORD *)&v78->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v78->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v79;
      v78->__r_.__value_.__l.__size_ = 0;
      v78->__r_.__value_.__r.__words[2] = 0;
      v78->__r_.__value_.__r.__words[0] = 0;
      char v80 = ctu::fs::rename();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_178;
        }
LABEL_166:
        if (v80) {
          goto LABEL_167;
        }
LABEL_179:
        uint64_t v86 = GetOsLogContext()[1];
        if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
          goto LABEL_206;
        }
        int v87 = *(char *)(a1 + 23);
        if (v87 >= 0) {
          size_t v88 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v88 = *(void *)(a1 + 8);
        }
        unint64_t v89 = v88 + 1;
        memset(&buf, 170, sizeof(buf));
        if (v88 + 1 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v89 >= 0x17)
        {
          uint64_t v100 = (v89 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v89 | 7) != 0x17) {
            uint64_t v100 = v89 | 7;
          }
          uint64_t v101 = v100 + 1;
          int v90 = (std::string *)operator new(v100 + 1);
          buf.__r_.__value_.__l.__size_ = v88 + 1;
          buf.__r_.__value_.__r.__words[2] = v101 | 0x8000000000000000;
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v90;
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          int v90 = &buf;
          *((unsigned char *)&buf.__r_.__value_.__s + 23) = v88 + 1;
          if (!v88) {
            goto LABEL_217;
          }
        }
        if (v87 >= 0) {
          uint64_t v102 = (const void *)a1;
        }
        else {
          uint64_t v102 = *(const void **)a1;
        }
        memmove(v90, v102, v88);
LABEL_217:
        *(_WORD *)((char *)&v90->__r_.__value_.__l.__data_ + v88) = 47;
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v103 = &v139;
        }
        else {
          uint64_t v103 = (std::string *)v139.__r_.__value_.__r.__words[0];
        }
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v104 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v104 = v139.__r_.__value_.__l.__size_;
        }
        uint64_t v105 = std::string::append(&buf, (const std::string::value_type *)v103, v104);
        long long v106 = *(_OWORD *)&v105->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v105->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v106;
        v105->__r_.__value_.__l.__size_ = 0;
        v105->__r_.__value_.__r.__words[2] = 0;
        v105->__r_.__value_.__r.__words[0] = 0;
        int v107 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          int v107 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        std::vector<std::string>::pointer v108 = &v124;
        if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::vector<std::string>::pointer v108 = (std::string *)v124.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)uint64_t v134 = 136315394;
        int v135 = v107;
        __int16 v136 = 2080;
        v137 = v108;
        _os_log_error_impl(&dword_263655000, v86, OS_LOG_TYPE_ERROR, "Failed to move %s -> %s", v134, 0x16u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_228;
        }
LABEL_205:
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_206;
        }
LABEL_229:
        operator delete(buf.__r_.__value_.__l.__data_);
        if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_117;
        }
LABEL_207:
        if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_208;
        }
LABEL_118:
        v11 += 24;
        if (v11 == v113) {
          break;
        }
      }
      else
      {
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_166;
        }
LABEL_178:
        operator delete(buf.__r_.__value_.__l.__data_);
        if ((v80 & 1) == 0) {
          goto LABEL_179;
        }
LABEL_167:
        long long v81 = GetOsLogContext()[1];
        if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_206;
        }
        int v82 = *(char *)(a1 + 23);
        if (v82 >= 0) {
          size_t v83 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v83 = *(void *)(a1 + 8);
        }
        unint64_t v84 = v83 + 1;
        memset(&buf, 170, sizeof(buf));
        if (v83 + 1 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v84 >= 0x17)
        {
          uint64_t v91 = (v84 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v84 | 7) != 0x17) {
            uint64_t v91 = v84 | 7;
          }
          uint64_t v92 = v91 + 1;
          uint64_t v85 = (std::string *)operator new(v91 + 1);
          buf.__r_.__value_.__l.__size_ = v83 + 1;
          buf.__r_.__value_.__r.__words[2] = v92 | 0x8000000000000000;
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v85;
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          uint64_t v85 = &buf;
          *((unsigned char *)&buf.__r_.__value_.__s + 23) = v83 + 1;
          if (!v83) {
            goto LABEL_194;
          }
        }
        if (v82 >= 0) {
          uint64_t v93 = (const void *)a1;
        }
        else {
          uint64_t v93 = *(const void **)a1;
        }
        memmove(v85, v93, v83);
LABEL_194:
        *(_WORD *)((char *)&v85->__r_.__value_.__l.__data_ + v83) = 47;
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v94 = &v139;
        }
        else {
          uint64_t v94 = (std::string *)v139.__r_.__value_.__r.__words[0];
        }
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v95 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v95 = v139.__r_.__value_.__l.__size_;
        }
        uint64_t v96 = std::string::append(&buf, (const std::string::value_type *)v94, v95);
        long long v97 = *(_OWORD *)&v96->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v96->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v97;
        v96->__r_.__value_.__l.__size_ = 0;
        v96->__r_.__value_.__r.__words[2] = 0;
        v96->__r_.__value_.__r.__words[0] = 0;
        v98 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          v98 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        long long v99 = &v124;
        if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          long long v99 = (std::string *)v124.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)uint64_t v134 = 136315394;
        int v135 = v98;
        __int16 v136 = 2080;
        v137 = v99;
        _os_log_impl(&dword_263655000, v81, OS_LOG_TYPE_DEFAULT, "Moved %s -> %s", v134, 0x16u);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_205;
        }
LABEL_228:
        operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_229;
        }
LABEL_206:
        if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_207;
        }
LABEL_117:
        operator delete(v124.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v139.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_118;
        }
LABEL_208:
        operator delete(v139.__r_.__value_.__l.__data_);
        v11 += 24;
        if (v11 == v113) {
          break;
        }
      }
    }
  }
LABEL_105:
  if (a3) {
    ctu::fs::remove_dir();
  }
  long long v54 = (void **)v131;
  if (v131)
  {
    long long v55 = v132;
    long long v56 = v131;
    if (v132 != (void **)v131)
    {
      do
      {
        if (*((char *)v55 - 1) < 0) {
          operator delete(*(v55 - 3));
        }
        v55 -= 3;
      }
      while (v55 != v54);
      long long v56 = v131;
    }
    BOOL v132 = v54;
    operator delete(v56);
  }
}

void sub_26366F4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::locale a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,void *__p,uint64_t a53,int a54,__int16 a55,char a56,char a57,std::locale a58)
{
  if (a57 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v58 - 105) < 0) {
    operator delete(*(void **)(v58 - 128));
  }
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v58 - 216));
  _Unwind_Resume(a1);
}

void util::generateSHA256(const char *a1@<X0>, void *a2@<X1>, unsigned int a3@<W2>, unsigned __int8 **a4@<X8>)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  uint64_t v8 = (unsigned __int8 *)operator new(0x20uLL);
  a4[1] = v8 + 32;
  a4[2] = v8 + 32;
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *a4 = v8;
  if (!a2)
  {
    size_t v14 = GetOsLogContext()[1];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(c.count[0]) = 0;
    unint64_t v15 = "dataIn Buffer is NULL";
    p_CC_SHA256_CTX c = (uint8_t *)&c;
    uint64_t v17 = v14;
    uint32_t v18 = 2;
    goto LABEL_16;
  }
  *(void *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v9;
  *(_OWORD *)&c.wbuf[10] = v9;
  *(_OWORD *)&c.hash[6] = v9;
  *(_OWORD *)&c.wbuf[2] = v9;
  *(_OWORD *)c.count = v9;
  *(_OWORD *)&c.hash[2] = v9;
  if (!ctu::fs::get_file_size()) {
    return;
  }
  CC_SHA256_Init(&c);
  unint64_t v10 = a1;
  if (a1[23] < 0) {
    unint64_t v10 = *(const char **)a1;
  }
  int v11 = open(v10, 0);
  if (v11 < 1)
  {
    int64_t v19 = GetOsLogContext()[1];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      return;
    }
    if (a1[23] < 0) {
      a1 = *(const char **)a1;
    }
    uint64_t v20 = __error();
    uint64_t v21 = strerror(*v20);
    int v22 = *__error();
    int v23 = *__error();
    *(_DWORD *)std::string buf = 136315906;
    size_t v31 = a1;
    __int16 v32 = 2080;
    std::string::size_type v33 = v21;
    __int16 v34 = 1024;
    int v35 = v22;
    __int16 v36 = 1024;
    int v37 = v23;
    unint64_t v15 = "Failed to open: %s : %s (%d, 0x%x)";
    p_CC_SHA256_CTX c = buf;
    uint64_t v17 = v19;
    uint32_t v18 = 34;
LABEL_16:
    _os_log_error_impl(&dword_263655000, v17, OS_LOG_TYPE_ERROR, v15, p_c, v18);
    return;
  }
  unint64_t v12 = 0;
  while (1)
  {
    ssize_t v13 = read(v11, a2, a3);
    if (v13 == -1) {
      break;
    }
    CC_SHA256_Update(&c, a2, v13);
    v12 += v13;
    if (v12 >= 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_18;
    }
  }
  int64_t v24 = GetOsLogContext()[1];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    if (a1[23] < 0) {
      a1 = *(const char **)a1;
    }
    int v25 = __error();
    size_t v26 = strerror(*v25);
    int v27 = *__error();
    int v28 = *__error();
    *(_DWORD *)std::string buf = 136315906;
    size_t v31 = a1;
    __int16 v32 = 2080;
    std::string::size_type v33 = v26;
    __int16 v34 = 1024;
    int v35 = v27;
    __int16 v36 = 1024;
    int v37 = v28;
    _os_log_error_impl(&dword_263655000, v24, OS_LOG_TYPE_ERROR, "Failed to read: %s : %s (%d,0x%x)", buf, 0x22u);
  }
LABEL_18:
  CC_SHA256_Final(v8, &c);
  close(v11);
}

void sub_26366F980(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_26366F998(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_26366F9B0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_26366F9C8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_26366F9E0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_26366F9F8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_26366FA10(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_26366FA28(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

BOOL util::markPurgeableFile(uint64_t *a1)
{
  uint64_t v1 = a1;
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v15 = 65541;
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    int v2 = open((const char *)a1, 0);
    if ((v2 & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v12 = GetOsLogContext()[1];
    BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    if (*((char *)v1 + 23) < 0) {
      uint64_t v1 = (uint64_t *)*v1;
    }
    ssize_t v13 = __error();
    size_t v14 = strerror(*v13);
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v17 = v1;
    __int16 v18 = 2080;
    *(void *)int64_t v19 = v14;
    long long v9 = "Failed to open %s : %s";
    unint64_t v10 = v12;
    uint32_t v11 = 22;
    goto LABEL_13;
  }
  int v2 = open((const char *)*a1, 0);
  if (v2 < 0) {
    goto LABEL_9;
  }
LABEL_3:
  int v3 = v2;
  int v4 = ffsctl(v2, 0xC0084A44uLL, &v15, 0);
  close(v3);
  if (v4)
  {
    std::string::size_type v5 = GetOsLogContext()[1];
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    if (*((char *)v1 + 23) < 0) {
      uint64_t v1 = (uint64_t *)*v1;
    }
    unsigned int v7 = __error();
    uint64_t v8 = strerror(*v7);
    *(_DWORD *)std::string buf = 136315906;
    uint64_t v17 = v1;
    __int16 v18 = 1024;
    *(_DWORD *)int64_t v19 = v4;
    *(_WORD *)&v19[4] = 2080;
    *(void *)&v19[6] = v8;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    long long v9 = "Failed to mark %s as purgeable %d (%s) (flags 0x%llx)";
    unint64_t v10 = v5;
    uint32_t v11 = 38;
LABEL_13:
    _os_log_error_impl(&dword_263655000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0;
  }
  return 1;
}

BOOL util::checkLogFileAge(uint64_t a1, int64_t a2, uint64_t a3)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v95 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v97 = 0xAAAAAAAAAAAAAA00;
  long long v99 = v4;
  uint64_t v96 = 0;
  long long v98 = 0uLL;
  LOBYTE(v99) = 0;
  BYTE8(v99) = 0;
  uint64_t v100 = 0;
  memset(v94, 0, sizeof(v94));
  uint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) == 0) {
    uint64_t v6 = (std::sub_match<const char *> *)a1;
  }
  else {
    uint64_t v6 = *(std::sub_match<const char *> **)a1;
  }
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  unsigned int v7 = (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v6 + v5);
  unint64_t v103 = 0xAAAAAAAAAAAAAA00;
  __p.tm_gmtoff = 0xAAAAAAAAAAAAAAAALL;
  long long v106 = v4;
  __p.tm_zone = 0;
  uint64_t v102 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  LOBYTE(v106) = 0;
  BYTE8(v106) = 0;
  uint64_t v107 = 0;
  memset(&__p, 0, 41);
  int v8 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a3, v6, (std::sub_match<const char *> *)((char *)v6 + v5), (std::vector<std::csub_match> *)&__p, 4160);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)v94, (uint64_t)v6, v7, (uint64_t *)&__p.tm_sec, 0);
  if (*(void *)&__p.tm_sec)
  {
    *(void *)&__p.tm_hour = *(void *)&__p.tm_sec;
    operator delete(*(void **)&__p.tm_sec);
  }
  if ((_BYTE)v99) {
    int v9 = 0;
  }
  else {
    int v9 = v8;
  }
  if (v9 != 1)
  {
    BOOL v21 = 0;
    uint64_t v22 = *(void **)v94;
    if (!*(void *)v94) {
      return v21;
    }
LABEL_23:
    *(void *)&v94[8] = v22;
    operator delete(v22);
    return v21;
  }
  memset(&__p, 0, sizeof(__p));
  uint64_t v10 = *(void *)v94;
  if (!*(unsigned char *)(*(void *)v94 + 40))
  {
    memset(&v93, 0, sizeof(v93));
    goto LABEL_33;
  }
  uint64_t v12 = *(void *)(*(void *)v94 + 24);
  uint32_t v11 = *(char **)(*(void *)v94 + 32);
  unint64_t v13 = (unint64_t)&v11[-v12];
  if ((unint64_t)&v11[-v12] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v13 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v11 - v12;
    size_t v14 = &v93;
    if ((char *)v12 != v11) {
      goto LABEL_16;
    }
LABEL_29:
    *size_t v14 = 0;
    goto LABEL_33;
  }
  uint64_t v24 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v13 | 7) != 0x17) {
    uint64_t v24 = v13 | 7;
  }
  uint64_t v25 = v24 + 1;
  size_t v14 = operator new(v24 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v11[-v12];
  v93.__r_.__value_.__r.__words[2] = v25 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v14;
  if ((char *)v12 == v11) {
    goto LABEL_29;
  }
LABEL_16:
  if (v13 < 0x20 || (unint64_t)&v14[-v12] < 0x20)
  {
    uint64_t v15 = v14;
    uint64_t v16 = (char *)v12;
  }
  else
  {
    uint64_t v15 = &v14[v13 & 0xFFFFFFFFFFFFFFE0];
    uint64_t v16 = (char *)(v12 + (v13 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v17 = (long long *)(v12 + 16);
    __int16 v18 = v14 + 16;
    unint64_t v19 = v13 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v20 = *v17;
      *(v18 - 1) = *(v17 - 1);
      *__int16 v18 = v20;
      v17 += 2;
      v18 += 2;
      v19 -= 32;
    }
    while (v19);
    if (v13 == (v13 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_32;
    }
  }
  do
  {
    char v26 = *v16++;
    *v15++ = v26;
  }
  while (v16 != v11);
LABEL_32:
  *uint64_t v15 = 0;
LABEL_33:
  util::convert<int>(&v93, &__p.tm_year);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    __p.tm_year -= 1900;
    if (*(unsigned char *)(v10 + 64)) {
      goto LABEL_35;
    }
LABEL_45:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_53;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  __p.tm_year -= 1900;
  if (!*(unsigned char *)(v10 + 64)) {
    goto LABEL_45;
  }
LABEL_35:
  uint64_t v28 = *(void *)(v10 + 48);
  int v27 = *(char **)(v10 + 56);
  unint64_t v29 = (unint64_t)&v27[-v28];
  if ((unint64_t)&v27[-v28] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v29 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v27 - v28;
    int v30 = &v93;
    if ((char *)v28 != v27) {
      goto LABEL_38;
    }
LABEL_49:
    *int v30 = 0;
    goto LABEL_53;
  }
  uint64_t v37 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v29 | 7) != 0x17) {
    uint64_t v37 = v29 | 7;
  }
  uint64_t v38 = v37 + 1;
  int v30 = operator new(v37 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v27[-v28];
  v93.__r_.__value_.__r.__words[2] = v38 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  if ((char *)v28 == v27) {
    goto LABEL_49;
  }
LABEL_38:
  if (v29 < 0x20 || (unint64_t)&v30[-v28] < 0x20)
  {
    size_t v31 = v30;
    __int16 v32 = (char *)v28;
  }
  else
  {
    size_t v31 = &v30[v29 & 0xFFFFFFFFFFFFFFE0];
    __int16 v32 = (char *)(v28 + (v29 & 0xFFFFFFFFFFFFFFE0));
    std::string::size_type v33 = (long long *)(v28 + 16);
    __int16 v34 = v30 + 16;
    unint64_t v35 = v29 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v36 = *v33;
      *(v34 - 1) = *(v33 - 1);
      _OWORD *v34 = v36;
      v33 += 2;
      v34 += 2;
      v35 -= 32;
    }
    while (v35);
    if (v29 == (v29 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_52;
    }
  }
  do
  {
    char v39 = *v32++;
    *v31++ = v39;
  }
  while (v32 != v27);
LABEL_52:
  *size_t v31 = 0;
LABEL_53:
  util::convert<int>(&v93, &__p.tm_mon);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    --__p.tm_mon;
    if (*(unsigned char *)(v10 + 88)) {
      goto LABEL_55;
    }
LABEL_65:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_73;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  --__p.tm_mon;
  if (!*(unsigned char *)(v10 + 88)) {
    goto LABEL_65;
  }
LABEL_55:
  uint64_t v41 = *(void *)(v10 + 72);
  long long v40 = *(char **)(v10 + 80);
  unint64_t v42 = (unint64_t)&v40[-v41];
  if ((unint64_t)&v40[-v41] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v42 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v40 - v41;
    int64_t v43 = &v93;
    if ((char *)v41 != v40) {
      goto LABEL_58;
    }
LABEL_69:
    *int64_t v43 = 0;
    goto LABEL_73;
  }
  uint64_t v50 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v42 | 7) != 0x17) {
    uint64_t v50 = v42 | 7;
  }
  uint64_t v51 = v50 + 1;
  int64_t v43 = operator new(v50 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v40[-v41];
  v93.__r_.__value_.__r.__words[2] = v51 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
  if ((char *)v41 == v40) {
    goto LABEL_69;
  }
LABEL_58:
  if (v42 < 0x20 || (unint64_t)&v43[-v41] < 0x20)
  {
    unint64_t v44 = v43;
    uint64_t v45 = (char *)v41;
  }
  else
  {
    unint64_t v44 = &v43[v42 & 0xFFFFFFFFFFFFFFE0];
    uint64_t v45 = (char *)(v41 + (v42 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v46 = (long long *)(v41 + 16);
    long long v47 = v43 + 16;
    unint64_t v48 = v42 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v49 = *v46;
      *(v47 - 1) = *(v46 - 1);
      _OWORD *v47 = v49;
      v46 += 2;
      v47 += 2;
      v48 -= 32;
    }
    while (v48);
    if (v42 == (v42 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_72;
    }
  }
  do
  {
    char v52 = *v45++;
    *v44++ = v52;
  }
  while (v45 != v40);
LABEL_72:
  unsigned char *v44 = 0;
LABEL_73:
  util::convert<int>(&v93, (_DWORD *)((unint64_t)&__p | 0xC));
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v10 + 112)) {
      goto LABEL_75;
    }
LABEL_85:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_93;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(unsigned char *)(v10 + 112)) {
    goto LABEL_85;
  }
LABEL_75:
  uint64_t v54 = *(void *)(v10 + 96);
  uint64_t v53 = *(char **)(v10 + 104);
  unint64_t v55 = (unint64_t)&v53[-v54];
  if ((unint64_t)&v53[-v54] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v55 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v53 - v54;
    long long v56 = &v93;
    if ((char *)v54 != v53) {
      goto LABEL_78;
    }
LABEL_89:
    *long long v56 = 0;
    goto LABEL_93;
  }
  uint64_t v63 = (v55 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v55 | 7) != 0x17) {
    uint64_t v63 = v55 | 7;
  }
  uint64_t v64 = v63 + 1;
  long long v56 = operator new(v63 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v53[-v54];
  v93.__r_.__value_.__r.__words[2] = v64 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v56;
  if ((char *)v54 == v53) {
    goto LABEL_89;
  }
LABEL_78:
  if (v55 < 0x20 || (unint64_t)&v56[-v54] < 0x20)
  {
    long long v57 = v56;
    uint64_t v58 = (char *)v54;
  }
  else
  {
    long long v57 = &v56[v55 & 0xFFFFFFFFFFFFFFE0];
    uint64_t v58 = (char *)(v54 + (v55 & 0xFFFFFFFFFFFFFFE0));
    size_t v59 = (long long *)(v54 + 16);
    unint64_t v60 = v56 + 16;
    unint64_t v61 = v55 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v62 = *v59;
      *(v60 - 1) = *(v59 - 1);
      _OWORD *v60 = v62;
      v59 += 2;
      v60 += 2;
      v61 -= 32;
    }
    while (v61);
    if (v55 == (v55 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_92;
    }
  }
  do
  {
    char v65 = *v58++;
    *v57++ = v65;
  }
  while (v58 != v53);
LABEL_92:
  *long long v57 = 0;
LABEL_93:
  util::convert<int>(&v93, &__p.tm_hour);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v10 + 136)) {
      goto LABEL_95;
    }
LABEL_105:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_113;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(unsigned char *)(v10 + 136)) {
    goto LABEL_105;
  }
LABEL_95:
  uint64_t v67 = *(void *)(v10 + 120);
  std::string::size_type v66 = *(char **)(v10 + 128);
  unint64_t v68 = (unint64_t)&v66[-v67];
  if ((unint64_t)&v66[-v67] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v68 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v66 - v67;
    int v69 = &v93;
    if ((char *)v67 != v66) {
      goto LABEL_98;
    }
LABEL_109:
    *int v69 = 0;
    goto LABEL_113;
  }
  uint64_t v76 = (v68 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v68 | 7) != 0x17) {
    uint64_t v76 = v68 | 7;
  }
  uint64_t v77 = v76 + 1;
  int v69 = operator new(v76 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v66[-v67];
  v93.__r_.__value_.__r.__words[2] = v77 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v69;
  if ((char *)v67 == v66) {
    goto LABEL_109;
  }
LABEL_98:
  if (v68 < 0x20 || (unint64_t)&v69[-v67] < 0x20)
  {
    size_t v70 = v69;
    unint64_t v71 = (char *)v67;
  }
  else
  {
    size_t v70 = &v69[v68 & 0xFFFFFFFFFFFFFFE0];
    unint64_t v71 = (char *)(v67 + (v68 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v72 = (long long *)(v67 + 16);
    uint64_t v73 = v69 + 16;
    unint64_t v74 = v68 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v75 = *v72;
      *(v73 - 1) = *(v72 - 1);
      *uint64_t v73 = v75;
      v72 += 2;
      v73 += 2;
      v74 -= 32;
    }
    while (v74);
    if (v68 == (v68 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_112;
    }
  }
  do
  {
    char v78 = *v71++;
    *v70++ = v78;
  }
  while (v71 != v66);
LABEL_112:
  *size_t v70 = 0;
LABEL_113:
  util::convert<int>(&v93, &__p.tm_min);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v10 + 160)) {
      goto LABEL_115;
    }
LABEL_125:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_133;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(unsigned char *)(v10 + 160)) {
    goto LABEL_125;
  }
LABEL_115:
  uint64_t v80 = *(void *)(v10 + 144);
  long long v79 = *(char **)(v10 + 152);
  unint64_t v81 = (unint64_t)&v79[-v80];
  if ((unint64_t)&v79[-v80] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v81 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v79 - v80;
    int v82 = &v93;
    if ((char *)v80 != v79) {
      goto LABEL_118;
    }
LABEL_129:
    unsigned char *v82 = 0;
    goto LABEL_133;
  }
  uint64_t v89 = (v81 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v81 | 7) != 0x17) {
    uint64_t v89 = v81 | 7;
  }
  uint64_t v90 = v89 + 1;
  int v82 = operator new(v89 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v79[-v80];
  v93.__r_.__value_.__r.__words[2] = v90 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v82;
  if ((char *)v80 == v79) {
    goto LABEL_129;
  }
LABEL_118:
  if (v81 < 0x20 || (unint64_t)&v82[-v80] < 0x20)
  {
    size_t v83 = v82;
    unint64_t v84 = (char *)v80;
  }
  else
  {
    size_t v83 = &v82[v81 & 0xFFFFFFFFFFFFFFE0];
    unint64_t v84 = (char *)(v80 + (v81 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v85 = (long long *)(v80 + 16);
    uint64_t v86 = v82 + 16;
    unint64_t v87 = v81 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v88 = *v85;
      *(v86 - 1) = *(v85 - 1);
      _OWORD *v86 = v88;
      v85 += 2;
      v86 += 2;
      v87 -= 32;
    }
    while (v87);
    if (v81 == (v81 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_132;
    }
  }
  do
  {
    char v91 = *v84++;
    *v83++ = v91;
  }
  while (v84 != v79);
LABEL_132:
  *size_t v83 = 0;
LABEL_133:
  util::convert<int>(&v93, &__p);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v93.__r_.__value_.__l.__data_);
  }
  __p.tm_isdst = -1;
  time_t v92 = mktime(&__p);
  v93.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v93.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday((timeval *)&v93, 0);
  BOOL v21 = (int64_t)(v93.__r_.__value_.__r.__words[0] - v92) > a2;
  uint64_t v22 = *(void **)v94;
  if (*(void *)v94) {
    goto LABEL_23;
  }
  return v21;
}

void sub_263670460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t util::convert<int>(const std::string *a1, _DWORD *a2)
{
  if ((SHIBYTE(a1->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    uint64_t result = strcasecmp((const char *)a1, "false");
    if (!result) {
      goto LABEL_29;
    }
    uint64_t result = strcasecmp((const char *)a1, "off");
    if (!result) {
      goto LABEL_29;
    }
    uint64_t result = strcasecmp((const char *)a1, "no");
    if (!result) {
      goto LABEL_29;
    }
    if (strcasecmp((const char *)a1, "true")
      && strcasecmp((const char *)a1, "on")
      && strcasecmp((const char *)a1, "yes")
      && strcasecmp((const char *)a1, "full")
      && strcasecmp((const char *)a1, "streaming"))
    {
      uint64_t v5 = (const char *)a1;
      if (!strcasecmp((const char *)a1, "lite")) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
LABEL_28:
    uint64_t result = 1;
LABEL_29:
    *a2 = result;
    return result;
  }
  uint64_t v5 = (const char *)a1->__r_.__value_.__r.__words[0];
  uint64_t result = strcasecmp(a1->__r_.__value_.__l.__data_, "false");
  if (!result) {
    goto LABEL_29;
  }
  uint64_t result = strcasecmp(v5, "off");
  if (!result) {
    goto LABEL_29;
  }
  uint64_t result = strcasecmp(v5, "no");
  if (!result) {
    goto LABEL_29;
  }
  if (!strcasecmp(v5, "true")
    || !strcasecmp(v5, "on")
    || !strcasecmp(v5, "yes")
    || !strcasecmp(v5, "full")
    || !strcasecmp(v5, "streaming"))
  {
    goto LABEL_28;
  }
  if (!strcasecmp(v5, "lite"))
  {
LABEL_31:
    uint64_t result = 2;
    goto LABEL_29;
  }
LABEL_21:
  if (!strcasecmp(v5, "background")) {
    goto LABEL_31;
  }
  size_t __idx = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = std::stol(a1, &__idx, 10);
  std::string::size_type size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a1->__r_.__value_.__l.__size_;
  }
  if (__idx == size && result >= (uint64_t)0xFFFFFFFF80000000 && result <= 0x7FFFFFFF) {
    goto LABEL_29;
  }
  return result;
}

void sub_2636706FC(void *a1)
{
}

void util::findBasebandLogInfoFile(const void **a1@<X0>, long long **a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  uint64_t v46 = a3;
  a3[2] = 0;
  int v3 = *a2;
  long long v47 = a2[1];
  if (v3 == v47) {
    return;
  }
  while (1)
  {
    memset(&v49, 170, sizeof(v49));
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v49, *(const std::string::value_type **)v3, *((void *)v3 + 1));
    }
    else
    {
      long long v5 = *v3;
      v49.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
      *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v5;
    }
    int v6 = *((char *)a1 + 23);
    if (v6 >= 0) {
      size_t v7 = *((unsigned __int8 *)a1 + 23);
    }
    else {
      size_t v7 = (size_t)a1[1];
    }
    int v8 = SHIBYTE(v49.__r_.__value_.__r.__words[2]);
    if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      size_t size = HIBYTE(v49.__r_.__value_.__r.__words[2]);
    }
    else {
      size_t size = v49.__r_.__value_.__l.__size_;
    }
    unint64_t v10 = size + v7;
    memset(__dst, 170, sizeof(__dst));
    if (size + v7 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v10 <= 0x16)
    {
      memset(__dst, 0, sizeof(__dst));
      uint32_t v11 = __dst;
      HIBYTE(__dst[2]) = size + v7;
      if (!v7) {
        goto LABEL_20;
      }
LABEL_16:
      if (v6 >= 0) {
        uint64_t v12 = a1;
      }
      else {
        uint64_t v12 = *a1;
      }
      memmove(v11, v12, v7);
      goto LABEL_20;
    }
    uint64_t v18 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v18 = v10 | 7;
    }
    uint64_t v19 = v18 + 1;
    uint32_t v11 = (void **)operator new(v18 + 1);
    __dst[1] = (void *)(size + v7);
    __dst[2] = (void *)(v19 | 0x8000000000000000);
    __dst[0] = v11;
    if (v7) {
      goto LABEL_16;
    }
LABEL_20:
    unint64_t v13 = (char *)v11 + v7;
    if (size)
    {
      if (v8 >= 0) {
        size_t v14 = &v49;
      }
      else {
        size_t v14 = (std::string *)v49.__r_.__value_.__r.__words[0];
      }
      memmove(v13, v14, size);
    }
    v13[size] = 0;
    v15.tv_seCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
    v15.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v50.st_blksize_t size = v15;
    *(timespec *)v50.st_qspare = v15;
    v50.st_birthtimespeCC_SHA256_CTX c = v15;
    *(timespec *)&v50.st_size_t size = v15;
    v50.st_mtimespeCC_SHA256_CTX c = v15;
    v50.st_ctimespeCC_SHA256_CTX c = v15;
    *(timespec *)&v50.st_uid = v15;
    v50.st_atimespeCC_SHA256_CTX c = v15;
    *(timespec *)&v50.st_dev = v15;
    if (SHIBYTE(__dst[2]) >= 0) {
      uint64_t v16 = (const char *)__dst;
    }
    else {
      uint64_t v16 = (const char *)__dst[0];
    }
    if (stat(v16, &v50)
      || (SHIBYTE(__dst[2]) >= 0 ? (long long v20 = (const char *)__dst) : (long long v20 = (const char *)__dst[0]),
          BOOL v21 = opendir(v20),
          (uint64_t v22 = v21) == 0))
    {
      char v17 = HIBYTE(__dst[2]);
      goto LABEL_30;
    }
    int v23 = readdir(v21);
    closedir(v22);
    char v17 = HIBYTE(__dst[2]);
    if (v23) {
      break;
    }
LABEL_30:
    if (v17 < 0)
    {
      operator delete(__dst[0]);
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
LABEL_59:
      }
        operator delete(v49.__r_.__value_.__l.__data_);
    }
    else if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_59;
    }
    int v3 = (long long *)((char *)v3 + 24);
    if (v3 == v47) {
      return;
    }
  }
  if ((HIBYTE(__dst[2]) & 0x80) == 0)
  {
    if (HIBYTE(__dst[2]) <= 4u) {
      goto LABEL_99;
    }
    uint64_t v24 = (_DWORD *)((char *)__dst + HIBYTE(__dst[2]) - 5);
    if (*v24 == 1885626669 && *((unsigned char *)__dst + HIBYTE(__dst[2]) - 1) == 108) {
      goto LABEL_79;
    }
    if (*v24 == 1935962413 && *((unsigned char *)__dst + HIBYTE(__dst[2]) - 1) == 115) {
      goto LABEL_79;
    }
    if (*v24 == 1634296877 && *((unsigned char *)__dst + HIBYTE(__dst[2]) - 1) == 103) {
      goto LABEL_79;
    }
    if (HIBYTE(__dst[2]) < 9u) {
      goto LABEL_99;
    }
    uint64_t v28 = __dst;
    unint64_t v29 = (void *)HIBYTE(__dst[2]);
    goto LABEL_74;
  }
  unint64_t v29 = __dst[1];
  if (__dst[1] < (void *)5) {
    goto LABEL_99;
  }
  uint64_t v28 = (void **)__dst[0];
  int v30 = (char *)__dst[1] + (unint64_t)__dst[0] - 5;
  if ((*v30 != 1885626669 || *((unsigned char *)__dst[1] + (unint64_t)__dst[0] - 1) != 108)
    && (*v30 != 1935962413 || *((unsigned char *)__dst[1] + (unint64_t)__dst[0] - 1) != 115)
    && (*v30 != 1634296877 || *((unsigned char *)__dst[1] + (unint64_t)__dst[0] - 1) != 103))
  {
    if (__dst[1] < (void *)9) {
LABEL_99:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
LABEL_74:
    __int16 v34 = (char *)v28 + (void)v29;
    uint64_t v35 = *(void *)(v34 - 9);
    int v36 = *(v34 - 1);
    if (v35 == 0x636172742D62622DLL && v36 == 101) {
      goto LABEL_79;
    }
    goto LABEL_30;
  }
LABEL_79:
  int v38 = SHIBYTE(v49.__r_.__value_.__r.__words[2]);
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v39 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t v39 = v49.__r_.__value_.__l.__size_;
  }
  unint64_t v40 = v39 + 9;
  memset(&v50, 170, 24);
  if (v39 + 9 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v40 >= 0x17)
  {
    uint64_t v42 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v40 | 7) != 0x17) {
      uint64_t v42 = v40 | 7;
    }
    uint64_t v43 = v42 + 1;
    uint64_t v41 = operator new(v42 + 1);
    v50.st_ino = v39 + 9;
    *(void *)&v50.st_uid = v43 | 0x8000000000000000;
    *(void *)&v50.st_dev = v41;
  }
  else
  {
    memset(&v50, 0, 24);
    uint64_t v41 = &v50;
    HIBYTE(v50.st_gid) = v39 + 9;
    if (!v39) {
      goto LABEL_93;
    }
  }
  if (v38 >= 0) {
    unint64_t v44 = &v49;
  }
  else {
    unint64_t v44 = (std::string *)v49.__r_.__value_.__r.__words[0];
  }
  memmove(v41, v44, v39);
LABEL_93:
  strcpy((char *)v41 + v39, "/info.txt");
  uint64_t v45 = v46;
  _OWORD *v46 = *(_OWORD *)&v50.st_dev;
  *((void *)v45 + 2) = *(void *)&v50.st_uid;
  if ((v17 & 0x80) == 0)
  {
    if ((v38 & 0x80) == 0) {
      return;
    }
LABEL_97:
    operator delete(v49.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(__dst[0]);
  if ((*((unsigned char *)&v49.__r_.__value_.__s + 23) & 0x80) != 0) {
    goto LABEL_97;
  }
}

void sub_263670B94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0)
  {
    operator delete(__p);
    if ((a23 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a23 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a18);
  _Unwind_Resume(exception_object);
}

BOOL util::isDumpForSysdiagnose(uint64_t a1, uint64_t a2)
{
  __p[73] = *(void **)MEMORY[0x263EF8340];
  unint64_t v74 = 0;
  long long v75 = 0;
  uint64_t v76 = 0;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v72[32] = v2;
  long long v73 = v2;
  *(_OWORD *)uint64_t v72 = v2;
  *(_OWORD *)&v72[16] = v2;
  int v3 = *(char *)(a2 + 23);
  if (v3 >= 0) {
    size_t v4 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v4 = *(void *)(a2 + 8);
  }
  unint64_t v5 = v4 + 2;
  memset(&v71, 170, sizeof(v71));
  if (v4 + 2 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  int v6 = (const void **)a2;
  if (v5 >= 0x17)
  {
    uint64_t v9 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v9 = v5 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint32_t v11 = operator new(v9 + 1);
    v71.__r_.__value_.__l.__size_ = v4 + 2;
    v71.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    v71.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
    *uint32_t v11 = 10798;
    int v8 = (std::string::value_type *)(v11 + 1);
  }
  else
  {
    v71.__r_.__value_.__r.__words[2] = 0;
    *((unsigned char *)&v71.__r_.__value_.__s + 23) = v4 + 2;
    int v8 = &v71.__r_.__value_.__s.__data_[2];
    *(_OWORD *)&v71.__r_.__value_.__l.__data_ = 0x2A2EuLL;
    if (!v4) {
      goto LABEL_15;
    }
  }
  if (v3 >= 0) {
    uint64_t v12 = v6;
  }
  else {
    uint64_t v12 = (const void **)*v6;
  }
  memmove(v8, v12, v4);
LABEL_15:
  v8[v4] = 0;
  unint64_t v13 = std::string::append(&v71, ".*", 2uLL);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  __p[2] = (void *)v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)tm __p = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v72, (uint64_t)__p, 0);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v71.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_20:
    operator delete(v71.__r_.__value_.__l.__data_);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_20;
  }
LABEL_17:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
LABEL_18:
    std::string v70 = *(std::string *)a1;
    goto LABEL_22;
  }
LABEL_21:
  std::string::__init_copy_ctor_external(&v70, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
LABEL_22:
  std::locale::locale(&v64, (const std::locale *)v72);
  long long v65 = *(_OWORD *)&v72[8];
  long long v66 = *(_OWORD *)&v72[24];
  uint64_t v67 = *(void *)&v72[40];
  unint64_t v68 = (std::__shared_weak_count *)v73;
  if ((void)v73) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v73 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v69 = *((void *)&v73 + 1);
  BOOL FilteredFiles = support::fs::getFilteredFiles((const char *)&v70, (uint64_t)&v64, (uint64_t)&v74, 0);
  uint64_t v16 = v68;
  if (v68 && !atomic_fetch_add(&v68->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    std::locale::~locale(&v64);
    if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_27:
      if (FilteredFiles) {
        goto LABEL_28;
      }
LABEL_32:
      BOOL v17 = 0;
      goto LABEL_118;
    }
  }
  else
  {
    std::locale::~locale(&v64);
    if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_27;
    }
  }
  operator delete(v70.__r_.__value_.__l.__data_);
  if (!FilteredFiles) {
    goto LABEL_32;
  }
LABEL_28:
  memset(&v71, 170, sizeof(v71));
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v63, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v63 = *(std::string *)a1;
  }
  unint64_t v60 = 0;
  unint64_t v61 = 0;
  long long v62 = 0;
  uint64_t v18 = (char *)v74;
  uint64_t v19 = v75;
  __p[0] = &v60;
  __p[1] = (void *)0xAAAAAAAAAAAAAA00;
  int64_t v20 = v75 - (unsigned char *)v74;
  if (v75 != v74)
  {
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (v20 >> 3);
    if (v21 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v22 = (char *)operator new(v20);
    uint64_t v23 = 0;
    unint64_t v60 = v22;
    unint64_t v61 = v22;
    long long v62 = &v22[24 * v21];
    do
    {
      uint64_t v25 = (std::string *)&v22[v23];
      char v26 = &v18[v23];
      if (v18[v23 + 23] < 0)
      {
        std::string::__init_copy_ctor_external(v25, *(const std::string::value_type **)v26, *((void *)v26 + 1));
      }
      else
      {
        long long v24 = *(_OWORD *)v26;
        v25->__r_.__value_.__r.__words[2] = *((void *)v26 + 2);
        *(_OWORD *)&v25->__r_.__value_.__l.__data_ = v24;
      }
      v23 += 24;
    }
    while (&v18[v23] != v19);
    unint64_t v61 = &v22[v23];
  }
  util::findBasebandLogInfoFile((const void **)&v63.__r_.__value_.__l.__data_, (long long **)&v60, &v71);
  int v27 = (void **)v60;
  if (v60)
  {
    uint64_t v28 = (void **)v61;
    unint64_t v29 = v60;
    if (v61 != v60)
    {
      do
      {
        if (*((char *)v28 - 1) < 0) {
          operator delete(*(v28 - 3));
        }
        v28 -= 3;
      }
      while (v28 != v27);
      unint64_t v29 = v60;
    }
    unint64_t v61 = (char *)v27;
    operator delete(v29);
  }
  if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    int v30 = SHIBYTE(v71.__r_.__value_.__r.__words[2]);
    if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      size_t size = HIBYTE(v71.__r_.__value_.__r.__words[2]);
    }
    else {
      size_t size = v71.__r_.__value_.__l.__size_;
    }
    if (size) {
      goto LABEL_55;
    }
LABEL_102:
    uint64_t v51 = GetOsLogContext()[1];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)v6 + 23) < 0) {
        int v6 = (const void **)*v6;
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v6;
      _os_log_impl(&dword_263655000, v51, OS_LOG_TYPE_DEFAULT, "No baseband info file found for %s", (uint8_t *)__p, 0xCu);
    }
    BOOL v17 = 0;
    if ((v30 & 0x80) != 0) {
      goto LABEL_117;
    }
    goto LABEL_118;
  }
  operator delete(v63.__r_.__value_.__l.__data_);
  int v30 = SHIBYTE(v71.__r_.__value_.__r.__words[2]);
  if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v71.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v71.__r_.__value_.__l.__size_;
  }
  if (!size) {
    goto LABEL_102;
  }
LABEL_55:
  memset(__p, 170, 0x240uLL);
  int v32 = *(char *)(a1 + 23);
  if (v32 >= 0) {
    size_t v33 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v33 = *(void *)(a1 + 8);
  }
  unint64_t v34 = v33 + size;
  memset(__dst, 170, 24);
  if (v33 + size > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v34 <= 0x16)
  {
    memset(__dst, 0, 24);
    uint64_t v35 = __dst;
    HIBYTE(__dst[2]) = v33 + size;
    if (!v33) {
      goto LABEL_65;
    }
    goto LABEL_61;
  }
  uint64_t v52 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v34 | 7) != 0x17) {
    uint64_t v52 = v34 | 7;
  }
  uint64_t v53 = v52 + 1;
  uint64_t v35 = (void **)operator new(v52 + 1);
  __dst[1] = (void *)(v33 + size);
  __dst[2] = (void *)(v53 | 0x8000000000000000);
  __dst[0] = v35;
  if (v33)
  {
LABEL_61:
    if (v32 >= 0) {
      int v36 = (const void *)a1;
    }
    else {
      int v36 = *(const void **)a1;
    }
    memmove(v35, v36, v33);
  }
LABEL_65:
  uint64_t v37 = (char *)v35 + v33;
  if (v30 >= 0) {
    int v38 = &v71;
  }
  else {
    int v38 = (std::string *)v71.__r_.__value_.__r.__words[0];
  }
  memmove(v37, v38, size);
  v37[size] = 0;
  std::ifstream::basic_ifstream((uint64_t *)__p);
  if (SHIBYTE(__dst[2]) < 0)
  {
    operator delete(__dst[0]);
    if (__p[17]) {
      goto LABEL_70;
    }
LABEL_113:
    uint64_t v54 = GetOsLogContext()[1];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__dst[0]) = 136315138;
      *(void **)((char *)__dst + 4) = v38;
      _os_log_error_impl(&dword_263655000, v54, OS_LOG_TYPE_ERROR, "Failed to open info file: %s", (uint8_t *)__dst, 0xCu);
    }
    BOOL v17 = 0;
    goto LABEL_116;
  }
  if (!__p[17]) {
    goto LABEL_113;
  }
LABEL_70:
  std::istream::seekg();
  memset(__dst, 170, 24);
  size_t v39 = __dst;
  support::fs::readCurrentLine(__p, __dst);
  uint64_t v40 = HIBYTE(__dst[2]);
  int v41 = SHIBYTE(__dst[2]);
  uint64_t v42 = __dst[0];
  if (SHIBYTE(__dst[2]) < 0)
  {
    uint64_t v40 = (uint64_t)__dst[1];
    size_t v39 = (void **)__dst[0];
  }
  uint64_t v43 = (char *)v39 + v40;
  if (v40 >= 35)
  {
    unint64_t v44 = v39;
    do
    {
      uint64_t v45 = (char *)memchr(v44, 98, v40 - 34);
      if (!v45) {
        break;
      }
      if (*(void *)v45 == 0x6320676F6C206262
        && *((void *)v45 + 1) == 0x6F697463656C6C6FLL
        && *((void *)v45 + 2) == 0x20726F66202D206ELL
        && *((void *)v45 + 3) == 0x6E67616964737973
        && *(void *)(v45 + 27) == 0x65736F6E67616964)
      {
        goto LABEL_90;
      }
      unint64_t v44 = (void **)(v45 + 1);
      uint64_t v40 = v43 - (char *)v44;
    }
    while (v43 - (char *)v44 > 34);
  }
  uint64_t v45 = v43;
LABEL_90:
  BOOL v17 = v45 != v43 && v45 - (char *)v39 != -1;
  if (v41 < 0) {
    operator delete(v42);
  }
LABEL_116:
  __p[0] = *(void **)MEMORY[0x263F8C2A8];
  *(void **)((char *)__p + *((void *)__p[0] - 3)) = *(void **)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x263E672A0](&__p[2]);
  std::istream::~istream();
  MEMORY[0x263E67440](&__p[53]);
  if ((*((unsigned char *)&v71.__r_.__value_.__s + 23) & 0x80) != 0) {
LABEL_117:
  }
    operator delete(v71.__r_.__value_.__l.__data_);
LABEL_118:
  unint64_t v55 = (std::__shared_weak_count *)v73;
  if ((void)v73 && !atomic_fetch_add((atomic_ullong *volatile)(v73 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
    std::__shared_weak_count::__release_weak(v55);
  }
  std::locale::~locale((std::locale *)v72);
  long long v56 = (void **)v74;
  if (v74)
  {
    long long v57 = (void **)v75;
    uint64_t v58 = v74;
    if (v75 != v74)
    {
      do
      {
        if (*((char *)v57 - 1) < 0) {
          operator delete(*(v57 - 3));
        }
        v57 -= 3;
      }
      while (v57 != v56);
      uint64_t v58 = v74;
    }
    long long v75 = (char *)v56;
    operator delete(v58);
  }
  return v17;
}

void sub_26367145C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,uint64_t a30,std::locale a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47)
{
  std::ifstream::~ifstream(&a47);
  if (v47 < 0)
  {
    operator delete(__p);
    std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a31);
    std::vector<std::string>::~vector[abi:ne180100](&a40);
    _Unwind_Resume(a1);
  }
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a31);
  std::vector<std::string>::~vector[abi:ne180100](&a40);
  _Unwind_Resume(a1);
}

void util::findLastLogDumpTimestamp(util *this@<X0>, const char *__s@<X1>, const char *a3@<X2>, int a4@<W3>, char *a5@<X4>, std::string *a6@<X8>)
{
  unsigned int v8 = a3;
  uint64_t v10 = a6;
  uint64_t v150 = *MEMORY[0x263EF8340];
  a6->__r_.__value_.__r.__words[0] = 0;
  a6->__r_.__value_.__l.__size_ = 0;
  a6->__r_.__value_.__r.__words[2] = 0;
  v138 = 0;
  std::string v139 = 0;
  uint64_t v140 = 0;
  memset(v137, 170, sizeof(v137));
  size_t v11 = strlen(__s);
  unint64_t v103 = v10;
  if (v11 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v12 = v11;
  if (v11 >= 0x17)
  {
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    p_dst = (long long *)operator new(v14 + 1);
    *((void *)&__dst + 1) = v12;
    *(void *)v142 = v15 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_8;
  }
  v142[7] = v11;
  p_dst = &__dst;
  if (v11) {
LABEL_8:
  }
    memcpy(p_dst, __s, v12);
  *((unsigned char *)p_dst + v12) = 0;
  uint64_t v16 = std::string::append((std::string *)&__dst, ".*", 2uLL);
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v137[2] = (void *)v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)v137 = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if ((v142[7] & 0x80000000) != 0) {
    operator delete((void *)__dst);
  }
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v135[32] = v18;
  long long v136 = v18;
  *(_OWORD *)int v135 = v18;
  *(_OWORD *)&v135[16] = v18;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v135, (uint64_t)v137, 0);
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v133[32] = v19;
  long long v134 = v19;
  *(_OWORD *)uint64_t v133 = v19;
  *(_OWORD *)&v133[16] = v19;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)v133, "(\\d{4})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{3})", 0);
  BOOL v104 = a5 == 0;
  size_t v20 = strlen((const char *)this);
  if (v20 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v21 = (void *)v20;
  if (v20 >= 0x17)
  {
    uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17) {
      uint64_t v23 = v20 | 7;
    }
    uint64_t v24 = v23 + 1;
    uint64_t v22 = operator new(v23 + 1);
    unint64_t v132 = v24 | 0x8000000000000000;
    __p[0] = v22;
    __p[1] = v21;
    goto LABEL_18;
  }
  HIBYTE(v132) = v20;
  uint64_t v22 = __p;
  if (v20) {
LABEL_18:
  }
    memcpy(v22, this, (size_t)v21);
  *((unsigned char *)v21 + (void)v22) = 0;
  std::locale::locale(&v125, (const std::locale *)v135);
  long long v126 = *(_OWORD *)&v135[8];
  long long v127 = *(_OWORD *)&v135[24];
  uint64_t v128 = *(void *)&v135[40];
  v129 = (std::__shared_weak_count *)v136;
  if ((void)v136) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v136 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v130 = *((void *)&v136 + 1);
  BOOL FilteredFiles = support::fs::getFilteredFiles((const char *)__p, (uint64_t)&v125, (uint64_t)&v138, 0);
  char v26 = v129;
  if (v129 && !atomic_fetch_add(&v129->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
    std::locale::~locale(&v125);
    if ((SHIBYTE(v132) & 0x80000000) == 0)
    {
LABEL_24:
      if (!FilteredFiles) {
        goto LABEL_167;
      }
      goto LABEL_28;
    }
  }
  else
  {
    std::locale::~locale(&v125);
    if ((SHIBYTE(v132) & 0x80000000) == 0) {
      goto LABEL_24;
    }
  }
  operator delete(__p[0]);
  if (!FilteredFiles) {
    goto LABEL_167;
  }
LABEL_28:
  unint64_t v28 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v139 - v138));
  if (v139 == v138) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v28;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>((unint64_t)v138, v139, v29, 1, v27);
  memset(&v124, 0, sizeof(v124));
  int v30 = v138;
  uint64_t v102 = v139;
  if (v138 == v139)
  {
LABEL_167:
    if (!v8) {
      goto LABEL_184;
    }
LABEL_168:
    if (SHIBYTE(v10->__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v111, v10->__r_.__value_.__l.__data_, v10->__r_.__value_.__l.__size_);
    }
    else {
      std::string v111 = *v10;
    }
    std::locale::locale(&v105, (const std::locale *)v133);
    long long v106 = *(_OWORD *)&v133[8];
    long long v107 = *(_OWORD *)&v133[24];
    uint64_t v108 = *(void *)&v133[40];
    std::string::size_type v109 = (std::__shared_weak_count *)v134;
    if ((void)v134) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v134 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v110 = *((void *)&v134 + 1);
    BOOL v91 = util::checkLogFileAge((uint64_t)&v111, v8, (uint64_t)&v105);
    time_t v92 = v109;
    if (v109 && !atomic_fetch_add(&v109->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
      std::locale::~locale(&v105);
      if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_176:
        if (!v91) {
          goto LABEL_184;
        }
LABEL_180:
        if (SHIBYTE(v10->__r_.__value_.__r.__words[2]) < 0)
        {
          *v10->__r_.__value_.__l.__data_ = 0;
          v10->__r_.__value_.__l.__size_ = 0;
        }
        else
        {
          v10->__r_.__value_.__s.__data_[0] = 0;
          *((unsigned char *)&v10->__r_.__value_.__s + 23) = 0;
        }
        goto LABEL_184;
      }
    }
    else
    {
      std::locale::~locale(&v105);
      if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_176;
      }
    }
    operator delete(v111.__r_.__value_.__l.__data_);
    if (!v91) {
      goto LABEL_184;
    }
    goto LABEL_180;
  }
  unsigned int v98 = v8;
  uint64_t v100 = a5;
  while (1)
  {
    memset(&v123, 170, sizeof(v123));
    if (*((char *)v30 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v123, (const std::string::value_type *)*v30, (std::string::size_type)v30[1]);
    }
    else
    {
      long long v31 = *(_OWORD *)v30;
      v123.__r_.__value_.__r.__words[2] = (std::string::size_type)v30[2];
      *(_OWORD *)&v123.__r_.__value_.__l.__data_ = v31;
    }
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int64_t size = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    }
    else {
      int64_t size = v124.__r_.__value_.__l.__size_;
    }
    std::string::size_type v33 = HIBYTE(v123.__r_.__value_.__r.__words[2]);
    int v34 = SHIBYTE(v123.__r_.__value_.__r.__words[2]);
    uint64_t v35 = (std::string *)v123.__r_.__value_.__r.__words[0];
    if (size)
    {
      if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v36 = &v124;
      }
      else {
        int v36 = (std::string *)v124.__r_.__value_.__r.__words[0];
      }
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v37 = &v123;
      }
      else {
        uint64_t v37 = (std::string *)v123.__r_.__value_.__r.__words[0];
      }
      int64_t v38 = v123.__r_.__value_.__l.__size_;
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int64_t v38 = HIBYTE(v123.__r_.__value_.__r.__words[2]);
      }
      if (v38 >= size)
      {
        std::string v63 = (char *)v37 + v38;
        int v64 = v36->__r_.__value_.__s.__data_[0];
        long long v65 = v37;
        do
        {
          int64_t v66 = v38 - size;
          if (v66 == -1) {
            break;
          }
          uint64_t v67 = (char *)memchr(v65, v64, v66 + 1);
          if (!v67) {
            break;
          }
          unint64_t v68 = v67;
          if (!memcmp(v67, v36, size))
          {
            if (v68 == v63 || v68 - (char *)v37 == -1) {
              break;
            }
            int v61 = 3;
            uint64_t v10 = v103;
            if ((v34 & 0x80) == 0) {
              goto LABEL_150;
            }
            goto LABEL_106;
          }
          long long v65 = (std::string *)(v68 + 1);
          int64_t v38 = v63 - (v68 + 1);
        }
        while (v38 >= size);
      }
    }
    *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v121 = v39;
    unint64_t v118 = 0xAAAAAAAAAAAAAA00;
    v115[1].__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v116 = 0;
    uint64_t v117 = 0;
    uint64_t v119 = 0;
    uint64_t v120 = 0;
    LOBYTE(v121) = 0;
    BYTE8(v121) = 0;
    uint64_t v122 = 0;
    memset(v115, 0, 41);
    if (v104)
    {
      std::string::size_type v40 = v123.__r_.__value_.__l.__size_;
      long long v148 = v39;
      unint64_t v145 = 0xAAAAAAAAAAAAAA00;
      *(void *)&v142[24] = v39;
      uint64_t v143 = 0;
      uint64_t v144 = 0;
      uint64_t v146 = 0;
      uint64_t v147 = 0;
      LOBYTE(v148) = 0;
      BYTE8(v148) = 0;
      uint64_t v149 = 0;
      long long __dst = 0uLL;
      *(_OWORD *)v142 = 0uLL;
      if (v34 >= 0) {
        int v41 = (std::sub_match<const char *> *)&v123;
      }
      else {
        int v41 = (std::sub_match<const char *> *)v35;
      }
      if (v34 >= 0) {
        std::string::size_type v40 = v33;
      }
      *(_OWORD *)&v142[9] = 0uLL;
      uint64_t v10 = v103;
      int v42 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v133, v41, (std::sub_match<const char *> *)((char *)v41 + v40), (std::vector<std::csub_match> *)&__dst, 0);
      std::string::size_type v43 = HIBYTE(v123.__r_.__value_.__r.__words[2]);
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v44 = &v123;
      }
      else {
        unint64_t v44 = (std::string *)v123.__r_.__value_.__r.__words[0];
      }
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v43 = v123.__r_.__value_.__l.__size_;
      }
      std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v115, (uint64_t)v44, (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v44 + v43), (uint64_t *)&__dst, 0);
      if ((void)__dst)
      {
        *((void *)&__dst + 1) = __dst;
        operator delete((void *)__dst);
      }
      if (v42)
      {
        p_end_cap = &v115[1].__end_cap_;
        if (v115[0].__end_ != v115[0].__begin_) {
          p_end_cap = &v115[0].__begin_->matched;
        }
        if (!*p_end_cap)
        {
          long long __dst = 0uLL;
          *(void *)v142 = 0;
          if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_116;
          }
          goto LABEL_101;
        }
        std::vector<std::ssub_match>::pointer begin = (std::vector<std::ssub_match>::pointer)&v115[1];
        if (v115[0].__end_ != v115[0].__begin_) {
          std::vector<std::ssub_match>::pointer begin = v115[0].__begin_;
        }
        std::__wrap_iter<const char *>::iterator_type i = begin->first.__i_;
        p_std::__wrap_iter<const char *>::iterator_type i = &v115[0].__begin_->second.__i_;
        if (v115[0].__end_ == v115[0].__begin_) {
          p_std::__wrap_iter<const char *>::iterator_type i = (const char **)&v115[1].__end_;
        }
        std::string v49 = *p_i;
        unint64_t v50 = *p_i - i;
        if (v50 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v50 > 0x16)
        {
          uint64_t v75 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v50 | 7) != 0x17) {
            uint64_t v75 = v50 | 7;
          }
          uint64_t v76 = v75 + 1;
          uint64_t v51 = (long long *)operator new(v75 + 1);
          *((void *)&__dst + 1) = v50;
          *(void *)v142 = v76 | 0x8000000000000000;
          *(void *)&long long __dst = v51;
          if (i != v49)
          {
LABEL_74:
            if (v50 < 0x20 || (unint64_t)((char *)v51 - i) < 0x20)
            {
              uint64_t v52 = v51;
              uint64_t v53 = i;
            }
            else
            {
              uint64_t v52 = (long long *)((char *)v51 + (v50 & 0xFFFFFFFFFFFFFFE0));
              uint64_t v53 = &i[v50 & 0xFFFFFFFFFFFFFFE0];
              uint64_t v54 = (long long *)(i + 16);
              unint64_t v55 = v51 + 1;
              unint64_t v56 = v50 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v57 = *v54;
                *(v55 - 1) = *(v54 - 1);
                *unint64_t v55 = v57;
                v54 += 2;
                v55 += 2;
                v56 -= 32;
              }
              while (v56);
              if (v50 == (v50 & 0x7FFFFFFFFFFFFFE0))
              {
LABEL_115:
                *(unsigned char *)uint64_t v52 = 0;
                if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_116:
                  *(_OWORD *)&v103->__r_.__value_.__l.__data_ = __dst;
                  v103->__r_.__value_.__r.__words[2] = *(void *)v142;
                  if (a4) {
                    goto LABEL_117;
                  }
                  goto LABEL_141;
                }
LABEL_101:
                operator delete(v103->__r_.__value_.__l.__data_);
                *(_OWORD *)&v103->__r_.__value_.__l.__data_ = __dst;
                v103->__r_.__value_.__r.__words[2] = *(void *)v142;
                if (a4)
                {
LABEL_117:
                  size_t v78 = strlen((const char *)this);
                  if (v78 > 0x7FFFFFFFFFFFFFF7) {
                    std::string::__throw_length_error[abi:ne180100]();
                  }
                  long long v79 = (void *)v78;
                  if (v78 >= 0x17)
                  {
                    uint64_t v81 = (v78 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v78 | 7) != 0x17) {
                      uint64_t v81 = v78 | 7;
                    }
                    uint64_t v82 = v81 + 1;
                    uint64_t v80 = operator new(v81 + 1);
                    v113[1] = v79;
                    unint64_t v114 = v82 | 0x8000000000000000;
                    v113[0] = v80;
                  }
                  else
                  {
                    HIBYTE(v114) = v78;
                    uint64_t v80 = v113;
                    if (!v78)
                    {
                      LOBYTE(v113[0]) = 0;
                      if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                      {
LABEL_121:
                        std::string v112 = *v103;
                        goto LABEL_127;
                      }
LABEL_126:
                      std::string::__init_copy_ctor_external(&v112, v103->__r_.__value_.__l.__data_, v103->__r_.__value_.__l.__size_);
LABEL_127:
                      BOOL isDumpForSysdiagnose = util::isDumpForSysdiagnose((uint64_t)v113, (uint64_t)&v112);
                      if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
                      {
                        operator delete(v112.__r_.__value_.__l.__data_);
                        if ((SHIBYTE(v114) & 0x80000000) == 0)
                        {
LABEL_129:
                          if (isDumpForSysdiagnose) {
                            goto LABEL_130;
                          }
                          goto LABEL_141;
                        }
                      }
                      else if ((SHIBYTE(v114) & 0x80000000) == 0)
                      {
                        goto LABEL_129;
                      }
                      operator delete(v113[0]);
                      if (isDumpForSysdiagnose)
                      {
LABEL_130:
                        unint64_t v84 = GetOsLogContext()[1];
                        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                        {
                          if ((v103->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                            uint64_t v85 = v103;
                          }
                          else {
                            uint64_t v85 = (std::string *)v103->__r_.__value_.__r.__words[0];
                          }
                          LODWORD(__dst) = 136315138;
                          *(void *)((char *)&__dst + 4) = v85;
                          _os_log_impl(&dword_263655000, v84, OS_LOG_TYPE_DEFAULT, "Ignore dump for sysdiagnose: %s", (uint8_t *)&__dst, 0xCu);
                        }
                        if (&v124 != v103)
                        {
                          char v86 = HIBYTE(v103->__r_.__value_.__r.__words[2]);
                          if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
                          {
                            if (v86 >= 0) {
                              uint64_t v89 = v103;
                            }
                            else {
                              uint64_t v89 = (std::string *)v103->__r_.__value_.__r.__words[0];
                            }
                            if (v86 >= 0) {
                              size_t v90 = HIBYTE(v103->__r_.__value_.__r.__words[2]);
                            }
                            else {
                              size_t v90 = v103->__r_.__value_.__l.__size_;
                            }
                            std::string::__assign_no_alias<false>((void **)&v124.__r_.__value_.__l.__data_, v89, v90);
                          }
                          else
                          {
                            if ((*((unsigned char *)&v103->__r_.__value_.__s + 23) & 0x80) == 0)
                            {
                              std::string v124 = *v103;
LABEL_164:
                              int v61 = 0;
                              v103->__r_.__value_.__s.__data_[0] = 0;
                              *((unsigned char *)&v103->__r_.__value_.__s + 23) = 0;
                              goto LABEL_146;
                            }
                            std::string::__assign_no_alias<true>(&v124, v103->__r_.__value_.__l.__data_, v103->__r_.__value_.__l.__size_);
                          }
                        }
                        if (SHIBYTE(v103->__r_.__value_.__r.__words[2]) < 0)
                        {
                          int v61 = 0;
                          *v103->__r_.__value_.__l.__data_ = 0;
                          v103->__r_.__value_.__l.__size_ = 0;
                          goto LABEL_146;
                        }
                        goto LABEL_164;
                      }
                      goto LABEL_141;
                    }
                  }
                  memcpy(v80, this, (size_t)v79);
                  *((unsigned char *)v79 + (void)v80) = 0;
                  if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                    goto LABEL_121;
                  }
                  goto LABEL_126;
                }
LABEL_141:
                int v61 = 2;
LABEL_146:
                char v87 = 1;
LABEL_147:
                BOOL v104 = v87;
                long long v62 = v115[0].__begin_;
                if (v115[0].__begin_) {
                  goto LABEL_148;
                }
                goto LABEL_149;
              }
            }
            do
            {
              char v77 = *v53++;
              *(unsigned char *)uint64_t v52 = v77;
              uint64_t v52 = (long long *)((char *)v52 + 1);
            }
            while (v53 != v49);
            goto LABEL_115;
          }
        }
        else
        {
          v142[7] = *(unsigned char *)p_i - (_BYTE)i;
          uint64_t v51 = &__dst;
          if (i != v49) {
            goto LABEL_74;
          }
        }
        *(unsigned char *)uint64_t v51 = 0;
        if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_116;
        }
        goto LABEL_101;
      }
LABEL_145:
      int v61 = 0;
      goto LABEL_146;
    }
    if (v34 >= 0) {
      uint64_t v35 = &v123;
    }
    int64_t v58 = strlen(v100);
    uint64_t v10 = v103;
    if (!v58)
    {
LABEL_144:
      std::string::__assign_external(&v124, v100);
      goto LABEL_145;
    }
    int64_t v59 = v58;
    int64_t v60 = v123.__r_.__value_.__l.__size_;
    if (v34 >= 0) {
      int64_t v60 = v33;
    }
    if (v60 >= v58)
    {
      uint64_t v69 = (char *)v35 + v60;
      int v70 = *v100;
      std::string v71 = v35;
      do
      {
        int64_t v72 = v60 - v59;
        if (v72 == -1) {
          break;
        }
        long long v73 = (char *)memchr(v71, v70, v72 + 1);
        if (!v73) {
          break;
        }
        unint64_t v74 = v73;
        if (!memcmp(v73, v100, v59))
        {
          char v87 = 0;
          if (v74 != v69)
          {
            int64_t v88 = v74 - (char *)v35;
            int v61 = 0;
            if (v88 == -1) {
              goto LABEL_147;
            }
            goto LABEL_144;
          }
          int v61 = 0;
          BOOL v104 = 0;
          long long v62 = v115[0].__begin_;
          if (v115[0].__begin_) {
            goto LABEL_148;
          }
          goto LABEL_149;
        }
        std::string v71 = (std::string *)(v74 + 1);
        int64_t v60 = v69 - (v74 + 1);
      }
      while (v60 >= v59);
    }
    int v61 = 0;
    BOOL v104 = 0;
    long long v62 = v115[0].__begin_;
    if (v115[0].__begin_)
    {
LABEL_148:
      v115[0].__end_ = v62;
      operator delete(v62);
    }
LABEL_149:
    if ((*((unsigned char *)&v123.__r_.__value_.__s + 23) & 0x80) != 0) {
      break;
    }
LABEL_150:
    if (v61 != 3) {
      goto LABEL_151;
    }
LABEL_33:
    v30 += 3;
    if (v30 == v102) {
      goto LABEL_166;
    }
  }
LABEL_106:
  operator delete(v123.__r_.__value_.__l.__data_);
  if (v61 == 3) {
    goto LABEL_33;
  }
LABEL_151:
  if (!v61) {
    goto LABEL_33;
  }
LABEL_166:
  unsigned int v8 = v98;
  if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_167;
  }
  operator delete(v124.__r_.__value_.__l.__data_);
  if (v98) {
    goto LABEL_168;
  }
LABEL_184:
  std::string v93 = (std::__shared_weak_count *)v134;
  if ((void)v134 && !atomic_fetch_add((atomic_ullong *volatile)(v134 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
    std::__shared_weak_count::__release_weak(v93);
    std::locale::~locale((std::locale *)v133);
    uint64_t v94 = (std::__shared_weak_count *)v136;
    if (!(void)v136) {
      goto LABEL_188;
    }
LABEL_187:
    if (atomic_fetch_add(&v94->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_188;
    }
    ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
    std::__shared_weak_count::__release_weak(v94);
    std::locale::~locale((std::locale *)v135);
    if (SHIBYTE(v137[2]) < 0) {
LABEL_189:
    }
      operator delete(v137[0]);
  }
  else
  {
    std::locale::~locale((std::locale *)v133);
    uint64_t v94 = (std::__shared_weak_count *)v136;
    if ((void)v136) {
      goto LABEL_187;
    }
LABEL_188:
    std::locale::~locale((std::locale *)v135);
    if (SHIBYTE(v137[2]) < 0) {
      goto LABEL_189;
    }
  }
  long long v95 = v138;
  if (v138)
  {
    uint64_t v96 = v139;
    unint64_t v97 = v138;
    if (v139 != v138)
    {
      do
      {
        if (*((char *)v96 - 1) < 0) {
          operator delete((void *)*(v96 - 3));
        }
        v96 -= 3;
      }
      while (v96 != v95);
      unint64_t v97 = v138;
    }
    std::string v139 = v95;
    operator delete(v97);
  }
}

void sub_263672258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)&STACK[0x220]);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)&STACK[0x260]);
  if (SLOBYTE(STACK[0x2B7]) < 0) {
    operator delete((void *)STACK[0x2A0]);
  }
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v24 - 248));
  if (*(char *)(a24 + 23) < 0) {
    operator delete(*(void **)a24);
  }
  _Unwind_Resume(a1);
}

uint64_t util::getNumberOfLogDumps(uint64_t a1, const void **a2)
{
  uint64_t v236 = *MEMORY[0x263EF8340];
  v224 = 0;
  v225 = 0;
  uint64_t v226 = 0;
  long long v221 = 0u;
  long long v222 = 0u;
  unint64_t v223 = 0xAAAAAAAA3F800000;
  size_t v4 = (char *)operator new(0x48uLL);
  unint64_t v5 = v4;
  strcpy(v4, "[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2,4}-[0-9]{3}");
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v219[32] = v6;
  long long v220 = v6;
  *(_OWORD *)v219 = v6;
  *(_OWORD *)&v219[16] = v6;
  int v7 = *((char *)a2 + 23);
  if (v7 >= 0) {
    size_t v8 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v8 = (size_t)a2[1];
  }
  unint64_t v9 = v8 + 64;
  memset(__dst, 170, 24);
  v197 = v4;
  if (v8 + 64 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v9 <= 0x16)
  {
    memset(__dst, 0, 24);
    uint64_t v10 = __dst;
    __dst[23] = v8 + 64;
LABEL_10:
    if (v7 >= 0) {
      unint64_t v13 = a2;
    }
    else {
      unint64_t v13 = *a2;
    }
    memmove(v10, v13, v8);
    goto LABEL_14;
  }
  uint64_t v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v9 | 7) != 0x17) {
    uint64_t v11 = v9 | 7;
  }
  uint64_t v12 = v11 + 1;
  uint64_t v10 = operator new(v11 + 1);
  *(void *)&__dst[8] = v8 + 64;
  *(void *)&__dst[16] = v12 | 0x8000000000000000;
  *(void *)long long __dst = v10;
  if (v8) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v14 = &v10[v8];
  long long v15 = *(_OWORD *)v5;
  long long v16 = *((_OWORD *)v5 + 1);
  long long v17 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v14 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v14 + 3) = v17;
  *(_OWORD *)uint64_t v14 = v15;
  *((_OWORD *)v14 + 1) = v16;
  v14[64] = 0;
  long long v18 = std::string::append((std::string *)__dst, ".*", 2uLL);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  __p[0].__end_cap_.__value_ = (std::sub_match<const char *> *)v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p[0].__begin_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v219, (uint64_t)__p, 0);
  if (SHIBYTE(__p[0].__end_cap_.__value_) < 0)
  {
    operator delete(__p[0].__begin_);
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_16;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  operator delete(*(void **)__dst);
LABEL_16:
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v217 = v20;
  long long v218 = v20;
  long long v216 = v20;
  *(_OWORD *)&v215[0].__locale_ = v20;
  int v21 = *((char *)a2 + 23);
  if (v21 >= 0) {
    size_t v22 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v22 = (size_t)a2[1];
  }
  unint64_t v23 = v22 + 64;
  memset(__dst, 170, 24);
  if (v22 + 64 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v23 <= 0x16)
  {
    memset(__dst, 0, 24);
    uint64_t v24 = __dst;
    __dst[23] = v22 + 64;
LABEL_25:
    if (v21 >= 0) {
      __n128 v27 = a2;
    }
    else {
      __n128 v27 = *a2;
    }
    memmove(v24, v27, v22);
    goto LABEL_29;
  }
  uint64_t v25 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v23 | 7) != 0x17) {
    uint64_t v25 = v23 | 7;
  }
  uint64_t v26 = v25 + 1;
  uint64_t v24 = operator new(v25 + 1);
  *(void *)&__dst[8] = v22 + 64;
  *(void *)&__dst[16] = v26 | 0x8000000000000000;
  *(void *)long long __dst = v24;
  if (v22) {
    goto LABEL_25;
  }
LABEL_29:
  unint64_t v28 = &v24[v22];
  long long v29 = *(_OWORD *)v5;
  long long v30 = *((_OWORD *)v5 + 1);
  long long v31 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v28 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v28 + 3) = v31;
  *(_OWORD *)unint64_t v28 = v29;
  *((_OWORD *)v28 + 1) = v30;
  v28[64] = 0;
  int v32 = std::string::append((std::string *)__dst, "(?=-*)(?!\\.json)", 0x10uLL);
  long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
  __p[0].__end_cap_.__value_ = (std::sub_match<const char *> *)v32->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p[0].__begin_ = v33;
  v32->__r_.__value_.__l.__size_ = 0;
  v32->__r_.__value_.__r.__words[2] = 0;
  v32->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v215, (uint64_t)__p, 0);
  if ((SHIBYTE(__p[0].__end_cap_.__value_) & 0x80000000) == 0)
  {
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_31;
    }
LABEL_36:
    operator delete(*(void **)__dst);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_37;
  }
  operator delete(__p[0].__begin_);
  if ((__dst[23] & 0x80000000) != 0) {
    goto LABEL_36;
  }
LABEL_31:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
LABEL_32:
    std::string v214 = *(std::string *)a1;
    goto LABEL_38;
  }
LABEL_37:
  std::string::__init_copy_ctor_external(&v214, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
LABEL_38:
  std::locale::locale(&v208, (const std::locale *)v219);
  long long v209 = *(_OWORD *)&v219[8];
  long long v210 = *(_OWORD *)&v219[24];
  uint64_t v211 = *(void *)&v219[40];
  v212 = (std::__shared_weak_count *)v220;
  if ((void)v220) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v220 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v213 = *((void *)&v220 + 1);
  support::fs::getFilteredFiles((const char *)&v214, (uint64_t)&v208, (uint64_t)&v224, 0);
  int v34 = v212;
  if (v212 && !atomic_fetch_add(&v212->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
    std::locale::~locale(&v208);
    if ((SHIBYTE(v214.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_43:
      int v36 = (std::sub_match<const char *> *)v224;
      uint64_t v35 = v225;
      if (v224 == v225) {
        goto LABEL_231;
      }
      goto LABEL_47;
    }
  }
  else
  {
    std::locale::~locale(&v208);
    if ((SHIBYTE(v214.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_43;
    }
  }
  operator delete(v214.__r_.__value_.__l.__data_);
  int v36 = (std::sub_match<const char *> *)v224;
  uint64_t v35 = v225;
  if (v224 == v225) {
    goto LABEL_231;
  }
LABEL_47:
  uint64_t v37 = &__dst[48];
  int64_t v38 = &v233;
  p_end_cap = &__p[1].__end_cap_;
  v205 = &v228;
  v203 = (std::sub_match<const char *> *)&v222;
  v204 = v229;
  v198 = (uint64_t *)&__dst[24];
  v201 = &__dst[48];
  v202 = v35;
  v199 = &__p[1].__end_cap_;
  v200 = &v233;
  while (2)
  {
    *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v233 = v40;
    long long v234 = v40;
    *(_OWORD *)&__dst[40] = v40;
    long long v232 = v40;
    *(void *)uint64_t v37 = 0;
    *((void *)v37 + 1) = 0;
    v37[16] = 0;
    *(void *)int64_t v38 = 0;
    *((void *)v38 + 1) = 0;
    *((unsigned char *)v38 + 16) = 0;
    BYTE8(v234) = 0;
    uint64_t v235 = 0;
    memset(__dst, 0, 41);
    *(_OWORD *)&p_end_cap[4].__value_ = v40;
    *(_OWORD *)&p_end_cap[6].__value_ = v40;
    *(_OWORD *)&p_end_cap->__value_ = v40;
    *(_OWORD *)&p_end_cap[2].__value_ = v40;
    int v41 = v205;
    uint64_t *v205 = 0;
    v41[1] = 0;
    *((unsigned char *)v41 + 16) = 0;
    int v42 = v204;
    void *v204 = 0;
    v42[1] = 0;
    *((unsigned char *)v42 + 16) = 0;
    v229[24] = 0;
    uint64_t v230 = 0;
    memset(__p, 0, 41);
    second = (const char *)*((unsigned __int8 *)&v36->matched + 7);
    if ((char)second >= 0) {
      first = v36;
    }
    else {
      first = (std::sub_match<const char *> *)v36->first;
    }
    if ((char)second < 0) {
      second = v36->second;
    }
    int v45 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v215, first, (std::sub_match<const char *> *)&second[(void)first], __p, 0);
    uint64_t v46 = (const char *)*((unsigned __int8 *)&v36->matched + 7);
    if ((char)v46 >= 0) {
      uint64_t v47 = (uint64_t)v36;
    }
    else {
      uint64_t v47 = (uint64_t)v36->first;
    }
    if ((char)v46 < 0) {
      uint64_t v46 = v36->second;
    }
    std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)__dst, v47, (std::sub_match<std::__wrap_iter<const char *>> *)&v46[v47], (uint64_t *)__p, 0);
    if (__p[0].__begin_)
    {
      __p[0].__end_ = __p[0].__begin_;
      operator delete(__p[0].__begin_);
    }
    unint64_t v48 = *(void **)__dst;
    if (!v45) {
      goto LABEL_229;
    }
    if (*(void *)&__dst[8] == *(void *)__dst) {
      std::string v49 = &__dst[40];
    }
    else {
      std::string v49 = (unsigned char *)(*(void *)__dst + 16);
    }
    if (!*v49)
    {
      long long v62 = 0;
      std::string v63 = 0;
      unint64_t v64 = 0;
      v206[0] = 0;
      v206[1] = 0;
      unint64_t v207 = 0;
      goto LABEL_87;
    }
    unint64_t v50 = v198;
    if (*(void *)&__dst[8] != *(void *)__dst) {
      unint64_t v50 = *(uint64_t **)__dst;
    }
    uint64_t v51 = *v50;
    uint64_t v52 = (char **)(*(void *)__dst + 8);
    if (*(void *)&__dst[8] == *(void *)__dst) {
      uint64_t v52 = (char **)&__dst[32];
    }
    uint64_t v53 = *v52;
    unint64_t v54 = (unint64_t)&(*v52)[-v51];
    if (v54 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v54 > 0x16)
    {
      uint64_t v65 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v54 | 7) != 0x17) {
        uint64_t v65 = v54 | 7;
      }
      uint64_t v66 = v65 + 1;
      unint64_t v55 = operator new(v65 + 1);
      v206[1] = (void *)v54;
      unint64_t v207 = v66 | 0x8000000000000000;
      v206[0] = v55;
      if ((char *)v51 != v53) {
        goto LABEL_73;
      }
LABEL_83:
      unint64_t v56 = v55;
      goto LABEL_86;
    }
    HIBYTE(v207) = *(unsigned char *)v52 - v51;
    unint64_t v55 = v206;
    if ((char *)v51 == v53) {
      goto LABEL_83;
    }
LABEL_73:
    if (v54 < 0x20 || (unint64_t)v55 - v51 < 0x20)
    {
      unint64_t v56 = v55;
      long long v57 = (char *)v51;
    }
    else
    {
      unint64_t v56 = (char *)v55 + (v54 & 0xFFFFFFFFFFFFFFE0);
      long long v57 = (char *)(v51 + (v54 & 0xFFFFFFFFFFFFFFE0));
      int64_t v58 = (long long *)(v51 + 16);
      int64_t v59 = v55 + 1;
      unint64_t v60 = v54 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v61 = *v58;
        *(v59 - 1) = *(v58 - 1);
        *int64_t v59 = v61;
        v58 += 2;
        v59 += 2;
        v60 -= 32;
      }
      while (v60);
      if (v54 == (v54 & 0x7FFFFFFFFFFFFFE0)) {
        goto LABEL_86;
      }
    }
    do
    {
      char v67 = *v57++;
      *v56++ = v67;
    }
    while (v57 != v53);
LABEL_86:
    *unint64_t v56 = 0;
    unint64_t v64 = HIBYTE(v207);
    std::string v63 = (void **)v206[0];
    long long v62 = v206[1];
LABEL_87:
    if ((v64 & 0x80u) == 0) {
      unint64_t v68 = v206;
    }
    else {
      unint64_t v68 = v63;
    }
    if ((v64 & 0x80u) == 0) {
      unint64_t v69 = v64;
    }
    else {
      unint64_t v69 = (unint64_t)v62;
    }
    if (v69 > 0x20)
    {
      if (v69 <= 0x40)
      {
        if ((v64 & 0x80u) == 0) {
          std::string v63 = v206;
        }
        long long v73 = (char *)v63[3];
        uint64_t v74 = *(uint64_t *)((char *)v68 + v69 - 16);
        uint64_t v75 = (uint64_t)*v68 - 0x3C5A37A36834CED9 * v74 + 0xC3A5C85C97CB3127 * v69;
        uint64_t v76 = __ROR8__(&v73[v75], 52);
        size_t v78 = (char *)v63[1];
        char v77 = (char *)v63[2];
        long long v79 = &v78[v75];
        uint64_t v80 = __ROR8__(v79, 7);
        uint64_t v81 = &v77[(void)v79];
        uint64_t v82 = v80
            + __ROR8__((char *)*v68 - 0x3C5A37A36834CED9 * v74 + 0xC3A5C85C97CB3127 * v69, 37)
            + v76
            + __ROR8__(v81, 31);
        size_t v83 = &v77[*(void *)((char *)v68 + v69 - 32)];
        unint64_t v84 = &v73[*(void *)((char *)v68 + v69 - 8)];
        uint64_t v85 = __ROR8__(&v83[(void)v84], 52);
        uint64_t v86 = __ROR8__(v83, 37);
        char v87 = &v83[*(void *)((char *)v68 + v69 - 24)];
        uint64_t v88 = __ROR8__(v87, 7);
        uint64_t v89 = &v87[v74];
        size_t v90 = &v84[(void)v89];
        BOOL v91 = &v73[v86 + v88 + v85 + __ROR8__(v89, 31) + (void)v81];
        unint64_t v92 = 0x9AE16A3B2F90404FLL;
        unint64_t v93 = v82
            - 0x3C5A37A36834CED9
            * ((0xC3A5C85C97CB3127 * (void)&v90[v82] - 0x651E95C4D06FBFB1 * (void)v91) ^ ((0xC3A5C85C97CB3127
                                                                                                 * (unint64_t)&v90[v82]
                                                                                                 - 0x651E95C4D06FBFB1
                                                                                                 * (void)v91) >> 47));
        goto LABEL_105;
      }
      uint64_t v100 = *(uint64_t *)((char *)v68 + v69 - 48);
      uint64_t v101 = *(uint64_t *)((char *)v68 + v69 - 40);
      uint64_t v102 = *(uint64_t *)((char *)v68 + v69 - 24);
      uint64_t v103 = *(uint64_t *)((char *)v68 + v69 - 56);
      uint64_t v104 = *(uint64_t *)((char *)v68 + v69 - 16);
      uint64_t v105 = *(uint64_t *)((char *)v68 + v69 - 8);
      unint64_t v106 = v103 + v104;
      unint64_t v107 = 0x9DDFEA08EB382D69
           * (v102 ^ ((0x9DDFEA08EB382D69 * (v102 ^ (v100 + v69))) >> 47) ^ (0x9DDFEA08EB382D69
                                                                             * (v102 ^ (v100 + v69))));
      unint64_t v108 = 0x9DDFEA08EB382D69 * (v107 ^ (v107 >> 47));
      std::string::size_type v109 = *(char **)((char *)v68 + v69 - 64) + v69;
      uint64_t v110 = &v109[v100 + v103];
      std::string v111 = &v110[v101];
      uint64_t v112 = (uint64_t)&v109[__ROR8__(v110, 44) + __ROR8__(&v109[v101 + v108], 21)];
      uint64_t v113 = *(uint64_t *)((char *)v68 + v69 - 32) + v103 + v104 - 0x4B6D499041670D8DLL;
      uint64_t v114 = v102 + v104 + v113;
      uint64_t v115 = v114 + v105;
      uint64_t v116 = __ROR8__(v114, 44) + v113 + __ROR8__(v113 + v101 + v105, 21);
      uint64_t v117 = v68 + 4;
      uint64_t v118 = (uint64_t)*v68 - 0x4B6D499041670D8DLL * v101;
      uint64_t v119 = -(uint64_t)((v69 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v120 = *(v117 - 3);
        long long v121 = &v111[v118 + v106 + v120];
        uint64_t v122 = v117[2];
        uint64_t v123 = v117[3];
        uint64_t v124 = v117[1];
        unint64_t v106 = (unint64_t)&v111[v124 + 0xB492B66FBE98F273 * __ROR8__(v106 + v112 + v122, 42)];
        uint64_t v125 = v108 + v115;
        uint64_t v126 = *(v117 - 2);
        uint64_t v127 = *(v117 - 1);
        uint64_t v128 = *(v117 - 4) - 0x4B6D499041670D8DLL * v112;
        uint64_t v129 = v128 + v115 + v127;
        uint64_t v130 = v128 + v120 + v126;
        std::string v111 = (char *)(v130 + v127);
        uint64_t v131 = __ROR8__(v130, 44) + v128;
        unint64_t v132 = (0xB492B66FBE98F273 * __ROR8__(v121, 37)) ^ v116;
        uint64_t v118 = 0xB492B66FBE98F273 * __ROR8__(v125, 33);
        uint64_t v112 = v131 + __ROR8__(v129 + v132, 21);
        uint64_t v133 = v118 + v116 + *v117;
        uint64_t v115 = v124 + v122 + v133 + v123;
        uint64_t v116 = __ROR8__(v124 + v122 + v133, 44) + v133 + __ROR8__(v106 + v126 + v133 + v123, 21);
        v117 += 8;
        unint64_t v108 = v132;
        v119 += 64;
      }
      while (v119);
      unint64_t v134 = 0x9DDFEA08EB382D69
           * (v116 ^ ((0x9DDFEA08EB382D69 * (v116 ^ v112)) >> 47) ^ (0x9DDFEA08EB382D69 * (v116 ^ v112)));
      unint64_t v135 = v118 - 0x622015F714C7D297 * (v134 ^ (v134 >> 47));
      unint64_t v136 = 0x9DDFEA08EB382D69
           * (v135 ^ (v132
                    - 0x4B6D499041670D8DLL * (v106 ^ (v106 >> 47))
                    - 0x622015F714C7D297
                    * ((0x9DDFEA08EB382D69
                      * (v115 ^ ((0x9DDFEA08EB382D69 * (v115 ^ (unint64_t)v111)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                                  * (v115 ^ (unint64_t)v111)))) ^ ((0x9DDFEA08EB382D69 * (v115 ^ ((0x9DDFEA08EB382D69 * (v115 ^ (unint64_t)v111)) >> 47) ^ (0x9DDFEA08EB382D69 * (v115 ^ (unint64_t)v111)))) >> 47))));
      unint64_t v72 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v135 ^ (v136 >> 47) ^ v136)) ^ ((0x9DDFEA08EB382D69
                                                                     * (v135 ^ (v136 >> 47) ^ v136)) >> 47));
    }
    else
    {
      if (v69 > 0x10)
      {
        unint64_t v94 = 0xB492B66FBE98F273 * (void)*v68;
        if ((v64 & 0x80u) == 0) {
          std::string v63 = v206;
        }
        unint64_t v95 = (unint64_t)v63[1];
        uint64_t v96 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)v68 + v69 - 8), 30)
            + __ROR8__(v94 - v95, 43)
            - 0x3C5A37A36834CED9 * *(void *)((char *)v68 + v69 - 16);
        unint64_t v97 = v94
            + v69
            + __ROR8__(v95 ^ 0xC949D7C7509E6557, 20)
            - 0x9AE16A3B2F90404FLL * *(void *)((char *)v68 + v69 - 8);
        unint64_t v98 = v96 ^ v97;
        unint64_t v92 = 0x9DDFEA08EB382D69;
        unint64_t v99 = v97 ^ ((0x9DDFEA08EB382D69 * v98) >> 47) ^ (0x9DDFEA08EB382D69 * v98);
        goto LABEL_104;
      }
      if (v69 >= 9)
      {
        uint64_t v70 = *(uint64_t *)((char *)v68 + v69 - 8);
        uint64_t v71 = __ROR8__(v70 + v69, v69);
        unint64_t v72 = (0x9DDFEA08EB382D69
             * ((0x9DDFEA08EB382D69
               * (v71 ^ ((0x9DDFEA08EB382D69 * (v71 ^ (unint64_t)*v68)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                         * (v71 ^ (unint64_t)*v68)))) ^ ((0x9DDFEA08EB382D69 * (v71 ^ ((0x9DDFEA08EB382D69 * (v71 ^ (unint64_t)*v68)) >> 47) ^ (0x9DDFEA08EB382D69 * (v71 ^ (unint64_t)*v68)))) >> 47))) ^ v70;
        goto LABEL_109;
      }
      if (v69 >= 4)
      {
        uint64_t v176 = *(unsigned int *)((char *)v68 + v69 - 4);
        unint64_t v92 = 0x9DDFEA08EB382D69;
        unint64_t v177 = 0x9DDFEA08EB382D69 * ((v69 + (8 * *(_DWORD *)v68)) ^ v176);
        unint64_t v99 = v176 ^ (v177 >> 47) ^ v177;
LABEL_104:
        unint64_t v93 = 0x9DDFEA08EB382D69 * v99;
LABEL_105:
        unint64_t v72 = (v93 ^ (v93 >> 47)) * v92;
        goto LABEL_109;
      }
      unint64_t v72 = 0x9AE16A3B2F90404FLL;
      if (v69)
      {
        unint64_t v179 = (0xC949D7C7509E6557 * (v69 + 4 * *((unsigned __int8 *)v68 + v69 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                           * (*(unsigned __int8 *)v68 | ((unint64_t)*((unsigned __int8 *)v68 + (v69 >> 1)) << 8)));
        unint64_t v72 = 0x9AE16A3B2F90404FLL * (v179 ^ (v179 >> 47));
      }
    }
LABEL_109:
    unint64_t v137 = *((void *)&v221 + 1);
    if (!*((void *)&v221 + 1))
    {
      unint64_t v139 = 0xAAAAAAAAAAAAAAAALL;
LABEL_152:
      __p[0].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAA01;
      v157 = (std::sub_match<const char *> *)operator new(0x28uLL);
      __p[0].__begin_ = v157;
      __p[0].__end_ = v203;
      v157->first = 0;
      v157->second = (const char *)v72;
      *(_OWORD *)&v157->matched = *(_OWORD *)v206;
      v157[1].second = (const char *)v207;
      v206[0] = 0;
      v206[1] = 0;
      unint64_t v207 = 0;
      float v158 = (float)(unint64_t)(*((void *)&v222 + 1) + 1);
      if (v137 && (float)(*(float *)&v223 * (float)v137) >= v158)
      {
        unint64_t v72 = v139;
        uint64_t v37 = v201;
        uint64_t v35 = v202;
        goto LABEL_217;
      }
      BOOL v159 = (v137 & (v137 - 1)) != 0;
      if (v137 < 3) {
        BOOL v159 = 1;
      }
      unint64_t v160 = v159 | (2 * v137);
      unint64_t v161 = vcvtps_u32_f32(v158 / *(float *)&v223);
      if (v160 <= v161) {
        size_t prime = v161;
      }
      else {
        size_t prime = v160;
      }
      if (prime == 1)
      {
        size_t prime = 2;
        uint64_t v37 = v201;
        uint64_t v35 = v202;
      }
      else
      {
        uint64_t v37 = v201;
        uint64_t v35 = v202;
        if ((prime & (prime - 1)) != 0)
        {
          size_t prime = std::__next_prime(prime);
          unint64_t v137 = *((void *)&v221 + 1);
        }
      }
      if (prime <= v137)
      {
        if (prime >= v137) {
          goto LABEL_205;
        }
        unint64_t v173 = vcvtps_u32_f32((float)*((unint64_t *)&v222 + 1) / *(float *)&v223);
        if (v137 < 3 || (uint8x8_t v174 = (uint8x8_t)vcnt_s8((int8x8_t)v137), v174.i16[0] = vaddlv_u8(v174), v174.u32[0] > 1uLL))
        {
          unint64_t v173 = std::__next_prime(v173);
        }
        else
        {
          uint64_t v175 = 1 << -(char)__clz(v173 - 1);
          if (v173 >= 2) {
            unint64_t v173 = v175;
          }
        }
        if (prime <= v173) {
          size_t prime = v173;
        }
        if (prime >= v137)
        {
          unint64_t v137 = *((void *)&v221 + 1);
          uint64_t v181 = *((void *)&v221 + 1) - 1;
          if ((*((void *)&v221 + 1) & (*((void *)&v221 + 1) - 1)) != 0)
          {
LABEL_215:
            if (v72 >= v137) {
              v72 %= v137;
            }
LABEL_217:
            uint64_t v184 = v221;
            v185 = *(std::sub_match<const char *> ***)(v221 + 8 * v72);
            if (v185)
            {
              v157->first = (const char *)*v185;
            }
            else
            {
              v157->first = (const char *)v222;
              *(void *)&long long v222 = v157;
              *(void *)(v184 + 8 * v72) = v203;
              if (!v157->first) {
                goto LABEL_226;
              }
              unint64_t v186 = *((void *)v157->first + 1);
              if ((v137 & (v137 - 1)) != 0)
              {
                if (v186 >= v137) {
                  v186 %= v137;
                }
              }
              else
              {
                v186 &= v137 - 1;
              }
              v185 = (std::sub_match<const char *> **)(v221 + 8 * v186);
            }
            *v185 = v157;
LABEL_226:
            ++*((void *)&v222 + 1);
            if ((v207 & 0x8000000000000000) != 0) {
              goto LABEL_227;
            }
            goto LABEL_228;
          }
LABEL_206:
          v72 &= v181;
          goto LABEL_217;
        }
        if (!prime)
        {
          v180 = (void *)v221;
          *(void *)&long long v221 = 0;
          if (v180) {
            operator delete(v180);
          }
          unint64_t v137 = 0;
          *((void *)&v221 + 1) = 0;
          uint64_t v181 = -1;
          goto LABEL_206;
        }
      }
      if (prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v163 = operator new(8 * prime);
      v164 = (void *)v221;
      *(void *)&long long v221 = v163;
      if (v164) {
        operator delete(v164);
      }
      uint64_t v165 = 0;
      *((void *)&v221 + 1) = prime;
      do
        *(void *)(v221 + 8 * v165++) = 0;
      while (prime != v165);
      v166 = (void **)v222;
      if (!(void)v222)
      {
LABEL_214:
        unint64_t v137 = prime;
        uint64_t v181 = prime - 1;
        if ((prime & (prime - 1)) != 0) {
          goto LABEL_215;
        }
        goto LABEL_206;
      }
      size_t v167 = *(void *)(v222 + 8);
      size_t v168 = prime - 1;
      if ((prime & (prime - 1)) == 0)
      {
        size_t v169 = v167 & v168;
        *(void *)(v221 + 8 * v169) = v203;
        for (std::__wrap_iter<const char *>::iterator_type i = *v166; *v166; std::__wrap_iter<const char *>::iterator_type i = *v166)
        {
          size_t v171 = i[1] & v168;
          if (v171 == v169)
          {
            v166 = (void **)i;
          }
          else if (*(void *)(v221 + 8 * v171))
          {
            *v166 = (void *)*i;
            uint64_t v172 = 8 * v171;
            *std::__wrap_iter<const char *>::iterator_type i = **(void **)(v221 + v172);
            **(void **)(v221 + v172) = i;
          }
          else
          {
            *(void *)(v221 + 8 * v171) = v166;
            v166 = (void **)i;
            size_t v169 = v171;
          }
        }
        goto LABEL_214;
      }
      if (v167 < prime)
      {
        *(void *)(v221 + 8 * v167) = v203;
        v178 = *v166;
        if (*v166) {
          goto LABEL_209;
        }
        goto LABEL_204;
      }
      v167 %= prime;
      *(void *)(v221 + 8 * v167) = v203;
      v178 = *v166;
      if (!*v166)
      {
LABEL_204:
        unint64_t v137 = prime;
LABEL_205:
        uint64_t v181 = v137 - 1;
        if ((v137 & (v137 - 1)) != 0) {
          goto LABEL_215;
        }
        goto LABEL_206;
      }
      while (1)
      {
LABEL_209:
        size_t v183 = v178[1];
        if (v183 >= prime) {
          v183 %= prime;
        }
        if (v183 == v167) {
          goto LABEL_208;
        }
        if (*(void *)(v221 + 8 * v183))
        {
          *v166 = (void *)*v178;
          uint64_t v182 = 8 * v183;
          void *v178 = **(void **)(v221 + v182);
          **(void **)(v221 + v182) = v178;
          v178 = v166;
LABEL_208:
          v166 = (void **)v178;
          v178 = (void *)*v178;
          if (!v178) {
            goto LABEL_214;
          }
        }
        else
        {
          *(void *)(v221 + 8 * v183) = v166;
          v166 = (void **)v178;
          v178 = (void *)*v178;
          size_t v167 = v183;
          if (!v178) {
            goto LABEL_214;
          }
        }
      }
    }
    uint8x8_t v138 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v221 + 8));
    v138.i16[0] = vaddlv_u8(v138);
    if (v138.u32[0] > 1uLL)
    {
      unint64_t v139 = v72;
      if (v72 >= *((void *)&v221 + 1)) {
        unint64_t v139 = v72 % *((void *)&v221 + 1);
      }
    }
    else
    {
      unint64_t v139 = (*((void *)&v221 + 1) - 1) & v72;
    }
    uint64_t v140 = *(uint64_t ***)(v221 + 8 * v139);
    if (!v140) {
      goto LABEL_152;
    }
    v141 = *v140;
    if (!*v140) {
      goto LABEL_152;
    }
    if (v138.u32[0] < 2uLL)
    {
      uint64_t v142 = *((void *)&v221 + 1) - 1;
      while (1)
      {
        uint64_t v148 = v141[1];
        if (v148 == v72)
        {
          uint64_t v149 = *((unsigned __int8 *)v141 + 39);
          if ((v149 & 0x80u) == 0) {
            uint64_t v150 = *((unsigned __int8 *)v141 + 39);
          }
          else {
            uint64_t v150 = v141[3];
          }
          if (v150 == v69)
          {
            v151 = (const void **)(v141 + 2);
            if ((v149 & 0x80) != 0)
            {
              v153 = v68;
              v154 = v68;
              uint64_t v155 = v142;
              int v156 = memcmp(*v151, v153, v141[3]);
              uint64_t v142 = v155;
              unint64_t v68 = v154;
              if (!v156) {
                goto LABEL_150;
              }
            }
            else
            {
              if (!*((unsigned char *)v141 + 39)) {
                goto LABEL_150;
              }
              v152 = v68;
              while (*(unsigned __int8 *)v151 == *(unsigned __int8 *)v152)
              {
                v151 = (const void **)((char *)v151 + 1);
                v152 = (void **)((char *)v152 + 1);
                if (!--v149) {
                  goto LABEL_150;
                }
              }
            }
          }
        }
        else if ((v148 & v142) != v139)
        {
          goto LABEL_152;
        }
        v141 = (uint64_t *)*v141;
        if (!v141) {
          goto LABEL_152;
        }
      }
    }
    while (1)
    {
      unint64_t v143 = v141[1];
      if (v143 == v72) {
        break;
      }
      if (v143 >= v137) {
        v143 %= v137;
      }
      if (v143 != v139) {
        goto LABEL_152;
      }
LABEL_120:
      v141 = (uint64_t *)*v141;
      if (!v141) {
        goto LABEL_152;
      }
    }
    uint64_t v144 = *((unsigned __int8 *)v141 + 39);
    if ((v144 & 0x80u) == 0) {
      uint64_t v145 = *((unsigned __int8 *)v141 + 39);
    }
    else {
      uint64_t v145 = v141[3];
    }
    if (v145 != v69) {
      goto LABEL_120;
    }
    uint64_t v146 = (const void **)(v141 + 2);
    if ((v144 & 0x80) == 0)
    {
      if (!*((unsigned char *)v141 + 39)) {
        goto LABEL_150;
      }
      uint64_t v147 = v68;
      while (*(unsigned __int8 *)v146 == *(unsigned __int8 *)v147)
      {
        uint64_t v146 = (const void **)((char *)v146 + 1);
        uint64_t v147 = (void **)((char *)v147 + 1);
        if (!--v144) {
          goto LABEL_150;
        }
      }
      goto LABEL_120;
    }
    if (memcmp(*v146, v68, v141[3])) {
      goto LABEL_120;
    }
LABEL_150:
    uint64_t v37 = v201;
    uint64_t v35 = v202;
    if ((v64 & 0x80) != 0) {
LABEL_227:
    }
      operator delete(v206[0]);
LABEL_228:
    unint64_t v48 = *(void **)__dst;
    p_end_cap = v199;
    int64_t v38 = v200;
LABEL_229:
    if (v48)
    {
      *(void *)&__dst[8] = v48;
      operator delete(v48);
    }
    if (++v36 != v35) {
      continue;
    }
    break;
  }
LABEL_231:
  uint64_t v187 = *((void *)&v222 + 1);
  v188 = (std::__shared_weak_count *)v218;
  if ((void)v218 && !atomic_fetch_add((atomic_ullong *volatile)(v218 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v188->__on_zero_shared)(v188);
    std::__shared_weak_count::__release_weak(v188);
  }
  std::locale::~locale(v215);
  v189 = (std::__shared_weak_count *)v220;
  if ((void)v220 && !atomic_fetch_add((atomic_ullong *volatile)(v220 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v189->__on_zero_shared)(v189);
    std::__shared_weak_count::__release_weak(v189);
  }
  std::locale::~locale((std::locale *)v219);
  operator delete(v197);
  v190 = (void **)v222;
  if ((void)v222)
  {
    do
    {
      v196 = (void **)*v190;
      if (*((char *)v190 + 39) < 0) {
        operator delete(v190[2]);
      }
      operator delete(v190);
      v190 = v196;
    }
    while (v196);
  }
  v191 = (void *)v221;
  *(void *)&long long v221 = 0;
  if (v191) {
    operator delete(v191);
  }
  v192 = (void **)v224;
  if (v224)
  {
    v193 = (void **)v225;
    v194 = v224;
    if (v225 != v224)
    {
      do
      {
        if (*((char *)v193 - 1) < 0) {
          operator delete(*(v193 - 3));
        }
        v193 -= 3;
      }
      while (v193 != v192);
      v194 = v224;
    }
    v225 = (std::sub_match<const char *> *)v192;
    operator delete(v194);
  }
  return v187;
}

void sub_263673804(_Unwind_Exception *a1)
{
  operator delete(v2);
  std::unordered_set<std::string>::~unordered_set[abi:ne180100](&v3);
  std::vector<std::string>::~vector[abi:ne180100](&v4);
  _Unwind_Resume(a1);
}

void sub_26367380C()
{
}

void sub_263673834(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::unordered_set<std::string>::~unordered_set[abi:ne180100](uint64_t a1)
{
  long long v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v5 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      long long v2 = v5;
    }
    while (v5);
  }
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

uint64_t util::compareTwoStringsWithPattern(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v87 = 0xAAAAAAAAAAAAAA00;
  v84[1].__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)0xAAAAAAAAAAAAAAAALL;
  long long v90 = v5;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  uint64_t v88 = 0;
  uint64_t v89 = 0;
  LOBYTE(v90) = 0;
  BYTE8(v90) = 0;
  uint64_t v91 = 0;
  memset(v84, 0, 41);
  long long v82 = v5;
  long long v83 = v5;
  *(_OWORD *)&v80[0].__locale_ = v5;
  long long v81 = v5;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v80, a3, 0);
  char v77 = 0;
  size_t v78 = 0;
  unint64_t v79 = 0;
  tm __p = 0;
  uint64_t v75 = 0;
  unint64_t v76 = 0;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v95 = 0xAAAAAAAAAAAAAA00;
  v92[1].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAAAALL;
  long long v98 = v6;
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  LOBYTE(v98) = 0;
  BYTE8(v98) = 0;
  uint64_t v99 = 0;
  memset(v92, 0, 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 23);
  if ((v7 & 0x80u) == 0) {
    size_t v8 = (std::sub_match<const char *> *)a1;
  }
  else {
    size_t v8 = *(std::sub_match<const char *> **)a1;
  }
  if ((v7 & 0x80u) != 0) {
    uint64_t v7 = *(void *)(a1 + 8);
  }
  *(_OWORD *)((char *)&v92[1].__begin_ + 1) = 0uLL;
  int v9 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v80, v8, (std::sub_match<const char *> *)((char *)v8 + v7), v92, 0);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 23);
  if ((v10 & 0x80u) == 0) {
    uint64_t v11 = a1;
  }
  else {
    uint64_t v11 = *(void *)a1;
  }
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = *(void *)(a1 + 8);
  }
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v84, v11, (std::sub_match<std::__wrap_iter<const char *>> *)(v11 + v10), (uint64_t *)v92, 0);
  if (v92[0].__begin_)
  {
    v92[0].__end_ = v92[0].__begin_;
    operator delete(v92[0].__begin_);
  }
  if (v9)
  {
    std::vector<std::ssub_match>::pointer end = v84[0].__end_;
    std::vector<std::ssub_match>::pointer begin = v84[0].__begin_;
    if (v84[0].__begin_ != v84[0].__end_)
    {
      while (1)
      {
        if (!begin->matched)
        {
          memset(v92, 0, 24);
          uint64_t v25 = v78;
          if ((unint64_t)v78 >= v79) {
            goto LABEL_38;
          }
          goto LABEL_16;
        }
        std::__wrap_iter<const char *>::iterator_type i = begin->first.__i_;
        std::__wrap_iter<const char *>::iterator_type v15 = begin->second.__i_;
        unint64_t v17 = v15 - begin->first.__i_;
        if (v17 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v17 > 0x16)
        {
          uint64_t v26 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v17 | 7) != 0x17) {
            uint64_t v26 = v17 | 7;
          }
          uint64_t v27 = v26 + 1;
          long long v18 = (std::sub_match<const char *> *)operator new(v26 + 1);
          v92[0].__end_ = (std::vector<std::csub_match>::pointer)v17;
          v92[0].__end_cap_.__value_ = (std::sub_match<const char *> *)(v27 | 0x8000000000000000);
          v92[0].__begin_ = v18;
          if (i == v15)
          {
LABEL_33:
            LOBYTE(v18->first) = 0;
            uint64_t v25 = v78;
            if ((unint64_t)v78 >= v79) {
              goto LABEL_38;
            }
            goto LABEL_16;
          }
        }
        else
        {
          HIBYTE(v92[0].__end_cap_.__value_) = (_BYTE)v15 - LOBYTE(begin->first.__i_);
          long long v18 = (std::sub_match<const char *> *)v92;
          if (i == v15) {
            goto LABEL_33;
          }
        }
        if (v17 < 0x20 || (unint64_t)((char *)v18 - i) < 0x20) {
          break;
        }
        long long v19 = (std::sub_match<const char *> *)((char *)v18 + (v17 & 0xFFFFFFFFFFFFFFE0));
        long long v20 = &i[v17 & 0xFFFFFFFFFFFFFFE0];
        int v21 = (long long *)(i + 16);
        p_matched = &v18->matched;
        unint64_t v23 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v24 = *v21;
          *((_OWORD *)p_matched - 1) = *(v21 - 1);
          *(_OWORD *)p_matched = v24;
          v21 += 2;
          p_matched += 32;
          v23 -= 32;
        }
        while (v23);
        if (v17 != (v17 & 0x7FFFFFFFFFFFFFE0)) {
          goto LABEL_36;
        }
LABEL_37:
        LOBYTE(v19->first) = 0;
        uint64_t v25 = v78;
        if ((unint64_t)v78 >= v79)
        {
LABEL_38:
          size_t v78 = std::vector<std::string>::__push_back_slow_path<std::string>(&v77, (uint64_t)v92);
          if (SHIBYTE(v92[0].__end_cap_.__value_) < 0) {
            operator delete(v92[0].__begin_);
          }
          goto LABEL_17;
        }
LABEL_16:
        long long v14 = *(_OWORD *)&v92[0].__begin_;
        *((void *)v25 + 2) = v92[0].__end_cap_.__value_;
        *(_OWORD *)uint64_t v25 = v14;
        size_t v78 = v25 + 24;
LABEL_17:
        if (++begin == end) {
          goto LABEL_40;
        }
      }
      long long v19 = v18;
      long long v20 = i;
      do
      {
LABEL_36:
        char v28 = *v20++;
        LOBYTE(v19->first) = v28;
        long long v19 = (std::sub_match<const char *> *)((char *)v19 + 1);
      }
      while (v20 != v15);
      goto LABEL_37;
    }
LABEL_40:
    long long v29 = (char *)v77;
    long long v30 = v78;
    if (v78 - (unsigned char *)v77 != 24)
    {
      if ((char *)v77 + 24 != v78)
      {
        long long v31 = (char *)v77 + 23;
        do
        {
          int v32 = (void **)(v31 - 23);
          if (*v31 < 0) {
            operator delete(*v32);
          }
          *(_OWORD *)int v32 = *(_OWORD *)(v31 + 1);
          *(void *)(v31 - 7) = *(void *)(v31 + 17);
          v31[24] = 0;
          v31 += 24;
          *(v31 - 23) = 0;
          v29 += 24;
        }
        while (v31 + 1 != v30);
        long long v30 = v78;
      }
      while (v30 != v29)
      {
        if (*(v30 - 1) < 0) {
          operator delete(*((void **)v30 - 3));
        }
        v30 -= 24;
      }
      size_t v78 = v29;
    }
    *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v95 = 0xAAAAAAAAAAAAAA00;
    v92[1].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAAAALL;
    long long v98 = v33;
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    uint64_t v96 = 0;
    uint64_t v97 = 0;
    LOBYTE(v98) = 0;
    BYTE8(v98) = 0;
    uint64_t v99 = 0;
    memset(v92, 0, 32);
    uint64_t v34 = *(unsigned __int8 *)(a2 + 23);
    if ((v34 & 0x80u) == 0) {
      uint64_t v35 = (std::sub_match<const char *> *)a2;
    }
    else {
      uint64_t v35 = *(std::sub_match<const char *> **)a2;
    }
    if ((v34 & 0x80u) != 0) {
      uint64_t v34 = *(void *)(a2 + 8);
    }
    *(_OWORD *)((char *)&v92[1].__begin_ + 1) = 0uLL;
    int v36 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v80, v35, (std::sub_match<const char *> *)((char *)v35 + v34), v92, 0);
    uint64_t v37 = *(unsigned __int8 *)(a2 + 23);
    if ((v37 & 0x80u) == 0) {
      uint64_t v38 = a2;
    }
    else {
      uint64_t v38 = *(void *)a2;
    }
    if ((v37 & 0x80u) != 0) {
      uint64_t v37 = *(void *)(a2 + 8);
    }
    std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v84, v38, (std::sub_match<std::__wrap_iter<const char *>> *)(v38 + v37), (uint64_t *)v92, 0);
    if (v92[0].__begin_)
    {
      v92[0].__end_ = v92[0].__begin_;
      operator delete(v92[0].__begin_);
    }
    if (v36)
    {
      std::vector<std::ssub_match>::pointer v40 = v84[0].__end_;
      std::vector<std::ssub_match>::pointer v39 = v84[0].__begin_;
      if (v84[0].__begin_ != v84[0].__end_)
      {
        while (1)
        {
          if (!v39->matched)
          {
            memset(v92, 0, 24);
            uint64_t v52 = v75;
            if ((unint64_t)v75 >= v76) {
              goto LABEL_89;
            }
            goto LABEL_67;
          }
          std::__wrap_iter<const char *>::iterator_type v43 = v39->first.__i_;
          std::__wrap_iter<const char *>::iterator_type v42 = v39->second.__i_;
          unint64_t v44 = v42 - v39->first.__i_;
          if (v44 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v44 > 0x16)
          {
            uint64_t v53 = (v44 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v44 | 7) != 0x17) {
              uint64_t v53 = v44 | 7;
            }
            uint64_t v54 = v53 + 1;
            int v45 = (std::sub_match<const char *> *)operator new(v53 + 1);
            v92[0].__end_ = (std::vector<std::csub_match>::pointer)v44;
            v92[0].__end_cap_.__value_ = (std::sub_match<const char *> *)(v54 | 0x8000000000000000);
            v92[0].__begin_ = v45;
            if (v43 == v42)
            {
LABEL_84:
              LOBYTE(v45->first) = 0;
              uint64_t v52 = v75;
              if ((unint64_t)v75 >= v76) {
                goto LABEL_89;
              }
              goto LABEL_67;
            }
          }
          else
          {
            HIBYTE(v92[0].__end_cap_.__value_) = (_BYTE)v42 - LOBYTE(v39->first.__i_);
            int v45 = (std::sub_match<const char *> *)v92;
            if (v43 == v42) {
              goto LABEL_84;
            }
          }
          if (v44 < 0x20 || (unint64_t)((char *)v45 - v43) < 0x20) {
            break;
          }
          uint64_t v46 = (std::sub_match<const char *> *)((char *)v45 + (v44 & 0xFFFFFFFFFFFFFFE0));
          uint64_t v47 = &v43[v44 & 0xFFFFFFFFFFFFFFE0];
          unint64_t v48 = (long long *)(v43 + 16);
          std::string v49 = &v45->matched;
          unint64_t v50 = v44 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v51 = *v48;
            *((_OWORD *)v49 - 1) = *(v48 - 1);
            *(_OWORD *)std::string v49 = v51;
            v48 += 2;
            v49 += 32;
            v50 -= 32;
          }
          while (v50);
          if (v44 != (v44 & 0x7FFFFFFFFFFFFFE0)) {
            goto LABEL_87;
          }
LABEL_88:
          LOBYTE(v46->first) = 0;
          uint64_t v52 = v75;
          if ((unint64_t)v75 >= v76)
          {
LABEL_89:
            uint64_t v75 = std::vector<std::string>::__push_back_slow_path<std::string>(&__p, (uint64_t)v92);
            if (SHIBYTE(v92[0].__end_cap_.__value_) < 0) {
              operator delete(v92[0].__begin_);
            }
            goto LABEL_68;
          }
LABEL_67:
          long long v41 = *(_OWORD *)&v92[0].__begin_;
          *((void *)v52 + 2) = v92[0].__end_cap_.__value_;
          *(_OWORD *)uint64_t v52 = v41;
          uint64_t v75 = v52 + 24;
LABEL_68:
          if (++v39 == v40) {
            goto LABEL_91;
          }
        }
        uint64_t v46 = v45;
        uint64_t v47 = v43;
        do
        {
LABEL_87:
          char v55 = *v47++;
          LOBYTE(v46->first) = v55;
          uint64_t v46 = (std::sub_match<const char *> *)((char *)v46 + 1);
        }
        while (v47 != v42);
        goto LABEL_88;
      }
LABEL_91:
      long long v57 = (char *)__p;
      unint64_t v56 = v75;
      if (v75 - (unsigned char *)__p == 24)
      {
        int64_t v58 = (char *)v77;
        int64_t v59 = v78;
        uint64_t v60 = 1;
        if (v77 != v78) {
          goto LABEL_117;
        }
LABEL_105:
        if (v57) {
          goto LABEL_106;
        }
LABEL_134:
        unint64_t v64 = (char *)v77;
        if (v77) {
          goto LABEL_135;
        }
        goto LABEL_108;
      }
      if ((char *)__p + 24 != v75)
      {
        long long v61 = (char *)__p + 23;
        do
        {
          long long v62 = (void **)(v61 - 23);
          if (*v61 < 0) {
            operator delete(*v62);
          }
          *(_OWORD *)long long v62 = *(_OWORD *)(v61 + 1);
          *(void *)(v61 - 7) = *(void *)(v61 + 17);
          v61[24] = 0;
          v61 += 24;
          *(v61 - 23) = 0;
          v57 += 24;
        }
        while (v61 + 1 != v56);
        unint64_t v56 = v75;
      }
      while (v56 != v57)
      {
        if (*(v56 - 1) < 0) {
          operator delete(*((void **)v56 - 3));
        }
        v56 -= 24;
      }
      uint64_t v75 = v57;
      long long v57 = (char *)__p;
      int64_t v58 = (char *)v77;
      int64_t v59 = v78;
      uint64_t v60 = 1;
      if (v77 == v78) {
        goto LABEL_105;
      }
      while (1)
      {
LABEL_117:
        uint64_t v66 = v58[23];
        if ((v66 & 0x80u) == 0) {
          uint64_t v67 = v58[23];
        }
        else {
          uint64_t v67 = *((void *)v58 + 1);
        }
        uint64_t v68 = v57[23];
        int v69 = (char)v68;
        if ((v68 & 0x80u) != 0) {
          uint64_t v68 = *((void *)v57 + 1);
        }
        if (v67 != v68) {
          break;
        }
        if (v69 >= 0) {
          uint64_t v70 = v57;
        }
        else {
          uint64_t v70 = *(char **)v57;
        }
        if ((v66 & 0x80) != 0)
        {
          if (memcmp(*(const void **)v58, v70, *((void *)v58 + 1))) {
            break;
          }
        }
        else if (v58[23])
        {
          uint64_t v71 = 0;
          while (v58[v71] == v70[v71])
          {
            if (v66 == ++v71) {
              goto LABEL_116;
            }
          }
          break;
        }
LABEL_116:
        v58 += 24;
        v57 += 24;
        if (v58 == v59) {
          goto LABEL_133;
        }
      }
    }
  }
  uint64_t v60 = 0;
LABEL_133:
  long long v57 = (char *)__p;
  if (!__p) {
    goto LABEL_134;
  }
LABEL_106:
  std::string v63 = v75;
  if (v75 != v57)
  {
    do
    {
      if (*(v63 - 1) < 0) {
        operator delete(*((void **)v63 - 3));
      }
      v63 -= 24;
    }
    while (v63 != v57);
    uint64_t v75 = v57;
    operator delete(__p);
    unint64_t v64 = (char *)v77;
    if (v77) {
      goto LABEL_135;
    }
LABEL_108:
    uint64_t v65 = (std::__shared_weak_count *)v83;
    if (!(void)v83) {
      goto LABEL_144;
    }
    goto LABEL_142;
  }
  uint64_t v75 = v57;
  operator delete(v57);
  unint64_t v64 = (char *)v77;
  if (!v77) {
    goto LABEL_108;
  }
LABEL_135:
  unint64_t v72 = v78;
  if (v78 == v64)
  {
    size_t v78 = v64;
    operator delete(v64);
    uint64_t v65 = (std::__shared_weak_count *)v83;
    if (!(void)v83) {
      goto LABEL_144;
    }
    goto LABEL_142;
  }
  do
  {
    if (*(v72 - 1) < 0) {
      operator delete(*((void **)v72 - 3));
    }
    v72 -= 24;
  }
  while (v72 != v64);
  size_t v78 = v64;
  operator delete(v77);
  uint64_t v65 = (std::__shared_weak_count *)v83;
  if ((void)v83)
  {
LABEL_142:
    if (!atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
LABEL_144:
  std::locale::~locale(v80);
  if (v84[0].__begin_)
  {
    v84[0].__end_ = v84[0].__begin_;
    operator delete(v84[0].__begin_);
  }
  return v60;
}

void sub_2636740A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, std::locale a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  uint64_t v26 = *(void **)(v24 - 192);
  if (v26)
  {
    *(void *)(v24 - 184) = v26;
    operator delete(v26);
  }
  std::vector<std::string>::~vector[abi:ne180100]((void **)&a9);
  std::vector<std::string>::~vector[abi:ne180100](&a12);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a15);
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ***std::__exception_guard_exceptions<std::vector<std::string>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    long long v2 = *result;
    uint64_t v3 = (void **)**result;
    if (v3)
    {
      uint64_t v4 = (void **)v2[1];
      long long v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0) {
            operator delete(*(v4 - 3));
          }
          v4 -= 3;
        }
        while (v4 != v3);
        long long v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

__n128 std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>(unint64_t a1, const void **a2, uint64_t a3, char a4, __n128 result)
{
LABEL_1:
  v268 = a2 - 3;
  v271 = a2;
  v260 = a2 - 9;
  v261 = a2 - 6;
  unint64_t k = a1;
  while (1)
  {
    a1 = k;
    uint64_t v11 = (uint64_t)a2 - k;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - k) >> 3);
    if (v6 || !v5)
    {
      switch(v12)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v119 = (__n128 *)(a2 - 3);
          int v120 = *((char *)a2 - 1);
          if (v120 >= 0) {
            long long v121 = a2 - 3;
          }
          else {
            long long v121 = (const void **)*(a2 - 3);
          }
          if (v120 >= 0) {
            size_t v122 = *((unsigned __int8 *)a2 - 1);
          }
          else {
            size_t v122 = (size_t)*(a2 - 2);
          }
          int v123 = *(char *)(a1 + 23);
          uint64_t v124 = *(void **)a1;
          uint64_t v125 = *(const void **)(a1 + 8);
          if (v123 >= 0) {
            uint64_t v126 = (const void *)a1;
          }
          else {
            uint64_t v126 = *(const void **)a1;
          }
          if (v123 >= 0) {
            size_t v127 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v127 = *(void *)(a1 + 8);
          }
          if (v127 >= v122) {
            size_t v128 = v122;
          }
          else {
            size_t v128 = v127;
          }
          int v129 = memcmp(v121, v126, v128);
          if (v129)
          {
            if (v129 < 0) {
              return result;
            }
          }
          else if (v122 <= v127)
          {
            return result;
          }
          v258 = *(const void **)(a1 + 16);
          uint64_t v259 = (uint64_t)*(a2 - 1);
          uint64_t result = *v119;
          *(__n128 *)a1 = *v119;
          *(void *)(a1 + 16) = v259;
          *(a2 - 3) = v124;
          *(a2 - 2) = v125;
          *(a2 - 1) = v258;
          break;
        case 3uLL:
          result.n128_u64[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, v268).n128_u64[0];
          return result;
        case 4uLL:
          result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, v268).n128_u64[0];
          return result;
        case 5uLL:
          result.n128_u64[0] = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a1 + 72, v268).n128_u64[0];
          return result;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v11 <= 575)
    {
      if (a4)
      {
        if ((const void **)a1 == a2) {
          return result;
        }
        uint64_t v130 = (const void *)(a1 + 24);
        if ((const void **)(a1 + 24) == a2) {
          return result;
        }
        uint64_t v131 = 0;
        unint64_t v132 = a1;
        while (2)
        {
          unint64_t v134 = (__n128 *)v132;
          unint64_t v132 = (unint64_t)v130;
          int v135 = v134[2].n128_i8[15];
          if (v135 >= 0) {
            unint64_t v136 = v130;
          }
          else {
            unint64_t v136 = (const void *)v134[1].n128_u64[1];
          }
          if (v135 >= 0) {
            size_t v137 = v134[2].n128_u8[15];
          }
          else {
            size_t v137 = v134[2].n128_u64[0];
          }
          int v138 = v134[1].n128_i8[7];
          if (v138 >= 0) {
            unint64_t v139 = v134;
          }
          else {
            unint64_t v139 = (__n128 *)v134->n128_u64[0];
          }
          if (v138 >= 0) {
            size_t v140 = v134[1].n128_u8[7];
          }
          else {
            size_t v140 = v134->n128_u64[1];
          }
          if (v140 >= v137) {
            size_t v141 = v137;
          }
          else {
            size_t v141 = v140;
          }
          int v142 = memcmp(v136, v139, v141);
          if (v142)
          {
            if (v142 < 0)
            {
LABEL_266:
              uint64_t v130 = (const void *)(v132 + 24);
              v131 += 24;
              if ((const void **)(v132 + 24) == v271) {
                return result;
              }
              continue;
            }
          }
          else if (v137 <= v140)
          {
            goto LABEL_266;
          }
          break;
        }
        __n128 v143 = *(__n128 *)v132;
        int64_t v274 = *(void *)(v132 + 16);
        __n128 v273 = v143;
        if (v274 >= 0) {
          uint64_t v144 = &v273;
        }
        else {
          uint64_t v144 = (__n128 *)v143.n128_u64[0];
        }
        if (v274 >= 0) {
          size_t v145 = HIBYTE(v274);
        }
        else {
          size_t v145 = v143.n128_u64[1];
        }
        *(void *)(v132 + 16) = v134[1].n128_u64[0];
        *(__n128 *)unint64_t v132 = *v134;
        v134[1].n128_u8[7] = 0;
        v134->n128_u8[0] = 0;
        uint64_t v133 = (__n128 *)a1;
        if (v134 != (__n128 *)a1)
        {
          uint64_t v146 = v131;
          while (1)
          {
            uint64_t v147 = a1 + v146;
            int v148 = *(char *)(a1 + v146 - 1);
            if (v148 >= 0) {
              uint64_t v149 = (const void *)(a1 + v146 - 24);
            }
            else {
              uint64_t v149 = *(const void **)(a1 + v146 - 24);
            }
            if (v148 >= 0) {
              size_t v150 = *(unsigned __int8 *)(a1 + v146 - 1);
            }
            else {
              size_t v150 = *(void *)(a1 + v146 - 16);
            }
            if (v150 >= v145) {
              size_t v151 = v145;
            }
            else {
              size_t v151 = v150;
            }
            int v152 = memcmp(v144, v149, v151);
            if (v152)
            {
              if (v152 < 0)
              {
                uint64_t v133 = (__n128 *)(a1 + v146);
                break;
              }
            }
            else if (v145 <= v150)
            {
              uint64_t v133 = v134;
              break;
            }
            unint64_t v134 = (__n128 *)((char *)v134 - 24);
            *(_OWORD *)uint64_t v147 = *(_OWORD *)(a1 + v146 - 24);
            *(void *)(v147 + 16) = *(void *)(a1 + v146 - 8);
            *(unsigned char *)(v147 - 1) = 0;
            *(unsigned char *)(v147 - 24) = 0;
            v146 -= 24;
            if (!v146)
            {
              uint64_t v133 = (__n128 *)a1;
              break;
            }
          }
        }
        uint64_t result = v273;
        v133[1].n128_u64[0] = v274;
        *uint64_t v133 = result;
        goto LABEL_266;
      }
      if ((const void **)a1 == a2) {
        return result;
      }
      v239 = (const void *)(a1 + 24);
      if ((const void **)(a1 + 24) == a2) {
        return result;
      }
LABEL_478:
      v240 = (const void **)a1;
      a1 = (unint64_t)v239;
      int v241 = *((char *)v240 + 47);
      if (v241 >= 0) {
        v242 = v239;
      }
      else {
        v242 = v240[3];
      }
      if (v241 >= 0) {
        size_t v243 = *((unsigned __int8 *)v240 + 47);
      }
      else {
        size_t v243 = (size_t)v240[4];
      }
      int v244 = *((char *)v240 + 23);
      if (v244 >= 0) {
        v245 = v240;
      }
      else {
        v245 = *v240;
      }
      if (v244 >= 0) {
        size_t v246 = *((unsigned __int8 *)v240 + 23);
      }
      else {
        size_t v246 = (size_t)v240[1];
      }
      if (v246 >= v243) {
        size_t v247 = v243;
      }
      else {
        size_t v247 = v246;
      }
      int v248 = memcmp(v242, v245, v247);
      if (v248)
      {
        if (v248 < 0) {
          goto LABEL_477;
        }
      }
      else if (v243 <= v246)
      {
        goto LABEL_477;
      }
      __n128 v249 = *(__n128 *)a1;
      int64_t v274 = *(void *)(a1 + 16);
      __n128 v273 = v249;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      *(void *)a1 = 0;
      if (v274 >= 0) {
        v250 = &v273;
      }
      else {
        v250 = (__n128 *)v273.n128_u64[0];
      }
      if (v274 >= 0) {
        size_t v251 = HIBYTE(v274);
      }
      else {
        size_t v251 = v273.n128_u64[1];
      }
      for (unint64_t i = a1; ; i -= 24)
      {
        *(_OWORD *)unint64_t i = *(_OWORD *)(i - 24);
        *(void *)(i + 16) = *(void *)(i - 8);
        *(unsigned char *)(i - 1) = 0;
        *(unsigned char *)(i - 24) = 0;
        int v253 = *(char *)(i - 25);
        if (v253 >= 0) {
          v254 = (const void *)(i - 48);
        }
        else {
          v254 = *(const void **)(i - 48);
        }
        if (v253 >= 0) {
          size_t v255 = *(unsigned __int8 *)(i - 25);
        }
        else {
          size_t v255 = *(void *)(i - 40);
        }
        if (v255 >= v251) {
          size_t v256 = v251;
        }
        else {
          size_t v256 = v255;
        }
        int v257 = memcmp(v250, v254, v256);
        if (v257)
        {
          if (v257 < 0)
          {
LABEL_476:
            uint64_t result = v273;
            *(void *)(i - 8) = v274;
            *(__n128 *)(i - 24) = result;
LABEL_477:
            v239 = (const void *)(a1 + 24);
            if ((const void **)(a1 + 24) == a2) {
              return result;
            }
            goto LABEL_478;
          }
        }
        else if (v251 <= v255)
        {
          goto LABEL_476;
        }
      }
    }
    if (!a3) {
      break;
    }
    unint64_t v13 = v12 >> 1;
    uint64_t v14 = a1 + 24 * (v12 >> 1);
    if ((unint64_t)v11 < 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(v14, a1, v268);
      uint64_t v265 = a3 - 1;
      if ((a4 & 1) == 0)
      {
LABEL_10:
        int v19 = *(char *)(a1 - 1);
        if (v19 >= 0) {
          long long v20 = (const void *)(a1 - 24);
        }
        else {
          long long v20 = *(const void **)(a1 - 24);
        }
        if (v19 >= 0) {
          size_t v21 = *(unsigned __int8 *)(a1 - 1);
        }
        else {
          size_t v21 = *(void *)(a1 - 16);
        }
        int v22 = *(char *)(a1 + 23);
        if (v22 >= 0) {
          unint64_t v23 = (const void *)a1;
        }
        else {
          unint64_t v23 = *(const void **)a1;
        }
        if (v22 >= 0) {
          size_t v24 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v24 = *(void *)(a1 + 8);
        }
        if (v24 >= v21) {
          size_t v25 = v21;
        }
        else {
          size_t v25 = v24;
        }
        int v26 = memcmp(v20, v23, v25);
        if (v26)
        {
          if (v26 < 0) {
            goto LABEL_125;
          }
        }
        else if (v21 <= v24)
        {
LABEL_125:
          __n128 v72 = *(__n128 *)a1;
          int64_t v274 = *(void *)(a1 + 16);
          __n128 v273 = v72;
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          long long v73 = a2;
          if (v274 >= 0) {
            uint64_t v74 = &v273;
          }
          else {
            uint64_t v74 = (__n128 *)v273.n128_u64[0];
          }
          if (v274 >= 0) {
            size_t v75 = HIBYTE(v274);
          }
          else {
            size_t v75 = v273.n128_u64[1];
          }
          size_t v76 = *((unsigned __int8 *)v73 - 1);
          size_t v78 = (const void **)*(v73 - 3);
          char v77 = *(v73 - 2);
          if ((v76 & 0x80u) == 0) {
            unint64_t v79 = v268;
          }
          else {
            unint64_t v79 = (const void **)*(v73 - 3);
          }
          if ((v76 & 0x80u) == 0) {
            size_t v80 = *((unsigned __int8 *)v73 - 1);
          }
          else {
            size_t v80 = (size_t)*(v73 - 2);
          }
          if (v80 >= v75) {
            size_t v81 = v75;
          }
          else {
            size_t v81 = v80;
          }
          int v82 = memcmp(v74, v79, v81);
          if (v82)
          {
            if ((v82 & 0x80000000) == 0)
            {
LABEL_142:
              unint64_t v83 = a1 + 24;
              do
              {
                while (1)
                {
                  unint64_t k = v83;
                  uint64_t v84 = *(unsigned __int8 *)(v83 + 23);
                  uint64_t v85 = (v84 & 0x80u) == 0 ? (const void *)k : *(const void **)k;
                  size_t v86 = (v84 & 0x80u) == 0 ? v84 : *(void *)(k + 8);
                  size_t v87 = v86 >= v75 ? v75 : v86;
                  int v88 = memcmp(v74, v85, v87);
                  unint64_t v83 = k + 24;
                  if (v88) {
                    break;
                  }
                  if (v75 > v86) {
                    goto LABEL_155;
                  }
                }
              }
              while (v88 < 0);
LABEL_155:
              unint64_t j = v271;
              if (k < (unint64_t)v271)
              {
                for (unint64_t j = v268; ; v77 = j[1])
                {
                  if ((v76 & 0x80u) == 0) {
                    uint64_t v91 = j;
                  }
                  else {
                    uint64_t v91 = v78;
                  }
                  if ((v76 & 0x80u) == 0) {
                    size_t v92 = v76;
                  }
                  else {
                    size_t v92 = (size_t)v77;
                  }
                  if (v92 >= v75) {
                    size_t v93 = v75;
                  }
                  else {
                    size_t v93 = v92;
                  }
                  int v94 = memcmp(v74, v91, v93);
                  if (v94)
                  {
                    if (v94 < 0) {
                      break;
                    }
                  }
                  else if (v75 <= v92)
                  {
                    break;
                  }
                  long long v90 = (const void **)*(j - 3);
                  j -= 3;
                  size_t v78 = v90;
                  size_t v76 = *((unsigned __int8 *)j + 23);
                }
              }
              if (k < (unint64_t)j)
              {
                unint64_t v95 = *(const void **)k;
                do
                {
                  long long v96 = *(_OWORD *)(k + 8);
                  long long v97 = *(_OWORD *)j;
                  *(void *)(k + 16) = j[2];
                  *(_OWORD *)unint64_t k = v97;
                  *unint64_t j = v95;
                  *(_OWORD *)(j + 1) = v96;
                  if (v274 >= 0) {
                    long long v98 = &v273;
                  }
                  else {
                    long long v98 = (__n128 *)v273.n128_u64[0];
                  }
                  if (v274 >= 0) {
                    unint64_t v99 = HIBYTE(v274);
                  }
                  else {
                    unint64_t v99 = v273.n128_u64[1];
                  }
                  unint64_t v100 = k + 24;
                  do
                  {
                    while (1)
                    {
                      unint64_t k = v100;
                      uint64_t v101 = *(unsigned __int8 *)(v100 + 23);
                      unint64_t v95 = *(const void **)k;
                      uint64_t v102 = (v101 & 0x80u) == 0 ? (const void *)k : *(const void **)k;
                      unint64_t v103 = (v101 & 0x80u) == 0 ? v101 : *(void *)(k + 8);
                      size_t v104 = v103 >= v99 ? v99 : v103;
                      int v105 = memcmp(v98, v102, v104);
                      unint64_t v100 = k + 24;
                      if (v105) {
                        break;
                      }
                      if (v99 > v103) {
                        goto LABEL_192;
                      }
                    }
                  }
                  while (v105 < 0);
LABEL_192:
                  unint64_t v106 = j - 3;
                  do
                  {
                    while (1)
                    {
                      unint64_t j = v106;
                      unint64_t v107 = (const void *)*((unsigned __int8 *)v106 + 23);
                      unint64_t v108 = (char)v107 >= 0 ? j : (const void **)*j;
                      std::string::size_type v109 = (char)v107 >= 0 ? v107 : j[1];
                      size_t v110 = (unint64_t)v109 >= v99 ? v99 : (size_t)v109;
                      int v111 = memcmp(v98, v108, v110);
                      unint64_t v106 = j - 3;
                      if (v111) {
                        break;
                      }
                      if (v99 <= (unint64_t)v109) {
                        goto LABEL_172;
                      }
                    }
                  }
                  while ((v111 & 0x80000000) == 0);
LABEL_172:
                  ;
                }
                while (k < (unint64_t)j);
              }
              uint64_t v112 = (__n128 *)(k - 24);
              BOOL v5 = k - 24 >= a1;
              BOOL v6 = k - 24 == a1;
              if (k - 24 == a1)
              {
                a2 = v271;
                a3 = v265;
                if (*(char *)(k - 1) < 0) {
                  operator delete(*(void **)a1);
                }
              }
              else
              {
                if (*(char *)(a1 + 23) < 0) {
                  operator delete(*(void **)a1);
                }
                __n128 v113 = *v112;
                *(void *)(a1 + 16) = *(void *)(k - 8);
                *(__n128 *)a1 = v113;
                *(unsigned char *)(k - 1) = 0;
                *(unsigned char *)(k - 24) = 0;
                a2 = v271;
                a3 = v265;
              }
              a4 = 0;
              uint64_t result = v273;
              *(void *)(k - 8) = v274;
              *uint64_t v112 = result;
              continue;
            }
          }
          else if (v75 > v80)
          {
            goto LABEL_142;
          }
          for (unint64_t k = a1 + 24; k < (unint64_t)v271; k += 24)
          {
            int v114 = *(char *)(k + 23);
            if (v114 >= 0) {
              uint64_t v115 = (const void *)k;
            }
            else {
              uint64_t v115 = *(const void **)k;
            }
            if (v114 >= 0) {
              size_t v116 = *(unsigned __int8 *)(k + 23);
            }
            else {
              size_t v116 = *(void *)(k + 8);
            }
            if (v116 >= v75) {
              size_t v117 = v75;
            }
            else {
              size_t v117 = v116;
            }
            int v118 = memcmp(v74, v115, v117);
            if (v118)
            {
              if ((v118 & 0x80000000) == 0) {
                goto LABEL_155;
              }
            }
            else if (v75 > v116)
            {
              goto LABEL_155;
            }
          }
          goto LABEL_155;
        }
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, v14, v268);
      uint64_t v15 = 24 * v13;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1 + 24, v15 + a1 - 24, v261);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1 + 48, a1 + 24 + v15, v260);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(v15 + a1 - 24, v14, (const void **)(a1 + 24 + v15));
      long long v16 = *(void **)a1;
      long long v17 = *(_OWORD *)(a1 + 8);
      long long v18 = *(_OWORD *)v14;
      *(void *)(a1 + 16) = *(void *)(v14 + 16);
      *(_OWORD *)a1 = v18;
      *(void *)uint64_t v14 = v16;
      *(_OWORD *)(v14 + 8) = v17;
      uint64_t v265 = a3 - 1;
      if ((a4 & 1) == 0) {
        goto LABEL_10;
      }
    }
    uint64_t v27 = 0;
    __n128 v28 = *(__n128 *)a1;
    int64_t v274 = *(void *)(a1 + 16);
    __n128 v273 = v28;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    if (v274 >= 0) {
      long long v29 = &v273;
    }
    else {
      long long v29 = (__n128 *)v273.n128_u64[0];
    }
    if (v274 >= 0) {
      unint64_t v30 = HIBYTE(v274);
    }
    else {
      unint64_t v30 = v273.n128_u64[1];
    }
    while (1)
    {
      long long v31 = *(const void **)(a1 + v27 + 24);
      int v32 = *(char *)(a1 + v27 + 47);
      long long v33 = v32 >= 0 ? (const void *)(a1 + v27 + 24) : *(const void **)(a1 + v27 + 24);
      unint64_t v34 = v32 >= 0 ? *(unsigned __int8 *)(a1 + v27 + 47) : *(void *)(a1 + v27 + 32);
      size_t v35 = v30 >= v34 ? v34 : v30;
      int v36 = memcmp(v33, v29, v35);
      if (v36) {
        break;
      }
      if (v34 <= v30) {
        goto LABEL_46;
      }
LABEL_34:
      v27 += 24;
    }
    if ((v36 & 0x80000000) == 0) {
      goto LABEL_34;
    }
LABEL_46:
    unint64_t v37 = a1 + v27 + 24;
    uint64_t v38 = v268;
    if (v27)
    {
      do
      {
        while (1)
        {
          std::vector<std::ssub_match>::pointer v39 = v38;
          uint64_t v46 = (const void *)*((unsigned __int8 *)v38 + 23);
          uint64_t v47 = (char)v46 >= 0 ? v39 : (const void **)*v39;
          unint64_t v48 = (unint64_t)((char)v46 >= 0 ? v46 : v39[1]);
          size_t v49 = v30 >= v48 ? v48 : v30;
          int v50 = memcmp(v47, v29, v49);
          uint64_t v38 = v39 - 3;
          if (v50) {
            break;
          }
          if (v48 > v30) {
            goto LABEL_77;
          }
        }
      }
      while (v50 < 0);
    }
    else
    {
      std::vector<std::ssub_match>::pointer v39 = v271;
      if (v37 < (unint64_t)v271)
      {
        std::vector<std::ssub_match>::pointer v40 = v268;
        do
        {
          while (1)
          {
            std::vector<std::ssub_match>::pointer v39 = v40;
            long long v41 = (const void *)*((unsigned __int8 *)v40 + 23);
            std::__wrap_iter<const char *>::iterator_type v42 = (char)v41 >= 0 ? v39 : (const void **)*v39;
            unint64_t v43 = (unint64_t)((char)v41 >= 0 ? v41 : v39[1]);
            size_t v44 = v30 >= v43 ? v43 : v30;
            int v45 = memcmp(v42, v29, v44);
            std::vector<std::ssub_match>::pointer v40 = v39 - 3;
            if (!v45) {
              break;
            }
            if (v37 >= (unint64_t)v39 || (v45 & 0x80000000) == 0) {
              goto LABEL_77;
            }
          }
        }
        while (v37 < (unint64_t)v39 && v43 <= v30);
      }
    }
LABEL_77:
    if (v37 >= (unint64_t)v39)
    {
      unint64_t k = v37;
    }
    else
    {
      long long v51 = v39;
      unint64_t k = v37;
      do
      {
        long long v52 = *(_OWORD *)(k + 8);
        long long v53 = *(_OWORD *)v51;
        *(void *)(k + 16) = v51[2];
        *(_OWORD *)unint64_t k = v53;
        long long *v51 = v31;
        *(_OWORD *)(v51 + 1) = v52;
        if (v274 >= 0) {
          uint64_t v54 = &v273;
        }
        else {
          uint64_t v54 = (__n128 *)v273.n128_u64[0];
        }
        if (v274 >= 0) {
          unint64_t v55 = HIBYTE(v274);
        }
        else {
          unint64_t v55 = v273.n128_u64[1];
        }
        unint64_t v56 = k + 24;
        do
        {
          while (1)
          {
            unint64_t k = v56;
            uint64_t v57 = *(unsigned __int8 *)(v56 + 23);
            long long v31 = *(const void **)k;
            int64_t v58 = (v57 & 0x80u) == 0 ? (const void *)k : *(const void **)k;
            unint64_t v59 = (v57 & 0x80u) == 0 ? v57 : *(void *)(k + 8);
            size_t v60 = v55 >= v59 ? v59 : v55;
            int v61 = memcmp(v58, v54, v60);
            unint64_t v56 = k + 24;
            if (v61) {
              break;
            }
            if (v59 <= v55) {
              goto LABEL_99;
            }
          }
        }
        while ((v61 & 0x80000000) == 0);
LABEL_99:
        long long v62 = v51 - 3;
        do
        {
          while (1)
          {
            long long v51 = v62;
            std::string v63 = (const void *)*((unsigned __int8 *)v62 + 23);
            unint64_t v64 = (char)v63 >= 0 ? v51 : (const void **)*v51;
            unint64_t v65 = (unint64_t)((char)v63 >= 0 ? v63 : v51[1]);
            size_t v66 = v55 >= v65 ? v65 : v55;
            int v67 = memcmp(v64, v54, v66);
            long long v62 = v51 - 3;
            if (v67) {
              break;
            }
            if (v65 > v55) {
              goto LABEL_79;
            }
          }
        }
        while (v67 < 0);
LABEL_79:
        ;
      }
      while (k < (unint64_t)v51);
    }
    uint64_t v68 = (__n128 *)(k - 24);
    if (k - 24 == a1)
    {
      a2 = v271;
      a3 = v265;
      if (*(char *)(k - 1) < 0) {
        operator delete(*(void **)a1);
      }
    }
    else
    {
      a2 = v271;
      a3 = v265;
      if (*(char *)(a1 + 23) < 0) {
        operator delete(*(void **)a1);
      }
      __n128 v69 = *v68;
      *(void *)(a1 + 16) = *(void *)(k - 8);
      *(__n128 *)a1 = v69;
      *(unsigned char *)(k - 1) = 0;
      *(unsigned char *)(k - 24) = 0;
    }
    __n128 v70 = v273;
    *(void *)(k - 8) = v274;
    *uint64_t v68 = v70;
    if (v37 < (unint64_t)v39)
    {
LABEL_123:
      std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>(a1, k - 24, a3, a4 & 1);
      a4 = 0;
    }
    else
    {
      BOOL v71 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, (const void **)(k - 24));
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(k, a2))
      {
        a2 = (const void **)(k - 24);
        if (v71) {
          return result;
        }
        goto LABEL_1;
      }
      if (!v71) {
        goto LABEL_123;
      }
    }
  }
  if ((const void **)a1 == a2) {
    return result;
  }
  int64_t v153 = (v12 - 2) >> 1;
  int64_t v154 = v153;
  while (2)
  {
    int64_t v156 = v154;
    if (v153 >= v154)
    {
      uint64_t v157 = (2 * v154) | 1;
      unint64_t v158 = a1 + 24 * v157;
      uint64_t v159 = 2 * v154 + 2;
      if (v159 >= (uint64_t)v12) {
        goto LABEL_337;
      }
      unint64_t v160 = (const void **)(v158 + 24);
      int v161 = *(char *)(v158 + 23);
      if (v161 >= 0) {
        v162 = (const void *)(a1 + 24 * v157);
      }
      else {
        v162 = *(const void **)v158;
      }
      if (v161 >= 0) {
        size_t v163 = *(unsigned __int8 *)(v158 + 23);
      }
      else {
        size_t v163 = *(void *)(v158 + 8);
      }
      int v164 = *(char *)(v158 + 47);
      if (v164 >= 0) {
        uint64_t v165 = (const void *)(v158 + 24);
      }
      else {
        uint64_t v165 = *(const void **)(v158 + 24);
      }
      if (v164 >= 0) {
        size_t v166 = *(unsigned __int8 *)(v158 + 47);
      }
      else {
        size_t v166 = *(void *)(v158 + 32);
      }
      if (v166 >= v163) {
        size_t v167 = v163;
      }
      else {
        size_t v167 = v166;
      }
      int v168 = memcmp(v162, v165, v167);
      if (v168)
      {
        a2 = v271;
        if (v168 < 0)
        {
LABEL_337:
          unint64_t v160 = (const void **)(a1 + 24 * v157);
          uint64_t v159 = (2 * v156) | 1;
        }
      }
      else
      {
        BOOL v169 = v163 >= v166;
        if (v163 == v166)
        {
          unint64_t v160 = (const void **)(a1 + 24 * v157);
          uint64_t v159 = (2 * v156) | 1;
          a2 = v271;
        }
        else
        {
          a2 = v271;
          if (!v169) {
            goto LABEL_337;
          }
        }
      }
      unint64_t v170 = a1 + 24 * v156;
      int v171 = *((char *)v160 + 23);
      if (v171 >= 0) {
        uint64_t v172 = v160;
      }
      else {
        uint64_t v172 = *v160;
      }
      if (v171 >= 0) {
        size_t v173 = *((unsigned __int8 *)v160 + 23);
      }
      else {
        size_t v173 = (size_t)v160[1];
      }
      int v174 = *(char *)(v170 + 23);
      if (v174 >= 0) {
        uint64_t v175 = (const void *)(a1 + 24 * v156);
      }
      else {
        uint64_t v175 = *(const void **)v170;
      }
      if (v174 >= 0) {
        size_t v176 = *(unsigned __int8 *)(v170 + 23);
      }
      else {
        size_t v176 = *(void *)(v170 + 8);
      }
      if (v176 >= v173) {
        size_t v177 = v173;
      }
      else {
        size_t v177 = v176;
      }
      int v178 = memcmp(v172, v175, v177);
      if (v178)
      {
        int64_t v153 = (v12 - 2) >> 1;
        if (v178 < 0)
        {
LABEL_357:
          __n128 v180 = *(__n128 *)v170;
          int64_t v274 = *(void *)(v170 + 16);
          __n128 v273 = v180;
          *(void *)(v170 + 8) = 0;
          *(void *)(v170 + 16) = 0;
          *(void *)unint64_t v170 = 0;
          long long v181 = *(_OWORD *)v160;
          *(void *)(v170 + 16) = v160[2];
          *(_OWORD *)unint64_t v170 = v181;
          *((unsigned char *)v160 + 23) = 0;
          *(unsigned char *)unint64_t v160 = 0;
          if (v153 >= v159)
          {
            unint64_t v182 = HIBYTE(v274);
            size_t v183 = &v273;
            if (v274 < 0)
            {
              unint64_t v182 = v273.n128_u64[1];
              size_t v183 = (__n128 *)v273.n128_u64[0];
            }
            size_t v263 = v182;
            v266 = v183;
            int64_t v269 = v156;
            while (1)
            {
              uint64_t v185 = (2 * v159) | 1;
              unint64_t v186 = a1 + 24 * v185;
              uint64_t v159 = 2 * v159 + 2;
              if (v159 >= (uint64_t)v12) {
                goto LABEL_385;
              }
              uint64_t v155 = (const void **)(v186 + 24);
              int v187 = *(char *)(v186 + 23);
              v188 = v187 >= 0 ? (const void *)(a1 + 24 * v185) : *(const void **)v186;
              unint64_t v189 = v187 >= 0 ? *(unsigned __int8 *)(v186 + 23) : *(void *)(v186 + 8);
              int v190 = *(char *)(v186 + 47);
              v191 = v190 >= 0 ? (const void *)(v186 + 24) : *(const void **)(v186 + 24);
              unint64_t v192 = v190 >= 0 ? *(unsigned __int8 *)(v186 + 47) : *(void *)(v186 + 32);
              size_t v193 = v192 >= v189 ? v189 : v192;
              int v194 = memcmp(v188, v191, v193);
              if (v194) {
                break;
              }
              BOOL v195 = v189 >= v192;
              if (v189 == v192)
              {
                uint64_t v155 = (const void **)(a1 + 24 * v185);
                uint64_t v159 = v185;
                a2 = v271;
                int64_t v153 = (v12 - 2) >> 1;
                goto LABEL_386;
              }
              a2 = v271;
              int64_t v153 = (v12 - 2) >> 1;
              if (!v195) {
                goto LABEL_385;
              }
LABEL_386:
              int v196 = *((char *)v155 + 23);
              if (v196 >= 0) {
                v197 = v155;
              }
              else {
                v197 = *v155;
              }
              if (v196 >= 0) {
                size_t v198 = *((unsigned __int8 *)v155 + 23);
              }
              else {
                size_t v198 = (size_t)v155[1];
              }
              if (v263 >= v198) {
                size_t v199 = v198;
              }
              else {
                size_t v199 = v263;
              }
              int v200 = memcmp(v197, v266, v199);
              if (v200)
              {
                int64_t v156 = v269;
                if ((v200 & 0x80000000) == 0) {
                  goto LABEL_311;
                }
              }
              else
              {
                int64_t v156 = v269;
                if (v198 > v263) {
                  goto LABEL_311;
                }
              }
              long long v184 = *(_OWORD *)v155;
              v160[2] = v155[2];
              *(_OWORD *)unint64_t v160 = v184;
              *((unsigned char *)v155 + 23) = 0;
              *(unsigned char *)uint64_t v155 = 0;
              unint64_t v160 = v155;
              if (v153 < v159) {
                goto LABEL_312;
              }
            }
            a2 = v271;
            int64_t v153 = (v12 - 2) >> 1;
            if ((v194 & 0x80000000) == 0) {
              goto LABEL_386;
            }
LABEL_385:
            uint64_t v155 = (const void **)(a1 + 24 * v185);
            uint64_t v159 = v185;
            goto LABEL_386;
          }
LABEL_311:
          uint64_t v155 = v160;
LABEL_312:
          uint64_t result = v273;
          v155[2] = (const void *)v274;
          *(__n128 *)uint64_t v155 = result;
        }
      }
      else
      {
        BOOL v179 = v173 > v176;
        int64_t v153 = (v12 - 2) >> 1;
        if (!v179) {
          goto LABEL_357;
        }
      }
    }
    int64_t v154 = v156 - 1;
    if (v156) {
      continue;
    }
    break;
  }
  int64_t v201 = v11 / 0x18uLL;
  do
  {
    if (v201 < 2) {
      goto LABEL_400;
    }
    uint64_t v202 = 0;
    v270 = *(void **)a1;
    v272 = a2;
    v264 = *(const void **)(a1 + 16);
    v267 = *(const void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    unint64_t v203 = a1;
    *(void *)a1 = 0;
    do
    {
      uint64_t v205 = v203 + 24 * v202 + 24;
      uint64_t v206 = (2 * v202) | 1;
      uint64_t v202 = 2 * v202 + 2;
      if (v202 < v201)
      {
        v204 = (__n128 *)(v205 + 24);
        int v207 = *(char *)(v205 + 23);
        if (v207 >= 0) {
          std::locale v208 = (const void *)v205;
        }
        else {
          std::locale v208 = *(const void **)v205;
        }
        if (v207 >= 0) {
          size_t v209 = *(unsigned __int8 *)(v205 + 23);
        }
        else {
          size_t v209 = *(void *)(v205 + 8);
        }
        int v210 = *(char *)(v205 + 47);
        if (v210 >= 0) {
          uint64_t v211 = (const void *)(v205 + 24);
        }
        else {
          uint64_t v211 = *(const void **)(v205 + 24);
        }
        if (v210 >= 0) {
          size_t v212 = *(unsigned __int8 *)(v205 + 47);
        }
        else {
          size_t v212 = *(void *)(v205 + 32);
        }
        if (v212 >= v209) {
          size_t v213 = v209;
        }
        else {
          size_t v213 = v212;
        }
        int v214 = memcmp(v208, v211, v213);
        if (v214)
        {
          if ((v214 & 0x80000000) == 0) {
            goto LABEL_424;
          }
        }
        else if (v209 != v212 && v209 >= v212)
        {
LABEL_424:
          if ((*(char *)(v203 + 23) & 0x80000000) == 0) {
            goto LABEL_405;
          }
          goto LABEL_425;
        }
      }
      v204 = (__n128 *)v205;
      uint64_t v202 = v206;
      if ((*(char *)(v203 + 23) & 0x80000000) == 0) {
        goto LABEL_405;
      }
LABEL_425:
      operator delete(*(void **)v203);
LABEL_405:
      uint64_t result = *v204;
      *(void *)(v203 + 16) = v204[1].n128_u64[0];
      *(__n128 *)unint64_t v203 = result;
      v204[1].n128_u8[7] = 0;
      v204->n128_u8[0] = 0;
      unint64_t v203 = (unint64_t)v204;
    }
    while (v202 <= (uint64_t)((unint64_t)(v201 - 2) >> 1));
    if (v204 == (__n128 *)(a2 - 3))
    {
      v204->n128_u64[0] = (unint64_t)v270;
      v204->n128_u64[1] = (unint64_t)v267;
      v204[1].n128_u64[0] = (unint64_t)v264;
      goto LABEL_400;
    }
    uint64_t result = *(__n128 *)(a2 - 3);
    v204[1].n128_u64[0] = (unint64_t)*(a2 - 1);
    __n128 *v204 = result;
    *(a2 - 3) = v270;
    *(a2 - 2) = v267;
    *(a2 - 1) = v264;
    uint64_t v215 = (uint64_t)&v204[1].n128_i64[1] - a1;
    if (v215 >= 25)
    {
      unint64_t v216 = v215 / 0x18uLL - 2;
      unint64_t v217 = v216 >> 1;
      unint64_t v218 = a1 + 24 * (v216 >> 1);
      int v219 = *(char *)(v218 + 23);
      if (v219 >= 0) {
        long long v220 = (const void *)(a1 + 24 * (v216 >> 1));
      }
      else {
        long long v220 = *(const void **)v218;
      }
      if (v219 >= 0) {
        size_t v221 = *(unsigned __int8 *)(v218 + 23);
      }
      else {
        size_t v221 = *(void *)(v218 + 8);
      }
      int v222 = v204[1].n128_i8[7];
      if (v222 >= 0) {
        unint64_t v223 = v204;
      }
      else {
        unint64_t v223 = (__n128 *)v204->n128_u64[0];
      }
      if (v222 >= 0) {
        size_t v224 = v204[1].n128_u8[7];
      }
      else {
        size_t v224 = v204->n128_u64[1];
      }
      if (v224 >= v221) {
        size_t v225 = v221;
      }
      else {
        size_t v225 = v224;
      }
      int v226 = memcmp(v220, v223, v225);
      if (v226)
      {
        if (v226 < 0) {
          goto LABEL_400;
        }
      }
      else if (v221 <= v224)
      {
        goto LABEL_400;
      }
      __n128 v227 = *v204;
      int64_t v274 = v204[1].n128_i64[0];
      __n128 v273 = v227;
      v204->n128_u64[1] = 0;
      v204[1].n128_u64[0] = 0;
      v204->n128_u64[0] = 0;
      if (v274 >= 0) {
        uint64_t v228 = &v273;
      }
      else {
        uint64_t v228 = (__n128 *)v273.n128_u64[0];
      }
      if (v274 >= 0) {
        size_t v229 = HIBYTE(v274);
      }
      else {
        size_t v229 = v273.n128_u64[1];
      }
      __n128 v230 = *(__n128 *)v218;
      v204[1].n128_u64[0] = *(void *)(v218 + 16);
      __n128 *v204 = v230;
      *(unsigned char *)(v218 + 23) = 0;
      *(unsigned char *)unint64_t v218 = 0;
      if (v216 >= 2)
      {
        while (1)
        {
          unint64_t v232 = v217 - 1;
          unint64_t v217 = (v217 - 1) >> 1;
          unint64_t v233 = a1 + 24 * v217;
          int v234 = *(char *)(v233 + 23);
          if (v234 >= 0) {
            uint64_t v235 = (const void *)(a1 + 24 * v217);
          }
          else {
            uint64_t v235 = *(const void **)v233;
          }
          if (v234 >= 0) {
            size_t v236 = *(unsigned __int8 *)(v233 + 23);
          }
          else {
            size_t v236 = *(void *)(v233 + 8);
          }
          if (v229 >= v236) {
            size_t v237 = v236;
          }
          else {
            size_t v237 = v229;
          }
          int v238 = memcmp(v235, v228, v237);
          if (v238)
          {
            if (v238 < 0) {
              break;
            }
          }
          else if (v236 <= v229)
          {
            break;
          }
          long long v231 = *(_OWORD *)v233;
          *(void *)(v218 + 16) = *(void *)(v233 + 16);
          *(_OWORD *)unint64_t v218 = v231;
          *(unsigned char *)(v233 + 23) = 0;
          *(unsigned char *)unint64_t v233 = 0;
          unint64_t v218 = a1 + 24 * v217;
          if (v232 <= 1) {
            goto LABEL_472;
          }
        }
      }
      unint64_t v233 = v218;
LABEL_472:
      uint64_t result = v273;
      *(void *)(v233 + 16) = v274;
      *(__n128 *)unint64_t v233 = result;
      a2 = v272;
    }
LABEL_400:
    a2 -= 3;
    BOOL v179 = (unint64_t)v201-- > 2;
  }
  while (v179);
  return result;
}

__n128 std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, const void **a3)
{
  int v6 = *(char *)(a2 + 23);
  uint64_t v7 = *(const void **)a2;
  size_t v8 = *(const void **)(a2 + 8);
  if (v6 >= 0) {
    int v9 = (const void *)a2;
  }
  else {
    int v9 = *(const void **)a2;
  }
  if (v6 >= 0) {
    size_t v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v10 = *(void *)(a2 + 8);
  }
  int v11 = *(char *)(a1 + 23);
  unint64_t v13 = *(const void **)a1;
  unint64_t v12 = *(const void **)(a1 + 8);
  if (v11 >= 0) {
    uint64_t v14 = (const void *)a1;
  }
  else {
    uint64_t v14 = *(const void **)a1;
  }
  if (v11 >= 0) {
    size_t v15 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v15 = *(void *)(a1 + 8);
  }
  if (v15 >= v10) {
    size_t v16 = v10;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0) {
      goto LABEL_18;
    }
  }
  else if (v10 > v15)
  {
LABEL_18:
    int v18 = *((char *)a3 + 23);
    if (v18 >= 0) {
      int v19 = a3;
    }
    else {
      int v19 = *a3;
    }
    if (v18 >= 0) {
      size_t v20 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      size_t v20 = (size_t)a3[1];
    }
    if (v10 >= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v10;
    }
    int v22 = memcmp(v19, v9, v21);
    if (v22)
    {
      if ((v22 & 0x80000000) == 0)
      {
LABEL_29:
        unint64_t v23 = *(const void **)(a1 + 16);
        size_t v24 = a3[2];
        __n128 result = *(__n128 *)a3;
        *(_OWORD *)a1 = *(_OWORD *)a3;
        *(void *)(a1 + 16) = v24;
        *a3 = v13;
        a3[1] = v12;
        a3[2] = v23;
        return result;
      }
    }
    else if (v20 > v10)
    {
      goto LABEL_29;
    }
    uint64_t v31 = *(void *)(a1 + 16);
    uint64_t v32 = *(void *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v32;
    *(void *)a2 = v13;
    *(void *)(a2 + 8) = v12;
    *(void *)(a2 + 16) = v31;
    int v33 = *((char *)a3 + 23);
    if (v33 >= 0) {
      unint64_t v34 = a3;
    }
    else {
      unint64_t v34 = *a3;
    }
    if (v33 >= 0) {
      size_t v35 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      size_t v35 = (size_t)a3[1];
    }
    if (v31 >= 0) {
      int v36 = (const void *)a2;
    }
    else {
      int v36 = v13;
    }
    if (v31 >= 0) {
      size_t v37 = HIBYTE(v31);
    }
    else {
      size_t v37 = (size_t)v12;
    }
    if (v37 >= v35) {
      size_t v38 = v35;
    }
    else {
      size_t v38 = v37;
    }
    int v39 = memcmp(v34, v36, v38);
    if (v39)
    {
      if (v39 < 0) {
        return result;
      }
    }
    else if (v35 <= v37)
    {
      return result;
    }
    __n128 result = *(__n128 *)a3;
    *(void *)(a2 + 16) = a3[2];
    *(__n128 *)a2 = result;
    *a3 = v13;
    a3[1] = v12;
    a3[2] = (const void *)v31;
    return result;
  }
  int v26 = *((char *)a3 + 23);
  if (v26 >= 0) {
    uint64_t v27 = a3;
  }
  else {
    uint64_t v27 = *a3;
  }
  if (v26 >= 0) {
    size_t v28 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v28 = (size_t)a3[1];
  }
  if (v10 >= v28) {
    size_t v29 = v28;
  }
  else {
    size_t v29 = v10;
  }
  int v30 = memcmp(v27, v9, v29);
  if (v30)
  {
    if (v30 < 0) {
      return result;
    }
  }
  else if (v28 <= v10)
  {
    return result;
  }
  std::vector<std::ssub_match>::pointer v40 = *(const void **)(a2 + 16);
  long long v41 = a3[2];
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v41;
  *a3 = v7;
  a3[1] = v8;
  a3[2] = v40;
  int v42 = *(char *)(a2 + 23);
  if (v42 >= 0) {
    unint64_t v43 = (const void *)a2;
  }
  else {
    unint64_t v43 = *(const void **)a2;
  }
  if (v42 >= 0) {
    size_t v44 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v44 = *(void *)(a2 + 8);
  }
  int v45 = *(char *)(a1 + 23);
  uint64_t v46 = *(const void **)a1;
  uint64_t v47 = *(void *)(a1 + 8);
  if (v45 >= 0) {
    unint64_t v48 = (const void *)a1;
  }
  else {
    unint64_t v48 = *(const void **)a1;
  }
  if (v45 >= 0) {
    size_t v49 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v49 = *(void *)(a1 + 8);
  }
  if (v49 >= v44) {
    size_t v50 = v44;
  }
  else {
    size_t v50 = v49;
  }
  int v51 = memcmp(v43, v48, v50);
  if (!v51)
  {
    if (v44 <= v49) {
      return result;
    }
    goto LABEL_84;
  }
  if ((v51 & 0x80000000) == 0)
  {
LABEL_84:
    uint64_t v52 = *(void *)(a1 + 16);
    uint64_t v53 = *(void *)(a2 + 16);
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v53;
    *(void *)a2 = v46;
    *(void *)(a2 + 8) = v47;
    *(void *)(a2 + 16) = v52;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, const void **a2)
{
  long long v2 = a2;
  uint64_t v4 = ((uint64_t)a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      int v6 = a2 - 3;
      int v7 = *((char *)a2 - 1);
      if (v7 >= 0) {
        size_t v8 = a2 - 3;
      }
      else {
        size_t v8 = (const void **)*(a2 - 3);
      }
      if (v7 >= 0) {
        size_t v9 = *((unsigned __int8 *)a2 - 1);
      }
      else {
        size_t v9 = (size_t)*(a2 - 2);
      }
      int v10 = *(char *)(a1 + 23);
      int v11 = *(const void **)a1;
      unint64_t v12 = *(const void **)(a1 + 8);
      if (v10 >= 0) {
        unint64_t v13 = (const void *)a1;
      }
      else {
        unint64_t v13 = *(const void **)a1;
      }
      if (v10 >= 0) {
        size_t v14 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        size_t v14 = *(void *)(a1 + 8);
      }
      if (v14 >= v9) {
        size_t v15 = v9;
      }
      else {
        size_t v15 = v14;
      }
      int v16 = memcmp(v8, v13, v15);
      if (v16)
      {
        if (v16 < 0) {
          return 1;
        }
      }
      else if (v9 <= v14)
      {
        return 1;
      }
      long long v41 = *(const void **)(a1 + 16);
      uint64_t v42 = (uint64_t)*(v2 - 1);
      *(_OWORD *)a1 = *(_OWORD *)v6;
      *(void *)(a1 + 16) = v42;
      *(v2 - 3) = v11;
      *(v2 - 2) = v12;
      *(v2 - 1) = v41;
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a2 - 3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a2 - 3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a1 + 72, a2 - 3);
      return 1;
    default:
      int v17 = (const void **)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, (const void **)(a1 + 48));
      int v18 = (const void **)(a1 + 72);
      if ((const void **)(a1 + 72) == v2) {
        return 1;
      }
      uint64_t v19 = 0;
      int v20 = 0;
      unint64_t v43 = v2;
      break;
  }
  while (2)
  {
    int v23 = *((char *)v18 + 23);
    if (v23 >= 0) {
      size_t v24 = v18;
    }
    else {
      size_t v24 = *v18;
    }
    if (v23 >= 0) {
      size_t v25 = *((unsigned __int8 *)v18 + 23);
    }
    else {
      size_t v25 = (size_t)v18[1];
    }
    int v26 = *((char *)v17 + 23);
    if (v26 >= 0) {
      uint64_t v27 = v17;
    }
    else {
      uint64_t v27 = *v17;
    }
    if (v26 >= 0) {
      size_t v28 = *((unsigned __int8 *)v17 + 23);
    }
    else {
      size_t v28 = (size_t)v17[1];
    }
    if (v28 >= v25) {
      size_t v29 = v25;
    }
    else {
      size_t v29 = v28;
    }
    int v30 = memcmp(v24, v27, v29);
    if (v30)
    {
      if (v30 < 0) {
        goto LABEL_25;
      }
    }
    else if (v25 <= v28)
    {
      goto LABEL_25;
    }
    long long v44 = *(_OWORD *)v18;
    int v45 = v18[2];
    *(_OWORD *)int v18 = *(_OWORD *)v17;
    v18[2] = v17[2];
    *((unsigned char *)v17 + 23) = 0;
    *(unsigned char *)int v17 = 0;
    uint64_t v21 = a1;
    if (v17 == (const void **)a1) {
      goto LABEL_24;
    }
    uint64_t v31 = v19;
    while (1)
    {
      uint64_t v32 = a1 + v31;
      int v33 = (_OWORD *)(a1 + v31 + 24);
      unint64_t v34 = SHIBYTE(v45) >= 0 ? &v44 : (long long *)v44;
      unint64_t v35 = SHIBYTE(v45) >= 0 ? HIBYTE(v45) : *((void *)&v44 + 1);
      int v36 = *(char *)(v32 + 47);
      size_t v37 = v36 >= 0 ? (const void *)(a1 + v31 + 24) : *(const void **)(a1 + v31 + 24);
      unint64_t v38 = v36 >= 0 ? *(unsigned __int8 *)(v32 + 47) : *(void *)(v32 + 32);
      size_t v39 = v38 >= v35 ? v35 : v38;
      int v40 = memcmp(v34, v37, v39);
      if (!v40) {
        break;
      }
      if (v40 < 0)
      {
        uint64_t v21 = (uint64_t)v17;
        goto LABEL_23;
      }
LABEL_48:
      v17 -= 3;
      *(_OWORD *)(v32 + 48) = *v33;
      *(void *)(v32 + 64) = *(void *)(a1 + v31 + 40);
      *(unsigned char *)(v32 + 47) = 0;
      *(unsigned char *)int v33 = 0;
      v31 -= 24;
      if (v31 == -48)
      {
        uint64_t v21 = a1;
        goto LABEL_23;
      }
    }
    if (v35 > v38) {
      goto LABEL_48;
    }
    uint64_t v21 = a1 + v31 + 48;
LABEL_23:
    long long v2 = v43;
LABEL_24:
    long long v22 = v44;
    *(void *)(v21 + 16) = v45;
    *(_OWORD *)uint64_t v21 = v22;
    if (++v20 == 8) {
      return v18 + 3 == v2;
    }
LABEL_25:
    int v17 = v18;
    v19 += 24;
    v18 += 3;
    if (v18 != v2) {
      continue;
    }
    return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a2, (const void **)a3);
  int v8 = *((char *)a4 + 23);
  if (v8 >= 0) {
    size_t v9 = a4;
  }
  else {
    size_t v9 = *a4;
  }
  if (v8 >= 0) {
    size_t v10 = *((unsigned __int8 *)a4 + 23);
  }
  else {
    size_t v10 = (size_t)a4[1];
  }
  int v11 = *(char *)(a3 + 23);
  unint64_t v12 = *(const void **)a3;
  unint64_t v13 = *(const void **)(a3 + 8);
  if (v11 >= 0) {
    size_t v14 = (const void *)a3;
  }
  else {
    size_t v14 = *(const void **)a3;
  }
  if (v11 >= 0) {
    size_t v15 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v15 = *(void *)(a3 + 8);
  }
  if (v15 >= v10) {
    size_t v16 = v10;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if (v17 < 0) {
      return result;
    }
  }
  else if (v10 <= v15)
  {
    return result;
  }
  uint64_t v19 = *(const void **)(a3 + 16);
  int v20 = a4[2];
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(void *)(a3 + 16) = v20;
  *a4 = v12;
  a4[1] = v13;
  a4[2] = v19;
  int v21 = *(char *)(a3 + 23);
  if (v21 >= 0) {
    long long v22 = (const void *)a3;
  }
  else {
    long long v22 = *(const void **)a3;
  }
  if (v21 >= 0) {
    size_t v23 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v23 = *(void *)(a3 + 8);
  }
  int v24 = *(char *)(a2 + 23);
  size_t v25 = *(const void **)a2;
  uint64_t v26 = *(void *)(a2 + 8);
  if (v24 >= 0) {
    uint64_t v27 = (const void *)a2;
  }
  else {
    uint64_t v27 = *(const void **)a2;
  }
  if (v24 >= 0) {
    size_t v28 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v28 = *(void *)(a2 + 8);
  }
  if (v28 >= v23) {
    size_t v29 = v23;
  }
  else {
    size_t v29 = v28;
  }
  int v30 = memcmp(v22, v27, v29);
  if (v30)
  {
    if (v30 < 0) {
      return result;
    }
  }
  else if (v23 <= v28)
  {
    return result;
  }
  uint64_t v31 = *(void *)(a2 + 16);
  uint64_t v32 = *(void *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v32;
  *(void *)a3 = v25;
  *(void *)(a3 + 8) = v26;
  *(void *)(a3 + 16) = v31;
  int v33 = *(char *)(a2 + 23);
  if (v33 >= 0) {
    unint64_t v34 = (const void *)a2;
  }
  else {
    unint64_t v34 = *(const void **)a2;
  }
  if (v33 >= 0) {
    size_t v35 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v35 = *(void *)(a2 + 8);
  }
  int v36 = *(char *)(a1 + 23);
  size_t v37 = *(const void **)a1;
  uint64_t v38 = *(void *)(a1 + 8);
  if (v36 >= 0) {
    size_t v39 = (const void *)a1;
  }
  else {
    size_t v39 = *(const void **)a1;
  }
  if (v36 >= 0) {
    size_t v40 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v40 = *(void *)(a1 + 8);
  }
  if (v40 >= v35) {
    size_t v41 = v35;
  }
  else {
    size_t v41 = v40;
  }
  int v42 = memcmp(v34, v39, v41);
  if (!v42)
  {
    if (v35 <= v40) {
      return result;
    }
LABEL_58:
    uint64_t v43 = *(void *)(a1 + 16);
    uint64_t v44 = *(void *)(a2 + 16);
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v44;
    *(void *)a2 = v37;
    *(void *)(a2 + 8) = v38;
    *(void *)(a2 + 16) = v43;
    return result;
  }
  if ((v42 & 0x80000000) == 0) {
    goto LABEL_58;
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void **a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a2, a3, (const void **)a4);
  int v10 = *((char *)a5 + 23);
  if (v10 >= 0) {
    int v11 = a5;
  }
  else {
    int v11 = *a5;
  }
  if (v10 >= 0) {
    size_t v12 = *((unsigned __int8 *)a5 + 23);
  }
  else {
    size_t v12 = (size_t)a5[1];
  }
  int v13 = *(char *)(a4 + 23);
  size_t v14 = *(const void **)a4;
  size_t v15 = *(const void **)(a4 + 8);
  if (v13 >= 0) {
    size_t v16 = (const void *)a4;
  }
  else {
    size_t v16 = *(const void **)a4;
  }
  if (v13 >= 0) {
    size_t v17 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    size_t v17 = *(void *)(a4 + 8);
  }
  if (v17 >= v12) {
    size_t v18 = v12;
  }
  else {
    size_t v18 = v17;
  }
  int v19 = memcmp(v11, v16, v18);
  if (v19)
  {
    if (v19 < 0) {
      return result;
    }
  }
  else if (v12 <= v17)
  {
    return result;
  }
  int v21 = *(const void **)(a4 + 16);
  long long v22 = a5[2];
  *(_OWORD *)a4 = *(_OWORD *)a5;
  *(void *)(a4 + 16) = v22;
  *a5 = v14;
  a5[1] = v15;
  a5[2] = v21;
  int v23 = *(char *)(a4 + 23);
  if (v23 >= 0) {
    int v24 = (const void *)a4;
  }
  else {
    int v24 = *(const void **)a4;
  }
  if (v23 >= 0) {
    size_t v25 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    size_t v25 = *(void *)(a4 + 8);
  }
  int v26 = *(char *)(a3 + 23);
  uint64_t v27 = *(const void **)a3;
  uint64_t v28 = *(void *)(a3 + 8);
  if (v26 >= 0) {
    size_t v29 = (const void *)a3;
  }
  else {
    size_t v29 = *(const void **)a3;
  }
  if (v26 >= 0) {
    size_t v30 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v30 = *(void *)(a3 + 8);
  }
  if (v30 >= v25) {
    size_t v31 = v25;
  }
  else {
    size_t v31 = v30;
  }
  int v32 = memcmp(v24, v29, v31);
  if (v32)
  {
    if (v32 < 0) {
      return result;
    }
  }
  else if (v25 <= v30)
  {
    return result;
  }
  uint64_t v33 = *(void *)(a3 + 16);
  uint64_t v34 = *(void *)(a4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(void *)(a3 + 16) = v34;
  *(void *)a4 = v27;
  *(void *)(a4 + 8) = v28;
  *(void *)(a4 + 16) = v33;
  int v35 = *(char *)(a3 + 23);
  if (v35 >= 0) {
    int v36 = (const void *)a3;
  }
  else {
    int v36 = *(const void **)a3;
  }
  if (v35 >= 0) {
    size_t v37 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v37 = *(void *)(a3 + 8);
  }
  int v38 = *(char *)(a2 + 23);
  size_t v39 = *(const void **)a2;
  uint64_t v40 = *(void *)(a2 + 8);
  if (v38 >= 0) {
    size_t v41 = (const void *)a2;
  }
  else {
    size_t v41 = *(const void **)a2;
  }
  if (v38 >= 0) {
    size_t v42 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v42 = *(void *)(a2 + 8);
  }
  if (v42 >= v37) {
    size_t v43 = v37;
  }
  else {
    size_t v43 = v42;
  }
  int v44 = memcmp(v36, v41, v43);
  if (v44)
  {
    if (v44 < 0) {
      return result;
    }
  }
  else if (v37 <= v42)
  {
    return result;
  }
  uint64_t v45 = *(void *)(a2 + 16);
  uint64_t v46 = *(void *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v46;
  *(void *)a3 = v39;
  *(void *)(a3 + 8) = v40;
  *(void *)(a3 + 16) = v45;
  int v47 = *(char *)(a2 + 23);
  if (v47 >= 0) {
    unint64_t v48 = (const void *)a2;
  }
  else {
    unint64_t v48 = *(const void **)a2;
  }
  if (v47 >= 0) {
    size_t v49 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v49 = *(void *)(a2 + 8);
  }
  int v50 = *(char *)(a1 + 23);
  int v51 = *(const void **)a1;
  uint64_t v52 = *(void *)(a1 + 8);
  if (v50 >= 0) {
    uint64_t v53 = (const void *)a1;
  }
  else {
    uint64_t v53 = *(const void **)a1;
  }
  if (v50 >= 0) {
    size_t v54 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v54 = *(void *)(a1 + 8);
  }
  if (v54 >= v49) {
    size_t v55 = v49;
  }
  else {
    size_t v55 = v54;
  }
  int v56 = memcmp(v48, v53, v55);
  if (v56)
  {
    if (v56 < 0) {
      return result;
    }
  }
  else if (v49 <= v54)
  {
    return result;
  }
  uint64_t v57 = *(void *)(a1 + 16);
  uint64_t v58 = *(void *)(a2 + 16);
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v58;
  *(void *)a2 = v51;
  *(void *)(a2 + 8) = v52;
  *(void *)(a2 + 16) = v57;
  return result;
}

char *std::vector<std::string>::__push_back_slow_path<std::string>(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int v7 = (char *)operator new(24 * v6);
  }
  else
  {
    int v7 = 0;
  }
  int v8 = &v7[24 * v3];
  size_t v9 = &v7[24 * v6];
  *(_OWORD *)int v8 = *(_OWORD *)a2;
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  int v10 = v8 + 24;
  int v11 = (void **)*a1;
  size_t v12 = (void **)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
  }
  else
  {
    do
    {
      long long v13 = *(_OWORD *)(v12 - 3);
      *((void *)v8 - 1) = *(v12 - 1);
      *(_OWORD *)(v8 - 24) = v13;
      v8 -= 24;
      *(v12 - 2) = 0;
      *(v12 - 1) = 0;
      *(v12 - 3) = 0;
      v12 -= 3;
    }
    while (v12 != v11);
    size_t v12 = (void **)*a1;
    size_t v14 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    while (v14 != v12)
    {
      if (*((char *)v14 - 1) < 0) {
        operator delete(*(v14 - 3));
      }
      v14 -= 3;
    }
  }
  if (v12) {
    operator delete(v12);
  }
  return v10;
}

uint64_t *std::unique_ptr<std::__hash_node<std::string,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16) && *(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t *GetOsLogContext(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B431A48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B431A48))
  {
    qword_26B431A68 = 0;
    qword_26B431A60 = 0;
    __cxa_atexit(MEMORY[0x263F8BDA8], &qword_26B431A60, &dword_263655000);
    __cxa_guard_release(&qword_26B431A48);
  }
  if (_MergedGlobals_1 != -1) {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global);
  }
  return &qword_26B431A60;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B431A58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B431A58))
  {
    MEMORY[0x263E67070](&unk_26B431A70);
    __cxa_atexit(MEMORY[0x263F8BDB0], &unk_26B431A70, &dword_263655000);
    __cxa_guard_release(&qword_26B431A58);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1174405120;
  v5[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v5[3] = &__block_descriptor_tmp_3;
  uint64_t v2 = (std::__shared_weak_count *)a1[1];
  v5[4] = *a1;
  unint64_t v6 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (qword_26B431A50 == -1)
  {
    unint64_t v3 = v6;
    if (!v6) {
      return &unk_26B431A70;
    }
  }
  else
  {
    dispatch_once(&qword_26B431A50, v5);
    unint64_t v3 = v6;
    if (!v6) {
      return &unk_26B431A70;
    }
  }
  if (atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return &unk_26B431A70;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return &unk_26B431A70;
}

void sub_263675F68(_Unwind_Exception *a1)
{
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B431A48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B431A48))
  {
    qword_26B431A68 = 0;
    qword_26B431A60 = 0;
    __cxa_atexit(MEMORY[0x263F8BDA8], &qword_26B431A60, &dword_263655000);
    __cxa_guard_release(&qword_26B431A48);
  }
  if (_MergedGlobals_1 != -1) {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v5, (const ctu::OsLogContext *)&qword_26B431A60);
  MEMORY[0x263E67060](v6, v5, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  uint64_t v3 = v7;
  uint64_t v2 = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v4 = (std::__shared_weak_count *)qword_26B431AA8;
  qword_26B431AA0 = v3;
  qword_26B431AA8 = v2;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  MEMORY[0x263E67080](v6);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v5);
}

void sub_2636760D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1211";
}

uint64_t BBUpdaterRegisterGlobalLogSink()
{
  return MEMORY[0x270F91618]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x270F97178]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x270F97180]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  return MEMORY[0x270F96B38](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x270F96D18](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x270F96D28](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x270F96D38](this);
}

uint64_t ctu::LogMessage::LogMessage()
{
  return MEMORY[0x270F97260]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x270F972E0](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x270F972F0]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x270F97300]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x270F97308](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F973E8](this);
}

uint64_t ctu::LogMessageBuffer::takeMetadata(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F973F0](this);
}

uint64_t ctu::LogMessageBuffer::vprintf(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x270F97408](this, a2, a3);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F97410](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x270F97448]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

uint64_t ctu::fs::remove_dir()
{
  return MEMORY[0x270F975A8]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x270F975C8]();
}

uint64_t ctu::fs::get_file_size()
{
  return MEMORY[0x270F975D0]();
}

uint64_t ctu::fs::get_filtered_files()
{
  return MEMORY[0x270F975E8]();
}

uint64_t ctu::fs::get_unique_filename()
{
  return MEMORY[0x270F975F0]();
}

uint64_t ctu::fs::rename()
{
  return MEMORY[0x270F97600]();
}

uint64_t ctu::Clock::now_in_nanoseconds(ctu::Clock *this)
{
  return MEMORY[0x270F976C8](this);
}

uint64_t ctu::assign()
{
  return MEMORY[0x270F976D0]();
}

uint64_t ctu::LogServer::updateConfig()
{
  return MEMORY[0x270F97718]();
}

uint64_t ctu::LogServer::log()
{
  return MEMORY[0x270F97720]();
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x270F97798]();
}

{
  return MEMORY[0x270F977A8]();
}

{
  return MEMORY[0x270F977B8]();
}

{
  return MEMORY[0x270F977C8]();
}

uint64_t ctu::LogServer::getConfig(ctu::LogServer *this)
{
  return MEMORY[0x270F97938](this);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x270F98670]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x270F98690]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x270F98698]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B80](__str, __idx, *(void *)&__base);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}
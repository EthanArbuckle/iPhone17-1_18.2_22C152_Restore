@interface ABMTapToRadar
+ (id)sharedInstance;
- (ABMTapToRadar)init;
- (BOOL)checkAudioTraces_sync;
- (BOOL)checkNotificationCriteria:(int *)a3 :(const void *)a4 :(BOOL)a5;
- (BOOL)checkTraces_sync:(int)a3;
- (id).cxx_construct;
- (int)getMode;
- (vector<std::string,)findLogFiles_sync:(ABMTapToRadar *)self :(SEL)a3;
- (void)setMode:(int)a3;
- (void)showNotification:(int)a3 :()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> ::;
- (void)showUserNotification:(int)a3 dumpReason:()basic_string<char;
@end

@implementation ABMTapToRadar

+ (id)sharedInstance
{
  if (qword_26A99F778 != -1) {
    dispatch_once(&qword_26A99F778, &__block_literal_global_4);
  }
  return (id)_MergedGlobals_6;
}

ABMTapToRadar *__31__ABMTapToRadar_sharedInstance__block_invoke()
{
  result = objc_alloc_init(ABMTapToRadar);
  _MergedGlobals_6 = (uint64_t)result;
  return result;
}

- (ABMTapToRadar)init
{
  v7.receiver = self;
  v7.super_class = (Class)ABMTapToRadar;
  v2 = [(ABMTapToRadar *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_create("abm.TapToRadar.queue", 0);
    fObj = v2->fQueue.fObj.fObj;
    v2->fQueue.fObj.fObj = (dispatch_object_s *)v3;
    if (fObj)
    {
      dispatch_release(fObj);
      v3 = v2->fQueue.fObj.fObj;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __21__ABMTapToRadar_init__block_invoke;
    block[3] = &unk_2655D5400;
    block[4] = v2;
    dispatch_sync(v3, block);
  }
  return v2;
}

void __21__ABMTapToRadar_init__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 24) = 30;
  *(_DWORD *)(*(void *)(a1 + 32) + 28) = 86400;
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = 0;
  if ((TelephonyUtilIsInternalBuild() & 1) != 0 || TelephonyUtilIsCarrierBuild()) {
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = 1;
  }
  v2 = (const void *)*MEMORY[0x263F25E28];
  size_t v3 = strlen((const char *)*MEMORY[0x263F25E28]);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    unint64_t v10 = v7 | 0x8000000000000000;
    __dst[0] = v5;
    goto LABEL_11;
  }
  HIBYTE(v10) = v3;
  v5 = __dst;
  if (v3) {
LABEL_11:
  }
    memmove(v5, v2, (size_t)v4);
  *((unsigned char *)v4 + (void)v5) = 0;
  uint64_t v8 = *(void *)(a1 + 32);
  memset(&__p, 0, sizeof(__p));
  if (prop::ttr::get((char *)__dst, (uint64_t)&__p))
  {
    int v12 = -1431655766;
    if (util::convert<int>(&__p, &v12, 0)) {
      *(_DWORD *)(v8 + 8) = v12;
    }
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10) & 0x80000000) == 0) {
      return;
    }
LABEL_19:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10) < 0) {
    goto LABEL_19;
  }
}

- (void)setMode:(int)a3
{
  fObj = self->fQueue.fObj.fObj;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__ABMTapToRadar_setMode___block_invoke;
  v4[3] = &unk_2655D5428;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(fObj, v4);
}

void __25__ABMTapToRadar_setMode___block_invoke(uint64_t a1)
{
  if ((TelephonyUtilIsInternalBuild() & 1) == 0 && !TelephonyUtilIsCarrierBuild()) {
    return;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = *(_DWORD *)(a1 + 40);
  v2 = (const void *)*MEMORY[0x263F25E28];
  size_t v3 = strlen((const char *)*MEMORY[0x263F25E28]);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    unint64_t v10 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v10) = v3;
    int v5 = __dst;
    if (!v3) {
      goto LABEL_11;
    }
  }
  memmove(v5, v2, (size_t)v4);
LABEL_11:
  *((unsigned char *)v4 + (void)v5) = 0;
  std::to_string(&v11, *(_DWORD *)(*(void *)(a1 + 32) + 8));
  std::string __p = v11;
  prop::ttr::set((char *)__dst, (char *)&__p);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10) & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10) < 0) {
    goto LABEL_15;
  }
}

- (int)getMode
{
  return self->fMode;
}

- (vector<std::string,)findLogFiles_sync:(ABMTapToRadar *)self :(SEL)a3
{
  uint64_t v5 = v4;
  retstr->var2.std::string var0 = 0;
  p_var2 = &retstr->var2;
  retstr->std::string var0 = 0;
  retstr->size_t var1 = 0;
  v72 = 0;
  v73 = 0;
  uint64_t v74 = 0;
  if (*((char *)&a4->var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&var0, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
  }
  else {
    std::string var0 = (std::string)a4->var0.var0;
  }
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)&v69, v5, 0);
  support::fs::getFilteredFiles((const char *)&var0, (uint64_t)&v69, (uint64_t)&v72, 0);
  v9 = v70;
  if (!v70 || atomic_fetch_add(&v70->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    std::locale::~locale(&v69);
    if ((SHIBYTE(var0.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_7;
    }
LABEL_134:
    operator delete(var0.__r_.__value_.__l.__data_);
    std::string v11 = (std::string::size_type *)v72;
    if (v72 != v73) {
      goto LABEL_8;
    }
LABEL_135:
    v59 = v11;
    if (v11) {
      goto LABEL_136;
    }
    return result;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  std::locale::~locale(&v69);
  if (SHIBYTE(var0.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_134;
  }
LABEL_7:
  std::string v11 = (std::string::size_type *)v72;
  if (v72 == v73) {
    goto LABEL_135;
  }
LABEL_8:
  v61 = self;
  do
  {
LABEL_13:
    memset(&__p, 170, sizeof(__p));
    int v12 = *((char *)&a4->var0.var0.var0.var1 + 23);
    if (v12 >= 0) {
      size_t var1 = *((unsigned __int8 *)&a4->var0.var0.var0.var1 + 23);
    }
    else {
      size_t var1 = a4->var0.var0.var0.var1.var1;
    }
    unint64_t v14 = var1 + 1;
    memset(&__dst, 170, 24);
    if (var1 + 1 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v14 >= 0x17)
    {
      uint64_t v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v16 = v14 | 7;
      }
      uint64_t v17 = v16 + 1;
      p_dst = (stat *)operator new(v16 + 1);
      __dst.st_ino = var1 + 1;
      *(void *)&__dst.st_uid = v17 | 0x8000000000000000;
      *(void *)&__dst.st_dev = p_dst;
    }
    else
    {
      memset(&__dst, 0, 24);
      p_dst = &__dst;
      HIBYTE(__dst.st_gid) = var1 + 1;
      if (!var1) {
        goto LABEL_27;
      }
    }
    if (v12 >= 0) {
      v18 = a4;
    }
    else {
      v18 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->var0.var0.var0.var1.var0;
    }
    memmove(p_dst, v18, var1);
LABEL_27:
    *(_WORD *)((char *)&p_dst->st_dev + var1) = 47;
    int v19 = *((char *)v11 + 23);
    if (v19 >= 0) {
      v20 = (const std::string::value_type *)v11;
    }
    else {
      v20 = (const std::string::value_type *)*v11;
    }
    if (v19 >= 0) {
      std::string::size_type v21 = *((unsigned __int8 *)v11 + 23);
    }
    else {
      std::string::size_type v21 = v11[1];
    }
    result = (vector<std::string, std::allocator<std::string>> *)std::string::append((std::string *)&__dst, v20, v21);
    long long v22 = *(_OWORD *)&result->var0;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)result->var2.var0;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v22;
    result->size_t var1 = 0;
    result->var2.std::string var0 = 0;
    result->std::string var0 = 0;
    if (SHIBYTE(__dst.st_gid) < 0) {
      operator delete(*(void **)&__dst.st_dev);
    }
    std::string::size_type v23 = *((unsigned __int8 *)v11 + 23);
    int v24 = (char)v23;
    if ((v23 & 0x80u) != 0) {
      std::string::size_type v23 = v11[1];
    }
    if (v23 == 2)
    {
      if (v24 >= 0) {
        v26 = v11;
      }
      else {
        v26 = (_WORD *)*v11;
      }
      if (*v26 == 11822) {
        goto LABEL_11;
      }
    }
    else if (v23 == 1)
    {
      v25 = v24 >= 0 ? v11 : (std::string::size_type *)*v11;
      if (*(unsigned char *)v25 == 46) {
        goto LABEL_11;
      }
    }
    v27.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v27.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v67.st_blkstd::string::size_type size = v27;
    *(timespec *)v67.st_qspare = v27;
    v67.st_birthtimespec = v27;
    *(timespec *)&v67.st_std::string::size_type size = v27;
    v67.st_ctimespec = v27;
    v67.st_atimespec = v27;
    v67.st_mtimespec = v27;
    *(timespec *)&v67.st_dev = v27;
    *(timespec *)&v67.st_uid = v27;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    result = (vector<std::string, std::allocator<std::string>> *)lstat((const char *)p_p, &v67);
    if ((v67.st_mode & 0xF000) == 0xA000) {
      goto LABEL_11;
    }
    v29.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v29.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&__dst.st_blkstd::string::size_type size = v29;
    *(timespec *)__dst.st_qspare = v29;
    __dst.st_birthtimespec = v29;
    *(timespec *)&__dst.st_std::string::size_type size = v29;
    __dst.st_mtimespec = v29;
    __dst.st_ctimespec = v29;
    *(timespec *)&__dst.st_uid = v29;
    __dst.st_atimespec = v29;
    *(timespec *)&__dst.st_dev = v29;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v30 = &__p;
    }
    else {
      v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if (stat((const char *)v30, &__dst)
      || ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? (v33 = &__p)
        : (v33 = (std::string *)__p.__r_.__value_.__r.__words[0]),
          (v34 = opendir((const char *)v33), (v35 = v34) == 0)
       || (v36 = readdir(v34), result = (vector<std::string, std::allocator<std::string>> *)closedir(v35), !v36)))
    {
      v31 = (vector<std::string, std::allocator<std::string>> *)retstr->var1;
      if (v31 >= retstr->var2.var0)
      {
        result = (vector<std::string, std::allocator<std::string>> *)std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)retstr, (uint64_t)&__p);
      }
      else
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)retstr->var1, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v32 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v31->var2.std::string var0 = (void *)__p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v31->std::string var0 = v32;
        }
        result = v31 + 1;
        retstr->size_t var1 = &v31[1];
      }
      retstr->size_t var1 = result;
      goto LABEL_11;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
      if (__p.__r_.__value_.__l.__size_ < 0xA) {
LABEL_147:
      }
        std::string::__throw_out_of_range[abi:ne180100]();
      v37 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (HIBYTE(__p.__r_.__value_.__r.__words[2]) < 0xAu) {
        goto LABEL_147;
      }
      v37 = &__p;
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    v39 = (char *)v37 + size;
    uint64_t v40 = *(void *)(v39 - 10);
    int v41 = *((unsigned __int16 *)v39 - 1);
    if (v40 == 0x6968637261676F6CLL && v41 == 25974) {
      goto LABEL_11;
    }
    memset(v66, 170, sizeof(v66));
    if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
      std::string::__init_copy_ctor_external(&v65, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }
    else {
      std::string v65 = __p;
    }
    char v64 = 2;
    strcpy((char *)v63, ".*");
    result = (vector<std::string, std::allocator<std::string>> *)v61;
    if (v61)
    {
      result = [(ABMTapToRadar *)v61 findLogFiles_sync:&v65 :v63];
      if (v64 < 0)
      {
        operator delete(v63[0]);
        if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
        {
LABEL_119:
          operator delete(v65.__r_.__value_.__l.__data_);
          v43 = (const std::string::value_type **)v66[0];
          if (v66[0] == v66[1])
          {
LABEL_120:
            v57 = v43;
            if (v43) {
              goto LABEL_121;
            }
            goto LABEL_11;
          }
          goto LABEL_84;
        }
      }
      else if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
      {
        goto LABEL_119;
      }
    }
    else
    {
      memset(v66, 0, sizeof(v66));
      if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_119;
      }
    }
    v43 = (const std::string::value_type **)v66[0];
    if (v66[0] == v66[1]) {
      goto LABEL_120;
    }
LABEL_84:
    v44 = (std::string *)retstr->var1;
    do
    {
      if (v44 < p_var2->var0)
      {
        if (*((char *)v43 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v44, *v43, (std::string::size_type)v43[1]);
        }
        else
        {
          long long v45 = *(_OWORD *)v43;
          v44->__r_.__value_.__r.__words[2] = (std::string::size_type)v43[2];
          *(_OWORD *)&v44->__r_.__value_.__l.__data_ = v45;
        }
        retstr->size_t var1 = ++v44;
        goto LABEL_88;
      }
      v46 = (std::string *)retstr->var0;
      unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * (((char *)v44 - (char *)retstr->var0) >> 3);
      unint64_t v48 = v47 + 1;
      if (v47 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)p_var2->var0 - (char *)v46) >> 3) > v48) {
        unint64_t v48 = 0x5555555555555556 * (((char *)p_var2->var0 - (char *)v46) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_var2->var0 - (char *)v46) >> 3) >= 0x555555555555555) {
        unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v49 = v48;
      }
      __dst.st_atimespec.tv_sec = (__darwin_time_t)p_var2;
      if (v49)
      {
        if (v49 > 0xAAAAAAAAAAAAAAALL) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v50 = (char *)operator new(24 * v49);
      }
      else
      {
        v50 = 0;
      }
      result = (vector<std::string, std::allocator<std::string>> *)&v50[24 * v47];
      *(void *)&__dst.st_dev = v50;
      __dst.st_ino = (__darwin_ino64_t)result;
      *(void *)&__dst.st_uid = result;
      *(void *)&__dst.st_rdev = &v50[24 * v49];
      if (*((char *)v43 + 23) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)result, *v43, (std::string::size_type)v43[1]);
        v46 = (std::string *)retstr->var0;
        v44 = (std::string *)retstr->var1;
        result = (vector<std::string, std::allocator<std::string>> *)__dst.st_ino;
        v52 = *(std::string **)&__dst.st_uid;
        if (v44 != retstr->var0)
        {
          do
          {
LABEL_105:
            long long v53 = *(_OWORD *)&v44[-1].__r_.__value_.__l.__data_;
            result[-1].var2.std::string var0 = (void *)v44[-1].__r_.__value_.__r.__words[2];
            *(_OWORD *)&result[-1].std::string var0 = v53;
            --result;
            v44[-1].__r_.__value_.__l.__size_ = 0;
            v44[-1].__r_.__value_.__r.__words[2] = 0;
            v44[-1].__r_.__value_.__r.__words[0] = 0;
            --v44;
          }
          while (v44 != v46);
          v54 = (std::string *)retstr->var0;
          v46 = (std::string *)retstr->var1;
          goto LABEL_108;
        }
      }
      else
      {
        long long v51 = *(_OWORD *)v43;
        result->var2.std::string var0 = (void *)v43[2];
        *(_OWORD *)&result->std::string var0 = v51;
        v52 = (std::string *)&v50[24 * v47];
        if (v44 != v46) {
          goto LABEL_105;
        }
      }
      v54 = v46;
LABEL_108:
      v44 = v52 + 1;
      retstr->std::string var0 = result;
      retstr->size_t var1 = &v52[1];
      v55 = retstr->var2.var0;
      retstr->var2.std::string var0 = *(void **)&__dst.st_rdev;
      *(void *)&__dst.st_rdev = v55;
      *(void *)&__dst.st_dev = v54;
      __dst.st_ino = (__darwin_ino64_t)v54;
      if (v46 != v54)
      {
        v56 = v46 - 1;
        do
        {
          *(void *)&__dst.st_uid = v56;
          if (SHIBYTE(v56->__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v56->__r_.__value_.__l.__data_);
          }
          --v56;
        }
        while (&v56[1] != v54);
        v46 = v54;
      }
      if (v46) {
        operator delete(v46);
      }
LABEL_88:
      retstr->size_t var1 = v44;
      v43 += 3;
    }
    while (v43 != v66[1]);
    v57 = (const std::string::value_type **)v66[0];
    if (!v66[0]) {
      goto LABEL_11;
    }
LABEL_121:
    v58 = v57;
    if (v43 != v57)
    {
      do
      {
        if (*((char *)v43 - 1) < 0) {
          operator delete((void *)*(v43 - 3));
        }
        v43 -= 3;
      }
      while (v43 != v57);
      v58 = (const std::string::value_type **)v66[0];
    }
    v66[1] = v57;
    operator delete(v58);
LABEL_11:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      v11 += 3;
      if (v11 == v73) {
        break;
      }
      goto LABEL_13;
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    v11 += 3;
  }
  while (v11 != v73);
  v59 = (std::string::size_type *)v72;
  if (!v72) {
    return result;
  }
LABEL_136:
  v60 = v59;
  if (v11 != v59)
  {
    do
    {
      if (*((char *)v11 - 1) < 0) {
        operator delete((void *)*(v11 - 3));
      }
      v11 -= 3;
    }
    while (v11 != v59);
    v60 = v72;
  }
  v73 = v59;
  operator delete(v60);
  return result;
}

- (BOOL)checkAudioTraces_sync
{
  v17[0] = 0;
  v17[1] = 0;
  uint64_t v18 = 0;
  memset(__dst, 170, sizeof(__dst));
  int v2 = capabilities::radio::maverick((capabilities::radio *)self);
  size_t v3 = (const char **)MEMORY[0x263F26628];
  if (!v2) {
    size_t v3 = (const char **)MEMORY[0x263F264F8];
  }
  uint64_t v4 = *v3;
  size_t v5 = strlen(*v3);
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v6 = (void *)v5;
  if (v5 >= 0x17)
  {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v8 = v5 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t v7 = (void **)operator new(v8 + 1);
    __dst[1] = v6;
    __dst[2] = (void *)(v9 | 0x8000000000000000);
    __dst[0] = v7;
    goto LABEL_10;
  }
  HIBYTE(__dst[2]) = v5;
  uint64_t v7 = __dst;
  if (v5) {
LABEL_10:
  }
    memmove(v7, v4, (size_t)v6);
  *((unsigned char *)v6 + (void)v7) = 0;
  prop::bbtrace::get((char *)__dst, (uint64_t)v17);
  v15[23] = 5;
  strcpy(v15, "Audio");
  int v10 = SHIBYTE(v18);
  std::string v11 = (void *)v17[0];
  if (v18 >= 0) {
    int v12 = (const char *)v17;
  }
  else {
    int v12 = (const char *)v17[0];
  }
  int v13 = strcasecmp(v15, v12);
  if (SHIBYTE(__dst[2]) < 0)
  {
    operator delete(__dst[0]);
    if ((v10 & 0x80000000) == 0) {
      return v13 == 0;
    }
LABEL_18:
    operator delete(v11);
    return v13 == 0;
  }
  if (v10 < 0) {
    goto LABEL_18;
  }
  return v13 == 0;
}

- (BOOL)checkTraces_sync:(int)a3
{
  BOOL v19 = 1;
  if (a3 > 5) {
    return v19;
  }
  if (((1 << a3) & 0x26) == 0)
  {
    if (((1 << a3) & 0x18) == 0) {
      return v19;
    }
    uint64_t v7 = (const void *)*MEMORY[0x263F25DA0];
    size_t v8 = strlen((const char *)*MEMORY[0x263F25DA0]);
    if (v8 > 0x7FFFFFFFFFFFFFF7) {
LABEL_29:
    }
      std::string::__throw_length_error[abi:ne180100]();
    size_t v9 = v8;
    if (v8 >= 0x17)
    {
      uint64_t v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v13 = v8 | 7;
      }
      uint64_t v14 = v13 + 1;
      p_dst = (void **)operator new(v13 + 1);
      size_t v17 = v9;
      unint64_t v18 = v14 | 0x8000000000000000;
      stat __dst = p_dst;
    }
    else
    {
      HIBYTE(v18) = v8;
      p_dst = (void **)&__dst;
      if (!v8)
      {
LABEL_22:
        *((unsigned char *)p_dst + v9) = 0;
        memset(&__p, 0, sizeof(__p));
        if (!prop::coredump::get((char *)&__dst, (uint64_t)&__p)) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    memmove(p_dst, v7, v9);
    goto LABEL_22;
  }
  size_t v3 = (const void *)*MEMORY[0x263F25DA0];
  size_t v4 = strlen((const char *)*MEMORY[0x263F25DA0]);
  if (v4 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_29;
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v11 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v11 = v4 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v6 = (void **)operator new(v11 + 1);
    size_t v17 = v5;
    unint64_t v18 = v12 | 0x8000000000000000;
    stat __dst = v6;
    goto LABEL_15;
  }
  HIBYTE(v18) = v4;
  uint64_t v6 = (void **)&__dst;
  if (v4) {
LABEL_15:
  }
    memmove(v6, v3, v5);
  *((unsigned char *)v6 + v5) = 0;
  memset(&__p, 0, sizeof(__p));
  if (!prop::bbtrace::get((char *)&__dst, (uint64_t)&__p)) {
    goto LABEL_24;
  }
LABEL_23:
  util::convert<BOOL>(&__p, &v19, 0);
LABEL_24:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v18) & 0x80000000) == 0) {
      return v19;
    }
  }
  else if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    return v19;
  }
  operator delete(__dst);
  return v19;
}

- (BOOL)checkNotificationCriteria:(int *)a3 :(const void *)a4 :(BOOL)a5
{
  size_t v9 = (char *)operator new(0x20uLL);
  strcpy(v9, "Carrier Bundle file push failed");
  v76 = (char *)&v76;
  v77 = &v76;
  uint64_t v78 = 0;
  int v10 = (char *)operator new(0x30uLL);
  *(void *)int v10 = 0;
  *((void *)v10 + 1) = 0;
  std::string::__init_copy_ctor_external((std::string *)(v10 + 16), v9, 0x1FuLL);
  uint64_t v11 = v78;
  uint64_t v12 = v76;
  *((_DWORD *)v10 + 10) = 2;
  *(void *)int v10 = v12;
  *((void *)v10 + 1) = &v76;
  *((void *)v12 + 1) = v10;
  v76 = v10;
  uint64_t v78 = v11 + 1;
  operator delete(v9);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A99F780, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A99F780))
  {
    qword_26A99F788 = (uint64_t)"mav_bedf_component_config_reset: Reset Requested by Component Cfg";
    qword_26A99F790 = (uint64_t)"AutoBugCapture";
    qword_26A99F798 = *MEMORY[0x263F20518];
    __cxa_guard_release(&qword_26A99F780);
  }
  int v13 = *((char *)a4 + 23);
  if (v13 < 0)
  {
    uint64_t v14 = *((void *)a4 + 1);
    if (!v14) {
      goto LABEL_21;
    }
    v15 = *(char **)a4;
    if (v14 < 30) {
      goto LABEL_21;
    }
  }
  else
  {
    if (!*((unsigned char *)a4 + 23)) {
      goto LABEL_21;
    }
    uint64_t v14 = *((unsigned __int8 *)a4 + 23);
    v15 = (char *)a4;
    if ((unint64_t)v14 < 0x1E) {
      goto LABEL_21;
    }
  }
  uint64_t v16 = &v15[v14];
  size_t v17 = v15;
  do
  {
    unint64_t v18 = (char *)memchr(v17, 67, v14 - 29);
    if (!v18) {
      break;
    }
    if (*(void *)v18 == 0x736964206C6C6143
      && *((void *)v18 + 1) == 0x657463656E6E6F63
      && *((void *)v18 + 2) == 0x657078656E752064
      && *(void *)(v18 + 22) == 0x796C646574636570)
    {
      if (v18 != v16 && v18 - v15 != -1)
      {
        *a3 = 1;
        LOBYTE(v13) = *((unsigned char *)a4 + 23);
      }
      break;
    }
    size_t v17 = v18 + 1;
    uint64_t v14 = v16 - (unsigned char *)v17;
  }
  while (v16 - (unsigned char *)v17 >= 30);
LABEL_21:
  __s2[1] = 0xAAAAAAAAAA005D73;
  __s2[2] = 0xAAAAAAAAAAAAAAALL;
  __s2[0] = *(void *)"[Settings]";
  if (self->fMode == 3) {
    goto LABEL_33;
  }
  if ((v13 & 0x80) == 0)
  {
    if (v13 >= 0xAu) {
      size_t v22 = 10;
    }
    else {
      size_t v22 = v13;
    }
    std::string::size_type v23 = (capabilities::radio *)memcmp(a4, __s2, v22);
    if (v22 != 10) {
      goto LABEL_47;
    }
    goto LABEL_32;
  }
  if (*((void *)a4 + 1) >= 0xAuLL) {
    size_t v24 = 10;
  }
  else {
    size_t v24 = *((void *)a4 + 1);
  }
  std::string::size_type v23 = (capabilities::radio *)memcmp(*(const void **)a4, __s2, v24);
  if (v24 == 10)
  {
LABEL_32:
    if (v23) {
      goto LABEL_47;
    }
LABEL_33:
    int v25 = (char)v13;
    if ((v13 & 0x80u) == 0) {
      int64_t v26 = v13;
    }
    else {
      int64_t v26 = *((void *)a4 + 1);
    }
    if (!v26)
    {
LABEL_46:
      BOOL v38 = 1;
      goto LABEL_111;
    }
    goto LABEL_37;
  }
LABEL_47:
  BOOL v38 = 0;
  if (capabilities::radio::supportsAutomaticRadarFiling(v23))
  {
    uint64_t v74 = a3;
    if (!a5)
    {
      BOOL v38 = 0;
      int v39 = *((char *)a4 + 23);
      int64_t v40 = v39 >= 0 ? *((unsigned __int8 *)a4 + 23) : *((void *)a4 + 1);
      if (v40 && *v74 != 1)
      {
        int v41 = v77;
        if (v77 == &v76) {
          goto LABEL_110;
        }
        if (v39 >= 0) {
          v42 = (char *)a4;
        }
        else {
          v42 = *(char **)a4;
        }
        v43 = &v42[v40];
        while (1)
        {
          int v44 = *((char *)v41 + 39);
          long long v45 = v44 >= 0 ? v41 + 2 : (char **)v41[2];
          int64_t v46 = v44 >= 0 ? *((unsigned __int8 *)v41 + 39) : (int64_t)v41[3];
          if (!v46) {
            break;
          }
          if (v40 >= v46)
          {
            int v47 = *(char *)v45;
            int64_t v48 = v40;
            unint64_t v49 = v42;
            do
            {
              int64_t v50 = v48 - v46;
              if (v50 == -1) {
                break;
              }
              long long v51 = (char *)memchr(v49, v47, v50 + 1);
              if (!v51) {
                break;
              }
              v52 = v51;
              if (!memcmp(v51, v45, v46))
              {
                if (v52 == v43 || v52 - v42 == -1) {
                  break;
                }
                goto LABEL_76;
              }
              unint64_t v49 = v52 + 1;
              int64_t v48 = v43 - (v52 + 1);
            }
            while (v48 >= v46);
          }
          BOOL v38 = 0;
          int v41 = (char **)v41[1];
          if (v41 == &v76) {
            goto LABEL_111;
          }
        }
LABEL_76:
        *uint64_t v74 = *((_DWORD *)v41 + 10);
        int v25 = *((char *)a4 + 23);
        if (v25 >= 0) {
          int64_t v26 = *((unsigned __int8 *)a4 + 23);
        }
        else {
          int64_t v26 = *((void *)a4 + 1);
        }
        if (!v26) {
          goto LABEL_46;
        }
LABEL_37:
        if (v25 >= 0) {
          timespec v27 = (char *)a4;
        }
        else {
          timespec v27 = *(char **)a4;
        }
        v28 = (const void *)qword_26A99F788;
        int64_t v29 = strlen((const char *)qword_26A99F788);
        if (v29)
        {
          int64_t v30 = v29;
          v31 = &v27[v26];
          if (v26 >= v29)
          {
            int v53 = *(char *)qword_26A99F788;
            int64_t v54 = v26;
            v55 = v27;
            do
            {
              int64_t v56 = v54 - v30;
              if (v56 == -1) {
                break;
              }
              v57 = (char *)memchr(v55, v53, v56 + 1);
              if (!v57) {
                break;
              }
              v58 = v57;
              if (!memcmp(v57, v28, v30))
              {
                if (v58 != v31 && v58 - v27 != -1) {
                  goto LABEL_110;
                }
                break;
              }
              v55 = v58 + 1;
              int64_t v54 = v31 - (v58 + 1);
            }
            while (v54 >= v30);
          }
          long long v32 = (const void *)qword_26A99F790;
          int64_t v33 = strlen((const char *)qword_26A99F790);
          if (v33)
          {
            int64_t v34 = v33;
            if (v26 >= v33)
            {
              int v59 = *(char *)qword_26A99F790;
              int64_t v60 = v26;
              v61 = v27;
              do
              {
                int64_t v62 = v60 - v34;
                if (v62 == -1) {
                  break;
                }
                v63 = (char *)memchr(v61, v59, v62 + 1);
                if (!v63) {
                  break;
                }
                char v64 = v63;
                if (!memcmp(v63, v32, v34))
                {
                  if (v64 != v31 && v64 - v27 != -1) {
                    goto LABEL_110;
                  }
                  break;
                }
                v61 = v64 + 1;
                int64_t v60 = v31 - (v64 + 1);
              }
              while (v60 >= v34);
            }
            v35 = (const void *)qword_26A99F798;
            int64_t v36 = strlen((const char *)qword_26A99F798);
            if (v36)
            {
              int64_t v37 = v36;
              if (v26 >= v36)
              {
                int v65 = *(char *)qword_26A99F798;
                v66 = v27;
                while (v26 - v37 != -1)
                {
                  stat v67 = (char *)memchr(v66, v65, v26 - v37 + 1);
                  if (!v67) {
                    break;
                  }
                  v68 = v67;
                  if (!memcmp(v67, v35, v37))
                  {
                    if (v68 == v31 || v68 - v27 == -1) {
                      goto LABEL_46;
                    }
                    goto LABEL_110;
                  }
                  v66 = v68 + 1;
                  int64_t v26 = v31 - (v68 + 1);
                  if (v26 < v37) {
                    goto LABEL_46;
                  }
                }
              }
              goto LABEL_46;
            }
          }
        }
LABEL_110:
        BOOL v38 = 0;
      }
    }
  }
LABEL_111:
  if (v78)
  {
    std::locale v69 = v76;
    v70 = v77;
    v71 = *v77;
    *((void *)v71 + 1) = *((void *)v76 + 1);
    **((void **)v69 + 1) = v71;
    uint64_t v78 = 0;
    if (v70 != &v76)
    {
      do
      {
        v73 = (char **)v70[1];
        if (*((char *)v70 + 39) < 0) {
          operator delete(v70[2]);
        }
        operator delete(v70);
        v70 = v73;
      }
      while (v73 != &v76);
    }
  }
  return v38;
}

- (void)showUserNotification:(int)a3 dumpReason:()basic_string<char
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *(_OWORD *)&v23.__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)size_t v24 = 0u;
  memset(v25, 0, sizeof(v25));
  *((unsigned char *)&v23.__r_.__value_.__s + 23) = 7;
  strcpy((char *)&v23, "LogDump");
  if (-[ABMTapToRadar checkTraces_sync:](self, "checkTraces_sync:"))
  {
    if (SHIBYTE(v25[0]) < 0)
    {
      v24[1] = (void *)20;
      uint64_t v6 = (char *)v24[0];
    }
    else
    {
      HIBYTE(v25[0]) = 20;
      uint64_t v6 = (char *)v24;
    }
    strcpy(v6, "Telephony_Dump_Ready");
  }
  else
  {
    std::string::__assign_external((std::string *)v24, "Telephony_Dump_Insufficient", 0x1BuLL);
  }
  GetABMLogServer(&v21);
  uint64_t v7 = *((void *)GetGlobalLogger(&v21) + 4);
  size_t v8 = v22;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
  }
  else if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_14;
  }
  if (v25[0] >= 0) {
    size_t v9 = v24;
  }
  else {
    size_t v9 = (void **)v24[0];
  }
  *(_DWORD *)buf = 67109378;
  *(_DWORD *)&buf[4] = a3;
  *(_WORD *)&buf[8] = 2080;
  *(void *)&buf[10] = v9;
  _os_log_impl(&dword_26368A000, v7, OS_LOG_TYPE_DEFAULT, "#I Show user notification for radarType: %d with header: %s", buf, 0x12u);
LABEL_14:
  char v10 = *((unsigned char *)&a4->var0.var0.var0.var1 + 23);
  if ((v10 & 0x80000000) == 0)
  {
    if (!*((unsigned char *)&a4->var0.var0.var0.var1 + 23)) {
      goto LABEL_16;
    }
LABEL_19:
    if (v10 >= 0) {
      size_t var1 = *((unsigned __int8 *)&a4->var0.var0.var0.var1 + 23);
    }
    else {
      size_t var1 = a4->var0.var0.var0.var1.var1;
    }
    unint64_t v12 = var1 + 8;
    memset(buf, 170, sizeof(buf));
    if (var1 + 8 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v12 >= 0x17)
    {
      uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17) {
        uint64_t v14 = v12 | 7;
      }
      uint64_t v15 = v14 + 1;
      uint64_t v16 = operator new(v14 + 1);
      *(void *)&buf[8] = var1 + 8;
      *(void *)&buf[16] = v15 | 0x8000000000000000;
      *(void *)buf = v16;
      *uint64_t v16 = 0x203A6E6F73616552;
      int v13 = (uint8_t *)(v16 + 1);
    }
    else
    {
      int v13 = &buf[8];
      buf[9] = 0;
      *(_WORD *)&buf[10] = 0;
      *(_DWORD *)&buf[12] = 0;
      *(void *)&buf[16] = 0;
      buf[23] = var1 + 8;
      strcpy((char *)buf, "Reason: ");
      if (!var1)
      {
        buf[8] = 0;
        if ((SHIBYTE(v25[3]) & 0x80000000) == 0) {
          goto LABEL_26;
        }
        goto LABEL_54;
      }
    }
    if (v10 >= 0) {
      std::string var0 = a4;
    }
    else {
      std::string var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->var0.var0.var0.var1.var0;
    }
    memmove(v13, var0, var1);
    v13[var1] = 0;
    if ((SHIBYTE(v25[3]) & 0x80000000) == 0)
    {
LABEL_26:
      *(_OWORD *)&v25[1] = *(_OWORD *)buf;
      v25[3] = *(void *)&buf[16];
      if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_27;
    }
LABEL_54:
    operator delete((void *)v25[1]);
    goto LABEL_26;
  }
  if (a4->var0.var0.var0.var1.var1) {
    goto LABEL_19;
  }
LABEL_16:
  if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_17:
    std::string v18 = v23;
    goto LABEL_28;
  }
LABEL_27:
  std::string::__init_copy_ctor_external(&v18, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
LABEL_28:
  if (SHIBYTE(v25[0]) < 0)
  {
    std::string::__init_copy_ctor_external(&v19, (const std::string::value_type *)v24[0], (std::string::size_type)v24[1]);
  }
  else
  {
    *(_OWORD *)&v19.__r_.__value_.__l.__data_ = *(_OWORD *)v24;
    v19.__r_.__value_.__r.__words[2] = v25[0];
  }
  if (SHIBYTE(v25[3]) < 0) {
    std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v25[1], v25[2]);
  }
  else {
    std::string __p = *(std::string *)&v25[1];
  }
  support::ui::showNotification(1u, (uint64_t)&v18, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_36:
      if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_43;
    }
  }
  else if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_36;
  }
  operator delete(v19.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_37:
    if ((SHIBYTE(v25[3]) & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_44;
  }
LABEL_43:
  operator delete(v18.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v25[3]) & 0x80000000) == 0)
  {
LABEL_38:
    if ((SHIBYTE(v25[0]) & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_45;
  }
LABEL_44:
  operator delete((void *)v25[1]);
  if ((SHIBYTE(v25[0]) & 0x80000000) == 0)
  {
LABEL_39:
    if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_46:
    operator delete(v23.__r_.__value_.__l.__data_);
    return;
  }
LABEL_45:
  operator delete(v24[0]);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_46;
  }
}

- (void)showNotification:(int)a3 :()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> ::
{
  uint64_t v7 = v6;
  uint64_t v8 = v4;
  fObj = self->fQueue.fObj.fObj;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3321888768;
  v11[2] = __38__ABMTapToRadar_showNotification___::__block_invoke;
  v11[3] = &unk_270EAB298;
  v11[4] = self;
  int v16 = a3;
  if (*(char *)(v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
    if ((*((char *)&a4->var0.var0.var0.var1 + 23) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    std::string v12 = *(std::string *)v5;
    if ((*((char *)&a4->var0.var0.var0.var1 + 23) & 0x80000000) == 0)
    {
LABEL_3:
      __rep var0 = a4->var0.var0;
      goto LABEL_6;
    }
  }
  std::string::__init_copy_ctor_external((std::string *)&var0, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
LABEL_6:
  if (*(char *)(v8 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v14, *(const std::string::value_type **)v8, *(void *)(v8 + 8));
  }
  else {
    std::string v14 = *(std::string *)v8;
  }
  if (*(char *)(v7 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *(void *)(v7 + 8));
  }
  else {
    std::string __p = *(std::string *)v7;
  }
  dispatch_async(fObj, v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_14:
      if ((*((char *)&var0.var0.var1 + 23) & 0x80000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_19;
    }
  }
  else if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_14;
  }
  operator delete(v14.__r_.__value_.__l.__data_);
  if ((*((char *)&var0.var0.var1 + 23) & 0x80000000) == 0)
  {
LABEL_15:
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_20:
    operator delete(v12.__r_.__value_.__l.__data_);
    return;
  }
LABEL_19:
  operator delete(var0.var0.var1.var0);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_20;
  }
}

void __38__ABMTapToRadar_showNotification___::__block_invoke(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD **)(a1 + 32);
  if (!v2[2]
    || !objc_msgSend(v2, "checkTraces_sync:", *(unsigned int *)(a1 + 136))
    || *(_DWORD *)(a1 + 136) == 5 && !objc_msgSend(*(id *)(a1 + 32), "checkAudioTraces_sync"))
  {
    return;
  }
  memset(v70, 170, sizeof(v70));
  size_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (const void *)*MEMORY[0x263F204D0];
  size_t v5 = strlen((const char *)*MEMORY[0x263F204D0]);
  if (v5 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v6 = (void *)v5;
  if (v5 >= 0x17)
  {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v8 = v5 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t v7 = (void **)operator new(v8 + 1);
    __dst[1] = v6;
    unint64_t v69 = v9 | 0x8000000000000000;
    __dst[0] = v7;
    goto LABEL_12;
  }
  HIBYTE(v69) = v5;
  uint64_t v7 = __dst;
  if (v5) {
LABEL_12:
  }
    memmove(v7, v4, (size_t)v6);
  *((unsigned char *)v6 + (void)v7) = 0;
  int v10 = *(char *)(a1 + 63);
  if (v10 >= 0) {
    size_t v11 = *(unsigned __int8 *)(a1 + 63);
  }
  else {
    size_t v11 = *(void *)(a1 + 48);
  }
  unint64_t v12 = v11 + 2;
  memset(__p, 170, sizeof(__p));
  if (v11 + 2 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v12 >= 0x17)
  {
    uint64_t v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v15 = v12 | 7;
    }
    uint64_t v16 = v15 + 1;
    int v13 = operator new(v15 + 1);
    __p[1] = (void *)(v11 + 2);
    __p[2] = (void *)(v16 | 0x8000000000000000);
    __p[0] = v13;
  }
  else
  {
    memset(__p, 0, sizeof(__p));
    int v13 = __p;
    HIBYTE(__p[2]) = v11 + 2;
    if (!v11)
    {
      strcpy((char *)__p, ".*");
      if (v3) {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  if (v10 >= 0) {
    size_t v17 = (const void *)(a1 + 40);
  }
  else {
    size_t v17 = *(const void **)(a1 + 40);
  }
  memmove(v13, v17, v11);
  strcpy((char *)v13 + v11, ".*");
  if (v3)
  {
LABEL_20:
    [v3 findLogFiles_sync:__dst, __p];
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  memset(v70, 0, sizeof(v70));
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
LABEL_21:
    if ((SHIBYTE(v69) & 0x80000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  operator delete(__p[0]);
  if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
LABEL_22:
    std::string v14 = (void **)v70[1];
    if (v70[1] == v70[0]) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }
LABEL_34:
  operator delete(__dst[0]);
  std::string v14 = (void **)v70[1];
  if (v70[1] == v70[0])
  {
LABEL_23:
    if (!v14) {
      return;
    }
    goto LABEL_96;
  }
LABEL_35:
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  GetABMLogServer(&v63);
  abm::HelperClient::create();
  std::string v18 = v64;
  if (v64 && !atomic_fetch_add(&v64->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  uint64_t v20 = MEMORY[0x263EF8708];
  if (v19 || (xpc_object_t v19 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v19) == v20)
    {
      xpc_retain(v19);
      xpc_object_t v21 = v19;
    }
    else
    {
      xpc_object_t v21 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v21 = xpc_null_create();
    xpc_object_t v19 = 0;
  }
  xpc_release(v19);
  xpc_object_t v22 = xpc_int64_create(*(unsigned int *)(a1 + 136));
  if (!v22) {
    xpc_object_t v22 = xpc_null_create();
  }
  xpc_dictionary_set_value(v21, (const char *)*MEMORY[0x263F20550], v22);
  xpc_object_t v23 = xpc_null_create();
  xpc_release(v22);
  xpc_release(v23);
  size_t v24 = (const char *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0) {
    size_t v24 = *(const char **)v24;
  }
  xpc_object_t v25 = xpc_string_create(v24);
  if (!v25) {
    xpc_object_t v25 = xpc_null_create();
  }
  xpc_dictionary_set_value(v21, (const char *)*MEMORY[0x263F20560], v25);
  xpc_object_t v26 = xpc_null_create();
  xpc_release(v25);
  xpc_release(v26);
  uint64_t v27 = (const char *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0) {
    uint64_t v27 = *(const char **)v27;
  }
  xpc_object_t v28 = xpc_string_create(v27);
  if (!v28) {
    xpc_object_t v28 = xpc_null_create();
  }
  xpc_dictionary_set_value(v21, (const char *)*MEMORY[0x263F205A0], v28);
  xpc_object_t v29 = xpc_null_create();
  xpc_release(v28);
  xpc_release(v29);
  int64_t v30 = (const char *)(a1 + 112);
  if (*(char *)(a1 + 135) < 0) {
    int64_t v30 = *(const char **)v30;
  }
  xpc_object_t v31 = xpc_string_create(v30);
  if (!v31) {
    xpc_object_t v31 = xpc_null_create();
  }
  xpc_dictionary_set_value(v21, (const char *)*MEMORY[0x263F20610], v31);
  xpc_object_t v32 = xpc_null_create();
  xpc_release(v31);
  xpc_release(v32);
  xpc_object_t v33 = xpc_int64_create(0);
  if (!v33) {
    xpc_object_t v33 = xpc_null_create();
  }
  xpc_dictionary_set_value(v21, (const char *)*MEMORY[0x263F20588], v33);
  xpc_object_t v34 = xpc_null_create();
  xpc_release(v33);
  xpc_release(v34);
  xpc_object_t v35 = xpc_array_create(0, 0);
  if (v35 || (xpc_object_t v35 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v35) == MEMORY[0x263EF86D8])
    {
      xpc_retain(v35);
      xpc_object_t v36 = v35;
    }
    else
    {
      xpc_object_t v36 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v36 = xpc_null_create();
    xpc_object_t v35 = 0;
  }
  xpc_release(v35);
  uint64_t v37 = v70[0];
  uint64_t v38 = v70[1];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3321888768;
  int64_t v60 = __38__ABMTapToRadar_showNotification___::__block_invoke_2;
  v61 = &__block_descriptor_40_e8_32c16_ZTSN3xpc5arrayE_e10_v16__0r_v8l;
  xpc_object_t v62 = v36;
  if (v36) {
    xpc_retain(v36);
  }
  else {
    xpc_object_t v62 = xpc_null_create();
  }
  while (v37 != v38)
  {
    v60((uint64_t)v59, v37);
    v37 += 24;
  }
  if (v36)
  {
    xpc_retain(v36);
    xpc_object_t v39 = v36;
  }
  else
  {
    xpc_object_t v39 = xpc_null_create();
  }
  xpc_dictionary_set_value(v21, (const char *)*MEMORY[0x263F20638], v39);
  xpc_object_t v40 = xpc_null_create();
  xpc_release(v39);
  xpc_release(v40);
  xpc_object_t v58 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v41 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v42 = v41;
  if (v41)
  {
    xpc_object_t v58 = v41;
  }
  else
  {
    xpc_object_t v42 = xpc_null_create();
    xpc_object_t v58 = v42;
    if (!v42)
    {
      xpc_object_t v43 = xpc_null_create();
      xpc_object_t v42 = 0;
      goto LABEL_81;
    }
  }
  if (MEMORY[0x263E6A240](v42) == v20)
  {
    xpc_retain(v42);
    goto LABEL_82;
  }
  xpc_object_t v43 = xpc_null_create();
LABEL_81:
  xpc_object_t v58 = v43;
LABEL_82:
  xpc_release(v42);
  *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)int64_t v56 = v44;
  long long v57 = v44;
  xpc_object_t object = v21;
  if (v21) {
    xpc_retain(v21);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::HelperClient::perform();
  xpc_release(object);
  xpc_object_t object = 0;
  if (LODWORD(v56[0]))
  {
    GetABMLogServer(&v53);
    long long v45 = *((void *)GetGlobalLogger(&v53) + 4);
    int64_t v46 = v54;
    if (v54 && !atomic_fetch_add(&v54->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      xpc::dict::to_debug_string((xpc::dict *)v51, (uint64_t)v21);
      int64_t v50 = v52 >= 0 ? v51 : (void **)v51[0];
      *(_DWORD *)buf = 136315138;
      v72 = v50;
      _os_log_error_impl(&dword_26368A000, v45, OS_LOG_TYPE_ERROR, "Failed to file the radar: %s", buf, 0xCu);
      if (v52 < 0) {
        operator delete(v51[0]);
      }
    }
  }
  if (SHIBYTE(v57) < 0) {
    operator delete(v56[1]);
  }
  xpc_release(v58);
  xpc_release(v62);
  xpc_object_t v62 = 0;
  xpc_release(v36);
  xpc_release(v21);
  int v47 = (std::__shared_weak_count *)v66;
  if (v66 && !atomic_fetch_add((atomic_ullong *volatile)(v66 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
  }
  std::string v14 = (void **)v70[0];
  if (v70[0])
  {
LABEL_96:
    int64_t v48 = (void **)v70[1];
    unint64_t v49 = v14;
    if ((void **)v70[1] != v14)
    {
      do
      {
        if (*((char *)v48 - 1) < 0) {
          operator delete(*(v48 - 3));
        }
        v48 -= 3;
      }
      while (v48 != v14);
      unint64_t v49 = (void **)v70[0];
    }
    v70[1] = v14;
    operator delete(v49);
  }
}

void __38__ABMTapToRadar_showNotification___::__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) >= 0) {
    size_t v3 = (const char *)a2;
  }
  else {
    size_t v3 = *(const char **)a2;
  }
  xpc_object_t v4 = xpc_string_create(v3);
  if (!v4) {
    xpc_object_t v4 = xpc_null_create();
  }
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);
  xpc_release(v4);
}

- (void).cxx_destruct
{
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end
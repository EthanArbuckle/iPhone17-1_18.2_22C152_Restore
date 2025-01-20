void sub_26377C660(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C66C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, boost::signals2::detail::connection_body_base *a11)
{
  if (a2)
  {
    __cxa_end_catch();
    v11 = (atomic_uint *)*((void *)a11 + 5);
    if (v11)
    {
      if (atomic_fetch_add(v11 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v11 + 16))(v11);
        if (atomic_fetch_add(v11 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v11 + 24))(v11);
        }
      }
    }
    boost::signals2::detail::connection_body_base::~connection_body_base(a11);
    JUMPOUT(0x26377C9C8);
  }
  _Unwind_Resume(a1);
}

void sub_26377C700(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C70C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C718(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x26377C724);
  }
  _Unwind_Resume(a1);
}

void sub_26377C730(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x26377C73CLL);
  }
  _Unwind_Resume(a1);
}

void sub_26377C748(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    unint64_t v2 = STACK[0x218];
    if (STACK[0x218])
    {
      if ((uint64_t)(STACK[0x220] - 1) >= 0)
      {
        unint64_t v3 = v2 + 16 * STACK[0x220];
        do
        {
          v4 = *(atomic_uint **)(v3 - 8);
          if (v4)
          {
            if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
              if (atomic_fetch_add(v4 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v4 + 24))(v4);
              }
            }
          }
          v3 -= 16;
        }
        while (v3 > v2);
      }
      if (STACK[0x210] >= 0xB) {
        operator delete((void *)STACK[0x218]);
      }
    }
    JUMPOUT(0x26377CA94);
  }
  _Unwind_Resume(a1);
}

void sub_26377C810(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C81C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x26377C824);
  }
  _Unwind_Resume(a1);
}

void sub_26377C850(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x26377C858);
  }
  _Unwind_Resume(a1);
}

void sub_26377C864(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C884(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C890(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  if (a2)
  {
    boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::~shared_ptr((uint64_t)&a51);
    boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock((uint64_t)&a55);
    boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot(&a39);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a37);
    JUMPOUT(0x26377CAA4);
  }
  _Unwind_Resume(a1);
}

void sub_26377C8A8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char *__p,char *a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  if (a2)
  {
    boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::~function1(&a55);
    boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>::~function(&a51);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a49);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a47);
    if (a42)
    {
      if ((a42 & 1) == 0)
      {
        v55 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(a42 & 0xFFFFFFFFFFFFFFFELL);
        if (v55) {
          v55(&a43, &a43, 2);
        }
      }
    }
    if (__p)
    {
      v56 = a40;
      v57 = __p;
      if (a40 != __p)
      {
        do
        {
          v56 -= 24;
          boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content((uint64_t)v56);
        }
        while (v56 != __p);
        v57 = __p;
      }
      operator delete(v57);
    }
    JUMPOUT(0x26377CA9CLL);
  }
  _Unwind_Resume(a1);
}

void sub_26377C94C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C958(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C968(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377C974(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy(v3);
    std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>::~list(v2);
    operator delete(v2);
    JUMPOUT(0x26377C9C8);
  }
  _Unwind_Resume(a1);
}

void sub_26377CA70(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_26377CA7C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  if (!a2) {
    JUMPOUT(0x26377CA84);
  }
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock(&a55);
  boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot(&a39);
  ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot(&a37);
  JUMPOUT(0x26377CAA4);
}

void TraceManager::handleDumpLogsIndication_sync(uint64_t a1, const __CFDictionary **a2)
{
  v4 = *(NSObject **)(a1 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_26368A000, v4, OS_LOG_TYPE_DEFAULT, "#I Received Dump logs indication from Baseband", buf, 2u);
  }
  memset(buf, 170, 24);
  Timestamp::Timestamp((Timestamp *)buf);
  memset(&__dst, 170, sizeof(__dst));
  v5 = (const void *)*MEMORY[0x263F25DD8];
  size_t v6 = strlen((const char *)*MEMORY[0x263F25DD8]);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v15 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v15 = v6 | 7;
    }
    uint64_t v16 = v15 + 1;
    p_dst = (std::string *)operator new(v15 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v16 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v6;
    p_dst = &__dst;
    if (!v6)
    {
      __dst.__r_.__value_.__s.__data_[0] = 0;
      CFDictionaryRef v9 = *a2;
      if (*a2) {
        v10 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
      }
      else {
        v10 = 0;
      }
      if (v10) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  memmove(p_dst, v5, v7);
  p_dst->__r_.__value_.__s.__data_[v7] = 0;
  CFDictionaryRef v9 = *a2;
  if (*a2) {
    v17 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    v17 = 0;
  }
  if (v17)
  {
LABEL_10:
    v49[0] = 0xAAAAAAAAAAAAAAAALL;
    v49[1] = 0xAAAAAAAAAAAAAAAALL;
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v49, v9);
    v11 = (const void *)*MEMORY[0x263F25E58];
    size_t v12 = strlen((const char *)*MEMORY[0x263F25E58]);
    if (v12 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    v13 = (void *)v12;
    if (v12 >= 0x17)
    {
      uint64_t v19 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17) {
        uint64_t v19 = v12 | 7;
      }
      uint64_t v20 = v19 + 1;
      v14 = operator new(v19 + 1);
      __p[1] = v13;
      unint64_t v47 = v20 | 0x8000000000000000;
      __p[0] = v14;
    }
    else
    {
      HIBYTE(v47) = v12;
      v14 = __p;
      if (!v12)
      {
LABEL_26:
        *((unsigned char *)v13 + (void)v14) = 0;
        ctu::cf::map_adapter::getString();
        if (SHIBYTE(v48[2]) >= 0) {
          v21 = v48;
        }
        else {
          v21 = (void **)v48[0];
        }
        if (SHIBYTE(v48[2]) >= 0) {
          std::string::size_type v22 = HIBYTE(v48[2]);
        }
        else {
          std::string::size_type v22 = (std::string::size_type)v48[1];
        }
        std::string::append(&__dst, (const std::string::value_type *)v21, v22);
        if (SHIBYTE(v48[2]) < 0)
        {
          operator delete(v48[0]);
          if ((SHIBYTE(v47) & 0x80000000) == 0) {
            goto LABEL_34;
          }
        }
        else if ((SHIBYTE(v47) & 0x80000000) == 0)
        {
          goto LABEL_34;
        }
        operator delete(__p[0]);
LABEL_34:
        memset(v48, 170, sizeof(v48));
        HIBYTE(v47) = 0;
        LOBYTE(__p[0]) = 0;
        ctu::cf::map_adapter::getString();
        if (SHIBYTE(v47) < 0) {
          operator delete(__p[0]);
        }
        LODWORD(__p[0]) = 1;
        v23 = (const char *)radio::asString();
        v24 = v23;
        int v25 = SHIBYTE(v48[2]);
        if (SHIBYTE(v48[2]) >= 0) {
          size_t v26 = HIBYTE(v48[2]);
        }
        else {
          size_t v26 = (size_t)v48[1];
        }
        if (v26 == strlen(v23))
        {
          if (SHIBYTE(v48[2]) >= 0) {
            v27 = v48;
          }
          else {
            v27 = (void **)v48[0];
          }
          if (!memcmp(v27, v24, v26)) {
            int64_t v18 = 5;
          }
          else {
            int64_t v18 = 2;
          }
          if ((v25 & 0x80000000) == 0) {
            goto LABEL_50;
          }
        }
        else
        {
          int64_t v18 = 2;
          if ((SHIBYTE(v48[2]) & 0x80000000) == 0)
          {
LABEL_50:
            MEMORY[0x263E68CD0](v49);
            goto LABEL_51;
          }
        }
        operator delete(v48[0]);
        goto LABEL_50;
      }
    }
    memmove(v14, v11, (size_t)v13);
    goto LABEL_26;
  }
LABEL_21:
  int64_t v18 = 2;
LABEL_51:
  xpc_object_t v28 = xpc_dictionary_create(0, 0, 0);
  if (v28 || (xpc_object_t v28 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v28) == MEMORY[0x263EF8708])
    {
      xpc_retain(v28);
      xpc_object_t v29 = v28;
    }
    else
    {
      xpc_object_t v29 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v29 = xpc_null_create();
    xpc_object_t v28 = 0;
  }
  xpc_release(v28);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v30 = &__dst;
  }
  else {
    v30 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v31 = xpc_string_create((const char *)v30);
  if (!v31) {
    xpc_object_t v31 = xpc_null_create();
  }
  xpc_dictionary_set_value(v29, (const char *)*MEMORY[0x263F263C0], v31);
  xpc_object_t v32 = xpc_null_create();
  xpc_release(v31);
  xpc_release(v32);
  xpc_object_t v33 = xpc_int64_create(v18);
  if (!v33) {
    xpc_object_t v33 = xpc_null_create();
  }
  xpc_dictionary_set_value(v29, (const char *)*MEMORY[0x263F25E10], v33);
  xpc_object_t v34 = xpc_null_create();
  xpc_release(v33);
  xpc_release(v34);
  Timestamp::asString((uint64_t)buf, 0, 9, v48);
  if (SHIBYTE(v48[2]) >= 0) {
    v35 = v48;
  }
  else {
    v35 = (void **)v48[0];
  }
  xpc_object_t v36 = xpc_string_create((const char *)v35);
  if (!v36) {
    xpc_object_t v36 = xpc_null_create();
  }
  xpc_dictionary_set_value(v29, (const char *)*MEMORY[0x263F26030], v36);
  xpc_object_t v37 = xpc_null_create();
  xpc_release(v36);
  xpc_release(v37);
  if (SHIBYTE(v48[2]) < 0) {
    operator delete(v48[0]);
  }
  v38 = (const void *)*MEMORY[0x263F261B0];
  size_t v39 = strlen((const char *)*MEMORY[0x263F261B0]);
  if (v39 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v40 = (void *)v39;
  if (v39 >= 0x17)
  {
    uint64_t v42 = (v39 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v39 | 7) != 0x17) {
      uint64_t v42 = v39 | 7;
    }
    uint64_t v43 = v42 + 1;
    v41 = operator new(v42 + 1);
    v48[1] = v40;
    v48[2] = (void *)(v43 | 0x8000000000000000);
    v48[0] = v41;
LABEL_81:
    memmove(v41, v38, (size_t)v40);
    *((unsigned char *)v40 + (void)v41) = 0;
    xpc_object_t object = v29;
    if (v29) {
      goto LABEL_77;
    }
    goto LABEL_82;
  }
  HIBYTE(v48[2]) = v39;
  v41 = v48;
  if (v39) {
    goto LABEL_81;
  }
  LOBYTE(v48[0]) = 0;
  xpc_object_t object = v29;
  if (v29)
  {
LABEL_77:
    xpc_retain(v29);
    goto LABEL_83;
  }
LABEL_82:
  xpc_object_t object = xpc_null_create();
LABEL_83:
  v44 = 0;
  Service::runCommand(a1, (uint64_t)v48, &object, &v44);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v48[2]) < 0) {
    operator delete(v48[0]);
  }
  xpc_release(v29);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)buf, *(void **)&buf[8]);
}

void sub_26377D084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E68CD0](&a24);
  if (a31 < 0)
  {
    operator delete(a26);
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v31 - 96, *(void **)(v31 - 88));
    _Unwind_Resume(a1);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v31 - 96, *(void **)(v31 - 88));
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager4initEv_block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = (const void *)*MEMORY[0x263F204C0];
  size_t v3 = strlen((const char *)*MEMORY[0x263F204C0]);
  if (v3 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v4 = v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    p_p = operator new(v6 + 1);
    *(void *)&long long v19 = v4;
    *((void *)&v19 + 1) = v7 | 0x8000000000000000;
    __p = p_p;
    goto LABEL_8;
  }
  HIBYTE(v19) = v3;
  p_p = &__p;
  if (v3) {
LABEL_8:
  }
    memmove(p_p, v2, v4);
  *((unsigned char *)p_p + v4) = 0;
  v8 = (config::hw *)support::fs::removeDirContents((const char *)&__p, 0);
  if (SHIBYTE(v19) < 0) {
    operator delete(__p);
  }
  if (config::hw::watch(v8)
    && (TelephonyUtilIsInternalBuild() & 1) == 0
    && (TelephonyUtilIsCarrierBuild() & 1) == 0)
  {
    CFDictionaryRef v9 = (const void *)*MEMORY[0x263F204D0];
    size_t v10 = strlen((const char *)*MEMORY[0x263F204D0]);
    if (v10 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v11 = v10;
    if (v10 >= 0x17)
    {
      uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17) {
        uint64_t v13 = v10 | 7;
      }
      uint64_t v14 = v13 + 1;
      size_t v12 = operator new(v13 + 1);
      *(void *)&long long v19 = v11;
      *((void *)&v19 + 1) = v14 | 0x8000000000000000;
      __p = v12;
    }
    else
    {
      HIBYTE(v19) = v10;
      size_t v12 = &__p;
      if (!v10) {
        goto LABEL_22;
      }
    }
    memmove(v12, v9, v11);
LABEL_22:
    *((unsigned char *)v12 + v11) = 0;
    int v15 = support::fs::removeDirContents((const char *)&__p, 0x708uLL);
    if (SHIBYTE(v19) < 0) {
      operator delete(__p);
    }
    uint64_t v16 = *(NSObject **)(v1 + 88);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "failed";
      if (v15) {
        v17 = "success";
      }
      __p = (void *)0x1E04000202;
      LOWORD(v19) = 2080;
      *(void *)((char *)&v19 + 2) = v17;
      _os_log_impl(&dword_26368A000, v16, OS_LOG_TYPE_DEFAULT, "#I Deleting telephony log files older than %d mins %s", (uint8_t *)&__p, 0x12u);
    }
  }
}

void sub_26377D3F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void TraceManager::setupDumpLogsIndication_sync(NSObject **this)
{
  if (!capabilities::trace::supportsDumpLogIndication((capabilities::trace *)this)) {
    return;
  }
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v14 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = (CommandDriverFactory *)pthread_mutex_lock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  uint64_t v3 = off_26A99F170;
  if (!off_26A99F170)
  {
    CommandDriverFactory::create_default_global((uint64_t *)buf, v2);
    long long v4 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    v5 = (std::__shared_weak_count *)*(&off_26A99F170 + 1);
    off_26A99F170 = v4;
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v6 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    uint64_t v3 = off_26A99F170;
  }
  uint64_t v7 = (std::__shared_weak_count *)*(&off_26A99F170 + 1);
  if (*(&off_26A99F170 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F170 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(void *)v3 + 16))(&v11, v3);
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  if (v12)
  {
    uint64_t v14 = std::__shared_weak_count::lock(v12);
    if (v14) {
      unint64_t v13 = v11;
    }
    if (v12) {
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    unint64_t v8 = v13;
    if (v13) {
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v8 = v13;
    if (v13)
    {
LABEL_20:
      CFDictionaryRef v9 = this[11];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_26368A000, v9, OS_LOG_TYPE_DEFAULT, "#I Enabling Dump logs indication", buf, 2u);
      }
      (*(void (**)(unint64_t))(*(void *)v8 + 200))(v8);
    }
  }
  size_t v10 = v14;
  if (v14)
  {
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_26377D6B0(_Unwind_Exception *a1)
{
}

void sub_26377D6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_26377D6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

xpc::dict *xpc::dict::dict(xpc::dict *this, xpc_object_t object)
{
  *(void *)this = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    *(void *)this = xpc_null_create();
  }
  return this;
}

const char *TraceManager::getName(TraceManager *this)
{
  return "trace.mgr";
}

char *TraceManager::getShutdownStages@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  result = (char *)operator new(3uLL);
  a1[1] = result + 3;
  a1[2] = result + 3;
  *(_WORD *)result = 512;
  result[2] = 3;
  *a1 = result;
  return result;
}

void TraceManager::shutdown(uint64_t a1, int a2, NSObject **a3)
{
  if (a2 == 3)
  {
    uint64_t v6 = (uint64_t *)(a1 + 120);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1174405120;
    v10[2] = ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_14;
    v10[3] = &__block_descriptor_tmp_17_1;
    uint64_t v7 = *a3;
    v10[4] = a1;
    dispatch_group_t group = v7;
    if (v7)
    {
      dispatch_retain(v7);
      dispatch_group_enter(group);
    }
    ctu::SharedSynchronizable<TraceManager>::execute_wrapped(v6, (uint64_t)v10);
    if (group)
    {
      dispatch_group_leave(group);
      v5 = group;
      if (group) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    if (a2 != 2)
    {
      if (a2) {
        return;
      }
      uint64_t v3 = (uint64_t *)(a1 + 120);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 1174405120;
      v14[2] = ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke;
      v14[3] = &__block_descriptor_tmp_9_2;
      long long v4 = *a3;
      v14[4] = a1;
      dispatch_group_t v15 = v4;
      if (v4)
      {
        dispatch_retain(v4);
        dispatch_group_enter(v15);
      }
      ctu::SharedSynchronizable<TraceManager>::execute_wrapped(v3, (uint64_t)v14);
      if (!v15) {
        return;
      }
      dispatch_group_leave(v15);
      v5 = v15;
      if (!v15) {
        return;
      }
LABEL_18:
      dispatch_release(v5);
      return;
    }
    unint64_t v8 = (uint64_t *)(a1 + 120);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 1174405120;
    v12[2] = ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_10;
    v12[3] = &__block_descriptor_tmp_13_5;
    CFDictionaryRef v9 = *a3;
    v12[4] = a1;
    dispatch_group_t object = v9;
    if (v9)
    {
      dispatch_retain(v9);
      dispatch_group_enter(object);
    }
    ctu::SharedSynchronizable<TraceManager>::execute_wrapped(v8, (uint64_t)v12);
    if (object)
    {
      dispatch_group_leave(object);
      v5 = object;
      if (object) {
        goto LABEL_18;
      }
    }
  }
}

void ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  xpc_object_t v3 = xpc_null_create();
  uint64_t v4 = *MEMORY[0x263F205D0];
  v5 = *(NSObject **)(a1 + 40);
  uint64_t v7 = v5;
  xpc_object_t object = v3;
  if (v5)
  {
    dispatch_retain(v5);
    dispatch_group_enter(v5);
  }
  v6[0] = 0;
  v6[1] = 0;
  TraceManager::runOnHelper_sync(v2, (const char *)9, v4, 0x1F40u, 0, &object, &v7, v6);
  if (v5)
  {
    dispatch_group_leave(v5);
    dispatch_release(v5);
  }
  xpc_release(object);
}

void sub_26377DA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  if (v12)
  {
    dispatch_group_leave(v12);
    dispatch_release(v12);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void TraceManager::runOnHelper_sync(void *a1, const char *a2, uint64_t a3, unsigned int a4, char a5, xpc_object_t *a6, NSObject **a7, void **a8)
{
  int v13 = (int)a2;
  uint64_t v57 = *MEMORY[0x263EF8340];
  if ((a5 & 1) == 0
    && !prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F25E80], a2)
    && !prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F268F8], v15)
    && !prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F25EF0], v16))
  {
    return;
  }
  v17 = a1[11];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = abm::helper::asString();
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_26368A000, v17, OS_LOG_TYPE_DEFAULT, "#I Running helper action: %s:%s", buf, 0x16u);
  }
  memset(buf, 170, 16);
  GetABMLogServer(&v54);
  abm::HelperClient::create();
  int64_t v18 = v55;
  if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  uint64_t v19 = MEMORY[0x263E6A240](*a6);
  uint64_t v20 = MEMORY[0x263EF8708];
  if (v19 != MEMORY[0x263EF8708])
  {
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    if (v21 || (xpc_object_t v21 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E6A240](v21) == v20)
      {
        xpc_retain(v21);
        xpc_object_t v22 = v21;
      }
      else
      {
        xpc_object_t v22 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v22 = xpc_null_create();
      xpc_object_t v21 = 0;
    }
    xpc_release(v21);
    xpc_object_t v23 = xpc_null_create();
    xpc_object_t v24 = *a6;
    *a6 = v22;
    xpc_release(v24);
    xpc_release(v23);
  }
  if (a4)
  {
    xpc_object_t v25 = xpc_int64_create(a4);
    if (!v25) {
      xpc_object_t v25 = xpc_null_create();
    }
    xpc_dictionary_set_value(*a6, (const char *)*MEMORY[0x263F20540], v25);
    xpc_object_t v26 = xpc_null_create();
    xpc_release(v25);
    xpc_release(v26);
  }
  if (!*a8 || !a8[1])
  {
    xpc_object_t v28 = (std::__shared_weak_count *)a1[16];
    if (!v28 || (uint64_t v29 = a1[15], (v30 = std::__shared_weak_count::lock(v28)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v31 = v30;
    p_shared_weak_owners = &v30->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v30->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v31);
    }
    unint64_t v49 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v50 = 0xAAAAAAAAAAAAAAAALL;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TraceManager16runOnHelper_syncEN3abm6helper6TaskIDEPKcjbN3xpc4dictEN8dispatch13group_sessionENS7_8callbackIU13block_pointerFvN12TelephonyXPC6ResultES6_EEE_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_100_1;
    aBlock[4] = a1;
    aBlock[5] = v29;
    uint64_t v43 = v31;
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    xpc_object_t v33 = *a7;
    dispatch_group_t group = v33;
    if (v33)
    {
      dispatch_retain(v33);
      dispatch_group_enter(group);
    }
    uint64_t v45 = *(void *)buf;
    v46 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    int v48 = v13;
    uint64_t v47 = a3;
    xpc_object_t v34 = _Block_copy(aBlock);
    v35 = a1[17];
    if (v35) {
      dispatch_retain(v35);
    }
    unint64_t v49 = (unint64_t)v34;
    unint64_t v50 = (unint64_t)v35;
    xpc_object_t v41 = *a6;
    if (*a6)
    {
      xpc_retain(*a6);
      if (v34) {
        goto LABEL_39;
      }
    }
    else
    {
      xpc_object_t v41 = xpc_null_create();
      if (v34)
      {
LABEL_39:
        size_t v39 = _Block_copy(v34);
        xpc_object_t object = v35;
        if (!v35) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }
    size_t v39 = 0;
    xpc_object_t object = v35;
    if (!v35)
    {
LABEL_41:
      abm::HelperClient::perform();
      if (object) {
        dispatch_release(object);
      }
      if (v39) {
        _Block_release(v39);
      }
      xpc_release(v41);
      if (v35) {
        dispatch_release(v35);
      }
      if (v34) {
        _Block_release(v34);
      }
      xpc_object_t v36 = v46;
      if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v43) {
        std::__shared_weak_count::__release_weak(v43);
      }
      std::__shared_weak_count::__release_weak(v31);
      xpc_object_t v37 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8]) {
        goto LABEL_71;
      }
      return;
    }
LABEL_40:
    dispatch_retain(v35);
    goto LABEL_41;
  }
  xpc_object_t v53 = *a6;
  if (!v53)
  {
    xpc_object_t v53 = xpc_null_create();
    v27 = *a8;
    if (!*a8) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  xpc_retain(v53);
  v27 = *a8;
  if (*a8) {
LABEL_63:
  }
    v27 = _Block_copy(v27);
LABEL_64:
  v38 = a8[1];
  v51 = v27;
  dispatch_object_t v52 = v38;
  if (v38) {
    dispatch_retain(v38);
  }
  abm::HelperClient::perform();
  if (v52) {
    dispatch_release(v52);
  }
  if (v51) {
    _Block_release(v51);
  }
  xpc_release(v53);
  xpc_object_t v53 = 0;
  xpc_object_t v37 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
LABEL_71:
    if (!atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
}

void sub_26377E00C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, dispatch_group_t group, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,char a26)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_26377E13C(_Unwind_Exception *a1)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v1 - 112);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v3) == MEMORY[0x263EF8708])
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  v5 = (const char *)(v2 + 168);
  if (*(char *)(v2 + 191) < 0) {
    v5 = *(const char **)v5;
  }
  xpc_object_t v6 = xpc_string_create(v5);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x263F26000], v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  xpc_object_t object = v4;
  if (v4)
  {
    xpc_retain(v4);
    uint64_t v8 = *MEMORY[0x263F20648];
    CFDictionaryRef v9 = *(NSObject **)(a1 + 40);
    unint64_t v11 = v9;
    if (!v9) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  xpc_object_t object = xpc_null_create();
  uint64_t v8 = *MEMORY[0x263F20648];
  CFDictionaryRef v9 = *(NSObject **)(a1 + 40);
  unint64_t v11 = v9;
  if (v9)
  {
LABEL_13:
    dispatch_retain(v9);
    dispatch_group_enter(v9);
  }
LABEL_14:
  v10[0] = 0;
  v10[1] = 0;
  TraceManager::runOnHelper_sync((void *)v2, (const char *)9, v8, 0x1388u, 0, &object, &v11, v10);
  if (v9)
  {
    dispatch_group_leave(v9);
    dispatch_release(v9);
  }
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v4);
}

void sub_26377E308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  if (v13)
  {
    dispatch_group_leave(v13);
    dispatch_release(v13);
  }
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v12);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 160);
  *(void *)(v1 + 152) = 0;
  *(void *)(v1 + 160) = 0;
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
}

void TraceManager::initialize(uint64_t *a1, NSObject **a2)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1174405120;
  v11[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke;
  v11[3] = &__block_descriptor_tmp_45_2;
  xpc_object_t v3 = *a2;
  v11[4] = a1;
  dispatch_group_t group = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(group);
  }
  ctu::SharedSynchronizable<TraceManager>::execute_wrapped(a1 + 15, (uint64_t)v11);
  xpc_object_t v4 = (std::__shared_weak_count *)a1[16];
  if (!v4 || (v5 = a1[15], (xpc_object_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v7 = v6;
  uint64_t v8 = operator new(8uLL);
  void *v8 = a1;
  CFDictionaryRef v9 = a1[17];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  size_t v10 = operator new(0x18uLL);
  *size_t v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::initialize(dispatch::group_session)::$_0>(TraceManager::initialize(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::initialize(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::initialize(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 128);
  if (!v2 || (uint64_t v3 = *(void *)(v1 + 120), (v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v5 = v4;
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  TraceManager::initTraceHelper_sync((TraceManager *)v1);
  xpc_object_t v6 = *(std::__shared_weak_count **)(v1 + 128);
  if (!v6 || (uint64_t v7 = *(void *)(v1 + 120), (v8 = std::__shared_weak_count::lock(v6)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  CFDictionaryRef v9 = v8;
  size_t v10 = (const char **)MEMORY[0x263F26398];
  atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v9);
  }
  unint64_t v11 = *v10;
  size_t v12 = *(NSObject **)(v1 + 136);
  if (v12) {
    dispatch_retain(*(dispatch_object_t *)(v1 + 136));
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2;
  aBlock[3] = &__block_descriptor_tmp_19;
  aBlock[4] = v1;
  if (v11)
  {
    if (v12)
    {
      int v13 = _Block_copy(aBlock);
      uint64_t v14 = v13;
      dispatch_object_t v54 = v12;
      std::string __dst = (void **)MEMORY[0x263EF8330];
      uint64_t v48 = 1174405120;
      unint64_t v49 = (unint64_t)___ZN9analytics29registerCallbackForTimedEventI12TraceManagerEEvPKcNS_9TimerTypeENSt3__18weak_ptrIT_EEN8dispatch5queueEU13block_pointerFvNS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE_block_invoke;
      unint64_t v50 = &__block_descriptor_tmp_163;
      uint64_t v51 = v7;
      dispatch_object_t v52 = v9;
      atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      if (v13) {
        dispatch_group_t v15 = _Block_copy(v13);
      }
      else {
        dispatch_group_t v15 = 0;
      }
      xpc_object_t v53 = v15;
      analytics::registerCallbackForTimedEventImpl(v11);
      if (v54) {
        dispatch_release(v54);
      }
      if (v53) {
        _Block_release(v53);
      }
      if (v52) {
        std::__shared_weak_count::__release_weak(v52);
      }
      if (v14) {
        _Block_release(v14);
      }
    }
  }
  else if (v12)
  {
    dispatch_release(v12);
  }
  std::__shared_weak_count::__release_weak(v9);
  uint64_t v16 = (const void *)*MEMORY[0x263F26740];
  size_t v17 = strlen((const char *)*MEMORY[0x263F26740]);
  if (v17 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v18 = v17;
  if (v17 >= 0x17)
  {
    uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v20 = v17 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = (void **)operator new(v20 + 1);
    uint64_t v48 = v18;
    unint64_t v49 = v21 | 0x8000000000000000;
    std::string __dst = p_dst;
    goto LABEL_33;
  }
  HIBYTE(v49) = v17;
  p_dst = (void **)&__dst;
  if (v17) {
LABEL_33:
  }
    memmove(p_dst, v16, v18);
  *((unsigned char *)p_dst + v18) = 0;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 1174405120;
  v43[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_3;
  v43[3] = &__block_descriptor_tmp_26_0;
  v43[4] = v1;
  v43[5] = v3;
  v44 = v5;
  atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v22 = _Block_copy(v43);
  uint64_t v45 = v22;
  Service::registerCommandHandler(v1, (uint64_t)&__dst, &v45);
  if (v22) {
    _Block_release(v22);
  }
  if (SHIBYTE(v49) < 0) {
    operator delete(__dst);
  }
  xpc_object_t v23 = (const void *)*MEMORY[0x263F26730];
  size_t v24 = strlen((const char *)*MEMORY[0x263F26730]);
  if (v24 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v25 = v24;
  if (v24 >= 0x17)
  {
    uint64_t v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17) {
      uint64_t v27 = v24 | 7;
    }
    uint64_t v28 = v27 + 1;
    xpc_object_t v26 = (void **)operator new(v27 + 1);
    uint64_t v48 = v25;
    unint64_t v49 = v28 | 0x8000000000000000;
    std::string __dst = v26;
    goto LABEL_45;
  }
  HIBYTE(v49) = v24;
  xpc_object_t v26 = (void **)&__dst;
  if (v24) {
LABEL_45:
  }
    memmove(v26, v23, v25);
  *((unsigned char *)v26 + v25) = 0;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 1174405120;
  v40[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_27;
  v40[3] = &__block_descriptor_tmp_36_1;
  v40[4] = v1;
  v40[5] = v3;
  xpc_object_t v41 = v5;
  atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  uint64_t v29 = _Block_copy(v40);
  uint64_t v42 = v29;
  Service::registerCommandHandler(v1, (uint64_t)&__dst, &v42);
  if (v29) {
    _Block_release(v29);
  }
  if (SHIBYTE(v49) < 0) {
    operator delete(__dst);
  }
  v30 = (const void *)*MEMORY[0x263F26688];
  size_t v31 = strlen((const char *)*MEMORY[0x263F26688]);
  if (v31 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v32 = v31;
  if (v31 >= 0x17)
  {
    uint64_t v34 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17) {
      uint64_t v34 = v31 | 7;
    }
    uint64_t v35 = v34 + 1;
    xpc_object_t v33 = (void **)operator new(v34 + 1);
    uint64_t v48 = v32;
    unint64_t v49 = v35 | 0x8000000000000000;
    std::string __dst = v33;
    goto LABEL_57;
  }
  HIBYTE(v49) = v31;
  xpc_object_t v33 = (void **)&__dst;
  if (v31) {
LABEL_57:
  }
    memmove(v33, v30, v32);
  *((unsigned char *)v33 + v32) = 0;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 1174405120;
  v37[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_37;
  v37[3] = &__block_descriptor_tmp_42_3;
  v37[4] = v1;
  v37[5] = v3;
  v38 = v5;
  atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v36 = _Block_copy(v37);
  size_t v39 = v36;
  Service::registerCommandHandler(v1, (uint64_t)&__dst, &v39);
  if (v36) {
    _Block_release(v36);
  }
  if (SHIBYTE(v49) < 0) {
    operator delete(__dst);
  }
  if (v38) {
    std::__shared_weak_count::__release_weak(v38);
  }
  if (v41) {
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v44) {
    std::__shared_weak_count::__release_weak(v44);
  }
  std::__shared_weak_count::__release_weak(v5);
}

void sub_26377EB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::__shared_weak_count *a32)
{
  xpc_object_t v37 = *(const void **)(v35 - 112);
  if (v37) {
    _Block_release(v37);
  }
  v38 = *(std::__shared_weak_count **)(v35 - 120);
  if (v38)
  {
    std::__shared_weak_count::__release_weak(v38);
    size_t v39 = *(NSObject **)(v35 - 104);
    if (!v39)
    {
LABEL_5:
      if (!v34)
      {
LABEL_10:
        std::__shared_weak_count::__release_weak(v33);
        std::__shared_weak_count::__release_weak(v32);
        _Unwind_Resume(a1);
      }
LABEL_9:
      _Block_release(v34);
      goto LABEL_10;
    }
  }
  else
  {
    size_t v39 = *(NSObject **)(v35 - 104);
    if (!v39) {
      goto LABEL_5;
    }
  }
  dispatch_release(v39);
  if (!v34) {
    goto LABEL_10;
  }
  goto LABEL_9;
}

void sub_26377ECB8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void TraceManager::initTraceHelper_sync(TraceManager *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 16);
  if (!v2 || (uint64_t v3 = *((void *)this + 15), (v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v5 = v4;
  p_shared_weak_owners = &v4->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  dispatch_group_t v15 = (const void *)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v16 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TraceManager20initTraceHelper_syncEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_99_0;
  aBlock[4] = this;
  void aBlock[5] = v3;
  uint64_t v14 = v5;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = *((void *)this + 17);
  if (v8) {
    dispatch_retain(*((dispatch_object_t *)this + 17));
  }
  dispatch_group_t v15 = v7;
  dispatch_object_t v16 = v8;
  if (!v7)
  {
    size_t v10 = 0;
    xpc_object_t object = v8;
    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  size_t v10 = _Block_copy(v7);
  xpc_object_t object = v8;
  if (v8) {
LABEL_9:
  }
    dispatch_retain(v8);
LABEL_10:
  abm::HelperClient::registerForHelperReady();
  CFDictionaryRef v9 = (std::__shared_weak_count *)*((void *)this + 31);
  *((_OWORD *)this + 15) = v12;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v10) {
    _Block_release(v10);
  }
  if (v16) {
    dispatch_release(v16);
  }
  if (v15) {
    _Block_release(v15);
  }
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
  std::__shared_weak_count::__release_weak(v5);
}

void sub_26377EF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback(v21 - 48);
  if (a20) {
    std::__shared_weak_count::__release_weak(a20);
  }
  std::__shared_weak_count::__release_weak(v20);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = MEMORY[0x263EF8708];
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v2) == v3)
    {
      xpc_retain(v2);
      xpc_object_t v4 = v2;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  xpc_object_t v5 = xpc_string_create((const char *)*MEMORY[0x263F25E80]);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x263F25E30], v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  uint64_t v7 = (const char *)*MEMORY[0x263F25F20];
  xpc_object_t v8 = xpc_string_create((const char *)*MEMORY[0x263F25F20]);
  if (!v8) {
    xpc_object_t v8 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x263F26158], v8);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  __val[0] = 0;
  size_t v10 = strlen(v7);
  if (v10 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v11 = (void *)v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    long long v12 = (xpc_object_t *)operator new(v13 + 1);
    __dst[1] = v11;
    unint64_t v33 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_18;
  }
  HIBYTE(v33) = v10;
  long long v12 = __dst;
  if (v10) {
LABEL_18:
  }
    memmove(v12, v7, (size_t)v11);
  *((unsigned char *)v11 + (void)v12) = 0;
  memset(&__val[1], 0, 24);
  if (prop::bbtrace::get((char *)__dst, (uint64_t)&__val[1])) {
    util::convert<BOOL>((const std::string *)&__val[1], __val, 0);
  }
  if (__val[24] < 0)
  {
    operator delete(*(void **)&__val[1]);
    if ((SHIBYTE(v33) & 0x80000000) == 0) {
      goto LABEL_23;
    }
  }
  else if ((SHIBYTE(v33) & 0x80000000) == 0)
  {
    goto LABEL_23;
  }
  operator delete(__dst[0]);
LABEL_23:
  std::to_string((std::string *)&__val[1], __val[0]);
  if (__val[24] >= 0) {
    dispatch_group_t v15 = (const char *)&__val[1];
  }
  else {
    dispatch_group_t v15 = *(const char **)&__val[1];
  }
  xpc_object_t v16 = xpc_string_create(v15);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x263F26220], v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  if (__val[24] < 0) {
    operator delete(*(void **)&__val[1]);
  }
  abm::asString();
  if (__val[24] >= 0) {
    size_t v18 = (const char *)&__val[1];
  }
  else {
    size_t v18 = *(const char **)&__val[1];
  }
  xpc_object_t v19 = xpc_string_create(v18);
  if (!v19) {
    xpc_object_t v19 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x263F26798], v19);
  xpc_object_t v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  if (__val[24] < 0)
  {
    operator delete(*(void **)&__val[1]);
    xpc_object_t object = v4;
    __dst[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    uint64_t v21 = *(TraceCAReporter **)(v1 + 304);
    if (v4) {
      goto LABEL_37;
    }
  }
  else
  {
    xpc_object_t object = v4;
    __dst[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    uint64_t v21 = *(TraceCAReporter **)(v1 + 304);
    if (v4)
    {
LABEL_37:
      xpc_retain(v4);
      goto LABEL_42;
    }
  }
  xpc_object_t object = xpc_null_create();
LABEL_42:
  TraceCAReporter::prepTraceStats(v21, &object, __dst);
  xpc_release(object);
  xpc_object_t object = 0;
  if (MEMORY[0x263E6A240](__dst[0]) != v3) {
    goto LABEL_55;
  }
  xpc_object_t v22 = (const void *)*MEMORY[0x263F261A0];
  size_t v23 = strlen((const char *)*MEMORY[0x263F261A0]);
  if (v23 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v24 = v23;
  if (v23 >= 0x17)
  {
    uint64_t v27 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v23 | 7) != 0x17) {
      uint64_t v27 = v23 | 7;
    }
    uint64_t v28 = v27 + 1;
    size_t v25 = (BOOL *)operator new(v27 + 1);
    *(void *)&__val[9] = v24;
    *(void *)&__val[17] = v28 | 0x8000000000000000;
    *(void *)&__val[1] = v25;
LABEL_51:
    memmove(v25, v22, v24);
    v25[v24] = 0;
    xpc_object_t v26 = __dst[0];
    xpc_object_t v30 = __dst[0];
    if (__dst[0]) {
      goto LABEL_47;
    }
    goto LABEL_52;
  }
  __val[24] = v23;
  size_t v25 = &__val[1];
  if (v23) {
    goto LABEL_51;
  }
  __val[1] = 0;
  xpc_object_t v26 = __dst[0];
  xpc_object_t v30 = __dst[0];
  if (__dst[0])
  {
LABEL_47:
    xpc_retain(v26);
    goto LABEL_53;
  }
LABEL_52:
  xpc_object_t v26 = xpc_null_create();
  xpc_object_t v30 = v26;
LABEL_53:
  uint64_t v29 = 0;
  Service::runCommand(v1, (uint64_t)&__val[1], &v30, &v29);
  xpc_release(v26);
  xpc_object_t v30 = 0;
  if (__val[24] < 0) {
    operator delete(*(void **)&__val[1]);
  }
LABEL_55:
  xpc_release(__dst[0]);
  xpc_release(v4);
}

void sub_26377F3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, xpc_object_t object, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  xpc_release(v25);
  if (a24 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_3(void *a1, void **a2, void **a3)
{
  xpc_object_t v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    uint64_t v7 = a1[4];
    xpc_object_t v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      xpc_object_t v9 = v8;
      uint64_t v10 = a1[5];
      if (!v10) {
        goto LABEL_14;
      }
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 1174405120;
      v15[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_4;
      v15[3] = &__block_descriptor_tmp_24_2;
      unint64_t v11 = *a2;
      v15[4] = v7;
      xpc_object_t object = v11;
      if (v11)
      {
        xpc_retain(v11);
        long long v12 = *a3;
        if (!*a3) {
          goto LABEL_9;
        }
      }
      else
      {
        xpc_object_t object = xpc_null_create();
        long long v12 = *a3;
        if (!*a3)
        {
LABEL_9:
          aBlock = v12;
          uint64_t v18 = v10;
          xpc_object_t v19 = v9;
          atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
          ctu::SharedSynchronizable<TraceManager>::execute_wrapped((uint64_t *)(v7 + 120), (uint64_t)v15);
          uint64_t v13 = v19;
          if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
            uint64_t v14 = aBlock;
            if (!aBlock) {
              goto LABEL_13;
            }
          }
          else
          {
            uint64_t v14 = aBlock;
            if (!aBlock)
            {
LABEL_13:
              xpc_release(object);
              xpc_object_t object = 0;
LABEL_14:
              if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
                std::__shared_weak_count::__release_weak(v9);
              }
              return;
            }
          }
          _Block_release(v14);
          goto LABEL_13;
        }
      }
      long long v12 = _Block_copy(v12);
      goto LABEL_9;
    }
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_4(uint64_t a1)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  memset(&v109, 170, sizeof(v109));
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x263F25E30]);
  v108[0] = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    v108[0] = xpc_null_create();
  }
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  xpc_release(v108[0]);
  memset(v108, 170, sizeof(v108));
  xpc_object_t v4 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x263F26158]);
  v107[0] = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    v107[0] = xpc_null_create();
  }
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  xpc_release(v107[0]);
  memset(v107, 170, sizeof(v107));
  xpc_object_t v5 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x263F26220]);
  v110.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    v110.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  xpc_release(v110.__r_.__value_.__l.__data_);
  xpc_object_t v6 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x263F267C8]);
  *(void *)buf = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  int v7 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  xpc_release(*(xpc_object_t *)buf);
  if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v106, v109.__r_.__value_.__l.__data_, v109.__r_.__value_.__l.__size_);
  }
  else {
    std::string v106 = v109;
  }
  char isSupported = abm::trace::isSupported();
  char v9 = isSupported;
  if ((SHIBYTE(v106.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (isSupported) {
      goto LABEL_18;
    }
LABEL_24:
    v110.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v14 = *(void **)(a1 + 40);
    xpc_object_t object = v14;
    if (v14) {
      xpc_retain(v14);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    xpc::bridge((uint64_t *)buf, (xpc *)&object, v15);
    xpc_object_t v19 = *(const void **)buf;
    if (*(void *)buf && (CFTypeID v20 = CFGetTypeID(*(CFTypeRef *)buf), v20 == CFDictionaryGetTypeID()))
    {
      v110.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
      CFRetain(v19);
      uint64_t v21 = *(const void **)buf;
      if (!*(void *)buf)
      {
LABEL_37:
        xpc_release(object);
        xpc_object_t v22 = (const void *)*MEMORY[0x263F26400];
        size_t v23 = strlen((const char *)*MEMORY[0x263F26400]);
        if (v23 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        size_t v24 = (void *)v23;
        if (v23 >= 0x17)
        {
          uint64_t v27 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v23 | 7) != 0x17) {
            uint64_t v27 = v23 | 7;
          }
          uint64_t v28 = v27 + 1;
          size_t v25 = (void **)operator new(v27 + 1);
          __dst[1] = v24;
          unint64_t v104 = v28 | 0x8000000000000000;
          __dst[0] = v25;
        }
        else
        {
          HIBYTE(v104) = v23;
          size_t v25 = __dst;
          if (!v23)
          {
            LOBYTE(__dst[0]) = 0;
            xpc_object_t v26 = (const void *)v110.__r_.__value_.__r.__words[0];
            CFTypeRef cf = (CFTypeRef)v110.__r_.__value_.__r.__words[0];
            if (!v110.__r_.__value_.__r.__words[0])
            {
LABEL_47:
              aBlock = 0;
              Service::broadcastEvent(v2, (uint64_t)__dst, &cf, (const void **)&aBlock);
              if (aBlock) {
                _Block_release(aBlock);
              }
              if (cf) {
                CFRelease(cf);
              }
              if (SHIBYTE(v104) < 0)
              {
                operator delete(__dst[0]);
                uint64_t v29 = *(NSObject **)(v2 + 88);
                if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
LABEL_53:
                  if (!*(void *)(a1 + 48)) {
                    goto LABEL_55;
                  }
                  goto LABEL_54;
                }
              }
              else
              {
                uint64_t v29 = *(NSObject **)(v2 + 88);
                if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_53;
                }
              }
              unint64_t v33 = &v109;
              if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                unint64_t v33 = (std::string *)v109.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = v33;
              _os_log_error_impl(&dword_26368A000, v29, OS_LOG_TYPE_ERROR, "Trace not supported: %s", buf, 0xCu);
              if (!*(void *)(a1 + 48)) {
                goto LABEL_55;
              }
LABEL_54:
              xpc_object_t v30 = xpc_null_create();
              uint64_t v31 = *(void *)(a1 + 48);
              *(void *)buf = v30;
              xpc_object_t v32 = xpc_null_create();
              (*(void (**)(uint64_t, uint64_t, uint8_t *))(v31 + 16))(v31, 3760250884, buf);
              xpc_release(*(xpc_object_t *)buf);
              xpc_release(v32);
LABEL_55:
              if (v26) {
                CFRelease(v26);
              }
LABEL_166:
              if ((SHIBYTE(v107[2]) & 0x80000000) == 0) {
                goto LABEL_167;
              }
              goto LABEL_171;
            }
LABEL_46:
            CFRetain(v26);
            goto LABEL_47;
          }
        }
        memmove(v25, v22, (size_t)v24);
        *((unsigned char *)v24 + (void)v25) = 0;
        xpc_object_t v26 = (const void *)v110.__r_.__value_.__r.__words[0];
        CFTypeRef cf = (CFTypeRef)v110.__r_.__value_.__r.__words[0];
        if (!v110.__r_.__value_.__r.__words[0]) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
    }
    else
    {
      v110.__r_.__value_.__r.__words[0] = 0;
      uint64_t v21 = *(const void **)buf;
      if (!*(void *)buf) {
        goto LABEL_37;
      }
    }
    CFRelease(v21);
    goto LABEL_37;
  }
  operator delete(v106.__r_.__value_.__l.__data_);
  if ((v9 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  if (!(*(unsigned int (**)(uint64_t))(*(void *)v2 + 88))(v2))
  {
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    uint64_t v17 = MEMORY[0x263EF8708];
    if (v16 || (xpc_object_t v16 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E6A240](v16) == v17)
      {
        xpc_retain(v16);
        xpc_object_t v18 = v16;
      }
      else
      {
        xpc_object_t v18 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v18 = xpc_null_create();
      xpc_object_t v16 = 0;
    }
    xpc_release(v16);
    xpc_object_t v47 = xpc_int64_create(5000);
    if (!v47) {
      xpc_object_t v47 = xpc_null_create();
    }
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x263F20540], v47);
    xpc_object_t v48 = xpc_null_create();
    xpc_release(v47);
    xpc_release(v48);
    if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unint64_t v49 = &v109;
    }
    else {
      unint64_t v49 = (std::string *)v109.__r_.__value_.__r.__words[0];
    }
    xpc_object_t v50 = xpc_string_create((const char *)v49);
    if (!v50) {
      xpc_object_t v50 = xpc_null_create();
    }
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x263F20558], v50);
    xpc_object_t v51 = xpc_null_create();
    xpc_release(v50);
    xpc_release(v51);
    if (SHIBYTE(v108[2]) >= 0) {
      dispatch_object_t v52 = (const char *)v108;
    }
    else {
      dispatch_object_t v52 = (const char *)v108[0];
    }
    xpc_object_t v53 = xpc_string_create(v52);
    if (!v53) {
      xpc_object_t v53 = xpc_null_create();
    }
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x263F20580], v53);
    xpc_object_t v54 = xpc_null_create();
    xpc_release(v53);
    xpc_release(v54);
    if (SHIBYTE(v107[2]) >= 0) {
      v55 = (const char *)v107;
    }
    else {
      v55 = (const char *)v107[0];
    }
    xpc_object_t v56 = xpc_string_create(v55);
    if (!v56) {
      xpc_object_t v56 = xpc_null_create();
    }
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x263F205B8], v56);
    xpc_object_t v57 = xpc_null_create();
    xpc_release(v56);
    xpc_release(v57);
    if (v7)
    {
      v58 = *(NSObject **)(v2 + 88);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_26368A000, v58, OS_LOG_TYPE_DEBUG, "#D Request to set property with completion", buf, 2u);
      }
      memset(buf, 170, 16);
      v97[0] = MEMORY[0x263EF8330];
      v97[1] = 1174405120;
      v97[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_21;
      v97[3] = &__block_descriptor_tmp_23_2;
      uint64_t v60 = *(void *)(a1 + 56);
      v59 = *(std::__shared_weak_count **)(a1 + 64);
      v97[4] = v2;
      v97[5] = v60;
      v98 = v59;
      if (v59) {
        atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v61 = *(const void **)(a1 + 48);
      if (v61)
      {
        v62 = _Block_copy(v61);
        v63 = *(void **)(a1 + 40);
        v99 = v62;
        xpc_object_t v100 = v63;
        if (v63)
        {
LABEL_107:
          xpc_retain(v63);
          goto LABEL_112;
        }
      }
      else
      {
        v63 = *(void **)(a1 + 40);
        v99 = 0;
        xpc_object_t v100 = v63;
        if (v63) {
          goto LABEL_107;
        }
      }
      xpc_object_t v100 = xpc_null_create();
LABEL_112:
      v64 = _Block_copy(v97);
      uint64_t v65 = *(void *)(v2 + 136);
      if (v65) {
        dispatch_retain(*(dispatch_object_t *)(v2 + 136));
      }
      *(void *)buf = v64;
      *(void *)&buf[8] = v65;
      xpc_object_t v96 = v18;
      if (v18)
      {
        xpc_retain(v18);
        v64 = *(void **)buf;
        v95 = 0;
        if (*(void *)buf)
        {
LABEL_116:
          v66 = _Block_copy(v64);
LABEL_122:
          uint64_t v70 = *MEMORY[0x263F205F0];
          v71 = *(NSObject **)&buf[8];
          v94[0] = v66;
          v94[1] = *(void **)&buf[8];
          if (*(void *)&buf[8]) {
            dispatch_retain(*(dispatch_object_t *)&buf[8]);
          }
          TraceManager::runOnHelper_sync((void *)v2, (const char *)9, v70, 0, 1, &v96, &v95, v94);
          if (v71) {
            dispatch_release(v71);
          }
          if (v66) {
            _Block_release(v66);
          }
          xpc_release(v96);
          xpc_object_t v96 = 0;
          if (v71) {
            dispatch_release(v71);
          }
          if (v64) {
            _Block_release(v64);
          }
          xpc_release(v100);
          xpc_object_t v100 = 0;
          if (v99) {
            _Block_release(v99);
          }
          v72 = v98;
          if (v98 && !atomic_fetch_add(&v98->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
            std::__shared_weak_count::__release_weak(v72);
          }
LABEL_156:
          xpc_release(v18);
          goto LABEL_166;
        }
      }
      else
      {
        v95 = 0;
        xpc_object_t v96 = xpc_null_create();
        if (v64) {
          goto LABEL_116;
        }
      }
      v66 = 0;
      goto LABEL_122;
    }
    xpc_object_t v93 = v18;
    if (v18) {
      xpc_retain(v18);
    }
    else {
      xpc_object_t v93 = xpc_null_create();
    }
    uint64_t v67 = *MEMORY[0x263F205F0];
    v91[1] = 0;
    v92 = 0;
    v91[0] = 0;
    TraceManager::runOnHelper_sync((void *)v2, (const char *)9, v67, 0, 1, &v93, &v92, v91);
    xpc_release(v93);
    xpc_object_t v93 = 0;
    v110.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    v68 = *(TraceCAReporter **)(v2 + 304);
    v69 = *(void **)(a1 + 40);
    xpc_object_t v90 = v69;
    if (v69) {
      xpc_retain(v69);
    }
    else {
      xpc_object_t v90 = xpc_null_create();
    }
    TraceCAReporter::prepTraceStats(v68, &v90, (xpc_object_t *)&v110.__r_.__value_.__l.__data_);
    xpc_release(v90);
    xpc_object_t v90 = 0;
    if (MEMORY[0x263E6A240](v110.__r_.__value_.__r.__words[0]) != v17)
    {
LABEL_153:
      if (*(void *)(a1 + 48))
      {
        xpc_object_t v80 = xpc_null_create();
        uint64_t v81 = *(void *)(a1 + 48);
        *(void *)buf = v80;
        xpc_object_t v82 = xpc_null_create();
        (*(void (**)(uint64_t, void, uint8_t *))(v81 + 16))(v81, 0, buf);
        xpc_release(*(xpc_object_t *)buf);
        xpc_release(v82);
      }
      xpc_release(v110.__r_.__value_.__l.__data_);
      goto LABEL_156;
    }
    v73 = (const void *)*MEMORY[0x263F261A0];
    size_t v74 = strlen((const char *)*MEMORY[0x263F261A0]);
    if (v74 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v75 = v74;
    if (v74 >= 0x17)
    {
      uint64_t v77 = (v74 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v74 | 7) != 0x17) {
        uint64_t v77 = v74 | 7;
      }
      uint64_t v78 = v77 + 1;
      v76 = operator new(v77 + 1);
      *(void *)&buf[8] = v75;
      *(void *)&uint8_t buf[16] = v78 | 0x8000000000000000;
      *(void *)buf = v76;
    }
    else
    {
      buf[23] = v74;
      v76 = buf;
      if (!v74)
      {
LABEL_148:
        v76[v75] = 0;
        xpc_object_t v79 = (xpc_object_t)v110.__r_.__value_.__r.__words[0];
        std::string::size_type v89 = v110.__r_.__value_.__r.__words[0];
        if (v110.__r_.__value_.__r.__words[0])
        {
          xpc_retain(v110.__r_.__value_.__l.__data_);
        }
        else
        {
          xpc_object_t v79 = xpc_null_create();
          std::string::size_type v89 = (std::string::size_type)v79;
        }
        v88 = 0;
        Service::runCommand(v2, (uint64_t)buf, (xpc_object_t *)&v89, &v88);
        xpc_release(v79);
        std::string::size_type v89 = 0;
        if ((char)buf[23] < 0) {
          operator delete(*(void **)buf);
        }
        goto LABEL_153;
      }
    }
    memmove(v76, v73, v75);
    goto LABEL_148;
  }
  memset(buf, 170, sizeof(buf));
  uint64_t v10 = (const void *)*MEMORY[0x263F26330];
  size_t v11 = strlen((const char *)*MEMORY[0x263F26330]);
  if (v11 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v12 = v11;
  if (v11 >= 0x17)
  {
    uint64_t v34 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v34 = v11 | 7;
    }
    uint64_t v35 = v34 + 1;
    uint64_t v13 = operator new(v34 + 1);
    v110.__r_.__value_.__l.__size_ = v12;
    v110.__r_.__value_.__r.__words[2] = v35 | 0x8000000000000000;
    v110.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    goto LABEL_65;
  }
  *((unsigned char *)&v110.__r_.__value_.__s + 23) = v11;
  uint64_t v13 = &v110;
  if (v11) {
LABEL_65:
  }
    memmove(v13, v10, v12);
  *((unsigned char *)v13 + v12) = 0;
  xpc_object_t v36 = (char *)operator new(0x28uLL);
  strcpy(v36, " rejected; ABM is shutting down ");
  xpc_object_t v37 = std::string::append(&v110, v36, 0x20uLL);
  long long v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  *(void *)&uint8_t buf[16] = *((void *)&v37->__r_.__value_.__l + 2);
  *(_OWORD *)buf = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  operator delete(v36);
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v110.__r_.__value_.__l.__data_);
    size_t v39 = *(NSObject **)(v2 + 88);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
LABEL_68:
      uint64_t v41 = *(void *)(a1 + 48);
      v40 = (uint64_t *)(a1 + 48);
      if (!v41) {
        goto LABEL_165;
      }
      goto LABEL_74;
    }
  }
  else
  {
    size_t v39 = *(NSObject **)(v2 + 88);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_68;
    }
  }
  uint64_t v42 = buf;
  if ((buf[23] & 0x80u) != 0) {
    uint64_t v42 = *(uint8_t **)buf;
  }
  LODWORD(v110.__r_.__value_.__l.__data_) = 136315138;
  *(std::string::size_type *)((char *)v110.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
  _os_log_impl(&dword_26368A000, v39, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v110, 0xCu);
  uint64_t v43 = *(void *)(a1 + 48);
  v40 = (uint64_t *)(a1 + 48);
  if (v43)
  {
LABEL_74:
    v110.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    v110.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    uint64_t v44 = buf[23];
    if ((buf[23] & 0x80u) != 0) {
      uint64_t v44 = *(void *)&buf[8];
    }
    if (v44)
    {
      xpc_object_t v45 = xpc_dictionary_create(0, 0, 0);
      if (v45 || (xpc_object_t v45 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6A240](v45) == MEMORY[0x263EF8708])
        {
          xpc_retain(v45);
          xpc_object_t v46 = v45;
        }
        else
        {
          xpc_object_t v46 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v46 = xpc_null_create();
        xpc_object_t v45 = 0;
      }
      xpc_release(v45);
      xpc_object_t v83 = xpc_null_create();
      v84 = (void *)v110.__r_.__value_.__r.__words[0];
      v110.__r_.__value_.__r.__words[0] = (std::string::size_type)v46;
      xpc_release(v84);
      xpc_release(v83);
      if ((buf[23] & 0x80u) == 0) {
        v85 = buf;
      }
      else {
        v85 = *(uint8_t **)buf;
      }
      xpc_object_t v86 = xpc_string_create((const char *)v85);
      if (!v86) {
        xpc_object_t v86 = xpc_null_create();
      }
      xpc_dictionary_set_value(v46, (const char *)*MEMORY[0x263F25EB8], v86);
      xpc_object_t v87 = xpc_null_create();
      xpc_release(v86);
      xpc_release(v87);
    }
    LODWORD(object) = -534716415;
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(v40, (unsigned int *)&object, (void **)&v110.__r_.__value_.__l.__data_);
    xpc_release(v110.__r_.__value_.__l.__data_);
  }
LABEL_165:
  if (((char)buf[23] & 0x80000000) == 0) {
    goto LABEL_166;
  }
  operator delete(*(void **)buf);
  if ((SHIBYTE(v107[2]) & 0x80000000) == 0)
  {
LABEL_167:
    if ((SHIBYTE(v108[2]) & 0x80000000) == 0) {
      goto LABEL_168;
    }
    goto LABEL_172;
  }
LABEL_171:
  operator delete(v107[0]);
  if ((SHIBYTE(v108[2]) & 0x80000000) == 0)
  {
LABEL_168:
    if ((SHIBYTE(v109.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_173:
    operator delete(v109.__r_.__value_.__l.__data_);
    return;
  }
LABEL_172:
  operator delete(v108[0]);
  if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_173;
  }
}

void sub_263780454(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, char a12, uint64_t a13, uint64_t a14, xpc_object_t a15, char a16, uint64_t a17, uint64_t a18, xpc_object_t object, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *aBlock,xpc_object_t a28,void *a29,char a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,xpc_object_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_21(void *a1, int *a2)
{
  uint64_t v4 = a1[4];
  xpc_object_t v5 = *(NSObject **)(v4 + 88);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_26368A000, v5, OS_LOG_TYPE_DEBUG, "#D Set property completion called", buf, 2u);
    if (!a1[7]) {
      return;
    }
  }
  else if (!a1[7])
  {
    return;
  }
  int v6 = *a2;
  if (!*a2)
  {
    int v7 = *(TraceCAReporter **)(v4 + 304);
    xpc_object_t v8 = (void *)a1[8];
    xpc_object_t object = v8;
    xpc_object_t v26 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    if (v8) {
      xpc_retain(v8);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    TraceCAReporter::prepTraceStats(v7, &object, &v26);
    xpc_release(object);
    xpc_object_t object = 0;
    if (MEMORY[0x263E6A240](v26) != MEMORY[0x263EF8708])
    {
LABEL_23:
      xpc_release(v26);
      int v6 = *a2;
      goto LABEL_24;
    }
    char v9 = (const void *)*MEMORY[0x263F261A0];
    size_t v10 = strlen((const char *)*MEMORY[0x263F261A0]);
    if (v10 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v11 = v10;
    if (v10 >= 0x17)
    {
      uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17) {
        uint64_t v13 = v10 | 7;
      }
      uint64_t v14 = v13 + 1;
      std::string::size_type v12 = operator new(v13 + 1);
      size_t v23 = v11;
      unint64_t v24 = v14 | 0x8000000000000000;
      *(void *)buf = v12;
    }
    else
    {
      HIBYTE(v24) = v10;
      std::string::size_type v12 = buf;
      if (!v10)
      {
LABEL_18:
        v12[v11] = 0;
        xpc_object_t v15 = v26;
        xpc_object_t v21 = v26;
        if (v26)
        {
          xpc_retain(v26);
        }
        else
        {
          xpc_object_t v15 = xpc_null_create();
          xpc_object_t v21 = v15;
        }
        CFTypeID v20 = 0;
        Service::runCommand(v4, (uint64_t)buf, &v21, &v20);
        xpc_release(v15);
        xpc_object_t v21 = 0;
        if (SHIBYTE(v24) < 0) {
          operator delete(*(void **)buf);
        }
        goto LABEL_23;
      }
    }
    memmove(v12, v9, v11);
    goto LABEL_18;
  }
LABEL_24:
  if (v6) {
    uint64_t v16 = 3760250880;
  }
  else {
    uint64_t v16 = 0;
  }
  xpc_object_t v17 = xpc_null_create();
  uint64_t v18 = a1[7];
  *(void *)buf = v17;
  xpc_object_t v19 = xpc_null_create();
  (*(void (**)(uint64_t, uint64_t, uint8_t *))(v18 + 16))(v18, v16, buf);
  xpc_release(*(xpc_object_t *)buf);
  xpc_release(v19);
}

void sub_263780AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, xpc_object_t a18, xpc_object_t object)
{
  xpc_release(v19);
  if (a16 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c15_ZTSN3xpc4dictE(void *a1, void *a2)
{
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v5 = (const void *)a2[7];
  if (v5)
  {
    int v6 = _Block_copy(v5);
    int v7 = (void *)a2[8];
    a1[7] = v6;
    a1[8] = v7;
    if (v7) {
      return xpc_retain(v7);
    }
  }
  else
  {
    int v7 = (void *)a2[8];
    a1[7] = 0;
    a1[8] = v7;
    if (v7) {
      return xpc_retain(v7);
    }
  }
  xpc_object_t result = xpc_null_create();
  a1[8] = result;
  return result;
}

void __destroy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c15_ZTSN3xpc4dictE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 64));
  *(void *)(a1 + 64) = 0;
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void *dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  if (*(void *)a2) {
    uint64_t v4 = _Block_copy(v4);
  }
  xpc_object_t v5 = *(NSObject **)(a2 + 8);
  *a1 = v4;
  a1[1] = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  return a1;
}

void *__copy_helper_block_e8_40c15_ZTSN3xpc4dictE48c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(void *a1, void *a2)
{
  uint64_t v4 = (void *)a2[5];
  a1[5] = v4;
  if (!v4)
  {
    a1[5] = xpc_null_create();
    xpc_object_t result = (void *)a2[6];
    if (!result) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  xpc_retain(v4);
  xpc_object_t result = (void *)a2[6];
  if (result) {
LABEL_5:
  }
    xpc_object_t result = _Block_copy(result);
LABEL_6:
  uint64_t v7 = a2[7];
  uint64_t v6 = a2[8];
  a1[6] = result;
  a1[7] = v7;
  a1[8] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c15_ZTSN3xpc4dictE48c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = *(const void **)(a1 + 48);
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
LABEL_4:
  }
    _Block_release(v3);
LABEL_5:
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(void *)(a1 + 40) = 0;
}

uint64_t __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_27(void *a1, void **a2, void **a3)
{
  uint64_t v4 = (std::__shared_weak_count *)a1[6];
  if (!v4) {
    return;
  }
  uint64_t v7 = a1[4];
  xpc_object_t v8 = std::__shared_weak_count::lock(v4);
  if (!v8) {
    return;
  }
  char v9 = v8;
  uint64_t v10 = a1[5];
  if (atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (!v10) {
      return;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v9);
    if (!v10) {
      return;
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1174405120;
  v13[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_28;
  v13[3] = &__block_descriptor_tmp_33_2;
  size_t v11 = *a2;
  v13[4] = v7;
  xpc_object_t object = v11;
  if (v11)
  {
    xpc_retain(v11);
    std::string::size_type v12 = *a3;
    if (!*a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  xpc_object_t object = xpc_null_create();
  std::string::size_type v12 = *a3;
  if (*a3) {
LABEL_11:
  }
    std::string::size_type v12 = _Block_copy(v12);
LABEL_12:
  aBlock = v12;
  ctu::SharedSynchronizable<TraceManager>::execute_wrapped((uint64_t *)(v7 + 120), (uint64_t)v13);
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(object);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_28(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  memset(&v48, 170, sizeof(v48));
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x263F25E30]);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  long long v49 = 0uLL;
  uint64_t v50 = 0;
  xpc::dyn_cast_or_default();
  xpc_release(object);
  memset(__p, 170, sizeof(__p));
  xpc_object_t v4 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x263F26158]);
  xpc_object_t object = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  long long v49 = 0uLL;
  uint64_t v50 = 0;
  xpc::dyn_cast_or_default();
  xpc_release(object);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v46, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
  }
  else {
    std::string v46 = v48;
  }
  char isSupported = abm::trace::isSupported();
  char v6 = isSupported;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v46.__r_.__value_.__l.__data_);
    if (v6)
    {
LABEL_12:
      xpc_object_t object = 0;
      p_xpc_object_t object = &object;
      uint64_t v42 = 0x3002000000;
      uint64_t v43 = __Block_byref_object_copy__2;
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v44 = __Block_byref_object_dispose__2;
      xpc_object_t v45 = v7;
      if (v7) {
        xpc_retain(v7);
      }
      else {
        xpc_object_t v45 = xpc_null_create();
      }
      *(void *)&long long v49 = 0;
      *((void *)&v49 + 1) = &v49;
      uint64_t v50 = 0x4002000000;
      xpc_object_t v51 = __Block_byref_object_copy__29;
      dispatch_object_t v52 = __Block_byref_object_dispose__30;
      v53[0] = 0;
      v53[1] = 0;
      uint64_t v54 = 0;
      if (prop::get((char *)&v48, (char *)__p, (uint64_t)v53))
      {
        std::string::size_type v12 = (const char *)(*((void *)&v49 + 1) + 40);
        if (*(char *)(*((void *)&v49 + 1) + 63) < 0) {
          std::string::size_type v12 = *(const char **)v12;
        }
        xpc_object_t v13 = xpc_string_create(v12);
        if (!v13) {
          xpc_object_t v13 = xpc_null_create();
        }
        xpc_dictionary_set_value(p_object[5], (const char *)*MEMORY[0x263F26220], v13);
        xpc_object_t v14 = xpc_null_create();
        xpc_release(v13);
        xpc_release(v14);
        *(_DWORD *)buf = 0;
        dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>((uint64_t *)(a1 + 48), (unsigned int *)buf, p_object + 5);
LABEL_63:
        _Block_object_dispose(&v49, 8);
        if (SHIBYTE(v54) < 0) {
          operator delete(v53[0]);
        }
        _Block_object_dispose(&object, 8);
        xpc_release(v45);
        goto LABEL_66;
      }
      xpc_object_t v15 = *(NSObject **)(v2 + 88);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_26368A000, v15, OS_LOG_TYPE_DEFAULT, "#I Checking with abm-helper daemon", buf, 2u);
      }
      xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
      if (v16 || (xpc_object_t v16 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6A240](v16) == MEMORY[0x263EF8708])
        {
          xpc_retain(v16);
          xpc_object_t v17 = v16;
        }
        else
        {
          xpc_object_t v17 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v17 = xpc_null_create();
        xpc_object_t v16 = 0;
      }
      xpc_release(v16);
      xpc_object_t v18 = xpc_int64_create(1500);
      if (!v18) {
        xpc_object_t v18 = xpc_null_create();
      }
      xpc_dictionary_set_value(v17, (const char *)*MEMORY[0x263F20540], v18);
      xpc_object_t v19 = xpc_null_create();
      xpc_release(v18);
      xpc_release(v19);
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        CFTypeID v20 = &v48;
      }
      else {
        CFTypeID v20 = (std::string *)v48.__r_.__value_.__r.__words[0];
      }
      xpc_object_t v21 = xpc_string_create((const char *)v20);
      if (!v21) {
        xpc_object_t v21 = xpc_null_create();
      }
      xpc_dictionary_set_value(v17, (const char *)*MEMORY[0x263F20558], v21);
      xpc_object_t v22 = xpc_null_create();
      xpc_release(v21);
      xpc_release(v22);
      if (SHIBYTE(__p[2]) >= 0) {
        size_t v23 = __p;
      }
      else {
        size_t v23 = (void **)__p[0];
      }
      xpc_object_t v24 = xpc_string_create((const char *)v23);
      if (!v24) {
        xpc_object_t v24 = xpc_null_create();
      }
      xpc_dictionary_set_value(v17, (const char *)*MEMORY[0x263F20580], v24);
      xpc_object_t v25 = xpc_null_create();
      xpc_release(v24);
      xpc_release(v25);
      memset(buf, 170, sizeof(buf));
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1174405120;
      aBlock[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_31;
      aBlock[3] = &unk_270EAC878;
      aBlock[4] = &v49;
      void aBlock[5] = &object;
      xpc_object_t v26 = *(void **)(a1 + 48);
      if (v26) {
        xpc_object_t v26 = _Block_copy(v26);
      }
      long long v38 = v26;
      uint64_t v27 = _Block_copy(aBlock);
      uint64_t v28 = *(void *)(v2 + 136);
      if (v28) {
        dispatch_retain(*(dispatch_object_t *)(v2 + 136));
      }
      *(void *)buf = v27;
      *(void *)&uint8_t buf[8] = v28;
      xpc_object_t v36 = v17;
      if (v17)
      {
        xpc_retain(v17);
        uint64_t v27 = *(void **)buf;
        uint64_t v35 = 0;
        if (*(void *)buf) {
          goto LABEL_50;
        }
      }
      else
      {
        uint64_t v35 = 0;
        xpc_object_t v36 = xpc_null_create();
        if (v27)
        {
LABEL_50:
          uint64_t v29 = _Block_copy(v27);
          uint64_t v30 = *MEMORY[0x263F205E8];
          uint64_t v31 = *(NSObject **)&buf[8];
          unint64_t v33 = v29;
          uint64_t v34 = *(void *)&buf[8];
          if (!*(void *)&buf[8])
          {
LABEL_52:
            TraceManager::runOnHelper_sync((void *)v2, (const char *)9, v30, 0, 1, &v36, &v35, &v33);
            if (v31) {
              dispatch_release(v31);
            }
            if (v29) {
              _Block_release(v29);
            }
            xpc_release(v36);
            xpc_object_t v36 = 0;
            if (v31) {
              dispatch_release(v31);
            }
            if (v27) {
              _Block_release(v27);
            }
            if (v38) {
              _Block_release(v38);
            }
            xpc_release(v17);
            goto LABEL_63;
          }
LABEL_51:
          dispatch_retain(v31);
          goto LABEL_52;
        }
      }
      uint64_t v29 = 0;
      uint64_t v30 = *MEMORY[0x263F205E8];
      uint64_t v31 = *(NSObject **)&buf[8];
      unint64_t v33 = 0;
      uint64_t v34 = *(void *)&buf[8];
      if (!*(void *)&buf[8]) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  else if (isSupported)
  {
    goto LABEL_12;
  }
  xpc_object_t v8 = *(NSObject **)(v2 + 88);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    xpc_object_t v32 = &v48;
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      xpc_object_t v32 = (std::string *)v48.__r_.__value_.__r.__words[0];
    }
    LODWORD(v49) = 136315138;
    *(void *)((char *)&v49 + 4) = v32;
    _os_log_error_impl(&dword_26368A000, v8, OS_LOG_TYPE_ERROR, "Trace not supported: %s", (uint8_t *)&v49, 0xCu);
  }
  xpc_object_t v9 = xpc_null_create();
  uint64_t v10 = *(void *)(a1 + 48);
  *(void *)&long long v49 = v9;
  xpc_object_t v11 = xpc_null_create();
  (*(void (**)(uint64_t, uint64_t, long long *))(v10 + 16))(v10, 3760250884, &v49);
  xpc_release((xpc_object_t)v49);
  xpc_release(v11);
LABEL_66:
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v48.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_70:
    operator delete(v48.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_70;
  }
}

void sub_26378160C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, xpc_object_t object, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *aBlock,char a21,uint64_t a22,xpc_object_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,xpc_object_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

xpc_object_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  xpc_object_t result = xpc_null_create();
  *(void *)(a2 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  *(void *)(a1 + 40) = 0;
}

__n128 __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_31(void *a1, _DWORD *a2, xpc_object_t *a3)
{
  if (!*a2 && MEMORY[0x263E6A240](*a3) == MEMORY[0x263EF8708])
  {
    xpc_object_t value = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x263F205B8]);
    xpc_object_t v16 = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t v16 = xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)object, (xpc *)&v16, (const object *)"", v9);
    uint64_t v10 = *(void *)(a1[4] + 8);
    uint64_t v11 = v10 + 40;
    if (*(char *)(v10 + 63) < 0) {
      operator delete(*(void **)v11);
    }
    *(_OWORD *)uint64_t v11 = *(_OWORD *)object;
    *(void *)(v11 + 16) = v18;
    HIBYTE(v18) = 0;
    LOBYTE(object[0]) = 0;
    xpc_release(v16);
    uint64_t v12 = *(void *)(a1[4] + 8);
    xpc_object_t v13 = (const char *)(v12 + 40);
    if (*(char *)(v12 + 63) < 0) {
      xpc_object_t v13 = *(const char **)v13;
    }
    xpc_object_t v14 = xpc_string_create(v13);
    if (!v14) {
      xpc_object_t v14 = xpc_null_create();
    }
    xpc_dictionary_set_value(*(xpc_object_t *)(*(void *)(a1[5] + 8) + 40), (const char *)*MEMORY[0x263F26220], v14);
    xpc_object_t v15 = xpc_null_create();
    xpc_release(v14);
    xpc_release(v15);
    LODWORD(object[0]) = 0;
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(a1 + 6, (unsigned int *)object, (void **)(*(void *)(a1[5] + 8) + 40));
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    uint64_t v6 = a1[6];
    object[0] = v5;
    xpc_object_t v7 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v6 + 16))(v6, 3760250880, object);
    xpc_release(object[0]);
    xpc_release(v7);
  }
}

void sub_263781A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_37(void *a1, void **a2, const void **a3)
{
  xpc_object_t v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    uint64_t v7 = a1[4];
    xpc_object_t v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      xpc_object_t v9 = v8;
      uint64_t v10 = a1[5];
      if (atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        if (!v10) {
          return;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v9);
        if (!v10) {
          return;
        }
      }
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 1174405120;
      v13[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_38;
      v13[3] = &__block_descriptor_tmp_39_3;
      v13[4] = v7;
      if (*a3)
      {
        uint64_t v11 = _Block_copy(*a3);
        uint64_t v12 = *a2;
        aBlock = v11;
        xpc_object_t object = v12;
        if (v12)
        {
LABEL_9:
          xpc_retain(v12);
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v12 = *a2;
        aBlock = 0;
        xpc_object_t object = v12;
        if (v12) {
          goto LABEL_9;
        }
      }
      xpc_object_t object = xpc_null_create();
LABEL_12:
      ctu::SharedSynchronizable<TraceManager>::execute_wrapped((uint64_t *)(v7 + 120), (uint64_t)v13);
      xpc_release(object);
      xpc_object_t object = 0;
      if (aBlock) {
        _Block_release(aBlock);
      }
    }
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_38(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!(*(unsigned int (**)(void *))(*v2 + 88))(v2))
  {
    memset(__p, 170, 24);
    xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 48), (const char *)*MEMORY[0x263F25ED8]);
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)value;
    if (value) {
      xpc_retain(value);
    }
    else {
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)__p, (xpc *)&__dst, (const object *)*MEMORY[0x263F26110], v8);
    xpc_release(__dst.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[2]) >= 0) {
      size_t v17 = HIBYTE(__p[2]);
    }
    else {
      size_t v17 = (size_t)__p[1];
    }
    if (v17 != strlen((const char *)*MEMORY[0x263F26058])
      || (SHIBYTE(__p[2]) >= 0 ? (uint64_t v18 = __p) : (uint64_t v18 = (void **)__p[0]),
          memcmp(v18, (const void *)*MEMORY[0x263F26058], v17)))
    {
      xpc_object_t v19 = *(xpc_object_t *)(a1 + 48);
      xpc_object_t v35 = v19;
      if (v19)
      {
        xpc_retain(v19);
        CFTypeID v20 = *(const void **)(a1 + 40);
        if (v20)
        {
LABEL_27:
          xpc_object_t v21 = (void (**)(void *, uint64_t, stat *))_Block_copy(v20);
LABEL_41:
          uint64_t v34 = v21;
          TraceManager::collectLogs_sync(v2, &v35, &v34);
          if (v21) {
            _Block_release(v21);
          }
          xpc_release(v19);
          goto LABEL_61;
        }
      }
      else
      {
        xpc_object_t v19 = xpc_null_create();
        xpc_object_t v35 = v19;
        CFTypeID v20 = *(const void **)(a1 + 40);
        if (v20) {
          goto LABEL_27;
        }
      }
      xpc_object_t v21 = 0;
      goto LABEL_41;
    }
    xpc_object_t v27 = *(xpc_object_t *)(a1 + 48);
    xpc_object_t v37 = v27;
    if (v27)
    {
      xpc_retain(v27);
      uint64_t v28 = *(void **)(a1 + 40);
      if (!v28) {
        goto LABEL_50;
      }
    }
    else
    {
      xpc_object_t v27 = xpc_null_create();
      xpc_object_t v37 = v27;
      uint64_t v28 = *(void **)(a1 + 40);
      if (!v28)
      {
LABEL_50:
        aBlock = v28;
        TraceManager::collectBasebandLogs_sync((uint64_t)v2, &v37, (uint64_t *)&aBlock);
        if (aBlock) {
          _Block_release(aBlock);
        }
        xpc_release(v27);
        goto LABEL_61;
      }
    }
    uint64_t v28 = _Block_copy(v28);
    goto LABEL_50;
  }
  memset(__p, 170, 24);
  uint64_t v3 = (const void *)*MEMORY[0x263F261B0];
  size_t v4 = strlen((const char *)*MEMORY[0x263F261B0]);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v9 = v4 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_dst = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v5;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v4;
    p_dst = &__dst;
    if (!v4) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v3, v5);
LABEL_12:
  p_dst->__r_.__value_.__s.__data_[v5] = 0;
  uint64_t v11 = (char *)operator new(0x28uLL);
  strcpy(v11, " rejected; ABM is shutting down ");
  uint64_t v12 = std::string::append(&__dst, v11, 0x20uLL);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  __p[2] = (void *)v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  operator delete(v11);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    xpc_object_t v14 = v2[11];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      uint64_t v16 = *(void *)(a1 + 40);
      xpc_object_t v15 = (uint64_t *)(a1 + 40);
      if (!v16) {
        goto LABEL_61;
      }
      goto LABEL_32;
    }
  }
  else
  {
    xpc_object_t v14 = v2[11];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
  }
  xpc_object_t v22 = __p;
  if (SHIBYTE(__p[2]) < 0) {
    xpc_object_t v22 = (void **)__p[0];
  }
  LODWORD(__dst.__r_.__value_.__l.__data_) = 136315138;
  *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = (std::string::size_type)v22;
  _os_log_impl(&dword_26368A000, v14, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&__dst, 0xCu);
  uint64_t v23 = *(void *)(a1 + 40);
  xpc_object_t v15 = (uint64_t *)(a1 + 40);
  if (v23)
  {
LABEL_32:
    __dst.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    xpc_object_t v24 = (void *)HIBYTE(__p[2]);
    if (SHIBYTE(__p[2]) < 0) {
      xpc_object_t v24 = __p[1];
    }
    if (v24)
    {
      xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
      if (v25 || (xpc_object_t v25 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6A240](v25) == MEMORY[0x263EF8708])
        {
          xpc_retain(v25);
          xpc_object_t v26 = v25;
        }
        else
        {
          xpc_object_t v26 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v26 = xpc_null_create();
        xpc_object_t v25 = 0;
      }
      xpc_release(v25);
      xpc_object_t v29 = xpc_null_create();
      uint64_t v30 = (void *)__dst.__r_.__value_.__r.__words[0];
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
      xpc_release(v30);
      xpc_release(v29);
      if (SHIBYTE(__p[2]) >= 0) {
        uint64_t v31 = __p;
      }
      else {
        uint64_t v31 = (void **)__p[0];
      }
      xpc_object_t v32 = xpc_string_create((const char *)v31);
      if (!v32) {
        xpc_object_t v32 = xpc_null_create();
      }
      xpc_dictionary_set_value(v26, (const char *)*MEMORY[0x263F25EB8], v32);
      xpc_object_t v33 = xpc_null_create();
      xpc_release(v32);
      xpc_release(v33);
    }
    unsigned int v38 = -534716415;
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(v15, &v38, (void **)&__dst.__r_.__value_.__l.__data_);
    xpc_release(__dst.__r_.__value_.__l.__data_);
  }
LABEL_61:
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2637820D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *aBlock, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,xpc_object_t object,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void TraceManager::collectBasebandLogs_sync(uint64_t a1, xpc_object_t *a2, uint64_t *a3)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  if (MEMORY[0x263E6A240](*a2) != MEMORY[0x263EF8708])
  {
    xpc_object_t v6 = xpc_null_create();
    uint64_t v7 = *a3;
    *(void *)xpc_object_t object = v6;
    xpc_object_t v8 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, unsigned char *))(v7 + 16))(v7, 3760250880, object);
    xpc_release(*(xpc_object_t *)object);
    xpc_release(v8);
    return;
  }
  memset(v137, 170, sizeof(v137));
  uint64_t v9 = (const __CFString **)*MEMORY[0x263F25ED8];
  xpc_object_t value = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x263F25ED8]);
  *(void *)xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    *(void *)xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)v137, (xpc *)object, (const object *)*MEMORY[0x263F26058], v11);
  xpc_release(*(xpc_object_t *)object);
  memset(&v136, 170, sizeof(v136));
  v108 = (const __CFString **)*MEMORY[0x263F26030];
  xpc_object_t v12 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x263F26030]);
  v135.__r_.__value_.__r.__words[0] = (std::string::size_type)v12;
  if (v12) {
    xpc_retain(v12);
  }
  else {
    v135.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  Timestamp::Timestamp((Timestamp *)&__dst);
  Timestamp::asString(v13, 0, 9, object);
  xpc::dyn_cast_or_default();
  if ((object[23] & 0x80000000) != 0) {
    operator delete(*(void **)object);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)&__dst, (void *)__dst.__r_.__value_.__l.__size_);
  xpc_release(v135.__r_.__value_.__l.__data_);
  memset(&v135, 170, sizeof(v135));
  xpc_object_t v14 = (const __CFString **)*MEMORY[0x263F263C0];
  xpc_object_t v15 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x263F263C0]);
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
  if (v15) {
    xpc_retain(v15);
  }
  else {
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  memset(object, 0, 24);
  xpc::dyn_cast_or_default();
  if ((object[23] & 0x80000000) != 0) {
    operator delete(*(void **)object);
  }
  xpc_release(__dst.__r_.__value_.__l.__data_);
  uint64_t IsInternalBuild = TelephonyUtilIsInternalBuild();
  if ((IsInternalBuild & 1) != 0 || (uint64_t IsInternalBuild = TelephonyUtilIsCarrierBuild(), IsInternalBuild)) {
    uint64_t CompressionMode = capabilities::trace::getCompressionMode((capabilities::trace *)IsInternalBuild);
  }
  else {
    uint64_t CompressionMode = 2;
  }
  BOOL v134 = 0;
  uint64_t v18 = (const void *)*MEMORY[0x263F206F8];
  size_t v19 = strlen((const char *)*MEMORY[0x263F206F8]);
  if (v19 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v20 = v19;
  if (v19 >= 0x17)
  {
    uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v22 = v19 | 7;
    }
    uint64_t v23 = v22 + 1;
    p_dst = (std::string *)operator new(v22 + 1);
    __dst.__r_.__value_.__l.__size_ = v20;
    __dst.__r_.__value_.__r.__words[2] = v23 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_27;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v19;
  p_dst = &__dst;
  if (v19) {
LABEL_27:
  }
    memmove(p_dst, v18, v20);
  p_dst->__r_.__value_.__s.__data_[v20] = 0;
  memset(object, 0, 24);
  if (prop::compression::get((char *)&__dst, (uint64_t)object))
  {
    LODWORD(v140[0]) = -1431655766;
    if (util::convert<int>((const std::string *)object, v140, 0)) {
      uint64_t CompressionMode = LODWORD(v140[0]);
    }
    else {
      uint64_t CompressionMode = CompressionMode;
    }
  }
  if ((object[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)object);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_34;
    }
  }
  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_34;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_34:
  xpc_object_t v24 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x263F26820]);
  *(void *)xpc_object_t object = v24;
  if (v24) {
    xpc_retain(v24);
  }
  else {
    *(void *)xpc_object_t object = xpc_null_create();
  }
  int v25 = xpc::dyn_cast_or_default((xpc *)object, (const object *)CompressionMode);
  xpc_release(*(xpc_object_t *)object);
  if (v25)
  {
    BOOL v134 = 0;
    xpc_object_t v26 = (const void *)*MEMORY[0x263F205A8];
    size_t v27 = strlen((const char *)*MEMORY[0x263F205A8]);
    if (v27 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v28 = v27;
    if (v27 >= 0x17)
    {
      uint64_t v30 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v27 | 7) != 0x17) {
        uint64_t v30 = v27 | 7;
      }
      uint64_t v31 = v30 + 1;
      xpc_object_t v29 = (std::string *)operator new(v30 + 1);
      __dst.__r_.__value_.__l.__size_ = v28;
      __dst.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
    }
    else
    {
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v27;
      xpc_object_t v29 = &__dst;
      if (!v27)
      {
LABEL_48:
        v29->__r_.__value_.__s.__data_[v28] = 0;
        memset(object, 0, 24);
        if (prop::compression::get((char *)&__dst, (uint64_t)object)) {
          util::convert<BOOL>((const std::string *)object, &v134, 0);
        }
        if ((object[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)object);
          if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_52;
          }
        }
        else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_52:
          xpc_object_t v32 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x263F266C0]);
          *(void *)xpc_object_t object = v32;
          if (v32) {
            xpc_retain(v32);
          }
          else {
            *(void *)xpc_object_t object = xpc_null_create();
          }
          BOOL v134 = xpc::dyn_cast_or_default((xpc *)object, (const object *)v134);
          xpc_release(*(xpc_object_t *)object);
          goto LABEL_58;
        }
        operator delete(__dst.__r_.__value_.__l.__data_);
        goto LABEL_52;
      }
    }
    memmove(v29, v26, v28);
    goto LABEL_48;
  }
LABEL_58:
  std::string::size_type size = HIBYTE(v135.__r_.__value_.__r.__words[2]);
  if ((v135.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v135.__r_.__value_.__l.__size_;
  }
  if (!size) {
    std::string::__assign_external(&v135, (const std::string::value_type *)*MEMORY[0x263F25E58]);
  }
  v132 = (ctu *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
  GetABMLogServer(&v130);
  abm::HelperClient::create();
  uint64_t v34 = v131;
  if (v131 && !atomic_fetch_add(&v131->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
  }
  xpc_object_t xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t xdict = xpc_null_create();
  xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
  if (v35 || (xpc_object_t v35 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v35) == MEMORY[0x263EF8708])
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
  xpc_object_t v37 = xpc_int64_create(1500);
  if (!v37) {
    xpc_object_t v37 = xpc_null_create();
  }
  xpc_dictionary_set_value(v36, (const char *)*MEMORY[0x263F20540], v37);
  xpc_object_t v38 = xpc_null_create();
  xpc_release(v37);
  xpc_release(v38);
  *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)xpc_object_t object = v39;
  *(_OWORD *)&object[16] = v39;
  xpc_object_t v127 = v36;
  if (v36) {
    xpc_retain(v36);
  }
  else {
    xpc_object_t v127 = xpc_null_create();
  }
  abm::HelperClient::perform();
  xpc_release(v127);
  xpc_object_t v127 = 0;
  xpc_object_t v126 = xpc_null_create();
  if (*(_DWORD *)object || MEMORY[0x263E6A240](xdict) != MEMORY[0x263EF8708] || !*(void *)(a1 + 256))
  {
LABEL_78:
    xpc_release(v126);
    if ((object[31] & 0x80000000) != 0) {
      operator delete(*(void **)&object[8]);
    }
    xpc_release(v36);
    xpc_release(xdict);
    v107 = (void **)a3;
    v40 = (std::__shared_weak_count *)v133;
    if (v133 && !atomic_fetch_add((atomic_ullong *volatile)(v133 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
    uint64_t v41 = (const char **)MEMORY[0x263F204D0];
    uint64_t v42 = (const void *)*MEMORY[0x263F204D0];
    size_t v43 = strlen((const char *)*MEMORY[0x263F204D0]);
    if (v43 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v44 = v43;
    if (v43 >= 0x17)
    {
      uint64_t v46 = (v43 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v43 | 7) != 0x17) {
        uint64_t v46 = v43 | 7;
      }
      uint64_t v47 = v46 + 1;
      xpc_object_t v45 = operator new(v46 + 1);
      *(void *)&object[8] = v44;
      *(void *)&object[16] = v47 | 0x8000000000000000;
      *(void *)xpc_object_t object = v45;
    }
    else
    {
      object[23] = v43;
      xpc_object_t v45 = object;
      if (!v43)
      {
LABEL_91:
        v45[v44] = 0;
        support::fs::createDir(object, 0x1EDu, 1);
        if ((object[23] & 0x80000000) != 0) {
          operator delete(*(void **)object);
        }
        v132 = 0;
        uint64_t v48 = *MEMORY[0x263EFFB08];
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        xpc_object_t v51 = Mutable;
        if (Mutable) {
          v132 = Mutable;
        }
        if (SHIBYTE(v135.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external((std::string *)object, v135.__r_.__value_.__l.__data_, v135.__r_.__value_.__l.__size_);
        }
        else {
          *(std::string *)xpc_object_t object = v135;
        }
        ctu::cf::insert<char const*,std::string>(v51, v14, (uint64_t)object, v48, v50);
        if ((object[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)object);
          if ((SHIBYTE(v136.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_100;
          }
        }
        else if ((SHIBYTE(v136.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_100:
          *(std::string *)xpc_object_t object = v136;
          goto LABEL_103;
        }
        std::string::__init_copy_ctor_external((std::string *)object, v136.__r_.__value_.__l.__data_, v136.__r_.__value_.__l.__size_);
LABEL_103:
        ctu::cf::insert<char const*,std::string>(v51, v108, (uint64_t)object, v48, v52);
        if ((object[23] & 0x80000000) != 0) {
          operator delete(*(void **)object);
        }
        memset(&__dst, 170, sizeof(__dst));
        xpc_object_t v53 = *v41;
        size_t v54 = strlen(*v41);
        if (v54 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        std::string::size_type v55 = v54;
        if (v54 >= 0x17)
        {
          uint64_t v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v54 | 7) != 0x17) {
            uint64_t v57 = v54 | 7;
          }
          uint64_t v58 = v57 + 1;
          xpc_object_t v56 = (std::string *)operator new(v57 + 1);
          __dst.__r_.__value_.__l.__size_ = v55;
          __dst.__r_.__value_.__r.__words[2] = v58 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v56;
        }
        else
        {
          *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v54;
          xpc_object_t v56 = &__dst;
          if (!v54)
          {
            __dst.__r_.__value_.__s.__data_[0] = 0;
            if (!v25) {
              goto LABEL_131;
            }
LABEL_114:
            uint64_t v59 = a1;
            int v60 = v25;
            std::string v109 = v9;
            v61 = (const void *)*MEMORY[0x263F204E8];
            size_t v62 = strlen((const char *)*MEMORY[0x263F204E8]);
            int v63 = SHIBYTE(v136.__r_.__value_.__r.__words[2]);
            if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              size_t v64 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
            }
            else {
              size_t v64 = v136.__r_.__value_.__l.__size_;
            }
            unint64_t v65 = v64 + v62;
            memset(object, 170, 24);
            if (v64 + v62 > 0x7FFFFFFFFFFFFFF7) {
              std::string::__throw_length_error[abi:ne180100]();
            }
            size_t v66 = v62;
            if (v65 > 0x16)
            {
              uint64_t v86 = (v65 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v65 | 7) != 0x17) {
                uint64_t v86 = v65 | 7;
              }
              uint64_t v87 = v86 + 1;
              uint64_t v67 = operator new(v86 + 1);
              *(void *)&object[8] = v65;
              *(void *)&object[16] = v87 | 0x8000000000000000;
              *(void *)xpc_object_t object = v67;
              int v25 = v60;
              if (!v66) {
                goto LABEL_121;
              }
            }
            else
            {
              memset(object, 0, 24);
              uint64_t v67 = object;
              object[23] = v64 + v62;
              int v25 = v60;
              if (!v62)
              {
LABEL_121:
                a1 = v59;
                if (v64)
                {
                  if (v63 >= 0) {
                    v68 = &v136;
                  }
                  else {
                    v68 = (std::string *)v136.__r_.__value_.__r.__words[0];
                  }
                  memmove(&v67[v66], v68, v64);
                }
                v67[v66 + v64] = 0;
                v69 = std::string::append((std::string *)object, "/", 1uLL);
                std::string::size_type v70 = v69->__r_.__value_.__r.__words[0];
                v140[0] = (const void *)v69->__r_.__value_.__l.__size_;
                *(const void **)((char *)v140 + 7) = *(const void **)((char *)&v69->__r_.__value_.__r.__words[1] + 7);
                char v71 = HIBYTE(v69->__r_.__value_.__r.__words[2]);
                v69->__r_.__value_.__l.__size_ = 0;
                v69->__r_.__value_.__r.__words[2] = 0;
                v69->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__dst.__r_.__value_.__l.__data_);
                }
                __dst.__r_.__value_.__r.__words[0] = v70;
                __dst.__r_.__value_.__l.__size_ = (std::string::size_type)v140[0];
                *(std::string::size_type *)((char *)&__dst.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)v140 + 7);
                *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v71;
                if ((object[23] & 0x80000000) != 0) {
                  operator delete(*(void **)object);
                }
                uint64_t v9 = v109;
LABEL_131:
                support::fs::createDir((const char *)&__dst, 0x1EDu, 1);
                v73 = v132;
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                  std::string::__init_copy_ctor_external((std::string *)object, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                }
                else {
                  *(std::string *)xpc_object_t object = __dst;
                }
                ctu::cf::insert<char const*,std::string>(v73, (const __CFString **)*MEMORY[0x263F26218], (uint64_t)object, v48, v72);
                if ((object[23] & 0x80000000) != 0)
                {
                  operator delete(*(void **)object);
                  if ((v137[23] & 0x80000000) == 0) {
                    goto LABEL_136;
                  }
                }
                else if ((v137[23] & 0x80000000) == 0)
                {
LABEL_136:
                  *(_OWORD *)xpc_object_t object = *(_OWORD *)v137;
                  *(void *)&object[16] = *(void *)&v137[16];
                  goto LABEL_139;
                }
                std::string::__init_copy_ctor_external((std::string *)object, *(const std::string::value_type **)v137, *(std::string::size_type *)&v137[8]);
LABEL_139:
                ctu::cf::insert<char const*,std::string>(v73, v9, (uint64_t)object, v48, v74);
                if ((object[23] & 0x80000000) != 0) {
                  operator delete(*(void **)object);
                }
                size_t v75 = *(std::__shared_weak_count **)(a1 + 128);
                if (!v75 || (v76 = *(void *)(a1 + 120), (uint64_t v77 = std::__shared_weak_count::lock(v75)) == 0)) {
                  std::__throw_bad_weak_ptr[abi:ne180100]();
                }
                uint64_t v78 = v77;
                p_shared_weak_owners = &v77->__shared_weak_owners_;
                atomic_fetch_add_explicit(&v77->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                if (!atomic_fetch_add(&v77->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
                  std::__shared_weak_count::__release_weak(v78);
                }
                memset(object, 170, 16);
                aBlock[0] = MEMORY[0x263EF8330];
                aBlock[1] = 1174405120;
                aBlock[2] = ___ZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke;
                aBlock[3] = &__block_descriptor_tmp_51_3;
                aBlock[4] = a1;
                void aBlock[5] = v76;
                v115 = v78;
                atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
                xpc_object_t v80 = *v107;
                if (*v107) {
                  xpc_object_t v80 = _Block_copy(v80);
                }
                v116 = v80;
                if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0) {
                  std::string::__init_copy_ctor_external(&v117, v136.__r_.__value_.__l.__data_, v136.__r_.__value_.__l.__size_);
                }
                else {
                  std::string v117 = v136;
                }
                int v119 = v25;
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                  std::string::__init_copy_ctor_external(&v118, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                }
                else {
                  std::string v118 = __dst;
                }
                BOOL v120 = v134;
                xpc_object_t v82 = _Block_copy(aBlock);
                xpc_object_t v83 = *(NSObject **)(a1 + 136);
                if (v83) {
                  dispatch_retain(*(dispatch_object_t *)(a1 + 136));
                }
                *(void *)xpc_object_t object = v82;
                *(void *)&object[8] = v83;
                v84 = v132;
                ctu::cf_to_xpc((uint64_t *)v140, v132, v81);
                xpc_object_t v85 = (xpc_object_t)v140[0];
                if (v140[0] && MEMORY[0x263E6A240](v140[0]) == MEMORY[0x263EF8708]) {
                  xpc_retain(v85);
                }
                else {
                  xpc_object_t v85 = xpc_null_create();
                }
                xpc_release((xpc_object_t)v140[0]);
                v88 = (const char *)(a1 + 168);
                if (*(char *)(a1 + 191) < 0) {
                  v88 = *(const char **)v88;
                }
                xpc_object_t v89 = xpc_string_create(v88);
                if (!v89) {
                  xpc_object_t v89 = xpc_null_create();
                }
                xpc_dictionary_set_value(v85, (const char *)*MEMORY[0x263F26000], v89);
                xpc_object_t v90 = xpc_null_create();
                xpc_release(v89);
                xpc_release(v90);
                xpc_object_t v113 = v85;
                if (v85)
                {
                  xpc_retain(v85);
                  uint64_t v112 = 0;
                  if (v82) {
                    goto LABEL_169;
                  }
                }
                else
                {
                  uint64_t v112 = 0;
                  xpc_object_t v113 = xpc_null_create();
                  if (v82)
                  {
LABEL_169:
                    v91 = _Block_copy(v82);
                    uint64_t v92 = *MEMORY[0x263F206B0];
                    std::string v110 = v91;
                    v111 = v83;
                    if (!v83) {
                      goto LABEL_171;
                    }
                    goto LABEL_170;
                  }
                }
                v91 = 0;
                uint64_t v92 = *MEMORY[0x263F206B0];
                std::string v110 = 0;
                v111 = v83;
                if (!v83)
                {
LABEL_171:
                  TraceManager::runOnHelper_sync((void *)a1, (const char *)9, v92, 0x1388u, 1, &v113, &v112, &v110);
                  if (v83) {
                    dispatch_release(v83);
                  }
                  if (v91) {
                    _Block_release(v91);
                  }
                  xpc_release(v113);
                  xpc_object_t v113 = 0;
                  xpc_release(v85);
                  if (v83) {
                    dispatch_release(v83);
                  }
                  if (v82) {
                    _Block_release(v82);
                  }
                  if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
                  {
                    operator delete(v118.__r_.__value_.__l.__data_);
                    if ((SHIBYTE(v117.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    {
LABEL_181:
                      xpc_object_t v93 = v116;
                      if (!v116)
                      {
LABEL_189:
                        if (v115) {
                          std::__shared_weak_count::__release_weak(v115);
                        }
                        std::__shared_weak_count::__release_weak(v78);
                        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                        {
                          operator delete(__dst.__r_.__value_.__l.__data_);
                          if (!v84) {
                            goto LABEL_196;
                          }
                        }
                        else if (!v84)
                        {
LABEL_196:
                          if (SHIBYTE(v135.__r_.__value_.__r.__words[2]) < 0) {
                            goto LABEL_236;
                          }
LABEL_197:
                          if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0) {
                            goto LABEL_237;
                          }
                          goto LABEL_198;
                        }
                        CFRelease(v84);
                        goto LABEL_196;
                      }
LABEL_188:
                      _Block_release(v93);
                      goto LABEL_189;
                    }
                  }
                  else if ((SHIBYTE(v117.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  {
                    goto LABEL_181;
                  }
                  operator delete(v117.__r_.__value_.__l.__data_);
                  xpc_object_t v93 = v116;
                  if (!v116) {
                    goto LABEL_189;
                  }
                  goto LABEL_188;
                }
LABEL_170:
                dispatch_retain(v83);
                goto LABEL_171;
              }
            }
            memcpy(v67, v61, v66);
            goto LABEL_121;
          }
        }
        memmove(v56, v53, v55);
        v56->__r_.__value_.__s.__data_[v55] = 0;
        if (!v25) {
          goto LABEL_131;
        }
        goto LABEL_114;
      }
    }
    memmove(v45, v42, v44);
    goto LABEL_91;
  }
  memset(v140, 170, sizeof(v140));
  xpc_object_t v94 = xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x263F20618]);
  v125[0] = v94;
  if (v94) {
    xpc_retain(v94);
  }
  else {
    v125[0] = xpc_null_create();
  }
  memset(&__dst, 0, sizeof(__dst));
  xpc::dyn_cast_or_default();
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  xpc_release(v125[0]);
  v95 = *(NSObject **)(a1 + 88);
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v96 = *(void *)(*(void *)(a1 + 256) + 16);
    LODWORD(__dst.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(__dst.__r_.__value_.__r.__words[0]) = v96;
    _os_log_impl(&dword_26368A000, v95, OS_LOG_TYPE_DEFAULT, "#I Baseband Log tracker size: %d", (uint8_t *)&__dst, 8u);
  }
  v125[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v125[1] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  BBLogTracker::getLog(*(void *)(a1 + 256), v140, (uint64_t *)v125);
  xpc_object_t v97 = v125[0];
  if (!v125[0])
  {
    std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v125);
    if (SHIBYTE(v140[2]) < 0) {
      operator delete((void *)v140[0]);
    }
    goto LABEL_78;
  }
  v98 = *(NSObject **)(a1 + 88);
  BOOL v99 = os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT);
  uint64_t v100 = MEMORY[0x263EF8708];
  if (v99)
  {
    asString((uint64_t)v97, &__dst);
    v101 = (__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
         ? &__dst
         : (std::string *)__dst.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    v139 = v101;
    _os_log_impl(&dword_26368A000, v98, OS_LOG_TYPE_DEFAULT, "#I Log tracker info: %s", buf, 0xCu);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
  }
  xpc_object_t v102 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v103 = v102;
  if (v102)
  {
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v102;
  }
  else
  {
    xpc_object_t v103 = xpc_null_create();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v103;
    if (!v103)
    {
      xpc_object_t v104 = xpc_null_create();
      xpc_object_t v103 = 0;
      goto LABEL_224;
    }
  }
  if (MEMORY[0x263E6A240](v103) == v100)
  {
    xpc_retain(v103);
    goto LABEL_225;
  }
  xpc_object_t v104 = xpc_null_create();
LABEL_224:
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
LABEL_225:
  xpc_release(v103);
  xpc::dict::operator=(&v126, (xpc_object_t *)&__dst.__r_.__value_.__l.__data_);
  xpc_release(__dst.__r_.__value_.__l.__data_);
  xpc_object_t v123 = xpc_string_create((const char *)*MEMORY[0x263F204D0]);
  if (!v123) {
    xpc_object_t v123 = xpc_null_create();
  }
  std::string::size_type v105 = *MEMORY[0x263F26218];
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&v126;
  __dst.__r_.__value_.__l.__size_ = v105;
  xpc::dict::object_proxy::operator=((uint64_t)&__dst, &v123, &v124);
  xpc_release(v124);
  xpc_object_t v124 = 0;
  xpc_release(v123);
  xpc_object_t v123 = 0;
  std::string v106 = (const char *)v125[0];
  if (*((char *)v125[0] + 23) < 0) {
    std::string v106 = *(const char **)v125[0];
  }
  xpc_object_t v121 = xpc_string_create(v106);
  if (!v121) {
    xpc_object_t v121 = xpc_null_create();
  }
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&v126;
  __dst.__r_.__value_.__l.__size_ = (std::string::size_type)v108;
  xpc::dict::object_proxy::operator=((uint64_t)&__dst, &v121, &v122);
  xpc_release(v122);
  xpc_object_t v122 = 0;
  xpc_release(v121);
  xpc_object_t v121 = 0;
  LODWORD(__dst.__r_.__value_.__l.__data_) = 0;
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(a3, (unsigned int *)&__dst, &v126);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v125);
  if (SHIBYTE(v140[2]) < 0) {
    operator delete((void *)v140[0]);
  }
  xpc_release(v126);
  if ((object[31] & 0x80000000) != 0) {
    operator delete(*(void **)&object[8]);
  }
  xpc_release(v36);
  xpc_release(xdict);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&v132);
  if ((SHIBYTE(v135.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_197;
  }
LABEL_236:
  operator delete(v135.__r_.__value_.__l.__data_);
  if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
  {
LABEL_237:
    operator delete(v136.__r_.__value_.__l.__data_);
    if ((v137[23] & 0x80000000) != 0) {
      goto LABEL_238;
    }
    return;
  }
LABEL_198:
  if ((v137[23] & 0x80000000) != 0) {
LABEL_238:
  }
    operator delete(*(void **)v137);
}

void sub_263783418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, xpc_object_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,void *aBlock,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,xpc_object_t a41,uint64_t a42,xpc_object_t object,xpc_object_t a44,xpc_object_t a45,void *__p,int a47,__int16 a48,char a49,char a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,xpc_object_t a56,char a57,uint64_t a58,char a59)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void TraceManager::collectLogs_sync(void *a1, xpc_object_t *a2, void (***a3)(void *, uint64_t, stat *))
{
  size_t v4 = a2;
  uint64_t v229 = *MEMORY[0x263EF8340];
  if (MEMORY[0x263E6A240](*a2) != MEMORY[0x263EF8708])
  {
    xpc_object_t v6 = xpc_null_create();
    uint64_t v7 = *a3;
    *(void *)&v228.st_dev = v6;
    xpc_object_t v8 = xpc_null_create();
    v7[2](v7, 3760250880, &v228);
    xpc_release(*(xpc_object_t *)&v228.st_dev);
    xpc_release(v8);
    return;
  }
  memset(__sz, 170, sizeof(__sz));
  uint64_t v9 = (const __CFString **)*MEMORY[0x263F25ED8];
  xpc_object_t value = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F25ED8]);
  *(void *)&v228.st_dev = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  xpc_object_t v12 = (char *)*MEMORY[0x263F26110];
  xpc::dyn_cast_or_default((uint64_t *)__sz, (xpc *)&v228, (const object *)*MEMORY[0x263F26110], v11);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  memset(v224, 170, sizeof(v224));
  uint64_t v13 = (const __CFString **)*MEMORY[0x263F26030];
  xpc_object_t v14 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F26030]);
  v222[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v14;
  if (v14) {
    xpc_retain(v14);
  }
  else {
    v222[1].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  Timestamp::Timestamp((Timestamp *)v223);
  Timestamp::asString((uint64_t)v223, 0, 9, &v228);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v228.st_gid) < 0) {
    operator delete(*(void **)&v228.st_dev);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)v223, (void *)v223[1]);
  xpc_release(v222[1].__r_.__value_.__l.__data_);
  memset(v223, 170, sizeof(v223));
  xpc_object_t v15 = (const __CFString **)*MEMORY[0x263F26148];
  xpc_object_t v16 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F26148]);
  v222[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v16;
  if (v16) {
    xpc_retain(v16);
  }
  else {
    v222[1].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  memset(&v228, 0, 24);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v228.st_gid) < 0) {
    operator delete(*(void **)&v228.st_dev);
  }
  xpc_release(v222[1].__r_.__value_.__l.__data_);
  memset(&v222[1], 170, sizeof(std::string));
  size_t v17 = (const __CFString **)*MEMORY[0x263F26368];
  xpc_object_t v18 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F26368]);
  v222[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
  if (v18) {
    xpc_retain(v18);
  }
  else {
    v222[0].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  memset(&v228, 0, 24);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v228.st_gid) < 0) {
    operator delete(*(void **)&v228.st_dev);
  }
  xpc_release(v222[0].__r_.__value_.__l.__data_);
  memset(v222, 170, 24);
  size_t v19 = (const __CFString **)*MEMORY[0x263F263C0];
  xpc_object_t v20 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F263C0]);
  __dst[0] = v20;
  if (v20) {
    xpc_retain(v20);
  }
  else {
    __dst[0] = xpc_null_create();
  }
  memset(&v228, 0, 24);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v228.st_gid) < 0) {
    operator delete(*(void **)&v228.st_dev);
  }
  xpc_release(__dst[0]);
  xpc_object_t v21 = (const __CFString **)*MEMORY[0x263F25E10];
  xpc_object_t v22 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F25E10]);
  *(void *)&v228.st_dev = v22;
  if (v22) {
    xpc_retain(v22);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  v191 = v19;
  __s = v12;
  int v185 = xpc::dyn_cast_or_default((xpc *)&v228, (const object *)7);
  v186 = v21;
  v190 = v13;
  v188 = v17;
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  char v221 = 1;
  __src = (void *)*MEMORY[0x263F26858];
  size_t v23 = strlen((const char *)*MEMORY[0x263F26858]);
  if (v23 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  xpc_object_t v24 = (void *)v23;
  v187 = v15;
  v189 = v9;
  if (v23 >= 0x17)
  {
    uint64_t v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v23 | 7) != 0x17) {
      uint64_t v26 = v23 | 7;
    }
    uint64_t v27 = v26 + 1;
    int v25 = operator new(v26 + 1);
    xpc_object_t __dst[2] = (xpc_object_t)(v27 | 0x8000000000000000);
    __dst[0] = v25;
    __dst[1] = v24;
    goto LABEL_36;
  }
  HIBYTE(__dst[2]) = v23;
  int v25 = __dst;
  if (v23) {
LABEL_36:
  }
    memmove(v25, __src, (size_t)v24);
  *((unsigned char *)v24 + (void)v25) = 0;
  memset(&v228, 0, 24);
  if (prop::logfilter::get((char *)__dst, (uint64_t)&v228)) {
    util::convert<BOOL>((const std::string *)&v228, (BOOL *)&v221, 0);
  }
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      goto LABEL_41;
    }
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_41;
  }
  operator delete(__dst[0]);
LABEL_41:
  xpc_object_t v28 = xpc_dictionary_get_value(*v4, (const char *)__src);
  *(void *)&v228.st_dev = v28;
  if (v28) {
    xpc_retain(v28);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  char v221 = xpc::dyn_cast_or_default((xpc *)&v228, (const object *)v221);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  uint64_t IsInternalBuild = TelephonyUtilIsInternalBuild();
  if ((IsInternalBuild & 1) != 0 || (uint64_t IsInternalBuild = TelephonyUtilIsCarrierBuild(), IsInternalBuild)) {
    uint64_t CompressionMode = capabilities::trace::getCompressionMode((capabilities::trace *)IsInternalBuild);
  }
  else {
    uint64_t CompressionMode = 2;
  }
  BOOL v220 = 0;
  uint64_t v31 = (const void *)*MEMORY[0x263F206F8];
  size_t v32 = strlen((const char *)*MEMORY[0x263F206F8]);
  if (v32 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  xpc_object_t v33 = (void *)v32;
  if (v32 >= 0x17)
  {
    uint64_t v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v32 | 7) != 0x17) {
      uint64_t v35 = v32 | 7;
    }
    uint64_t v36 = v35 + 1;
    uint64_t v34 = operator new(v35 + 1);
    xpc_object_t __dst[2] = (xpc_object_t)(v36 | 0x8000000000000000);
    __dst[0] = v34;
    __dst[1] = v33;
    goto LABEL_57;
  }
  HIBYTE(__dst[2]) = v32;
  uint64_t v34 = __dst;
  if (v32) {
LABEL_57:
  }
    memmove(v34, v31, (size_t)v33);
  *((unsigned char *)v33 + (void)v34) = 0;
  memset(&v228, 0, 24);
  if (prop::compression::get((char *)__dst, (uint64_t)&v228))
  {
    LODWORD(v226.__r_.__value_.__l.__data_) = -1431655766;
    if (util::convert<int>((const std::string *)&v228, &v226, 0)) {
      uint64_t CompressionMode = LODWORD(v226.__r_.__value_.__l.__data_);
    }
    else {
      uint64_t CompressionMode = CompressionMode;
    }
  }
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      goto LABEL_64;
    }
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_64;
  }
  operator delete(__dst[0]);
LABEL_64:
  v184 = (const __CFString **)*MEMORY[0x263F26820];
  xpc_object_t v37 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F26820]);
  *(void *)&v228.st_dev = v37;
  if (v37) {
    xpc_retain(v37);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  int v38 = xpc::dyn_cast_or_default((xpc *)&v228, (const object *)CompressionMode);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  if (v38)
  {
    BOOL v220 = 0;
    long long v39 = (const void *)*MEMORY[0x263F205A8];
    size_t v40 = strlen((const char *)*MEMORY[0x263F205A8]);
    if (v40 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    uint64_t v41 = (void *)v40;
    if (v40 >= 0x17)
    {
      uint64_t v43 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v40 | 7) != 0x17) {
        uint64_t v43 = v40 | 7;
      }
      uint64_t v44 = v43 + 1;
      uint64_t v42 = operator new(v43 + 1);
      xpc_object_t __dst[2] = (xpc_object_t)(v44 | 0x8000000000000000);
      __dst[0] = v42;
      __dst[1] = v41;
    }
    else
    {
      HIBYTE(__dst[2]) = v40;
      uint64_t v42 = __dst;
      if (!v40)
      {
LABEL_78:
        *((unsigned char *)v41 + (void)v42) = 0;
        memset(&v228, 0, 24);
        if (prop::compression::get((char *)__dst, (uint64_t)&v228)) {
          util::convert<BOOL>((const std::string *)&v228, &v220, 0);
        }
        if (SHIBYTE(v228.st_gid) < 0)
        {
          operator delete(*(void **)&v228.st_dev);
          if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
            goto LABEL_82;
          }
        }
        else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
        {
LABEL_82:
          xpc_object_t v45 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F266C0]);
          *(void *)&v228.st_dev = v45;
          if (v45) {
            xpc_retain(v45);
          }
          else {
            *(void *)&v228.st_dev = xpc_null_create();
          }
          BOOL v220 = xpc::dyn_cast_or_default((xpc *)&v228, (const object *)v220);
          xpc_release(*(xpc_object_t *)&v228.st_dev);
          goto LABEL_88;
        }
        operator delete(__dst[0]);
        goto LABEL_82;
      }
    }
    memmove(v42, v39, (size_t)v41);
    goto LABEL_78;
  }
LABEL_88:
  char v219 = 1;
  key = (char *)*MEMORY[0x263F26468];
  size_t v46 = strlen((const char *)*MEMORY[0x263F26468]);
  if (v46 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v47 = (void *)v46;
  if (v46 >= 0x17)
  {
    uint64_t v49 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v46 | 7) != 0x17) {
      uint64_t v49 = v46 | 7;
    }
    uint64_t v50 = v49 + 1;
    uint64_t v48 = operator new(v49 + 1);
    xpc_object_t __dst[2] = (xpc_object_t)(v50 | 0x8000000000000000);
    __dst[0] = v48;
    __dst[1] = v47;
    goto LABEL_95;
  }
  HIBYTE(__dst[2]) = v46;
  uint64_t v48 = __dst;
  if (v46) {
LABEL_95:
  }
    memmove(v48, key, (size_t)v47);
  *((unsigned char *)v47 + (void)v48) = 0;
  memset(&v228, 0, 24);
  if (prop::systemlogs::get((char *)__dst, (uint64_t)&v228)) {
    util::convert<BOOL>((const std::string *)&v228, (BOOL *)&v219, 0);
  }
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      goto LABEL_100;
    }
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_100;
  }
  operator delete(__dst[0]);
LABEL_100:
  xpc_object_t v51 = xpc_dictionary_get_value(*v4, key);
  *(void *)&v228.st_dev = v51;
  if (v51) {
    xpc_retain(v51);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  char v219 = xpc::dyn_cast_or_default((xpc *)&v228, (const object *)v219);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  std::string::size_type size = HIBYTE(v222[0].__r_.__value_.__r.__words[2]);
  if ((v222[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v222[0].__r_.__value_.__l.__size_;
  }
  if (!size) {
    std::string::__assign_external(v222, (const std::string::value_type *)*MEMORY[0x263F25E58]);
  }
  xpc_object_t v53 = (const void *)*MEMORY[0x263F25E28];
  size_t v54 = strlen((const char *)*MEMORY[0x263F25E28]);
  if (v54 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v55 = (void *)v54;
  if (v54 >= 0x17)
  {
    uint64_t v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v54 | 7) != 0x17) {
      uint64_t v57 = v54 | 7;
    }
    uint64_t v58 = v57 + 1;
    xpc_object_t v56 = operator new(v57 + 1);
    xpc_object_t __dst[2] = (xpc_object_t)(v58 | 0x8000000000000000);
    __dst[0] = v56;
    __dst[1] = v55;
    goto LABEL_116;
  }
  HIBYTE(__dst[2]) = v54;
  xpc_object_t v56 = __dst;
  if (v54) {
LABEL_116:
  }
    memmove(v56, v53, (size_t)v55);
  *((unsigned char *)v55 + (void)v56) = 0;
  memset(&v228, 0, 24);
  if (!prop::systemlogs::get((char *)__dst, (uint64_t)&v228))
  {
    unsigned int data = 0;
    if ((SHIBYTE(v228.st_gid) & 0x80000000) == 0) {
      goto LABEL_125;
    }
    goto LABEL_124;
  }
  LODWORD(v226.__r_.__value_.__l.__data_) = -1431655766;
  if (util::convert<int>((const std::string *)&v228, &v226, 0)) {
    unsigned int data = v226.__r_.__value_.__l.__data_;
  }
  else {
    unsigned int data = 0;
  }
  if (SHIBYTE(v228.st_gid) < 0) {
LABEL_124:
  }
    operator delete(*(void **)&v228.st_dev);
LABEL_125:
  if (SHIBYTE(__dst[2]) < 0) {
    operator delete(__dst[0]);
  }
  v183 = (const __CFString **)*MEMORY[0x263F25F30];
  xpc_object_t v60 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F25F30]);
  *(void *)&v228.st_dev = v60;
  if (v60) {
    xpc_retain(v60);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  int v61 = xpc::dyn_cast_or_default((xpc *)&v228, (const object *)data);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  if ((TelephonyUtilIsInternalBuild() & 1) != 0
    || ((IsCarrierBuild = TelephonyUtilIsCarrierBuild(), v61 != 2) ? (char v63 = 1) : (char v63 = IsCarrierBuild), (v63 & 1) != 0))
  {
    if (v61 == 2)
    {
      size_t v64 = (uint64_t **)a1[32];
      if (v64)
      {
        unint64_t v65 = a1[11];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          abm::helper::asString();
          if ((v228.st_gid & 0x80000000) == 0) {
            size_t v66 = &v228;
          }
          else {
            size_t v66 = *(stat **)&v228.st_dev;
          }
          LODWORD(__dst[0]) = 136315138;
          *(xpc_object_t *)((char *)__dst + 4) = v66;
          _os_log_impl(&dword_26368A000, v65, OS_LOG_TYPE_DEFAULT, "#I Detected a log dump with sysdiagnose mode, overriding compression mode to %s", (uint8_t *)__dst, 0xCu);
          if (SHIBYTE(v228.st_gid) < 0) {
            operator delete(*(void **)&v228.st_dev);
          }
          size_t v64 = (uint64_t **)a1[32];
        }
        BBLogTracker::addLog(v64, (long long *)v224, 2, (uint64_t)__sz);
        uint64_t v67 = (uint64_t *)a1[32];
        if ((unint64_t)v67[2] >= 0xB)
        {
          do
            std::__tree<std::__value_type<std::string,std::shared_ptr<LogInfo>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<LogInfo>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<LogInfo>>>>::erase(v67, *v67);
          while ((unint64_t)v67[2] > 0xA);
        }
        int v38 = 0;
      }
      int v182 = 2;
    }
    else
    {
      int v182 = v61;
    }
  }
  else
  {
    v68 = a1[11];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v228.st_dev) = 0;
      _os_log_error_impl(&dword_26368A000, v68, OS_LOG_TYPE_ERROR, "Detected a log dump with SYSDIAGNOSE mode in customer build, overriding to OFF", (uint8_t *)&v228, 2u);
    }
    int v182 = 0;
  }
  memset(__dst, 170, 24);
  v69 = (const void *)*MEMORY[0x263F204D0];
  size_t v70 = strlen((const char *)*MEMORY[0x263F204D0]);
  if (v70 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  char v71 = (void *)v70;
  if (v70 >= 0x17)
  {
    uint64_t v73 = (v70 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v70 | 7) != 0x17) {
      uint64_t v73 = v70 | 7;
    }
    uint64_t v74 = v73 + 1;
    CFAllocatorRef v72 = operator new(v73 + 1);
    xpc_object_t __dst[2] = (xpc_object_t)(v74 | 0x8000000000000000);
    __dst[0] = v72;
    __dst[1] = v71;
LABEL_160:
    memmove(v72, v69, (size_t)v71);
    *((unsigned char *)v71 + (void)v72) = 0;
    if (!v38) {
      goto LABEL_177;
    }
    goto LABEL_161;
  }
  HIBYTE(__dst[2]) = v70;
  CFAllocatorRef v72 = __dst;
  if (v70) {
    goto LABEL_160;
  }
  LOBYTE(__dst[0]) = 0;
  if (!v38) {
    goto LABEL_177;
  }
LABEL_161:
  size_t v75 = v4;
  int v76 = v38;
  v181 = a3;
  uint64_t v77 = a1;
  uint64_t v78 = (const void *)*MEMORY[0x263F204E8];
  size_t v79 = strlen((const char *)*MEMORY[0x263F204E8]);
  int v80 = SHIBYTE(v224[2]);
  if (SHIBYTE(v224[2]) >= 0) {
    size_t v81 = HIBYTE(v224[2]);
  }
  else {
    size_t v81 = (size_t)v224[1];
  }
  __darwin_ino64_t v82 = v81 + v79;
  memset(&v228, 170, 24);
  if (v81 + v79 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v83 = v79;
  if (v82 > 0x16)
  {
    uint64_t v92 = (v82 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v82 | 7) != 0x17) {
      uint64_t v92 = v82 | 7;
    }
    uint64_t v93 = v92 + 1;
    v84 = (char *)operator new(v92 + 1);
    v228.st_ino = v82;
    *(void *)&v228.st_uid = v93 | 0x8000000000000000;
    *(void *)&v228.st_dev = v84;
    int v38 = v76;
    if (!v83) {
      goto LABEL_168;
    }
    goto LABEL_167;
  }
  memset(&v228, 0, 24);
  v84 = (char *)&v228;
  HIBYTE(v228.st_gid) = v81 + v79;
  int v38 = v76;
  if (v79) {
LABEL_167:
  }
    memcpy(v84, v78, v83);
LABEL_168:
  xpc_object_t v85 = &v84[v83];
  size_t v4 = v75;
  if (v81)
  {
    if (v80 >= 0) {
      uint64_t v86 = v224;
    }
    else {
      uint64_t v86 = (void **)v224[0];
    }
    memmove(v85, v86, v81);
  }
  v85[v81] = 0;
  uint64_t v87 = std::string::append((std::string *)&v228, "/", 1uLL);
  v88 = (void *)v87->__r_.__value_.__r.__words[0];
  v226.__r_.__value_.__r.__words[0] = v87->__r_.__value_.__l.__size_;
  *(std::string::size_type *)((char *)v226.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v87->__r_.__value_.__r.__words[1] + 7);
  char v89 = HIBYTE(v87->__r_.__value_.__r.__words[2]);
  v87->__r_.__value_.__l.__size_ = 0;
  v87->__r_.__value_.__r.__words[2] = 0;
  v87->__r_.__value_.__r.__words[0] = 0;
  a1 = v77;
  if (SHIBYTE(__dst[2]) < 0) {
    operator delete(__dst[0]);
  }
  __dst[0] = v88;
  __dst[1] = v226.__r_.__value_.__l.__data_;
  *(xpc_object_t *)((char *)&__dst[1] + 7) = *(xpc_object_t *)((char *)v226.__r_.__value_.__r.__words + 7);
  HIBYTE(__dst[2]) = v89;
  a3 = v181;
  if (SHIBYTE(v228.st_gid) < 0) {
    operator delete(*(void **)&v228.st_dev);
  }
LABEL_177:
  support::fs::createDir((const char *)__dst, 0x1EDu, 1);
  if ((__sz[2] & 0x8000000000000000) == 0) {
    size_t v90 = HIBYTE(__sz[2]);
  }
  else {
    size_t v90 = __sz[1];
  }
  if (v90 == strlen(__s))
  {
    v91 = (__sz[2] & 0x8000000000000000) == 0 ? __sz : (std::string::size_type *)__sz[0];
    if (!memcmp(v91, __s, v90))
    {
      char v218 = 9;
      strcpy((char *)__p, "StateDump");
      if (SHIBYTE(v222[0].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v216, v222[0].__r_.__value_.__l.__data_, v222[0].__r_.__value_.__l.__size_);
      }
      else {
        std::string v216 = v222[0];
      }
      TraceManager::submitTraceMetric_sync((uint64_t)a1, (const char *)__p, (const char *)&v216);
      if (SHIBYTE(v216.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v216.__r_.__value_.__l.__data_);
      }
      if (v218 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  memset(&v226, 0, sizeof(v226));
  TraceFilter::determineFilterAction(&v226);
  xpc_object_t v94 = (const void *)*MEMORY[0x263F26230];
  size_t v95 = strlen((const char *)*MEMORY[0x263F26230]);
  if (v95 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  __darwin_ino64_t v96 = v95;
  if (v95 >= 0x17)
  {
    uint64_t v99 = (v95 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v95 | 7) != 0x17) {
      uint64_t v99 = v95 | 7;
    }
    uint64_t v100 = v99 + 1;
    xpc_object_t v97 = operator new(v99 + 1);
    v228.st_ino = v96;
    *(void *)&v228.st_uid = v100 | 0x8000000000000000;
    *(void *)&v228.st_dev = v97;
  }
  else
  {
    HIBYTE(v228.st_gid) = v95;
    xpc_object_t v97 = &v228;
    if (!v95)
    {
      int v98 = v38;
      goto LABEL_204;
    }
  }
  int v98 = v38;
  memmove(v97, v94, v96);
LABEL_204:
  *((unsigned char *)v97 + v96) = 0;
  int st_gid_high = SHIBYTE(v228.st_gid);
  xpc_object_t v102 = *(void **)&v228.st_dev;
  if ((v228.st_gid & 0x80000000) == 0) {
    xpc_object_t v103 = &v228;
  }
  else {
    xpc_object_t v103 = *(stat **)&v228.st_dev;
  }
  if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    xpc_object_t v104 = &v226;
  }
  else {
    xpc_object_t v104 = (std::string *)v226.__r_.__value_.__r.__words[0];
  }
  size_t v105 = strlen((const char *)v94);
  int v106 = strncasecmp((const char *)v103, (const char *)v104, v105);
  int v107 = v106;
  if (st_gid_high < 0)
  {
    operator delete(v102);
    int v108 = v98;
    if (!v107) {
      goto LABEL_215;
    }
    goto LABEL_214;
  }
  int v108 = v98;
  if (v106) {
LABEL_214:
  }
    std::string::append(v222, " (some logs are dropped due to not enough space on device!)", 0x3BuLL);
LABEL_215:
  std::string v109 = a1[11];
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    std::string v110 = &v226;
    if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string v110 = (std::string *)v226.__r_.__value_.__r.__words[0];
    }
    v228.st_dev = 136315138;
    *(void *)&v228.st_mode = v110;
    _os_log_impl(&dword_26368A000, v109, OS_LOG_TYPE_DEFAULT, "#I Trace filter '%s'", (uint8_t *)&v228, 0xCu);
  }
  CFTypeRef cf = 0;
  CFAllocatorRef v111 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v114 = Mutable;
  if (Mutable) {
    CFTypeRef cf = Mutable;
  }
  if (SHIBYTE(v222[0].__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v228, v222[0].__r_.__value_.__l.__data_, v222[0].__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v228.st_dev = *(_OWORD *)&v222[0].__r_.__value_.__l.__data_;
    *(void *)&v228.st_uid = *((void *)&v222[0].__r_.__value_.__l + 2);
  }
  ctu::cf::insert<char const*,std::string>(v114, v191, (uint64_t)&v228, (uint64_t)v111, v113);
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(v224[2]) & 0x80000000) == 0) {
      goto LABEL_226;
    }
  }
  else if ((SHIBYTE(v224[2]) & 0x80000000) == 0)
  {
LABEL_226:
    *(_OWORD *)&v228.st_dev = *(_OWORD *)v224;
    *(void **)&v228.st_uid = v224[2];
    goto LABEL_229;
  }
  std::string::__init_copy_ctor_external((std::string *)&v228, (const std::string::value_type *)v224[0], (std::string::size_type)v224[1]);
LABEL_229:
  ctu::cf::insert<char const*,std::string>(v114, v190, (uint64_t)&v228, (uint64_t)v111, v115);
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      goto LABEL_231;
    }
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
LABEL_231:
    *(_OWORD *)&v228.st_dev = *(_OWORD *)__dst;
    *(xpc_object_t *)&v228.st_uid = __dst[2];
    goto LABEL_234;
  }
  std::string::__init_copy_ctor_external((std::string *)&v228, (const std::string::value_type *)__dst[0], (std::string::size_type)__dst[1]);
LABEL_234:
  ctu::cf::insert<char const*,std::string>(v114, (const __CFString **)*MEMORY[0x263F26218], (uint64_t)&v228, (uint64_t)v111, v116);
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(__sz[2]) & 0x80000000) == 0) {
      goto LABEL_236;
    }
  }
  else if ((SHIBYTE(__sz[2]) & 0x80000000) == 0)
  {
LABEL_236:
    *(_OWORD *)&v228.st_dev = *(_OWORD *)__sz;
    *(void *)&v228.st_uid = __sz[2];
    goto LABEL_239;
  }
  std::string::__init_copy_ctor_external((std::string *)&v228, (const std::string::value_type *)__sz[0], __sz[1]);
LABEL_239:
  ctu::cf::insert<char const*,std::string>(v114, v189, (uint64_t)&v228, (uint64_t)v111, v117);
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(v226.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_241;
    }
  }
  else if ((SHIBYTE(v226.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_241:
    *(_OWORD *)&v228.st_dev = *(_OWORD *)&v226.__r_.__value_.__l.__data_;
    *(void *)&v228.st_uid = *((void *)&v226.__r_.__value_.__l + 2);
    goto LABEL_244;
  }
  std::string::__init_copy_ctor_external((std::string *)&v228, v226.__r_.__value_.__l.__data_, v226.__r_.__value_.__l.__size_);
LABEL_244:
  ctu::cf::insert<char const*,std::string>(v114, (const __CFString **)*MEMORY[0x263F26150], (uint64_t)&v228, (uint64_t)v111, v118);
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(v223[2]) & 0x80000000) == 0) {
      goto LABEL_246;
    }
  }
  else if ((SHIBYTE(v223[2]) & 0x80000000) == 0)
  {
LABEL_246:
    *(_OWORD *)&v228.st_dev = *(_OWORD *)v223;
    *(void **)&v228.st_uid = v223[2];
    goto LABEL_249;
  }
  std::string::__init_copy_ctor_external((std::string *)&v228, (const std::string::value_type *)v223[0], (std::string::size_type)v223[1]);
LABEL_249:
  ctu::cf::insert<char const*,std::string>(v114, v187, (uint64_t)&v228, (uint64_t)v111, v119);
  if (SHIBYTE(v228.st_gid) < 0)
  {
    operator delete(*(void **)&v228.st_dev);
    if ((SHIBYTE(v222[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_251;
    }
  }
  else if ((SHIBYTE(v222[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_251:
    *(_OWORD *)&v228.st_dev = *(_OWORD *)&v222[1].__r_.__value_.__l.__data_;
    *(void *)&v228.st_uid = *((void *)&v222[1].__r_.__value_.__l + 2);
    goto LABEL_254;
  }
  std::string::__init_copy_ctor_external((std::string *)&v228, v222[1].__r_.__value_.__l.__data_, v222[1].__r_.__value_.__l.__size_);
LABEL_254:
  ctu::cf::insert<char const*,std::string>(v114, v188, (uint64_t)&v228, (uint64_t)v111, v120);
  if (SHIBYTE(v228.st_gid) < 0) {
    operator delete(*(void **)&v228.st_dev);
  }
  ctu::cf::insert<char const*,int>(v114, v186, v185, v111, v121);
  ctu::cf::insert<char const*,int>(v114, v184, v108, v111, v122);
  ctu::cf::insert<char const*,BOOL>(v114, (const __CFString **)*MEMORY[0x263F266C0], v220, (uint64_t)v111, v123);
  ctu::cf::insert<char const*,int>(v114, v183, v182, v111, v124);
  ctu::cf::insert<char const*,BOOL>(v114, (const __CFString **)key, v219, (uint64_t)v111, v125);
  xpc_object_t v126 = (const __CFString **)*MEMORY[0x263F262A0];
  xpc_object_t v127 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F262A0]);
  *(void *)&v228.st_dev = v127;
  if (v127) {
    xpc_retain(v127);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  int v128 = xpc::dyn_cast_or_default((xpc *)&v228, 0);
  ctu::cf::insert<char const*,BOOL>(v114, v126, v128, (uint64_t)v111, v129);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  uint64_t v130 = (const __CFString **)*MEMORY[0x263F262B8];
  xpc_object_t v131 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F262B8]);
  *(void *)&v228.st_dev = v131;
  if (v131) {
    xpc_retain(v131);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  int v132 = xpc::dyn_cast_or_default((xpc *)&v228, 0);
  ctu::cf::insert<char const*,BOOL>(v114, v130, v132, (uint64_t)v111, v133);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  BOOL v134 = (const __CFString **)*MEMORY[0x263F262B0];
  xpc_object_t v135 = xpc_dictionary_get_value(*v4, (const char *)*MEMORY[0x263F262B0]);
  *(void *)&v228.st_dev = v135;
  if (v135) {
    xpc_retain(v135);
  }
  else {
    *(void *)&v228.st_dev = xpc_null_create();
  }
  int v136 = xpc::dyn_cast_or_default((xpc *)&v228, 0);
  ctu::cf::insert<char const*,BOOL>(v114, v134, v136, (uint64_t)v111, v137);
  xpc_release(*(xpc_object_t *)&v228.st_dev);
  ctu::cf::insert<char const*,BOOL>(v114, (const __CFString **)__src, v221, (uint64_t)v111, v138);
  unint64_t v213 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v214 = 0xAAAAAAAAAAAAAAAALL;
  GetABMLogServer(&v211);
  abm::HelperClient::create();
  v139 = v212;
  if (v212 && !atomic_fetch_add(&v212->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v139->__on_zero_shared)(v139);
    std::__shared_weak_count::__release_weak(v139);
  }
  xpc_object_t v140 = xpc_dictionary_create(0, 0, 0);
  if (v140 || (xpc_object_t v140 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v140) == MEMORY[0x263EF8708])
    {
      xpc_retain(v140);
      xpc_object_t v141 = v140;
    }
    else
    {
      xpc_object_t v141 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v141 = xpc_null_create();
    xpc_object_t v140 = 0;
  }
  xpc_release(v140);
  xpc_object_t v210 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v142 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v143 = v142;
  if (v142)
  {
    xpc_object_t v210 = v142;
  }
  else
  {
    xpc_object_t v143 = xpc_null_create();
    xpc_object_t v210 = v143;
    if (!v143)
    {
      xpc_object_t v144 = xpc_null_create();
      xpc_object_t v143 = 0;
      goto LABEL_281;
    }
  }
  if (MEMORY[0x263E6A240](v143) == MEMORY[0x263EF8708])
  {
    xpc_retain(v143);
    goto LABEL_282;
  }
  xpc_object_t v144 = xpc_null_create();
LABEL_281:
  xpc_object_t v210 = v144;
LABEL_282:
  xpc_release(v143);
  xpc_object_t v145 = xpc_int64_create(1500);
  if (!v145) {
    xpc_object_t v145 = xpc_null_create();
  }
  xpc_dictionary_set_value(v141, (const char *)*MEMORY[0x263F20540], v145);
  xpc_object_t v146 = xpc_null_create();
  xpc_release(v145);
  xpc_release(v146);
  if (prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F25E80], v147)
    || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F268F8], v148)
    || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F25EF0], v149))
  {
    v150 = (const __CFString ***)MEMORY[0x263F20510];
    v151 = (const void *)*MEMORY[0x263F20510];
    size_t v152 = strlen((const char *)*MEMORY[0x263F20510]);
    if (v152 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    v153 = (void *)v152;
    if (v152 >= 0x17)
    {
      uint64_t v155 = (v152 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v152 | 7) != 0x17) {
        uint64_t v155 = v152 | 7;
      }
      uint64_t v156 = v155 + 1;
      v154 = operator new(v155 + 1);
      v208[1] = v153;
      int64_t v209 = v156 | 0x8000000000000000;
      v208[0] = v154;
    }
    else
    {
      HIBYTE(v209) = v152;
      v154 = v208;
      if (!v152)
      {
LABEL_295:
        *((unsigned char *)v153 + (void)v154) = 0;
        v157.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v157.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(timespec *)&v228.st_blkstd::string::size_type size = v157;
        *(timespec *)v228.st_qspare = v157;
        v228.st_birthtimespec = v157;
        *(timespec *)&v228.st_std::string::size_type size = v157;
        v228.st_mtimespec = v157;
        v228.st_ctimespec = v157;
        *(timespec *)&v228.st_uid = v157;
        v228.st_atimespec = v157;
        *(timespec *)&v228.st_dev = v157;
        if (v209 >= 0) {
          v158 = v208;
        }
        else {
          v158 = (void **)v208[0];
        }
        int v159 = stat((const char *)v158, &v228);
        int v161 = v159;
        if (SHIBYTE(v209) < 0)
        {
          operator delete(v208[0]);
          if (v161) {
            goto LABEL_300;
          }
        }
        else if (v159)
        {
LABEL_300:
          *(void *)&long long v162 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v162 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&v228.st_dev = v162;
          *(_OWORD *)&v228.st_uid = v162;
          xpc_object_t v207 = v141;
          if (v141) {
            xpc_retain(v141);
          }
          else {
            xpc_object_t v207 = xpc_null_create();
          }
          abm::HelperClient::perform();
          xpc_release(v207);
          xpc_object_t v207 = 0;
          if (!v228.st_dev) {
            ctu::cf::insert<char const*,char const*>((__CFDictionary *)cf, (const __CFString **)*MEMORY[0x263F26888], *v150, (uint64_t)v111, v163);
          }
          if (*((char *)&v228.st_rdev + 7) < 0) {
            operator delete((void *)v228.st_ino);
          }
          goto LABEL_311;
        }
        ctu::cf::insert<char const*,char const*>((__CFDictionary *)cf, (const __CFString **)*MEMORY[0x263F26888], *v150, (uint64_t)v111, v160);
        goto LABEL_311;
      }
    }
    memmove(v154, v151, (size_t)v153);
    goto LABEL_295;
  }
  v164 = a1[11];
  if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v228.st_dev) = 0;
    _os_log_impl(&dword_26368A000, v164, OS_LOG_TYPE_DEFAULT, "#I mobile BasebandServices path is disabled as baseband log is off", (uint8_t *)&v228, 2u);
  }
LABEL_311:
  v165 = (std::__shared_weak_count *)a1[16];
  *(void *)&v228.st_dev = a1[15];
  if (!v165 || (v228.st_ino = (__darwin_ino64_t)std::__shared_weak_count::lock(v165)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v166 = (const void *)*MEMORY[0x263F263F0];
  size_t v167 = strlen((const char *)*MEMORY[0x263F263F0]);
  if (v167 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v168 = (void *)v167;
  if (v167 >= 0x17)
  {
    uint64_t v171 = (v167 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v167 | 7) != 0x17) {
      uint64_t v171 = v167 | 7;
    }
    uint64_t v172 = v171 + 1;
    v169 = operator new(v171 + 1);
    v205[1] = v168;
    unint64_t v206 = v172 | 0x8000000000000000;
    v205[0] = v169;
LABEL_321:
    memmove(v169, v166, (size_t)v168);
    *((unsigned char *)v168 + (void)v169) = 0;
    CFTypeRef v170 = cf;
    if (!cf) {
      goto LABEL_324;
    }
    goto LABEL_322;
  }
  HIBYTE(v206) = v167;
  v169 = v205;
  if (v167) {
    goto LABEL_321;
  }
  LOBYTE(v205[0]) = 0;
  CFTypeRef v170 = cf;
  if (!cf) {
    goto LABEL_324;
  }
LABEL_322:
  CFTypeID v173 = CFGetTypeID(v170);
  if (v173 == CFDictionaryGetTypeID())
  {
    CFTypeRef v204 = v170;
    CFRetain(v170);
    goto LABEL_325;
  }
LABEL_324:
  CFTypeRef v204 = 0;
LABEL_325:
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_50_0;
  aBlock[4] = a1;
  long long v196 = *(_OWORD *)&v228.st_dev;
  if (v228.st_ino) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v228.st_ino + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v197 = v213;
  v198 = (std::__shared_weak_count *)v214;
  if (v214) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v214 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v199 = v141;
  if (!v141)
  {
    xpc_object_t v199 = xpc_null_create();
    CFTypeRef v200 = v170;
    if (!v170) {
      goto LABEL_334;
    }
    goto LABEL_333;
  }
  xpc_retain(v141);
  CFTypeRef v170 = cf;
  CFTypeRef v200 = cf;
  if (cf) {
LABEL_333:
  }
    CFRetain(v170);
LABEL_334:
  v174 = *a3;
  if (*a3) {
    v174 = _Block_copy(v174);
  }
  v201 = v174;
  if (SHIBYTE(v222[0].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v202, v222[0].__r_.__value_.__l.__data_, v222[0].__r_.__value_.__l.__size_);
  }
  else {
    std::string v202 = v222[0];
  }
  v203 = _Block_copy(aBlock);
  Service::broadcastEvent((uint64_t)a1, (uint64_t)v205, &v204, (const void **)&v203);
  if (v203) {
    _Block_release(v203);
  }
  if (v204) {
    CFRelease(v204);
  }
  if ((SHIBYTE(v206) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v202.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_345;
    }
LABEL_348:
    operator delete(v202.__r_.__value_.__l.__data_);
    v175 = v201;
    if (!v201) {
      goto LABEL_350;
    }
    goto LABEL_349;
  }
  operator delete(v205[0]);
  if (SHIBYTE(v202.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_348;
  }
LABEL_345:
  v175 = v201;
  if (v201) {
LABEL_349:
  }
    _Block_release(v175);
LABEL_350:
  if (v200) {
    CFRelease(v200);
  }
  xpc_release(v199);
  xpc_object_t v199 = 0;
  v176 = v198;
  if (v198 && !atomic_fetch_add(&v198->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v176->__on_zero_shared)(v176);
    std::__shared_weak_count::__release_weak(v176);
  }
  v177 = (std::__shared_weak_count *)*((void *)&v196 + 1);
  if (*((void *)&v196 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v196 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v177->__on_zero_shared)(v177);
    std::__shared_weak_count::__release_weak(v177);
  }
  st_ino = (std::__shared_weak_count *)v228.st_ino;
  if (v228.st_ino && !atomic_fetch_add((atomic_ullong *volatile)(v228.st_ino + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))st_ino->__on_zero_shared)(st_ino);
    std::__shared_weak_count::__release_weak(st_ino);
  }
  xpc_release(v210);
  xpc_release(v141);
  v179 = (std::__shared_weak_count *)v214;
  if (!v214 || atomic_fetch_add((atomic_ullong *volatile)(v214 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v180 = cf;
    if (!cf) {
      goto LABEL_365;
    }
    goto LABEL_364;
  }
  ((void (*)(std::__shared_weak_count *))v179->__on_zero_shared)(v179);
  std::__shared_weak_count::__release_weak(v179);
  CFTypeRef v180 = cf;
  if (cf) {
LABEL_364:
  }
    CFRelease(v180);
LABEL_365:
  if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v226.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
    {
LABEL_367:
      if ((SHIBYTE(v222[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_368;
      }
      goto LABEL_375;
    }
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_367;
  }
  operator delete(__dst[0]);
  if ((SHIBYTE(v222[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_368:
    if ((SHIBYTE(v222[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_369;
    }
    goto LABEL_376;
  }
LABEL_375:
  operator delete(v222[0].__r_.__value_.__l.__data_);
  if ((SHIBYTE(v222[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_369:
    if ((SHIBYTE(v223[2]) & 0x80000000) == 0) {
      goto LABEL_370;
    }
    goto LABEL_377;
  }
LABEL_376:
  operator delete(v222[1].__r_.__value_.__l.__data_);
  if ((SHIBYTE(v223[2]) & 0x80000000) == 0)
  {
LABEL_370:
    if ((SHIBYTE(v224[2]) & 0x80000000) == 0) {
      goto LABEL_371;
    }
    goto LABEL_378;
  }
LABEL_377:
  operator delete(v223[0]);
  if ((SHIBYTE(v224[2]) & 0x80000000) == 0)
  {
LABEL_371:
    if ((SHIBYTE(__sz[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_379:
    operator delete((void *)__sz[0]);
    return;
  }
LABEL_378:
  operator delete(v224[0]);
  if (SHIBYTE(__sz[2]) < 0) {
    goto LABEL_379;
  }
}

void sub_263785414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,xpc_object_t a32,uint64_t a33,void *aBlock,void *a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,xpc_object_t a43,void *a44,uint64_t a45,uint64_t a46,xpc_object_t object,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,uint64_t a56,void *__p,uint64_t a58,int a59,__int16 a60,char a61,char a62,uint64_t a63)
{
  if (a62 < 0) {
    operator delete(__p);
  }
  if (SLOBYTE(STACK[0x247]) < 0) {
    operator delete((void *)STACK[0x230]);
  }
  if (a69 < 0) {
    operator delete(a64);
  }
  if (a72 < 0) {
    operator delete(a70);
  }
  if (a74 < 0) {
    operator delete(a73);
  }
  if (a76 < 0) {
    operator delete(a75);
  }
  if (SLOBYTE(STACK[0x217]) < 0) {
    operator delete((void *)STACK[0x200]);
  }
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_40c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE48c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(const void **)(a2 + 40);
  if (v4)
  {
    std::string::size_type v5 = _Block_copy(v4);
    xpc_object_t v6 = *(void **)(a2 + 48);
    *(void *)(a1 + 40) = v5;
    *(void *)(a1 + 48) = v6;
    if (v6) {
      return xpc_retain(v6);
    }
  }
  else
  {
    xpc_object_t v6 = *(void **)(a2 + 48);
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = v6;
    if (v6) {
      return xpc_retain(v6);
    }
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_e8_40c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE48c15_ZTSN3xpc4dictE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 48));
  *(void *)(a1 + 48) = 0;
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    _Block_release(v2);
  }
}

void TraceManager::submitTraceMetric_sync(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t v3 = *(NSObject **)(a1 + 88);
  if (*(void *)(a1 + 152))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 88), OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_26368A000, v3, OS_LOG_TYPE_DEFAULT, "#I Submitting AWD of trace stats", buf, 2u);
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    uint64_t v8 = MEMORY[0x263EF8708];
    if (v7 || (xpc_object_t v7 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E6A240](v7) == v8)
      {
        xpc_retain(v7);
        xpc_object_t v9 = v7;
      }
      else
      {
        xpc_object_t v9 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v9 = xpc_null_create();
      xpc_object_t v7 = 0;
    }
    xpc_release(v7);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E6A240](v10) == v8)
      {
        xpc_retain(v10);
        xpc_object_t v11 = v10;
      }
      else
      {
        xpc_object_t v11 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v11 = xpc_null_create();
      xpc_object_t v10 = 0;
    }
    xpc_release(v10);
    if (a2[23] < 0) {
      a2 = *(const char **)a2;
    }
    xpc_object_t v12 = xpc_string_create(a2);
    if (!v12) {
      xpc_object_t v12 = xpc_null_create();
    }
    xpc_dictionary_set_value(v11, (const char *)*MEMORY[0x263F26290], v12);
    xpc_object_t v13 = xpc_null_create();
    xpc_release(v12);
    xpc_release(v13);
    if (a3[23] < 0) {
      a3 = *(const char **)a3;
    }
    xpc_object_t v14 = xpc_string_create(a3);
    if (!v14) {
      xpc_object_t v14 = xpc_null_create();
    }
    xpc_dictionary_set_value(v11, (const char *)*MEMORY[0x263F26410], v14);
    xpc_object_t v15 = xpc_null_create();
    xpc_release(v14);
    xpc_release(v15);
    xpc_object_t v16 = xpc_string_create((const char *)*MEMORY[0x263F26898]);
    if (!v16) {
      xpc_object_t v16 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x263F25E20], v16);
    xpc_object_t v17 = xpc_null_create();
    xpc_release(v16);
    xpc_release(v17);
    xpc_object_t v18 = xpc_int64_create(524539);
    if (!v18) {
      xpc_object_t v18 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x263F25ED0], v18);
    xpc_object_t v19 = xpc_null_create();
    xpc_release(v18);
    xpc_release(v19);
    if (v11)
    {
      xpc_retain(v11);
      xpc_object_t v20 = v11;
    }
    else
    {
      xpc_object_t v20 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x263F25E18], v20);
    xpc_object_t v21 = xpc_null_create();
    xpc_release(v20);
    xpc_release(v21);
    xpc_object_t v22 = (const void *)*MEMORY[0x263F261A0];
    size_t v23 = strlen((const char *)*MEMORY[0x263F261A0]);
    if (v23 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v24 = v23;
    if (v23 >= 0x17)
    {
      uint64_t v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v23 | 7) != 0x17) {
        uint64_t v26 = v23 | 7;
      }
      uint64_t v27 = v26 + 1;
      int v25 = operator new(v26 + 1);
      size_t v31 = v24;
      unint64_t v32 = v27 | 0x8000000000000000;
      *(void *)buf = v25;
    }
    else
    {
      HIBYTE(v32) = v23;
      int v25 = buf;
      if (!v23)
      {
        buf[0] = 0;
        xpc_object_t object = v9;
        if (v9)
        {
LABEL_37:
          xpc_retain(v9);
LABEL_43:
          xpc_object_t v28 = 0;
          Service::runCommand(a1, (uint64_t)buf, &object, &v28);
          xpc_release(object);
          xpc_object_t object = 0;
          if (SHIBYTE(v32) < 0) {
            operator delete(*(void **)buf);
          }
          xpc_release(v11);
          xpc_release(v9);
          return;
        }
LABEL_42:
        xpc_object_t object = xpc_null_create();
        goto LABEL_43;
      }
    }
    memmove(v25, v22, v24);
    *((unsigned char *)v25 + v24) = 0;
    xpc_object_t object = v9;
    if (v9) {
      goto LABEL_37;
    }
    goto LABEL_42;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 88), OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_26368A000, v3, OS_LOG_TYPE_ERROR, "Baseband manager is not ready yet", buf, 2u);
  }
}

void sub_263785E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  xpc_release(v17);
  xpc_release(v16);
  _Unwind_Resume(a1);
}

uint64_t ___ZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  std::string::size_type v3 = *(void *)(a1 + 64);
  std::string::size_type v20 = *(void *)(a1 + 56);
  std::string::size_type v21 = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  size_t v4 = *(void **)(a1 + 72);
  xpc_object_t object = v4;
  if (!v4)
  {
    xpc_object_t object = xpc_null_create();
    std::string::size_type v5 = *(const void **)(a1 + 80);
    size_t v23 = v2;
    size_t v24 = v5;
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  xpc_retain(v4);
  std::string::size_type v5 = *(const void **)(a1 + 80);
  size_t v23 = v2;
  size_t v24 = v5;
  if (v5) {
LABEL_7:
  }
    CFRetain(v5);
LABEL_8:
  xpc_object_t v6 = *(void **)(a1 + 88);
  if (v6) {
    xpc_object_t v6 = _Block_copy(v6);
  }
  aBlock = v6;
  if (*(char *)(a1 + 119) < 0) {
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)(a1 + 96), *(void *)(a1 + 104));
  }
  else {
    std::string v26 = *(std::string *)(a1 + 96);
  }
  xpc_object_t v7 = (std::__shared_weak_count *)v2[16];
  if (!v7 || (v8 = v2[15], (xpc_object_t v9 = std::__shared_weak_count::lock(v7)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v10 = v9;
  xpc_object_t v11 = (std::string *)operator new(0x48uLL);
  std::string::size_type v12 = v21;
  v11->__r_.__value_.__r.__words[0] = v20;
  v11->__r_.__value_.__l.__size_ = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v13 = object;
  v11->__r_.__value_.__r.__words[2] = (std::string::size_type)object;
  if (!v13)
  {
    v11->__r_.__value_.__r.__words[2] = (std::string::size_type)xpc_null_create();
    xpc_object_t v14 = v24;
    v11[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v23;
    v11[1].__r_.__value_.__l.__size_ = (std::string::size_type)v14;
    if (!v14) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  xpc_retain(v13);
  xpc_object_t v14 = v24;
  v11[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v23;
  v11[1].__r_.__value_.__l.__size_ = (std::string::size_type)v14;
  if (v14) {
LABEL_21:
  }
    CFRetain(v14);
LABEL_22:
  xpc_object_t v15 = aBlock;
  if (aBlock) {
    xpc_object_t v15 = _Block_copy(aBlock);
  }
  v11[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v15;
  xpc_object_t v16 = v11 + 2;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v16, v26.__r_.__value_.__l.__data_, v26.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)&v26.__r_.__value_.__l.__data_;
    v11[2].__r_.__value_.__r.__words[2] = v26.__r_.__value_.__r.__words[2];
  }
  xpc_object_t v17 = v2[17];
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v18 = operator new(0x18uLL);
  *xpc_object_t v18 = v11;
  v18[1] = v8;
  v18[2] = v10;
  dispatch_async_f(v17, v18, (dispatch_function_t)_ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_16collectLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb0_E3__1EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_);
  if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  return _ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev((uint64_t)&v20);
}

void sub_26378613C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, void *aBlock)
{
  xpc_object_t v17 = *(const void **)(v15 + 40);
  if (v17) {
    _Block_release(v17);
  }
  xpc_object_t v18 = *(const void **)(v15 + 32);
  if (v18) {
    CFRelease(v18);
  }
  xpc_release(*(xpc_object_t *)(v15 + 16));
  *(void *)(v15 + 16) = 0;
  xpc_object_t v19 = *(std::__shared_weak_count **)(v15 + 8);
  if (v19)
  {
    if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
      __clang_call_terminate(a1);
    }
  }
  __clang_call_terminate(a1);
}

uint64_t _ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
  {
    operator delete(*(void **)(a1 + 48));
    uint64_t v2 = *(const void **)(a1 + 40);
    if (!v2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
LABEL_5:
  }
    _Block_release(v2);
LABEL_6:
  std::string::size_type v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(void *)(a1 + 16) = 0;
  size_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  if (!v4 || atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void __copy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE72c15_ZTSN3xpc4dictE80c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE88c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE96c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  std::string::size_type v4 = *(void *)(a2 + 48);
  a1[1].__r_.__value_.__r.__words[2] = *(void *)(a2 + 40);
  a1[2].__r_.__value_.__r.__words[0] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  std::string::size_type v5 = *(void *)(a2 + 64);
  a1[2].__r_.__value_.__l.__size_ = *(void *)(a2 + 56);
  a1[2].__r_.__value_.__r.__words[2] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v6 = *(void **)(a2 + 72);
  a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
  if (!v6)
  {
    a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    xpc_object_t v7 = *(const void **)(a2 + 80);
    a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v7;
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  xpc_retain(v6);
  xpc_object_t v7 = *(const void **)(a2 + 80);
  a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v7;
  if (v7) {
LABEL_9:
  }
    CFRetain(v7);
LABEL_10:
  uint64_t v8 = *(void **)(a2 + 88);
  if (v8) {
    uint64_t v8 = _Block_copy(v8);
  }
  a1[3].__r_.__value_.__r.__words[2] = (std::string::size_type)v8;
  xpc_object_t v9 = a1 + 4;
  if (*(char *)(a2 + 119) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a2 + 96), *(void *)(a2 + 104));
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 96);
    a1[4].__r_.__value_.__r.__words[2] = *(void *)(a2 + 112);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
}

void sub_2637863E8(_Unwind_Exception *a1)
{
  xpc_object_t v7 = *(const void **)(v3 + 88);
  if (v7) {
    _Block_release(v7);
  }
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v5);
  xpc::dict::~dict(v4);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE72c15_ZTSN3xpc4dictE80c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE88c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE96c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 119) < 0)
  {
    operator delete(*(void **)(a1 + 96));
    uint64_t v2 = *(const void **)(a1 + 88);
    if (!v2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v2 = *(const void **)(a1 + 88);
  if (v2) {
LABEL_5:
  }
    _Block_release(v2);
LABEL_6:
  uint64_t v3 = *(const void **)(a1 + 80);
  if (v3) {
    CFRelease(v3);
  }
  xpc_release(*(xpc_object_t *)(a1 + 72));
  *(void *)(a1 + 72) = 0;
  std::string::size_type v4 = *(std::__shared_weak_count **)(a1 + 64);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    std::string::size_type v5 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v5) {
      return;
    }
  }
  else
  {
    std::string::size_type v5 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v5) {
      return;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void ___ZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  __p.__r_.__value_.__r.__words[0] = 0;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3)
  {
    std::string::size_type v5 = 0;
LABEL_7:
    xpc_object_t v7 = xpc_null_create();
    uint64_t v8 = *(void *)(a1 + 56);
    xpc_object_t v31 = v7;
    xpc_object_t v9 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v8 + 16))(v8, 3760250880, &v31);
    xpc_release(v31);
    xpc_release(v9);
    if (!v5 || atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
    char v6 = 1;
    goto LABEL_10;
  }
  std::string::size_type v4 = std::__shared_weak_count::lock(v3);
  std::string::size_type v5 = v4;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v4;
  if (!v4 || !*(void *)(a1 + 40)) {
    goto LABEL_7;
  }
  if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_11;
  }
  char v6 = 0;
LABEL_10:
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  if (v6) {
    return;
  }
LABEL_11:
  if (*(char *)(a1 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 64), *(void *)(a1 + 72));
    long long v10 = *(void **)(a1 + 56);
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  std::string __p = *(std::string *)(a1 + 64);
  long long v10 = *(void **)(a1 + 56);
  if (v10) {
LABEL_15:
  }
    long long v10 = _Block_copy(v10);
LABEL_16:
  aBlock = v10;
  int v26 = *(_DWORD *)(a1 + 112);
  xpc_object_t v11 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 40);
  xpc_object_t v28 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  if (*(char *)(a1 + 111) < 0) {
    std::string::__init_copy_ctor_external(&v29, *(const std::string::value_type **)(a1 + 88), *(void *)(a1 + 96));
  }
  else {
    std::string v29 = *(std::string *)(a1 + 88);
  }
  char v30 = *(unsigned char *)(a1 + 116);
  std::string::size_type v12 = (std::__shared_weak_count *)v2[16];
  if (!v12 || (uint64_t v13 = v2[15], (v14 = std::__shared_weak_count::lock(v12)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v15 = v14;
  xpc_object_t v16 = (char *)operator new(0x60uLL);
  xpc_object_t v17 = v16;
  *(void *)xpc_object_t v16 = v2;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external((std::string *)(v16 + 8), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    *(std::string *)(v16 + 8) = __p;
  }
  xpc_object_t v18 = aBlock;
  if (aBlock) {
    xpc_object_t v18 = _Block_copy(aBlock);
  }
  *((void *)v17 + 4) = v18;
  *((_DWORD *)v17 + 10) = v26;
  xpc_object_t v19 = v28;
  *((void *)v17 + 6) = v27;
  *((void *)v17 + 7) = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  std::string::size_type v20 = (std::string *)(v17 + 64);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v20, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v20->__r_.__value_.__l.__data_ = *(_OWORD *)&v29.__r_.__value_.__l.__data_;
    *((void *)v17 + 10) = *((void *)&v29.__r_.__value_.__l + 2);
  }
  v17[88] = v30;
  std::string::size_type v21 = v2[17];
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v22 = operator new(0x18uLL);
  *xpc_object_t v22 = v17;
  v22[1] = v13;
  v22[2] = v15;
  dispatch_async_f(v21, v22, (dispatch_function_t)_ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_24collectBasebandLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb1_E3__2EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_);
  if (atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_35;
    }
LABEL_43:
    operator delete(v29.__r_.__value_.__l.__data_);
    size_t v23 = v28;
    if (!v28) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
  std::__shared_weak_count::__release_weak(v15);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_43;
  }
LABEL_35:
  size_t v23 = v28;
  if (v28) {
LABEL_36:
  }
    std::__shared_weak_count::__release_weak(v23);
LABEL_37:
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_263786894(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *aBlock, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  size_t v23 = *(std::__shared_weak_count **)(v20 + 56);
  if (v23) {
    std::__shared_weak_count::__release_weak(v23);
  }
  size_t v24 = *(const void **)(v20 + 32);
  if (v24) {
    _Block_release(v24);
  }
  if (*(char *)(v20 + 31) < 0)
  {
    operator delete(*v21);
    __clang_call_terminate(a1);
  }
  __clang_call_terminate(a1);
}

void __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  std::string::size_type v5 = *(void **)(a2 + 56);
  if (v5) {
    std::string::size_type v5 = _Block_copy(v5);
  }
  *(void *)(a1 + 56) = v5;
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 64), *(const std::string::value_type **)(a2 + 64), *(void *)(a2 + 72));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 64);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = v6;
  }
  xpc_object_t v7 = (std::string *)(a1 + 88);
  if (*(char *)(a2 + 111) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 88), *(void *)(a2 + 96));
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 88);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
}

void sub_263786A18(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  uint64_t v4 = *(const void **)(v1 + 56);
  if (v4) {
    _Block_release(v4);
  }
  std::string::size_type v5 = *(std::__shared_weak_count **)(v1 + 48);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if ((*(char *)(a1 + 111) & 0x80000000) == 0)
  {
    if ((*(char *)(a1 + 87) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    operator delete(*(void **)(a1 + 64));
    uint64_t v2 = *(const void **)(a1 + 56);
    if (!v2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 87) < 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2) {
LABEL_7:
  }
    _Block_release(v2);
LABEL_8:
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void TraceManager::start(void *a1, dispatch_object_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[16];
  if (!v4 || (v5 = a1[15], (long long v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v7 = v6;
  long long v8 = operator new(0x10uLL);
  void *v8 = v3;
  v8[1] = a1;
  xpc_object_t v9 = a1[17];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v10 = operator new(0x18uLL);
  *long long v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::start(dispatch::group_session)::$_0>(TraceManager::start(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::start(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::start(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void TraceManager::finishInitialization_sync(std::__shared_weak_count **this)
{
  uint64_t v2 = (const char *)((uint64_t (*)(std::__shared_weak_count **))(*this)->__shared_weak_owners_)(this);
  size_t v3 = strlen(v2);
  if (v3 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    unint64_t v60 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v60) = v3;
    uint64_t v5 = __dst;
    if (!v3) {
      goto LABEL_9;
    }
  }
  memmove(v5, v2, (size_t)v4);
LABEL_9:
  *((unsigned char *)v4 + (void)v5) = 0;
  uint64_t v58 = 0;
  AppleBasebandManager::create();
  long long v8 = v61;
  long long v61 = 0uLL;
  xpc_object_t v9 = this[20];
  *(_OWORD *)(this + 19) = v8;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  long long v10 = (std::__shared_weak_count *)*((void *)&v61 + 1);
  if (!*((void *)&v61 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v61 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    xpc_object_t v11 = v58;
    if (!v58) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  xpc_object_t v11 = v58;
  if (v58) {
LABEL_15:
  }
    CFRelease(v11);
LABEL_16:
  if (SHIBYTE(v60) < 0) {
    operator delete(__dst[0]);
  }
  std::string::size_type v12 = this[16];
  if (!v12 || (uint64_t v13 = this[15], (v14 = std::__shared_weak_count::lock(v12)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v15 = v14;
  atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v15);
  }
  xpc_object_t v16 = (const void *)*MEMORY[0x263F26650];
  size_t v17 = strlen((const char *)*MEMORY[0x263F26650]);
  if (v17 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  xpc_object_t v18 = (void *)v17;
  if (v17 >= 0x17)
  {
    uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v20 = v17 | 7;
    }
    uint64_t v21 = v20 + 1;
    xpc_object_t v19 = (void **)operator new(v20 + 1);
    v56[1] = v18;
    unint64_t v57 = v21 | 0x8000000000000000;
    v56[0] = v19;
    goto LABEL_29;
  }
  HIBYTE(v57) = v17;
  xpc_object_t v19 = v56;
  if (v17) {
LABEL_29:
  }
    memmove(v19, v16, (size_t)v18);
  *((unsigned char *)v18 + (void)v19) = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_82;
  aBlock[4] = this;
  void aBlock[5] = v13;
  xpc_object_t v53 = v15;
  atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v22 = _Block_copy(aBlock);
  size_t v23 = this[17];
  if (v23) {
    dispatch_retain((dispatch_object_t)this[17]);
  }
  size_t v54 = v22;
  dispatch_object_t v55 = v23;
  AppleBasebandManager::setEventHandler();
  if (v55) {
    dispatch_release(v55);
  }
  if (v54) {
    _Block_release(v54);
  }
  if (SHIBYTE(v57) < 0) {
    operator delete(v56[0]);
  }
  size_t v24 = (const void *)*MEMORY[0x263F263F0];
  size_t v25 = strlen((const char *)*MEMORY[0x263F263F0]);
  if (v25 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  int v26 = (void *)v25;
  if (v25 >= 0x17)
  {
    uint64_t v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17) {
      uint64_t v28 = v25 | 7;
    }
    uint64_t v29 = v28 + 1;
    uint64_t v27 = operator new(v28 + 1);
    __p[1] = v26;
    unint64_t v51 = v29 | 0x8000000000000000;
    __p[0] = v27;
    goto LABEL_45;
  }
  HIBYTE(v51) = v25;
  uint64_t v27 = __p;
  if (v25) {
LABEL_45:
  }
    memmove(v27, v24, (size_t)v26);
  *((unsigned char *)v26 + (void)v27) = 0;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 1174405120;
  v46[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_83;
  v46[3] = &__block_descriptor_tmp_88_0;
  v46[4] = this;
  v46[5] = v13;
  uint64_t v47 = v15;
  atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  char v30 = _Block_copy(v46);
  xpc_object_t v31 = this[17];
  if (v31) {
    dispatch_retain((dispatch_object_t)this[17]);
  }
  uint64_t v48 = v30;
  dispatch_object_t object = v31;
  AppleBasebandManager::setEventHandler();
  if (object) {
    dispatch_release(object);
  }
  if (v48) {
    _Block_release(v48);
  }
  if (SHIBYTE(v51) < 0) {
    operator delete(__p[0]);
  }
  unint64_t v32 = (const void *)*MEMORY[0x263F263F8];
  size_t v33 = strlen((const char *)*MEMORY[0x263F263F8]);
  if (v33 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v34 = (void *)v33;
  if (v33 >= 0x17)
  {
    uint64_t v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17) {
      uint64_t v36 = v33 | 7;
    }
    uint64_t v37 = v36 + 1;
    uint64_t v35 = operator new(v36 + 1);
    v44[1] = v34;
    unint64_t v45 = v37 | 0x8000000000000000;
    v44[0] = v35;
    goto LABEL_61;
  }
  HIBYTE(v45) = v33;
  uint64_t v35 = v44;
  if (v33) {
LABEL_61:
  }
    memmove(v35, v32, (size_t)v34);
  *((unsigned char *)v34 + (void)v35) = 0;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 1174405120;
  v40[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_89;
  v40[3] = &__block_descriptor_tmp_93_0;
  v40[4] = this;
  v40[5] = v13;
  uint64_t v41 = v15;
  atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  int v38 = _Block_copy(v40);
  long long v39 = this[17];
  if (v39) {
    dispatch_retain((dispatch_object_t)this[17]);
  }
  uint64_t v42 = v38;
  dispatch_object_t v43 = v39;
  AppleBasebandManager::setEventHandler();
  if (v43) {
    dispatch_release(v43);
  }
  if (v42) {
    _Block_release(v42);
  }
  if (SHIBYTE(v45) < 0) {
    operator delete(v44[0]);
  }
  AppleBasebandManager::eventsOn((AppleBasebandManager *)this[19]);
  if (v41) {
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v47) {
    std::__shared_weak_count::__release_weak(v47);
  }
  if (v53) {
    std::__shared_weak_count::__release_weak(v53);
  }
  std::__shared_weak_count::__release_weak(v15);
}

void sub_263787218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30,char a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,std::__shared_weak_count *a45)
{
  if (a15) {
    std::__shared_weak_count::__release_weak(a15);
  }
  if (a30) {
    std::__shared_weak_count::__release_weak(a30);
  }
  if (a45) {
    std::__shared_weak_count::__release_weak(a45);
  }
  std::__shared_weak_count::__release_weak(v45);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v286 = *MEMORY[0x263EF8340];
  size_t v3 = (std::__shared_weak_count *)a1[6];
  if (!v3) {
    return;
  }
  uint64_t v5 = a1[4];
  uint64_t v6 = std::__shared_weak_count::lock(v3);
  v283 = v6;
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = a1[5];
  uint64_t v282 = v8;
  if (!v8)
  {
LABEL_445:
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return;
  }
  CFDictionaryRef v281 = (const __CFDictionary *)0xAAAAAAAAAAAAAAAALL;
  abm::client::Event::getData((uint64_t *)&v281, *(abm::client::Event **)a2);
  CFDictionaryRef v9 = v281;
  if (v281) {
    long long v10 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    long long v10 = 0;
  }
  if (v10)
  {
    v280[0] = 0xAAAAAAAAAAAAAAAALL;
    v280[1] = 0xAAAAAAAAAAAAAAAALL;
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v280, v281);
    memset(v279, 170, sizeof(v279));
    xpc_object_t v11 = (const char *)*MEMORY[0x263F26140];
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&buf, (const char *)*MEMORY[0x263F26140]);
    ctu::cf::map_adapter::getString();
    MEMORY[0x263E68C90](&buf);
    std::string::size_type v12 = (void **)(v5 + 192);
    if ((unsigned char *)(v5 + 192) != v279)
    {
      if (*(char *)(v5 + 215) < 0)
      {
        if (v279[23] >= 0) {
          uint64_t v13 = v279;
        }
        else {
          uint64_t v13 = *(unsigned char **)v279;
        }
        if (v279[23] >= 0) {
          size_t v14 = v279[23];
        }
        else {
          size_t v14 = *(void *)&v279[8];
        }
        std::string::__assign_no_alias<false>(v12, v13, v14);
      }
      else if ((v279[23] & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v12, *(void **)v279, *(size_t *)&v279[8]);
      }
      else
      {
        *(_OWORD *)std::string::size_type v12 = *(_OWORD *)v279;
        *(void *)(v5 + 208) = *(void *)&v279[16];
      }
    }
    uint64_t v15 = *(NSObject **)(v5 + 88);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v16 = v279;
      if (v279[23] < 0) {
        xpc_object_t v16 = *(unsigned char **)v279;
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
      _os_log_impl(&dword_26368A000, v15, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&buf, 0xCu);
    }
    int v17 = v279[23];
    if (v279[23] >= 0) {
      size_t v18 = v279[23];
    }
    else {
      size_t v18 = *(void *)&v279[8];
    }
    if (v18 != strlen((const char *)*MEMORY[0x263F26508])
      || (v279[23] >= 0 ? (xpc_object_t v19 = v279) : (xpc_object_t v19 = *(unsigned char **)v279), memcmp(v19, (const void *)*MEMORY[0x263F26508], v18)))
    {
      uint64_t v20 = (const char *)*MEMORY[0x263F26308];
      if (v18 == strlen((const char *)*MEMORY[0x263F26308]))
      {
        uint64_t v21 = v17 >= 0 ? v279 : *(unsigned char **)v279;
        if (!memcmp(v21, v20, v18))
        {
          memset(&buf, 170, 16);
          v242[0] = MEMORY[0x263EF8330];
          v242[1] = 1174405120;
          v242[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_59;
          v242[3] = &__block_descriptor_tmp_62_0;
          v242[4] = v5;
          v242[5] = v8;
          v243 = v7;
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
          long long v39 = *(std::__shared_weak_count **)(a2 + 8);
          v244 = *(abm::client::Event **)a2;
          v245 = v39;
          if (v39) {
            atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          size_t v40 = _Block_copy(v242);
          std::string::size_type v41 = *(void *)(v5 + 136);
          if (v41) {
            dispatch_retain(*(dispatch_object_t *)(v5 + 136));
          }
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v40;
          buf.__r_.__value_.__l.__size_ = v41;
          xpc_object_t v42 = xpc_dictionary_create(0, 0, 0);
          if (v42 || (xpc_object_t v42 = xpc_null_create()) != 0)
          {
            if (MEMORY[0x263E6A240](v42) == MEMORY[0x263EF8708])
            {
              xpc_retain(v42);
              xpc_object_t v43 = v42;
            }
            else
            {
              xpc_object_t v43 = xpc_null_create();
            }
          }
          else
          {
            xpc_object_t v43 = xpc_null_create();
            xpc_object_t v42 = 0;
          }
          xpc_release(v42);
          xpc_object_t v75 = xpc_string_create(v20);
          if (!v75) {
            xpc_object_t v75 = xpc_null_create();
          }
          xpc_dictionary_set_value(v43, v11, v75);
          xpc_object_t v76 = xpc_null_create();
          xpc_release(v75);
          xpc_release(v76);
          xpc_object_t v241 = v43;
          if (v43) {
            xpc_retain(v43);
          }
          else {
            xpc_object_t v241 = xpc_null_create();
          }
          v240 = 0;
          if (buf.__r_.__value_.__r.__words[0]) {
            uint64_t v77 = _Block_copy(buf.__r_.__value_.__l.__data_);
          }
          else {
            uint64_t v77 = 0;
          }
          uint64_t v78 = *MEMORY[0x263F20628];
          std::string::size_type size = buf.__r_.__value_.__l.__size_;
          v239[0] = v77;
          v239[1] = (void *)buf.__r_.__value_.__l.__size_;
          if (buf.__r_.__value_.__l.__size_) {
            dispatch_retain((dispatch_object_t)buf.__r_.__value_.__l.__size_);
          }
          TraceManager::runOnHelper_sync((void *)v5, (const char *)9, v78, 0x1388u, 0, &v241, &v240, v239);
          if (size) {
            dispatch_release(size);
          }
          if (v77) {
            _Block_release(v77);
          }
          xpc_release(v241);
          xpc_object_t v241 = 0;
          xpc_release(v43);
          if (buf.__r_.__value_.__l.__size_) {
            dispatch_release((dispatch_object_t)buf.__r_.__value_.__l.__size_);
          }
          if (buf.__r_.__value_.__r.__words[0]) {
            _Block_release(buf.__r_.__value_.__l.__data_);
          }
          int v80 = v245;
          if (v245 && !atomic_fetch_add(&v245->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
            std::__shared_weak_count::__release_weak(v80);
          }
          size_t v81 = v243;
          if (!v243) {
            goto LABEL_439;
          }
LABEL_250:
          if (!atomic_fetch_add(&v81->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
            std::__shared_weak_count::__release_weak(v81);
          }
          goto LABEL_439;
        }
      }
      xpc_object_t v22 = (const void *)*MEMORY[0x263F263E8];
      if (v18 != strlen((const char *)*MEMORY[0x263F263E8])
        || (v17 >= 0 ? (size_t v23 = v279) : (size_t v23 = *(unsigned char **)v279), memcmp(v23, v22, v18)))
      {
        if (v18 == strlen((const char *)*MEMORY[0x263F26170]))
        {
          size_t v24 = v17 >= 0 ? v279 : *(unsigned char **)v279;
          if (!memcmp(v24, (const void *)*MEMORY[0x263F26170], v18))
          {
            v278[0] = (void *)0xAAAAAAAAAAAAAAAALL;
            v278[1] = (void *)0xAAAAAAAAAAAAAAAALL;
            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 1174405120;
            aBlock[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_71;
            aBlock[3] = &__block_descriptor_tmp_74_0;
            aBlock[4] = v5;
            v225[0] = v8;
            v225[1] = v7;
            atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
            uint64_t v25 = *(void *)(a2 + 8);
            v226[0] = *(void *)a2;
            v226[1] = v25;
            if (v25) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v25 + 8), 1uLL, memory_order_relaxed);
            }
            int v26 = _Block_copy(aBlock);
            uint64_t v27 = *(void **)(v5 + 136);
            if (v27) {
              dispatch_retain(*(dispatch_object_t *)(v5 + 136));
            }
            v278[0] = v26;
            v278[1] = v27;
            LODWORD(v277.__r_.__value_.__l.__data_) = -1431655766;
            uint64_t v28 = (char *)std::string::basic_string[abi:ne180100]<0>(&buf, (char *)*MEMORY[0x263F25E28]);
            prop::bbtrace::get<diag::config::Mode>(v28, (int *)&v277);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
            LODWORD(__dst[0]) = -1431655766;
            uint64_t v29 = (char *)std::string::basic_string[abi:ne180100]<0>(&buf, (char *)*MEMORY[0x263F25FE0]);
            prop::bbtrace::get<abm::traceOwnership>(v29, (int *)__dst);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
            if (LODWORD(v277.__r_.__value_.__l.__data_) == 4 && LODWORD(__dst[0]) == 1)
            {
              char v30 = *(NSObject **)(v5 + 88);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                _os_log_impl(&dword_26368A000, v30, OS_LOG_TYPE_DEFAULT, "#N Baseband is dead while Cellular Logging is running. Cellular Logging will be stopped.", (uint8_t *)&buf, 2u);
              }
              v222 = 0;
              xpc_object_t object = xpc_null_create();
              v219[0] = MEMORY[0x263EF8330];
              v219[1] = 1174405120;
              v219[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_75;
              v219[3] = &__block_descriptor_tmp_78;
              v219[4] = v5;
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v220, (uint64_t)v278);
              xpc_object_t v31 = _Block_copy(v219);
              uint64_t v32 = *MEMORY[0x263F206A8];
              size_t v33 = *(void **)(v5 + 136);
              if (v33) {
                dispatch_retain(*(dispatch_object_t *)(v5 + 136));
              }
              v221[0] = v31;
              v221[1] = v33;
              TraceManager::runOnHelper_sync((void *)v5, (const char *)0xA, v32, 0x1388u, 1, &object, &v222, v221);
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v221);
              xpc_release(object);
              xpc_object_t object = 0;
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v220);
            }
            else
            {
              xpc_object_t v62 = xpc_null_create();
              uint64_t v63 = *MEMORY[0x263F205C8];
              v217 = 0;
              xpc_object_t v218 = v62;
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v216, (uint64_t)v278);
              TraceManager::runOnHelper_sync((void *)v5, (const char *)9, v63, 0x7D0u, 0, &v218, &v217, v216);
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v216);
              xpc_release(v218);
              xpc_object_t v218 = 0;
            }
            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v278);
            std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v226);
            std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v225);
          }
        }
LABEL_439:
        if ((v279[23] & 0x80000000) != 0) {
          operator delete(*(void **)v279);
        }
        MEMORY[0x263E68CD0](v280);
        CFDictionaryRef v9 = v281;
        goto LABEL_442;
      }
      TraceManager::updateBasebandFWInfo((TraceManager *)v5);
      v277.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
      v277.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      v235[0] = MEMORY[0x263EF8330];
      v235[1] = 1174405120;
      v235[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_63;
      v235[3] = &__block_descriptor_tmp_66_0;
      v235[4] = v5;
      v235[5] = v8;
      v236 = v7;
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v44 = *(std::__shared_weak_count **)(a2 + 8);
      v237 = *(abm::client::Event **)a2;
      v238 = v44;
      if (v44) {
        atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v45 = _Block_copy(v235);
      std::string::size_type v46 = *(void *)(v5 + 136);
      if (v46) {
        dispatch_retain(*(dispatch_object_t *)(v5 + 136));
      }
      v277.__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
      v277.__r_.__value_.__l.__size_ = v46;
      xpc_object_t v47 = xpc_dictionary_create(0, 0, 0);
      if (v47 || (xpc_object_t v47 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6A240](v47) == MEMORY[0x263EF8708])
        {
          xpc_retain(v47);
          xpc_object_t v48 = v47;
        }
        else
        {
          xpc_object_t v48 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v48 = xpc_null_create();
        xpc_object_t v47 = 0;
      }
      xpc_release(v47);
      xpc_object_t v99 = xpc_string_create((const char *)v22);
      if (!v99) {
        xpc_object_t v99 = xpc_null_create();
      }
      xpc_dictionary_set_value(v48, v11, v99);
      xpc_object_t v100 = xpc_null_create();
      xpc_release(v99);
      xpc_release(v100);
      v101 = (const void *)*MEMORY[0x263F25E28];
      size_t v102 = strlen((const char *)*MEMORY[0x263F25E28]);
      if (v102 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      xpc_object_t v103 = (void *)v102;
      if (v102 >= 0x17)
      {
        uint64_t v105 = (v102 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v102 | 7) != 0x17) {
          uint64_t v105 = v102 | 7;
        }
        uint64_t v106 = v105 + 1;
        xpc_object_t v104 = (void **)operator new(v105 + 1);
        v278[1] = v103;
        v278[2] = (void *)(v106 | 0x8000000000000000);
        v278[0] = v104;
      }
      else
      {
        HIBYTE(v278[2]) = v102;
        xpc_object_t v104 = v278;
        if (!v102)
        {
LABEL_209:
          *((unsigned char *)v103 + (void)v104) = 0;
          memset(&buf, 0, sizeof(buf));
          int v107 = -1431655766;
          int v108 = -1431655766;
          if (prop::bbtrace::get((char *)v278, (uint64_t)&buf))
          {
            LODWORD(__dst[0]) = -1431655766;
            if (util::convert<int>(&buf, __dst, 0)) {
              int v108 = (int)__dst[0];
            }
            else {
              int v108 = -1431655766;
            }
          }
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v278[2]) < 0) {
            operator delete(v278[0]);
          }
          std::string v109 = (const void *)*MEMORY[0x263F25FE0];
          size_t v110 = strlen((const char *)*MEMORY[0x263F25FE0]);
          if (v110 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          CFAllocatorRef v111 = (void *)v110;
          if (v110 >= 0x17)
          {
            uint64_t v113 = (v110 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v110 | 7) != 0x17) {
              uint64_t v113 = v110 | 7;
            }
            uint64_t v114 = v113 + 1;
            uint64_t v112 = (void **)operator new(v113 + 1);
            v278[1] = v111;
            v278[2] = (void *)(v114 | 0x8000000000000000);
            v278[0] = v112;
          }
          else
          {
            HIBYTE(v278[2]) = v110;
            uint64_t v112 = v278;
            if (!v110)
            {
LABEL_225:
              *((unsigned char *)v111 + (void)v112) = 0;
              memset(&buf, 0, sizeof(buf));
              if (prop::bbtrace::get((char *)v278, (uint64_t)&buf))
              {
                LODWORD(__dst[0]) = -1431655766;
                if (util::convert<int>(&buf, __dst, 0)) {
                  int v107 = (int)__dst[0];
                }
                else {
                  int v107 = -1431655766;
                }
              }
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(buf.__r_.__value_.__l.__data_);
                if ((SHIBYTE(v278[2]) & 0x80000000) == 0)
                {
LABEL_231:
                  CFAllocatorRef v115 = (uint64_t *)MEMORY[0x263F205D8];
                  if (v108 != 4) {
                    goto LABEL_241;
                  }
LABEL_235:
                  if (v107 == 1)
                  {
                    CFAllocatorRef v116 = *(NSObject **)(v5 + 88);
                    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                    {
                      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                      _os_log_impl(&dword_26368A000, v116, OS_LOG_TYPE_DEFAULT, "#N Resume notification will be sent to cellular logging after all traces are started.", (uint8_t *)&buf, 2u);
                    }
                    v233 = 0;
                    xpc_object_t v234 = xpc_null_create();
                    v230[0] = MEMORY[0x263EF8330];
                    v230[1] = 1174405120;
                    v230[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_67;
                    v230[3] = &__block_descriptor_tmp_70;
                    v230[4] = v5;
                    dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v231, (uint64_t)&v277);
                    CFAllocatorRef v117 = _Block_copy(v230);
                    uint64_t v118 = *v115;
                    CFAllocatorRef v119 = *(void **)(v5 + 136);
                    if (v119) {
                      dispatch_retain(*(dispatch_object_t *)(v5 + 136));
                    }
                    v232[0] = v117;
                    v232[1] = v119;
                    TraceManager::runOnHelper_sync((void *)v5, (const char *)9, v118, 0x1388u, 0, &v234, &v233, v232);
                    dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v232);
                    xpc_release(v234);
                    xpc_object_t v234 = 0;
                    dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v231);
LABEL_242:
                    TraceManager::setupDumpLogsIndication_sync((NSObject **)v5);
                    xpc_release(v48);
                    if (v277.__r_.__value_.__l.__size_) {
                      dispatch_release((dispatch_object_t)v277.__r_.__value_.__l.__size_);
                    }
                    if (v277.__r_.__value_.__r.__words[0]) {
                      _Block_release(v277.__r_.__value_.__l.__data_);
                    }
                    CFAllocatorRef v121 = v238;
                    if (v238 && !atomic_fetch_add(&v238->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v121->__on_zero_shared)(v121);
                      std::__shared_weak_count::__release_weak(v121);
                    }
                    size_t v81 = v236;
                    if (!v236) {
                      goto LABEL_439;
                    }
                    goto LABEL_250;
                  }
LABEL_241:
                  uint64_t v120 = *v115;
                  xpc::dict::dict((xpc::dict *)&v229, v48);
                  stat v228 = 0;
                  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v227, (uint64_t)&v277);
                  TraceManager::runOnHelper_sync((void *)v5, (const char *)9, v120, 0x1388u, 0, &v229, &v228, v227);
                  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v227);
                  xpc_release(v229);
                  xpc_object_t v229 = 0;
                  goto LABEL_242;
                }
              }
              else if ((SHIBYTE(v278[2]) & 0x80000000) == 0)
              {
                goto LABEL_231;
              }
              operator delete(v278[0]);
              CFAllocatorRef v115 = (uint64_t *)MEMORY[0x263F205D8];
              if (v108 != 4) {
                goto LABEL_241;
              }
              goto LABEL_235;
            }
          }
          memmove(v112, v109, (size_t)v111);
          goto LABEL_225;
        }
      }
      memmove(v104, v101, (size_t)v103);
      goto LABEL_209;
    }
    memset(v278, 170, sizeof(v278));
    uint64_t v34 = (const char *)*MEMORY[0x263F26148];
    memset(&buf, 0, sizeof(buf));
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v277, v34);
    ctu::cf::map_adapter::getString();
    MEMORY[0x263E68C90](&v277);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    memset(&v277, 170, sizeof(v277));
    uint64_t v35 = (const std::string::value_type *)*MEMORY[0x263F25E58];
    size_t v36 = strlen((const char *)*MEMORY[0x263F25E58]);
    if (v36 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v37 = v36;
    if (v36 >= 0x17)
    {
      uint64_t v49 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v36 | 7) != 0x17) {
        uint64_t v49 = v36 | 7;
      }
      uint64_t v50 = v49 + 1;
      p_std::string buf = (std::string *)operator new(v49 + 1);
      buf.__r_.__value_.__l.__size_ = v37;
      buf.__r_.__value_.__r.__words[2] = v50 | 0x8000000000000000;
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)p_buf;
    }
    else
    {
      *((unsigned char *)&buf.__r_.__value_.__s + 23) = v36;
      p_std::string buf = &buf;
      if (!v36)
      {
LABEL_88:
        unint64_t v51 = (const char *)*MEMORY[0x263F262A8];
        p_buf->__r_.__value_.__s.__data_[v37] = 0;
        ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)__dst, v51);
        ctu::cf::map_adapter::getString();
        MEMORY[0x263E68C90](__dst);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
        CFAllocatorRef v52 = (const char *)*MEMORY[0x263F25E10];
        ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&buf, (const char *)*MEMORY[0x263F25E10]);
        int Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v280, (const __CFString *)buf.__r_.__value_.__l.__data_);
        MEMORY[0x263E68C90](&buf);
        std::string::size_type v53 = HIBYTE(v277.__r_.__value_.__r.__words[2]);
        if ((v277.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type v53 = v277.__r_.__value_.__l.__size_;
        }
        if (!v53) {
          std::string::__assign_external(&v277, v35);
        }
        size_t v54 = (const void *)*MEMORY[0x263F26178];
        int v55 = SHIBYTE(v278[2]);
        if (SHIBYTE(v278[2]) >= 0) {
          size_t v56 = HIBYTE(v278[2]);
        }
        else {
          size_t v56 = (size_t)v278[1];
        }
        if (v56 != strlen((const char *)*MEMORY[0x263F26178])
          || (SHIBYTE(v278[2]) >= 0 ? (unint64_t v57 = v278) : (unint64_t v57 = (void **)v278[0]), memcmp(v57, v54, v56)))
        {
          uint64_t v58 = (const void *)*MEMORY[0x263F26180];
          if (v56 != strlen((const char *)*MEMORY[0x263F26180])
            || (v55 >= 0 ? (uint64_t v59 = v278) : (uint64_t v59 = (void **)v278[0]), memcmp(v59, v58, v56)))
          {
            unint64_t v60 = *(NSObject **)(v5 + 88);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              long long v61 = (void **)v278[0];
              if (v55 >= 0) {
                long long v61 = v278;
              }
              LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v61;
              _os_log_impl(&dword_26368A000, v60, OS_LOG_TYPE_DEFAULT, "#I Invalid reset type [%s]", (uint8_t *)&buf, 0xCu);
            }
LABEL_435:
            if (SHIBYTE(v277.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v277.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v278[2]) < 0) {
              operator delete(v278[0]);
            }
            goto LABEL_439;
          }
          dispatch_object_t v271 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
          std::string __p = (void *)0xAAAAAAAAAAAAAAAALL;
          v257[0] = MEMORY[0x263EF8330];
          v257[1] = 1174405120;
          v257[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_55;
          v257[3] = &__block_descriptor_tmp_56_2;
          v257[4] = v5;
          v257[5] = v282;
          v258 = v283;
          if (v283) {
            atomic_fetch_add_explicit(&v283->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v68 = *(std::__shared_weak_count **)(a2 + 8);
          v259 = *(abm::client::Event **)a2;
          v260 = v68;
          if (v68) {
            atomic_fetch_add_explicit(&v68->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v69 = _Block_copy(v257);
          size_t v70 = *(NSObject **)(v5 + 136);
          if (v70) {
            dispatch_retain(*(dispatch_object_t *)(v5 + 136));
          }
          std::string __p = v69;
          dispatch_object_t v271 = v70;
          char v71 = (const void *)*MEMORY[0x263F25E28];
          size_t v72 = strlen((const char *)*MEMORY[0x263F25E28]);
          if (v72 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          uint64_t v73 = (void *)v72;
          if (v72 >= 0x17)
          {
            uint64_t v122 = (v72 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v72 | 7) != 0x17) {
              uint64_t v122 = v72 | 7;
            }
            uint64_t v123 = v122 + 1;
            uint64_t v74 = (void **)operator new(v122 + 1);
            xpc_object_t __dst[2] = (void *)(v123 | 0x8000000000000000);
            __dst[0] = v74;
            __dst[1] = v73;
          }
          else
          {
            HIBYTE(__dst[2]) = v72;
            uint64_t v74 = __dst;
            if (!v72)
            {
LABEL_256:
              *((unsigned char *)v73 + (void)v74) = 0;
              memset(&buf, 0, sizeof(buf));
              int v124 = -1431655766;
              if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
              {
                LODWORD(v284) = -1431655766;
                if (util::convert<int>(&buf, &v284, 0)) {
                  int v124 = v284;
                }
                else {
                  int v124 = -1431655766;
                }
              }
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(__dst[2]) < 0) {
                operator delete(__dst[0]);
              }
              CFAllocatorRef v125 = (const void *)*MEMORY[0x263F25FE0];
              size_t v126 = strlen((const char *)*MEMORY[0x263F25FE0]);
              if (v126 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              xpc_object_t v127 = (void *)v126;
              if (v126 >= 0x17)
              {
                uint64_t v129 = (v126 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v126 | 7) != 0x17) {
                  uint64_t v129 = v126 | 7;
                }
                uint64_t v130 = v129 + 1;
                int v128 = (void **)operator new(v129 + 1);
                xpc_object_t __dst[2] = (void *)(v130 | 0x8000000000000000);
                __dst[0] = v128;
                __dst[1] = v127;
              }
              else
              {
                HIBYTE(__dst[2]) = v126;
                int v128 = __dst;
                if (!v126)
                {
LABEL_272:
                  *((unsigned char *)v127 + (void)v128) = 0;
                  memset(&buf, 0, sizeof(buf));
                  int v131 = -1431655766;
                  if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                  {
                    LODWORD(v284) = -1431655766;
                    if (util::convert<int>(&buf, &v284, 0)) {
                      int v131 = v284;
                    }
                    else {
                      int v131 = -1431655766;
                    }
                  }
                  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(buf.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(__dst[2]) < 0) {
                    operator delete(__dst[0]);
                  }
                  int v132 = (const void *)*MEMORY[0x263F29D78];
                  size_t v133 = strlen((const char *)*MEMORY[0x263F29D78]);
                  if (v133 > 0x7FFFFFFFFFFFFFF7) {
                    std::string::__throw_length_error[abi:ne180100]();
                  }
                  BOOL v134 = (void *)v133;
                  if (v133 >= 0x17)
                  {
                    uint64_t v136 = (v133 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v133 | 7) != 0x17) {
                      uint64_t v136 = v133 | 7;
                    }
                    uint64_t v137 = v136 + 1;
                    xpc_object_t v135 = (void **)operator new(v136 + 1);
                    xpc_object_t __dst[2] = (void *)(v137 | 0x8000000000000000);
                    __dst[0] = v135;
                    __dst[1] = v134;
                  }
                  else
                  {
                    HIBYTE(__dst[2]) = v133;
                    xpc_object_t v135 = __dst;
                    if (!v133)
                    {
LABEL_288:
                      *((unsigned char *)v134 + (void)v135) = 0;
                      memset(&buf, 0, sizeof(buf));
                      if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                      {
                        LODWORD(v284) = -1431655766;
                        if (util::convert<int>(&buf, &v284, 0)) {
                          int v138 = v284;
                        }
                        else {
                          int v138 = 0;
                        }
                      }
                      else
                      {
                        int v138 = 0;
                      }
                      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                      {
                        operator delete(buf.__r_.__value_.__l.__data_);
                        if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                        {
LABEL_295:
                          if (v124 != 4) {
                            goto LABEL_331;
                          }
LABEL_325:
                          if (v131 == 1)
                          {
                            size_t v152 = *(NSObject **)(v5 + 88);
                            if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
                            {
                              LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                              _os_log_impl(&dword_26368A000, v152, OS_LOG_TYPE_DEFAULT, "#N Soft reset detected while Cellular Logging is running. Cellular Logging will be paused.", (uint8_t *)&buf, 2u);
                            }
                            xpc_object_t v256 = xpc_null_create();
                            v255 = 0;
                            v252[0] = MEMORY[0x263EF8330];
                            v252[1] = 1174405120;
                            v252[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_57;
                            v252[3] = &__block_descriptor_tmp_58_0;
                            v252[4] = v5;
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v253, (uint64_t)&__p);
                            v153 = _Block_copy(v252);
                            uint64_t v154 = *MEMORY[0x263F206C8];
                            uint64_t v155 = *(void **)(v5 + 136);
                            if (v155) {
                              dispatch_retain(*(dispatch_object_t *)(v5 + 136));
                            }
                            v254[0] = v153;
                            v254[1] = v155;
                            TraceManager::runOnHelper_sync((void *)v5, (const char *)0xA, v154, 0x1388u, 1, &v256, &v255, v254);
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v254);
                            xpc_release(v256);
                            xpc_object_t v256 = 0;
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v253);
LABEL_335:
                            size_t v158 = strlen((const char *)v58);
                            if (v158 > 0x7FFFFFFFFFFFFFF7) {
                              std::string::__throw_length_error[abi:ne180100]();
                            }
                            int v159 = (void *)v158;
                            if (v158 >= 0x17)
                            {
                              uint64_t v161 = (v158 & 0xFFFFFFFFFFFFFFF8) + 8;
                              if ((v158 | 7) != 0x17) {
                                uint64_t v161 = v158 | 7;
                              }
                              uint64_t v162 = v161 + 1;
                              CFAllocatorRef v160 = operator new(v161 + 1);
                              unint64_t v248 = v162 | 0x8000000000000000;
                              v247[0] = v160;
                              v247[1] = v159;
                            }
                            else
                            {
                              HIBYTE(v248) = v158;
                              CFAllocatorRef v160 = v247;
                              if (!v158)
                              {
LABEL_343:
                                *((unsigned char *)v159 + (void)v160) = 0;
                                if (SHIBYTE(v277.__r_.__value_.__r.__words[2]) < 0) {
                                  std::string::__init_copy_ctor_external(&v246, v277.__r_.__value_.__l.__data_, v277.__r_.__value_.__l.__size_);
                                }
                                else {
                                  std::string v246 = v277;
                                }
                                TraceManager::submitTraceMetric_sync(v5, (const char *)v247, (const char *)&v246);
                                if (SHIBYTE(v246.__r_.__value_.__r.__words[2]) < 0)
                                {
                                  operator delete(v246.__r_.__value_.__l.__data_);
                                  if ((SHIBYTE(v248) & 0x80000000) == 0)
                                  {
LABEL_348:
                                    CFAllocatorRef v163 = v271;
                                    if (!v271)
                                    {
LABEL_350:
                                      if (__p) {
                                        _Block_release(__p);
                                      }
                                      v164 = v260;
                                      if (v260 && !atomic_fetch_add(&v260->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                      {
                                        ((void (*)(std::__shared_weak_count *))v164->__on_zero_shared)(v164);
                                        std::__shared_weak_count::__release_weak(v164);
                                      }
                                      v165 = v258;
                                      if (v258 && !atomic_fetch_add(&v258->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                      {
                                        ((void (*)(std::__shared_weak_count *))v165->__on_zero_shared)(v165);
                                        std::__shared_weak_count::__release_weak(v165);
                                      }
                                      goto LABEL_435;
                                    }
LABEL_349:
                                    dispatch_release(v163);
                                    goto LABEL_350;
                                  }
                                }
                                else if ((SHIBYTE(v248) & 0x80000000) == 0)
                                {
                                  goto LABEL_348;
                                }
                                operator delete(v247[0]);
                                CFAllocatorRef v163 = v271;
                                if (!v271) {
                                  goto LABEL_350;
                                }
                                goto LABEL_349;
                              }
                            }
                            memmove(v160, v58, (size_t)v159);
                            goto LABEL_343;
                          }
LABEL_331:
                          if (v131 | v124 || v138 != 3)
                          {
                            xpc_object_t v156 = xpc_null_create();
                            uint64_t v157 = *MEMORY[0x263F205C8];
                            xpc_object_t v251 = v156;
                            v250 = 0;
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v249, (uint64_t)&__p);
                            TraceManager::runOnHelper_sync((void *)v5, (const char *)9, v157, 0x1388u, 0, &v251, &v250, v249);
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v249);
                            xpc_release(v251);
                            xpc_object_t v251 = 0;
                          }
                          else
                          {
                            notify_post("com.apple.cellularlogging.bbreset");
                          }
                          goto LABEL_335;
                        }
                      }
                      else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                      {
                        goto LABEL_295;
                      }
                      operator delete(__dst[0]);
                      if (v124 != 4) {
                        goto LABEL_331;
                      }
                      goto LABEL_325;
                    }
                  }
                  memmove(v135, v132, (size_t)v134);
                  goto LABEL_288;
                }
              }
              memmove(v128, v125, (size_t)v127);
              goto LABEL_272;
            }
          }
          memmove(v74, v71, (size_t)v73);
          goto LABEL_256;
        }
        size_t v64 = (const void *)*MEMORY[0x263F25E28];
        size_t v65 = strlen((const char *)*MEMORY[0x263F25E28]);
        if (v65 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        size_t v66 = (void *)v65;
        if (v65 >= 0x17)
        {
          uint64_t v82 = (v65 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v65 | 7) != 0x17) {
            uint64_t v82 = v65 | 7;
          }
          uint64_t v83 = v82 + 1;
          uint64_t v67 = (void **)operator new(v82 + 1);
          xpc_object_t __dst[2] = (void *)(v83 | 0x8000000000000000);
          __dst[0] = v67;
          __dst[1] = v66;
        }
        else
        {
          HIBYTE(__dst[2]) = v65;
          uint64_t v67 = __dst;
          if (!v65)
          {
LABEL_157:
            *((unsigned char *)v66 + (void)v67) = 0;
            memset(&buf, 0, sizeof(buf));
            int v84 = -1431655766;
            if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
            {
              LODWORD(__p) = -1431655766;
              if (util::convert<int>(&buf, &__p, 0)) {
                int v84 = (int)__p;
              }
              else {
                int v84 = -1431655766;
              }
            }
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(__dst[2]) < 0) {
              operator delete(__dst[0]);
            }
            xpc_object_t v85 = (const void *)*MEMORY[0x263F25FE0];
            size_t v86 = strlen((const char *)*MEMORY[0x263F25FE0]);
            if (v86 > 0x7FFFFFFFFFFFFFF7) {
              std::string::__throw_length_error[abi:ne180100]();
            }
            uint64_t v87 = (void *)v86;
            unint64_t v214 = (const char *)v54;
            if (v86 >= 0x17)
            {
              uint64_t v89 = (v86 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v86 | 7) != 0x17) {
                uint64_t v89 = v86 | 7;
              }
              uint64_t v90 = v89 + 1;
              v88 = (void **)operator new(v89 + 1);
              xpc_object_t __dst[2] = (void *)(v90 | 0x8000000000000000);
              __dst[0] = v88;
              __dst[1] = v87;
            }
            else
            {
              HIBYTE(__dst[2]) = v86;
              v88 = __dst;
              if (!v86)
              {
LABEL_173:
                *((unsigned char *)v87 + (void)v88) = 0;
                memset(&buf, 0, sizeof(buf));
                int v91 = -1431655766;
                if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                {
                  LODWORD(__p) = -1431655766;
                  if (util::convert<int>(&buf, &__p, 0)) {
                    int v91 = (int)__p;
                  }
                  else {
                    int v91 = -1431655766;
                  }
                }
                if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(buf.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(__dst[2]) < 0) {
                  operator delete(__dst[0]);
                }
                uint64_t v92 = (const void *)*MEMORY[0x263F29D78];
                size_t v93 = strlen((const char *)*MEMORY[0x263F29D78]);
                if (v93 > 0x7FFFFFFFFFFFFFF7) {
                  std::string::__throw_length_error[abi:ne180100]();
                }
                xpc_object_t v94 = (void *)v93;
                if (v93 >= 0x17)
                {
                  uint64_t v96 = (v93 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v93 | 7) != 0x17) {
                    uint64_t v96 = v93 | 7;
                  }
                  uint64_t v97 = v96 + 1;
                  size_t v95 = (void **)operator new(v96 + 1);
                  xpc_object_t __dst[2] = (void *)(v97 | 0x8000000000000000);
                  __dst[0] = v95;
                  __dst[1] = v94;
                }
                else
                {
                  HIBYTE(__dst[2]) = v93;
                  size_t v95 = __dst;
                  if (!v93)
                  {
LABEL_189:
                    *((unsigned char *)v94 + (void)v95) = 0;
                    memset(&buf, 0, sizeof(buf));
                    if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                    {
                      LODWORD(__p) = -1431655766;
                      if (util::convert<int>(&buf, &__p, 0)) {
                        int v98 = (int)__p;
                      }
                      else {
                        int v98 = 0;
                      }
                    }
                    else
                    {
                      int v98 = 0;
                    }
                    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                    {
                      operator delete(buf.__r_.__value_.__l.__data_);
                      if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                      {
LABEL_196:
                        if (v84 != 4) {
                          goto LABEL_303;
                        }
LABEL_299:
                        if (v91 == 1)
                        {
                          v139 = *(NSObject **)(v5 + 88);
                          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
                          {
                            LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                            _os_log_impl(&dword_26368A000, v139, OS_LOG_TYPE_DEFAULT, "#N Hard reset detected while Cellular Logging is running. Cellular Logging will be paused.", (uint8_t *)&buf, 2u);
                          }
                          xpc_object_t v140 = xpc_null_create();
                          uint64_t v141 = *MEMORY[0x263F206C8];
                          xpc_object_t v275 = v140;
                          v274 = 0;
                          v273[1] = 0;
                          v273[0] = 0;
                          TraceManager::runOnHelper_sync((void *)v5, (const char *)0xA, v141, 0x1388u, 1, &v275, &v274, v273);
                          xpc_release(v275);
                          xpc_object_t v275 = 0;
LABEL_306:
                          memset(&buf, 170, sizeof(buf));
                          xpc_object_t v142 = (const char *)*MEMORY[0x263F26368];
                          memset(__dst, 0, sizeof(__dst));
                          ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, v142);
                          ctu::cf::map_adapter::getString();
                          MEMORY[0x263E68C90](&__p);
                          if (SHIBYTE(__dst[2]) < 0) {
                            operator delete(__dst[0]);
                          }
                          memset(__dst, 170, sizeof(__dst));
                          xpc_object_t v143 = (const void *)*MEMORY[0x263F25F88];
                          size_t v144 = strlen((const char *)*MEMORY[0x263F25F88]);
                          if (v144 > 0x7FFFFFFFFFFFFFF7) {
                            std::string::__throw_length_error[abi:ne180100]();
                          }
                          xpc_object_t v145 = v144;
                          if (v144 >= 0x17)
                          {
                            uint64_t v147 = (v144 & 0xFFFFFFFFFFFFFFF8) + 8;
                            if ((v144 | 7) != 0x17) {
                              uint64_t v147 = v144 | 7;
                            }
                            uint64_t v148 = v147 + 1;
                            p_p = operator new(v147 + 1);
                            unint64_t v272 = v148 | 0x8000000000000000;
                            std::string __p = p_p;
                            dispatch_object_t v271 = v145;
                          }
                          else
                          {
                            HIBYTE(v272) = v144;
                            p_p = &__p;
                            if (!v144)
                            {
LABEL_316:
                              v149 = (const char *)*MEMORY[0x263F26030];
                              *((unsigned char *)&v145->isa + (void)p_p) = 0;
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v284, v149);
                              ctu::cf::map_adapter::getString();
                              MEMORY[0x263E68C90](&v284);
                              if (SHIBYTE(v272) < 0) {
                                operator delete(__p);
                              }
                              xpc_object_t v150 = xpc_dictionary_create(0, 0, 0);
                              if (v150 || (xpc_object_t v150 = xpc_null_create()) != 0)
                              {
                                if (MEMORY[0x263E6A240](v150) == MEMORY[0x263EF8708])
                                {
                                  xpc_retain(v150);
                                  xpc_object_t v151 = v150;
                                }
                                else
                                {
                                  xpc_object_t v151 = xpc_null_create();
                                }
                              }
                              else
                              {
                                xpc_object_t v151 = xpc_null_create();
                                xpc_object_t v150 = 0;
                              }
                              xpc_release(v150);
                              if (SHIBYTE(v278[2]) >= 0) {
                                v166 = (const char *)v278;
                              }
                              else {
                                v166 = (const char *)v278[0];
                              }
                              xpc_object_t v167 = xpc_string_create(v166);
                              if (!v167) {
                                xpc_object_t v167 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, v34, v167);
                              xpc_object_t v168 = xpc_null_create();
                              xpc_release(v167);
                              xpc_release(v168);
                              if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                v169 = &buf;
                              }
                              else {
                                v169 = (std::string *)buf.__r_.__value_.__r.__words[0];
                              }
                              xpc_object_t v170 = xpc_string_create((const char *)v169);
                              if (!v170) {
                                xpc_object_t v170 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, v142, v170);
                              xpc_object_t v171 = xpc_null_create();
                              xpc_release(v170);
                              xpc_release(v171);
                              if ((v277.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                uint64_t v172 = &v277;
                              }
                              else {
                                uint64_t v172 = (std::string *)v277.__r_.__value_.__r.__words[0];
                              }
                              xpc_object_t v173 = xpc_string_create((const char *)v172);
                              if (!v173) {
                                xpc_object_t v173 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, (const char *)*MEMORY[0x263F263C0], v173);
                              xpc_object_t v174 = xpc_null_create();
                              xpc_release(v173);
                              xpc_release(v174);
                              if (SHIBYTE(__dst[2]) >= 0) {
                                v175 = (const char *)__dst;
                              }
                              else {
                                v175 = (const char *)__dst[0];
                              }
                              xpc_object_t v176 = xpc_string_create(v175);
                              if (!v176) {
                                xpc_object_t v176 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, v149, v176);
                              xpc_object_t v177 = xpc_null_create();
                              xpc_release(v176);
                              xpc_release(v177);
                              xpc_object_t v178 = xpc_string_create((const char *)*MEMORY[0x263F26768]);
                              if (!v178) {
                                xpc_object_t v178 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, (const char *)*MEMORY[0x263F25ED8], v178);
                              xpc_object_t v179 = xpc_null_create();
                              xpc_release(v178);
                              xpc_release(v179);
                              xpc_object_t v180 = xpc_int64_create(Int);
                              if (!v180) {
                                xpc_object_t v180 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, v52, v180);
                              xpc_object_t v181 = xpc_null_create();
                              xpc_release(v180);
                              xpc_release(v181);
                              int v182 = (const char *)*MEMORY[0x263F262A0];
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, (const char *)*MEMORY[0x263F262A0]);
                              char Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v280, (const __CFString *)__p);
                              MEMORY[0x263E68C90](&__p);
                              xpc_object_t v184 = xpc_BOOL_create(Bool);
                              if (!v184) {
                                xpc_object_t v184 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, v182, v184);
                              xpc_object_t v185 = xpc_null_create();
                              xpc_release(v184);
                              xpc_release(v185);
                              v186 = (const char *)*MEMORY[0x263F262B8];
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, (const char *)*MEMORY[0x263F262B8]);
                              char v187 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v280, (const __CFString *)__p);
                              MEMORY[0x263E68C90](&__p);
                              xpc_object_t v188 = xpc_BOOL_create(v187);
                              if (!v188) {
                                xpc_object_t v188 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, v186, v188);
                              xpc_object_t v189 = xpc_null_create();
                              xpc_release(v188);
                              xpc_release(v189);
                              v190 = (const char *)*MEMORY[0x263F262B0];
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, (const char *)*MEMORY[0x263F262B0]);
                              char v191 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v280, (const __CFString *)__p);
                              MEMORY[0x263E68C90](&__p);
                              xpc_object_t v192 = xpc_BOOL_create(v191);
                              if (!v192) {
                                xpc_object_t v192 = xpc_null_create();
                              }
                              xpc_dictionary_set_value(v151, v190, v192);
                              xpc_object_t v193 = xpc_null_create();
                              xpc_release(v192);
                              xpc_release(v193);
                              v194 = *(std::__shared_weak_count **)(v5 + 128);
                              if (!v194
                                || (v195 = *(void *)(v5 + 120), (long long v196 = std::__shared_weak_count::lock(v194)) == 0))
                              {
                                std::__throw_bad_weak_ptr[abi:ne180100]();
                              }
                              unint64_t v197 = v196;
                              atomic_fetch_add_explicit(&v196->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                              if (!atomic_fetch_add(&v196->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                              {
                                ((void (*)(std::__shared_weak_count *))v196->__on_zero_shared)(v196);
                                std::__shared_weak_count::__release_weak(v197);
                              }
                              v198 = (const void *)*MEMORY[0x263F261B0];
                              size_t v199 = strlen((const char *)*MEMORY[0x263F261B0]);
                              if (v199 > 0x7FFFFFFFFFFFFFF7) {
                                std::string::__throw_length_error[abi:ne180100]();
                              }
                              CFTypeRef v200 = v199;
                              if (v199 >= 0x17)
                              {
                                uint64_t v202 = (v199 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v199 | 7) != 0x17) {
                                  uint64_t v202 = v199 | 7;
                                }
                                uint64_t v203 = v202 + 1;
                                v201 = operator new(v202 + 1);
                                unint64_t v272 = v203 | 0x8000000000000000;
                                std::string __p = v201;
                                dispatch_object_t v271 = v200;
                              }
                              else
                              {
                                HIBYTE(v272) = v199;
                                v201 = &__p;
                                if (!v199)
                                {
LABEL_404:
                                  *((unsigned char *)&v200->isa + (void)v201) = 0;
                                  xpc_object_t v269 = v151;
                                  if (v151) {
                                    xpc_retain(v151);
                                  }
                                  else {
                                    xpc_object_t v269 = xpc_null_create();
                                  }
                                  v264[0] = MEMORY[0x263EF8330];
                                  v264[1] = 1174405120;
                                  v264[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_52;
                                  v264[3] = &__block_descriptor_tmp_54_1;
                                  v205 = *(abm::client::Event **)a2;
                                  CFTypeRef v204 = *(std::__shared_weak_count **)(a2 + 8);
                                  v264[4] = v5;
                                  v264[5] = v205;
                                  v265 = v204;
                                  if (v204) {
                                    atomic_fetch_add_explicit(&v204->__shared_owners_, 1uLL, memory_order_relaxed);
                                  }
                                  uint64_t v266 = v195;
                                  v267 = v197;
                                  atomic_fetch_add_explicit(&v197->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                                  unint64_t v206 = _Block_copy(v264);
                                  v268 = v206;
                                  Service::runCommand(v5, (uint64_t)&__p, &v269, &v268);
                                  if (v206) {
                                    _Block_release(v206);
                                  }
                                  xpc_release(v269);
                                  xpc_object_t v269 = 0;
                                  if (SHIBYTE(v272) < 0) {
                                    operator delete(__p);
                                  }
                                  size_t v207 = strlen(v214);
                                  if (v207 > 0x7FFFFFFFFFFFFFF7) {
                                    std::string::__throw_length_error[abi:ne180100]();
                                  }
                                  v208 = (void *)v207;
                                  if (v207 >= 0x17)
                                  {
                                    uint64_t v210 = (v207 & 0xFFFFFFFFFFFFFFF8) + 8;
                                    if ((v207 | 7) != 0x17) {
                                      uint64_t v210 = v207 | 7;
                                    }
                                    uint64_t v211 = v210 + 1;
                                    int64_t v209 = operator new(v210 + 1);
                                    unint64_t v263 = v211 | 0x8000000000000000;
                                    v262[0] = v209;
                                    v262[1] = v208;
                                  }
                                  else
                                  {
                                    HIBYTE(v263) = v207;
                                    int64_t v209 = v262;
                                    if (!v207)
                                    {
LABEL_421:
                                      *((unsigned char *)v208 + (void)v209) = 0;
                                      if (SHIBYTE(v277.__r_.__value_.__r.__words[2]) < 0) {
                                        std::string::__init_copy_ctor_external(&v261, v277.__r_.__value_.__l.__data_, v277.__r_.__value_.__l.__size_);
                                      }
                                      else {
                                        std::string v261 = v277;
                                      }
                                      TraceManager::submitTraceMetric_sync(v5, (const char *)v262, (const char *)&v261);
                                      if (SHIBYTE(v261.__r_.__value_.__r.__words[2]) < 0)
                                      {
                                        operator delete(v261.__r_.__value_.__l.__data_);
                                        if ((SHIBYTE(v263) & 0x80000000) == 0)
                                        {
LABEL_426:
                                          v212 = v267;
                                          if (!v267) {
                                            goto LABEL_428;
                                          }
                                          goto LABEL_427;
                                        }
                                      }
                                      else if ((SHIBYTE(v263) & 0x80000000) == 0)
                                      {
                                        goto LABEL_426;
                                      }
                                      operator delete(v262[0]);
                                      v212 = v267;
                                      if (!v267)
                                      {
LABEL_428:
                                        unint64_t v213 = v265;
                                        if (v265 && !atomic_fetch_add(&v265->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                        {
                                          ((void (*)(std::__shared_weak_count *))v213->__on_zero_shared)(v213);
                                          std::__shared_weak_count::__release_weak(v213);
                                        }
                                        std::__shared_weak_count::__release_weak(v197);
                                        xpc_release(v151);
                                        if (SHIBYTE(__dst[2]) < 0) {
                                          operator delete(__dst[0]);
                                        }
                                        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                                          operator delete(buf.__r_.__value_.__l.__data_);
                                        }
                                        goto LABEL_435;
                                      }
LABEL_427:
                                      std::__shared_weak_count::__release_weak(v212);
                                      goto LABEL_428;
                                    }
                                  }
                                  memmove(v209, v214, (size_t)v208);
                                  goto LABEL_421;
                                }
                              }
                              memmove(v201, v198, (size_t)v200);
                              goto LABEL_404;
                            }
                          }
                          memmove(p_p, v143, (size_t)v145);
                          goto LABEL_316;
                        }
LABEL_303:
                        if (!(v91 | v84) && v98 == 3) {
                          notify_post("com.apple.cellularlogging.bbreset");
                        }
                        goto LABEL_306;
                      }
                    }
                    else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                    {
                      goto LABEL_196;
                    }
                    operator delete(__dst[0]);
                    if (v84 != 4) {
                      goto LABEL_303;
                    }
                    goto LABEL_299;
                  }
                }
                memmove(v95, v92, (size_t)v94);
                goto LABEL_189;
              }
            }
            memmove(v88, v85, (size_t)v87);
            goto LABEL_173;
          }
        }
        memmove(v67, v64, (size_t)v66);
        goto LABEL_157;
      }
    }
    memmove(p_buf, v35, v37);
    goto LABEL_88;
  }
LABEL_442:
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v7 = v283;
  if (v283) {
    goto LABEL_445;
  }
}

void sub_26378965C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_263789CF0()
{
}

void sub_263789CF8()
{
}

void prop::bbtrace::get<diag::config::Mode>(char *a1, int *a2)
{
  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get(a1, (uint64_t)&__p))
  {
    int v4 = -1431655766;
    if (util::convert<int>(&__p, &v4, 0)) {
      *a2 = v4;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_263789D80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void prop::bbtrace::get<abm::traceOwnership>(char *a1, int *a2)
{
  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get(a1, (uint64_t)&__p))
  {
    int v4 = -1431655766;
    if (util::convert<int>(&__p, &v4, 0)) {
      *a2 = v4;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_263789E1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL TraceManager::isCellullarLoggingStreamingMode(uint64_t a1, int a2, int a3, int a4)
{
  return !(a3 | a2) && a4 == 3;
}

uint64_t TraceManager::postBBResetNotification(TraceManager *this)
{
  return notify_post("com.apple.cellularlogging.bbreset");
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_52(void *a1, int a2, xpc_object_t *a3)
{
  int v4 = (std::__shared_weak_count *)a1[8];
  if (!v4) {
    return;
  }
  uint64_t v7 = (void *)a1[4];
  uint64_t v8 = std::__shared_weak_count::lock(v4);
  if (!v8) {
    return;
  }
  CFDictionaryRef v9 = v8;
  uint64_t v10 = a1[7];
  if (v10)
  {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    xpc_object_t v11 = *a3;
    if (*a3)
    {
      xpc_retain(*a3);
      uint64_t v13 = a1[5];
      std::string::size_type v12 = (std::__shared_weak_count *)a1[6];
      if (!v12) {
        goto LABEL_7;
      }
    }
    else
    {
      xpc_object_t v11 = xpc_null_create();
      uint64_t v13 = a1[5];
      std::string::size_type v12 = (std::__shared_weak_count *)a1[6];
      if (!v12)
      {
LABEL_7:
        size_t v14 = (std::__shared_weak_count *)v7[16];
        if (!v14 || (uint64_t v15 = v7[15], (v16 = std::__shared_weak_count::lock(v14)) == 0)) {
          std::__throw_bad_weak_ptr[abi:ne180100]();
        }
        int v17 = v16;
        size_t v18 = operator new(0x38uLL);
        *size_t v18 = v7;
        v18[1] = v10;
        v18[2] = v9;
        *((_DWORD *)v18 + 6) = a2;
        v18[4] = v11;
        xpc_object_t v19 = xpc_null_create();
        v18[5] = v13;
        v18[6] = v12;
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v20 = v7[17];
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v21 = operator new(0x18uLL);
        *uint64_t v21 = v18;
        v21[1] = v15;
        v21[2] = v17;
        dispatch_async_f(v20, v21, (dispatch_function_t)_ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZZNS3_25finishInitialization_syncEvEUb2_EUb3_E3__4EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrIS7_NSC_14default_deleteIS7_EEEEENUlPvE_8__invokeESH_);
        if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
        if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
        xpc_release(v19);
        goto LABEL_17;
      }
    }
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_7;
  }
LABEL_17:
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void *__copy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_55(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_26368A000, v1, OS_LOG_TYPE_DEFAULT, "#I Abort complete", v2, 2u);
  }
}

void *__copy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v3) {
      return;
    }
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_57(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  CFDictionaryRef v9 = 0;
  xpc_object_t object = xpc_null_create();
  uint64_t v3 = (const void *)a1[5];
  if (v3)
  {
    int v4 = _Block_copy(v3);
    uint64_t v5 = *MEMORY[0x263F205C8];
    uint64_t v6 = a1[6];
    uint64_t v7 = v4;
    uint64_t v8 = v6;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v4 = 0;
  uint64_t v5 = *MEMORY[0x263F205C8];
  uint64_t v6 = a1[6];
  uint64_t v7 = 0;
  uint64_t v8 = v6;
  if (v6) {
LABEL_3:
  }
    dispatch_retain(v6);
LABEL_4:
  TraceManager::runOnHelper_sync(v2, (const char *)9, v5, 0x1388u, 0, &object, &v9, &v7);
  if (v6) {
    dispatch_release(v6);
  }
  if (v4) {
    _Block_release(v4);
  }
  xpc_release(object);
}

void sub_26378A3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

void __copy_helper_block_e8_40c79_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a2 + 40);
  if (v4) {
    int v4 = _Block_copy(v4);
  }
  uint64_t v5 = *(NSObject **)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  if (v5)
  {
    dispatch_retain(v5);
  }
}

void __destroy_helper_block_e8_40c79_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 48);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    _Block_release(v3);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_59(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_26368A000, v1, OS_LOG_TYPE_DEFAULT, "#I Prepare complete", v2, 2u);
  }
}

void TraceManager::updateBasebandFWInfo(TraceManager *this)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v2) == MEMORY[0x263EF8708])
    {
      xpc_retain(v2);
      xpc_object_t v3 = v2;
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  int v4 = (std::__shared_weak_count *)*((void *)this + 16);
  if (!v4 || (v5 = *((void *)this + 15), (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v8 = (const void *)*MEMORY[0x263F26680];
  size_t v9 = strlen((const char *)*MEMORY[0x263F26680]);
  if (v9 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v10 = (void *)v9;
  if (v9 >= 0x17)
  {
    uint64_t v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v12 = v9 | 7;
    }
    uint64_t v13 = v12 + 1;
    xpc_object_t v11 = (void **)operator new(v12 + 1);
    __dst[1] = v10;
    unint64_t v20 = v13 | 0x8000000000000000;
    __dst[0] = v11;
LABEL_19:
    memmove(v11, v8, (size_t)v10);
    *((unsigned char *)v10 + (void)v11) = 0;
    xpc_object_t object = v3;
    if (v3) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  HIBYTE(v20) = v9;
  xpc_object_t v11 = __dst;
  if (v9) {
    goto LABEL_19;
  }
  LOBYTE(__dst[0]) = 0;
  xpc_object_t object = v3;
  if (v3)
  {
LABEL_15:
    xpc_retain(v3);
    goto LABEL_21;
  }
LABEL_20:
  xpc_object_t object = xpc_null_create();
LABEL_21:
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1174405120;
  v15[2] = ___ZN12TraceManager20updateBasebandFWInfoEv_block_invoke;
  v15[3] = &__block_descriptor_tmp_96_1;
  v15[4] = this;
  void v15[5] = v5;
  xpc_object_t v16 = v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  size_t v14 = _Block_copy(v15);
  int v17 = v14;
  Service::runCommand((uint64_t)this, (uint64_t)__dst, &object, &v17);
  if (v14) {
    _Block_release(v14);
  }
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v20) < 0) {
    operator delete(__dst[0]);
  }
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  std::__shared_weak_count::__release_weak(v7);
  xpc_release(v3);
}

void sub_26378A75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, xpc_object_t object, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (v25) {
    _Block_release(v25);
  }
  if (a15) {
    std::__shared_weak_count::__release_weak(a15);
  }
  xpc_release(object);
  if (a23 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::__release_weak(v24);
  xpc_release(v23);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_63(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v2 = 0;
    _os_log_impl(&dword_26368A000, v1, OS_LOG_TYPE_DEFAULT, "#I Start complete", v2, 2u);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_67(void *a1)
{
  xpc_object_t v2 = (void *)a1[4];
  size_t v9 = 0;
  xpc_object_t object = xpc_null_create();
  xpc_object_t v3 = (const void *)a1[5];
  if (v3)
  {
    int v4 = _Block_copy(v3);
    uint64_t v5 = *MEMORY[0x263F206D8];
    uint64_t v6 = a1[6];
    uint64_t v7 = v4;
    uint64_t v8 = v6;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v4 = 0;
  uint64_t v5 = *MEMORY[0x263F206D8];
  uint64_t v6 = a1[6];
  uint64_t v7 = 0;
  uint64_t v8 = v6;
  if (v6) {
LABEL_3:
  }
    dispatch_retain(v6);
LABEL_4:
  TraceManager::runOnHelper_sync(v2, (const char *)0xA, v5, 0x1388u, 1, &object, &v9, &v7);
  if (v6) {
    dispatch_release(v6);
  }
  if (v4) {
    _Block_release(v4);
  }
  xpc_release(object);
}

void sub_26378A91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_71(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v2 = 0;
    _os_log_impl(&dword_26368A000, v1, OS_LOG_TYPE_DEFAULT, "#I Abort complete", v2, 2u);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_75(void *a1)
{
  xpc_object_t v2 = (void *)a1[4];
  size_t v9 = 0;
  xpc_object_t object = xpc_null_create();
  xpc_object_t v3 = (const void *)a1[5];
  if (v3)
  {
    int v4 = _Block_copy(v3);
    uint64_t v5 = *MEMORY[0x263F205C8];
    uint64_t v6 = a1[6];
    uint64_t v7 = v4;
    uint64_t v8 = v6;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v4 = 0;
  uint64_t v5 = *MEMORY[0x263F205C8];
  uint64_t v6 = a1[6];
  uint64_t v7 = 0;
  uint64_t v8 = v6;
  if (v6) {
LABEL_3:
  }
    dispatch_retain(v6);
LABEL_4:
  TraceManager::runOnHelper_sync(v2, (const char *)9, v5, 0x7D0u, 0, &object, &v9, &v7);
  if (v6) {
    dispatch_release(v6);
  }
  if (v4) {
    _Block_release(v4);
  }
  xpc_release(object);
}

void sub_26378AA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_83(void *a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = (std::__shared_weak_count *)a1[6];
  if (!v3) {
    return;
  }
  uint64_t v5 = (char *)a1[4];
  uint64_t v6 = std::__shared_weak_count::lock(v3);
  int v38 = v6;
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = a1[5];
  uint64_t v37 = v8;
  if (!v8)
  {
LABEL_51:
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return;
  }
  size_t v9 = *((void *)v5 + 11);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    abm::client::Event::name((uint64_t *)&__p, *(abm::client::Event **)a2);
    uint64_t v10 = v40 >= 0 ? &__p : (long long *)__p;
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_26368A000, v9, OS_LOG_TYPE_DEFAULT, "#I Received event %s", buf, 0xCu);
    if (v40 < 0) {
      operator delete((void *)__p);
    }
  }
  if ((*(unsigned int (**)(char *))(*(void *)v5 + 88))(v5))
  {
    xpc_object_t v11 = *((void *)v5 + 11);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *MEMORY[0x263F263F0];
      LODWORD(__p) = 136315138;
      *(void *)((char *)&__p + 4) = v12;
      _os_log_impl(&dword_26368A000, v11, OS_LOG_TYPE_DEFAULT, "#I Server going down. Skipping event %s", (uint8_t *)&__p, 0xCu);
    }
    goto LABEL_51;
  }
  *(void *)std::string buf = 0xAAAAAAAAAAAAAAAALL;
  abm::client::Event::getData((uint64_t *)buf, *(abm::client::Event **)a2);
  uint64_t v13 = *(const void **)buf;
  if (*(void *)buf) {
    size_t v14 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    size_t v14 = 0;
  }
  if (v14)
  {
    *(void *)&long long __p = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&__p + 1) = 0xAAAAAAAAAAAAAAAALL;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_84;
    aBlock[3] = &__block_descriptor_tmp_85;
    xpc_object_t v16 = *(abm::client::Event **)a2;
    uint64_t v15 = *(std::__shared_weak_count **)(a2 + 8);
    aBlock[4] = v5;
    void aBlock[5] = v16;
    uint64_t v34 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v35 = v8;
    size_t v36 = v7;
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    size_t v18 = _Block_copy(aBlock);
    xpc_object_t v19 = *((void *)v5 + 17);
    if (v19) {
      dispatch_retain(*((dispatch_object_t *)v5 + 17));
    }
    *(void *)&long long __p = v18;
    *((void *)&__p + 1) = v19;
    ctu::cf_to_xpc((uint64_t *)&object, *(ctu **)buf, v17);
    xpc_object_t v20 = object;
    if (object && MEMORY[0x263E6A240](object) == MEMORY[0x263EF8708]) {
      xpc_retain(v20);
    }
    else {
      xpc_object_t v20 = xpc_null_create();
    }
    xpc_release(object);
    uint64_t v21 = v5 + 168;
    if (v5[191] < 0) {
      uint64_t v21 = *(const char **)v21;
    }
    xpc_object_t v22 = xpc_string_create(v21);
    if (!v22) {
      xpc_object_t v22 = xpc_null_create();
    }
    xpc_dictionary_set_value(v20, (const char *)*MEMORY[0x263F26000], v22);
    xpc_object_t v23 = xpc_null_create();
    xpc_release(v22);
    xpc_release(v23);
    xpc_object_t v31 = v20;
    if (v20)
    {
      xpc_retain(v20);
      char v30 = 0;
      if (v18) {
        goto LABEL_31;
      }
    }
    else
    {
      char v30 = 0;
      xpc_object_t v31 = xpc_null_create();
      if (v18)
      {
LABEL_31:
        size_t v24 = _Block_copy(v18);
        uint64_t v25 = *MEMORY[0x263F205E0];
        uint64_t v28 = v24;
        uint64_t v29 = v19;
        if (!v19)
        {
LABEL_33:
          TraceManager::runOnHelper_sync(v5, (const char *)9, v25, 0x1388u, 1, &v31, &v30, &v28);
          if (v19) {
            dispatch_release(v19);
          }
          if (v24) {
            _Block_release(v24);
          }
          xpc_release(v31);
          xpc_object_t v31 = 0;
          xpc_release(v20);
          if (v19) {
            dispatch_release(v19);
          }
          if (v18) {
            _Block_release(v18);
          }
          int v26 = v36;
          if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
          uint64_t v27 = v34;
          if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
          uint64_t v13 = *(const void **)buf;
          goto LABEL_48;
        }
LABEL_32:
        dispatch_retain(v19);
        goto LABEL_33;
      }
    }
    size_t v24 = 0;
    uint64_t v25 = *MEMORY[0x263F205E0];
    uint64_t v28 = 0;
    uint64_t v29 = v19;
    if (!v19) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_48:
  if (v13) {
    CFRelease(v13);
  }
  uint64_t v7 = v38;
  if (v38) {
    goto LABEL_51;
  }
}

void sub_26378AF58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_84(uint64_t a1, _DWORD *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = *a2 == 0;
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_26368A000, v3, OS_LOG_TYPE_DEFAULT, "#I Snapshot : Snapshot complete. Success = %d", (uint8_t *)v5, 8u);
  }
}

void *__copy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v3) {
      return;
    }
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_89(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = (void *)a1[4];
    BOOL v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = a1[5];
      if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        if (!v6) {
          return;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6) {
          return;
        }
      }
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      if (v7 || (xpc_object_t v7 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6A240](v7) == MEMORY[0x263EF8708])
        {
          xpc_retain(v7);
          xpc_object_t v8 = v7;
        }
        else
        {
          xpc_object_t v8 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v8 = xpc_null_create();
        xpc_object_t v7 = 0;
      }
      xpc_release(v7);
      xpc_object_t v9 = xpc_string_create("Trace state for sysdiagnose");
      if (!v9) {
        xpc_object_t v9 = xpc_null_create();
      }
      xpc_dictionary_set_value(v8, (const char *)*MEMORY[0x263F20600], v9);
      xpc_object_t v10 = xpc_null_create();
      xpc_release(v9);
      xpc_release(v10);
      xpc_object_t object = v8;
      if (v8) {
        xpc_retain(v8);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      uint64_t v11 = *MEMORY[0x263F205B0];
      v12[1] = 0;
      uint64_t v13 = 0;
      v12[0] = 0;
      TraceManager::runOnHelper_sync(v3, (const char *)9, v11, 0x1388u, 1, &object, &v13, v12);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(v8);
    }
  }
}

void sub_26378B390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v12);
  _Unwind_Resume(a1);
}

void TraceManager::sleep(void *a1, dispatch_object_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  BOOL v4 = (std::__shared_weak_count *)a1[16];
  if (!v4 || (v5 = a1[15], (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v7 = v6;
  xpc_object_t v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  xpc_object_t v9 = a1[17];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v10 = operator new(0x18uLL);
  *xpc_object_t v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::sleep(dispatch::group_session)::$_0>(TraceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void TraceManager::wake(void *a1, dispatch_object_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  BOOL v4 = (std::__shared_weak_count *)a1[16];
  if (!v4 || (v5 = a1[15], (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v7 = v6;
  xpc_object_t v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  xpc_object_t v9 = a1[17];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v10 = operator new(0x18uLL);
  *xpc_object_t v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::wake(dispatch::group_session)::$_0>(TraceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ___ZN12TraceManager20updateBasebandFWInfoEv_block_invoke(void *a1, int a2, xpc_object_t *a3)
{
  BOOL v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    uint64_t v7 = a1[4];
    xpc_object_t v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      xpc_object_t v9 = v8;
      uint64_t v10 = a1[5];
      if (atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        if (a2) {
          return;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v9);
        if (a2) {
          return;
        }
      }
      if (v10)
      {
        xpc_object_t value = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x263F26000]);
        xpc_object_t object = value;
        if (value) {
          xpc_retain(value);
        }
        else {
          xpc_object_t object = xpc_null_create();
        }
        xpc::dyn_cast_or_default((uint64_t *)&v15, (xpc *)&object, (const object *)"", v12);
        uint64_t v13 = (void **)(v7 + 168);
        if (*(char *)(v7 + 191) < 0) {
          operator delete(*v13);
        }
        *(_OWORD *)uint64_t v13 = v15;
        *(void *)(v7 + 184) = v16;
        HIBYTE(v16) = 0;
        LOBYTE(v15) = 0;
        xpc_release(object);
      }
    }
  }
}

void sub_26378B738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void ___ZN12TraceManager20initTraceHelper_syncEv_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    BOOL v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = a1[5];
      if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        if (!v6) {
          return;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6) {
          return;
        }
      }
      uint64_t v7 = *(NSObject **)(v3 + 88);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_26368A000, v7, OS_LOG_TYPE_DEFAULT, "#I Wireless helper server has started", buf, 2u);
      }
      xpc_object_t v8 = (const char *)*MEMORY[0x263F263E8];
      int v9 = *(char *)(v3 + 215);
      if (v9 >= 0) {
        size_t v10 = *(unsigned __int8 *)(v3 + 215);
      }
      else {
        size_t v10 = *(void *)(v3 + 200);
      }
      if (v10 == strlen((const char *)*MEMORY[0x263F263E8])
        && (v9 >= 0 ? (uint64_t v11 = (const void *)(v3 + 192)) : (uint64_t v11 = *(const void **)(v3 + 192)),
            !memcmp(v11, v8, v10)
         && (prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F25E80], v12)
          || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F268F8], v14)
          || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x263F25EF0], v15))))
      {
        xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
        if (v16 || (xpc_object_t v16 = xpc_null_create()) != 0)
        {
          if (MEMORY[0x263E6A240](v16) == MEMORY[0x263EF8708])
          {
            xpc_retain(v16);
            xpc_object_t v17 = v16;
          }
          else
          {
            xpc_object_t v17 = xpc_null_create();
          }
        }
        else
        {
          xpc_object_t v17 = xpc_null_create();
          xpc_object_t v16 = 0;
        }
        xpc_release(v16);
        xpc_object_t v18 = xpc_string_create(v8);
        if (!v18) {
          xpc_object_t v18 = xpc_null_create();
        }
        xpc_dictionary_set_value(v17, (const char *)*MEMORY[0x263F26140], v18);
        xpc_object_t v19 = xpc_null_create();
        xpc_release(v18);
        xpc_release(v19);
        xpc_object_t object = v17;
        if (v17) {
          xpc_retain(v17);
        }
        else {
          xpc_object_t object = xpc_null_create();
        }
        uint64_t v20 = *MEMORY[0x263F205D8];
        v21[1] = 0;
        xpc_object_t v22 = 0;
        v21[0] = 0;
        TraceManager::runOnHelper_sync((void *)v3, (const char *)9, v20, 0x1388u, 0, &object, &v22, v21);
        xpc_release(object);
        xpc_object_t object = 0;
        xpc_release(v17);
      }
      else
      {
        uint64_t v13 = *(NSObject **)(v3 + 88);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl(&dword_26368A000, v13, OS_LOG_TYPE_DEFAULT, "#I Skipping trace start", buf, 2u);
        }
      }
    }
  }
}

void sub_26378BA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v12);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager16runOnHelper_syncEN3abm6helper6TaskIDEPKcjbN3xpc4dictEN8dispatch13group_sessionENS7_8callbackIU13block_pointerFvN12TelephonyXPC6ResultES6_EEE_block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    BOOL v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = a1[5];
      if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
      }
      if (v6)
      {
        uint64_t v7 = *(NSObject **)(v3 + 88);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = abm::helper::asString();
          uint64_t v9 = a1[10];
          int v10 = 136315394;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          uint64_t v13 = v9;
          _os_log_impl(&dword_26368A000, v7, OS_LOG_TYPE_DEFAULT, "#I %s:%s: complete", (uint8_t *)&v10, 0x16u);
        }
      }
    }
  }
}

void __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c30_ZTSN8dispatch13group_sessionE64c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE(void *a1, void *a2)
{
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = a2[7];
  a1[7] = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = a1[7];
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c30_ZTSN8dispatch13group_sessionE64c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[9];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = a1[7];
    if (!v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = a1[7];
    if (!v3) {
      goto LABEL_7;
    }
  }
  dispatch_group_leave(v3);
  uint64_t v4 = a1[7];
  if (v4) {
    dispatch_release(v4);
  }
LABEL_7:
  uint64_t v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    std::__shared_weak_count::__release_weak(v5);
  }
}

uint64_t ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(*(uint64_t (**)(void))(*(void *)(a1 - 48) + 16))();
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EACD88;
  MEMORY[0x263E68AF0](a1 + 1);
  return a1;
}

void ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EACD88;
  MEMORY[0x263E68AF0](a1 + 1);

  operator delete(a1);
}

void ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  if (*(void *)(a1 + 56))
  {
    if (!*(void *)(a1 + 80) || (uint64_t v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_26378BF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_26378BF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<TraceManager>::shared_ptr[abi:ne180100]<TraceManager,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1},void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EACDC8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 128);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 120) = a2;
      *(void *)(a2 + 128) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 120) = a2;
  *(void *)(a2 + 128) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_26378C0B0(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[17], v1, (dispatch_function_t)std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1}::operator() const(TraceManager*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_26378C0D8(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<TraceManager *,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager *)#1},std::allocator<TraceManager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<TraceManager *,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager *)#1},std::allocator<TraceManager>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<TraceManager *,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager *)#1},std::allocator<TraceManager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT"
                                "_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1}::operator() const(TraceManager*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void ctu::SharedLoggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EACD88;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void std::__shared_ptr_pointer<BBLogTracker *,std::shared_ptr<BBLogTracker>::__shared_ptr_default_delete<BBLogTracker,BBLogTracker>,std::allocator<BBLogTracker>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BBLogTracker *,std::shared_ptr<BBLogTracker>::__shared_ptr_default_delete<BBLogTracker,BBLogTracker>,std::allocator<BBLogTracker>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<std::string,std::shared_ptr<support::misc::Watchdog>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<support::misc::Watchdog>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<support::misc::Watchdog>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<BBLogTracker *,std::shared_ptr<BBLogTracker>::__shared_ptr_default_delete<BBLogTracker,BBLogTracker>,std::allocator<BBLogTracker>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002637AA48ALL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002637AA48ALL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002637AA48ALL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002637AA48ALL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void ___ZN3ctu20SharedSynchronizableI12TraceManagerE13connect_eventIN5boost8signals26signalIFvNS_2cf11CFSharedRefIK14__CFDictionaryEEENS5_19optional_last_valueIvEEiNSt3__14lessIiEENS4_8functionISC_EENSI_IFvRKNS5_10connectionESB_EEENS5_5mutexEEES1_vJSB_EEEDTcl7connectfp_cvNSF_10shared_ptrIS1_EE_EcvP16dispatch_queue_s_EcvPFT1_DpT2_ELi0EEERT_MT0_FSV_SX_E_block_invoke(void *a1, const void **a2)
{
  uint64_t v3 = (void (*)(void *, CFTypeRef *))a1[5];
  uint64_t v2 = a1[6];
  uint64_t v4 = (void *)(a1[4] + (v2 >> 1) - 120);
  if (v2)
  {
    uint64_t v3 = *(void (**)(void *, CFTypeRef *))(*v4 + v3);
    size_t v5 = *a2;
    CFTypeRef cf = v5;
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  size_t v5 = *a2;
  CFTypeRef cf = v5;
  if (v5) {
LABEL_5:
  }
    CFRetain(v5);
LABEL_6:
  v3(v4, &cf);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_26378C460(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void **boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot(void **a1)
{
  unint64_t v2 = (unint64_t)a1[3];
  if (v2)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void (**)(void **, void **, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 4, a1 + 4, 2);
      }
    }
    a1[3] = 0;
  }
  uint64_t v4 = *a1;
  if (*a1)
  {
    uint64_t v5 = (uint64_t)a1[1];
    uint64_t v6 = *a1;
    if ((void *)v5 != v4)
    {
      do
      {
        v5 -= 24;
        boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v5);
      }
      while ((void *)v5 != v4);
      uint64_t v6 = *a1;
    }
    a1[1] = v4;
    operator delete(v6);
  }
  return a1;
}

uint64_t ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)a1);
  unint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::~shared_ptr(uint64_t a1)
{
  unint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

uint64_t *std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          uint64_t v5 = (uint64_t *)v3[1];
          uint64_t v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          uint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::~connection_body(void *a1)
{
  uint64_t v1 = boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::~connection_body(a1);

  operator delete(v1);
}

BOOL boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::connected(uint64_t a1)
{
  v19[3] = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[8] = v2;
  v14[9] = v2;
  v14[6] = v2;
  v14[7] = v2;
  v14[4] = v2;
  void v14[5] = v2;
  v14[2] = v2;
  v14[3] = v2;
  v14[0] = v2;
  v14[1] = v2;
  uint64_t v3 = *(pthread_mutex_t **)(a1 + 48);
  unint64_t v15 = 10;
  xpc_object_t v16 = (char *)v14;
  uint64_t v17 = 0;
  xpc_object_t v18 = v3;
  pthread_mutex_lock(v3);
  uint64_t v4 = *(uint64_t **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *v4;
    if (*v4 != v4[1])
    {
      while (1)
      {
        memset(v19, 170, 24);
        boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::apply_visitor<boost::signals2::detail::lock_weak_ptr_visitor const>(v5, (uint64_t)v19);
        if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
        {
          if (!(*(unsigned int (**)(void))(**(void **)(v5 + 8) + 24))(*(void *)(v5 + 8))) {
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v6 = *(void *)(v5 + 16);
          if (v6 && atomic_load_explicit((atomic_uint *volatile)(v6 + 8), memory_order_acquire))
          {
LABEL_6:
            char v7 = 0;
            if (LODWORD(v19[0]) == SLODWORD(v19[0]) >> 31) {
              goto LABEL_13;
            }
            goto LABEL_7;
          }
        }
        if (*(unsigned char *)(a1 + 24))
        {
          *(unsigned char *)(a1 + 24) = 0;
          boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>((_DWORD *)a1, v14);
        }
        char v7 = 1;
        if (LODWORD(v19[0]) == SLODWORD(v19[0]) >> 31)
        {
LABEL_13:
          uint64_t v8 = (atomic_uint *)v19[2];
          if (v19[2])
          {
            if (atomic_fetch_add((atomic_uint *volatile)(v19[2] + 8), 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v8 + 16))(v8);
              if (atomic_fetch_add(v8 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v8 + 24))(v8);
              }
            }
          }
          goto LABEL_17;
        }
LABEL_7:
        if (v19[1]) {
          (*(void (**)(void))(*(void *)v19[1] + 8))(v19[1]);
        }
LABEL_17:
        if ((v7 & 1) == 0)
        {
          v5 += 24;
          if (v5 != *(void *)(*(void *)(a1 + 32) + 8)) {
            continue;
          }
        }
        break;
      }
    }
  }
  int v9 = *(unsigned __int8 *)(a1 + 24);
  pthread_mutex_unlock(v18);
  int v10 = v16;
  if (v16)
  {
    if (v17 - 1 >= 0)
    {
      uint64_t v11 = &v16[16 * v17];
      do
      {
        __int16 v12 = (atomic_uint *)*((void *)v11 - 1);
        if (v12)
        {
          if (atomic_fetch_add(v12 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v12 + 16))(v12);
            if (atomic_fetch_add(v12 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v12 + 24))(v12);
            }
          }
        }
        v11 -= 16;
      }
      while (v11 > v10);
    }
    if (v15 >= 0xB) {
      operator delete(v16);
    }
  }
  return v9 != 0;
}

void sub_26378CCC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::lock(uint64_t a1)
{
  return pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::unlock(uint64_t a1)
{
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::release_slot@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(result + 40);
  long long v2 = (void *)(result + 32);
  *a2 = *(void *)(result + 32);
  a2[1] = v3;
  if (v3)
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v3 + 8), 1u, memory_order_relaxed);
    uint64_t v4 = *(atomic_uint **)(result + 40);
    *long long v2 = 0;
    *(void *)(result + 40) = 0;
    if (v4 && atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1)
    {
      size_t result = (*(uint64_t (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
      if (atomic_fetch_add(v4 + 3, 0xFFFFFFFF) == 1) {
        return (*(uint64_t (**)(atomic_uint *))(*(void *)v4 + 24))(v4);
      }
    }
  }
  else
  {
    *long long v2 = 0;
    *(void *)(result + 40) = 0;
  }
  return result;
}

void boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void ***)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = (unint64_t)v1[3];
    if (v2)
    {
      if ((v2 & 1) == 0)
      {
        uint64_t v3 = *(void (**)(void **, void **, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
        if (v3) {
          v3(v1 + 4, v1 + 4, 2);
        }
      }
      v1[3] = 0;
    }
    uint64_t v4 = *v1;
    if (*v1)
    {
      uint64_t v5 = (uint64_t)v1[1];
      uint64_t v6 = *v1;
      if ((void *)v5 != v4)
      {
        do
        {
          v5 -= 24;
          boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v5);
        }
        while ((void *)v5 != v4);
        uint64_t v6 = *v1;
      }
      v1[1] = v4;
      operator delete(v6);
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::get_untyped_deleter()
{
  return 0;
}

void *boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::~connection_body(void *a1)
{
  *a1 = &unk_270EACF68;
  unint64_t v2 = (atomic_uint *)a1[7];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  uint64_t v3 = (atomic_uint *)a1[5];
  if (v3)
  {
    if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
      }
    }
  }
  *a1 = &unk_270EA54D0;
  uint64_t v4 = (atomic_uint *)a1[2];
  if (v4 && atomic_fetch_add(v4 + 3, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v4 + 24))(v4);
  }
  return a1;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>::~function(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 1, a1 + 1, 2);
      }
    }
    *a1 = 0;
  }
  return a1;
}

void boost::detail::function::functor_manager<ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::manage(uint64_t a1, _WORD *a2, unsigned int a3)
{
  if (a3 == 4) {
    goto LABEL_2;
  }
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      int v9 = (const char *)(*(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v9 == (const char *)(0x80000002637AA8D3 & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v9, (const char *)(0x80000002637AA8D3 & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(void *)a2 = a1;
      }
      else
      {
        *(void *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      dispatch_release(*(dispatch_object_t *)a2);
      uint64_t v8 = (const void *)*((void *)a2 + 1);
      if (v8) {
LABEL_9:
      }
        _Block_release(v8);
    }
  }
  else
  {
    uint64_t v6 = *(NSObject **)a1;
    char v7 = *(void **)(a1 + 8);
    *(void *)a2 = *(void *)a1;
    if (v7)
    {
      char v7 = _Block_copy(v7);
      uint64_t v6 = *(NSObject **)a2;
    }
    *((void *)a2 + 1) = v7;
    dispatch_retain(v6);
    if (a3 == 1)
    {
      dispatch_release(*(dispatch_object_t *)a1);
      uint64_t v8 = *(const void **)(a1 + 8);
      if (v8) {
        goto LABEL_9;
      }
    }
  }
}

void boost::detail::function::void_function_obj_invoker1<ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>,void,ctu::cf::CFSharedRef<__CFDictionary const>>::invoke(uint64_t a1, const void **a2)
{
  uint64_t v2 = *a2;
  xpc_object_t v22 = *a2;
  *a2 = 0;
  uint64_t v4 = *(NSObject **)a1;
  uint64_t v3 = *(const void **)(a1 + 8);
  if (!v3)
  {
    uint64_t v6 = 0;
LABEL_10:
    char v17 = 1;
    *(void *)&long long v23 = 0;
    if (!v2) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v5 = _Block_copy(v3);
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  char v7 = _Block_copy(v5);
  uint64_t v8 = v7;
  if (!v7)
  {
    char v17 = 0;
    *(void *)&long long v23 = 0;
    if (!v2) {
      goto LABEL_23;
    }
LABEL_22:
    CFRetain(v2);
    goto LABEL_23;
  }
  int v9 = _Block_copy(v7);
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = _Block_copy(v9);
    __int16 v12 = v11;
    if (v11)
    {
      uint64_t v13 = _Block_copy(v11);
      uint64_t v14 = v13;
      if (v13)
      {
        unint64_t v15 = _Block_copy(v13);
        xpc_object_t v16 = v15;
        if (v15)
        {
          *(void *)&long long v23 = _Block_copy(v15);
          _Block_release(v16);
        }
        else
        {
          *(void *)&long long v23 = 0;
        }
        _Block_release(v14);
      }
      else
      {
        *(void *)&long long v23 = 0;
      }
      _Block_release(v12);
    }
    else
    {
      *(void *)&long long v23 = 0;
    }
    _Block_release(v10);
  }
  else
  {
    *(void *)&long long v23 = 0;
  }
  _Block_release(v8);
  char v17 = 0;
  if (v2) {
    goto LABEL_22;
  }
LABEL_23:
  xpc_object_t v18 = operator new(8uLL);
  *xpc_object_t v18 = v2;
  if (v2) {
    CFRetain(v2);
  }
  xpc_object_t v19 = (char *)operator new(0x20uLL);
  uint64_t v20 = v19;
  *(void *)xpc_object_t v19 = 0;
  if (boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable)
  {
    *(void *)xpc_object_t v19 = boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable;
    if (boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable)
    {
      *(_OWORD *)(v19 + 8) = v23;
      *((void *)v19 + 3) = v24;
    }
    else
    {
      (*(void (**)(long long *, char *, void))((unint64_t)boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable & 0xFFFFFFFFFFFFFFFELL))(&v23, v19 + 8, 0);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEES8__block_invoke;
  block[3] = &__block_descriptor_tmp_138;
  block[4] = v20;
  block[5] = v18;
  dispatch_async(v4, block);
  if (v2) {
    CFRelease(v2);
  }
  if (boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable)
  {
    if ((boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable & 1) == 0)
    {
      uint64_t v21 = *(void (**)(long long *, long long *, uint64_t))((unint64_t)boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable & 0xFFFFFFFFFFFFFFFELL);
      if (v21) {
        v21(&v23, &v23, 2);
      }
    }
  }
  if ((v17 & 1) == 0)
  {
    _Block_release(v6);
    uint64_t v2 = v22;
  }
  if (v2) {
    CFRelease(v2);
  }
}

void sub_26378D598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, uint64_t a11)
{
  operator delete(v12);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a10);
  boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>::~function(&a11);
  if ((v13 & 1) == 0) {
    _Block_release(v11);
  }
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)&a9);
  _Unwind_Resume(a1);
}

void ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEES8__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = **(std::runtime_error_vtbl ***)(a1 + 40);
  if (v3) {
    CFRetain(v3);
  }
  if (!*v2)
  {
    std::runtime_error::runtime_error(&cf, "call to empty boost::function");
    cf.__vftable = (std::runtime_error_vtbl *)&unk_270EA5920;
    boost::throw_exception<boost::bad_function_call>(&cf);
  }
  uint64_t v4 = *(void (**)(void *, std::runtime_error *))((*v2 & 0xFFFFFFFFFFFFFFFELL) + 8);
  cf.__vftable = v3;
  v4(v2 + 1, &cf);
  if (cf.__vftable) {
    CFRelease(cf.__vftable);
  }
  uint64_t v5 = *(uint64_t **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *v5;
    if (*v5)
    {
      if ((v6 & 1) == 0)
      {
        char v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 & 0xFFFFFFFFFFFFFFFELL);
        if (v7) {
          v7(v5 + 1, v5 + 1, 2);
        }
      }
      uint64_t *v5 = 0;
    }
    operator delete(v5);
  }
  uint64_t v8 = *(CFTypeRef **)(a1 + 40);
  if (v8)
  {
    if (*v8) {
      CFRelease(*v8);
    }
    operator delete(v8);
  }
}

void sub_26378D708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, std::runtime_error a11)
{
}

void sub_26378D724(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_26378D740(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void boost::detail::function::functor_manager<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::manage(void **a1, _WORD *a2, unsigned int a3)
{
  if (a3 == 4) {
    goto LABEL_2;
  }
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      uint64_t v8 = (const char *)(*(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v8 == (const char *)(0x80000002637AA937 & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v8, (const char *)(0x80000002637AA937 & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(void *)a2 = a1;
      }
      else
      {
        *(void *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      char v7 = *(void **)a2;
      if (*(void *)a2) {
LABEL_9:
      }
        _Block_release(v7);
    }
  }
  else
  {
    uint64_t v6 = *a1;
    if (*a1) {
      uint64_t v6 = _Block_copy(v6);
    }
    *(void *)a2 = v6;
    if (a3 == 1)
    {
      char v7 = *a1;
      if (*a1) {
        goto LABEL_9;
      }
    }
  }
}

void boost::detail::function::void_function_obj_invoker1<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>,void,ctu::cf::CFSharedRef<__CFDictionary const>>::invoke(uint64_t *a1, CFTypeRef *a2)
{
  uint64_t v2 = *a1;
  CFTypeRef cf = *a2;
  *a2 = 0;
  (*(void (**)(void))(v2 + 16))();
  if (cf) {
    CFRelease(cf);
  }
}

void sub_26378D8AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::move_assign(uint64_t result, uint64_t *a2)
{
  if (a2 != (uint64_t *)result)
  {
    uint64_t v2 = a2;
    uint64_t v3 = (uint64_t *)result;
    uint64_t v4 = *a2;
    if (*a2)
    {
      *(void *)uint64_t result = v4;
      if (v4)
      {
        long long v7 = *(_OWORD *)(a2 + 1);
        *(void *)(result + 24) = a2[3];
        *(_OWORD *)(result + 8) = v7;
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v4 & 0xFFFFFFFFFFFFFFFELL))(a2 + 1, result + 8, 1);
      }
    }
    else
    {
      uint64_t v5 = *(void *)result;
      if (!*(void *)result) {
        return result;
      }
      if ((v5 & 1) == 0)
      {
        uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 & 0xFFFFFFFFFFFFFFFELL);
        if (v6) {
          uint64_t result = v6(result + 8, result + 8, 2);
        }
      }
      uint64_t v2 = v3;
    }
    *uint64_t v2 = 0;
  }
  return result;
}

void sub_26378D964(void *a1)
{
  __cxa_begin_catch(a1);
  *uint64_t v1 = 0;
  __cxa_rethrow();
}

void sub_26378D974(_Unwind_Exception *a1)
{
}

uint64_t *boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::~function1(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 1, a1 + 1, 2);
      }
    }
    *a1 = 0;
  }
  return a1;
}

void *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::~foreign_weak_ptr_impl(void *a1)
{
  *a1 = &unk_270EAD0C0;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::~foreign_weak_ptr_impl(void *__p)
{
  void *__p = &unk_270EAD0C0;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::lock(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0;
LABEL_6:
  long long v7 = operator new(0x18uLL);
  *long long v7 = &unk_270EAD110;
  v7[1] = v6;
  v7[2] = v5;
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    *a2 = v7;
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    *a2 = v7;
  }
}

void sub_26378DB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::expired(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  return !v1 || *(void *)(v1 + 8) == -1;
}

void *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EAD0C0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<TraceManager>>::~foreign_shared_ptr_impl(void *result)
{
  uint64_t v1 = result;
  void *result = &unk_270EAD110;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<TraceManager>>::~foreign_shared_ptr_impl(void *__p)
{
  uint64_t v1 = __p;
  void *__p = &unk_270EAD110;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    long long __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

void *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<TraceManager>>::clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_270EAD110;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void *___ZNK3ctu20SharedSynchronizableI12TraceManagerE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ctu::SharedSynchronizable<TraceManager>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (v5 = *a1, (uint64_t v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  uint64_t v8 = a1[2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_270EAD148;
  block[5] = v5;
  __int16 v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  block[4] = a2;
  dispatch_async(v8, block);
  int v10 = v12;
  if (!v12 || atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_8:
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_8;
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c41_ZTSNSt3__110shared_ptrIK12TraceManagerEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c41_ZTSNSt3__110shared_ptrIK12TraceManagerEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN9analytics29registerCallbackForTimedEventI12TraceManagerEEvPKcNS_9TimerTypeENSt3__18weak_ptrIT_EEN8dispatch5queueEU13block_pointerFvNS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[5];
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (!a1[4]) {
        goto LABEL_14;
      }
      uint64_t v7 = a1[6];
      if (*(char *)(a2 + 23) < 0) {
        std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      }
      else {
        std::string v8 = *(std::string *)a2;
      }
      (*(void (**)(uint64_t, std::string *))(v7 + 16))(v7, &v8);
      if ((SHIBYTE(v8.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_14:
        if (atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          return;
        }
LABEL_11:
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        return;
      }
      operator delete(v8.__r_.__value_.__l.__data_);
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_11;
      }
    }
  }
}

void sub_26378E0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_26378E110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c37_ZTSNSt3__18weak_ptrI12TraceManagerEE48c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(void *a1, void *a2)
{
  uint64_t v3 = a2[5];
  a1[4] = a2[4];
  a1[5] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t result = (void *)a2[6];
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  a1[6] = result;
  return result;
}

void __destroy_helper_block_e8_32c37_ZTSNSt3__18weak_ptrI12TraceManagerEE48c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::initialize(dispatch::group_session)::$_0>(TraceManager::initialize(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::initialize(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::initialize(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count ****)a1;
  TraceManager::finishInitialization_sync(**(std::__shared_weak_count ****)a1);
  operator delete(v2);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (void *)a1;
  }
  else
  {
    uint64_t v4 = (void *)a1;
  }
  operator delete(v4);
}

void sub_26378E290(_Unwind_Exception *a1)
{
  operator delete(v2);
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void ctu::cf::insert<char const*,int>(__CFDictionary *a1, const __CFString **a2, int a3, const __CFAllocator *a4, const __CFAllocator *a5)
{
  CFNumberRef v12 = 0;
  ctu::cf::convert_copy((ctu::cf *)&v12, a2, (const char *)0x8000100, (uint64_t)a4, a5);
  CFNumberRef v8 = v12;
  int valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(a4, kCFNumberIntType, &valuePtr);
  CFNumberRef v10 = v9;
  CFNumberRef v12 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    CFDictionaryAddValue(a1, v8, v9);
  }
  CFRelease(v10);
LABEL_8:
  if (v8) {
    CFRelease(v8);
  }
}

void sub_26378E39C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_26378E3C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void ctu::cf::insert<char const*,BOOL>(__CFDictionary *a1, const __CFString **a2, int a3, uint64_t a4, const __CFAllocator *a5)
{
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, a2, (const char *)0x8000100, a4, a5);
  uint64_t v7 = key;
  CFNumberRef v8 = (void **)MEMORY[0x263EFFB40];
  if (!a3) {
    CFNumberRef v8 = (void **)MEMORY[0x263EFFB38];
  }
  CFNumberRef v9 = *v8;
  key = *v8;
  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    CFDictionaryAddValue(a1, v7, v9);
  }
  CFRelease(v9);
LABEL_10:
  if (v7) {
    CFRelease(v7);
  }
}

void sub_26378E47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

void _ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_16collectLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb0_E3__1EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 24);
  memset(&v56, 0, sizeof(v56));
  xpc_object_t v55 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  uint64_t v6 = MEMORY[0x263EF8708];
  if (v4)
  {
    xpc_object_t v55 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v55 = v5;
    if (!v5)
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x263E6A240](v5) == v6)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v7 = xpc_null_create();
LABEL_8:
  xpc_object_t v55 = v7;
LABEL_9:
  xpc_release(v5);
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long __p = v8;
  long long v54 = v8;
  CFNumberRef v9 = *(void **)(v2 + 16);
  xpc_object_t object = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::HelperClient::perform();
  xpc_release(object);
  xpc_object_t object = 0;
  BOOL v11 = (const char **)MEMORY[0x263F20668];
  CFNumberRef v12 = (uint64_t *)MEMORY[0x263EFFB08];
  if (!LODWORD(__p[0]) && MEMORY[0x263E6A240](v55) == v6)
  {
    xpc_object_t value = xpc_dictionary_get_value(v55, *v11);
    xpc_object_t aBlock = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t aBlock = xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)&v42, (xpc *)&aBlock, (const object *)"", v14);
    if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v56.__r_.__value_.__l.__data_);
    }
    std::string v56 = v42;
    *((unsigned char *)&v42.__r_.__value_.__s + 23) = 0;
    v42.__r_.__value_.__s.__data_[0] = 0;
    xpc_release(aBlock);
    if (ResetInfo::reasonMatchesAtLeastOneApplicablePattern(2, (uint64_t)&v56, (long long **)(*(void *)(v3 + 288) + 48)))ctu::cf::update<char const*,BOOL>(*(__CFDictionary **)(v2 + 32), (const __CFString **)*MEMORY[0x263F262B8], 1, *v12, v15); {
    if (ResetInfo::reasonMatchesAtLeastOneApplicablePattern(4, (uint64_t)&v56, (long long **)(*(void *)(v3 + 288) + 48)))ctu::cf::update<char const*,BOOL>(*(__CFDictionary **)(v2 + 32), (const __CFString **)*MEMORY[0x263F262B0], 1, *v12, v10);
    }
  }
  xpc_object_t v16 = *(__CFDictionary **)(v2 + 32);
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v42, v56.__r_.__value_.__l.__data_, v56.__r_.__value_.__l.__size_);
  }
  else {
    std::string v42 = v56;
  }
  ctu::cf::insert<char const*,std::string>(v16, (const __CFString **)*MEMORY[0x263F26298], (uint64_t)&v42, *v12, v10);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
  xpc_object_t v17 = xpc_string_create("");
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_dictionary_set_value(*(xpc_object_t *)(v2 + 16), *v11, v17);
  xpc_object_t v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  xpc_object_t v19 = *(void **)(v2 + 16);
  xpc_object_t v51 = v19;
  if (v19) {
    xpc_retain(v19);
  }
  else {
    xpc_object_t v51 = xpc_null_create();
  }
  xpc_object_t aBlock = 0;
  dispatch_object_t v50 = 0;
  abm::HelperClient::perform();
  if (v50) {
    dispatch_release(v50);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(v51);
  xpc_object_t v51 = 0;
  uint64_t v20 = *(std::__shared_weak_count **)(v3 + 128);
  if (!v20 || (v21 = *(void *)(v3 + 120), (xpc_object_t v22 = std::__shared_weak_count::lock(v20)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v23 = v22;
  p_shared_weak_owners = &v22->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v22->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v23);
  }
  v42.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
  v42.__r_.__value_.__l.__size_ = 1174405120;
  v42.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke;
  xpc_object_t v43 = &__block_descriptor_tmp_165;
  uint64_t v44 = v3;
  uint64_t v45 = v21;
  std::string::size_type v46 = v23;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  uint64_t v25 = *(void **)(v2 + 40);
  if (v25) {
    uint64_t v25 = _Block_copy(v25);
  }
  xpc_object_t v47 = v25;
  int v26 = *(const void **)(v2 + 32);
  CFTypeRef cf = v26;
  if (v26) {
    CFRetain(v26);
  }
  uint64_t v27 = _Block_copy(&v42);
  uint64_t v28 = *(NSObject **)(v3 + 136);
  if (v28) {
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  }
  xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
  if (v29 || (xpc_object_t v29 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v29) == v6)
    {
      xpc_retain(v29);
      xpc_object_t v30 = v29;
    }
    else
    {
      xpc_object_t v30 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v30 = xpc_null_create();
    xpc_object_t v29 = 0;
  }
  xpc_release(v29);
  xpc_object_t v31 = (const char *)(v2 + 48);
  if (*(char *)(v2 + 71) < 0) {
    xpc_object_t v31 = *(const char **)v31;
  }
  xpc_object_t v32 = xpc_string_create(v31);
  if (!v32) {
    xpc_object_t v32 = xpc_null_create();
  }
  xpc_dictionary_set_value(v30, (const char *)*MEMORY[0x263F20600], v32);
  xpc_object_t v33 = xpc_null_create();
  xpc_release(v32);
  xpc_release(v33);
  xpc_object_t v41 = v30;
  if (v30)
  {
    xpc_retain(v30);
    char v40 = 0;
    if (v27) {
      goto LABEL_59;
    }
  }
  else
  {
    char v40 = 0;
    xpc_object_t v41 = xpc_null_create();
    if (v27)
    {
LABEL_59:
      uint64_t v34 = _Block_copy(v27);
      uint64_t v35 = *MEMORY[0x263F205B0];
      int v38 = v34;
      long long v39 = v28;
      if (!v28) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
  }
  uint64_t v34 = 0;
  uint64_t v35 = *MEMORY[0x263F205B0];
  int v38 = 0;
  long long v39 = v28;
  if (v28) {
LABEL_60:
  }
    dispatch_retain(v28);
LABEL_61:
  TraceManager::runOnHelper_sync((void *)v3, (const char *)9, v35, 0, 1, &v41, &v40, &v38);
  if (v28) {
    dispatch_release(v28);
  }
  if (v34) {
    _Block_release(v34);
  }
  xpc_release(v41);
  xpc_object_t v41 = 0;
  xpc_release(v30);
  if (v28) {
    dispatch_release(v28);
  }
  if (v27) {
    _Block_release(v27);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v47) {
    _Block_release(v47);
  }
  if (v46) {
    std::__shared_weak_count::__release_weak(v46);
  }
  std::__shared_weak_count::__release_weak(v23);
  if (SHIBYTE(v54) < 0) {
    operator delete(__p[1]);
  }
  xpc_release(v55);
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  size_t v36 = (void *)_ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev(v2);
  operator delete(v36);
  uint64_t v37 = (std::__shared_weak_count *)a1[2];
  if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
  }
  operator delete(a1);
}

void sub_26378EAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,void *aBlock,CFTypeRef cf,uint64_t a25,xpc_object_t object,dispatch_object_t a27,xpc_object_t a28,xpc_object_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  xpc_release(object);
  if (a36 < 0) {
    operator delete(__p);
  }
  xpc_release(*(xpc_object_t *)(v38 - 120));
  if (*(char *)(v38 - 89) < 0) {
    operator delete(*(void **)(v38 - 112));
  }
  char v40 = (void *)_ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev(v37);
  operator delete(v40);
  xpc_object_t v41 = (std::__shared_weak_count *)v36[2];
  if (v41)
  {
    if (!atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  operator delete(v36);
  _Unwind_Resume(a1);
}

void ___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (!v3 || (uint64_t v28 = std::__shared_weak_count::lock(v3)) == 0 || (v27 = a1[5]) == 0)
  {
    xpc_object_t v9 = xpc_null_create();
    uint64_t v10 = a1[7];
    xpc_object_t v29 = v9;
    xpc_object_t v11 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v10 + 16))(v10, 3760250880, &v29);
    xpc_release(v29);
    xpc_release(v11);
    goto LABEL_10;
  }
  xpc_object_t v4 = (const void *)*MEMORY[0x263F26270];
  size_t v5 = strlen((const char *)*MEMORY[0x263F26270]);
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v6 = (void *)v5;
  if (v5 >= 0x17)
  {
    uint64_t v13 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v13 = v5 | 7;
    }
    uint64_t v14 = v13 + 1;
    xpc_object_t v7 = (void **)operator new(v13 + 1);
    __dst[1] = v6;
    unint64_t v26 = v14 | 0x8000000000000000;
    __dst[0] = v7;
LABEL_17:
    memmove(v7, v4, (size_t)v6);
    *((unsigned char *)v6 + (void)v7) = 0;
    long long v8 = (const void *)a1[8];
    if (!v8) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  HIBYTE(v26) = v5;
  xpc_object_t v7 = __dst;
  if (v5) {
    goto LABEL_17;
  }
  LOBYTE(__dst[0]) = 0;
  long long v8 = (const void *)a1[8];
  if (!v8) {
    goto LABEL_20;
  }
LABEL_18:
  CFTypeID v15 = CFGetTypeID(v8);
  if (v15 == CFDictionaryGetTypeID())
  {
    CFTypeRef cf = v8;
    CFRetain(v8);
    goto LABEL_21;
  }
LABEL_20:
  CFTypeRef cf = 0;
LABEL_21:
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 1174405120;
  v20[2] = ___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke_2;
  v20[3] = &__block_descriptor_tmp_164;
  xpc_object_t v16 = (const void *)a1[7];
  if (!v16)
  {
    xpc_object_t v18 = (const void *)a1[8];
    uint64_t v21 = 0;
    CFTypeRef v22 = v18;
    if (!v18) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  xpc_object_t v17 = _Block_copy(v16);
  xpc_object_t v18 = (const void *)a1[8];
  uint64_t v21 = v17;
  CFTypeRef v22 = v18;
  if (v18) {
LABEL_25:
  }
    CFRetain(v18);
LABEL_26:
  xpc_object_t aBlock = _Block_copy(v20);
  Service::broadcastEvent(v2, (uint64_t)__dst, &cf, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (SHIBYTE(v26) < 0)
  {
    operator delete(__dst[0]);
    CFTypeRef v19 = v22;
    if (!v22) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  CFTypeRef v19 = v22;
  if (v22) {
LABEL_34:
  }
    CFRelease(v19);
LABEL_35:
  if (v21) {
    _Block_release(v21);
  }
LABEL_10:
  CFNumberRef v12 = v28;
  if (v28)
  {
    if (!atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_26378F014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *aBlock, const void *a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v22);
  if (a13) {
    _Block_release(a13);
  }
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a16);
  if (a22 < 0)
  {
    operator delete(__p);
    std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v23 - 72);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v23 - 72);
  _Unwind_Resume(a1);
}

void ___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke_2(uint64_t a1, const void *a2)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  unsigned int v4 = 0;
  ctu::cf_to_xpc((uint64_t *)&object, *(ctu **)(a1 + 40), a2);
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::object>(v2, &v4, &object);
  xpc_release(object);
}

void sub_26378F118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

CFTypeRef __copy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE40c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(const void **)(a2 + 32);
  if (!v4)
  {
    CFTypeRef result = *(CFTypeRef *)(a2 + 40);
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = result;
    if (!result) {
      return result;
    }
    return CFRetain(result);
  }
  size_t v5 = _Block_copy(v4);
  CFTypeRef result = *(CFTypeRef *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = result;
  if (result) {
    return CFRetain(result);
  }
  return result;
}

void __destroy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE40c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
}

CFTypeRef __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(void *a1, void *a2)
{
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  size_t v5 = (const void *)a2[7];
  if (!v5)
  {
    CFTypeRef result = (CFTypeRef)a2[8];
    a1[7] = 0;
    a1[8] = result;
    if (!result) {
      return result;
    }
    return CFRetain(result);
  }
  uint64_t v6 = _Block_copy(v5);
  CFTypeRef result = (CFTypeRef)a2[8];
  a1[7] = v6;
  a1[8] = result;
  if (result) {
    return CFRetain(result);
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(void *a1)
{
  uint64_t v2 = (const void *)a1[8];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[7];
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void _ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_24collectBasebandLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb1_E3__2EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v30 = v2;
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(NSObject **)(*(void *)v2 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_26368A000, v4, OS_LOG_TYPE_DEFAULT, "#I Snapshot of baseband trace complete", buf, 2u);
  }
  size_t v5 = (const char *)(v2 + 8);
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)xpc_object_t v48 = v6;
  *(_OWORD *)&v48[16] = v6;
  if (*(char *)(v2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v48, *(const std::string::value_type **)(v2 + 8), *(void *)(v2 + 16));
  }
  else
  {
    long long v7 = *(_OWORD *)v5;
    *(void *)&v48[16] = *(void *)(v2 + 24);
    *(_OWORD *)xpc_object_t v48 = v7;
  }
  long long v8 = *(void **)(v2 + 32);
  if (v8) {
    long long v8 = _Block_copy(v8);
  }
  *(void *)&v48[24] = v8;
  if (!*(_DWORD *)(v2 + 40))
  {
    _ZZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvENKUlvE_clEv((uint64_t)v48);
    goto LABEL_65;
  }
  *(void *)std::string buf = MEMORY[0x263EF8330];
  uint64_t v39 = 1174405120;
  char v40 = ___ZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEv_block_invoke;
  xpc_object_t v41 = &__block_descriptor_tmp_166_0;
  uint64_t v10 = *(void *)(v2 + 48);
  xpc_object_t v9 = *(std::__shared_weak_count **)(v2 + 56);
  uint64_t v42 = v3;
  uint64_t v43 = v10;
  uint64_t v44 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v11 = *(void **)(v2 + 32);
  if (v11) {
    xpc_object_t v11 = _Block_copy(v11);
  }
  uint64_t v45 = v11;
  if ((v48[23] & 0x80000000) != 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v48, *(std::string::size_type *)&v48[8]);
  }
  else {
    std::string __p = *(std::string *)v48;
  }
  CFNumberRef v12 = *(void **)&v48[24];
  if (*(void *)&v48[24]) {
    CFNumberRef v12 = _Block_copy(*(const void **)&v48[24]);
  }
  xpc_object_t v47 = v12;
  uint64_t v13 = _Block_copy(buf);
  uint64_t v14 = *(NSObject **)(v3 + 136);
  if (v14) {
    dispatch_retain(v14);
  }
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  if (v15 || (xpc_object_t v15 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v15) == MEMORY[0x263EF8708])
    {
      xpc_retain(v15);
      xpc_object_t v16 = v15;
    }
    else
    {
      xpc_object_t v16 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v16 = xpc_null_create();
    xpc_object_t v15 = 0;
  }
  xpc_release(v15);
  if (*(char *)(v2 + 31) < 0) {
    size_t v5 = *(const char **)v5;
  }
  xpc_object_t v17 = xpc_string_create(v5);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_dictionary_set_value(v16, (const char *)*MEMORY[0x263F20618], v17);
  xpc_object_t v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  CFTypeRef v19 = (const char *)(v2 + 64);
  if (*(char *)(v2 + 87) < 0) {
    CFTypeRef v19 = *(const char **)v19;
  }
  xpc_object_t v20 = xpc_string_create(v19);
  if (!v20) {
    xpc_object_t v20 = xpc_null_create();
  }
  xpc_dictionary_set_value(v16, (const char *)*MEMORY[0x263F20630], v20);
  xpc_object_t v21 = xpc_null_create();
  xpc_release(v20);
  xpc_release(v21);
  xpc_object_t v22 = xpc_int64_create(*(int *)(v2 + 40));
  if (!v22) {
    xpc_object_t v22 = xpc_null_create();
  }
  xpc_dictionary_set_value(v16, (const char *)*MEMORY[0x263F206F8], v22);
  xpc_object_t v23 = xpc_null_create();
  xpc_release(v22);
  xpc_release(v23);
  xpc_object_t v24 = xpc_BOOL_create(*(unsigned char *)(v2 + 88));
  if (!v24) {
    xpc_object_t v24 = xpc_null_create();
  }
  xpc_dictionary_set_value(v16, (const char *)*MEMORY[0x263F205A8], v24);
  xpc_object_t v25 = xpc_null_create();
  xpc_release(v24);
  xpc_release(v25);
  unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  GetABMLogServer(&v34);
  abm::HelperClient::create();
  unint64_t v26 = v35;
  if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
    xpc_object_t v33 = v16;
    if (v16)
    {
LABEL_42:
      xpc_retain(v16);
      if (v13) {
        goto LABEL_43;
      }
      goto LABEL_75;
    }
  }
  else
  {
    xpc_object_t v33 = v16;
    if (v16) {
      goto LABEL_42;
    }
  }
  xpc_object_t v33 = xpc_null_create();
  if (v13)
  {
LABEL_43:
    xpc_object_t aBlock = _Block_copy(v13);
    dispatch_object_t object = v14;
    if (!v14) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_75:
  xpc_object_t aBlock = 0;
  dispatch_object_t object = v14;
  if (v14) {
LABEL_44:
  }
    dispatch_retain(v14);
LABEL_45:
  abm::HelperClient::perform();
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(v33);
  xpc_object_t v33 = 0;
  uint64_t v27 = (std::__shared_weak_count *)v37;
  if (v37 && !atomic_fetch_add((atomic_ullong *volatile)(v37 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  xpc_release(v16);
  if (v14) {
    dispatch_release(v14);
  }
  if (v13) {
    _Block_release(v13);
  }
  if (v47) {
    _Block_release(v47);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    uint64_t v28 = v45;
    if (!v45) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  uint64_t v28 = v45;
  if (v45) {
LABEL_62:
  }
    _Block_release(v28);
LABEL_63:
  if (v44) {
    std::__shared_weak_count::__release_weak(v44);
  }
LABEL_65:
  if (*(void *)&v48[24]) {
    _Block_release(*(const void **)&v48[24]);
  }
  if ((v48[23] & 0x80000000) != 0) {
    operator delete(*(void **)v48);
  }
  _ZNSt3__110unique_ptrIZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS3_EEEEUb1_E3__2NS_14default_deleteIS9_EEED1B8ne180100Ev(&v30);
  xpc_object_t v29 = (std::__shared_weak_count *)a1[2];
  if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }
  operator delete(a1);
}

void sub_26378F840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, dispatch_object_t object, xpc_object_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23,void *aBlock,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (a23) {
    std::__shared_weak_count::__release_weak(a23);
  }
  uint64_t v34 = *(const void **)(v32 - 72);
  if (v34) {
    _Block_release(v34);
  }
  if (*(char *)(v32 - 73) < 0) {
    operator delete(*(void **)(v32 - 96));
  }
  _ZNSt3__110unique_ptrIZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS3_EEEEUb1_E3__2NS_14default_deleteIS9_EEED1B8ne180100Ev(&a9);
  uint64_t v35 = (std::__shared_weak_count *)v31[2];
  if (v35)
  {
    if (!atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  operator delete(v31);
  _Unwind_Resume(a1);
}

uint64_t *_ZNSt3__110unique_ptrIZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS3_EEEEUb1_E3__2NS_14default_deleteIS9_EEED1B8ne180100Ev(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*(char *)(v2 + 87) < 0) {
      operator delete(*(void **)(v2 + 64));
    }
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 56);
    if (v3) {
      std::__shared_weak_count::__release_weak(v3);
    }
    uint64_t v4 = *(const void **)(v2 + 32);
    if (v4) {
      _Block_release(v4);
    }
    if (*(char *)(v2 + 31) < 0) {
      operator delete(*(void **)(v2 + 8));
    }
    operator delete((void *)v2);
  }
  return a1;
}

void _ZZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvENKUlvE_clEv(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    xpc_object_t xdict = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t xdict = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x263E6A240](v3) == MEMORY[0x263EF8708])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  xpc_object_t xdict = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_string_create((const char *)*MEMORY[0x263F204D0]);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x263F26218], v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  long long v7 = (const char *)a1;
  if (*(char *)(a1 + 23) < 0) {
    long long v7 = *(const char **)a1;
  }
  xpc_object_t v8 = xpc_string_create(v7);
  if (!v8) {
    xpc_object_t v8 = xpc_null_create();
  }
  xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x263F26030], v8);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  unsigned int v10 = 0;
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>((uint64_t *)(a1 + 24), &v10, &xdict);
  xpc_release(xdict);
}

void sub_26378FC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void ___ZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEv_block_invoke(void *a1, unsigned int *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[4];
  uint64_t v15 = 0;
  xpc_object_t v16 = 0;
  xpc_object_t v4 = (std::__shared_weak_count *)a1[6];
  if (!v4)
  {
    xpc_object_t v6 = 0;
    goto LABEL_12;
  }
  xpc_object_t v6 = std::__shared_weak_count::lock(v4);
  xpc_object_t v16 = v6;
  if (!v6 || (uint64_t v15 = a1[5]) == 0)
  {
LABEL_12:
    xpc_object_t v10 = xpc_null_create();
    uint64_t v11 = a1[7];
    __p[0] = v10;
    xpc_object_t v12 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, void **))(v11 + 16))(v11, 3760250880, __p);
    xpc_release(__p[0]);
    xpc_release(v12);
    if (!v6) {
      return;
    }
    goto LABEL_17;
  }
  uint64_t v7 = *a2;
  xpc_object_t v8 = *(NSObject **)(v3 + 88);
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      TelephonyXPC::Result::toString(v7, (uint64_t)__p);
      if (v14 >= 0) {
        xpc_object_t v9 = __p;
      }
      else {
        xpc_object_t v9 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 136315138;
      xpc_object_t v18 = v9;
      _os_log_error_impl(&dword_26368A000, v8, OS_LOG_TYPE_ERROR, "Failed to archive logs. Result: %s", buf, 0xCu);
      if (v14 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(__p[0]) = 0;
    _os_log_debug_impl(&dword_26368A000, v8, OS_LOG_TYPE_DEBUG, "#D Compression is done.", (uint8_t *)__p, 2u);
  }
  _ZZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvENKUlvE_clEv((uint64_t)(a1 + 8));
LABEL_17:
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_26378FE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
}

void sub_26378FEC8(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void *__copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c124_ZTSZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvEUlvE_(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v5 = *(void **)(a2 + 56);
  if (v5) {
    xpc_object_t v5 = _Block_copy(v5);
  }
  a1[7] = v5;
  xpc_object_t v6 = (std::string *)(a1 + 8);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)(a2 + 64), *(void *)(a2 + 72));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 64);
    a1[10] = *(void *)(a2 + 80);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  CFTypeRef result = *(void **)(a2 + 88);
  if (result) {
    CFTypeRef result = _Block_copy(result);
  }
  a1[11] = result;
  return result;
}

void sub_26378FF68(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 56);
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 48);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c124_ZTSZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvEUlvE_(uint64_t a1)
{
  xpc_object_t v2 = *(const void **)(a1 + 88);
  if (v2) {
    _Block_release(v2);
  }
  if (*(char *)(a1 + 87) < 0)
  {
    operator delete(*(void **)(a1 + 64));
    uint64_t v3 = *(const void **)(a1 + 56);
    if (!v3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v3 = *(const void **)(a1 + 56);
  if (v3) {
LABEL_7:
  }
    _Block_release(v3);
LABEL_8:
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::start(dispatch::group_session)::$_0>(TraceManager::start(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::start(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::start(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(dispatch_group_t **__p)
{
  xpc_object_t v2 = *__p;
  if (*__p)
  {
    if (*v2)
    {
      dispatch_group_leave(*v2);
      if (*v2) {
        dispatch_release(*v2);
      }
    }
    operator delete(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)__p[2];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = __p;
  }
  else
  {
    uint64_t v4 = __p;
  }
  operator delete(v4);
}

void _ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZZNS3_25finishInitialization_syncEvEUb2_EUb3_E3__4EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrIS7_NSC_14default_deleteIS7_EEEEENUlPvE_8__invokeESH_(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = (_DWORD *)*a1;
  xpc_object_t v6 = v2;
  if (v2[6])
  {
    uint64_t v3 = *(NSObject **)(*(void *)v2 + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      xpc::object::to_string((uint64_t *)__p, (xpc::object *)(v2 + 8));
      xpc_object_t v5 = v8 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)std::string buf = 136315138;
      xpc_object_t v10 = v5;
      _os_log_error_impl(&dword_26368A000, v3, OS_LOG_TYPE_ERROR, "Dump state failed: %s", buf, 0xCu);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  _ZNSt3__110unique_ptrIZZZN12TraceManager25finishInitialization_syncEvEUb2_EUb3_E3__4NS_14default_deleteIS2_EEED1B8ne180100Ev((uint64_t *)&v6);
  uint64_t v4 = (std::__shared_weak_count *)a1[2];
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(a1);
}

void sub_263790220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _ZNSt3__110unique_ptrIZZZN12TraceManager25finishInitialization_syncEvEUb2_EUb3_E3__4NS_14default_deleteIS2_EEED1B8ne180100Ev(&a9);
  uint64_t v11 = (std::__shared_weak_count *)v9[2];
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  operator delete(v9);
  _Unwind_Resume(a1);
}

uint64_t *_ZNSt3__110unique_ptrIZZZN12TraceManager25finishInitialization_syncEvEUb2_EUb3_E3__4NS_14default_deleteIS2_EEED1B8ne180100Ev(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    xpc_release(*(xpc_object_t *)(v2 + 32));
    *(void *)(v2 + 32) = 0;
    uint64_t v4 = *(std::__shared_weak_count **)(v2 + 16);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    operator delete((void *)v2);
  }
  return a1;
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::sleep(dispatch::group_session)::$_0>(TraceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  uint64_t v4 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_26368A000, v4, OS_LOG_TYPE_DEFAULT, "#I Helper sleep requested", (uint8_t *)&__p, 2u);
  }
  xpc_object_t v5 = (const void *)*MEMORY[0x263F25E28];
  size_t v6 = strlen((const char *)*MEMORY[0x263F25E28]);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
LABEL_69:
  }
    std::string::__throw_length_error[abi:ne180100]();
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_dst = (void **)operator new(v9 + 1);
    size_t v39 = v7;
    unint64_t v40 = v10 | 0x8000000000000000;
    std::string __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v40) = v6;
  p_dst = (void **)&__dst;
  if (v6) {
LABEL_10:
  }
    memmove(p_dst, v5, v7);
  *((unsigned char *)p_dst + v7) = 0;
  memset(&__p, 0, sizeof(__p));
  int v11 = -1431655766;
  int v12 = -1431655766;
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0)) {
      int v12 = (int)object;
    }
    else {
      int v12 = -1431655766;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40) & 0x80000000) == 0) {
      goto LABEL_17;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_17;
  }
  operator delete(__dst);
LABEL_17:
  uint64_t v13 = (const void *)*MEMORY[0x263F25FE0];
  size_t v14 = strlen((const char *)*MEMORY[0x263F25FE0]);
  if (v14 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_69;
  }
  size_t v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    xpc_object_t v16 = (void **)operator new(v17 + 1);
    size_t v39 = v15;
    unint64_t v40 = v18 | 0x8000000000000000;
    std::string __dst = v16;
    goto LABEL_24;
  }
  HIBYTE(v40) = v14;
  xpc_object_t v16 = (void **)&__dst;
  if (v14) {
LABEL_24:
  }
    memmove(v16, v13, v15);
  *((unsigned char *)v16 + v15) = 0;
  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0)) {
      int v11 = (int)object;
    }
    else {
      int v11 = -1431655766;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40) & 0x80000000) == 0)
    {
LABEL_31:
      if (v12 != 4) {
        goto LABEL_42;
      }
      goto LABEL_37;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_31;
  }
  operator delete(__dst);
  if (v12 != 4)
  {
LABEL_42:
    xpc_object_t v23 = (void **)xpc_null_create();
    uint64_t v24 = *MEMORY[0x263F206A0];
    xpc_object_t v25 = v2[1];
    xpc_object_t object = v25;
    std::string __dst = v23;
    if (v25)
    {
      dispatch_retain(v25);
      dispatch_group_enter(v25);
    }
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
    TraceManager::runOnHelper_sync((void *)v3, (const char *)9, v24, 0x61A8u, 0, (xpc_object_t *)&__dst, (NSObject **)&object, (void **)&__p.__r_.__value_.__l.__data_);
    if (v25)
    {
      dispatch_group_leave(v25);
      dispatch_release(v25);
    }
    xpc_release(__dst);
    goto LABEL_62;
  }
LABEL_37:
  if (v11 != 1) {
    goto LABEL_42;
  }
  uint64_t v19 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_26368A000, v19, OS_LOG_TYPE_DEFAULT, "#I Cellular Logging should be paused and the other traces will hanlde enter low power.", (uint8_t *)&__p, 2u);
  }
  xpc_object_t v20 = xpc_null_create();
  xpc_object_t v21 = v2[1];
  unint64_t v36 = v21;
  xpc_object_t object = v20;
  if (v21)
  {
    dispatch_retain(v21);
    dispatch_group_enter(v21);
    xpc_object_t v22 = v2[1];
  }
  else
  {
    xpc_object_t v22 = 0;
  }
  __p.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
  __p.__r_.__value_.__l.__size_ = 1174405120;
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZZN12TraceManager5sleepEN8dispatch13group_sessionEENK3__0clEv_block_invoke;
  xpc_object_t v33 = &__block_descriptor_tmp_179;
  uint64_t v34 = v3;
  dispatch_group_t group = v22;
  if (v22)
  {
    dispatch_retain(v22);
    if (group) {
      dispatch_group_enter(group);
    }
  }
  unint64_t v26 = (void **)_Block_copy(&__p);
  uint64_t v27 = *MEMORY[0x263F206C8];
  uint64_t v28 = *(NSObject **)(v3 + 136);
  if (v28) {
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  }
  std::string __dst = v26;
  size_t v39 = (size_t)v28;
  TraceManager::runOnHelper_sync((void *)v3, (const char *)0xA, v27, 0x1388u, 1, &object, &v36, (void **)&__dst);
  if (v28) {
    dispatch_release(v28);
  }
  if (v26) {
    _Block_release(v26);
  }
  if (v21)
  {
    dispatch_group_leave(v21);
    dispatch_release(v21);
  }
  xpc_release(object);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
LABEL_62:
  xpc_object_t v29 = v2[1];
  if (v29)
  {
    dispatch_group_leave(v29);
    uint64_t v30 = v2[1];
    if (v30) {
      dispatch_release(v30);
    }
  }
  operator delete(v2);
  xpc_object_t v31 = (std::__shared_weak_count *)a1[2];
  if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  operator delete(a1);
}

void sub_263790830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, dispatch_group_t group, uint64_t a18, uint64_t a19, xpc_object_t object,xpc_object_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (v30) {
    dispatch_release(v30);
  }
  if (v29) {
    _Block_release(v29);
  }
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  if (v28)
  {
    dispatch_group_leave(v28);
    dispatch_release(v28);
  }
  xpc_release(object);
  uint64_t v32 = v27[1];
  if (v32)
  {
    dispatch_group_leave(v32);
    xpc_object_t v33 = v27[1];
    if (v33) {
      dispatch_release(v33);
    }
  }
  operator delete(v27);
  uint64_t v34 = (std::__shared_weak_count *)v26[2];
  if (v34)
  {
    if (!atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  operator delete(v26);
  _Unwind_Resume(a1);
}

void ___ZZN12TraceManager5sleepEN8dispatch13group_sessionEENK3__0clEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  xpc_object_t v3 = xpc_null_create();
  uint64_t v4 = *MEMORY[0x263F206A0];
  xpc_object_t v5 = *(NSObject **)(a1 + 40);
  size_t v7 = v5;
  xpc_object_t object = v3;
  if (v5)
  {
    dispatch_retain(v5);
    dispatch_group_enter(v5);
  }
  v6[0] = 0;
  v6[1] = 0;
  TraceManager::runOnHelper_sync(v2, (const char *)9, v4, 0x61A8u, 0, &object, &v7, v6);
  if (v5)
  {
    dispatch_group_leave(v5);
    dispatch_release(v5);
  }
  xpc_release(object);
}

void sub_263790A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  if (v12)
  {
    dispatch_group_leave(v12);
    dispatch_release(v12);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::wake(dispatch::group_session)::$_0>(TraceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  uint64_t v4 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_26368A000, v4, OS_LOG_TYPE_DEFAULT, "#I Helper wake requested", (uint8_t *)&__p, 2u);
  }
  xpc_object_t v5 = (const void *)*MEMORY[0x263F25E28];
  size_t v6 = strlen((const char *)*MEMORY[0x263F25E28]);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
LABEL_60:
  }
    std::string::__throw_length_error[abi:ne180100]();
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_dst = (void **)operator new(v9 + 1);
    size_t v38 = v7;
    unint64_t v39 = v10 | 0x8000000000000000;
    std::string __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v39) = v6;
  p_dst = (void **)&__dst;
  if (v6) {
LABEL_10:
  }
    memmove(p_dst, v5, v7);
  *((unsigned char *)p_dst + v7) = 0;
  memset(&__p, 0, sizeof(__p));
  int v11 = -1431655766;
  int v12 = -1431655766;
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0)) {
      int v12 = (int)object;
    }
    else {
      int v12 = -1431655766;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v39) & 0x80000000) == 0) {
      goto LABEL_17;
    }
  }
  else if ((SHIBYTE(v39) & 0x80000000) == 0)
  {
    goto LABEL_17;
  }
  operator delete(__dst);
LABEL_17:
  uint64_t v13 = (const void *)*MEMORY[0x263F25FE0];
  size_t v14 = strlen((const char *)*MEMORY[0x263F25FE0]);
  if (v14 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_60;
  }
  size_t v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    xpc_object_t v16 = (void **)operator new(v17 + 1);
    size_t v38 = v15;
    unint64_t v39 = v18 | 0x8000000000000000;
    std::string __dst = v16;
    goto LABEL_24;
  }
  HIBYTE(v39) = v14;
  xpc_object_t v16 = (void **)&__dst;
  if (v14) {
LABEL_24:
  }
    memmove(v16, v13, v15);
  *((unsigned char *)v16 + v15) = 0;
  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0)) {
      int v11 = (int)object;
    }
    else {
      int v11 = -1431655766;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v39) & 0x80000000) == 0)
    {
LABEL_31:
      uint64_t v19 = (uint64_t *)MEMORY[0x263F20680];
      if (v12 != 4) {
        goto LABEL_52;
      }
      goto LABEL_37;
    }
  }
  else if ((SHIBYTE(v39) & 0x80000000) == 0)
  {
    goto LABEL_31;
  }
  operator delete(__dst);
  uint64_t v19 = (uint64_t *)MEMORY[0x263F20680];
  if (v12 != 4)
  {
LABEL_52:
    unint64_t v26 = (void **)xpc_null_create();
    uint64_t v27 = *v19;
    xpc_object_t object = 0;
    std::string __dst = v26;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
    TraceManager::runOnHelper_sync((void *)v3, (const char *)9, v27, 0x1388u, 0, (xpc_object_t *)&__dst, (NSObject **)&object, (void **)&__p.__r_.__value_.__l.__data_);
    xpc_release(__dst);
    goto LABEL_53;
  }
LABEL_37:
  if (v11 != 1) {
    goto LABEL_52;
  }
  xpc_object_t v20 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_26368A000, v20, OS_LOG_TYPE_DEFAULT, "#I The other traces will handle exit low power first, then the Cellular Logging should be resumed.", (uint8_t *)&__p, 2u);
  }
  xpc_object_t v21 = xpc_null_create();
  uint64_t v35 = 0;
  xpc_object_t object = v21;
  __p.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
  __p.__r_.__value_.__l.__size_ = 1174405120;
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZZN12TraceManager4wakeEN8dispatch13group_sessionEENK3__0clEv_block_invoke;
  uint64_t v32 = &__block_descriptor_tmp_182;
  uint64_t v33 = v3;
  xpc_object_t v22 = v2[1];
  dispatch_group_t group = v22;
  if (v22)
  {
    dispatch_retain(v22);
    if (group) {
      dispatch_group_enter(group);
    }
  }
  xpc_object_t v23 = (void **)_Block_copy(&__p);
  uint64_t v24 = *v19;
  xpc_object_t v25 = *(NSObject **)(v3 + 136);
  if (v25) {
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  }
  std::string __dst = v23;
  size_t v38 = (size_t)v25;
  TraceManager::runOnHelper_sync((void *)v3, (const char *)9, v24, 0x1388u, 0, &object, &v35, (void **)&__dst);
  if (v25) {
    dispatch_release(v25);
  }
  if (v23) {
    _Block_release(v23);
  }
  xpc_release(object);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
LABEL_53:
  uint64_t v28 = v2[1];
  if (v28)
  {
    dispatch_group_leave(v28);
    xpc_object_t v29 = v2[1];
    if (v29) {
      dispatch_release(v29);
    }
  }
  operator delete(v2);
  uint64_t v30 = (std::__shared_weak_count *)a1[2];
  if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  operator delete(a1);
}

void sub_263790EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, dispatch_group_t group, uint64_t a18, uint64_t a19, xpc_object_t object,xpc_object_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (v29) {
    dispatch_release(v29);
  }
  if (v28) {
    _Block_release(v28);
  }
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  xpc_release(object);
  xpc_object_t v31 = v27[1];
  if (v31)
  {
    dispatch_group_leave(v31);
    uint64_t v32 = v27[1];
    if (v32) {
      dispatch_release(v32);
    }
  }
  operator delete(v27);
  uint64_t v33 = (std::__shared_weak_count *)v26[2];
  if (v33)
  {
    if (!atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  operator delete(v26);
  _Unwind_Resume(a1);
}

void ___ZZN12TraceManager4wakeEN8dispatch13group_sessionEENK3__0clEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  xpc_object_t v2 = xpc_null_create();
  uint64_t v3 = *MEMORY[0x263F206D8];
  xpc_object_t v5 = 0;
  xpc_object_t object = v2;
  v4[0] = 0;
  v4[1] = 0;
  TraceManager::runOnHelper_sync(v1, (const char *)0xA, v3, 0x1388u, 1, &object, &v5, v4);
  xpc_release(object);
}

void sub_263791038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

uint64_t __cxx_global_var_init_102()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<CommandDriverFactory>::~PthreadMutexGuardPolicy, &ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance, &dword_26368A000);
  }
  return result;
}

void *Capabilities::create_default_global@<X0>(void *a1@<X8>)
{
  uint64_t v3 = operator new(1uLL);
  *a1 = v3;
  uint64_t result = operator new(0x20uLL);
  void *result = &unk_270EAD2A8;
  result[1] = 0;
  result[2] = 0;
  result[3] = v3;
  a1[1] = result;
  return result;
}

void sub_2637910F8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t Capabilities::isCMHandDetectionSupported(Capabilities *this)
{
  capabilities::abs::supportsCMHandDetection(this);
  uint64_t v1 = (void *)MEMORY[0x263F01718];

  return [v1 isCallHandednessAvailable];
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002637AAAAFLL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002637AAAAFLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002637AAAAFLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002637AAAAFLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

const char *asString(_DWORD *a1)
{
  uint64_t v1 = "Unknown";
  if (*a1 == 1) {
    uint64_t v1 = "PoweredOn";
  }
  if (*a1) {
    return v1;
  }
  else {
    return "LowPower";
  }
}

const char *asString(int *a1)
{
  uint64_t v1 = *a1;
  if (v1 > 2) {
    return "Unknown";
  }
  else {
    return off_2655D56B0[v1];
  }
}

void SystemState::SystemState(SystemState *this)
{
  *(void *)this = 0x200000001;
  *((_DWORD *)this + 2) = -536870144;
}

{
  *(void *)this = 0x200000001;
  *((_DWORD *)this + 2) = -536870144;
}

uint64_t SystemState::acceptSystemNotification(SystemState *this, int a2)
{
  uint64_t v2 = 0;
  HIDWORD(v3) = a2;
  LODWORD(v3) = a2 + 536870288;
  switch((v3 >> 4))
  {
    case 0u:
      if (*(_DWORD *)this != 1) {
        return 0;
      }
      *((_DWORD *)this + 1) = 0;
      goto LABEL_17;
    case 1u:
      if (*(_DWORD *)this != 1) {
        return 0;
      }
      if (*((_DWORD *)this + 1)) {
        *((_DWORD *)this + 1) = 1;
      }
      *(_DWORD *)this = 0;
      goto LABEL_17;
    case 2u:
      if (!*((_DWORD *)this + 1)) {
        goto LABEL_12;
      }
      return 0;
    case 9u:
      if (*(_DWORD *)this || *((_DWORD *)this + 1) != 2) {
        return 0;
      }
LABEL_12:
      *(void *)this = 0x200000001;
      goto LABEL_17;
    case 0xBu:
      if (*(_DWORD *)this || *((_DWORD *)this + 1) == 2) {
        return 0;
      }
      *((_DWORD *)this + 1) = 2;
LABEL_17:
      *((_DWORD *)this + 2) = a2;
      return 1;
    default:
      return v2;
  }
}

uint64_t SystemState::getSystemNotification(SystemState *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t SystemState::getPowerState(SystemState *this)
{
  return *(unsigned int *)this;
}

uint64_t SystemState::getSleepState(SystemState *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t __cxx_global_var_init_17()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::power::assertion>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::power::assertion,ctu::power::assertion,ctu::PthreadMutexGuardPolicy<ctu::power::assertion>>::sInstance, &dword_26368A000);
  }
  return result;
}

void HealthModule::create(uint64_t *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = operator new(0xC0uLL);
  xpc_object_t v5 = (std::__shared_weak_count *)a1[1];
  uint64_t v24 = *a1;
  xpc_object_t v25 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  size_t v6 = (CommandDriverFactory *)pthread_mutex_lock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  uint64_t v7 = off_26A99F170;
  if (!off_26A99F170)
  {
    CommandDriverFactory::create_default_global((uint64_t *)&v28, v6);
    long long v8 = v28;
    long long v28 = 0uLL;
    uint64_t v9 = (std::__shared_weak_count *)*(&off_26A99F170 + 1);
    off_26A99F170 = v8;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    uint64_t v10 = (std::__shared_weak_count *)*((void *)&v28 + 1);
    if (*((void *)&v28 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v28 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    uint64_t v7 = off_26A99F170;
  }
  int v11 = (std::__shared_weak_count *)*(&off_26A99F170 + 1);
  if (*(&off_26A99F170 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F170 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  (*(void (**)(dispatch_object_t *__return_ptr, uint64_t))(*(void *)v7 + 24))(&object, v7);
  HealthModule::HealthModule((uint64_t)v4, &v24, &object);
  *a2 = v4;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  int v12 = (std::__shared_weak_count *)operator new(0x20uLL);
  v12->__shared_owners_ = 0;
  p_shared_owners = &v12->__shared_owners_;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAD4F8;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  a2[1] = v12;
  size_t v14 = (std::__shared_weak_count *)*((void *)v4 + 16);
  if (v14)
  {
    if (v14->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *((void *)v4 + 15) = v4;
      *((void *)v4 + 16) = v12;
      std::__shared_weak_count::__release_weak(v14);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_16:
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
        size_t v15 = (void *)*a2;
        if (!*(void *)(*a2 + 104)) {
          goto LABEL_30;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v4 + 15) = v4;
    *((void *)v4 + 16) = v12;
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_16;
    }
  }
  size_t v15 = (void *)*a2;
  if (!*(void *)(*a2 + 104)) {
    goto LABEL_30;
  }
LABEL_20:
  xpc_object_t v16 = (std::__shared_weak_count *)v15[16];
  if (!v16 || (v17 = v15[15], (uint64_t v18 = std::__shared_weak_count::lock(v16)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v19 = v18;
  *(void *)&long long v28 = v17;
  *((void *)&v28 + 1) = v18;
  ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v15 + 7));
  uint64_t v20 = v17 + 48;
  if (!v17) {
    uint64_t v20 = 0;
  }
  uint64_t v26 = v20;
  uint64_t v27 = v19;
  long long v28 = 0uLL;
  ctu::TrackedLogger::registerLoggerToServer();
  xpc_object_t v21 = v27;
  if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  xpc_object_t v22 = (std::__shared_weak_count *)*((void *)&v28 + 1);
  if (*((void *)&v28 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v28 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
LABEL_30:
  if (object) {
    dispatch_release(object);
  }
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  if (v25) {
    std::__shared_weak_count::__release_weak(v25);
  }
}

void sub_2637917B8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17)
{
}

void sub_263791820()
{
}

void sub_263791830()
{
}

void sub_26379183C()
{
}

void sub_26379184C()
{
}

unsigned char *HealthModule::getShutdownStages@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unint64_t v3 = operator new(1uLL);
  *a1 = v3;
  *unint64_t v3 = 3;
  uint64_t result = v3 + 1;
  a1[1] = result;
  a1[2] = result;
  return result;
}

void HealthModule::initialize(void *a1, dispatch_object_t *a2)
{
  uint64_t v6 = a1[15];
  uint64_t v4 = (std::__shared_weak_count *)a1[16];
  xpc_object_t v5 = a1 + 15;
  if (!v4 || (long long v8 = std::__shared_weak_count::lock(v4)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v9 = v8;
  atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v9);
  }
  uint64_t v10 = *a2;
  xpc_object_t v21 = a1;
  dispatch_group_t group = v10;
  if (v10)
  {
    dispatch_retain(v10);
    dispatch_group_enter(v10);
  }
  uint64_t v23 = v6;
  uint64_t v24 = v9;
  atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI12HealthModuleE20execute_wrapped_syncIZNS1_10initializeEN8dispatch13group_sessionEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_30;
  block[4] = v5;
  block[5] = &v21;
  int v11 = a1[17];
  if (!a1[18])
  {
    dispatch_sync(v11, block);
    int v12 = v24;
    if (!v24) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  dispatch_async_and_wait(v11, block);
  int v12 = v24;
  if (v24) {
LABEL_9:
  }
    std::__shared_weak_count::__release_weak(v12);
LABEL_10:
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  uint64_t v13 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v13);
  }
  atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  size_t v14 = (std::__shared_weak_count *)a1[16];
  if (!v14 || (uint64_t v15 = a1[15], (v16 = std::__shared_weak_count::lock(v14)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v17 = v16;
  uint64_t v18 = operator new(0x20uLL);
  *uint64_t v18 = a1;
  v18[1] = v13;
  v18[2] = v6;
  v18[3] = v9;
  uint64_t v19 = a1[17];
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v20 = operator new(0x18uLL);
  *uint64_t v20 = v18;
  v20[1] = v15;
  v20[2] = v17;
  dispatch_async_f(v19, v20, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<HealthModule>::execute_wrapped<HealthModule::initialize(dispatch::group_session)::$_1>(HealthModule::initialize(dispatch::group_session)::$_1 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<HealthModule::initialize(dispatch::group_session)::$_1,dispatch_queue_s *::default_delete<HealthModule::initialize(dispatch::group_session)::$_1>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  std::__shared_weak_count::__release_weak(v9);
}

void HealthModule::shutdown(void *a1, char a2, NSObject **a3)
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1174405120;
  v13[2] = ___ZN12HealthModule8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke;
  v13[3] = &__block_descriptor_tmp_25;
  xpc_object_t v5 = *a3;
  v13[4] = a1;
  dispatch_group_t group = v5;
  if (v5)
  {
    dispatch_retain(v5);
    dispatch_group_enter(group);
  }
  char v15 = a2;
  uint64_t v6 = (std::__shared_weak_count *)a1[16];
  if (!v6 || (uint64_t v7 = a1[15], (v8 = std::__shared_weak_count::lock(v6)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v9 = v8;
  uint64_t v10 = a1[17];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableI12HealthModuleE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_270EAD630;
  block[5] = v7;
  uint64_t v17 = v9;
  p_shared_owners = &v9->__shared_owners_;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  block[4] = v13;
  dispatch_async(v10, block);
  int v12 = v17;
  if (!v17 || atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v12);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
  {
LABEL_8:
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_9:
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
}

void ___ZN12HealthModule8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 160);
  *(void *)(v1 + 152) = 0;
  *(void *)(v1 + 160) = 0;
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
}

const char *HealthModule::getName(HealthModule *this)
{
  return "health.mod";
}

void HealthModule::~HealthModule(HealthModule *this)
{
  *(void *)this = &unk_270EAD328;
  *((void *)this + 6) = &unk_270EAD398;
  uint64_t v2 = *((void *)this + 11);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_26368A000, v2, OS_LOG_TYPE_DEFAULT, "#I Gone!", v13, 2u);
  }
  uint64_t v3 = *((void *)this + 23);
  *((void *)this + 23) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    xpc_object_t v5 = (std::__shared_weak_count *)*((void *)this + 20);
    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    xpc_object_t v5 = (std::__shared_weak_count *)*((void *)this + 20);
    if (!v5) {
      goto LABEL_11;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_11:
  *((void *)this + 6) = &unk_270EAD4B8;
  MEMORY[0x263E68AF0]((char *)this + 56);
  uint64_t v6 = *((void *)this + 18);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = *((void *)this + 17);
  if (v7) {
    dispatch_release(v7);
  }
  long long v8 = (std::__shared_weak_count *)*((void *)this + 16);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  *(void *)this = &unk_270EAD770;
  uint64_t v9 = *((void *)this + 3);
  if (v9)
  {
    uint64_t v10 = *((void *)this + 4);
    int v11 = (void *)*((void *)this + 3);
    if (v10 != v9)
    {
      do
      {
        if (*(char *)(v10 - 1) < 0) {
          operator delete(*(void **)(v10 - 24));
        }
        v10 -= 24;
      }
      while (v10 != v9);
      int v11 = (void *)*((void *)this + 3);
    }
    *((void *)this + 4) = v9;
    operator delete(v11);
  }
  int v12 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
}

{
  void *v1;
  uint64_t vars8;

  HealthModule::~HealthModule(this);

  operator delete(v1);
}

void *ctu::SharedLoggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EAD4B8;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_270EAD4B8;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void non-virtual thunk to'HealthModule::~HealthModule(HealthModule *this)
{
}

{
  void *v1;
  uint64_t vars8;

  HealthModule::~HealthModule((HealthModule *)((char *)this - 48));

  operator delete(v1);
}

uint64_t HealthModule::HealthModule(uint64_t a1, uint64_t *a2, NSObject **a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = (std::__shared_weak_count *)a2[1];
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)a1 = &unk_270EAD770;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    std::__shared_weak_count::__release_weak(v6);
    *(void *)a1 = &unk_270EA6BA0;
    std::__shared_weak_count::__release_weak(v6);
  }
  else
  {
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    *(void *)a1 = &unk_270EA6BA0;
  }
  *(void *)a1 = &unk_270EAD328;
  *(void *)(a1 + 48) = &unk_270EAD398;
  uint64_t v7 = *a3;
  if (v7)
  {
    dispatch_retain(v7);
    long long v8 = *(uint64_t (***)(void))a1;
  }
  else
  {
    long long v8 = (uint64_t (**)(void))&unk_270EAD328;
  }
  uint64_t v9 = (const char *)v8[2](a1);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v23, "com.apple.telephony.abm", v9);
  GetABMLogServer(&v21);
  if (v7) {
    dispatch_retain(v7);
  }
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  int v11 = dispatch_queue_create_with_target_V2("health.mod", initially_inactive, v7);
  dispatch_set_qos_class_floor(v11, QOS_CLASS_BACKGROUND, 0);
  dispatch_activate(v11);
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  *(void *)(a1 + 144) = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  if (v11) {
    dispatch_release(v11);
  }
  if (v7) {
    dispatch_release(v7);
  }
  *(void *)(a1 + 48) = &unk_270EAD4B8;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v25);
  *(void *)(a1 + 56) = &unk_270EA5428;
  int v12 = v22;
  *(void *)(a1 + 104) = v21;
  *(void *)(a1 + 112) = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v24);
  *(void *)(a1 + 48) = &unk_270EAD670;
  uint64_t v13 = v22;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v23);
  if (v7) {
    dispatch_release(v7);
  }
  *(void *)a1 = &unk_270EAD328;
  *(void *)(a1 + 48) = &unk_270EAD398;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(void *)(a1 + 184) = 0;
  GetABMLogServer(&v19);
  ctu::DispatchTimerService::create();
  long long v14 = v25;
  long long v25 = 0uLL;
  char v15 = *(std::__shared_weak_count **)(a1 + 176);
  *(_OWORD *)(a1 + 168) = v14;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  xpc_object_t v16 = (std::__shared_weak_count *)*((void *)&v25 + 1);
  if (*((void *)&v25 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v25 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  uint64_t v17 = v20;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  return a1;
}

void sub_2637924C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  uint64_t v14 = *((void *)v9 + 23);
  *((void *)v9 + 23) = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v12);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v11);
  ctu::SharedLoggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v10);
  Service::~Service(v9);
  _Unwind_Resume(a1);
}

void sub_263792530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v10 = va_arg(va2, void);
  uint64_t v12 = va_arg(va2, void);
  va_copy(va3, va2);
  uint64_t v13 = va_arg(va3, void);
  uint64_t v15 = va_arg(va3, void);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va3);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va2);
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v5);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  if (v4) {
    dispatch_release(v4);
  }
  Service::~Service(v3);
  _Unwind_Resume(a1);
}

void HealthModule::getBasebandFWVersion_sync(void *a1, void **a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[16];
  if (!v3 || (v5 = a1[15], (uint64_t v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  p_shared_weak_owners = &v6->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v32 = (void *)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v33 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12HealthModule25getBasebandFWVersion_syncEN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_6_6;
  aBlock[4] = a1;
  void aBlock[5] = v5;
  uint64_t v30 = v7;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  uint64_t v9 = *a2;
  if (*a2) {
    uint64_t v9 = _Block_copy(v9);
  }
  xpc_object_t v31 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = a1[17];
  if (v11) {
    dispatch_retain(v11);
  }
  uint64_t v32 = v10;
  dispatch_object_t v33 = v11;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  long long v28 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = (CommandDriverFactory *)pthread_mutex_lock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  uint64_t v13 = off_26A99F170;
  if (!off_26A99F170)
  {
    CommandDriverFactory::create_default_global((uint64_t *)&v34, v12);
    long long v14 = v34;
    long long v34 = 0uLL;
    uint64_t v15 = (std::__shared_weak_count *)*(&off_26A99F170 + 1);
    off_26A99F170 = v14;
    if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    xpc_object_t v16 = (std::__shared_weak_count *)*((void *)&v34 + 1);
    if (*((void *)&v34 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v34 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
    uint64_t v13 = off_26A99F170;
  }
  uint64_t v17 = (std::__shared_weak_count *)*(&off_26A99F170 + 1);
  uint64_t v23 = v13;
  uint64_t v24 = *(&off_26A99F170 + 1);
  if (*(&off_26A99F170 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F170 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(void *)v13 + 16))(&v25, v13);
  unint64_t v27 = 0;
  long long v28 = 0;
  if (v26)
  {
    long long v28 = std::__shared_weak_count::lock(v26);
    if (v28) {
      unint64_t v27 = v25;
    }
    if (v26) {
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    unint64_t v18 = v27;
    if (!v27) {
      goto LABEL_35;
    }
  }
  else
  {
    unint64_t v18 = v27;
    if (!v27) {
      goto LABEL_35;
    }
  }
  uint64_t v19 = v32;
  if (v32) {
    uint64_t v19 = _Block_copy(v32);
  }
  uint64_t v21 = v19;
  dispatch_object_t object = v33;
  if (v33) {
    dispatch_retain(v33);
  }
  (*(void (**)(unint64_t, void **))(*(void *)v18 + 112))(v18, &v21);
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    _Block_release(v21);
  }
LABEL_35:
  uint64_t v20 = v28;
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  if (v33) {
    dispatch_release(v33);
  }
  if (v32) {
    _Block_release(v32);
  }
  if (v31) {
    _Block_release(v31);
  }
  if (v30) {
    std::__shared_weak_count::__release_weak(v30);
  }
  std::__shared_weak_count::__release_weak(v7);
}

void sub_263792938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23,void *aBlock)
{
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  dispatch::callback<void({block_pointer})(ctu::cf::CFSharedRef<__CFError>,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback(v25 - 80);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (a23) {
    std::__shared_weak_count::__release_weak(a23);
  }
  std::__shared_weak_count::__release_weak(v24);
  _Unwind_Resume(a1);
}

void ___ZN12HealthModule25getBasebandFWVersion_syncEN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE_block_invoke(void *a1, std::string::size_type *a2, const __CFDictionary **a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::__shared_weak_count *)a1[6];
  if (!v4) {
    return;
  }
  uint64_t v7 = a1[4];
  long long v8 = std::__shared_weak_count::lock(v4);
  uint64_t v21 = v8;
  if (!v8) {
    return;
  }
  uint64_t v9 = (std::string::value_type *)0xAAAAAAAAAAAAAA00;
  std::string::size_type v10 = 0xAAAAAAAAAAAAAALL;
  if (a1[5])
  {
    std::string::size_type v11 = *a2;
    if (v11) {
      uint64_t v12 = ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::get;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v12)
    {
      uint64_t v13 = *(NSObject **)(v7 + 88);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v22.__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)v22.__r_.__value_.__r.__words + 4) = v11;
        _os_log_error_impl(&dword_26368A000, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      CFDictionaryRef v17 = *a3;
      if (*a3) {
        unint64_t v18 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
      }
      else {
        unint64_t v18 = 0;
      }
      if (v18)
      {
        v19[0] = 0xAAAAAAAAAAAAAAAALL;
        v19[1] = 0xAAAAAAAAAAAAAAAALL;
        ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v19, v17);
        ctu::cf::map_adapter::getString();
        std::string::size_type size = v22.__r_.__value_.__l.__size_;
        uint64_t v9 = (std::string::value_type *)v22.__r_.__value_.__r.__words[0];
        std::string::size_type v10 = v22.__r_.__value_.__r.__words[2];
        *((unsigned char *)&v22.__r_.__value_.__s + 23) = 0;
        v22.__r_.__value_.__s.__data_[0] = 0;
        MEMORY[0x263E68CD0](v19);
        uint64_t v14 = a1[7];
        if ((v10 & 0x8000000000000000) != 0)
        {
          std::string::__init_copy_ctor_external(&v22, v9, size);
          goto LABEL_12;
        }
LABEL_11:
        v22.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
        v22.__r_.__value_.__l.__size_ = size;
        v22.__r_.__value_.__r.__words[2] = v10;
LABEL_12:
        (*(void (**)(uint64_t, std::string *))(v14 + 16))(v14, &v22);
        if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v22.__r_.__value_.__l.__data_);
          xpc_object_t v16 = v21;
          if (!v21) {
            goto LABEL_25;
          }
        }
        else
        {
          xpc_object_t v16 = v21;
          if (!v21)
          {
LABEL_25:
            if ((v10 & 0x8000000000000000) == 0) {
              return;
            }
            goto LABEL_26;
          }
        }
        if (atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_25;
        }
        goto LABEL_28;
      }
    }
    uint64_t v14 = a1[7];
    std::string::size_type size = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_11;
  }
  xpc_object_t v16 = v8;
  if (atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_25;
  }
LABEL_28:
  ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
  std::__shared_weak_count::__release_weak(v16);
  if ((v10 & 0x8000000000000000) != 0) {
LABEL_26:
  }
    operator delete(v9);
}

void sub_263792C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  operator delete(v7);
  _Unwind_Resume(a1);
}

void sub_263792C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, char a18)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E68CD0](&a16);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void sub_263792C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  if (v23 < 0) {
    operator delete(v22);
  }
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12HealthModuleEE56c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(void *a1, void *a2)
{
  uint64_t v3 = a2[6];
  a1[5] = a2[5];
  a1[6] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t result = (void *)a2[7];
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  a1[7] = result;
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12HealthModuleEE56c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t HealthModule::getFailureCountInHealthEventDB_sync(NSObject **this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if ((void)xmmword_26A99F3E8) {
    goto LABEL_2;
  }
  uint64_t v2 = (HealthEventDB *)operator new(0xA0uLL);
  HealthEventDB::HealthEventDB(v2);
  uint64_t v3 = (std::__shared_weak_count *)operator new(0x20uLL);
  v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAA828;
  v3->__shared_owners_ = 0;
  v3->__shared_weak_owners_ = 0;
  v3[1].__vftable = (std::__shared_weak_count_vtbl *)v2;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
  *(void *)&xmmword_26A99F3E8 = v2;
  *((void *)&xmmword_26A99F3E8 + 1) = v3;
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
LABEL_2:
    uint64_t v3 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
    uint64_t v2 = (HealthEventDB *)xmmword_26A99F3E8;
    if (!*((void *)&xmmword_26A99F3E8 + 1)) {
      goto LABEL_8;
    }
  }
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_8:
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  memset(v19, 170, sizeof(v19));
  HealthModule::findMostRecentBarrierHealthEvent_sync((HealthModule *)this, v19);
  if (((LOBYTE(v19[1]) - 3) & 0xFD) != 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v19[2];
  }
  if (!*((void *)v2 + 14) || (uint64_t v6 = *((void *)v2 + 12)) == 0)
  {
    uint64_t v7 = 0;
    uint64_t v14 = 0;
    CFDictionaryRef v17 = this[11];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      return v14 + v7;
    }
    goto LABEL_43;
  }
  uint64_t v7 = 0;
  uint64_t v9 = *((void *)v2 + 10);
  uint64_t v8 = *((void *)v2 + 11);
  uint64_t v10 = *((void *)v2 + 12);
  uint64_t v11 = *((void *)v2 + 13);
  do
  {
    if (*(void *)(v10 + 16) >= v5 && *(unsigned char *)(v10 + 8) == 1) {
      ++v7;
    }
    v10 += 24;
    if (v10 == v8) {
      uint64_t v10 = *((void *)v2 + 10);
    }
  }
  while (v10 != v11 && v10 != 0);
  uint64_t v14 = 0;
  do
  {
    if (*(void *)(v6 + 16) >= v5 && *(unsigned char *)(v6 + 8) == 4) {
      ++v14;
    }
    v6 += 24;
    if (v6 == v8) {
      uint64_t v6 = v9;
    }
  }
  while (v6 != v11 && v6 != 0);
  CFDictionaryRef v17 = this[11];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
LABEL_43:
    *(_DWORD *)std::string buf = 134218240;
    uint64_t v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v14;
    _os_log_impl(&dword_26368A000, v17, OS_LOG_TYPE_DEFAULT, "#I boot failure count: %ld, ping failure count: %ld", buf, 0x16u);
  }
  return v14 + v7;
}

void sub_263792FF0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  _Unwind_Resume(a1);
}

void HealthModule::findMostRecentBarrierHealthEvent_sync(HealthModule *this@<X0>, void *a2@<X8>)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  memset(a2, 170, 24);
  Timestamp::Timestamp((Timestamp *)&v35);
  Timestamp::asString((uint64_t)&v35, 0, 9, v37);
  *a2 = &unk_270EA9DE0;
  *((unsigned char *)a2 + 8) = 0;
  if (SHIBYTE(v38) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)__p, (const std::string::value_type *)v37[0], (std::string::size_type)v37[1]);
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)v37;
    *(void *)&long long v33 = v38;
  }
  a2[2] = Timestamp::convert((uint64_t)__p);
  if (SBYTE7(v33) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v38) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((SHIBYTE(v38) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(v37[0]);
LABEL_6:
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)&v35, (void *)v35.__imp_.__imp_);
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)std::string __p = v4;
  long long v33 = v4;
  pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (!(void)xmmword_26A99F3E8)
  {
    uint64_t v6 = (HealthEventDB *)operator new(0xA0uLL);
    HealthEventDB::HealthEventDB(v6);
    uint64_t v5 = operator new(0x20uLL);
    void *v5 = &unk_270EAA828;
    v5[1] = 0;
    _DWORD v5[2] = 0;
    v5[3] = v6;
    uint64_t v7 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
    *(void *)&xmmword_26A99F3E8 = v6;
    *((void *)&xmmword_26A99F3E8 + 1) = v5;
    if (!v7)
    {
      *(void *)std::string buf = v6;
      *(void *)&uint8_t buf[8] = v5;
      goto LABEL_15;
    }
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  uint64_t v5 = (void *)*((void *)&xmmword_26A99F3E8 + 1);
  uint64_t v6 = (HealthEventDB *)xmmword_26A99F3E8;
  *(_OWORD *)std::string buf = xmmword_26A99F3E8;
  if (*((void *)&xmmword_26A99F3E8 + 1)) {
LABEL_15:
  }
    atomic_fetch_add_explicit(v5 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  unint64_t v8 = *((void *)v6 + 14);
  unint64_t v34 = v8;
  uint64_t v10 = *((void *)v6 + 10);
  uint64_t v9 = *((void *)v6 + 11);
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v10) >> 3);
  if (v11 >= 0xAAAAAAAAAAAAAABLL)
  {
    std::logic_error::logic_error(&v35, "circular_buffer");
    v35.__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
    boost::throw_exception<std::length_error>(&v35);
  }
  if (v9 == v10)
  {
    uint64_t v12 = 0;
    uint64_t v14 = (char *)(8 * ((v9 - v10) >> 3));
    __p[0] = 0;
    __p[1] = (void *)(24 * v11);
    *(void *)&long long v33 = 0;
    uint64_t v15 = 0;
    if (!v8) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v12 = (char *)operator new(v9 - v10);
    uint64_t v13 = *((void *)v6 + 14);
    uint64_t v14 = &v12[24 * v11];
    __p[0] = v12;
    __p[1] = v14;
    *(void *)&long long v33 = v12;
    uint64_t v15 = v12;
    if (!v13) {
      goto LABEL_30;
    }
  }
  uint64_t v16 = *((void *)v6 + 12);
  uint64_t v15 = v12;
  if (v16)
  {
    uint64_t v18 = *((void *)v6 + 10);
    uint64_t v17 = *((void *)v6 + 11);
    uint64_t v19 = v12;
    uint64_t v15 = v12;
    uint64_t v20 = *((void *)v6 + 13);
    do
    {
      *(void *)uint64_t v15 = &unk_270EA9DE0;
      *(_OWORD *)(v15 + 8) = *(_OWORD *)(v16 + 8);
      v16 += 24;
      if (v16 == v17) {
        uint64_t v16 = v18;
      }
      v15 += 24;
      v19 += 24;
    }
    while (v16 != v20 && v16 != 0);
  }
LABEL_30:
  if (v15 == v14) {
    __int16 v22 = v12;
  }
  else {
    __int16 v22 = v15;
  }
  *((void *)&v33 + 1) = v22;
  uint64_t v23 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  unint64_t v24 = v34;
  uint64_t v25 = (void (***)(void))v33;
  if (v34 && (void)v33)
  {
    if ((void *)(v33 + 24) == __p[1]) {
      uint64_t v26 = (char *)__p[0];
    }
    else {
      uint64_t v26 = (char *)(v33 + 24);
    }
    BOOL v27 = v26 == *((char **)&v33 + 1) || v26 == 0;
    long long v28 = (char *)v33;
    if (!v27)
    {
      long long v28 = (char *)v33;
      do
      {
        if (((v28[8] - 3) & 0xFD) != 0)
        {
          if (((v26[8] - 3) & 0xFD) == 0) {
            goto LABEL_51;
          }
        }
        else if (((v26[8] - 3) & 0xFD) != 0)
        {
          goto LABEL_52;
        }
        if (*((void *)v28 + 2) < *((void *)v26 + 2)) {
LABEL_51:
        }
          long long v28 = v26;
LABEL_52:
        v26 += 24;
        if (v26 == __p[1]) {
          uint64_t v26 = (char *)__p[0];
        }
      }
      while (v26 != *((char **)&v33 + 1) && v26);
    }
    *(_OWORD *)(a2 + 1) = *(_OWORD *)(v28 + 8);
  }
  xpc_object_t v29 = *((void *)this + 11);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    HealthEvent::asString((HealthEvent *)a2, &v35);
    uint64_t v30 = v36 >= 0 ? &v35 : (std::logic_error *)v35.__vftable;
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = v30;
    _os_log_impl(&dword_26368A000, v29, OS_LOG_TYPE_DEFAULT, "#I Found preliminary barrier event: %s", buf, 0xCu);
    if (v36 < 0) {
      operator delete(v35.__vftable);
    }
  }
  if (v24)
  {
    unint64_t v31 = 0;
    do
    {
      (**v25)(v25);
      uint64_t v25 = (void (***)(void))(v33 + 24);
      *(void *)&long long v33 = v25;
      if (v25 == __p[1])
      {
        uint64_t v25 = (void (***)(void))__p[0];
        *(void **)&long long v33 = __p[0];
      }
      ++v31;
    }
    while (v31 < v34);
  }
  if (__p[0]) {
    operator delete(__p[0]);
  }
}

void sub_263793550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  _Unwind_Resume(a1);
}

BOOL HealthModule::hasBarrierEventType(HealthModule *this, const HealthEvent *a2)
{
  return ((*((unsigned __int8 *)this + 8) - 3) & 0xFD) == 0;
}

void HealthModule::checkFailuresAgainstThresholdAndEraseEFSAccordingly_sync(NSObject **this)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t FailureCountInHealthEventDB_sync = HealthModule::getFailureCountInHealthEventDB_sync(this);
  if (FailureCountInHealthEventDB_sync >= 10)
  {
    int v3 = capabilities::abs::supportsEFSEraseOnBootLoop((capabilities::abs *)FailureCountInHealthEventDB_sync);
    long long v4 = this[11];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = ", but EFS erase is not supported";
      if (v3) {
        uint64_t v5 = "; requesting EFS erase";
      }
      *(void *)std::string buf = 0xA04000202;
      *(_WORD *)&uint8_t buf[8] = 2080;
      *(void *)&buf[10] = v5;
      _os_log_impl(&dword_26368A000, v4, OS_LOG_TYPE_DEFAULT, "#I Total health failure count reached EFS erase threshold (%d)%s", buf, 0x12u);
    }
    if (v3)
    {
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6A240](v6) == MEMORY[0x263EF8708])
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
      xpc_object_t v8 = xpc_string_create((const char *)*MEMORY[0x263F26050]);
      if (!v8) {
        xpc_object_t v8 = xpc_null_create();
      }
      xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F26360], v8);
      xpc_object_t v9 = xpc_null_create();
      xpc_release(v8);
      xpc_release(v9);
      uint64_t v10 = (const void *)*MEMORY[0x263F26190];
      size_t v11 = strlen((const char *)*MEMORY[0x263F26190]);
      if (v11 >= 0x7FFFFFFFFFFFFFF8) {
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
        uint64_t v13 = operator new(v14 + 1);
        *(void *)&uint8_t buf[8] = v12;
        *(void *)&uint8_t buf[16] = v15 | 0x8000000000000000;
        *(void *)std::string buf = v13;
      }
      else
      {
        buf[23] = v11;
        uint64_t v13 = buf;
        if (!v11)
        {
          buf[0] = 0;
          xpc_object_t v20 = v7;
          if (v7)
          {
LABEL_19:
            xpc_retain(v7);
            goto LABEL_25;
          }
LABEL_24:
          xpc_object_t v20 = xpc_null_create();
LABEL_25:
          abm::client::Command::create();
          xpc_release(v20);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
          AppleBasebandManager::perform();
          if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
          {
            (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
          }
          pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
          if (!(void)xmmword_26A99F3E8)
          {
            uint64_t v17 = (HealthEventDB *)operator new(0xA0uLL);
            HealthEventDB::HealthEventDB(v17);
            uint64_t v16 = operator new(0x20uLL);
            *uint64_t v16 = &unk_270EAA828;
            v16[1] = 0;
            v16[2] = 0;
            v16[3] = v17;
            uint64_t v18 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
            *(void *)&xmmword_26A99F3E8 = v17;
            *((void *)&xmmword_26A99F3E8 + 1) = v16;
            if (!v18)
            {
              *(void *)std::string buf = v17;
              *(void *)&uint8_t buf[8] = v16;
              goto LABEL_36;
            }
            if (!atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
          uint64_t v16 = (void *)*((void *)&xmmword_26A99F3E8 + 1);
          uint64_t v17 = (HealthEventDB *)xmmword_26A99F3E8;
          *(_OWORD *)std::string buf = xmmword_26A99F3E8;
          if (!*((void *)&xmmword_26A99F3E8 + 1))
          {
LABEL_37:
            pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
            HealthEventDB::addHealthEvent(v17, 5);
            uint64_t v19 = *(std::__shared_weak_count **)&buf[8];
            if (*(void *)&buf[8]
              && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
              std::__shared_weak_count::__release_weak(v19);
            }
            if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
            {
              (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
            }
            xpc_release(v7);
            return;
          }
LABEL_36:
          atomic_fetch_add_explicit(v16 + 1, 1uLL, memory_order_relaxed);
          goto LABEL_37;
        }
      }
      memmove(v13, v10, v12);
      v13[v12] = 0;
      xpc_object_t v20 = v7;
      if (v7) {
        goto LABEL_19;
      }
      goto LABEL_24;
    }
  }
}

void sub_263793B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, xpc_object_t object, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  xpc_release(v22);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void HealthModule::sendUserNotificationForCellularDiagnostics(HealthModule *this)
{
  if (config::hw::watch(this)) {
    return;
  }
  *(_OWORD *)long long v4 = 0u;
  memset(v5, 0, 56);
  std::string::__assign_external((std::string *)&v5[8], "Cellular_Issue_Detected", 0x17uLL);
  v5[7] = 13;
  strcpy((char *)v4, "CellularIssue");
  if ((v5[7] & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external(&v1, (const std::string::value_type *)v4[0], (std::string::size_type)v4[1]);
  }
  else
  {
    *(_OWORD *)&v1.__r_.__value_.__l.__data_ = *(_OWORD *)v4;
    v1.__r_.__value_.__r.__words[2] = *(void *)v5;
  }
  if ((v5[31] & 0x80000000) != 0) {
    std::string::__init_copy_ctor_external(&v2, *(const std::string::value_type **)&v5[8], *(std::string::size_type *)&v5[16]);
  }
  else {
    std::string v2 = *(std::string *)&v5[8];
  }
  if ((v5[55] & 0x80000000) != 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)&v5[32], *(std::string::size_type *)&v5[40]);
  }
  else {
    std::string __p = *(std::string *)&v5[32];
  }
  support::ui::showNotification(2u, (uint64_t)&v1, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v2.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_13:
      if ((SHIBYTE(v1.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v2.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_13;
  }
  operator delete(v2.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v1.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_14:
    if ((v5[55] & 0x80000000) == 0) {
      goto LABEL_15;
    }
LABEL_21:
    operator delete(*(void **)&v5[32]);
    if ((v5[31] & 0x80000000) == 0)
    {
LABEL_16:
      if ((v5[7] & 0x80000000) == 0) {
        return;
      }
LABEL_23:
      operator delete(v4[0]);
      return;
    }
    goto LABEL_22;
  }
LABEL_20:
  operator delete(v1.__r_.__value_.__l.__data_);
  if ((v5[55] & 0x80000000) != 0) {
    goto LABEL_21;
  }
LABEL_15:
  if ((v5[31] & 0x80000000) == 0) {
    goto LABEL_16;
  }
LABEL_22:
  operator delete(*(void **)&v5[8]);
  if ((v5[7] & 0x80000000) != 0) {
    goto LABEL_23;
  }
}

void sub_263793E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      support::ui::NotificationInfo::~NotificationInfo(&a25);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  support::ui::NotificationInfo::~NotificationInfo(&a25);
  _Unwind_Resume(a1);
}

void sub_263793EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
}

void sub_263793EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  support::ui::NotificationInfo::~NotificationInfo((void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::Loggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v3 = (const char *)(*(uint64_t (**)(void))(*(void *)(a1 - 48) + 16))();
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    xpc_object_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EAD4B8;
  MEMORY[0x263E68AF0](a1 + 1);
  return a1;
}

void ctu::Loggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EAD4B8;
  MEMORY[0x263E68AF0](a1 + 1);

  operator delete(a1);
}

void std::__shared_ptr_pointer<HealthModule *,std::shared_ptr<HealthModule> ctu::SharedSynchronizable<HealthModule>::make_shared_ptr<HealthModule>(HealthModule*)::{lambda(HealthModule *)#1},std::allocator<HealthModule>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<HealthModule *,std::shared_ptr<HealthModule> ctu::SharedSynchronizable<HealthModule>::make_shared_ptr<HealthModule>(HealthModule*)::{lambda(HealthModule *)#1},std::allocator<HealthModule>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<HealthModule *,std::shared_ptr<HealthModule> ctu::SharedSynchronizable<HealthModule>::make_shared_ptr<HealthModule>(HealthModule*)::{lambda(HealthModule *)#1},std::allocator<HealthModule>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI12HealthModuleE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI12HealthModuleE15make_shared_ptrIS1_EENSt3__110shared_ptrIT"
                                "_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI12HealthModuleE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI12HealthModuleE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<HealthModule> ctu::SharedSynchronizable<HealthModule>::make_shared_ptr<HealthModule>(HealthModule*)::{lambda(HealthModule*)#1}::operator() const(HealthModule*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void *HealthEventDB::create_default_global(HealthEventDB *this)
{
  std::string v2 = (HealthEventDB *)operator new(0xA0uLL);
  HealthEventDB::HealthEventDB(v2);
  *(void *)this = v2;
  size_t result = operator new(0x20uLL);
  void *result = &unk_270EAA828;
  result[1] = 0;
  result[2] = 0;
  result[3] = v2;
  *((void *)this + 1) = result;
  return result;
}

void sub_263794198(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_2637941CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<HealthEventDB>::operator=[abi:ne180100](uint64_t a1)
{
  long long v1 = *(_OWORD *)a1;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  std::string v2 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
  xmmword_26A99F3E8 = v1;
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
}

void ___ZNK3ctu20SharedSynchronizableI12HealthModuleE20execute_wrapped_syncIZNS1_10initializeEN8dispatch13group_sessionEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 40);
  pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (!qword_26A99F3E8)
  {
    long long v4 = (HealthEventDB *)operator new(0xA0uLL);
    HealthEventDB::HealthEventDB(v4);
    std::string v2 = (std::__shared_weak_count *)operator new(0x20uLL);
    v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAA828;
    v2->__shared_owners_ = 0;
    v2->__shared_weak_owners_ = 0;
    v2[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
    size_t v5 = (std::__shared_weak_count *)off_26A99F3F0;
    qword_26A99F3E8 = (uint64_t)v4;
    off_26A99F3F0 = v2;
    if (!v5) {
      goto LABEL_7;
    }
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  std::string v2 = (std::__shared_weak_count *)off_26A99F3F0;
  if (off_26A99F3F0)
  {
LABEL_7:
    char v3 = 0;
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_8;
  }
  char v3 = 1;
LABEL_8:
  uint64_t v6 = (sys *)pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if ((v3 & 1) != 0 || atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (!sys::isBootSessionChanged(v6)) {
      return;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    if (!sys::isBootSessionChanged(v11)) {
      return;
    }
  }
  uint64_t v7 = *(NSObject **)(v1 + 88);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_26368A000, v7, OS_LOG_TYPE_DEFAULT, "#I AP reboot detected; resetting CommCenter and baseband stats",
      buf,
      2u);
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  uint64_t v9 = MEMORY[0x263EF8708];
  if (v8 || (xpc_object_t v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6A240](v8) == v9)
    {
      xpc_retain(v8);
      xpc_object_t v10 = v8;
    }
    else
    {
      xpc_object_t v10 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v10 = xpc_null_create();
    xpc_object_t v8 = 0;
  }
  xpc_release(v8);
  if (MEMORY[0x263E6A240](v10) != v9)
  {
    size_t v12 = *(NSObject **)(v1 + 88);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_26368A000, v12, OS_LOG_TYPE_ERROR, "Failed to create xpc dictionary to reset CommCenter stats", buf, 2u);
    }
    goto LABEL_24;
  }
  xpc_object_t v15 = xpc_int64_create(1);
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, "KeyCommCenterStatsLaunchCount", v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  int64_t v17 = time(0);
  xpc_object_t v18 = xpc_int64_create(v17);
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, "KeyCommCenterStatsFirstLaunchTime", v18);
  xpc_object_t v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (!qword_26A99F3E8)
  {
    xpc_object_t v20 = (HealthEventDB *)operator new(0xA0uLL);
    HealthEventDB::HealthEventDB(v20);
    uint64_t v21 = (std::__shared_weak_count *)operator new(0x20uLL);
    v21->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAA828;
    v21->__shared_owners_ = 0;
    v21->__shared_weak_owners_ = 0;
    v21[1].__vftable = (std::__shared_weak_count_vtbl *)v20;
    xpc_object_t v29 = (std::__shared_weak_count *)off_26A99F3F0;
    qword_26A99F3E8 = (uint64_t)v20;
    off_26A99F3F0 = v21;
    if (!v29) {
      goto LABEL_50;
    }
    if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  xpc_object_t v20 = (HealthEventDB *)qword_26A99F3E8;
  uint64_t v21 = (std::__shared_weak_count *)off_26A99F3F0;
  if (off_26A99F3F0) {
LABEL_50:
  }
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  xpc_object_t v37 = v10;
  if (v10) {
    xpc_retain(v10);
  }
  else {
    xpc_object_t v37 = xpc_null_create();
  }
  HealthEventDB::updateCommCenterStats((uint64_t *)v20, &v37);
  xpc_release(v37);
  xpc_object_t v37 = 0;
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
LABEL_24:
  xpc_release(v10);
  xpc_object_t object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v14 = v13;
  if (v13)
  {
    xpc_object_t object = v13;
  }
  else
  {
    xpc_object_t v14 = xpc_null_create();
    xpc_object_t object = v14;
    if (!v14)
    {
      xpc_object_t v22 = xpc_null_create();
      xpc_object_t v14 = 0;
      goto LABEL_38;
    }
  }
  if (MEMORY[0x263E6A240](v14) == v9)
  {
    xpc_retain(v14);
    goto LABEL_39;
  }
  xpc_object_t v22 = xpc_null_create();
LABEL_38:
  xpc_object_t object = v22;
LABEL_39:
  xpc_release(v14);
  if (MEMORY[0x263E6A240](object) == v9)
  {
    uint64_t v24 = *MEMORY[0x263F26540];
    *(void *)std::string buf = &object;
    uint64_t v34 = v24;
    xpc::dict::object_proxy::operator=(&v35, (uint64_t)buf);
    xpc_release(v35);
    xpc_object_t v35 = 0;
    uint64_t v25 = *MEMORY[0x263F26548];
    *(void *)std::string buf = &object;
    uint64_t v34 = v25;
    xpc::dict::object_proxy::operator=(&v32, (uint64_t)buf);
    xpc_release(v32);
    xpc_object_t v32 = 0;
    uint64_t v26 = *MEMORY[0x263F26618];
    *(void *)std::string buf = &object;
    uint64_t v34 = v26;
    xpc::dict::object_proxy::operator=(&v31, (uint64_t)buf);
    xpc_release(v31);
    xpc_object_t v31 = 0;
    pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
    if (!qword_26A99F3E8)
    {
      long long v28 = (HealthEventDB *)operator new(0xA0uLL);
      HealthEventDB::HealthEventDB(v28);
      BOOL v27 = (std::__shared_weak_count *)operator new(0x20uLL);
      v27->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAA828;
      v27->__shared_owners_ = 0;
      v27->__shared_weak_owners_ = 0;
      v27[1].__vftable = (std::__shared_weak_count_vtbl *)v28;
      uint64_t v30 = (std::__shared_weak_count *)off_26A99F3F0;
      qword_26A99F3E8 = (uint64_t)v28;
      off_26A99F3F0 = v27;
      if (!v30)
      {
LABEL_60:
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_61:
        pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
        *(void *)std::string buf = object;
        if (object) {
          xpc_retain(object);
        }
        else {
          *(void *)std::string buf = xpc_null_create();
        }
        HealthEventDB::updateBootStats((uint64_t *)v28, (void **)buf);
        xpc_release(*(xpc_object_t *)buf);
        *(void *)std::string buf = 0;
        if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
        goto LABEL_42;
      }
      if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    long long v28 = (HealthEventDB *)qword_26A99F3E8;
    BOOL v27 = (std::__shared_weak_count *)off_26A99F3F0;
    if (!off_26A99F3F0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
  uint64_t v23 = *(NSObject **)(v1 + 88);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_error_impl(&dword_26368A000, v23, OS_LOG_TYPE_ERROR, "Failed to create xpc dictionary to reset Baseband stats", buf, 2u);
  }
LABEL_42:
  xpc_release(object);
}

void sub_263794938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object, xpc_object_t a16)
{
  (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void xpc::dict::object_proxy::operator=(void *a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_null_create();
  xpc_dictionary_set_value(**(xpc_object_t **)a2, *(const char **)(a2 + 8), v4);
  *a1 = v4;
  xpc_object_t v5 = xpc_null_create();
  xpc_release(v5);
}

void dispatch::async<void ctu::SharedSynchronizable<HealthModule>::execute_wrapped<HealthModule::initialize(dispatch::group_session)::$_1>(HealthModule::initialize(dispatch::group_session)::$_1 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<HealthModule::initialize(dispatch::group_session)::$_1,dispatch_queue_s *::default_delete<HealthModule::initialize(dispatch::group_session)::$_1>>)::{lambda(void *)#1}::__invoke(void *a1)
{
  std::string v2 = *(uint64_t **)a1;
  uint64_t v3 = **(void **)a1;
  xpc_object_t v4 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_26368A000, v4, OS_LOG_TYPE_DEFAULT, "#I Initializing", buf, 2u);
  }
  xpc_object_t v5 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
  size_t v6 = strlen(v5);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    xpc_object_t v8 = (void **)operator new(v9 + 1);
    __dst[1] = v7;
    unint64_t v64 = v10 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v64) = v6;
    xpc_object_t v8 = __dst;
    if (!v6) {
      goto LABEL_11;
    }
  }
  memmove(v8, v5, (size_t)v7);
LABEL_11:
  *((unsigned char *)v7 + (void)v8) = 0;
  xpc_object_t v62 = 0;
  AppleBasebandManager::create();
  long long v11 = *(_OWORD *)buf;
  *(void *)std::string buf = 0;
  *(void *)&uint8_t buf[8] = 0;
  size_t v12 = *(std::__shared_weak_count **)(v3 + 160);
  *(_OWORD *)(v3 + 152) = v11;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  xpc_object_t v13 = *(std::__shared_weak_count **)&buf[8];
  if (!*(void *)&buf[8]
    || atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    xpc_object_t v14 = v62;
    if (!v62) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  xpc_object_t v14 = v62;
  if (v62) {
LABEL_17:
  }
    CFRelease(v14);
LABEL_18:
  if (SHIBYTE(v64) < 0) {
    operator delete(__dst[0]);
  }
  buf[23] = 21;
  strcpy(buf, "CommandGetHealthStats");
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_33_3;
  aBlock[4] = v2[2];
  xpc_object_t v15 = (std::__shared_weak_count *)v2[3];
  unint64_t v60 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v16 = _Block_copy(aBlock);
  long long v61 = v16;
  Service::registerCommandHandler(v3, (uint64_t)buf, &v61);
  if (v16) {
    _Block_release(v16);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  *(void *)std::string buf = operator new(0x20uLL);
  *(_OWORD *)&uint8_t buf[8] = xmmword_2637A67A0;
  strcpy(*(char **)buf, "CommandUpdateBBBootStats");
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 1174405120;
  v56[2] = ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_34;
  v56[3] = &__block_descriptor_tmp_37_3;
  v56[4] = v2[2];
  int64_t v17 = (std::__shared_weak_count *)v2[3];
  unint64_t v57 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v18 = _Block_copy(v56);
  uint64_t v58 = v18;
  Service::registerCommandHandler(v3, (uint64_t)buf, &v58);
  if (v18) {
    _Block_release(v18);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  xpc_object_t v19 = (const void *)*MEMORY[0x263F26650];
  size_t v20 = strlen((const char *)*MEMORY[0x263F26650]);
  if (v20 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v21 = (void *)v20;
  if (v20 >= 0x17)
  {
    uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17) {
      uint64_t v23 = v20 | 7;
    }
    uint64_t v24 = v23 + 1;
    xpc_object_t v22 = operator new(v23 + 1);
    __p[1] = v21;
    unint64_t v55 = v24 | 0x8000000000000000;
    __p[0] = v22;
    goto LABEL_39;
  }
  HIBYTE(v55) = v20;
  xpc_object_t v22 = __p;
  if (v20) {
LABEL_39:
  }
    memmove(v22, v19, (size_t)v21);
  *((unsigned char *)v21 + (void)v22) = 0;
  *(void *)std::string buf = MEMORY[0x263EF8330];
  *(void *)&uint8_t buf[8] = 1174405120;
  *(void *)&uint8_t buf[16] = ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_38;
  xpc_object_t v48 = &__block_descriptor_tmp_48_2;
  uint64_t v49 = v3;
  uint64_t v50 = v2[2];
  uint64_t v25 = (std::__shared_weak_count *)v2[3];
  xpc_object_t v51 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v26 = _Block_copy(buf);
  BOOL v27 = *(NSObject **)(v3 + 136);
  if (v27) {
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  }
  CFAllocatorRef v52 = v26;
  dispatch_object_t object = v27;
  AppleBasebandManager::setEventHandler();
  if (object) {
    dispatch_release(object);
  }
  if (v52) {
    _Block_release(v52);
  }
  if (SHIBYTE(v55) < 0) {
    operator delete(__p[0]);
  }
  long long v28 = (const void *)*MEMORY[0x263F26238];
  size_t v29 = strlen((const char *)*MEMORY[0x263F26238]);
  if (v29 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v30 = (void *)v29;
  if (v29 >= 0x17)
  {
    uint64_t v32 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v29 | 7) != 0x17) {
      uint64_t v32 = v29 | 7;
    }
    uint64_t v33 = v32 + 1;
    xpc_object_t v31 = operator new(v32 + 1);
    v45[1] = v30;
    unint64_t v46 = v33 | 0x8000000000000000;
    v45[0] = v31;
    goto LABEL_57;
  }
  HIBYTE(v46) = v29;
  xpc_object_t v31 = v45;
  if (v29) {
LABEL_57:
  }
    memmove(v31, v28, (size_t)v30);
  *((unsigned char *)v30 + (void)v31) = 0;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 1174405120;
  v41[2] = ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_49;
  v41[3] = &__block_descriptor_tmp_52_1;
  v41[4] = v3;
  v41[5] = v2[2];
  uint64_t v34 = (std::__shared_weak_count *)v2[3];
  uint64_t v42 = v34;
  if (v34) {
    atomic_fetch_add_explicit(&v34->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v35 = _Block_copy(v41);
  char v36 = *(NSObject **)(v3 + 136);
  if (v36) {
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  }
  uint64_t v43 = v35;
  dispatch_object_t v44 = v36;
  AppleBasebandManager::setEventHandler();
  if (v44) {
    dispatch_release(v44);
  }
  if (v43) {
    _Block_release(v43);
  }
  if (SHIBYTE(v46) < 0) {
    operator delete(v45[0]);
  }
  AppleBasebandManager::eventsOn(*(AppleBasebandManager **)(v3 + 152));
  if (v42) {
    std::__shared_weak_count::__release_weak(v42);
  }
  if (v51) {
    std::__shared_weak_count::__release_weak(v51);
  }
  if (v57) {
    std::__shared_weak_count::__release_weak(v57);
  }
  if (v60) {
    std::__shared_weak_count::__release_weak(v60);
  }
  xpc_object_t v37 = (std::__shared_weak_count *)v2[3];
  if (v37) {
    std::__shared_weak_count::__release_weak(v37);
  }
  uint64_t v38 = v2[1];
  if (v38)
  {
    dispatch_group_leave(v38);
    unint64_t v39 = v2[1];
    if (v39) {
      dispatch_release(v39);
    }
  }
  operator delete(v2);
  uint64_t v40 = (std::__shared_weak_count *)*((void *)a1 + 2);
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
  operator delete(a1);
}

void sub_26379530C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, void *aBlock, dispatch_object_t object, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,std::__shared_weak_count *a33,void *a34,dispatch_object_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,std::__shared_weak_count *a47)
{
  if (a15) {
    std::__shared_weak_count::__release_weak(a15);
  }
  if (a33) {
    std::__shared_weak_count::__release_weak(a33);
  }
  if (a47) {
    std::__shared_weak_count::__release_weak(a47);
  }
  xpc_object_t v51 = *(std::__shared_weak_count **)(v49 - 144);
  if (v51) {
    std::__shared_weak_count::__release_weak(v51);
  }
  CFAllocatorRef v52 = (std::__shared_weak_count *)v48[3];
  if (v52) {
    std::__shared_weak_count::__release_weak(v52);
  }
  std::string::size_type v53 = v48[1];
  if (v53)
  {
    dispatch_group_leave(v53);
    long long v54 = v48[1];
    if (v54) {
      dispatch_release(v54);
    }
  }
  operator delete(v48);
  unint64_t v55 = (std::__shared_weak_count *)v47[2];
  if (v55)
  {
    if (!atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  operator delete(v47);
  _Unwind_Resume(a1);
}

void ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  xpc_object_t v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (!v4) {
    return;
  }
  size_t v6 = std::__shared_weak_count::lock(v4);
  uint64_t v16 = v6;
  if (!v6) {
    return;
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v9 = v6;
LABEL_20:
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    return;
  }
  xpc_object_t v14 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (qword_26A99F3E8)
  {
LABEL_5:
    xpc_object_t v8 = (HealthEventDB *)qword_26A99F3E8;
    uint64_t v7 = (std::__shared_weak_count *)off_26A99F3F0;
    xpc_object_t object = (xpc_object_t)qword_26A99F3E8;
    xpc_object_t v13 = (std::__shared_weak_count *)off_26A99F3F0;
    if (!off_26A99F3F0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  xpc_object_t v8 = (HealthEventDB *)operator new(0xA0uLL);
  HealthEventDB::HealthEventDB(v8);
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x20uLL);
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAA828;
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  uint64_t v10 = (std::__shared_weak_count *)off_26A99F3F0;
  qword_26A99F3E8 = (uint64_t)v8;
  off_26A99F3F0 = v7;
  if (v10)
  {
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    goto LABEL_5;
  }
  xpc_object_t object = v8;
  xpc_object_t v13 = v7;
LABEL_12:
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_13:
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  HealthEventDB::getHealthInfo(v8, &v14);
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  if (MEMORY[0x263E6A240](v14) == MEMORY[0x263EF8708])
  {
    LODWORD(object) = 0;
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(a3, (unsigned int *)&object, &v14);
  }
  else
  {
    uint64_t v11 = *a3;
    xpc_object_t object = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v11 + 16))(v11, 3760250880, &object);
    xpc_release(object);
  }
  xpc_release(v14);
  uint64_t v9 = v16;
  if (v16) {
    goto LABEL_20;
  }
}

void sub_26379574C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, xpc_object_t object, char a13)
{
}

uint64_t __copy_helper_block_e8_32c37_ZTSNSt3__18weak_ptrI12HealthModuleEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c37_ZTSNSt3__18weak_ptrI12HealthModuleEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_34(uint64_t a1, void **a2, uint64_t *a3)
{
  uint64_t v19 = 0;
  size_t v20 = 0;
  xpc_object_t v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (!v4) {
    goto LABEL_21;
  }
  size_t v20 = std::__shared_weak_count::lock(v4);
  if (!v20) {
    return;
  }
  uint64_t v19 = *(void *)(a1 + 32);
  if (!v19) {
    goto LABEL_21;
  }
  pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (qword_26A99F3E8)
  {
LABEL_5:
    xpc_object_t v8 = (HealthEventDB *)qword_26A99F3E8;
    uint64_t v7 = off_26A99F3F0;
    xpc_object_t v17 = (xpc_object_t)qword_26A99F3E8;
    xpc_object_t v18 = (std::__shared_weak_count *)off_26A99F3F0;
    if (!off_26A99F3F0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  xpc_object_t v8 = (HealthEventDB *)operator new(0xA0uLL);
  HealthEventDB::HealthEventDB(v8);
  uint64_t v7 = operator new(0x20uLL);
  *uint64_t v7 = &unk_270EAA828;
  v7[1] = 0;
  v7[2] = 0;
  v7[3] = v8;
  uint64_t v9 = (std::__shared_weak_count *)off_26A99F3F0;
  qword_26A99F3E8 = (uint64_t)v8;
  off_26A99F3F0 = v7;
  if (v9)
  {
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    goto LABEL_5;
  }
  xpc_object_t v17 = v8;
  xpc_object_t v18 = (std::__shared_weak_count *)v7;
LABEL_11:
  atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
LABEL_12:
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  uint64_t v10 = *a2;
  xpc_object_t object = v10;
  if (v10) {
    xpc_retain(v10);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  char updated = HealthEventDB::updateBootStats((uint64_t *)v8, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  size_t v12 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (updated) {
      goto LABEL_18;
    }
  }
  else if (updated)
  {
LABEL_18:
    uint64_t v13 = *a3;
    xpc_object_t v17 = xpc_null_create();
    (*(void (**)(uint64_t, void, xpc_object_t *))(v13 + 16))(v13, 0, &v17);
    xpc_release(v17);
    goto LABEL_21;
  }
  uint64_t v14 = *a3;
  xpc_object_t v17 = xpc_null_create();
  (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v14 + 16))(v14, 3760250880, &v17);
  xpc_release(v17);
LABEL_21:
  xpc_object_t v15 = v20;
  if (v20)
  {
    if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

void sub_263795AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, xpc_object_t object, uint64_t a12, char a13)
{
  (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_38(void *a1, abm::client::Event **a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (!v3) {
    return;
  }
  uint64_t v5 = a1[4];
  size_t v6 = std::__shared_weak_count::lock(v3);
  CFAllocatorRef v52 = v6;
  if (!v6) {
    return;
  }
  if (!a1[5])
  {
    uint64_t v26 = v6;
LABEL_100:
    if (!atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
    return;
  }
  CFDictionaryRef v50 = (const __CFDictionary *)0xAAAAAAAAAAAAAAAALL;
  abm::client::Event::getData((uint64_t *)&v50, *a2);
  CFDictionaryRef v7 = v50;
  if (v50) {
    xpc_object_t v8 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    xpc_object_t v8 = 0;
  }
  if (v8)
  {
    v49[0] = 0xAAAAAAAAAAAAAAAALL;
    v49[1] = 0xAAAAAAAAAAAAAAAALL;
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v49, v50);
    memset(v48, 170, sizeof(v48));
    uint64_t v9 = (const char *)*MEMORY[0x263F26140];
    buf[23] = 0;
    buf[0] = 0;
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v46, v9);
    ctu::cf::map_adapter::getString();
    MEMORY[0x263E68C90](&v46);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    int v10 = SHIBYTE(v48[2]);
    if (SHIBYTE(v48[2]) >= 0) {
      size_t v11 = HIBYTE(v48[2]);
    }
    else {
      size_t v11 = (size_t)v48[1];
    }
    if (v11 != strlen((const char *)*MEMORY[0x263F26508])
      || (SHIBYTE(v48[2]) >= 0 ? (size_t v12 = v48) : (size_t v12 = (void **)v48[0]),
          memcmp(v12, (const void *)*MEMORY[0x263F26508], v11)))
    {
      if (v11 != strlen((const char *)*MEMORY[0x263F26170])
        || (v10 >= 0 ? (uint64_t v13 = v48) : (uint64_t v13 = (void **)v48[0]), memcmp(v13, (const void *)*MEMORY[0x263F26170], v11)))
      {
        if (v11 == strlen((const char *)*MEMORY[0x263F263E8]))
        {
          uint64_t v14 = v10 >= 0 ? v48 : (void **)v48[0];
          if (!memcmp(v14, (const void *)*MEMORY[0x263F263E8], v11))
          {
            if (*(void *)(v5 + 184))
            {
              xpc_object_t v15 = *(NSObject **)(v5 + 88);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)std::string buf = 0;
                _os_log_impl(&dword_26368A000, v15, OS_LOG_TYPE_DEFAULT, "#I Baseband ping timer already running", buf, 2u);
                xpc_object_t v15 = *(NSObject **)(v5 + 88);
              }
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)std::string buf = 0;
                _os_log_impl(&dword_26368A000, v15, OS_LOG_TYPE_DEFAULT, "#I Canceling baseband ping timer", buf, 2u);
              }
              (*(void (**)(void))(**(void **)(v5 + 184) + 16))(*(void *)(v5 + 184));
              uint64_t v16 = *(void *)(v5 + 184);
              *(void *)(v5 + 184) = 0;
              if (v16) {
                (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
              }
              pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
              uint64_t v17 = xmmword_26A99F3E8;
              if (!(void)xmmword_26A99F3E8)
              {
                HealthEventDB::create_default_global((HealthEventDB *)buf);
                std::shared_ptr<HealthEventDB>::operator=[abi:ne180100]((uint64_t)buf);
                std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)buf);
                uint64_t v17 = xmmword_26A99F3E8;
              }
              *(void *)&long long v46 = v17;
              *((void *)&v46 + 1) = *((void *)&xmmword_26A99F3E8 + 1);
              if (*((void *)&xmmword_26A99F3E8 + 1)) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A99F3E8 + 1) + 8), 1uLL, memory_order_relaxed);
              }
              pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
              HealthEventDB::addHealthEvent((HealthEventDB *)v46, 4);
              std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&v46);
            }
            xpc_object_t v18 = *(NSObject **)(v5 + 88);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(void *)std::string buf = 0xA04000100;
              _os_log_impl(&dword_26368A000, v18, OS_LOG_TYPE_DEFAULT, "#I Starting %u sec timer before pinging baseband", buf, 8u);
            }
            uint64_t v19 = *(void *)(v5 + 168);
            std::string __p = operator new(0x28uLL);
            long long v45 = xmmword_2637A8E10;
            strcpy((char *)__p, "Baseband HealthModule Ping Timer");
            size_t v20 = *(NSObject **)(v5 + 136);
            dispatch_object_t object = v20;
            if (v20) {
              dispatch_retain(v20);
            }
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 1174405120;
            v40[2] = ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_40;
            v40[3] = &__block_descriptor_tmp_44;
            uint64_t v22 = a1[5];
            uint64_t v21 = (std::__shared_weak_count *)a1[6];
            v40[4] = v5;
            v40[5] = v22;
            xpc_object_t v41 = v21;
            if (v21) {
              atomic_fetch_add_explicit(&v21->__shared_weak_owners_, 1uLL, memory_order_relaxed);
            }
            xpc_object_t aBlock = _Block_copy(v40);
            ctu::TimerService::createOneShotTimer((uint64_t)buf, v19, (uint64_t)&__p, &object, &aBlock);
            uint64_t v23 = *(void *)buf;
            *(void *)std::string buf = 0;
            uint64_t v24 = *(void *)(v5 + 184);
            *(void *)(v5 + 184) = v23;
            if (v24)
            {
              (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
              uint64_t v25 = *(void *)buf;
              *(void *)std::string buf = 0;
              if (v25) {
                (*(void (**)(uint64_t))(*(void *)v25 + 8))(v25);
              }
            }
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (object) {
              dispatch_release(object);
            }
            if (SHIBYTE(v45) < 0) {
              operator delete(__p);
            }
            if (v41) {
              std::__shared_weak_count::__release_weak(v41);
            }
          }
        }
LABEL_94:
        HealthModule::checkFailuresAgainstThresholdAndEraseEFSAccordingly_sync((NSObject **)v5);
        if (SHIBYTE(v48[2]) < 0) {
          operator delete(v48[0]);
        }
        MEMORY[0x263E68CD0](v49);
        CFDictionaryRef v7 = v50;
        goto LABEL_97;
      }
      pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
      if (!(void)xmmword_26A99F3E8)
      {
        uint64_t v34 = (HealthEventDB *)operator new(0xA0uLL);
        HealthEventDB::HealthEventDB(v34);
        uint64_t v33 = operator new(0x20uLL);
        *uint64_t v33 = &unk_270EAA828;
        v33[1] = 0;
        v33[2] = 0;
        v33[3] = v34;
        xpc_object_t v35 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
        *(void *)&xmmword_26A99F3E8 = v34;
        *((void *)&xmmword_26A99F3E8 + 1) = v33;
        if (!v35)
        {
          *(void *)std::string buf = v34;
          *(void *)&uint8_t buf[8] = v33;
          goto LABEL_78;
        }
        if (!atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      uint64_t v33 = (void *)*((void *)&xmmword_26A99F3E8 + 1);
      uint64_t v34 = (HealthEventDB *)xmmword_26A99F3E8;
      *(_OWORD *)std::string buf = xmmword_26A99F3E8;
      if (!*((void *)&xmmword_26A99F3E8 + 1))
      {
LABEL_79:
        pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
        char v36 = (HealthModule *)HealthEventDB::addHealthEvent(v34, 2);
        xpc_object_t v37 = *(std::__shared_weak_count **)&buf[8];
        if (*(void *)&buf[8]
          && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
        HealthModule::sendUserNotificationForCellularDiagnostics(v36);
        goto LABEL_94;
      }
LABEL_78:
      atomic_fetch_add_explicit(v33 + 1, 1uLL, memory_order_relaxed);
      goto LABEL_79;
    }
    memset(buf, 170, sizeof(buf));
    BOOL v27 = (const char *)*MEMORY[0x263F26368];
    char v47 = 0;
    LOBYTE(v46) = 0;
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v53, v27);
    ctu::cf::map_adapter::getString();
    MEMORY[0x263E68C90](&v53);
    if (v47 < 0) {
      operator delete((void *)v46);
    }
    char v28 = buf[23];
    if (buf[23] >= 0) {
      size_t v29 = buf[23];
    }
    else {
      size_t v29 = *(void *)&buf[8];
    }
    if (v29 != strlen((const char *)*MEMORY[0x263F26710])
      || (buf[23] >= 0 ? (uint64_t v30 = buf) : (uint64_t v30 = *(unsigned char **)buf), memcmp(v30, (const void *)*MEMORY[0x263F26710], v29)))
    {
LABEL_92:
      if (v28 < 0) {
        operator delete(*(void **)buf);
      }
      goto LABEL_94;
    }
    pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
    if (!(void)xmmword_26A99F3E8)
    {
      uint64_t v32 = (HealthEventDB *)operator new(0xA0uLL);
      HealthEventDB::HealthEventDB(v32);
      xpc_object_t v31 = operator new(0x20uLL);
      *xpc_object_t v31 = &unk_270EAA828;
      v31[1] = 0;
      v31[2] = 0;
      v31[3] = v32;
      uint64_t v38 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
      *(void *)&xmmword_26A99F3E8 = v32;
      *((void *)&xmmword_26A99F3E8 + 1) = v31;
      if (!v38)
      {
        *(void *)&long long v46 = v32;
        *((void *)&v46 + 1) = v31;
        goto LABEL_87;
      }
      if (!atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    xpc_object_t v31 = (void *)*((void *)&xmmword_26A99F3E8 + 1);
    uint64_t v32 = (HealthEventDB *)xmmword_26A99F3E8;
    long long v46 = xmmword_26A99F3E8;
    if (!*((void *)&xmmword_26A99F3E8 + 1))
    {
LABEL_88:
      pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
      HealthEventDB::addHealthEvent(v32, 1);
      unint64_t v39 = (std::__shared_weak_count *)*((void *)&v46 + 1);
      if (*((void *)&v46 + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v46 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
      char v28 = buf[23];
      goto LABEL_92;
    }
LABEL_87:
    atomic_fetch_add_explicit(v31 + 1, 1uLL, memory_order_relaxed);
    goto LABEL_88;
  }
LABEL_97:
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v26 = v52;
  if (v52) {
    goto LABEL_100;
  }
}

void sub_2637963EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, void *aBlock, dispatch_object_t object, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  (*(void (**)(uint64_t))(*(void *)v35 + 8))(v35);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (*(char *)(v36 - 57) < 0) {
    operator delete(*(void **)(v36 - 80));
  }
  if (a35 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E68CD0](v36 - 128);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)(v36 - 112));
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v36 - 104);
  _Unwind_Resume(a1);
}

void ctu::TimerService::createOneShotTimer(uint64_t a1, uint64_t a2, uint64_t a3, NSObject **a4, void **a5)
{
  uint64_t v9 = *(void *)(a3 + 16);
  *(_OWORD *)std::string __p = *(_OWORD *)a3;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  uint64_t v5 = *a4;
  *a4 = 0;
  xpc_object_t aBlock = *a5;
  dispatch_object_t object = v5;
  *a5 = 0;
  (*(void (**)(uint64_t, void **, void, uint64_t, void, dispatch_object_t *, void **))(*(void *)a2 + 16))(a2, __p, 0, 10000000, 0, &object, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (object) {
    dispatch_release(object);
  }
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2637966E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *aBlock, dispatch_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (object)
  {
    dispatch_release(object);
    if ((a16 & 0x80000000) == 0) {
LABEL_5:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a16 & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_40(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = (void *)a1[4];
    xpc_object_t v4 = std::__shared_weak_count::lock(v2);
    size_t v12 = v4;
    if (v4)
    {
      uint64_t v5 = v4;
      if (a1[5])
      {
        size_t v6 = v3[11];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl(&dword_26368A000, v6, OS_LOG_TYPE_DEFAULT, "#I Pinging baseband to verify it is healthy", buf, 2u);
        }
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 0x40000000;
        v8[2] = ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_41;
        v8[3] = &__block_descriptor_tmp_43;
        v8[4] = v3;
        CFDictionaryRef v7 = _Block_copy(v8);
        uint64_t v9 = v7;
        HealthModule::getBasebandFWVersion_sync(v3, &v9);
        if (v7) {
          _Block_release(v7);
        }
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_26379688C(_Unwind_Exception *a1)
{
  if (v1) {
    _Block_release(v1);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v2 - 48);
  _Unwind_Resume(a1);
}

void ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(NSObject ***)(a1 + 32);
  char v4 = *(unsigned char *)(a2 + 23);
  if (v4 < 0)
  {
    if (*(void *)(a2 + 8))
    {
LABEL_3:
      uint64_t v5 = v3[11];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (v4 < 0) {
          uint64_t v2 = (void *)*v2;
        }
        LODWORD(v13) = 136315138;
        *(void *)((char *)&v13 + 4) = v2;
        _os_log_impl(&dword_26368A000, v5, OS_LOG_TYPE_DEFAULT, "#I Successfully received ping response from baseband (firmware version is %s)", (uint8_t *)&v13, 0xCu);
      }
      pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
      if (!(void)xmmword_26A99F3E8)
      {
        CFDictionaryRef v7 = (HealthEventDB *)operator new(0xA0uLL);
        HealthEventDB::HealthEventDB(v7);
        size_t v6 = operator new(0x20uLL);
        *size_t v6 = &unk_270EAA828;
        v6[1] = 0;
        v6[2] = 0;
        v6[3] = v7;
        int v10 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
        *(void *)&xmmword_26A99F3E8 = v7;
        *((void *)&xmmword_26A99F3E8 + 1) = v6;
        if (!v10)
        {
          *(void *)&long long v13 = v7;
          *((void *)&v13 + 1) = v6;
          goto LABEL_21;
        }
        if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      size_t v6 = (void *)*((void *)&xmmword_26A99F3E8 + 1);
      CFDictionaryRef v7 = (HealthEventDB *)xmmword_26A99F3E8;
      long long v13 = xmmword_26A99F3E8;
      if (!*((void *)&xmmword_26A99F3E8 + 1))
      {
LABEL_22:
        pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
        HealthEventDB::addHealthEvent(v7, 3);
        size_t v12 = (std::__shared_weak_count *)*((void *)&v13 + 1);
        if (*((void *)&v13 + 1))
        {
          if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v13 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
        return;
      }
LABEL_21:
      atomic_fetch_add_explicit(v6 + 1, 1uLL, memory_order_relaxed);
      goto LABEL_22;
    }
  }
  else if (*(unsigned char *)(a2 + 23))
  {
    goto LABEL_3;
  }
  pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (!(void)xmmword_26A99F3E8)
  {
    uint64_t v9 = (HealthEventDB *)operator new(0xA0uLL);
    HealthEventDB::HealthEventDB(v9);
    xpc_object_t v8 = operator new(0x20uLL);
    void *v8 = &unk_270EAA828;
    v8[1] = 0;
    v8[2] = 0;
    v8[3] = v9;
    size_t v11 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
    *(void *)&xmmword_26A99F3E8 = v9;
    *((void *)&xmmword_26A99F3E8 + 1) = v8;
    if (!v11)
    {
      *(void *)&long long v13 = v9;
      *((void *)&v13 + 1) = v8;
      goto LABEL_27;
    }
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  xpc_object_t v8 = (void *)*((void *)&xmmword_26A99F3E8 + 1);
  uint64_t v9 = (HealthEventDB *)xmmword_26A99F3E8;
  long long v13 = xmmword_26A99F3E8;
  if (*((void *)&xmmword_26A99F3E8 + 1)) {
LABEL_27:
  }
    atomic_fetch_add_explicit(v8 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  HealthEventDB::addHealthEvent(v9, 4);
  if (*((void *)&v13 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v13 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v13 + 1) + 16))(*((void *)&v13 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v13 + 1));
  }

  HealthModule::checkFailuresAgainstThresholdAndEraseEFSAccordingly_sync(v3);
}

void sub_263796C00(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12HealthModuleEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12HealthModuleEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZZN12HealthModule10initializeEN8dispatch13group_sessionEENK3__1clEv_block_invoke_49(void *a1, abm::client::Event **a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    size_t v6 = std::__shared_weak_count::lock(v3);
    uint64_t v26 = v6;
    if (v6)
    {
      if (!a1[5])
      {
        uint64_t v17 = v6;
LABEL_47:
        if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
        return;
      }
      CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      abm::client::Event::getData((uint64_t *)&cf, *a2);
      if (cf) {
        CFDictionaryRef v7 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
      }
      else {
        CFDictionaryRef v7 = 0;
      }
      if (!v7)
      {
        xpc_object_t v18 = *(NSObject **)(v5 + 88);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl(&dword_26368A000, v18, OS_LOG_TYPE_DEFAULT, "#I Empty info passed", (uint8_t *)__p, 2u);
        }
        CFTypeRef v19 = cf;
        if (!cf)
        {
LABEL_46:
          uint64_t v17 = v26;
          if (!v26) {
            return;
          }
          goto LABEL_47;
        }
LABEL_45:
        CFRelease(v19);
        goto LABEL_46;
      }
      v23[0] = 0xAAAAAAAAAAAAAAAALL;
      v23[1] = 0xAAAAAAAAAAAAAAAALL;
      ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v23, (const __CFDictionary *)cf);
      memset(__p, 170, 24);
      xpc_object_t v8 = (const char *)*MEMORY[0x263F26268];
      char v29 = 0;
      LOBYTE(buf) = 0;
      ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v27, v8);
      ctu::cf::map_adapter::getString();
      MEMORY[0x263E68C90](&v27);
      if (v29 < 0) {
        operator delete((void *)buf);
      }
      uint64_t v9 = *(NSObject **)(v5 + 88);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = __p;
        if (SHIBYTE(__p[2]) < 0) {
          int v10 = (void **)__p[0];
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_26368A000, v9, OS_LOG_TYPE_DEFAULT, "#I %s detected", (uint8_t *)&buf, 0xCu);
      }
      char v11 = HIBYTE(__p[2]);
      if (SHIBYTE(__p[2]) >= 0) {
        size_t v12 = HIBYTE(__p[2]);
      }
      else {
        size_t v12 = (size_t)__p[1];
      }
      if (v12 != strlen((const char *)*MEMORY[0x263F26800])
        || (SHIBYTE(__p[2]) >= 0 ? (long long v13 = __p) : (long long v13 = (void **)__p[0]),
            memcmp(v13, (const void *)*MEMORY[0x263F26800], v12)))
      {
LABEL_41:
        if (v11 < 0)
        {
          operator delete(__p[0]);
          MEMORY[0x263E68CD0](v23);
          CFTypeRef v19 = cf;
          if (!cf) {
            goto LABEL_46;
          }
        }
        else
        {
          MEMORY[0x263E68CD0](v23);
          CFTypeRef v19 = cf;
          if (!cf) {
            goto LABEL_46;
          }
        }
        goto LABEL_45;
      }
      uint64_t v14 = *(NSObject **)(v5 + 88);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_26368A000, v14, OS_LOG_TYPE_DEFAULT, "#I Cleaning up health event db due to change in hardware model", (uint8_t *)&buf, 2u);
      }
      pthread_mutex_lock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
      if (!(void)xmmword_26A99F3E8)
      {
        uint64_t v16 = (HealthEventDB *)operator new(0xA0uLL);
        HealthEventDB::HealthEventDB(v16);
        xpc_object_t v15 = operator new(0x20uLL);
        *xpc_object_t v15 = &unk_270EAA828;
        v15[1] = 0;
        v15[2] = 0;
        v15[3] = v16;
        size_t v20 = (std::__shared_weak_count *)*((void *)&xmmword_26A99F3E8 + 1);
        *(void *)&xmmword_26A99F3E8 = v16;
        *((void *)&xmmword_26A99F3E8 + 1) = v15;
        if (!v20)
        {
          *(void *)&long long buf = v16;
          *((void *)&buf + 1) = v15;
          goto LABEL_36;
        }
        if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      xpc_object_t v15 = (void *)*((void *)&xmmword_26A99F3E8 + 1);
      uint64_t v16 = (HealthEventDB *)xmmword_26A99F3E8;
      long long buf = xmmword_26A99F3E8;
      if (!*((void *)&xmmword_26A99F3E8 + 1))
      {
LABEL_37:
        pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
        HealthEventDB::clearDB(v16);
        uint64_t v21 = (std::__shared_weak_count *)*((void *)&buf + 1);
        if (*((void *)&buf + 1)
          && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
        char v11 = HIBYTE(__p[2]);
        goto LABEL_41;
      }
LABEL_36:
      atomic_fetch_add_explicit(v15 + 1, 1uLL, memory_order_relaxed);
      goto LABEL_37;
    }
  }
}

void sub_263797114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, const void *a18, __int16 a19, char a20,char a21)
{
  (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  pthread_mutex_unlock(&ctu::Singleton<HealthEventDB,HealthEventDB,ctu::PthreadMutexGuardPolicy<HealthEventDB>>::sInstance);
  if (a14 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E68CD0](&a16);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a18);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK3ctu20SharedSynchronizableI12HealthModuleE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c41_ZTSNSt3__110shared_ptrIK12HealthModuleEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c41_ZTSNSt3__110shared_ptrIK12HealthModuleEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ctu::SharedLoggable<HealthModule,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EAD4B8;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  char v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void boost::throw_exception<std::length_error>(const std::logic_error *a1)
{
  exception = __cxa_allocate_exception(0x40uLL);
  uint64_t v3 = (void *)boost::wrapexcept<std::length_error>::wrapexcept((uint64_t)exception, a1);
}

uint64_t boost::wrapexcept<std::length_error>::wrapexcept(uint64_t a1, const std::logic_error *a2)
{
  *(void *)a1 = &unk_270EA58F0;
  std::logic_error::logic_error((std::logic_error *)(a1 + 8), a2);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = -1;
  *(void *)a1 = &unk_270EAD6F8;
  *(void *)(a1 + 8) = &unk_270EAD728;
  *(void *)(a1 + 24) = &unk_270EAD750;
  return a1;
}

uint64_t boost::wrapexcept<std::length_error>::~wrapexcept(uint64_t a1)
{
  *(void *)(a1 + 24) = &unk_270EA5948;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 32) = 0;
  }
  MEMORY[0x263E69300](a1 + 8);
  return a1;
}

char *boost::wrapexcept<std::length_error>::clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x40uLL);
  *(void *)uint64_t v2 = &unk_270EA58F0;
  std::logic_error::logic_error((std::logic_error *)(v2 + 8), (const std::logic_error *)(a1 + 8));
  *((void *)v2 + 1) = MEMORY[0x263F8C388] + 16;
  uint64_t v3 = *(void *)(a1 + 32);
  *((void *)v2 + 3) = &unk_270EA5948;
  *((void *)v2 + 4) = v3;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
  }
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  *((_DWORD *)v2 + 14) = *(_DWORD *)(a1 + 56);
  *(void *)uint64_t v2 = &unk_270EAD6F8;
  *((void *)v2 + 1) = &unk_270EAD728;
  *((void *)v2 + 3) = &unk_270EAD750;
  boost::exception_detail::copy_boost_exception((uint64_t)(v2 + 24), a1 + 24);
  return v2;
}

void boost::wrapexcept<std::length_error>::rethrow(uint64_t a1)
{
  exception = __cxa_allocate_exception(0x40uLL);
  boost::wrapexcept<std::length_error>::wrapexcept((uint64_t)exception, a1);
}

void sub_2637976C4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void boost::wrapexcept<std::length_error>::~wrapexcept(void *a1)
{
  a1[3] = &unk_270EA5948;
  uint64_t v2 = a1[4];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[4] = 0;
  }
  MEMORY[0x263E69300](a1 + 1);

  operator delete(a1);
}

void non-virtual thunk to'boost::wrapexcept<std::length_error>::~wrapexcept(uint64_t a1)
{
  *(void *)(a1 + 16) = &unk_270EA5948;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 24) = 0;
  }

  JUMPOUT(0x263E69300);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)(a1 + 16) = &unk_270EA5948;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 24) = 0;
  }
  MEMORY[0x263E69300](a1);

  operator delete((void *)(a1 - 8));
}

void non-virtual thunk to'boost::wrapexcept<std::length_error>::~wrapexcept(void *a1)
{
  *a1 = &unk_270EA5948;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }

  JUMPOUT(0x263E69300);
}

{
  uint64_t v2;
  uint64_t vars8;

  *a1 = &unk_270EA5948;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }
  MEMORY[0x263E69300](a1 - 2);

  operator delete(a1 - 3);
}

uint64_t boost::wrapexcept<std::length_error>::wrapexcept(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_270EA58F0;
  std::logic_error::logic_error((std::logic_error *)(a1 + 8), (const std::logic_error *)(a2 + 8));
  *(void *)(a1 + 8) = MEMORY[0x263F8C388] + 16;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = &unk_270EA5948;
  *(void *)(a1 + 32) = v4;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
  }
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  *(void *)a1 = &unk_270EAD6F8;
  *(void *)(a1 + 8) = &unk_270EAD728;
  *(void *)(a1 + 24) = &unk_270EAD750;
  return a1;
}

uint64_t config::hw::watch(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v1);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99F488;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 144))(v2);
  uint64_t v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_263797CF8(_Unwind_Exception *a1)
{
}

void sub_263797D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t config::hw::iPad(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v1);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99F488;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 136))(v2);
  uint64_t v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_263797EBC(_Unwind_Exception *a1)
{
}

void sub_263797ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::product(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99F488;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_263798088(_Unwind_Exception *a1)
{
}

void sub_2637980A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::deviceMaterial(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99F488;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 104))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_263798254(_Unwind_Exception *a1)
{
}

void sub_263798270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::getBootArgs(std::string *a1@<X8>)
{
  memset(v27, 170, 24);
  long long v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v4 = off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)__p, v3);
    long long v5 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v5;
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    long long v7 = (std::__shared_weak_count *)__p[1];
    if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    uint64_t v4 = off_26A99F488;
  }
  uint64_t v8 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  v27[3] = v4;
  v27[4] = *(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)v4 + 112))(v27, v4);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  HIBYTE(v26) = 9;
  strcpy((char *)__p, "boot-args");
  long long v9 = (uint64_t *)v27[1];
  if (v27[1])
  {
    while (1)
    {
      char v11 = (uint64_t **)v9;
      uint64_t v14 = (const void *)v9[4];
      size_t v12 = v9 + 4;
      long long v13 = v14;
      int v15 = *((char *)v12 + 23);
      if (v15 >= 0) {
        uint64_t v16 = v12;
      }
      else {
        uint64_t v16 = v13;
      }
      if (v15 >= 0) {
        unint64_t v17 = *((unsigned __int8 *)v12 + 23);
      }
      else {
        unint64_t v17 = v12[1];
      }
      if (v17 >= 9) {
        size_t v18 = 9;
      }
      else {
        size_t v18 = v17;
      }
      int v19 = memcmp(__p, v16, v18);
      if (v19)
      {
        if (v19 < 0) {
          goto LABEL_16;
        }
LABEL_30:
        int v20 = memcmp(v16, __p, v18);
        if (v20)
        {
          if ((v20 & 0x80000000) == 0) {
            goto LABEL_41;
          }
        }
        else if (v17 >= 9)
        {
LABEL_41:
          uint64_t v21 = (char *)v11;
          if (*((char *)v11 + 79) < 0) {
            goto LABEL_42;
          }
LABEL_40:
          long long v24 = *(_OWORD *)(v21 + 56);
          a1->__r_.__value_.__r.__words[2] = *((void *)v21 + 9);
          *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v24;
          goto LABEL_43;
        }
        long long v9 = v11[1];
        if (!v9)
        {
          int v10 = v11 + 1;
          goto LABEL_37;
        }
      }
      else
      {
        if (v17 <= 9) {
          goto LABEL_30;
        }
LABEL_16:
        long long v9 = *v11;
        int v10 = v11;
        if (!*v11) {
          goto LABEL_37;
        }
      }
    }
  }
  int v10 = (uint64_t **)&v27[1];
  char v11 = (uint64_t **)&v27[1];
LABEL_37:
  uint64_t v21 = (char *)operator new(0x50uLL);
  *((_OWORD *)v21 + 2) = *(_OWORD *)__p;
  uint64_t v22 = v26;
  __p[1] = 0;
  uint64_t v26 = 0;
  __p[0] = 0;
  *((void *)v21 + 6) = v22;
  *((void *)v21 + 7) = 0;
  *((void *)v21 + 8) = 0;
  *((void *)v21 + 9) = 0;
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  *((void *)v21 + 2) = v11;
  *int v10 = (uint64_t *)v21;
  uint64_t v23 = (uint64_t *)v21;
  if (*(void *)v27[0])
  {
    v27[0] = *(void *)v27[0];
    uint64_t v23 = *v10;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v27[1], v23);
  ++v27[2];
  if ((v21[79] & 0x80000000) == 0) {
    goto LABEL_40;
  }
LABEL_42:
  std::string::__init_copy_ctor_external(a1, *((const std::string::value_type **)v21 + 7), *((void *)v21 + 8));
LABEL_43:
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v27[1]);
}

void sub_263798598(_Unwind_Exception *a1)
{
}

void sub_2637985B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637985CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a16);
  _Unwind_Resume(a1);
}

void config::hw::regionCode(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99F488;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 72))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_263798788(_Unwind_Exception *a1)
{
}

void sub_2637987A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::regionInfo(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99F488;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 64))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_263798954(_Unwind_Exception *a1)
{
}

void sub_263798970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t config::build::carrier(config::build *this)
{
  uint64_t result = TelephonyUtilIsCarrierBuild();
  if (result) {
    return TelephonyUtilIsInternalBuild() ^ 1;
  }
  return result;
}

uint64_t config::build::internal_or_carrier(config::build *this)
{
  if (TelephonyUtilIsInternalBuild()) {
    return 1;
  }

  return TelephonyUtilIsCarrierBuild();
}

void config::build::version(config::build *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = (void (***)(void))off_26A99F488;
  if (!off_26A99F488)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
    off_26A99F488 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = (void (***)(void))off_26A99F488;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_26A99F488 + 1);
  if (*(&off_26A99F488 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F488 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (**v2)(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_263798B80(_Unwind_Exception *a1)
{
}

void sub_263798B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)(a1 + 8));
    if (*(char *)(a1 + 79) < 0)
    {
      operator delete(*(void **)(a1 + 56));
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
      {
LABEL_4:
        uint64_t v2 = (void *)a1;
LABEL_6:
        operator delete(v2);
        return;
      }
    }
    else if ((*(char *)(a1 + 55) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(*(void **)(a1 + 32));
    uint64_t v2 = (void *)a1;
    goto LABEL_6;
  }
}

uint64_t __cxx_global_var_init_18()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_26368A000);
  }
  return result;
}

void *Service::Service(void *result, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  void *result = &unk_270EAD770;
  result[1] = v3;
  result[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  result[3] = 0;
  result[4] = 0;
  result[5] = 0;
  return result;
}

void Service::~Service(Service *this)
{
  *(void *)this = &unk_270EAD770;
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 4);
    uint64_t v4 = (void *)*((void *)this + 3);
    if (v3 != v2)
    {
      do
      {
        if (*(char *)(v3 - 1) < 0) {
          operator delete(*(void **)(v3 - 24));
        }
        v3 -= 24;
      }
      while (v3 != v2);
      uint64_t v4 = (void *)*((void *)this + 3);
    }
    *((void *)this + 4) = v2;
    operator delete(v4);
  }
  long long v5 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

std::__shared_weak_count *Service::getServiceManager@<X0>(Service *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t result = (std::__shared_weak_count *)*((void *)this + 2);
  if (result)
  {
    uint64_t result = std::__shared_weak_count::lock(result);
    a2[1] = result;
    if (result) {
      *a2 = *((void *)this + 1);
    }
  }
  return result;
}

uint64_t Service::isServerDown(Service *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = std::__shared_weak_count::lock(v2);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *((void *)this + 1);
  if (v5)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 80))(v5);
    if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      return v6;
    }
  }
  else
  {
    uint64_t v6 = 1;
    if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      return v6;
    }
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return v6;
}

void sub_263798EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void Service::registerCommandHandler(uint64_t a1, uint64_t a2, const void **a3)
{
  unint64_t v6 = *(void *)(a1 + 32);
  if (v6 >= *(void *)(a1 + 40))
  {
    *(void *)(a1 + 32) = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)(a1 + 24), a2);
    uint64_t v8 = *(std::__shared_weak_count **)(a1 + 16);
    if (!v8) {
      return;
    }
  }
  else
  {
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(a1 + 32), *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else
    {
      long long v7 = *(_OWORD *)a2;
      *(void *)(v6 + 16) = *(void *)(a2 + 16);
      *(_OWORD *)unint64_t v6 = v7;
    }
    *(void *)(a1 + 32) = v6 + 24;
    *(void *)(a1 + 32) = v6 + 24;
    uint64_t v8 = *(std::__shared_weak_count **)(a1 + 16);
    if (!v8) {
      return;
    }
  }
  long long v9 = std::__shared_weak_count::lock(v8);
  v13[2] = v9;
  if (v9)
  {
    int v10 = v9;
    char v11 = *(void **)(a1 + 8);
    v13[1] = v11;
    if (v11)
    {
      size_t v12 = *a3 ? _Block_copy(*a3) : 0;
      v13[0] = v12;
      ServiceManager::registerCommandHandler((uint64_t)v11, a2, v13);
      if (v12) {
        _Block_release(v12);
      }
    }
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_263799014(_Unwind_Exception *a1)
{
  *(void *)(v2 + 32) = v1;
  _Unwind_Resume(a1);
}

void sub_26379901C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v11) {
    _Block_release(v11);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void ServiceManager::registerCommandHandler(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v5 = *a3;
  if (*a3) {
    uint64_t v5 = _Block_copy(v5);
  }
  xpc_object_t aBlock = v5;
  ServiceCtrl::registerCommandHandler(v4, a2, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_2637990A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(exception_object);
}

void Service::runCommand(uint64_t a1, uint64_t a2, xpc_object_t *a3, const void **a4)
{
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v5) {
    return;
  }
  long long v9 = std::__shared_weak_count::lock(v5);
  v16[2] = v9;
  if (!v9) {
    return;
  }
  int v10 = v9;
  char v11 = *(void **)(a1 + 8);
  v16[1] = v11;
  if (v11)
  {
    xpc_object_t v12 = *a3;
    v16[0] = v12;
    if (v12)
    {
      xpc_retain(v12);
      long long v13 = *a4;
      if (*a4)
      {
LABEL_6:
        uint64_t v14 = _Block_copy(v13);
LABEL_9:
        int v15 = v14;
        ServiceManager::runCommand((uint64_t)v11, a2, v16, &v15);
        if (v14) {
          _Block_release(v14);
        }
        xpc_release(v12);
        v16[0] = 0;
        goto LABEL_12;
      }
    }
    else
    {
      xpc_object_t v12 = xpc_null_create();
      v16[0] = v12;
      long long v13 = *a4;
      if (*a4) {
        goto LABEL_6;
      }
    }
    uint64_t v14 = 0;
    goto LABEL_9;
  }
LABEL_12:
  if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
}

void sub_263799204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v12) {
    _Block_release(v12);
  }
  xpc_release(v11);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void ServiceManager::runCommand(uint64_t a1, uint64_t a2, void **a3, void **a4)
{
  uint64_t v6 = *(void *)(a1 + 168);
  long long v7 = *a3;
  xpc_object_t object = v7;
  if (!v7)
  {
    xpc_object_t object = xpc_null_create();
    uint64_t v8 = *a4;
    if (!*a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  xpc_retain(v7);
  uint64_t v8 = *a4;
  if (*a4) {
LABEL_5:
  }
    uint64_t v8 = _Block_copy(v8);
LABEL_6:
  xpc_object_t aBlock = v8;
  ServiceCtrl::handleCommand(v6, a2, &object, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(object);
}

void sub_2637992D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *aBlock, xpc_object_t object)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void Service::broadcastEvent(uint64_t a1, uint64_t a2, const void **a3, const void **a4)
{
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v5) {
    return;
  }
  long long v9 = std::__shared_weak_count::lock(v5);
  int v19 = v9;
  if (!v9) {
    return;
  }
  int v10 = v9;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v18 = v11;
  if (!v11) {
    goto LABEL_19;
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v17, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v17 = *(std::string *)a2;
  }
  xpc_object_t v12 = *a3;
  uint64_t v16 = v12;
  if (v12) {
    CFRetain(v12);
  }
  if (*a4)
  {
    long long v13 = _Block_copy(*a4);
    int v15 = v13;
    uint64_t v14 = *(void *)(v11 + 184);
    if (!v14) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  long long v13 = 0;
  int v15 = 0;
  uint64_t v14 = *(void *)(v11 + 184);
  if (v14) {
LABEL_13:
  }
    dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v14, (uint64_t)&v17, &v16, &v15);
LABEL_14:
  if (v13) {
    _Block_release(v13);
  }
  if (v12) {
    CFRelease(v12);
  }
  if ((SHIBYTE(v17.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_19:
    if (atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_22:
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    return;
  }
  operator delete(v17.__r_.__value_.__l.__data_);
  if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_22;
  }
}

void sub_263799478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_263799494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  if (v18) {
    _Block_release(v18);
  }
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a10);
  if (a16 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void ServiceManager::broadcastEvent(uint64_t a1, uint64_t a2, const void **a3, void **a4)
{
  uint64_t v4 = *(void *)(a1 + 184);
  if (v4) {
    dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v4, a2, a3, a4);
  }
}

void Service::broadcastEvent(uint64_t a1, uint64_t a2, void **a3, const void **a4)
{
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    long long v9 = std::__shared_weak_count::lock(v5);
    uint64_t v26 = v9;
    if (v9)
    {
      int v10 = v9;
      uint64_t v11 = *(void *)(a1 + 8);
      uint64_t v25 = v11;
      if (!v11) {
        goto LABEL_32;
      }
      unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
      xpc_object_t v12 = *a3;
      xpc_object_t object = v12;
      if (v12) {
        xpc_retain(v12);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      xpc::bridge((uint64_t *)&cf, (xpc *)&object, v13);
      CFTypeRef v14 = cf;
      if (cf && (CFTypeID v15 = CFGetTypeID(cf), v15 == CFDictionaryGetTypeID()))
      {
        unint64_t v24 = (unint64_t)v14;
        CFRetain(v14);
        CFTypeRef v16 = cf;
        if (!cf)
        {
LABEL_13:
          xpc_release(object);
          if (*(char *)(a2 + 23) < 0) {
            std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
          }
          else {
            std::string v21 = *(std::string *)a2;
          }
          int v20 = v14;
          if (v14) {
            CFRetain(v14);
          }
          if (*a4)
          {
            std::string v17 = _Block_copy(*a4);
            int v19 = v17;
            uint64_t v18 = *(void *)(v11 + 184);
            if (!v18)
            {
LABEL_23:
              if (v17) {
                _Block_release(v17);
              }
              if (v14) {
                CFRelease(v14);
              }
              if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v21.__r_.__value_.__l.__data_);
                if (!v14) {
                  goto LABEL_32;
                }
              }
              else if (!v14)
              {
LABEL_32:
                if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
                  std::__shared_weak_count::__release_weak(v10);
                }
                return;
              }
              CFRelease(v14);
              goto LABEL_32;
            }
          }
          else
          {
            std::string v17 = 0;
            int v19 = 0;
            uint64_t v18 = *(void *)(v11 + 184);
            if (!v18) {
              goto LABEL_23;
            }
          }
          dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v18, (uint64_t)&v21, &v20, &v19);
          goto LABEL_23;
        }
      }
      else
      {
        CFTypeRef v14 = 0;
        unint64_t v24 = 0;
        CFTypeRef v16 = cf;
        if (!cf) {
          goto LABEL_13;
        }
      }
      CFRelease(v16);
      goto LABEL_13;
    }
  }
}

void sub_2637996E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, const void *a19, __int16 a20,char a21,char a22)
{
}

void sub_26379974C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, char a15, uint64_t a16, char a17)
{
}

void Service::getRegisteredCommands(Service *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *((void *)this + 3), *((void *)this + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 4) - *((void *)this + 3)) >> 3));
}

void ServiceManager::~ServiceManager(ServiceManager *this)
{
  *(void *)this = &unk_270EAD7E0;
  uint64_t v2 = (const void *)*((void *)this + 23);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = *((void *)this + 18);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 19);
    uint64_t v6 = (void *)*((void *)this + 18);
    if (v5 != v4)
    {
      do
      {
        long long v7 = *(std::__shared_weak_count **)(v5 - 8);
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        v5 -= 16;
      }
      while (v5 != v4);
      uint64_t v6 = (void *)*((void *)this + 18);
    }
    *((void *)this + 19) = v4;
    operator delete(v6);
  }
  uint64_t v8 = *((void *)this + 15);
  if (v8)
  {
    uint64_t v9 = *((void *)this + 16);
    int v10 = (void *)*((void *)this + 15);
    if (v9 != v8)
    {
      do
      {
        uint64_t v11 = *(std::__shared_weak_count **)(v9 - 8);
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        v9 -= 16;
      }
      while (v9 != v8);
      int v10 = (void *)*((void *)this + 15);
    }
    *((void *)this + 16) = v8;
    operator delete(v10);
  }
  xpc_object_t v12 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  *(void *)this = &unk_270EAD8F8;
  MEMORY[0x263E68AF0]((char *)this + 8);
  long long v13 = *((void *)this + 12);
  if (v13) {
    dispatch_release(v13);
  }
  CFTypeRef v14 = *((void *)this + 11);
  if (v14) {
    dispatch_release(v14);
  }
  CFTypeID v15 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v15) {
    std::__shared_weak_count::__release_weak(v15);
  }
}

void ServiceManager::ServiceManager(ServiceManager *this, const char *a2)
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v7, "com.apple.telephony.abm", a2);
  GetABMLogServer(&v5);
  dispatch_object_t object = 0;
  ctu::SharedSynchronizable<NetworkStatsInterface>::SharedSynchronizable((void *)this + 9, a2, QOS_CLASS_DEFAULT, &object);
  if (object) {
    dispatch_release(object);
  }
  ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>>(this, (uint64_t)v7, &v5);
  *(void *)this = &unk_270EADB28;
  uint64_t v4 = v6;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v7);
  *(void *)this = &unk_270EAD7E0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0;
  *((unsigned char *)this + 192) = 1;
}

void sub_263799B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, dispatch_object_t object)
{
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a12);
  _Unwind_Resume(a1);
}

void sub_263799B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  _Unwind_Resume(a1);
}

void ServiceManager::init(void *a1, uint64_t *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[10];
  if (!v3
    || (uint64_t v5 = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))a1[9],
        (uint64_t v6 = std::__shared_weak_count::lock(v3)) == 0))
  {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = (std::__shared_weak_count_vtbl *)operator new(0x90uLL);
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v8->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_270EAD988;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v35, "com.apple.telephony.abm", "svc.ctrl");
  GetABMLogServer(&v33);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  int v10 = dispatch_queue_create_with_target_V2("svc.ctrl", initially_inactive, 0);
  dispatch_set_qos_class_floor(v10, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v10);
  v8[1].__on_zero_shared_weak = 0;
  v8[2].~__shared_weak_count = 0;
  v8[2].~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
  if (v10)
  {
    dispatch_retain(v10);
    v8[2].__on_zero_shared = 0;
    dispatch_release(v10);
  }
  else
  {
    v8[2].__on_zero_shared = 0;
  }
  v8->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_270EADA98;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v38);
  v8->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_270EA5428;
  uint64_t v11 = v34;
  v8[1].__on_zero_shared = v33;
  v8[1].__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v36);
  v8->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_270EADA58;
  xpc_object_t v12 = v34;
  if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v35);
  v8->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_270EAD988;
  v8[2].__get_deleter = v5;
  v8[2].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v8[3].__on_zero_shared = 0;
  v8[3].~__shared_weak_count_0 = 0;
  v8[3].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&v8[3].~__shared_weak_count_0;
  unint64_t v31 = (unint64_t)v8;
  long long v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = &v13->__shared_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAD938;
  v13->__shared_weak_owners_ = 0;
  v13[1].__vftable = v8;
  uint64_t v32 = v13;
  CFTypeID v15 = (std::__shared_weak_count *)v8[2].~__shared_weak_count;
  if (!v15)
  {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v8[1].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v8;
    v8[2].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v13;
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_44;
    }
LABEL_18:
    CFTypeRef v16 = (void *)v31;
    if (!*(void *)(v31 + 56)) {
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  if (v15->__shared_owners_ != -1) {
    goto LABEL_18;
  }
  atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v8[1].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v8;
  v8[2].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v13;
  std::__shared_weak_count::__release_weak(v15);
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_18;
  }
LABEL_44:
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  CFTypeRef v16 = (void *)v31;
  if (!*(void *)(v31 + 56)) {
    goto LABEL_28;
  }
LABEL_19:
  std::string v17 = (std::__shared_weak_count *)v16[10];
  if (!v17 || (uint64_t v18 = v16[9], (v19 = std::__shared_weak_count::lock(v17)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v20 = v19;
  uint64_t v38 = v18;
  unint64_t v39 = v19;
  ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v16 + 1));
  uint64_t v36 = v18;
  xpc_object_t v37 = v20;
  uint64_t v38 = 0;
  unint64_t v39 = 0;
  ctu::TrackedLogger::registerLoggerToServer();
  std::string v21 = v37;
  if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  uint64_t v22 = v39;
  if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  CFTypeRef v16 = (void *)v31;
LABEL_28:
  std::__shared_weak_count::__release_weak(v7);
  uint64_t v23 = v32;
  unint64_t v31 = 0;
  uint64_t v32 = 0;
  unint64_t v24 = (std::__shared_weak_count *)a1[22];
  a1[21] = v16;
  a1[22] = v23;
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
    std::__shared_weak_count::__release_weak(v32);
    std::__shared_weak_count::__release_weak(v7);
    uint64_t v25 = *a2;
    if (!*a2) {
      return;
    }
  }
  else
  {
    std::__shared_weak_count::__release_weak(v7);
    uint64_t v25 = *a2;
    if (!*a2) {
      return;
    }
  }
  uint64_t v26 = a2[1];
  if (v26) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v26 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v27 = (std::__shared_weak_count *)a1[14];
  a1[13] = v25;
  a1[14] = v26;
  if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  uint64_t v28 = a1[13];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 0x40000000;
  v29[2] = ___ZN14ServiceManager4initENSt3__110shared_ptrI14PowerInterfaceEE_block_invoke;
  v29[3] = &__block_descriptor_tmp_14;
  v29[4] = a1;
  xpc_object_t aBlock = _Block_copy(v29);
  (*(void (**)(uint64_t, void **))(*(void *)v28 + 16))(v28, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_26379A174(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_26379A1E0()
{
}

void sub_26379A1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v11 - 80));
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va2);
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  std::__shared_weak_count::__release_weak(v8);
  operator delete(v9);
  JUMPOUT(0x26379A25CLL);
}

void sub_26379A240()
{
}

void ___ZN14ServiceManager4initENSt3__110shared_ptrI14PowerInterfaceEE_block_invoke(uint64_t a1, int a2, NSObject **a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    uint64_t v4 = *a3;
    dispatch_object_t v5 = v4;
    if (!v4)
    {
      ServiceManager::wake(v3, &v5);
      return;
    }
    dispatch_retain(v4);
    dispatch_group_enter(v4);
    ServiceManager::wake(v3, &v5);
  }
  else
  {
    if (a2) {
      return;
    }
    uint64_t v4 = *a3;
    dispatch_object_t v6 = v4;
    if (!v4)
    {
      ServiceManager::sleep(v3, &v6);
      return;
    }
    dispatch_retain(v4);
    dispatch_group_enter(v4);
    ServiceManager::sleep(v3, &v6);
  }
  dispatch_group_leave(v4);

  dispatch_release(v4);
}

void ServiceManager::sleep(void *a1, dispatch_object_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (!v4 || (v5 = a1[9], (dispatch_object_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  uint64_t v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  uint64_t v9 = a1[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  int v10 = operator new(0x18uLL);
  *int v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::sleep(dispatch::group_session)::$_0>(ServiceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ServiceManager::wake(void *a1, dispatch_object_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (!v4 || (v5 = a1[9], (dispatch_object_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  uint64_t v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  uint64_t v9 = a1[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  int v10 = operator new(0x18uLL);
  *int v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::wake(dispatch::group_session)::$_0>(ServiceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ServiceManager::createPowerAssertion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 104);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  (*(void (**)(uint64_t, std::string *, uint64_t))(*(void *)v4 + 24))(v4, &__p, a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_26379A634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ServiceManager::releasePowerAssertion(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 104);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  (*(void (**)(uint64_t, std::string *))(*(void *)v2 + 32))(v2, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_26379A6F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ServiceCtrl::registerCommandHandler(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v8 = a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    uint64_t v5 = *a3;
    if (!*a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string __p = *(std::string *)a2;
  uint64_t v5 = *a3;
  if (*a3) {
LABEL_5:
  }
    uint64_t v5 = _Block_copy(v5);
LABEL_6:
  xpc_object_t aBlock = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_22registerCommandHandlerERKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvN3xpc4dictENSE_IU13block_pointerFviSG_EEEEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSO__block_invoke;
  block[3] = &__block_descriptor_tmp_39_1;
  block[4] = a1 + 72;
  block[5] = &v8;
  dispatch_object_t v6 = *(NSObject **)(a1 + 88);
  if (!*(void *)(a1 + 96))
  {
    dispatch_sync(v6, block);
    long long v7 = aBlock;
    if (!aBlock) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  dispatch_async_and_wait(v6, block);
  long long v7 = aBlock;
  if (aBlock) {
LABEL_10:
  }
    _Block_release(v7);
LABEL_11:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void ServiceCtrl::handleCommand(uint64_t a1, uint64_t a2, void **a3, void **a4)
{
  uint64_t v9 = a1;
  if ((*(char *)(a2 + 23) & 0x80000000) == 0)
  {
    std::string __p = *(std::string *)a2;
    long long v7 = *a3;
    xpc_object_t object = v7;
    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    xpc_object_t object = xpc_null_create();
    uint64_t v8 = *a4;
    if (!*a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  long long v7 = *a3;
  xpc_object_t object = v7;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_3:
  xpc_retain(v7);
  uint64_t v8 = *a4;
  if (*a4) {
LABEL_7:
  }
    uint64_t v8 = _Block_copy(v8);
LABEL_8:
  xpc_object_t aBlock = v8;
  ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>((uint64_t *)(a1 + 72), (uint64_t)&v9);
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void ServiceManager::registerEventDispatcher(uint64_t a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 184);
  *(void *)(a1 + 184) = v3;
  if (v4) {
    _Block_release(v4);
  }
}

void dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(uint64_t a1, uint64_t a2, const void **a3, void **a4)
{
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    long long v7 = *a3;
    CFTypeRef cf = v7;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string v11 = *(std::string *)a2;
  long long v7 = *a3;
  CFTypeRef cf = v7;
  if (v7) {
LABEL_5:
  }
    CFRetain(v7);
LABEL_6:
  uint64_t v8 = *a4;
  if (*a4) {
    uint64_t v8 = _Block_copy(v8);
  }
  xpc_object_t aBlock = v8;
  (*(void (**)(uint64_t, std::string *, CFTypeRef *, void **))(a1 + 16))(a1, &v11, &cf, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_26379AA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *aBlock, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a10);
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t ServiceManager::isServerDown(ServiceManager *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 192);
  return v1 & 1;
}

void ServiceManager::initializeGlobalServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  uint64_t v5 = v4;
  *a2 = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v5);
  }
  dispatch_object_t v6 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v6 || (uint64_t v7 = *((void *)this + 9), (v8 = std::__shared_weak_count::lock(v6)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v9 = v8;
  int v10 = operator new(0x10uLL);
  *int v10 = this;
  v10[1] = v5;
  std::string v11 = *((void *)this + 11);
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v12 = operator new(0x18uLL);
  *uint64_t v12 = v10;
  v12[1] = v7;
  v12[2] = v9;
  dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeGlobalServices(void)::$_0>(ServiceManager::initializeGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::initializeGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void ServiceManager::shutdownGlobalServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  uint64_t v5 = v4;
  *a2 = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v5);
  }
  dispatch_object_t v6 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v6 || (uint64_t v7 = *((void *)this + 9), (v8 = std::__shared_weak_count::lock(v6)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v9 = v8;
  int v10 = operator new(0x10uLL);
  *int v10 = this;
  v10[1] = v5;
  std::string v11 = *((void *)this + 11);
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v12 = operator new(0x18uLL);
  *uint64_t v12 = v10;
  v12[1] = v7;
  v12[2] = v9;
  dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownGlobalServices(void)::$_0>(ServiceManager::shutdownGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::shutdownGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void ServiceManager::initializeDynamicServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  *a2 = v4;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *((void *)this + 13);
  std::string __p = operator new(0x30uLL);
  long long v11 = xmmword_2637A8370;
  strcpy((char *)__p, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(dispatch_object_t *__return_ptr, uint64_t, void **, void))(*(void *)v5 + 24))(&object, v5, &__p, 0);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p);
  }
  dispatch_object_t v6 = object;
  if (object) {
    dispatch_retain(object);
  }
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  uint64_t v7 = object;
  uint64_t v8 = *((void *)this + 11);
  uint64_t v9 = operator new(0x18uLL);
  *uint64_t v9 = this;
  v9[1] = v6;
  v9[2] = v4;
  dispatch_group_notify_f(v7, v8, v9, (dispatch_function_t)dispatch::detail::group_notify<ServiceManager::initializeDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::initializeDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  if (object) {
    dispatch_release(object);
  }
}

void sub_26379AE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, dispatch_object_t object)
{
  ServiceManager::initializeDynamicServices(void)::$_0::~$_0((uint64_t)&a10);
  if (object) {
    dispatch_release(object);
  }
  if (v19) {
    dispatch_release(v19);
  }
  _Unwind_Resume(a1);
}

uint64_t ServiceManager::initializeDynamicServices(void)::$_0::~$_0(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 16);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 16);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_release(v4);
  }
  return a1;
}

void ServiceManager::shutdownDynamicServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  *a2 = v4;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *((void *)this + 13);
  std::string __p = operator new(0x30uLL);
  long long v11 = xmmword_2637A8370;
  strcpy((char *)__p, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(dispatch_object_t *__return_ptr, uint64_t, void **, void))(*(void *)v5 + 24))(&object, v5, &__p, 0);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p);
  }
  dispatch_object_t v6 = object;
  if (object) {
    dispatch_retain(object);
  }
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  uint64_t v7 = object;
  uint64_t v8 = *((void *)this + 11);
  uint64_t v9 = operator new(0x18uLL);
  *uint64_t v9 = this;
  v9[1] = v6;
  v9[2] = v4;
  dispatch_group_notify_f(v7, v8, v9, (dispatch_function_t)dispatch::detail::group_notify<ServiceManager::shutdownDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::shutdownDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  if (object) {
    dispatch_release(object);
  }
}

void sub_26379B000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, dispatch_object_t object)
{
  ServiceManager::initializeDynamicServices(void)::$_0::~$_0((uint64_t)&a10);
  if (object) {
    dispatch_release(object);
  }
  if (v19) {
    dispatch_release(v19);
  }
  _Unwind_Resume(a1);
}

void *ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EAD8F8;
  MEMORY[0x263E68AF0](a1 + 1);
  return a1;
}

void ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EAD8F8;
  MEMORY[0x263E68AF0](a1 + 1);

  operator delete(a1);
}

void std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  }
  return 0;
}

uint64_t std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl*)#1}::operator() const(ServiceCtrl*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void ServiceCtrl::~ServiceCtrl(char **this)
{
  ServiceCtrl::~ServiceCtrl(this);

  operator delete(v1);
}

{
  std::__shared_weak_count *v2;
  NSObject *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;

  *this = (char *)&unk_270EAD988;
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(this[16]);
  uint64_t v2 = (std::__shared_weak_count *)this[14];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  *this = (char *)&unk_270EADA98;
  MEMORY[0x263E68AF0](this + 1);
  unint64_t v3 = this[12];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = this[11];
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)this[10];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

uint64_t ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

void ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 8;
  strcpy(a1, "svc.ctrl");
}

uint64_t ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::SharedLoggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EADA98;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EADA98;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void *ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EADA98;
  MEMORY[0x263E68AF0](a1 + 1);
  return a1;
}

void ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EADA98;
  MEMORY[0x263E68AF0](a1 + 1);

  operator delete(a1);
}

void std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*((void *)a1 + 1));
    uint64_t v2 = (const void *)*((void *)a1 + 7);
    if (v2) {
      _Block_release(v2);
    }
    if (a1[55] < 0)
    {
      operator delete(*((void **)a1 + 4));
      unint64_t v3 = a1;
    }
    else
    {
      unint64_t v3 = a1;
    }
    operator delete(v3);
  }
}

void ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_22registerCommandHandlerERKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvN3xpc4dictENSE_IU13block_pointerFviSG_EEEEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSO__block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = *(uint64_t **)(a1 + 40);
  uint64_t v2 = *v1;
  unint64_t v3 = (const void *)v1[4];
  if (v3)
  {
    uint64_t v4 = _Block_copy(v3);
    uint64_t v5 = v1 + 1;
    uint64_t v7 = (void *)(v2 + 128);
    dispatch_object_t v6 = *(void **)(v2 + 128);
    if (v6)
    {
LABEL_3:
      int v8 = *((char *)v1 + 31);
      if (v8 >= 0) {
        uint64_t v9 = v5;
      }
      else {
        uint64_t v9 = (const void *)v1[1];
      }
      if (v8 >= 0) {
        size_t v10 = *((unsigned __int8 *)v1 + 31);
      }
      else {
        size_t v10 = v1[2];
      }
      while (1)
      {
        long long v11 = v6;
        uint64_t v14 = (const void *)v6[4];
        uint64_t v12 = v6 + 4;
        long long v13 = v14;
        int v15 = *((char *)v12 + 23);
        if (v15 >= 0) {
          CFTypeRef v16 = v12;
        }
        else {
          CFTypeRef v16 = v13;
        }
        if (v15 >= 0) {
          size_t v17 = *((unsigned __int8 *)v12 + 23);
        }
        else {
          size_t v17 = v12[1];
        }
        if (v17 >= v10) {
          size_t v18 = v10;
        }
        else {
          size_t v18 = v17;
        }
        int v19 = memcmp(v9, v16, v18);
        if (v19)
        {
          if (v19 < 0) {
            goto LABEL_9;
          }
LABEL_23:
          int v20 = memcmp(v16, v9, v18);
          if (v20)
          {
            if ((v20 & 0x80000000) == 0) {
              goto LABEL_38;
            }
          }
          else if (v17 >= v10)
          {
LABEL_38:
            uint64_t v26 = (const void *)v11[7];
            v11[7] = v4;
            if (v26) {
              goto LABEL_39;
            }
            return;
          }
          dispatch_object_t v6 = (void *)v11[1];
          if (!v6)
          {
            uint64_t v7 = v11 + 1;
            goto LABEL_31;
          }
        }
        else
        {
          if (v10 >= v17) {
            goto LABEL_23;
          }
LABEL_9:
          dispatch_object_t v6 = (void *)*v11;
          uint64_t v7 = v11;
          if (!*v11) {
            goto LABEL_31;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = v1 + 1;
    uint64_t v7 = (void *)(v2 + 128);
    dispatch_object_t v6 = *(void **)(v2 + 128);
    if (v6) {
      goto LABEL_3;
    }
  }
  long long v11 = v7;
LABEL_31:
  std::string v21 = operator new(0x40uLL);
  uint64_t v22 = (std::string *)(v21 + 4);
  if (*((char *)v1 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v22, (const std::string::value_type *)v1[1], v1[2]);
  }
  else
  {
    long long v23 = *(_OWORD *)v5;
    v21[6] = v5[2];
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
  }
  v21[7] = 0;
  *std::string v21 = 0;
  v21[1] = 0;
  v21[2] = v11;
  *uint64_t v7 = v21;
  uint64_t v24 = **(void **)(v2 + 120);
  uint64_t v25 = v21;
  if (v24)
  {
    *(void *)(v2 + 120) = v24;
    uint64_t v25 = (uint64_t *)*v7;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 128), v25);
  ++*(void *)(v2 + 136);
  uint64_t v26 = (const void *)v21[7];
  v21[7] = v4;
  if (v26) {
LABEL_39:
  }
    _Block_release(v26);
}

void sub_26379B690(_Unwind_Exception *a1)
{
  operator delete(v2);
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(a1);
}

void ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (v5 = *a1, (dispatch_object_t v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  int v8 = (char *)operator new(0x30uLL);
  *(void *)int v8 = *(void *)a2;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  *(void *)(a2 + 24) = 0;
  *((void *)v8 + 3) = v9;
  *((void *)v8 + 4) = v10;
  xpc_object_t v11 = xpc_null_create();
  *((void *)v8 + 5) = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = 0;
  uint64_t v12 = a1[2];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v13 = operator new(0x18uLL);
  void *v13 = v8;
  v13[1] = v5;
  v13[2] = v7;
  dispatch_async_f(v12, v13, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>(ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>(ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  uint64_t v4 = std::__tree<std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,xpc::dict>>>>::find<std::string>(v3 + 120, (const void **)*a1 + 1);
  uint64_t v5 = (const void *)v2[5];
  if ((uint64_t *)(v3 + 128) == v4)
  {
    if (!v5) {
      goto LABEL_12;
    }
    xpc_object_t v6 = xpc_null_create();
    uint64_t v7 = v2[5];
    object[0] = v6;
    xpc_object_t v8 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v7 + 16))(v7, 3760250882, object);
    xpc_release(object[0]);
    xpc_release(v8);
  }
  else if (v5)
  {
    object[0] = 0;
    object[1] = object;
    xpc_object_t object[2] = (xpc_object_t)0x3002000000;
    object[3] = __Block_byref_object_copy__3;
    object[4] = __Block_byref_object_dispose__3;
    CFTypeRef v16 = (void *)0xAAAAAAAAAAAAAAAALL;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_42;
    aBlock[3] = &__block_descriptor_tmp_43_1;
    uint64_t v14 = _Block_copy(v5);
    CFTypeRef v16 = _Block_copy(aBlock);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    v11[2] = ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_44;
    v11[3] = &unk_2655D5770;
    v11[4] = object;
    uint64_t v12 = v11;
    dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>::operator()<xpc::dict const&,void({block_pointer})(int,xpc::dict)>(v4[7], (xpc_object_t)v2[4], (void **)&v12);
    _Block_object_dispose(object, 8);
    if (v16) {
      _Block_release(v16);
    }
    if (v14) {
      _Block_release(v14);
    }
  }
  else
  {
    object[0] = &__block_literal_global_6;
    dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>::operator()<xpc::dict const&,void({block_pointer})(int,xpc::dict)>(v4[7], (xpc_object_t)v2[4], object);
  }
  uint64_t v9 = (const void *)v2[5];
  if (v9) {
    _Block_release(v9);
  }
LABEL_12:
  xpc_release((xpc_object_t)v2[4]);
  v2[4] = 0;
  if (*((char *)v2 + 31) < 0) {
    operator delete((void *)v2[1]);
  }
  operator delete(v2);
  uint64_t v10 = (std::__shared_weak_count *)a1[2];
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }

  operator delete(a1);
}

void sub_26379BA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,xpc_object_t object,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *aBlock)
{
  xpc_release(object);
  xpc_release(v27);
  std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&a9);
  char v29 = (std::__shared_weak_count *)v26[2];
  if (v29)
  {
    if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  operator delete(v26);
  _Unwind_Resume(a1);
}

void dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>::operator()<xpc::dict const&,void({block_pointer})(int,xpc::dict)>(uint64_t a1, xpc_object_t object, void **a3)
{
  xpc_object_t objecta = object;
  if (!object)
  {
    xpc_object_t objecta = xpc_null_create();
    uint64_t v5 = *a3;
    if (!*a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  xpc_retain(object);
  uint64_t v5 = *a3;
  if (*a3) {
LABEL_5:
  }
    uint64_t v5 = _Block_copy(v5);
LABEL_6:
  xpc_object_t aBlock = v5;
  (*(void (**)(uint64_t, xpc_object_t *, void **))(a1 + 16))(a1, &objecta, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(objecta);
}

void sub_26379BBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *aBlock, xpc_object_t object)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  unsigned __int8 v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_42(uint64_t a1, unsigned int a2, void **a3)
{
  unsigned int v3 = a2;
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int &,xpc::dict&>((uint64_t *)(a1 + 32), &v3, a3);
}

void ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_44(uint64_t a1, unsigned int a2, void **a3)
{
  unsigned int v9 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  uint64_t v5 = (uint64_t *)(v4 + 40);
  if (v6)
  {
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int &,xpc::dict&>(v5, &v9, a3);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    xpc_object_t v8 = *(const void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
    if (v8) {
      _Block_release(v8);
    }
  }
}

uint64_t *std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    unsigned int v3 = *(const void **)(v2 + 40);
    if (v3) {
      _Block_release(v3);
    }
    xpc_release(*(xpc_object_t *)(v2 + 32));
    *(void *)(v2 + 32) = 0;
    if (*(char *)(v2 + 31) < 0) {
      operator delete(*(void **)(v2 + 8));
    }
    operator delete((void *)v2);
  }
  return a1;
}

void *ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>>(void *a1, uint64_t a2, void *a3)
{
  *a1 = &unk_270EAD8F8;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v8);
  a1[1] = &unk_270EA5428;
  a1[7] = *a3;
  uint64_t v5 = a3[1];
  a1[8] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v7);
  return a1;
}

void sub_26379BE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void *ctu::SharedLoggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EAD8F8;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unsigned int v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EAD8F8;
  MEMORY[0x263E68AF0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unsigned int v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::sleep(dispatch::group_session)::$_0>(ServiceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  unsigned __int8 v1 = a1;
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(v3 + 192));
  uint64_t v5 = *(NSObject **)(v3 + 40);
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (uint64_t)(*(void *)(v3 + 152) - *(void *)(v3 + 144)) >> 4;
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_26368A000, v5, OS_LOG_TYPE_DEFAULT, "#I Request %zd services to sleep", buf, 0xCu);
    }
    char v47 = v2;
    xpc_object_t v48 = v1;
    uint64_t v7 = dispatch_group_create();
    xpc_object_t v8 = (std::__shared_weak_count *)operator new(0x38uLL);
    unsigned int v9 = &v8->__vftable;
    v8->__shared_owners_ = 0;
    long long v45 = v8;
    p_shared_owners = &v8->__shared_owners_;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EADB68;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
    uint64_t v10 = (NSObject **)&v8[1];
    if (v7)
    {
      dispatch_retain(v7);
      v9[4] = 0;
      v9[5] = 0;
      v9[6] = 0;
      dispatch_release(v7);
      xpc_object_t v11 = *(uint64_t **)(v3 + 144);
      uint64_t v12 = *(uint64_t **)(v3 + 152);
      if (v11 != v12) {
        goto LABEL_12;
      }
LABEL_33:
      long long v23 = *v10;
      uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 104))(v3);
      dispatch_time_t v25 = dispatch_time(0, 1000000000 * v24);
      if (!dispatch_group_wait(v23, v25)) {
        goto LABEL_58;
      }
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v56 = 0;
      shared_owners = (uint64_t *)v45[1].__shared_owners_;
      shared_weak_owners = (uint64_t *)v45[1].__shared_weak_owners_;
      if (shared_owners == shared_weak_owners)
      {
        uint64_t v35 = 0;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
      }
      else
      {
        do
        {
          uint64_t v28 = (std::__shared_weak_count *)shared_owners[1];
          if (v28)
          {
            char v29 = std::__shared_weak_count::lock(v28);
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *shared_owners;
              if (*shared_owners)
              {
                uint64_t v32 = *(_OWORD **)&buf[8];
                if (*(void *)&buf[8] >= (unint64_t)v56)
                {
                  uint64_t v34 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)buf, v31);
                }
                else
                {
                  if (*(char *)(v31 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external(*(std::string **)&buf[8], *(const std::string::value_type **)v31, *(void *)(v31 + 8));
                  }
                  else
                  {
                    long long v33 = *(_OWORD *)v31;
                    *(void *)(*(void *)&buf[8] + 16) = *(void *)(v31 + 16);
                    *uint64_t v32 = v33;
                  }
                  uint64_t v34 = (std::string *)((char *)v32 + 24);
                }
                *(void *)&uint8_t buf[8] = v34;
              }
              if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
                std::__shared_weak_count::__release_weak(v30);
              }
            }
          }
          shared_owners += 2;
        }
        while (shared_owners != shared_weak_owners);
        uint64_t v35 = *(std::string **)buf;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_50:
          if (v35)
          {
LABEL_51:
            xpc_object_t v37 = *(std::string **)&buf[8];
            uint64_t v38 = v35;
            if (*(std::string **)&buf[8] != v35)
            {
              do
              {
                if (SHIBYTE(v37[-1].__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v37[-1].__r_.__value_.__l.__data_);
                }
                --v37;
              }
              while (v37 != v35);
              uint64_t v38 = *(std::string **)buf;
            }
            *(void *)&uint8_t buf[8] = v35;
            operator delete(v38);
          }
LABEL_58:
          unint64_t v39 = *(NSObject **)(v3 + 40);
          uint64_t v2 = v47;
          unsigned __int8 v1 = v48;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_26368A000, v39, OS_LOG_TYPE_DEFAULT, "#I All services acknowledged for sleep request", buf, 2u);
          }
          if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
            std::__shared_weak_count::__release_weak(v45);
          }
          goto LABEL_62;
        }
      }
      uint64_t v43 = *(void *)&buf[8];
      ctu::join<std::__wrap_iter<std::string *>>(&__p, v35, *(long long **)&buf[8]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)dispatch_object_t object = 134218242;
      *(void *)&object[4] = 0xAAAAAAAAAAAAAAABLL * ((v43 - (uint64_t)v35) >> 3);
      __int16 v53 = 2080;
      long long v54 = p_p;
      _os_log_error_impl(&dword_26368A000, v36, OS_LOG_TYPE_ERROR, "Sleep TIMEOUT: %zd clients failed to complete sleep request: %s", object, 0x16u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      uint64_t v35 = *(std::string **)buf;
      if (!*(void *)buf) {
        goto LABEL_58;
      }
      goto LABEL_51;
    }
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    xpc_object_t v11 = *(uint64_t **)(v3 + 144);
    uint64_t v12 = *(uint64_t **)(v3 + 152);
    if (v11 == v12) {
      goto LABEL_33;
    }
    while (1)
    {
LABEL_12:
      long long v13 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)*v11 + 16))();
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_26368A000, v13, OS_LOG_TYPE_DEFAULT, "#I Requesting '%s' to sleep", buf, 0xCu);
      }
      *(void *)dispatch_object_t object = 0xAAAAAAAAAAAAAAAALL;
      int v15 = (const char *)(*(uint64_t (**)(void))(*(void *)*v11 + 16))();
      size_t v16 = strlen(v15);
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v17 = v16;
      if (v16 >= 0x17) {
        break;
      }
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v16;
      p_dst = &__dst;
      if (v16) {
        goto LABEL_21;
      }
LABEL_22:
      p_dst->__r_.__value_.__s.__data_[v17] = 0;
      std::string __p = __dst;
      memset(&__dst, 0, sizeof(__dst));
      *(_OWORD *)long long buf = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      ctu::TrackedGroup::fork((NSObject **)object, (uint64_t)v10, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object)
        {
LABEL_26:
          dispatch_retain(v22);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object) {
          goto LABEL_26;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v21 + 48))(v21, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v22)
      {
        dispatch_group_leave(v22);
        dispatch_release(v22);
      }
      v11 += 2;
      if (v11 == v12) {
        goto LABEL_33;
      }
    }
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (std::string *)operator new(v19 + 1);
    __dst.__r_.__value_.__l.__size_ = v17;
    __dst.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_21:
    memmove(p_dst, v15, v17);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_26368A000, v5, OS_LOG_TYPE_DEBUG, "#D Server is down; ignoring sleep request", buf, 2u);
  }
LABEL_62:
  uint64_t v40 = v2[1];
  if (v40)
  {
    dispatch_group_leave(v40);
    xpc_object_t v41 = v2[1];
    if (v41) {
      dispatch_release(v41);
    }
  }
  operator delete(v2);
  uint64_t v42 = (std::__shared_weak_count *)v1[2];
  if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
  operator delete(v1);
}

void sub_26379C5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, atomic_ullong *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void **__p,uint64_t a31)
{
  if (!atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  if (__p)
  {
    uint64_t v34 = v32;
    uint64_t v35 = __p;
    if (v32 != __p)
    {
      do
      {
        if (*((char *)v34 - 1) < 0) {
          operator delete(*(v34 - 3));
        }
        v34 -= 3;
      }
      while (v34 != __p);
      uint64_t v35 = __p;
    }
    operator delete(v35);
  }
  if (!atomic_fetch_add(a10, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a9->__on_zero_shared)(a9);
    std::__shared_weak_count::__release_weak(a9);
  }
  uint64_t v36 = a11[1];
  if (v36)
  {
    dispatch_group_leave(v36);
    xpc_object_t v37 = a11[1];
    if (v37) {
      dispatch_release(v37);
    }
  }
  operator delete(a11);
  uint64_t v38 = (std::__shared_weak_count *)a12[2];
  if (v38)
  {
    if (!atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  operator delete(a12);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EADB68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EADB68;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::__on_zero_shared(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = a1[5];
    unsigned __int8 v4 = (void *)a1[4];
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5) {
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      unsigned __int8 v4 = (void *)a1[4];
    }
    a1[5] = v2;
    operator delete(v4);
  }
  uint64_t v6 = a1[3];
  if (v6)
  {
    dispatch_release(v6);
  }
}

void ctu::TrackedGroup::fork(NSObject **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  xpc_object_t v8 = dispatch_group_create();
  unsigned int v9 = v8;
  *a1 = v8;
  if (v8)
  {
    dispatch_retain(v8);
    dispatch_group_enter(v9);
    dispatch_release(v9);
  }
  uint64_t v10 = (char *)operator new(0x30uLL);
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)uint64_t v10 = &unk_270EADBB8;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)a3;
  *((void *)v10 + 5) = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  *(void *)&long long v37 = v10 + 24;
  *((void *)&v37 + 1) = v10;
  xpc_object_t v11 = *(NSObject **)a2;
  if (*(void *)a2)
  {
    dispatch_retain(*(dispatch_object_t *)a2);
    dispatch_group_enter(v11);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  long long v13 = global_queue;
  if (global_queue) {
    dispatch_retain(global_queue);
  }
  *(void *)&long long v38 = v10 + 24;
  *((void *)&v38 + 1) = v10;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
  group[0] = v11;
  if (v11)
  {
    dispatch_retain(v11);
    dispatch_group_enter(v11);
  }
  uint64_t v14 = *(void *)(a4 + 8);
  group[1] = *(dispatch_group_t *)a4;
  uint64_t v40 = v14;
  uint64_t v15 = a4 + 16;
  uint64_t v16 = *(void *)(a4 + 40);
  if (v16)
  {
    if (v16 == v15)
    {
      uint64_t v42 = v41;
      (*(void (**)(uint64_t, void *))(*(void *)v15 + 24))(a4 + 16, v41);
    }
    else
    {
      uint64_t v42 = *(void **)(a4 + 40);
      *(void *)(a4 + 40) = 0;
    }
  }
  else
  {
    uint64_t v42 = 0;
  }
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  uint64_t v17 = *(void *)(a4 + 40);
  *(void *)(a4 + 40) = 0;
  if (v17 == v15)
  {
    (*(void (**)(uint64_t))(*(void *)v15 + 32))(a4 + 16);
  }
  else if (v17)
  {
    (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
  }
  size_t v18 = (char *)operator new(0x48uLL);
  uint64_t v19 = v18;
  long long v20 = *(_OWORD *)group;
  *(_OWORD *)size_t v18 = v38;
  *((_OWORD *)v18 + 1) = v20;
  uint64_t v21 = v42;
  *((void *)v18 + 4) = v40;
  if (v21)
  {
    if (v21 == v41)
    {
      *((void *)v18 + 8) = v18 + 40;
      (*(void (**)(void *))(v41[0] + 24))(v41);
    }
    else
    {
      *((void *)v18 + 8) = v21;
      uint64_t v42 = 0;
    }
  }
  else
  {
    *((void *)v18 + 8) = 0;
  }
  group[1] = 0;
  uint64_t v40 = 0;
  uint64_t v22 = v42;
  uint64_t v42 = 0;
  if (v22 == v41)
  {
    (*(void (**)(void *))(v41[0] + 32))(v41);
  }
  else if (v22)
  {
    (*(void (**)(void *))(*v22 + 40))(v22);
  }
  dispatch_group_notify_f(v9, v13, v19, (dispatch_function_t)dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)&group[1]);
  if (v13) {
    dispatch_release(v13);
  }
  uint64_t v24 = *(char **)(a2 + 16);
  unint64_t v23 = *(void *)(a2 + 24);
  if ((unint64_t)v24 >= v23)
  {
    uint64_t v26 = *(char **)(a2 + 8);
    uint64_t v27 = (v24 - v26) >> 4;
    unint64_t v28 = v27 + 1;
    if ((unint64_t)(v27 + 1) >> 60) {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v29 = v23 - (void)v26;
    if (v29 >> 3 > v28) {
      unint64_t v28 = v29 >> 3;
    }
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v30 = v28;
    }
    if (v30 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v31 = (char *)operator new(16 * v30);
    uint64_t v32 = &v31[16 * v27];
    *(_OWORD *)uint64_t v32 = v37;
    if (*((void *)&v37 + 1))
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v37 + 1) + 16), 1uLL, memory_order_relaxed);
      uint64_t v26 = *(char **)(a2 + 8);
      uint64_t v24 = *(char **)(a2 + 16);
    }
    long long v33 = &v31[16 * v30];
    dispatch_time_t v25 = v32 + 16;
    if (v24 == v26)
    {
      *(void *)(a2 + 8) = v32;
      *(void *)(a2 + 16) = v25;
      *(void *)(a2 + 24) = v33;
    }
    else
    {
      do
      {
        long long v34 = *((_OWORD *)v24 - 1);
        v24 -= 16;
        *((_OWORD *)v32 - 1) = v34;
        v32 -= 16;
        *(void *)uint64_t v24 = 0;
        *((void *)v24 + 1) = 0;
      }
      while (v24 != v26);
      uint64_t v26 = *(char **)(a2 + 8);
      uint64_t v35 = *(char **)(a2 + 16);
      *(void *)(a2 + 8) = v32;
      *(void *)(a2 + 16) = v25;
      *(void *)(a2 + 24) = v33;
      while (v35 != v26)
      {
        uint64_t v36 = (std::__shared_weak_count *)*((void *)v35 - 1);
        if (v36) {
          std::__shared_weak_count::__release_weak(v36);
        }
        v35 -= 16;
      }
    }
    if (v26) {
      operator delete(v26);
    }
  }
  else
  {
    *(void *)uint64_t v24 = v37;
    *((void *)v24 + 1) = v10;
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 2, 1uLL, memory_order_relaxed);
    }
    dispatch_time_t v25 = v24 + 16;
  }
  *(void *)(a2 + 16) = v25;
  if (v11)
  {
    dispatch_group_leave(v11);
    dispatch_release(v11);
  }
  if (*((void *)&v37 + 1))
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v37 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**((void **)&v37 + 1) + 16))(*((void *)&v37 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v37 + 1));
    }
  }
}

void sub_26379CDDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}::~signpost_interval(void *a1)
{
  ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
  uint64_t v2 = a1[2];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = a1[2];
    if (v3) {
      dispatch_release(v3);
    }
  }
  unsigned __int8 v4 = (std::__shared_weak_count *)a1[1];
  if (!v4 || atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EADBB8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EADBB8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<std::string>::__on_zero_shared(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
}

void dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  if (a1)
  {
    ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
    uint64_t v2 = a1[2];
    if (v2)
    {
      dispatch_group_leave(v2);
      uint64_t v3 = a1[2];
      if (v3) {
        dispatch_release(v3);
      }
    }
    unsigned __int8 v4 = (std::__shared_weak_count *)a1[1];
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      uint64_t v5 = a1;
    }
    else
    {
      uint64_t v5 = a1;
    }
    operator delete(v5);
  }
}

void ctu::os::signpost_interval::~signpost_interval(ctu::os::signpost_interval *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2 && *(void *)this)
  {
    uint64_t v3 = *((void *)this + 1);
    uint64_t v8 = *(void *)this;
    uint64_t v9 = v3;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v2 + 48))(v2, &v9, &v8);
  }
  unsigned __int8 v4 = (void *)*((void *)this + 1);
  if (v4) {
    os_release(v4);
  }
  uint64_t v5 = (char *)this + 16;
  *((void *)this + 1) = 0;
  uint64_t v6 = (ctu::os::signpost_interval *)*((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v6 == (ctu::os::signpost_interval *)((char *)this + 16))
  {
    (*(void (**)(char *))(*(void *)v5 + 32))((char *)this + 16);
    uint64_t v7 = (char *)*((void *)this + 5);
    *(void *)this = 0;
    if (v7 != v5) {
      goto LABEL_9;
    }
LABEL_13:
    (*(void (**)(char *))(*(void *)v5 + 32))((char *)this + 16);
    return;
  }
  if (!v6)
  {
    *(void *)this = 0;
    return;
  }
  (*(void (**)(ctu::os::signpost_interval *))(*(void *)v6 + 40))(v6);
  uint64_t v7 = (char *)*((void *)this + 5);
  *(void *)this = 0;
  if (v7 == v5) {
    goto LABEL_13;
  }
LABEL_9:
  if (v7) {
    (*(void (**)(char *))(*(void *)v7 + 40))(v7);
  }
}

std::string *ctu::join<std::__wrap_iter<std::string *>>(std::string *__dst, std::string *a2, long long *a3)
{
  __dst->__r_.__value_.__r.__words[0] = 0;
  __dst->__r_.__value_.__l.__size_ = 0;
  __dst->__r_.__value_.__r.__words[2] = 0;
  if (a2 != (std::string *)a3)
  {
    uint64_t v5 = __dst;
    if (a2 != __dst)
    {
      if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string __dst = (std::string *)std::string::__assign_no_alias<true>(__dst, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
      }
      else
      {
        long long v6 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
        __dst->__r_.__value_.__r.__words[2] = a2->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__dst->__r_.__value_.__l.__data_ = v6;
      }
    }
    if (",")
    {
      for (i = a2 + 1; i != (std::string *)a3; ++i)
      {
        HIBYTE(v19) = 1;
        memmove(__s, ",", 1uLL);
        __s[1] = 0;
        if (v19 >= 0) {
          uint64_t v15 = __s;
        }
        else {
          uint64_t v15 = *(std::string::value_type **)__s;
        }
        if (v19 >= 0) {
          std::string::size_type v16 = HIBYTE(v19);
        }
        else {
          std::string::size_type v16 = v18;
        }
        std::string::append(v5, v15, v16);
        if (SHIBYTE(v19) < 0) {
          operator delete(*(void **)__s);
        }
        int v12 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
        if (v12 >= 0) {
          long long v13 = (const std::string::value_type *)i;
        }
        else {
          long long v13 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
        }
        if (v12 >= 0) {
          std::string::size_type size = HIBYTE(i->__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = i->__r_.__value_.__l.__size_;
        }
        std::string __dst = std::string::append(v5, v13, size);
      }
    }
    else
    {
      for (j = a2 + 1; j != (std::string *)a3; ++j)
      {
        *(void *)__s = 0;
        std::string::size_type v18 = 0;
        uint64_t v19 = 0;
        std::string::append(v5, __s, 0);
        if (SHIBYTE(v19) < 0) {
          operator delete(*(void **)__s);
        }
        int v8 = SHIBYTE(j->__r_.__value_.__r.__words[2]);
        if (v8 >= 0) {
          uint64_t v9 = (const std::string::value_type *)j;
        }
        else {
          uint64_t v9 = (const std::string::value_type *)j->__r_.__value_.__r.__words[0];
        }
        if (v8 >= 0) {
          std::string::size_type v10 = HIBYTE(j->__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v10 = j->__r_.__value_.__l.__size_;
        }
        std::string __dst = std::string::append(v5, v9, v10);
      }
    }
  }
  return __dst;
}

void sub_26379D464(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0)
  {
    operator delete(*(void **)v15);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::wake(dispatch::group_session)::$_0>(ServiceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  unsigned __int8 v1 = a1;
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(v3 + 192));
  uint64_t v5 = *(NSObject **)(v3 + 40);
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (uint64_t)(*(void *)(v3 + 152) - *(void *)(v3 + 144)) >> 4;
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_26368A000, v5, OS_LOG_TYPE_DEFAULT, "#I Request %zd services to wake", buf, 0xCu);
    }
    char v47 = v2;
    xpc_object_t v48 = v1;
    uint64_t v7 = dispatch_group_create();
    int v8 = (std::__shared_weak_count *)operator new(0x38uLL);
    uint64_t v9 = &v8->__vftable;
    v8->__shared_owners_ = 0;
    long long v45 = v8;
    p_shared_owners = &v8->__shared_owners_;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EADB68;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
    std::string::size_type v10 = (NSObject **)&v8[1];
    if (v7)
    {
      dispatch_retain(v7);
      v9[4] = 0;
      v9[5] = 0;
      v9[6] = 0;
      dispatch_release(v7);
      xpc_object_t v11 = *(uint64_t **)(v3 + 144);
      int v12 = *(uint64_t **)(v3 + 152);
      if (v11 != v12) {
        goto LABEL_12;
      }
LABEL_33:
      unint64_t v23 = *v10;
      uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 104))(v3);
      dispatch_time_t v25 = dispatch_time(0, 2000000000 * v24);
      if (!dispatch_group_wait(v23, v25)) {
        goto LABEL_58;
      }
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v56 = 0;
      shared_owners = (uint64_t *)v45[1].__shared_owners_;
      shared_weak_owners = (uint64_t *)v45[1].__shared_weak_owners_;
      if (shared_owners == shared_weak_owners)
      {
        uint64_t v35 = 0;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
      }
      else
      {
        do
        {
          unint64_t v28 = (std::__shared_weak_count *)shared_owners[1];
          if (v28)
          {
            uint64_t v29 = std::__shared_weak_count::lock(v28);
            if (v29)
            {
              unint64_t v30 = v29;
              uint64_t v31 = *shared_owners;
              if (*shared_owners)
              {
                uint64_t v32 = *(_OWORD **)&buf[8];
                if (*(void *)&buf[8] >= (unint64_t)v56)
                {
                  long long v34 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)buf, v31);
                }
                else
                {
                  if (*(char *)(v31 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external(*(std::string **)&buf[8], *(const std::string::value_type **)v31, *(void *)(v31 + 8));
                  }
                  else
                  {
                    long long v33 = *(_OWORD *)v31;
                    *(void *)(*(void *)&buf[8] + 16) = *(void *)(v31 + 16);
                    *uint64_t v32 = v33;
                  }
                  long long v34 = (std::string *)((char *)v32 + 24);
                }
                *(void *)&uint8_t buf[8] = v34;
              }
              if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
                std::__shared_weak_count::__release_weak(v30);
              }
            }
          }
          shared_owners += 2;
        }
        while (shared_owners != shared_weak_owners);
        uint64_t v35 = *(std::string **)buf;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_50:
          if (v35)
          {
LABEL_51:
            long long v37 = *(std::string **)&buf[8];
            long long v38 = v35;
            if (*(std::string **)&buf[8] != v35)
            {
              do
              {
                if (SHIBYTE(v37[-1].__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v37[-1].__r_.__value_.__l.__data_);
                }
                --v37;
              }
              while (v37 != v35);
              long long v38 = *(std::string **)buf;
            }
            *(void *)&uint8_t buf[8] = v35;
            operator delete(v38);
          }
LABEL_58:
          unint64_t v39 = *(NSObject **)(v3 + 40);
          uint64_t v2 = v47;
          unsigned __int8 v1 = v48;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_26368A000, v39, OS_LOG_TYPE_DEFAULT, "#I All services acknowledged for wake request", buf, 2u);
          }
          if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
            std::__shared_weak_count::__release_weak(v45);
          }
          goto LABEL_62;
        }
      }
      uint64_t v43 = *(void *)&buf[8];
      ctu::join<std::__wrap_iter<std::string *>>(&__p, v35, *(long long **)&buf[8]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)dispatch_object_t object = 134218242;
      *(void *)&object[4] = 0xAAAAAAAAAAAAAAABLL * ((v43 - (uint64_t)v35) >> 3);
      __int16 v53 = 2080;
      long long v54 = p_p;
      _os_log_error_impl(&dword_26368A000, v36, OS_LOG_TYPE_ERROR, "Wake TIMEOUT: %zd clients failed to complete wake request: %s", object, 0x16u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      uint64_t v35 = *(std::string **)buf;
      if (!*(void *)buf) {
        goto LABEL_58;
      }
      goto LABEL_51;
    }
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    xpc_object_t v11 = *(uint64_t **)(v3 + 144);
    int v12 = *(uint64_t **)(v3 + 152);
    if (v11 == v12) {
      goto LABEL_33;
    }
    while (1)
    {
LABEL_12:
      long long v13 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)*v11 + 16))();
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_26368A000, v13, OS_LOG_TYPE_DEFAULT, "#I Requesting '%s' to wake", buf, 0xCu);
      }
      *(void *)dispatch_object_t object = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v15 = (const char *)(*(uint64_t (**)(void))(*(void *)*v11 + 16))();
      size_t v16 = strlen(v15);
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v17 = v16;
      if (v16 >= 0x17) {
        break;
      }
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v16;
      p_dst = &__dst;
      if (v16) {
        goto LABEL_21;
      }
LABEL_22:
      p_dst->__r_.__value_.__s.__data_[v17] = 0;
      std::string __p = __dst;
      memset(&__dst, 0, sizeof(__dst));
      *(_OWORD *)long long buf = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      ctu::TrackedGroup::fork((NSObject **)object, (uint64_t)v10, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object)
        {
LABEL_26:
          dispatch_retain(v22);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object) {
          goto LABEL_26;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v21 + 56))(v21, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v22)
      {
        dispatch_group_leave(v22);
        dispatch_release(v22);
      }
      v11 += 2;
      if (v11 == v12) {
        goto LABEL_33;
      }
    }
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (std::string *)operator new(v19 + 1);
    __dst.__r_.__value_.__l.__size_ = v17;
    __dst.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_21:
    memmove(p_dst, v15, v17);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_26368A000, v5, OS_LOG_TYPE_DEBUG, "#D Server is down; ignoring wake request", buf, 2u);
  }
LABEL_62:
  uint64_t v40 = v2[1];
  if (v40)
  {
    dispatch_group_leave(v40);
    xpc_object_t v41 = v2[1];
    if (v41) {
      dispatch_release(v41);
    }
  }
  operator delete(v2);
  uint64_t v42 = (std::__shared_weak_count *)v1[2];
  if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
  operator delete(v1);
}

void sub_26379DBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, atomic_ullong *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void **__p,uint64_t a31)
{
  if (!atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  if (__p)
  {
    long long v34 = v32;
    uint64_t v35 = __p;
    if (v32 != __p)
    {
      do
      {
        if (*((char *)v34 - 1) < 0) {
          operator delete(*(v34 - 3));
        }
        v34 -= 3;
      }
      while (v34 != __p);
      uint64_t v35 = __p;
    }
    operator delete(v35);
  }
  if (!atomic_fetch_add(a10, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a9->__on_zero_shared)(a9);
    std::__shared_weak_count::__release_weak(a9);
  }
  uint64_t v36 = a11[1];
  if (v36)
  {
    dispatch_group_leave(v36);
    long long v37 = a11[1];
    if (v37) {
      dispatch_release(v37);
    }
  }
  operator delete(a11);
  long long v38 = (std::__shared_weak_count *)a12[2];
  if (v38)
  {
    if (!atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  operator delete(a12);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeGlobalServices(void)::$_0>(ServiceManager::initializeGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::initializeGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke(void **a1)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void **)*a1;
  long long v61 = (void *)**a1;
  uint64_t v3 = v61[5];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (uint64_t)(v61[16] - v61[15]) >> 4;
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_26368A000, v3, OS_LOG_TYPE_DEFAULT, "#I Initializing %zd global services", buf, 0xCu);
  }
  uint64_t v5 = dispatch_group_create();
  uint64_t v58 = v2;
  uint64_t v59 = a1;
  uint64_t v6 = operator new(0x38uLL);
  uint64_t v7 = v6;
  v6[1] = 0;
  long long v57 = v6 + 1;
  v6[2] = 0;
  *uint64_t v6 = &unk_270EADB68;
  v6[3] = v5;
  int v8 = (NSObject **)(v6 + 3);
  unint64_t v60 = (std::__shared_weak_count *)v6;
  if (!v5)
  {
    v6[4] = 0;
    v6[5] = 0;
    v6[6] = 0;
    uint64_t v9 = (uint64_t *)v61[15];
    std::string::size_type v10 = (uint64_t *)v61[16];
    if (v9 == v10) {
      goto LABEL_30;
    }
    while (1)
    {
LABEL_9:
      xpc_object_t v11 = v61[5];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)*v9 + 16))();
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_26368A000, v11, OS_LOG_TYPE_DEFAULT, "#I Initializing '%s'", buf, 0xCu);
      }
      object.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      long long v13 = (const char *)(*(uint64_t (**)(void))(*(void *)*v9 + 16))();
      size_t v14 = strlen(v13);
      if (v14 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v15 = v14;
      if (v14 >= 0x17) {
        break;
      }
      HIBYTE(v65) = v14;
      p_dst = &__dst;
      if (v14) {
        goto LABEL_18;
      }
LABEL_19:
      *((unsigned char *)p_dst + v15) = 0;
      *(_OWORD *)std::string __p = __dst;
      uint64_t v67 = (void *)v65;
      long long __dst = 0uLL;
      unint64_t v65 = 0;
      *(_OWORD *)long long buf = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&object, (uint64_t)v8, (uint64_t)__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(v67) < 0)
      {
        operator delete(__p[0]);
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0])
        {
LABEL_23:
          dispatch_retain(v20);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0]) {
          goto LABEL_23;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v19 + 32))(v19, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v20)
      {
        dispatch_group_leave(v20);
        dispatch_release(v20);
      }
      v9 += 2;
      if (v9 == v10) {
        goto LABEL_30;
      }
    }
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (long long *)operator new(v17 + 1);
    *((void *)&__dst + 1) = v15;
    unint64_t v65 = v18 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
LABEL_18:
    memmove(p_dst, v13, v15);
    goto LABEL_19;
  }
  dispatch_retain(v5);
  v7[4] = 0;
  v7[5] = 0;
  v7[6] = 0;
  dispatch_release(v5);
  uint64_t v9 = (uint64_t *)v61[15];
  std::string::size_type v10 = (uint64_t *)v61[16];
  if (v9 != v10) {
    goto LABEL_9;
  }
LABEL_30:
  uint64_t v21 = *v8;
  uint64_t v22 = (*(uint64_t (**)(void *))(*v61 + 88))(v61);
  dispatch_time_t v23 = dispatch_time(0, 1000000000 * v22);
  uint64_t v24 = v59;
  dispatch_time_t v25 = v60;
  if (!dispatch_group_wait(v21, v23)) {
    goto LABEL_61;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v67 = 0;
  shared_owners = (uint64_t *)v60[1].__shared_owners_;
  for (i = (uint64_t *)v60[1].__shared_weak_owners_; shared_owners != i; shared_owners += 2)
  {
    unint64_t v28 = (std::__shared_weak_count *)shared_owners[1];
    if (v28)
    {
      uint64_t v29 = std::__shared_weak_count::lock(v28);
      if (v29)
      {
        unint64_t v30 = v29;
        uint64_t v31 = *shared_owners;
        if (*shared_owners)
        {
          uint64_t v32 = __p[1];
          if (__p[1] >= v67)
          {
            long long v34 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)__p, v31);
          }
          else
          {
            if (*(char *)(v31 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p[1], *(const std::string::value_type **)v31, *(void *)(v31 + 8));
            }
            else
            {
              long long v33 = *(_OWORD *)v31;
              *((void *)__p[1] + 2) = *(void *)(v31 + 16);
              *uint64_t v32 = v33;
            }
            long long v34 = (std::string *)((char *)v32 + 24);
          }
          __p[1] = v34;
        }
        if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
    }
  }
  unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v77[7] = v35;
  v77[8] = v35;
  v77[5] = v35;
  v77[6] = v35;
  v77[3] = v35;
  v77[4] = v35;
  v77[1] = v35;
  v77[2] = v35;
  long long v76 = v35;
  v77[0] = v35;
  long long v74 = v35;
  long long v75 = v35;
  long long v72 = v35;
  long long v73 = v35;
  *(_OWORD *)long long buf = v35;
  long long v71 = v35;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Initialization TIMEOUT: ", 24);
  uint64_t v36 = (void *)std::ostream::operator<<();
  long long v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)" clients failed to complete init stage: ", 40);
  p_std::string object = &object;
  ctu::join<std::__wrap_iter<std::string *>>(&object, (std::string *)__p[0], (long long *)__p[1]);
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_std::string object = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  size_t v39 = strlen((const char *)p_object);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)p_object, v39);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
  uint64_t v40 = v61[5];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v76) & 0x10) != 0)
    {
      uint64_t v51 = v76;
      if ((unint64_t)v76 < *((void *)&v73 + 1))
      {
        *(void *)&long long v76 = *((void *)&v73 + 1);
        uint64_t v51 = *((void *)&v73 + 1);
      }
      CFAllocatorRef v52 = (const void **)&v73;
    }
    else
    {
      if ((BYTE8(v76) & 8) == 0)
      {
        std::string::size_type v49 = 0;
        *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
        CFDictionaryRef v50 = &object;
LABEL_89:
        v50->__r_.__value_.__s.__data_[v49] = 0;
        long long v56 = &object;
        if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          long long v56 = (std::string *)object.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v68 = 136315138;
        v69 = v56;
        _os_log_error_impl(&dword_26368A000, v40, OS_LOG_TYPE_ERROR, "%s", v68, 0xCu);
        if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(object.__r_.__value_.__l.__data_);
        }
        dispatch_time_t v25 = v60;
        goto LABEL_51;
      }
      CFAllocatorRef v52 = (const void **)&v71 + 1;
      uint64_t v51 = *((void *)&v72 + 1);
    }
    __int16 v53 = *v52;
    std::string::size_type v49 = v51 - (void)*v52;
    if (v49 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v49 >= 0x17)
    {
      uint64_t v54 = (v49 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v49 | 7) != 0x17) {
        uint64_t v54 = v49 | 7;
      }
      uint64_t v55 = v54 + 1;
      CFDictionaryRef v50 = (std::string *)operator new(v54 + 1);
      object.__r_.__value_.__l.__size_ = v49;
      object.__r_.__value_.__r.__words[2] = v55 | 0x8000000000000000;
      object.__r_.__value_.__r.__words[0] = (std::string::size_type)v50;
    }
    else
    {
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v51 - *(unsigned char *)v52;
      CFDictionaryRef v50 = &object;
      if (!v49) {
        goto LABEL_88;
      }
    }
    memmove(v50, v53, v49);
LABEL_88:
    uint64_t v24 = v59;
    goto LABEL_89;
  }
LABEL_51:
  *(void *)long long buf = *MEMORY[0x263F8C2C8];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v75) < 0) {
    operator delete(*((void **)&v74 + 1));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E69630](v77);
  xpc_object_t v41 = (void **)__p[0];
  if (__p[0])
  {
    uint64_t v42 = (void **)__p[1];
    uint64_t v43 = __p[0];
    if (__p[1] != __p[0])
    {
      do
      {
        if (*((char *)v42 - 1) < 0) {
          operator delete(*(v42 - 3));
        }
        v42 -= 3;
      }
      while (v42 != v41);
      uint64_t v43 = __p[0];
    }
    __p[1] = v41;
    operator delete(v43);
  }
LABEL_61:
  dispatch_object_t v44 = v61[5];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26368A000, v44, OS_LOG_TYPE_DEFAULT, "#I All global services initialized", buf, 2u);
    long long v45 = v58;
    if (!atomic_fetch_add(v57, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_63;
    }
LABEL_66:
    long long v46 = v45[1];
    if (!v46) {
      goto LABEL_69;
    }
    goto LABEL_67;
  }
  long long v45 = v58;
  if (atomic_fetch_add(v57, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_66;
  }
LABEL_63:
  ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
  std::__shared_weak_count::__release_weak(v25);
  long long v46 = v45[1];
  if (!v46) {
    goto LABEL_69;
  }
LABEL_67:
  dispatch_group_leave(v46);
  char v47 = v45[1];
  if (v47) {
    dispatch_release(v47);
  }
LABEL_69:
  operator delete(v45);
  xpc_object_t v48 = (std::__shared_weak_count *)v24[2];
  if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
  operator delete(v24);
}

void sub_26379E688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, atomic_ullong *a9, void *a10, void *a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,dispatch_group_t group,uint64_t a23,uint64_t a24,uint64_t a25,void **__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
  if (__p)
  {
    CFAllocatorRef v52 = v50;
    __int16 v53 = __p;
    if (v50 != __p)
    {
      do
      {
        if (*((char *)v52 - 1) < 0) {
          operator delete(*(v52 - 3));
        }
        v52 -= 3;
      }
      while (v52 != __p);
      __int16 v53 = __p;
    }
    operator delete(v53);
  }
  if (!atomic_fetch_add(a9, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  uint64_t v54 = a10[1];
  if (v54)
  {
    dispatch_group_leave(v54);
    uint64_t v55 = a10[1];
    if (v55) {
      dispatch_release(v55);
    }
  }
  operator delete(a10);
  long long v56 = (std::__shared_weak_count *)a11[2];
  if (v56)
  {
    if (!atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownGlobalServices(void)::$_0>(ServiceManager::shutdownGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::shutdownGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke(void **a1)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  unsigned __int8 v1 = (void **)*a1;
  uint64_t v2 = (void *)**a1;
  uint64_t v3 = v2[5];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (uint64_t)(v2[16] - v2[15]) >> 4;
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_26368A000, v3, OS_LOG_TYPE_DEFAULT, "#I Shutdown %zd global services", buf, 0xCu);
  }
  uint64_t v5 = dispatch_group_create();
  uint64_t v6 = operator new(0x38uLL);
  uint64_t v7 = v6;
  v6[1] = 0;
  v69 = v6 + 1;
  size_t v70 = v1;
  v6[2] = 0;
  *uint64_t v6 = &unk_270EADB68;
  v6[3] = v5;
  int v8 = (NSObject **)(v6 + 3);
  long long v72 = (std::__shared_weak_count *)v6;
  if (!v5)
  {
    v6[4] = 0;
    v6[5] = 0;
    v6[6] = 0;
    uint64_t v9 = (uint64_t *)v2[15];
    std::string::size_type v10 = (uint64_t *)v2[16];
    if (v9 == v10) {
      goto LABEL_30;
    }
    while (1)
    {
LABEL_9:
      xpc_object_t v11 = v2[5];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)*v9 + 16))();
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_26368A000, v11, OS_LOG_TYPE_DEFAULT, "#I Shutdown global service '%s'", buf, 0xCu);
      }
      object.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      long long v13 = (const char *)(*(uint64_t (**)(void))(*(void *)*v9 + 16))();
      size_t v14 = strlen(v13);
      if (v14 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v15 = v14;
      if (v14 >= 0x17) {
        break;
      }
      HIBYTE(v76) = v14;
      p_dst = &__dst;
      if (v14) {
        goto LABEL_18;
      }
LABEL_19:
      *((unsigned char *)p_dst + v15) = 0;
      *(_OWORD *)std::string __p = __dst;
      unint64_t v78 = (void *)v76;
      long long __dst = 0uLL;
      unint64_t v76 = 0;
      *(_OWORD *)long long buf = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&object, (uint64_t)v8, (uint64_t)__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(v78) < 0)
      {
        operator delete(__p[0]);
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0])
        {
LABEL_23:
          dispatch_retain(v20);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0]) {
          goto LABEL_23;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v19 + 64))(v19, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v20)
      {
        dispatch_group_leave(v20);
        dispatch_release(v20);
      }
      v9 += 2;
      if (v9 == v10) {
        goto LABEL_30;
      }
    }
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (long long *)operator new(v17 + 1);
    *((void *)&__dst + 1) = v15;
    unint64_t v76 = v18 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
LABEL_18:
    memmove(p_dst, v13, v15);
    goto LABEL_19;
  }
  dispatch_retain(v5);
  v7[4] = 0;
  v7[5] = 0;
  v7[6] = 0;
  dispatch_release(v5);
  uint64_t v9 = (uint64_t *)v2[15];
  std::string::size_type v10 = (uint64_t *)v2[16];
  if (v9 != v10) {
    goto LABEL_9;
  }
LABEL_30:
  uint64_t v21 = *v8;
  uint64_t v22 = (*(uint64_t (**)(void *))(*v2 + 112))(v2);
  dispatch_time_t v23 = dispatch_time(0, 1000000000 * v22);
  uint64_t v24 = v72;
  if (!dispatch_group_wait(v21, v23)) {
    goto LABEL_61;
  }
  __p[0] = 0;
  __p[1] = 0;
  unint64_t v78 = 0;
  shared_owners = (uint64_t *)v72[1].__shared_owners_;
  for (i = (uint64_t *)v72[1].__shared_weak_owners_; shared_owners != i; shared_owners += 2)
  {
    uint64_t v27 = (std::__shared_weak_count *)shared_owners[1];
    if (v27)
    {
      unint64_t v28 = std::__shared_weak_count::lock(v27);
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *shared_owners;
        if (*shared_owners)
        {
          uint64_t v31 = __p[1];
          if (__p[1] >= v78)
          {
            long long v33 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)__p, v30);
          }
          else
          {
            if (*(char *)(v30 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p[1], *(const std::string::value_type **)v30, *(void *)(v30 + 8));
            }
            else
            {
              long long v32 = *(_OWORD *)v30;
              *((void *)__p[1] + 2) = *(void *)(v30 + 16);
              *uint64_t v31 = v32;
            }
            long long v33 = (std::string *)((char *)v31 + 24);
          }
          __p[1] = v33;
        }
        if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
    }
  }
  unint64_t v89 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v88[7] = v34;
  v88[8] = v34;
  v88[5] = v34;
  v88[6] = v34;
  v88[3] = v34;
  v88[4] = v34;
  v88[1] = v34;
  v88[2] = v34;
  long long v87 = v34;
  v88[0] = v34;
  long long v85 = v34;
  long long v86 = v34;
  long long v83 = v34;
  long long v84 = v34;
  *(_OWORD *)long long buf = v34;
  long long v82 = v34;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Shutdown global service: TIMEOUT: ", 34);
  long long v35 = (void *)std::ostream::operator<<();
  uint64_t v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)" clients failed to complete shutdown: ", 38);
  p_std::string object = &object;
  ctu::join<std::__wrap_iter<std::string *>>(&object, (std::string *)__p[0], (long long *)__p[1]);
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_std::string object = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  size_t v38 = strlen((const char *)p_object);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)p_object, v38);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
  size_t v39 = v2[5];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v87) & 0x10) != 0)
    {
      uint64_t v63 = v87;
      if ((unint64_t)v87 < *((void *)&v84 + 1))
      {
        *(void *)&long long v87 = *((void *)&v84 + 1);
        uint64_t v63 = *((void *)&v84 + 1);
      }
      unint64_t v64 = (const void **)&v84;
    }
    else
    {
      if ((BYTE8(v87) & 8) == 0)
      {
        std::string::size_type v61 = 0;
        *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
        xpc_object_t v62 = &object;
LABEL_114:
        v62->__r_.__value_.__s.__data_[v61] = 0;
        v68 = &object;
        if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          v68 = (std::string *)object.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)uint64_t v79 = 136315138;
        int v80 = v68;
        _os_log_error_impl(&dword_26368A000, v39, OS_LOG_TYPE_ERROR, "%s", v79, 0xCu);
        if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(object.__r_.__value_.__l.__data_);
        }
        goto LABEL_51;
      }
      unint64_t v64 = (const void **)&v82 + 1;
      uint64_t v63 = *((void *)&v83 + 1);
    }
    unint64_t v65 = *v64;
    std::string::size_type v61 = v63 - (void)*v64;
    if (v61 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v61 >= 0x17)
    {
      uint64_t v66 = (v61 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v61 | 7) != 0x17) {
        uint64_t v66 = v61 | 7;
      }
      uint64_t v67 = v66 + 1;
      xpc_object_t v62 = (std::string *)operator new(v66 + 1);
      object.__r_.__value_.__l.__size_ = v61;
      object.__r_.__value_.__r.__words[2] = v67 | 0x8000000000000000;
      object.__r_.__value_.__r.__words[0] = (std::string::size_type)v62;
    }
    else
    {
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v63 - *(unsigned char *)v64;
      xpc_object_t v62 = &object;
      if (!v61) {
        goto LABEL_113;
      }
    }
    memmove(v62, v65, v61);
LABEL_113:
    uint64_t v24 = v72;
    goto LABEL_114;
  }
LABEL_51:
  *(void *)long long buf = *MEMORY[0x263F8C2C8];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v86) < 0) {
    operator delete(*((void **)&v85 + 1));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E69630](v88);
  uint64_t v40 = (void **)__p[0];
  if (__p[0])
  {
    xpc_object_t v41 = (void **)__p[1];
    uint64_t v42 = __p[0];
    if (__p[1] != __p[0])
    {
      do
      {
        if (*((char *)v41 - 1) < 0) {
          operator delete(*(v41 - 3));
        }
        v41 -= 3;
      }
      while (v41 != v40);
      uint64_t v42 = __p[0];
    }
    __p[1] = v40;
    operator delete(v42);
  }
LABEL_61:
  uint64_t v43 = v2[16];
  if (v43 != v2[15])
  {
    do
    {
      uint64_t v45 = v43;
      uint64_t v46 = *(void *)(v43 - 16);
      v43 -= 16;
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v82 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(buf, *(void *)(v46 + 24), *(void *)(v46 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v46 + 32) - *(void *)(v46 + 24)) >> 3));
      uint64_t v47 = v2[21];
      __p[1] = 0;
      unint64_t v78 = 0;
      __p[0] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(__p, *(uint64_t *)buf, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3));
      ServiceCtrl::clearCommandHandlers(v47, (uint64_t)__p[0], (uint64_t)__p[1]);
      xpc_object_t v48 = (void **)__p[0];
      if (__p[0])
      {
        std::string::size_type v49 = (void **)__p[1];
        CFDictionaryRef v50 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v49 - 1) < 0) {
              operator delete(*(v49 - 3));
            }
            v49 -= 3;
          }
          while (v49 != v48);
          CFDictionaryRef v50 = __p[0];
        }
        __p[1] = v48;
        operator delete(v50);
      }
      uint64_t v51 = *(void *)buf;
      if (*(void *)buf)
      {
        uint64_t v52 = *(void *)&buf[8];
        dispatch_object_t v44 = *(void **)buf;
        if (*(void *)&buf[8] != *(void *)buf)
        {
          do
          {
            if (*(char *)(v52 - 1) < 0) {
              operator delete(*(void **)(v52 - 24));
            }
            v52 -= 24;
          }
          while (v52 != v51);
          dispatch_object_t v44 = *(void **)buf;
        }
        *(void *)&uint8_t buf[8] = v51;
        operator delete(v44);
      }
    }
    while (v43 != v2[15]);
    uint64_t v53 = v2[16];
    if (v53 != v43)
    {
      uint64_t v54 = v53 + 16;
      do
      {
        uint64_t v55 = *(std::__shared_weak_count **)(v54 - 24);
        if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
        v54 -= 16;
      }
      while (v54 != v45);
    }
  }
  uint8_t v2[16] = v43;
  long long v56 = v2[5];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26368A000, v56, OS_LOG_TYPE_DEFAULT, "#I All global services have shutdown", buf, 2u);
    if (!atomic_fetch_add(v69, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_88;
    }
LABEL_91:
    long long v57 = v70[1];
    uint64_t v58 = a1;
    if (!v57) {
      goto LABEL_94;
    }
    goto LABEL_92;
  }
  if (atomic_fetch_add(v69, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_91;
  }
LABEL_88:
  ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
  std::__shared_weak_count::__release_weak(v24);
  long long v57 = v70[1];
  uint64_t v58 = a1;
  if (!v57) {
    goto LABEL_94;
  }
LABEL_92:
  dispatch_group_leave(v57);
  uint64_t v59 = v70[1];
  if (v59) {
    dispatch_release(v59);
  }
LABEL_94:
  operator delete(v70);
  unint64_t v60 = (std::__shared_weak_count *)v58[2];
  if (v60 && !atomic_fetch_add(&v60->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
    std::__shared_weak_count::__release_weak(v60);
  }
  operator delete(v58);
}

void sub_26379F3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, atomic_ullong *a9, void *a10, void *a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,dispatch_group_t group,uint64_t a23,uint64_t a24,uint64_t a25,void **__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
  if (__p)
  {
    uint64_t v52 = v50;
    uint64_t v53 = __p;
    if (v50 != __p)
    {
      do
      {
        if (*((char *)v52 - 1) < 0) {
          operator delete(*(v52 - 3));
        }
        v52 -= 3;
      }
      while (v52 != __p);
      uint64_t v53 = __p;
    }
    operator delete(v53);
  }
  if (!atomic_fetch_add(a9, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  uint64_t v54 = a10[1];
  if (v54)
  {
    dispatch_group_leave(v54);
    uint64_t v55 = a10[1];
    if (v55) {
      dispatch_release(v55);
    }
  }
  operator delete(a10);
  long long v56 = (std::__shared_weak_count *)a11[2];
  if (v56)
  {
    if (!atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void ServiceCtrl::clearCommandHandlers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + 72;
  uint64_t v9 = a1;
  std::string __p = 0;
  xpc_object_t v11 = 0;
  uint64_t v12 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&__p, a2, a3, 0xAAAAAAAAAAAAAAABLL * ((a3 - a2) >> 3));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_20clearCommandHandlersENSt3__16vectorINS4_12basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS9_ISB_EEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSF__block_invoke;
  block[3] = &__block_descriptor_tmp_59_1;
  block[4] = v4;
  block[5] = &v9;
  uint64_t v5 = *(NSObject **)(a1 + 88);
  if (*(void *)(a1 + 96))
  {
    dispatch_async_and_wait(v5, block);
    uint64_t v6 = (void **)__p;
    if (!__p) {
      return;
    }
  }
  else
  {
    dispatch_sync(v5, block);
    uint64_t v6 = (void **)__p;
    if (!__p) {
      return;
    }
  }
  uint64_t v7 = v11;
  int v8 = v6;
  if (v11 != v6)
  {
    do
    {
      if (*((char *)v7 - 1) < 0) {
        operator delete(*(v7 - 3));
      }
      v7 -= 3;
    }
    while (v7 != v6);
    int v8 = __p;
  }
  xpc_object_t v11 = v6;
  operator delete(v8);
}

void ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_20clearCommandHandlersENSt3__16vectorINS4_12basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS9_ISB_EEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSF__block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = *(void **)(a1 + 40);
  uint64_t v2 = (const void **)v1[1];
  uint64_t v3 = (const void **)v1[2];
  if (v2 != v3)
  {
    uint64_t v4 = *v1;
    uint64_t v5 = (uint64_t **)(*v1 + 120);
    uint64_t v6 = *v1 + 128;
    do
    {
      uint64_t v7 = std::__tree<std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,xpc::dict>>>>::find<std::string>((uint64_t)v5, v2);
      if ((uint64_t *)v6 != v7)
      {
        int v8 = v7;
        uint64_t v9 = (uint64_t *)v7[1];
        if (v9)
        {
          do
          {
            std::string::size_type v10 = v9;
            uint64_t v9 = (uint64_t *)*v9;
          }
          while (v9);
        }
        else
        {
          xpc_object_t v11 = v7;
          do
          {
            std::string::size_type v10 = (uint64_t *)v11[2];
            BOOL v12 = *v10 == (void)v11;
            xpc_object_t v11 = v10;
          }
          while (!v12);
        }
        if (*v5 == v7) {
          NSObject *v5 = v10;
        }
        long long v13 = *(uint64_t **)(v4 + 128);
        --*(void *)(v4 + 136);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, v8);
        size_t v14 = (const void *)v8[7];
        if (v14) {
          _Block_release(v14);
        }
        if (*((char *)v8 + 55) < 0) {
          operator delete((void *)v8[4]);
        }
        operator delete(v8);
      }
      v2 += 3;
    }
    while (v2 != v3);
  }
}

void dispatch::detail::group_notify<ServiceManager::initializeDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::initializeDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *((void *)a1 + 2);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)a1 + 2));
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (v5 = v2[9], (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  int v8 = operator new(0x10uLL);
  void *v8 = v2;
  v8[1] = v3;
  uint64_t v9 = v2[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  std::string::size_type v10 = operator new(0x18uLL);
  *std::string::size_type v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  xpc_object_t v11 = *((void *)a1 + 2);
  if (v11)
  {
    dispatch_group_leave(v11);
    BOOL v12 = *((void *)a1 + 2);
    if (v12) {
      dispatch_release(v12);
    }
  }
  long long v13 = *((void *)a1 + 1);
  if (v13) {
    dispatch_release(v13);
  }

  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  (***(void (****)(void))(v3 + 104))(*(void *)(v3 + 104));
  uint64_t v4 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (uint64_t)(*(void *)(v3 + 152) - *(void *)(v3 + 144)) >> 4;
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_26368A000, v4, OS_LOG_TYPE_DEFAULT, "#I Initializing %zd services", buf, 0xCu);
  }
  uint64_t v106 = a1;
  uint64_t v6 = dispatch_group_create();
  int v107 = v2;
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x38uLL);
  int v8 = &v7->__vftable;
  v7->__shared_owners_ = 0;
  p_shared_owners = &v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EADB68;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  uint64_t v9 = (NSObject **)&v7[1];
  std::string v109 = v7;
  if (!v6)
  {
    v7[1].__shared_owners_ = 0;
    v7[1].__shared_weak_owners_ = 0;
    v7[2].__vftable = 0;
    std::string::size_type v10 = *(uint64_t **)(v3 + 144);
    xpc_object_t v11 = *(uint64_t **)(v3 + 152);
    if (v10 == v11) {
      goto LABEL_30;
    }
    while (1)
    {
LABEL_9:
      BOOL v12 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (*(uint64_t (**)(void))(*(void *)*v10 + 16))();
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_26368A000, v12, OS_LOG_TYPE_DEFAULT, "#I Initializing '%s'", buf, 0xCu);
      }
      object.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      size_t v14 = (const char *)(*(uint64_t (**)(void))(*(void *)*v10 + 16))();
      size_t v15 = strlen(v14);
      if (v15 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v16 = v15;
      if (v15 >= 0x17) {
        break;
      }
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v15;
      p_dst = &__dst;
      if (v15) {
        goto LABEL_18;
      }
LABEL_19:
      p_dst->__r_.__value_.__s.__data_[v16] = 0;
      std::string __p = __dst;
      memset(&__dst, 0, sizeof(__dst));
      memset(buf, 0, sizeof(buf));
      long long v119 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&object, (uint64_t)v9, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v20 = *v10;
        uint64_t v21 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0])
        {
LABEL_23:
          dispatch_retain(v21);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v20 = *v10;
        uint64_t v21 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0]) {
          goto LABEL_23;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v20 + 32))(v20, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v21)
      {
        dispatch_group_leave(v21);
        dispatch_release(v21);
      }
      v10 += 2;
      if (v10 == v11) {
        goto LABEL_30;
      }
    }
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    p_dst = (std::string *)operator new(v18 + 1);
    __dst.__r_.__value_.__l.__size_ = v16;
    __dst.__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_18:
    memmove(p_dst, v14, v16);
    goto LABEL_19;
  }
  dispatch_retain(v6);
  v8[4] = 0;
  void v8[5] = 0;
  v8[6] = 0;
  dispatch_release(v6);
  std::string::size_type v10 = *(uint64_t **)(v3 + 144);
  xpc_object_t v11 = *(uint64_t **)(v3 + 152);
  if (v10 != v11) {
    goto LABEL_9;
  }
LABEL_30:
  uint64_t v22 = *v9;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 88))(v3);
  dispatch_time_t v24 = dispatch_time(0, 1000000000 * v23);
  if (!dispatch_group_wait(v22, v24)) {
    goto LABEL_61;
  }
  memset(&__p, 0, sizeof(__p));
  shared_owners = (uint64_t *)v109[1].__shared_owners_;
  for (i = (uint64_t *)v109[1].__shared_weak_owners_; shared_owners != i; shared_owners += 2)
  {
    uint64_t v27 = (std::__shared_weak_count *)shared_owners[1];
    if (v27)
    {
      unint64_t v28 = std::__shared_weak_count::lock(v27);
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *shared_owners;
        if (*shared_owners)
        {
          std::string::size_type size = (_OWORD *)__p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
          {
            long long v33 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>(&__p.__r_.__value_.__l.__data_, v30);
          }
          else
          {
            if (*(char *)(v30 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p.__r_.__value_.__l.__size_, *(const std::string::value_type **)v30, *(void *)(v30 + 8));
            }
            else
            {
              long long v32 = *(_OWORD *)v30;
              *(void *)(__p.__r_.__value_.__l.__size_ + 16) = *(void *)(v30 + 16);
              *std::string::size_type size = v32;
            }
            long long v33 = (std::string *)((char *)size + 24);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v33;
        }
        if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
    }
  }
  unint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v131 = v34;
  long long v132 = v34;
  long long v129 = v34;
  long long v130 = v34;
  long long v127 = v34;
  long long v128 = v34;
  long long v125 = v34;
  long long v126 = v34;
  long long v123 = v34;
  long long v124 = v34;
  *(_OWORD *)CFAllocatorRef v121 = v34;
  long long v122 = v34;
  long long v119 = v34;
  long long v120 = v34;
  *(_OWORD *)long long buf = v34;
  *(_OWORD *)&uint8_t buf[16] = v34;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Initialization TIMEOUT: ", 24);
  long long v35 = (void *)std::ostream::operator<<();
  uint64_t v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)" clients failed to complete init stage: ", 40);
  p_std::string object = &object;
  ctu::join<std::__wrap_iter<std::string *>>(&object, (std::string *)__p.__r_.__value_.__l.__data_, (long long *)__p.__r_.__value_.__l.__size_);
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_std::string object = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  size_t v38 = strlen((const char *)p_object);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)p_object, v38);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
  size_t v39 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v123) & 0x10) != 0)
    {
      uint64_t v92 = v123;
      if ((unint64_t)v123 < *((void *)&v120 + 1))
      {
        *(void *)&long long v123 = *((void *)&v120 + 1);
        uint64_t v92 = *((void *)&v120 + 1);
      }
      size_t v93 = (const void **)&v120;
    }
    else
    {
      if ((BYTE8(v123) & 8) == 0)
      {
        std::string::size_type v88 = 0;
        *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
        unint64_t v89 = &object;
        goto LABEL_158;
      }
      size_t v93 = (const void **)&buf[24];
      uint64_t v92 = *((void *)&v119 + 1);
    }
    uint64_t v96 = *v93;
    std::string::size_type v88 = v92 - (void)*v93;
    if (v88 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v88 >= 0x17)
    {
      uint64_t v97 = (v88 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v88 | 7) != 0x17) {
        uint64_t v97 = v88 | 7;
      }
      uint64_t v98 = v97 + 1;
      unint64_t v89 = (std::string *)operator new(v97 + 1);
      object.__r_.__value_.__l.__size_ = v88;
      object.__r_.__value_.__r.__words[2] = v98 | 0x8000000000000000;
      object.__r_.__value_.__r.__words[0] = (std::string::size_type)v89;
    }
    else
    {
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v92 - *(unsigned char *)v93;
      unint64_t v89 = &object;
      if (!v88) {
        goto LABEL_158;
      }
    }
    memmove(v89, v96, v88);
LABEL_158:
    v89->__r_.__value_.__s.__data_[v88] = 0;
    xpc_object_t v99 = &object;
    if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      xpc_object_t v99 = (std::string *)object.__r_.__value_.__r.__words[0];
    }
    LODWORD(v117.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v117.__r_.__value_.__r.__words + 4) = (std::string::size_type)v99;
    _os_log_error_impl(&dword_26368A000, v39, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v117, 0xCu);
    if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(object.__r_.__value_.__l.__data_);
    }
  }
  *(void *)long long buf = *MEMORY[0x263F8C2C8];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v122) < 0) {
    operator delete(v121[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E69630](&v124);
  std::string::size_type v40 = __p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    std::string::size_type v41 = __p.__r_.__value_.__l.__size_;
    uint64_t v42 = (void *)__p.__r_.__value_.__r.__words[0];
    if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
    {
      do
      {
        if (*(char *)(v41 - 1) < 0) {
          operator delete(*(void **)(v41 - 24));
        }
        v41 -= 24;
      }
      while (v41 != v40);
      uint64_t v42 = (void *)__p.__r_.__value_.__r.__words[0];
    }
    __p.__r_.__value_.__l.__size_ = v40;
    operator delete(v42);
  }
LABEL_61:
  uint64_t v43 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26368A000, v43, OS_LOG_TYPE_DEFAULT, "#I All services initialized; Starting them now!", buf, 2u);
  }
  dispatch_object_t v44 = dispatch_group_create();
  uint64_t v45 = operator new(0x38uLL);
  uint64_t v46 = v45;
  v45[1] = 0;
  xpc_object_t v104 = v45 + 1;
  v45[2] = 0;
  *uint64_t v45 = &unk_270EADB68;
  v45[3] = v44;
  uint64_t v47 = (NSObject **)(v45 + 3);
  int v108 = (std::__shared_weak_count *)v45;
  if (!v44)
  {
    v45[4] = 0;
    v45[5] = 0;
    v45[6] = 0;
    std::string::size_type v49 = *(uint64_t **)(v3 + 144);
    xpc_object_t v48 = *(uint64_t **)(v3 + 152);
    if (v49 == v48) {
      goto LABEL_90;
    }
    while (1)
    {
LABEL_69:
      CFDictionaryRef v50 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = (*(uint64_t (**)(void))(*(void *)*v49 + 16))();
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v51;
        _os_log_impl(&dword_26368A000, v50, OS_LOG_TYPE_DEFAULT, "#I Starting '%s'", buf, 0xCu);
      }
      v117.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v52 = (const char *)(*(uint64_t (**)(void))(*(void *)*v49 + 16))();
      size_t v53 = strlen(v52);
      if (v53 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v54 = v53;
      if (v53 >= 0x17) {
        break;
      }
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v53;
      uint64_t v55 = &object;
      if (v53) {
        goto LABEL_78;
      }
LABEL_79:
      v55->__r_.__value_.__s.__data_[v54] = 0;
      std::string __p = object;
      memset(&object, 0, sizeof(object));
      memset(buf, 0, sizeof(buf));
      long long v119 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&v117, (uint64_t)v47, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v58 = *v49;
        uint64_t v59 = v117.__r_.__value_.__r.__words[0];
        dispatch_group_t v110 = (dispatch_group_t)v117.__r_.__value_.__r.__words[0];
        if (v117.__r_.__value_.__r.__words[0])
        {
LABEL_83:
          dispatch_retain(v59);
          if (v110) {
            dispatch_group_enter(v110);
          }
        }
      }
      else
      {
        uint64_t v58 = *v49;
        uint64_t v59 = v117.__r_.__value_.__r.__words[0];
        dispatch_group_t v110 = (dispatch_group_t)v117.__r_.__value_.__r.__words[0];
        if (v117.__r_.__value_.__r.__words[0]) {
          goto LABEL_83;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v58 + 40))(v58, &v110);
      if (v110)
      {
        dispatch_group_leave(v110);
        if (v110) {
          dispatch_release(v110);
        }
      }
      if (v59)
      {
        dispatch_group_leave(v59);
        dispatch_release(v59);
      }
      v49 += 2;
      if (v49 == v48) {
        goto LABEL_90;
      }
    }
    uint64_t v56 = (v53 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v53 | 7) != 0x17) {
      uint64_t v56 = v53 | 7;
    }
    uint64_t v57 = v56 + 1;
    uint64_t v55 = (std::string *)operator new(v56 + 1);
    object.__r_.__value_.__l.__size_ = v54;
    object.__r_.__value_.__r.__words[2] = v57 | 0x8000000000000000;
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)v55;
LABEL_78:
    memmove(v55, v52, v54);
    goto LABEL_79;
  }
  dispatch_retain(v44);
  v46[4] = 0;
  v46[5] = 0;
  void v46[6] = 0;
  dispatch_release(v44);
  std::string::size_type v49 = *(uint64_t **)(v3 + 144);
  xpc_object_t v48 = *(uint64_t **)(v3 + 152);
  if (v49 != v48) {
    goto LABEL_69;
  }
LABEL_90:
  atomic_store(0, (unsigned __int8 *)(v3 + 192));
  unint64_t v60 = *v47;
  std::string::size_type v61 = v107;
  xpc_object_t v62 = v108;
  uint64_t v63 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 96))(v3);
  dispatch_time_t v64 = dispatch_time(0, 1000000000 * v63);
  if (!dispatch_group_wait(v60, v64)) {
    goto LABEL_121;
  }
  memset(&__p, 0, sizeof(__p));
  unint64_t v65 = (uint64_t *)v108[1].__shared_owners_;
  for (j = (uint64_t *)v108[1].__shared_weak_owners_; v65 != j; v65 += 2)
  {
    uint64_t v67 = (std::__shared_weak_count *)v65[1];
    if (v67)
    {
      v68 = std::__shared_weak_count::lock(v67);
      if (v68)
      {
        v69 = v68;
        uint64_t v70 = *v65;
        if (*v65)
        {
          long long v71 = (_OWORD *)__p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
          {
            long long v73 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>(&__p.__r_.__value_.__l.__data_, v70);
          }
          else
          {
            if (*(char *)(v70 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p.__r_.__value_.__l.__size_, *(const std::string::value_type **)v70, *(void *)(v70 + 8));
            }
            else
            {
              long long v72 = *(_OWORD *)v70;
              *(void *)(__p.__r_.__value_.__l.__size_ + 16) = *(void *)(v70 + 16);
              _OWORD *v71 = v72;
            }
            long long v73 = (std::string *)((char *)v71 + 24);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v73;
        }
        if (!atomic_fetch_add(&v69->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
          std::__shared_weak_count::__release_weak(v69);
        }
      }
    }
  }
  unint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v74 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v74 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v131 = v74;
  long long v132 = v74;
  long long v129 = v74;
  long long v130 = v74;
  long long v127 = v74;
  long long v128 = v74;
  long long v125 = v74;
  long long v126 = v74;
  long long v123 = v74;
  long long v124 = v74;
  *(_OWORD *)CFAllocatorRef v121 = v74;
  long long v122 = v74;
  long long v119 = v74;
  long long v120 = v74;
  *(_OWORD *)long long buf = v74;
  *(_OWORD *)&uint8_t buf[16] = v74;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Start TIMEOUT: ", 15);
  long long v75 = (void *)std::ostream::operator<<();
  unint64_t v76 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v75, (uint64_t)" clients failed to complete start stage: ", 41);
  uint64_t v77 = &v117;
  ctu::join<std::__wrap_iter<std::string *>>(&v117, (std::string *)__p.__r_.__value_.__l.__data_, (long long *)__p.__r_.__value_.__l.__size_);
  if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v77 = (std::string *)v117.__r_.__value_.__r.__words[0];
  }
  size_t v78 = strlen((const char *)v77);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v76, (uint64_t)v77, v78);
  if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v117.__r_.__value_.__l.__data_);
  }
  uint64_t v79 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v123) & 0x10) != 0)
    {
      uint64_t v94 = v123;
      if ((unint64_t)v123 < *((void *)&v120 + 1))
      {
        *(void *)&long long v123 = *((void *)&v120 + 1);
        uint64_t v94 = *((void *)&v120 + 1);
      }
      size_t v95 = (const void **)&v120;
    }
    else
    {
      if ((BYTE8(v123) & 8) == 0)
      {
        std::string::size_type v90 = 0;
        *((unsigned char *)&v117.__r_.__value_.__s + 23) = 0;
        int v91 = &v117;
LABEL_172:
        v91->__r_.__value_.__s.__data_[v90] = 0;
        xpc_object_t v103 = &v117;
        if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          xpc_object_t v103 = (std::string *)v117.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)CFAllocatorRef v115 = 136315138;
        CFAllocatorRef v116 = v103;
        _os_log_error_impl(&dword_26368A000, v79, OS_LOG_TYPE_ERROR, "%s", v115, 0xCu);
        if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v117.__r_.__value_.__l.__data_);
        }
        xpc_object_t v62 = v108;
        goto LABEL_111;
      }
      size_t v95 = (const void **)&buf[24];
      uint64_t v94 = *((void *)&v119 + 1);
    }
    xpc_object_t v100 = *v95;
    std::string::size_type v90 = v94 - (void)*v95;
    if (v90 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v90 >= 0x17)
    {
      uint64_t v101 = (v90 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v90 | 7) != 0x17) {
        uint64_t v101 = v90 | 7;
      }
      uint64_t v102 = v101 + 1;
      int v91 = (std::string *)operator new(v101 + 1);
      v117.__r_.__value_.__l.__size_ = v90;
      v117.__r_.__value_.__r.__words[2] = v102 | 0x8000000000000000;
      v117.__r_.__value_.__r.__words[0] = (std::string::size_type)v91;
    }
    else
    {
      *((unsigned char *)&v117.__r_.__value_.__s + 23) = v94 - *(unsigned char *)v95;
      int v91 = &v117;
      if (!v90) {
        goto LABEL_171;
      }
    }
    memmove(v91, v100, v90);
LABEL_171:
    std::string::size_type v61 = v107;
    goto LABEL_172;
  }
LABEL_111:
  *(void *)long long buf = *MEMORY[0x263F8C2C8];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v122) < 0) {
    operator delete(v121[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E69630](&v124);
  std::string::size_type v80 = __p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    std::string::size_type v81 = __p.__r_.__value_.__l.__size_;
    long long v82 = (void *)__p.__r_.__value_.__r.__words[0];
    if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
    {
      do
      {
        if (*(char *)(v81 - 1) < 0) {
          operator delete(*(void **)(v81 - 24));
        }
        v81 -= 24;
      }
      while (v81 != v80);
      long long v82 = (void *)__p.__r_.__value_.__r.__words[0];
    }
    __p.__r_.__value_.__l.__size_ = v80;
    operator delete(v82);
  }
LABEL_121:
  long long v83 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26368A000, v83, OS_LOG_TYPE_DEFAULT, "#I All services started", buf, 2u);
  }
  uint64_t v84 = *(void *)(v3 + 104);
  *(void *)long long buf = operator new(0x30uLL);
  *(_OWORD *)&uint8_t buf[8] = xmmword_2637A8370;
  strcpy(*(char **)buf, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(uint64_t, uint8_t *))(*(void *)v84 + 32))(v84, buf);
  if ((char)buf[23] < 0)
  {
    operator delete(*(void **)buf);
    if (atomic_fetch_add(v104, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_125:
      if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_126;
      }
LABEL_130:
      ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
      std::__shared_weak_count::__release_weak(v109);
      long long v85 = v61[1];
      if (!v85) {
        goto LABEL_133;
      }
      goto LABEL_131;
    }
  }
  else if (atomic_fetch_add(v104, 0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_125;
  }
  ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
  std::__shared_weak_count::__release_weak(v62);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_130;
  }
LABEL_126:
  long long v85 = v61[1];
  if (!v85) {
    goto LABEL_133;
  }
LABEL_131:
  dispatch_group_leave(v85);
  long long v86 = v61[1];
  if (v86) {
    dispatch_release(v86);
  }
LABEL_133:
  operator delete(v61);
  long long v87 = (std::__shared_weak_count *)v106[2];
  if (v87 && !atomic_fetch_add(&v87->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
    std::__shared_weak_count::__release_weak(v87);
  }
  operator delete(v106);
}

void sub_2637A0B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, atomic_ullong *a9, atomic_ullong *a10, void *a11, void *a12, std::__shared_weak_count *a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, dispatch_group_t group, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,dispatch_group_t object,uint64_t a25,uint64_t a26,uint64_t a27,void **__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61)
{
  if (!atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
    std::__shared_weak_count::__release_weak(v61);
  }
  if (__p)
  {
    dispatch_time_t v64 = v62;
    unint64_t v65 = __p;
    if (v62 != __p)
    {
      do
      {
        if (*((char *)v64 - 1) < 0) {
          operator delete(*(v64 - 3));
        }
        v64 -= 3;
      }
      while (v64 != __p);
      unint64_t v65 = __p;
    }
    operator delete(v65);
  }
  if (!atomic_fetch_add(a9, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a13->__on_zero_shared)(a13);
    std::__shared_weak_count::__release_weak(a13);
  }
  if (!atomic_fetch_add(a10, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
    std::__shared_weak_count::__release_weak(a14);
  }
  uint64_t v66 = a12[1];
  if (v66)
  {
    dispatch_group_leave(v66);
    uint64_t v67 = a12[1];
    if (v67) {
      dispatch_release(v67);
    }
  }
  operator delete(a12);
  v68 = (std::__shared_weak_count *)a11[2];
  if (v68)
  {
    if (!atomic_fetch_add(&v68->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void dispatch::detail::group_notify<ServiceManager::shutdownDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::shutdownDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *((void *)a1 + 2);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)a1 + 2));
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (v5 = v2[9], (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  int v8 = operator new(0x10uLL);
  void *v8 = v2;
  v8[1] = v3;
  uint64_t v9 = v2[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  std::string::size_type v10 = operator new(0x18uLL);
  *std::string::size_type v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  xpc_object_t v11 = *((void *)a1 + 2);
  if (v11)
  {
    dispatch_group_leave(v11);
    BOOL v12 = *((void *)a1 + 2);
    if (v12) {
      dispatch_release(v12);
    }
  }
  uint64_t v13 = *((void *)a1 + 1);
  if (v13) {
    dispatch_release(v13);
  }

  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(std::__shared_weak_count **a1)
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  unint64_t v133 = *a1;
  unsigned __int8 v1 = (*a1)->__vftable;
  uint64_t v2 = v1[1].~__shared_weak_count;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = ((char *)v1[3].__on_zero_shared_weak - (char *)v1[3].__get_deleter) >> 4;
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_26368A000, v2, OS_LOG_TYPE_DEFAULT, "#I Shutdown %zd dynamic services", buf, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)&v1[4].__on_zero_shared_weak);
  xpc_object_t v146 = 0;
  uint64_t v147 = 0;
  xpc_object_t v145 = &v146;
  on_zero_shared_weak = v1[3].__on_zero_shared_weak;
  if (on_zero_shared_weak == (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter) {
    goto LABEL_189;
  }
  while (2)
  {
    memset(buf, 170, 24);
    uint64_t v5 = *((void *)on_zero_shared_weak - 2);
    on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)on_zero_shared_weak - 16);
    (*(void (**)(uint8_t *__return_ptr))(*(void *)v5 + 24))(buf);
    uint64_t v6 = *(unsigned __int8 **)buf;
    v139 = *(unsigned __int8 **)&buf[8];
    uint64_t v137 = on_zero_shared_weak;
    if (*(void *)buf == *(void *)&buf[8])
    {
      if (*(void *)buf) {
        goto LABEL_73;
      }
      goto LABEL_5;
    }
    do
    {
      while (1)
      {
        unsigned int v7 = *v6;
        int v8 = v146;
        uint64_t v9 = &v146;
LABEL_12:
        std::string::size_type v10 = v9;
        if (v8) {
          break;
        }
LABEL_17:
        BOOL v12 = operator new(0x40uLL);
        uint64_t v13 = v12;
        *((unsigned char *)v12 + 32) = v7;
        v12[6] = 0;
        v12[7] = 0;
        void v12[5] = 0;
        *BOOL v12 = 0;
        v12[1] = 0;
        v12[2] = v9;
        *std::string::size_type v10 = v12;
        size_t v14 = v12;
        if (*v145)
        {
          xpc_object_t v145 = (void **)*v145;
          size_t v14 = (void *)*v10;
        }
        size_t v15 = v146;
        BOOL v16 = v14 == v146;
        *((unsigned char *)v14 + 24) = v14 == v146;
        if (!v16)
        {
          do
          {
            uint64_t v17 = v14[2];
            if (*(unsigned char *)(v17 + 24)) {
              break;
            }
            uint64_t v18 = *(void **)(v17 + 16);
            uint64_t v19 = *v18;
            if (*v18 == v17)
            {
              uint64_t v22 = v18[1];
              if (!v22 || (v23 = *(unsigned __int8 *)(v22 + 24), uint64_t v20 = (unsigned char *)(v22 + 24), v23))
              {
                if (*(void **)v17 == v14)
                {
                  *(unsigned char *)(v17 + 24) = 1;
                  *((unsigned char *)v18 + 24) = 0;
                  uint64_t v26 = *(void *)(v17 + 8);
                  *uint64_t v18 = v26;
                  if (v26) {
                    goto LABEL_34;
                  }
                }
                else
                {
                  dispatch_time_t v24 = *(uint64_t **)(v17 + 8);
                  uint64_t v25 = *v24;
                  *(void *)(v17 + 8) = *v24;
                  if (v25)
                  {
                    *(void *)(v25 + 16) = v17;
                    uint64_t v18 = *(void **)(v17 + 16);
                  }
                  v24[2] = (uint64_t)v18;
                  *(void *)(*(void *)(v17 + 16) + 8 * (**(void **)(v17 + 16) != v17)) = v24;
                  uint64_t *v24 = v17;
                  *(void *)(v17 + 16) = v24;
                  uint64_t v18 = (void *)v24[2];
                  uint64_t v17 = *v18;
                  *((unsigned char *)v24 + 24) = 1;
                  *((unsigned char *)v18 + 24) = 0;
                  uint64_t v26 = *(void *)(v17 + 8);
                  *uint64_t v18 = v26;
                  if (v26) {
LABEL_34:
                  }
                    *(void *)(v26 + 16) = v18;
                }
                *(void *)(v17 + 16) = v18[2];
                *(void *)(v18[2] + 8 * (*(void *)v18[2] != (void)v18)) = v17;
                *(void *)(v17 + 8) = v18;
LABEL_42:
                v18[2] = v17;
                break;
              }
            }
            else if (!v19 || (v21 = *(unsigned __int8 *)(v19 + 24), uint64_t v20 = (unsigned char *)(v19 + 24), v21))
            {
              if (*(void **)v17 == v14)
              {
                uint64_t v50 = v14[1];
                *(void *)uint64_t v17 = v50;
                if (v50)
                {
                  *(void *)(v50 + 16) = v17;
                  uint64_t v18 = *(void **)(v17 + 16);
                }
                v14[2] = v18;
                *(void *)(*(void *)(v17 + 16) + 8 * (**(void **)(v17 + 16) != v17)) = v14;
                v14[1] = v17;
                *(void *)(v17 + 16) = v14;
                uint64_t v18 = (void *)v14[2];
                *((unsigned char *)v14 + 24) = 1;
                *((unsigned char *)v18 + 24) = 0;
                uint64_t v17 = v18[1];
                uint64_t v30 = *(void **)v17;
                v18[1] = *(void *)v17;
                if (v30) {
LABEL_40:
                }
                  v30[2] = v18;
              }
              else
              {
                *(unsigned char *)(v17 + 24) = 1;
                *((unsigned char *)v18 + 24) = 0;
                uint64_t v17 = v18[1];
                uint64_t v30 = *(void **)v17;
                v18[1] = *(void *)v17;
                if (v30) {
                  goto LABEL_40;
                }
              }
              *(void *)(v17 + 16) = v18[2];
              *(void *)(v18[2] + 8 * (*(void *)v18[2] != (void)v18)) = v17;
              *(void *)uint64_t v17 = v18;
              goto LABEL_42;
            }
            *(unsigned char *)(v17 + 24) = 1;
            size_t v14 = v18;
            *((unsigned char *)v18 + 24) = v18 == v15;
            *uint64_t v20 = 1;
          }
          while (v18 != v15);
        }
        ++v147;
        uint64_t v27 = *(void *)on_zero_shared_weak;
        uint64_t v29 = (char *)v12[6];
        unint64_t v28 = (char *)v12[7];
        if (v29 >= v28) {
          goto LABEL_44;
        }
LABEL_9:
        *(void *)uint64_t v29 = v27;
        v13[6] = v29 + 8;
        if (++v6 == v139) {
          goto LABEL_72;
        }
      }
      while (1)
      {
        uint64_t v9 = (void **)v8;
        unsigned int v11 = *((unsigned __int8 *)v8 + 32);
        if (v7 < v11)
        {
          int v8 = *v9;
          goto LABEL_12;
        }
        if (v11 >= v7) {
          break;
        }
        int v8 = v9[1];
        if (!v8)
        {
          std::string::size_type v10 = v9 + 1;
          goto LABEL_17;
        }
      }
      uint64_t v13 = v9;
      uint64_t v27 = *(void *)on_zero_shared_weak;
      uint64_t v29 = (char *)v9[6];
      unint64_t v28 = (char *)v9[7];
      if (v29 < v28) {
        goto LABEL_9;
      }
LABEL_44:
      uint64_t v31 = v1;
      long long v32 = (char *)v13[5];
      uint64_t v33 = (v29 - v32) >> 3;
      unint64_t v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 61) {
        std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v35 = v28 - v32;
      if (v35 >> 2 > v34) {
        unint64_t v34 = v35 >> 2;
      }
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v36 = v34;
      }
      if (v36)
      {
        if (v36 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        long long v37 = (char *)operator new(8 * v36);
        size_t v38 = &v37[8 * v33];
        *(void *)size_t v38 = v27;
        uint64_t v39 = (uint64_t)(v38 + 8);
        std::string::size_type v40 = (char *)(v29 - v32);
        if (v29 == v32)
        {
LABEL_62:
          void v13[5] = v38;
          v13[6] = v39;
          v13[7] = &v37[8 * v36];
          unsigned __int8 v1 = v31;
          if (!v29) {
            goto LABEL_64;
          }
LABEL_63:
          operator delete(v29);
          goto LABEL_64;
        }
      }
      else
      {
        long long v37 = 0;
        size_t v38 = (char *)(8 * v33);
        *(void *)(8 * v33) = v27;
        uint64_t v39 = 8 * v33 + 8;
        std::string::size_type v40 = (char *)(v29 - v32);
        if (v29 == v32) {
          goto LABEL_62;
        }
      }
      unint64_t v41 = (unint64_t)(v40 - 8);
      if (v41 < 0x58) {
        goto LABEL_231;
      }
      if ((unint64_t)(v32 - v37) < 0x20) {
        goto LABEL_231;
      }
      uint64_t v42 = (v41 >> 3) + 1;
      uint64_t v43 = 8 * (v42 & 0x3FFFFFFFFFFFFFFCLL);
      dispatch_object_t v44 = &v29[-v43];
      v38 -= v43;
      uint64_t v45 = &v37[8 * v33 - 16];
      uint64_t v46 = v29 - 16;
      uint64_t v47 = v42 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v48 = *(_OWORD *)v46;
        *((_OWORD *)v45 - 1) = *((_OWORD *)v46 - 1);
        *(_OWORD *)uint64_t v45 = v48;
        v45 -= 32;
        v46 -= 32;
        v47 -= 4;
      }
      while (v47);
      uint64_t v29 = v44;
      if (v42 != (v42 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_231:
        do
        {
          uint64_t v49 = *((void *)v29 - 1);
          v29 -= 8;
          *((void *)v38 - 1) = v49;
          v38 -= 8;
        }
        while (v29 != v32);
      }
      uint64_t v29 = (char *)v13[5];
      void v13[5] = v38;
      v13[6] = v39;
      v13[7] = &v37[8 * v36];
      unsigned __int8 v1 = v31;
      if (v29) {
        goto LABEL_63;
      }
LABEL_64:
      on_zero_shared_weak = v137;
      v13[6] = v39;
      ++v6;
    }
    while (v6 != v139);
LABEL_72:
    uint64_t v6 = *(unsigned __int8 **)buf;
    if (*(void *)buf)
    {
LABEL_73:
      *(void *)&uint8_t buf[8] = v6;
      operator delete(v6);
    }
LABEL_5:
    if (on_zero_shared_weak != (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter) {
      continue;
    }
    break;
  }
  uint64_t v51 = v145;
  if (v145 == &v146) {
    goto LABEL_189;
  }
  uint64_t v134 = *MEMORY[0x263F8C2C8];
  uint64_t v135 = *(void *)(MEMORY[0x263F8C2C8] + 24);
  while (2)
  {
    uint64_t v52 = dispatch_group_create();
    size_t v53 = operator new(0x38uLL);
    std::string::size_type v54 = v53;
    v53[1] = 0;
    uint64_t v136 = v53 + 1;
    int v138 = (std::__shared_weak_count *)v53;
    v53[2] = 0;
    *size_t v53 = &unk_270EADB68;
    v53[3] = v52;
    uint64_t v55 = (NSObject **)(v53 + 3);
    if (v52)
    {
      dispatch_retain(v52);
      v54[4] = 0;
      v54[5] = 0;
      v54[6] = 0;
      dispatch_release(v52);
    }
    else
    {
      v53[4] = 0;
      v53[5] = 0;
      v53[6] = 0;
    }
    uint64_t v56 = v51[5];
    uint64_t v57 = v51[6];
    while (2)
    {
      if (v56 != v57)
      {
        uint64_t v58 = v1[1].~__shared_weak_count;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v59 = *((char *)v51 + 32);
          unint64_t v60 = "???";
          if (v59 <= 3) {
            unint64_t v60 = off_2655D57B0[v59];
          }
          uint64_t v61 = (*(uint64_t (**)(void))(*(void *)*v56 + 16))();
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = v60;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v61;
          _os_log_impl(&dword_26368A000, v58, OS_LOG_TYPE_DEFAULT, "#I Shutdown dynamic service: Stage=%s Service=%s", buf, 0x16u);
        }
        dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
        xpc_object_t v62 = (const char *)(*(uint64_t (**)(void))(*(void *)*v56 + 16))();
        size_t v63 = strlen(v62);
        if (v63 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        size_t v64 = v63;
        if (v63 >= 0x17)
        {
          uint64_t v66 = (v63 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v63 | 7) != 0x17) {
            uint64_t v66 = v63 | 7;
          }
          uint64_t v67 = v66 + 1;
          p_dst = (long long *)operator new(v66 + 1);
          *((void *)&__dst + 1) = v64;
          unint64_t v143 = v67 | 0x8000000000000000;
          *(void *)&long long __dst = p_dst;
        }
        else
        {
          HIBYTE(v143) = v63;
          p_dst = &__dst;
          if (!v63) {
            goto LABEL_95;
          }
        }
        memmove(p_dst, v62, v64);
LABEL_95:
        *((unsigned char *)p_dst + v64) = 0;
        *(_OWORD *)std::string __p = __dst;
        v149 = (void *)v143;
        long long __dst = 0uLL;
        unint64_t v143 = 0;
        memset(buf, 0, sizeof(buf));
        long long v152 = 0u;
        ctu::TrackedGroup::fork(&object, (uint64_t)v55, (uint64_t)__p, (uint64_t)buf);
        if (*((void *)&v152 + 1) && *(void *)buf)
        {
          v140.__r_.__value_.__r.__words[0] = *(void *)&buf[8];
          *(void *)xpc_object_t v150 = *(void *)buf;
          (*(void (**)(void))(**((void **)&v152 + 1) + 48))();
        }
        if (*(void *)&buf[8]) {
          os_release(*(void **)&buf[8]);
        }
        v68 = (uint8_t *)*((void *)&v152 + 1);
        *(void *)&uint8_t buf[8] = 0;
        *((void *)&v152 + 1) = 0;
        if (v68 == &buf[16])
        {
          (*(void (**)(uint8_t *))(*(void *)&buf[16] + 32))(&buf[16]);
          uint64_t v69 = *((void *)&v152 + 1);
          *(void *)long long buf = 0;
          if (*((uint8_t **)&v152 + 1) == &buf[16]) {
            goto LABEL_108;
          }
LABEL_103:
          if (v69)
          {
            (*(void (**)(uint64_t))(*(void *)v69 + 40))(v69);
            if (SHIBYTE(v149) < 0) {
              goto LABEL_105;
            }
          }
          else
          {
LABEL_109:
            if (SHIBYTE(v149) < 0) {
              goto LABEL_105;
            }
          }
        }
        else
        {
          if (v68)
          {
            (*(void (**)(uint8_t *))(*(void *)v68 + 40))(v68);
            uint64_t v69 = *((void *)&v152 + 1);
            *(void *)long long buf = 0;
            if (*((uint8_t **)&v152 + 1) != &buf[16]) {
              goto LABEL_103;
            }
LABEL_108:
            (*(void (**)(uint8_t *))(*(void *)&buf[16] + 32))(&buf[16]);
            goto LABEL_109;
          }
          *(void *)long long buf = 0;
          if (SHIBYTE(v149) < 0)
          {
LABEL_105:
            operator delete(__p[0]);
            uint64_t v70 = *v56;
            uint64_t v71 = *((unsigned __int8 *)v51 + 32);
            long long v72 = object;
            dispatch_group_t group = object;
            if (!object)
            {
LABEL_113:
              (*(void (**)(uint64_t, uint64_t, dispatch_group_t *))(*(void *)v70 + 72))(v70, v71, &group);
              if (group)
              {
                dispatch_group_leave(group);
                if (group) {
                  dispatch_release(group);
                }
              }
              if (v72)
              {
                dispatch_group_leave(v72);
                dispatch_release(v72);
              }
              ++v56;
              continue;
            }
LABEL_111:
            dispatch_retain(v72);
            if (group) {
              dispatch_group_enter(group);
            }
            goto LABEL_113;
          }
        }
        uint64_t v70 = *v56;
        uint64_t v71 = *((unsigned __int8 *)v51 + 32);
        long long v72 = object;
        dispatch_group_t group = object;
        if (!object) {
          goto LABEL_113;
        }
        goto LABEL_111;
      }
      break;
    }
    long long v73 = *v55;
    uint64_t v74 = (*((uint64_t (**)(std::__shared_weak_count_vtbl *, void))v1->~__shared_weak_count + 15))(v1, *((unsigned __int8 *)v51 + 32));
    dispatch_time_t v75 = dispatch_time(0, 1000000000 * v74);
    unint64_t v76 = v138;
    if (dispatch_group_wait(v73, v75))
    {
      __p[0] = 0;
      __p[1] = 0;
      v149 = 0;
      shared_owners = (uint64_t *)v138[1].__shared_owners_;
      shared_weak_owners = (uint64_t *)v138[1].__shared_weak_owners_;
      while (shared_owners != shared_weak_owners)
      {
        uint64_t v79 = (std::__shared_weak_count *)shared_owners[1];
        if (v79)
        {
          std::string::size_type v80 = std::__shared_weak_count::lock(v79);
          if (v80)
          {
            std::string::size_type v81 = v80;
            uint64_t v82 = *shared_owners;
            if (*shared_owners)
            {
              long long v83 = __p[1];
              if (__p[1] >= v149)
              {
                long long v85 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)__p, v82);
              }
              else
              {
                if (*(char *)(v82 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)__p[1], *(const std::string::value_type **)v82, *(void *)(v82 + 8));
                }
                else
                {
                  long long v84 = *(_OWORD *)v82;
                  *((void *)__p[1] + 2) = *(void *)(v82 + 16);
                  *long long v83 = v84;
                }
                long long v85 = (std::string *)((char *)v83 + 24);
              }
              __p[1] = v85;
            }
            if (!atomic_fetch_add(&v81->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
              std::__shared_weak_count::__release_weak(v81);
            }
          }
        }
        shared_owners += 2;
      }
      unint64_t v158 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v86 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v86 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v157[7] = v86;
      v157[8] = v86;
      v157[5] = v86;
      v157[6] = v86;
      v157[3] = v86;
      v157[4] = v86;
      v157[1] = v86;
      v157[2] = v86;
      long long v156 = v86;
      v157[0] = v86;
      *(_OWORD *)uint64_t v154 = v86;
      long long v155 = v86;
      long long v152 = v86;
      long long v153 = v86;
      *(_OWORD *)long long buf = v86;
      *(_OWORD *)&uint8_t buf[16] = v86;
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
      long long v87 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Shutdown dynamic service: Stage=", 32);
      unint64_t v88 = *((char *)v51 + 32);
      unint64_t v89 = "???";
      if (v88 <= 3) {
        unint64_t v89 = off_2655D57B0[v88];
      }
      size_t v90 = strlen(v89);
      int v91 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v87, (uint64_t)v89, v90);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v91, (uint64_t)" TIMEOUT: ", 10);
      uint64_t v92 = (void *)std::ostream::operator<<();
      size_t v93 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v92, (uint64_t)" clients failed to complete shutdown stage: ", 44);
      ctu::join<std::__wrap_iter<std::string *>>(&v140, (std::string *)__p[0], (long long *)__p[1]);
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v94 = &v140;
      }
      else {
        uint64_t v94 = (std::string *)v140.__r_.__value_.__r.__words[0];
      }
      size_t v95 = strlen((const char *)v94);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v93, (uint64_t)v94, v95);
      if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v140.__r_.__value_.__l.__data_);
        uint64_t v96 = v1[1].~__shared_weak_count;
        if (!os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
          goto LABEL_170;
        }
      }
      else
      {
        uint64_t v96 = v1[1].~__shared_weak_count;
        if (!os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
          goto LABEL_170;
        }
      }
      if ((BYTE8(v156) & 0x10) != 0)
      {
        uint64_t v101 = v156;
        uint64_t v102 = (const void **)&v153;
        if ((unint64_t)v156 < *((void *)&v153 + 1))
        {
          *(void *)&long long v156 = *((void *)&v153 + 1);
          uint64_t v101 = *((void *)&v153 + 1);
          uint64_t v102 = (const void **)&v153;
        }
LABEL_158:
        xpc_object_t v103 = *v102;
        std::string::size_type v104 = v101 - (void)*v102;
        if (v104 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v104 >= 0x17)
        {
          uint64_t v106 = (v104 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v104 | 7) != 0x17) {
            uint64_t v106 = v104 | 7;
          }
          uint64_t v107 = v106 + 1;
          uint64_t v105 = (std::string *)operator new(v106 + 1);
          v140.__r_.__value_.__l.__size_ = v104;
          v140.__r_.__value_.__r.__words[2] = v107 | 0x8000000000000000;
          v140.__r_.__value_.__r.__words[0] = (std::string::size_type)v105;
        }
        else
        {
          *((unsigned char *)&v140.__r_.__value_.__s + 23) = v101 - *(unsigned char *)v102;
          uint64_t v105 = &v140;
          if (!v104) {
            goto LABEL_166;
          }
        }
        memmove(v105, v103, v104);
      }
      else
      {
        if ((BYTE8(v156) & 8) != 0)
        {
          uint64_t v101 = *((void *)&v152 + 1);
          uint64_t v102 = (const void **)&buf[24];
          goto LABEL_158;
        }
        std::string::size_type v104 = 0;
        *((unsigned char *)&v140.__r_.__value_.__s + 23) = 0;
        uint64_t v105 = &v140;
      }
LABEL_166:
      v105->__r_.__value_.__s.__data_[v104] = 0;
      int v108 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int v108 = (std::string *)v140.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)xpc_object_t v150 = 136315138;
      *(void *)&v150[4] = v108;
      _os_log_error_impl(&dword_26368A000, v96, OS_LOG_TYPE_ERROR, "%s", v150, 0xCu);
      if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v140.__r_.__value_.__l.__data_);
      }
LABEL_170:
      *(void *)long long buf = v134;
      *(void *)&buf[*(void *)(v134 - 24)] = v135;
      *(void *)&uint8_t buf[8] = MEMORY[0x263F8C318] + 16;
      if (SHIBYTE(v155) < 0) {
        operator delete(v154[1]);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x263E69630](v157);
      std::string v109 = (void **)__p[0];
      if (__p[0])
      {
        dispatch_group_t v110 = (void **)__p[1];
        CFAllocatorRef v111 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v110 - 1) < 0) {
              operator delete(*(v110 - 3));
            }
            v110 -= 3;
          }
          while (v110 != v109);
          CFAllocatorRef v111 = __p[0];
        }
        __p[1] = v109;
        operator delete(v111);
      }
      unint64_t v76 = v138;
      if (!atomic_fetch_add(v136, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_181:
        ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
        std::__shared_weak_count::__release_weak(v76);
        xpc_object_t v100 = v51[1];
        if (v100) {
          goto LABEL_182;
        }
        do
        {
LABEL_184:
          uint64_t v112 = (void **)v51[2];
          BOOL v16 = *v112 == v51;
          uint64_t v51 = v112;
        }
        while (!v16);
        goto LABEL_76;
      }
    }
    else
    {
      uint64_t v97 = v1[1].~__shared_weak_count;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v98 = *((char *)v51 + 32);
        xpc_object_t v99 = "???";
        if (v98 <= 3) {
          xpc_object_t v99 = off_2655D57B0[v98];
        }
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v99;
        _os_log_impl(&dword_26368A000, v97, OS_LOG_TYPE_DEFAULT, "#I Shutdown dynamic service: Stage=%s SUCCESS", buf, 0xCu);
        if (!atomic_fetch_add(v136, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_181;
        }
      }
      else if (!atomic_fetch_add(v136, 0xFFFFFFFFFFFFFFFFLL))
      {
        goto LABEL_181;
      }
    }
    xpc_object_t v100 = v51[1];
    if (!v100) {
      goto LABEL_184;
    }
    do
    {
LABEL_182:
      uint64_t v112 = (void **)v100;
      xpc_object_t v100 = (void *)*v100;
    }
    while (v100);
LABEL_76:
    uint64_t v51 = v112;
    if (v112 != &v146) {
      continue;
    }
    break;
  }
  on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter;
LABEL_189:
  if (v1[3].__on_zero_shared_weak != on_zero_shared_weak)
  {
    on_zero_shared_weak = v1[3].__on_zero_shared_weak;
    do
    {
      uint64_t v114 = on_zero_shared_weak;
      uint64_t v115 = *((void *)on_zero_shared_weak - 2);
      on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)on_zero_shared_weak - 16);
      memset(buf, 0, 24);
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(buf, *(void *)(v115 + 24), *(void *)(v115 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v115 + 32) - *(void *)(v115 + 24)) >> 3));
      uint64_t v116 = (uint64_t)v1[4].~__shared_weak_count_0;
      __p[1] = 0;
      v149 = 0;
      __p[0] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(__p, *(uint64_t *)buf, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3));
      ServiceCtrl::clearCommandHandlers(v116, (uint64_t)__p[0], (uint64_t)__p[1]);
      std::string v117 = (void **)__p[0];
      if (__p[0])
      {
        uint64_t v118 = (void **)__p[1];
        long long v119 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v118 - 1) < 0) {
              operator delete(*(v118 - 3));
            }
            v118 -= 3;
          }
          while (v118 != v117);
          long long v119 = __p[0];
        }
        __p[1] = v117;
        operator delete(v119);
      }
      uint64_t v120 = *(void *)buf;
      if (*(void *)buf)
      {
        uint64_t v121 = *(void *)&buf[8];
        uint64_t v113 = *(void **)buf;
        if (*(void *)&buf[8] != *(void *)buf)
        {
          do
          {
            if (*(char *)(v121 - 1) < 0) {
              operator delete(*(void **)(v121 - 24));
            }
            v121 -= 24;
          }
          while (v121 != v120);
          uint64_t v113 = *(void **)buf;
        }
        *(void *)&uint8_t buf[8] = v120;
        operator delete(v113);
      }
    }
    while (on_zero_shared_weak != (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter);
    long long v122 = v1[3].__on_zero_shared_weak;
    if (v122 != on_zero_shared_weak)
    {
      long long v123 = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)v122 + 16);
      do
      {
        long long v124 = (std::__shared_weak_count *)*((void *)v123 - 3);
        if (v124 && !atomic_fetch_add(&v124->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v124->__on_zero_shared)(v124);
          std::__shared_weak_count::__release_weak(v124);
        }
        long long v123 = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)v123 - 16);
      }
      while (v123 != v114);
    }
  }
  v1[3].__on_zero_shared_weak = on_zero_shared_weak;
  get_deleter = v1[2].__get_deleter;
  *(void *)long long buf = operator new(0x30uLL);
  *(_OWORD *)&uint8_t buf[8] = xmmword_2637A8370;
  strcpy(*(char **)buf, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *), uint8_t *))(*(void *)get_deleter + 32))(get_deleter, buf);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  (*(void (**)(const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *)))(*(void *)v1[2].__get_deleter + 8))(v1[2].__get_deleter);
  long long v126 = v1[1].~__shared_weak_count;
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v140.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_26368A000, v126, OS_LOG_TYPE_DEFAULT, "#I All dynamic services have shutdown", (uint8_t *)&v140, 2u);
  }
  std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(v146);
  long long v127 = v133;
  long long v128 = v133->__shared_owners_;
  if (v128)
  {
    dispatch_group_leave(v128);
    long long v127 = v133;
    long long v129 = v133->__shared_owners_;
    if (v129)
    {
      dispatch_release(v129);
      long long v127 = v133;
    }
  }
  operator delete(v127);
  long long v130 = a1;
  long long v131 = a1[2];
  if (v131 && !atomic_fetch_add(&v131->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v131->__on_zero_shared)(v131);
    std::__shared_weak_count::__release_weak(v131);
    long long v130 = a1;
  }
  operator delete(v130);
}

void sub_2637A2498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count **a10, NSObject **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,dispatch_group_t group,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  if (a48 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(a35);
  uint64_t v49 = a11;
  uint64_t v50 = a11[1];
  if (v50)
  {
    dispatch_group_leave(v50);
    uint64_t v49 = a11;
    uint64_t v51 = a11[1];
    if (v51)
    {
      dispatch_release(v51);
      uint64_t v49 = a11;
    }
  }
  operator delete(v49);
  uint64_t v52 = a10;
  size_t v53 = a10[2];
  if (v53)
  {
    if (!atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
      uint64_t v52 = a10;
    }
  }
  operator delete(v52);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(*a1);
    std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(a1[1]);
    uint64_t v2 = (void *)a1[5];
    if (v2)
    {
      a1[6] = v2;
      operator delete(v2);
    }
    operator delete(a1);
  }
}

uint64_t APFSVolumeNeedsCryptoMigration()
{
  return MEMORY[0x270F08B20]();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x270F08B40]();
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x270EE4E80](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t IOPMClaimSystemWakeEvent()
{
  return MEMORY[0x270EF4888]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x270F77160]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x270F967E0]();
}

uint64_t TelephonyBasebandGetBasebandState()
{
  return MEMORY[0x270F96800]();
}

uint64_t TelephonyBasebandGetManagerState()
{
  return MEMORY[0x270F96808]();
}

uint64_t TelephonyBasebandGetPowerDebugOptions()
{
  return MEMORY[0x270F96818]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x270F96820]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x270F964F0]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x270F964F8]();
}

uint64_t TelephonyBasebandPowerDebugUnblock()
{
  return MEMORY[0x270F96830]();
}

uint64_t TelephonyBasebandPowerOnModem()
{
  return MEMORY[0x270F96838]();
}

uint64_t TelephonyBasebandPowercycleModem()
{
  return MEMORY[0x270F96840]();
}

uint64_t TelephonyBasebandRegisterForReset()
{
  return MEMORY[0x270F96850]();
}

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x270F96858]();
}

uint64_t TelephonyBasebandResetSPMI()
{
  return MEMORY[0x270F96860]();
}

uint64_t TelephonyBasebandSetBasebandProperty()
{
  return MEMORY[0x270F96868]();
}

uint64_t TelephonyBasebandSetBasebandState()
{
  return MEMORY[0x270F96870]();
}

uint64_t TelephonyBasebandSetChargerDesense()
{
  return MEMORY[0x270F96878]();
}

uint64_t TelephonyBasebandSetManagerState()
{
  return MEMORY[0x270F96880]();
}

uint64_t TelephonyBasebandSetPowerDebugOptions()
{
  return MEMORY[0x270F96890]();
}

uint64_t TelephonyBasebandWatchdogStart()
{
  return MEMORY[0x270F970A8]();
}

uint64_t TelephonyBasebandWatchdogStop()
{
  return MEMORY[0x270F970B0]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x270F97178]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x270F97180]();
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x270F970B8]();
}

uint64_t TelephonyUtilGetSystemWakeReason()
{
  return MEMORY[0x270F970C0]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x270F970C8]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x270F970D0]();
}

uint64_t TelephonyUtilIsVendorBuild()
{
  return MEMORY[0x270F970D8]();
}

uint64_t TelephonyUtilSystemMachTime()
{
  return MEMORY[0x270F970E0]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::abs::shouldBoot(capabilities::abs *this)
{
  return MEMORY[0x270F96B30](this);
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  return MEMORY[0x270F96B38](this);
}

uint64_t capabilities::abs::logScratchPath(capabilities::abs *this)
{
  return MEMORY[0x270F96B40](this);
}

uint64_t capabilities::abs::logSnapshotPath(capabilities::abs *this)
{
  return MEMORY[0x270F96B48](this);
}

uint64_t capabilities::abs::shouldSetRegion(capabilities::abs *this)
{
  return MEMORY[0x270F96B50](this);
}

uint64_t capabilities::abs::shouldIgnoreResets(capabilities::abs *this)
{
  return MEMORY[0x270F96B58](this);
}

uint64_t capabilities::abs::supportsRFSelfTest(capabilities::abs *this)
{
  return MEMORY[0x270F96B60](this);
}

uint64_t capabilities::abs::supportsETSProtocol(capabilities::abs *this)
{
  return MEMORY[0x270F96B68](this);
}

uint64_t capabilities::abs::supportsRadioHealth(capabilities::abs *this)
{
  return MEMORY[0x270F96B70](this);
}

uint64_t capabilities::abs::supportsRFFEScanData(capabilities::abs *this)
{
  return MEMORY[0x270F96B78](this);
}

uint64_t capabilities::abs::supportsChargerDesense(capabilities::abs *this)
{
  return MEMORY[0x270F96B80](this);
}

uint64_t capabilities::abs::supportsResetSPMIEvent(capabilities::abs *this)
{
  return MEMORY[0x270F96B88](this);
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  return MEMORY[0x270F96B90](this);
}

uint64_t capabilities::abs::supportsFieldTestConfig(capabilities::abs *this)
{
  return MEMORY[0x270F96B98](this);
}

uint64_t capabilities::abs::defaultSystemLogsHistory(capabilities::abs *this)
{
  return MEMORY[0x270F96BA0](this);
}

uint64_t capabilities::abs::supportsCalibrationQuery(capabilities::abs *this)
{
  return MEMORY[0x270F96BA8](this);
}

uint64_t capabilities::abs::supportsEFSEraseOnBootLoop(capabilities::abs *this)
{
  return MEMORY[0x270F96BB8](this);
}

uint64_t capabilities::abs::supportsDataTransportService(capabilities::abs *this)
{
  return MEMORY[0x270F96BC0](this);
}

uint64_t capabilities::abs::supportsBatteryInfoMonitoring(capabilities::abs *this)
{
  return MEMORY[0x270F96BC8](this);
}

uint64_t capabilities::abs::serviceInitTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96BD0](this);
}

uint64_t capabilities::abs::serviceSleepTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96BD8](this);
}

uint64_t capabilities::abs::serviceStartTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96BE0](this);
}

uint64_t capabilities::abs::resetAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96BE8](this);
}

uint64_t capabilities::abs::traceTransportTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96BF0](this);
}

uint64_t capabilities::abs::bootupAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96BF8](this);
}

uint64_t capabilities::abs::serviceShutdownTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96C00](this);
}

uint64_t capabilities::abs::shutdownAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96C08](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadSize(capabilities::abs *this)
{
  return MEMORY[0x270F96C10](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadCount(capabilities::abs *this)
{
  return MEMORY[0x270F96C20](this);
}

uint64_t capabilities::abs::supportsWirelessTelemetryUsingMultiClientModel(capabilities::abs *this)
{
  return MEMORY[0x270F96C28](this);
}

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  return MEMORY[0x270F96C30](this);
}

uint64_t capabilities::ipc::defaultLogLevel(capabilities::ipc *this)
{
  return MEMORY[0x270F96C38](this);
}

uint64_t capabilities::ipc::supportsIPMetadataTrailer(capabilities::ipc *this)
{
  return MEMORY[0x270F96C50](this);
}

uint64_t capabilities::ipc::defaultMHIConfigPayloadSizeBytes(capabilities::ipc *this)
{
  return MEMORY[0x270F96C58](this);
}

uint64_t capabilities::ipc::defaultPCIBinaryTraceHistorySizeMB(capabilities::ipc *this)
{
  return MEMORY[0x270F96C60](this);
}

uint64_t capabilities::radio::supportsMultiClientAWD(capabilities::radio *this)
{
  return MEMORY[0x270F96CF0](this);
}

uint64_t capabilities::radio::supportsAutomaticRadarFiling(capabilities::radio *this)
{
  return MEMORY[0x270F96D00](this);
}

uint64_t capabilities::radio::supportsFactoryCalibrationV2(capabilities::radio *this)
{
  return MEMORY[0x270F96D08](this);
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  return MEMORY[0x270F96D10](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x270F96D18](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x270F96D28](this);
}

uint64_t capabilities::radio::product(capabilities::radio *this)
{
  return MEMORY[0x270F96D30](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x270F96D38](this);
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  return MEMORY[0x270F96D40](this);
}

uint64_t capabilities::radio::radioType(capabilities::radio *this)
{
  return MEMORY[0x270F96D50](this);
}

uint64_t capabilities::trace::enabledByDefault(capabilities::trace *this)
{
  return MEMORY[0x270F96D58](this);
}

uint64_t capabilities::trace::getCompressionMode(capabilities::trace *this)
{
  return MEMORY[0x270F96D60](this);
}

uint64_t capabilities::trace::defaultFileSizeBytes(capabilities::trace *this)
{
  return MEMORY[0x270F96D68](this);
}

uint64_t capabilities::trace::defaultHistorySizeMB(capabilities::trace *this)
{
  return MEMORY[0x270F96D70](this);
}

uint64_t capabilities::trace::defaultMemoryFileMaxCount(capabilities::trace *this)
{
  return MEMORY[0x270F96D88](this);
}

uint64_t capabilities::trace::supportsDumpLogIndication(capabilities::trace *this)
{
  return MEMORY[0x270F96D90](this);
}

uint64_t capabilities::trace::supportsHighTPutByDefault(capabilities::trace *this)
{
  return MEMORY[0x270F96D98](this);
}

uint64_t capabilities::trace::supportsDataLoggingByDefault(capabilities::trace *this)
{
  return MEMORY[0x270F96DA0](this);
}

uint64_t capabilities::trace::supportsDuplicateSignatureDetection(capabilities::trace *this)
{
  return MEMORY[0x270F96DA8](this);
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  return MEMORY[0x270F96DB0](this);
}

uint64_t capabilities::txpower::supportsPowerChargerDesense(capabilities::txpower *this)
{
  return MEMORY[0x270F96DD8](this);
}

uint64_t AppleBasebandManager::setEventHandler()
{
  return MEMORY[0x270F0CE60]();
}

uint64_t AppleBasebandManager::create()
{
  return MEMORY[0x270F0CE68]();
}

uint64_t AppleBasebandManager::perform()
{
  return MEMORY[0x270F0CE70]();
}

uint64_t AppleBasebandManager::eventsOn(AppleBasebandManager *this)
{
  return MEMORY[0x270F0CE78](this);
}

uint64_t CommandDriverFactory::setRegistry()
{
  return MEMORY[0x270F91638]();
}

uint64_t CommandDriverFactory::create_default_global(CommandDriverFactory *this)
{
  return MEMORY[0x270F91640](this);
}

uint64_t ApplePDPHelperInterface::getInstance(ApplePDPHelperInterface *this)
{
  return MEMORY[0x270F0E890](this);
}

uint64_t ApplePDPHelperInterface::enableMetadataTrailer(ApplePDPHelperInterface *this, uint64_t a2, BOOL *a3)
{
  return MEMORY[0x270F0E898](this, a2, a3);
}

uint64_t ApplePDPHelperInterface::enableLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x270F0E8A0](this);
}

uint64_t ApplePDPHelperInterface::activateLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x270F0E8A8](this);
}

uint64_t ApplePDPHelperInterface::getNumLowPowerPDPThrottleStats()
{
  return MEMORY[0x270F0E8B0]();
}

uint64_t abm::HelperClient::registerForHelperReady()
{
  return MEMORY[0x270F08460]();
}

uint64_t abm::HelperClient::create()
{
  return MEMORY[0x270F08468]();
}

uint64_t abm::HelperClient::perform()
{
  return MEMORY[0x270F08470]();
}

{
  return MEMORY[0x270F08478]();
}

uint64_t abm::trace::isSupported()
{
  return MEMORY[0x270F08480]();
}

uint64_t abm::client::Command::create()
{
  return MEMORY[0x270F0CE98]();
}

uint64_t abm::helper::asEnum(abm::helper *this, const char *a2)
{
  return MEMORY[0x270F08488](this, a2);
}

uint64_t abm::helper::asString()
{
  return MEMORY[0x270F08490]();
}

{
  return MEMORY[0x270F08498]();
}

{
  return MEMORY[0x270F084A0]();
}

{
  return MEMORY[0x270F084A8]();
}

uint64_t abm::asString()
{
  return MEMORY[0x270F0CEB0]();
}

{
  return MEMORY[0x270F0CEB8]();
}

{
  return MEMORY[0x270F0CEC0]();
}

uint64_t awd::AppContext::setHandler()
{
  return MEMORY[0x270F91650]();
}

{
  return MEMORY[0x270F91658]();
}

{
  return MEMORY[0x270F91660]();
}

uint64_t awd::AppContext::setProperties()
{
  return MEMORY[0x270F91668]();
}

uint64_t awd::AwdCommandDriver::checkIn()
{
  return MEMORY[0x270F91670]();
}

uint64_t awd::asString()
{
  return MEMORY[0x270F91688]();
}

{
  return MEMORY[0x270F91698]();
}

uint64_t ctu::LogMessage::LogMessage()
{
  return MEMORY[0x270F97260]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x270F97268]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972A8](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x270F972B0]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x270F972B8](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x270F972D0]();
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

uint64_t ctu::TrackedLogger::registerLoggerToServer()
{
  return MEMORY[0x270F97398]();
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

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x270F97420]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x270F97430]();
}

{
  return MEMORY[0x270F97438]();
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x270F97448]();
}

uint64_t ctu::DispatchTimerService::create()
{
  return MEMORY[0x270F974A8]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x270F974F0](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x270F97500](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x270F97508]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F97518](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x270F97530](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
}

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x270F97540](this, a2);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

{
  return MEMORY[0x270F97558]();
}

uint64_t ctu::cf::assign(ctu::cf *this, signed __int8 *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97568](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x270F97570](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97588](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned __int16 *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97590](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, uint64_t *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97598](this, a2, a3);
}

uint64_t ctu::fs::remove_dir()
{
  return MEMORY[0x270F975A8]();
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x270F975B0]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x270F975C8]();
}

uint64_t ctu::fs::get_file_size()
{
  return MEMORY[0x270F975D0]();
}

uint64_t ctu::fs::create_directory()
{
  return MEMORY[0x270F975E0]();
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

uint64_t ctu::iokit::Controller::registerForBatteryInfoChange()
{
  return MEMORY[0x270F970E8]();
}

uint64_t ctu::iokit::Controller::stopBatteryInfoNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x270F970F0](this);
}

uint64_t ctu::iokit::Controller::create()
{
  return MEMORY[0x270F970F8]();
}

uint64_t ctu::power::manager::registerListener()
{
  return MEMORY[0x270F97100]();
}

uint64_t ctu::power::manager::get(ctu::power::manager *this)
{
  return MEMORY[0x270F97108](this);
}

uint64_t ctu::power::manager::asCString(ctu::power::manager *this)
{
  return MEMORY[0x270F97110](this);
}

uint64_t ctu::power::assertion::createInternal()
{
  return MEMORY[0x270F97118]();
}

uint64_t ctu::power::assertion::assertion(ctu::power::assertion *this)
{
  return MEMORY[0x270F97120](this);
}

uint64_t ctu::assign()
{
  return MEMORY[0x270F976D0]();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x270F976E8](this);
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x270F97708]();
}

uint64_t ctu::LogServer::setEnabled(ctu::LogServer *this)
{
  return MEMORY[0x270F97710](this);
}

uint64_t ctu::LogServer::updateConfig()
{
  return MEMORY[0x270F97718]();
}

uint64_t ctu::LogServer::log()
{
  return MEMORY[0x270F97720]();
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return MEMORY[0x270F97728](this);
}

uint64_t ctu::LogServer::create()
{
  return MEMORY[0x270F97730]();
}

uint64_t ctu::LogServer::addWriter()
{
  return MEMORY[0x270F97738]();
}

uint64_t ctu::XpcServer::setListener_sync()
{
  return MEMORY[0x270F97758]();
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x270F97760](this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return MEMORY[0x270F97768]();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x270F97778](this, a2);
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

uint64_t pci::event::Listener::create()
{
  return MEMORY[0x270F96528]();
}

uint64_t wis::WISServerConnection::RegisterCallbackForTimer()
{
  return MEMORY[0x270F858F0]();
}

uint64_t wis::WISServerConnection::RegisterQueriableMetricCallbackForIdentifier()
{
  return MEMORY[0x270F858F8]();
}

uint64_t wis::WISServerConnection::WISServerConnection(wis::WISServerConnection *this)
{
  return MEMORY[0x270F85900](this);
}

void wis::WISServerConnection::~WISServerConnection(wis::WISServerConnection *this)
{
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return MEMORY[0x270F977D8](this, a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x270F977E0]();
}

{
  return MEMORY[0x270F977E8]();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2)
{
  return MEMORY[0x270F977F0](this, a2);
}

{
  return MEMORY[0x270F97800](this, a2);
}

{
  return MEMORY[0x270F97808](this, a2);
}

{
  return MEMORY[0x270F97810](this, a2);
}

{
  return MEMORY[0x270F97820](this, a2);
}

{
  return MEMORY[0x270F97828](this, a2);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return MEMORY[0x270F97830](this, a2);
}

uint64_t diag::config::asEnum()
{
  return MEMORY[0x270F084B0]();
}

uint64_t util::writeJSON()
{
  return MEMORY[0x270F084B8]();
}

uint64_t radio::asStringV2()
{
  return MEMORY[0x270F916C8]();
}

uint64_t radio::CommandDriver::watchClientState()
{
  return MEMORY[0x270F916D8]();
}

uint64_t radio::CommandDriver::watchOperatingMode()
{
  return MEMORY[0x270F916E0]();
}

uint64_t radio::RFCalibration_t::fill()
{
  return MEMORY[0x270F91700]();
}

uint64_t radio::RFCalibration_t::toString(radio::RFCalibration_t *this)
{
  return MEMORY[0x270F91708](this);
}

uint64_t radio::RFCalibration_t::RFCalibration_t(radio::RFCalibration_t *this)
{
  return MEMORY[0x270F91710](this);
}

uint64_t radio::BasebandProperties::create()
{
  return MEMORY[0x270F91728]();
}

uint64_t radio::HealthCommandDriver::LinkStats::LinkStats(radio::HealthCommandDriver::LinkStats *this)
{
  return MEMORY[0x270F91730](this);
}

uint64_t radio::asString()
{
  return MEMORY[0x270F91740]();
}

{
  return MEMORY[0x270F91748]();
}

uint64_t trace::toString()
{
  return MEMORY[0x270F109C8]();
}

void Factory::Factory(Factory *this)
{
}

void Factory::~Factory(Factory *this)
{
}

void Registry::Registry(Registry *this)
{
}

uint64_t abm::client::Event::name(abm::client::Event *this)
{
  return MEMORY[0x270F0CEC8](this);
}

uint64_t abm::client::Event::getData(abm::client::Event *this)
{
  return MEMORY[0x270F0CED0](this);
}

uint64_t awd::AppContext::getProperties(awd::AppContext *this)
{
  return MEMORY[0x270F91770](this);
}

uint64_t awd::AppContext::getAppID(awd::AppContext *this)
{
  return MEMORY[0x270F91778](this);
}

uint64_t ctu::LoggerCommonBase::getLogDomain(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x270F978D8](this);
}

uint64_t ctu::cf::map_adapter::copyCFArrayRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F978F0](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFNumberRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F978F8](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFDictionaryRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97900](this, a2);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97908](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97910](this, a2);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x270F97920]();
}

uint64_t ctu::LogServer::getConfig(ctu::LogServer *this)
{
  return MEMORY[0x270F97938](this);
}

uint64_t ctu::XpcServer::getListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x270F97940](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x270F97948](this);
}

uint64_t Registry::getRegistryModel(Registry *this)
{
  return MEMORY[0x270F91810](this);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98340](this, a2);
}

void std::length_error::~length_error(std::length_error *this)
{
}

{
  MEMORY[0x270F98378](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
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

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
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

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
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
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987B8]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D8]();
}

{
  return MEMORY[0x270F987E0]();
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x270F18A78]();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDAE18](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDB020](*(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x270EDB578](a1, a2);
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

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
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

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC430](value);
}
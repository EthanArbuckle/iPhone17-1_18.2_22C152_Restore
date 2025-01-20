void std::__tree<unsigned int>::destroy(void *a1)
{
  uint64_t vars8;

  if (a1)
  {
    std::__tree<unsigned int>::destroy(*a1);
    std::__tree<unsigned int>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t *std::__tree<unsigned int>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void ice::registerClientSniffer(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a1 + 23) < 0)
  {
    if (!*(void *)(a1 + 8)) {
      return;
    }
  }
  else if (!*(unsigned char *)(a1 + 23))
  {
    return;
  }
  if (*(void *)a2)
  {
    uint64_t v5 = qword_26AB33810;
    if (qword_26AB33810)
    {
      v6 = &qword_26AB33810;
      while (1)
      {
        while (1)
        {
          v7 = (uint64_t *)v5;
          v8 = (void *)(v5 + 32);
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((void *)a1, (void **)(v5 + 32)) & 0x80) == 0)break; {
          uint64_t v5 = *v7;
          }
          v6 = v7;
          if (!*v7) {
            goto LABEL_16;
          }
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, (void **)a1) & 0x80) == 0) {
          break;
        }
        v6 = v7 + 1;
        uint64_t v5 = v7[1];
        if (!v5) {
          goto LABEL_16;
        }
      }
      if (*v6) {
        goto LABEL_22;
      }
    }
    else
    {
      v6 = &qword_26AB33810;
      v7 = &qword_26AB33810;
    }
LABEL_16:
    unint64_t v12 = 0xAAAAAAAAAAAAAA00;
    v9 = (char *)operator new(0x48uLL);
    v11[0] = v9;
    v11[1] = &qword_26AB33810;
    v10 = (std::string *)(v9 + 32);
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    }
    else
    {
      *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
      *((void *)v9 + 6) = *(void *)(a1 + 16);
    }
    *(_OWORD *)(v9 + 56) = *(_OWORD *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    LOBYTE(v12) = 1;
    *(void *)v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v7;
    uint64_t *v6 = (uint64_t)v9;
    {
      v9 = (char *)*v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_26AB33810, (uint64_t *)v9);
    ++qword_26AB33818;
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>>>>::reset[abi:ne180100]((uint64_t)v11);
LABEL_22:
  }
}

void sub_21C7037F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *anonymous namespace'::sGetMutex(_anonymous_namespace_ *this)
{
  {
    unk_26AB337C8 = 0u;
    unk_26AB337D8 = 0u;
    unk_26AB337E8 = 0u;
    qword_26AB337F8 = 0;
  }
}

uint64_t *anonymous namespace'::sGetClientSniffers(_anonymous_namespace_ *this)
{
  {
    qword_26AB33818 = 0;
    qword_26AB33810 = 0;
  }
}

void ice::deregisterClientSniffer(_anonymous_namespace_ *a1)
{
  v4 = v3;
  if (v3 != &qword_26AB33810)
  {
    uint64_t v5 = (uint64_t *)v3[1];
    if (v5)
    {
      do
      {
        v6 = v5;
        uint64_t v5 = (uint64_t *)*v5;
      }
      while (v5);
    }
    else
    {
      v7 = v3;
      do
      {
        v6 = (uint64_t *)v7[2];
        BOOL v8 = *v6 == (void)v7;
        v7 = v6;
      }
      while (!v8);
    }
    --qword_26AB33818;
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_26AB33810, v3);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<ice::ClientSnifferDelegateBase>>,0>((uint64_t)(v4 + 4));
    operator delete(v4);
  }
}

void sub_21C7039C8(_Unwind_Exception *a1)
{
}

void ice::notifySnifferClientRegistered(_anonymous_namespace_ *a1)
{
  if (v3 != (void **)&qword_26AB33810) {
    (*(void (**)(void *))(*(void *)v3[7] + 16))(v3[7]);
  }
}

void sub_21C703A7C(_Unwind_Exception *a1)
{
}

void ice::notifySnifferClientDeregistered(_anonymous_namespace_ *a1)
{
  if (v3 != (void **)&qword_26AB33810) {
    (*(void (**)(void *))(*(void *)v3[7] + 24))(v3[7]);
  }
}

void sub_21C703B30(_Unwind_Exception *a1)
{
}

void ice::notifySnifferIndicationRegistered(_anonymous_namespace_ *a1, uint64_t a2)
{
  if (v5 != (void **)&qword_26AB33810) {
    (**(void (***)(void *, uint64_t))v5[7])(v5[7], a2);
  }
}

void sub_21C703BEC(_Unwind_Exception *a1)
{
}

void ice::notifySnifferIndicationCanWake(_anonymous_namespace_ *a1, uint64_t a2)
{
  if (v5 != (void **)&qword_26AB33810) {
    (*(void (**)(void *, uint64_t))(*(void *)v5[7] + 8))(v5[7], a2);
  }
}

void sub_21C703CA8(_Unwind_Exception *a1)
{
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
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
    int v8 = (std::string *)operator new(v6 + 1);
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26441A088, MEMORY[0x263F8C060]);
}

void sub_21C703E58(_Unwind_Exception *a1)
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

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            char *v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
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
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<ice::ClientSnifferDelegateBase>>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<ice::ClientSnifferDelegateBase>>,0>(uint64_t a1)
{
  size_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    size_t v3 = *(void **)a1;
    operator delete(v3);
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

void **std::__tree<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>>>::find<std::string>(uint64_t a1, void **a2)
{
  size_t v2 = (void **)(a1 + 8);
  size_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = (void **)(a1 + 8);
  do
  {
    char v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6 >= 0) {
      uint64_t v5 = (void **)v3;
    }
    size_t v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  size_t v3 = a2;
  if (*a2)
  {
    int v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      size_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      size_t v3 = v4;
      int v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  char v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 != v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v18 = v7[1];
      *(void *)uint64_t v12 = v18;
      if (v18) {
        *(void *)(v18 + 16) = v12;
      }
      v7[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
      v7[1] = v12;
      *(void *)(v12 + 16) = v7;
      if (result == (uint64_t *)v12) {
        result = v7;
      }
      uint64_t v7 = *(uint64_t **)v12;
    }
    v19 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_68;
    }
    v20 = (uint64_t *)v7[1];
    if (v20 && !*((unsigned char *)v20 + 24))
    {
      if (v19 && !*((unsigned char *)v19 + 24))
      {
LABEL_68:
        v20 = v7;
      }
      else
      {
        *((unsigned char *)v20 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v26 = *v20;
        v7[1] = *v20;
        if (v26) {
          *(void *)(v26 + 16) = v7;
        }
        v20[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
        uint64_t *v20 = (uint64_t)v7;
        v7[2] = (uint64_t)v20;
        v19 = v7;
      }
      uint64_t v23 = v20[2];
      *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      v24 = *(uint64_t **)v23;
      uint64_t v27 = *(void *)(*(void *)v23 + 8);
      *(void *)uint64_t v23 = v27;
      if (v27) {
        *(void *)(v27 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      v24[1] = v23;
      goto LABEL_72;
    }
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v13 = *(uint64_t **)(v12 + 8);
    uint64_t v14 = *v13;
    *(void *)(v12 + 8) = *v13;
    if (v14) {
      *(void *)(v14 + 16) = v12;
    }
    v13[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
    *uint64_t v13 = v12;
    *(void *)(v12 + 16) = v13;
    if (result == (uint64_t *)*v7) {
      result = v7;
    }
    uint64_t v7 = *(uint64_t **)(*v7 + 8);
  }
  v15 = (void *)*v7;
  if (!*v7 || *((unsigned char *)v15 + 24))
  {
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_59;
    }
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  v16 = (uint64_t *)v7[1];
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_59:
    v15 = v7;
  }
  else
  {
    *((unsigned char *)v15 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = v15[1];
    uint64_t *v7 = v22;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v15[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
    v15[1] = v7;
    v7[2] = (uint64_t)v15;
    v16 = v7;
  }
  uint64_t v23 = v15[2];
  *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  v24 = *(uint64_t **)(v23 + 8);
  uint64_t v25 = *v24;
  *(void *)(v23 + 8) = *v24;
  if (v25) {
    *(void *)(v25 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  uint64_t *v24 = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t ice::AriMsgWrapper<void>::create@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  int v4 = operator new(0x60uLL);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = &unk_26CCFC3F8;
  uint64_t result = MEMORY[0x21D4ADFE0](v4 + 3, a1);
  *a2 = result;
  a2[1] = (uint64_t)v4;
  return result;
}

void sub_21C7045C0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

ice::ResponseContext *ice::ResponseContext::ResponseContext(ice::ResponseContext *this, const unsigned __int8 *a2, size_t __sz)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(this, a2, (uint64_t)&a2[__sz], __sz);
  *((unsigned char *)this + 24) = 0;
  return this;
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(this, a2, (uint64_t)&a2[__sz], __sz);
  *((unsigned char *)this + 24) = 0;
  return this;
}

uint64_t ice::AutoSender::AutoSender(uint64_t a1, long long *a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return ice::AutoSender::operator=(a1, a2);
}

{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return ice::AutoSender::operator=(a1, a2);
}

uint64_t ice::AutoSender::operator=(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    long long v4 = *a2;
    *(void *)a2 = 0;
    *((void *)a2 + 1) = 0;
    int v5 = *(std::__shared_weak_count **)(a1 + 8);
    *(_OWORD *)a1 = v4;
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    long long v6 = a2[1];
    *((void *)a2 + 2) = 0;
    *((void *)a2 + 3) = 0;
    uint64_t v7 = *(std::__shared_weak_count **)(a1 + 24);
    *(_OWORD *)(a1 + 16) = v6;
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    int v8 = (std::__shared_weak_count *)*((void *)a2 + 1);
    *(void *)a2 = 0;
    *((void *)a2 + 1) = 0;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    uint64_t v9 = (std::__shared_weak_count *)*((void *)a2 + 3);
    *((void *)a2 + 2) = 0;
    *((void *)a2 + 3) = 0;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return a1;
}

void ice::AutoSender::~AutoSender(ice::AutoSender *this)
{
  uint64_t v2 = *(ice::detail::SendState **)this;
  if (v2) {
    ice::detail::SendState::send(v2);
  }
  size_t v3 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  long long v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

BOOL ice::detail::SendState::send(ice::detail::SendState *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (!v2) {
    return 0;
  }
  size_t v3 = std::__shared_weak_count::lock(v2);
  if (!v3) {
    return 0;
  }
  long long v4 = v3;
  uint64_t v5 = *((void *)this + 2);
  BOOL v6 = v5 != 0;
  if (v5)
  {
    uint64_t v7 = (std::__shared_weak_count *)*((void *)this + 1);
    if (!v7
      || (unint64_t v8 = *((void *)this + 4),
          uint64_t v9 = *(std::__shared_weak_count_vtbl **)this,
          (uint64_t v10 = std::__shared_weak_count::lock(v7)) == 0))
    {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v11 = v10;
    uint64_t v12 = (std::__shared_weak_count *)operator new(0x28uLL);
    v12->__shared_weak_owners_ = 0;
    v12->__shared_owners_ = 0;
    v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC478;
    v12[1].__vftable = v9;
    v12[1].__shared_owners_ = (uint64_t)v11;
    *(void *)&long long v20 = MEMORY[0x263EF8330];
    *((void *)&v20 + 1) = 1174405120;
    BOOL v21 = ___ZN3ice6detail12wrapCallbackIZNS0_9SendState4sendEvE3__0vEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEOT__block_invoke;
    uint64_t v22 = &__block_descriptor_tmp;
    uint64_t v23 = v12 + 1;
    v24 = v12;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN3ice6detail12wrapCallbackIvEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEU13block_pointerFT_S4_jE_block_invoke;
    aBlock[3] = &unk_26441A0C8;
    aBlock[4] = &v20;
    uint64_t v13 = _Block_copy(aBlock);
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v18 = v14;
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(&v20, (void *)(v5 + 8));
    uint64_t v15 = v20;
    long long v17 = v20;
    if (*((void *)&v20 + 1))
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v20 + 1) + 8), 1uLL, memory_order_relaxed);
      long long v18 = v8;
      LODWORD(v19) = *(_DWORD *)(v15 + 72);
      if (*((void *)&v20 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v20 + 1));
      }
    }
    else
    {
      long long v18 = v8;
      LODWORD(v19) = *(_DWORD *)(v20 + 72);
    }
    *((void *)&v18 + 1) = v13;
    ice::SendMsgBaseProxy::~SendMsgBaseProxy((std::__shared_weak_count **)&v17);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  return v6;
}

void sub_21C704940(_Unwind_Exception *a1)
{
  if (v2) {
    _Block_release(v2);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

BOOL ice::AutoSender::operator BOOL(void *a1)
{
  return *a1 != 0;
}

void ice::AutoSender::thenInternal(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  long long v5 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  BOOL v6 = *(std::__shared_weak_count **)(v4 + 88);
  *(_OWORD *)(v4 + 80) = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  long long v7 = a2[1];
  *((void *)a2 + 2) = 0;
  *((void *)a2 + 3) = 0;
  unint64_t v8 = *(std::__shared_weak_count **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = v7;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)a2 + 1);
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  uint64_t v10 = (std::__shared_weak_count *)*((void *)a2 + 3);
  *((void *)a2 + 2) = 0;
  *((void *)a2 + 3) = 0;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

uint64_t ice::AutoSender::then(uint64_t a1, long long *a2)
{
  return a1;
}

{
  ice::AutoSender::thenInternal(a1, a2);
  return a1;
}

__n128 ice::detail::SendState::SendState(__n128 *a1, unint64_t *a2, __n128 *a3)
{
  a1->n128_u64[0] = 0;
  a1->n128_u64[1] = 0;
  unint64_t v3 = a2[1];
  a1[1].n128_u64[0] = *a2;
  a1[1].n128_u64[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  __n128 result = *a3;
  a1[2] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  a1[4].n128_u64[1] = 0;
  a1[5].n128_u64[0] = 0;
  a1[5].n128_u64[1] = 0;
  return result;
}

{
  unint64_t v3;
  __n128 result;

  a1->n128_u64[0] = 0;
  a1->n128_u64[1] = 0;
  unint64_t v3 = a2[1];
  a1[1].n128_u64[0] = *a2;
  a1[1].n128_u64[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  __n128 result = *a3;
  a1[2] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  a1[4].n128_u64[1] = 0;
  a1[5].n128_u64[0] = 0;
  a1[5].n128_u64[1] = 0;
  return result;
}

void ice::detail::SendState::operator()(uint64_t a1, const void *a2, size_t __sz)
{
  if (*(void *)(a1 + 72))
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
    __p = 0;
    unint64_t v8 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, a2, (uint64_t)a2 + __sz, __sz);
    uint64_t v4 = *(void *)(a1 + 72);
    LOBYTE(v10) = *(void *)(a1 + 80) == 0;
    if (!v4) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char v5 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v4 + 48))(v4, &__p);
    if (__p)
    {
      unint64_t v8 = __p;
      operator delete(__p);
    }
    if (v5)
    {
      BOOL v6 = *(ice::detail::SendState **)(a1 + 80);
      if (v6) {
        ice::detail::SendState::send(v6);
      }
    }
  }
}

void sub_21C704BA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    BOOL v6 = result;
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

void sub_21C704C20(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__shared_ptr_emplace<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler,std::allocator<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC3F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler,std::allocator<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC3F8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D4AE270);
}

void std::__shared_ptr_emplace<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler,std::allocator<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler>>::__on_zero_shared(uint64_t a1)
{
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void ___ZN3ice6detail12wrapCallbackIZNS0_9SendState4sendEvE3__0vEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEOT__block_invoke(uint64_t a1, const void *a2, size_t a3)
{
  unint64_t v3 = *(uint64_t **)(a1 + 32);
  if (v3) {
    ice::detail::SendState::operator()(*v3, a2, a3);
  }
}

uint64_t __copy_helper_block_e8_32c61_ZTSNSt3__110shared_ptrIZN3ice6detail9SendState4sendEvE3__0EE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c61_ZTSNSt3__110shared_ptrIZN3ice6detail9SendState4sendEvE3__0EE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__shared_ptr_emplace<ice::detail::SendState::send(void)::$_0,std::allocator<ice::detail::SendState::send(void)::$_0>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC478;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::detail::SendState::send(void)::$_0,std::allocator<ice::detail::SendState::send(void)::$_0>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC478;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D4AE270);
}

void std::__shared_ptr_emplace<ice::detail::SendState::send(void)::$_0,std::allocator<ice::detail::SendState::send(void)::$_0>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 32);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t ___ZN3ice6detail12wrapCallbackIvEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEU13block_pointerFT_S4_jE_block_invoke(uint64_t a1)
{
  return 0;
}

void *std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(void *a1, void *a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x21D4AE270);
}

const char *ice::getMsgName(ice *this)
{
  uint64_t v1 = Ari::MsgDefById((Ari *)(this >> 26));
  __n128 result = "Unknown";
  if (v1)
  {
    uint64_t v3 = *(void *)(v1 + 48);
    if (v3) {
      return (const char *)v3;
    }
  }
  return result;
}

{
  uint64_t v1;
  const char *result;
  uint64_t v3;

  uint64_t v1 = Ari::MsgDefById(this);
  __n128 result = "Unknown";
  if (v1)
  {
    uint64_t v3 = *(void *)(v1 + 48);
    if (v3) {
      return (const char *)v3;
    }
  }
  return result;
}

uint64_t ice::isARIResponseValid(ice *this, const ice::Client *a2, const AriMsg *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t result = AriMsg::isValid(a2);
  if (result)
  {
    if (AriMsg::isValid(a2))
    {
      uint64_t v7 = *((void *)this + 5);
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (v8)
      {
        int v9 = 136315138;
        uint64_t v10 = Ari::MsgNameById(a3);
        _os_log_impl(&dword_21C702000, v7, OS_LOG_TYPE_DEFAULT, "#N Response %s is invalid", (uint8_t *)&v9, 0xCu);
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

BOOL ice::isARIResponseValid(ice *this, const AriSdk::MsgBase *a2)
{
  int v2 = (int)a2;
  unint64_t GMID = AriSdk::MsgBase::getGMID(this);
  int v4 = (GMID >> 17) & 0xFFFF8000 | (GMID << 26);
  return v4 != 67600384 && v4 == v2;
}

void ice::Client::create(NSObject **a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  if (!*a1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v27, "ice");
    BOOL v8 = std::string::append(&v27, ".", 1uLL);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    int v10 = *(char *)(a2 + 23);
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)a2;
    }
    else {
      uint64_t v11 = *(const std::string::value_type **)a2;
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      std::string::size_type v12 = *(void *)(a2 + 8);
    }
    uint64_t v13 = std::string::append(&v28, v11, v12);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    uint64_t v15 = std::string::append(&v29, ".queue", 6uLL);
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    int64_t v31 = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    if (v31 >= 0) {
      long long v17 = __p;
    }
    else {
      long long v17 = (void **)__p[0];
    }
    dispatch_queue_t v18 = dispatch_queue_create((const char *)v17, 0);
    unint64_t v19 = *a1;
    *a1 = v18;
    if (v19) {
      dispatch_release(v19);
    }
    if (SHIBYTE(v31) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v29.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
  }
  long long v20 = (std::__shared_weak_count *)operator new(0xC8uLL);
  BOOL v21 = v20;
  v20->__shared_owners_ = 0;
  v20->__shared_weak_owners_ = 0;
  v20->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC650;
  uint64_t v22 = &v20[1].__vftable;
  uint64_t v23 = *a1;
  __p[0] = *a1;
  *a1 = 0;
  v24 = (std::__shared_weak_count *)a3[1];
  *a3 = 0;
  a3[1] = 0;
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v25 = (char *)a2;
  }
  else {
    uint64_t v25 = *(char **)a2;
  }
  ice::Client::Client((uint64_t)&v20[1], (NSObject **)__p, v25);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  *uint64_t v22 = &unk_26CCFC6A0;
  if (v23) {
    dispatch_release(v23);
  }
  shared_weak_owners = (std::__shared_weak_count *)v21[1].__shared_weak_owners_;
  if (!shared_weak_owners)
  {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v21->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v21[1].__shared_owners_ = (uint64_t)v22;
    v21[1].__shared_weak_owners_ = (uint64_t)v21;
    goto LABEL_32;
  }
  if (shared_weak_owners->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v21->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v21[1].__shared_owners_ = (uint64_t)v22;
    v21[1].__shared_weak_owners_ = (uint64_t)v21;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
LABEL_32:
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  *a4 = v22;
  a4[1] = v21;
}

void sub_21C705314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void ice::Client::create(NSObject **a1@<X0>, char *a2@<X1>, std::__shared_weak_count **a3@<X8>)
{
  if (!*a1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v20, "ice");
    BOOL v6 = std::string::append(&v20, ".", 1uLL);
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v21.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    size_t v8 = strlen(a2);
    long long v9 = std::string::append(&v21, a2, v8);
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v22.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    uint64_t v11 = std::string::append(&v22, ".queue", 6uLL);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    int64_t v24 = v11->__r_.__value_.__r.__words[2];
    long long v23 = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    if (v24 >= 0) {
      uint64_t v13 = (const char *)&v23;
    }
    else {
      uint64_t v13 = (const char *)v23;
    }
    dispatch_queue_t v14 = dispatch_queue_create(v13, 0);
    uint64_t v15 = *a1;
    *a1 = v14;
    if (v15) {
      dispatch_release(v15);
    }
    if (SHIBYTE(v24) < 0) {
      operator delete((void *)v23);
    }
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
  }
  long long v16 = (std::__shared_weak_count *)operator new(0xC8uLL);
  v16->__shared_owners_ = 0;
  v16->__shared_weak_owners_ = 0;
  v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC6D8;
  long long v17 = v16 + 1;
  *(void *)&long long v23 = *a1;
  dispatch_queue_t v18 = v23;
  *a1 = 0;
  ice::Client::Client((uint64_t)&v16[1], (NSObject **)&v23, a2);
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC728;
  if (v18) {
    dispatch_release(v18);
  }
  shared_weak_owners = (std::__shared_weak_count *)v16[1].__shared_weak_owners_;
  if (!shared_weak_owners)
  {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v16[1].__shared_owners_ = (uint64_t)v17;
    v16[1].__shared_weak_owners_ = (uint64_t)v16;
    goto LABEL_21;
  }
  if (shared_weak_owners->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v16[1].__shared_owners_ = (uint64_t)v17;
    v16[1].__shared_weak_owners_ = (uint64_t)v16;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
LABEL_21:
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  *a3 = v17;
  a3[1] = v16;
}

void sub_21C7055A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ice::Client::Client(uint64_t a1, NSObject **a2, char *a3)
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v8, "com.apple.ari.client", a3);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  BOOL v6 = *a2;
  *(void *)(a1 + 24) = *a2;
  if (v6) {
    dispatch_retain(v6);
  }
  *(void *)(a1 + 32) = 0;
  ctu::OsLogLogger::OsLogLogger();
  ctu::OsLogLogger::OsLogLogger();
  MEMORY[0x21D4ADF60](v9);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v8);
  *(void *)a1 = &unk_26CCFC508;
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 48), a3);
  *(_DWORD *)(a1 + 72) = -1;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 80) = a1 + 88;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = a1 + 104;
  *(void *)(a1 + 112) = a1 + 104;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = a1 + 128;
  *(void *)(a1 + 136) = a1 + 128;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  return a1;
}

{
  if (a3[23] < 0) {
    a3 = *(char **)a3;
  }
  return ice::Client::Client(a1, a2, a3);
}

{
  if (a3[23] < 0) {
    a3 = *(char **)a3;
  }
  return ice::Client::Client(a1, a2, a3);
}

uint64_t ice::Client::getClientId(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 72);
  uint64_t v3 = *(void *)(a2 + 24);
  int v5 = v2;
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *))(*(void *)v3 + 48))(v3, &v5);
}

void ice::Client::getClientId(ice::Client *this)
{
  uint64_t v1 = operator new(0x20uLL);
  v1[1] = 0;
  v1[2] = 0;
  void *v1 = &unk_26CCFC760;
  operator new();
}

void sub_21C705958(_Unwind_Exception *a1)
{
  std::mutex::unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ice::Client::start(ice::Client *this)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v2 = (char *)this + 72;
  unsigned int v3 = *((_DWORD *)this + 18);
  if (v3 != -1)
  {
    int v4 = *((void *)this + 5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = (v3 >> 8) & 0x7F;
      _os_log_impl(&dword_21C702000, v4, OS_LOG_TYPE_DEFAULT, "#I Already registered with ARI runtime as client %d", buf, 8u);
      unsigned int v3 = *(_DWORD *)v2;
    }
    AriHost::ContinueTransactions((AriHost *)((v3 >> 8) & 0x7F));
    return;
  }
  int v5 = (AriHost **)((char *)this + 48);
  int v6 = *((char *)this + 71);
  long long v7 = (ice::Client *)((char *)this + 48);
  if (v6 < 0) {
    long long v7 = *v5;
  }
  int v8 = AriHost::RegisterClient(v7, v2, *((int **)this + 3), (dispatch_queue_s *)0xFFFFFFFFLL);
  long long v9 = *((void *)this + 5);
  if (v8)
  {
    int v10 = v8;
    if (os_log_type_enabled(*((os_log_t *)this + 5), OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = asString();
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
      _os_log_error_impl(&dword_21C702000, v9, OS_LOG_TYPE_ERROR, "Could not register ARI client: %s (%d)", buf, 0x12u);
    }
    return;
  }
  if (os_log_type_enabled(*((os_log_t *)this + 5), OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (*(_DWORD *)v2 >> 8) & 0x7F;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v11;
    _os_log_impl(&dword_21C702000, v9, OS_LOG_TYPE_DEFAULT, "#I Registered with ARI runtime as client %d", buf, 8u);
  }
  if (*((char *)this + 71) < 0)
  {
    std::string::__init_copy_ctor_external(&v38, *((const std::string::value_type **)this + 6), *((void *)this + 7));
  }
  else
  {
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = *(_OWORD *)v5;
    v38.__r_.__value_.__r.__words[2] = *((void *)this + 8);
  }
  ice::notifySnifferClientRegistered((_anonymous_namespace_ *)&v38);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  uint64_t v12 = *((void *)this + 14);
  if ((ice::Client *)v12 != (ice::Client *)((char *)this + 104))
  {
    while (1)
    {
      memset(buf, 170, 16);
      unsigned int v13 = *(_DWORD *)(v12 + 16);
      dispatch_queue_t v14 = *(const void **)(v12 + 24);
      *(_DWORD *)buf = v13;
      if (!v14) {
        break;
      }
      uint64_t v15 = _Block_copy(v14);
      long long v16 = v15;
      *(void *)&buf[8] = v15;
      if (!v15)
      {
        dispatch_queue_t v18 = 0;
LABEL_24:
        unint64_t v19 = 0;
LABEL_25:
        char v20 = 1;
        goto LABEL_26;
      }
      long long v17 = _Block_copy(v15);
      dispatch_queue_t v18 = v17;
      if (!v17) {
        goto LABEL_24;
      }
      unint64_t v19 = _Block_copy(v17);
      char v20 = 0;
LABEL_26:
      v37 = v19;
      ice::Client::regEventHandlerInternal((uint64_t)this, v13, &v37);
      if (v19) {
        _Block_release(v19);
      }
      if ((v20 & 1) == 0) {
        _Block_release(v18);
      }
      if (v16) {
        _Block_release(v16);
      }
      uint64_t v12 = *(void *)(v12 + 8);
      if ((ice::Client *)v12 == (ice::Client *)((char *)this + 104)) {
        goto LABEL_33;
      }
    }
    long long v16 = 0;
    dispatch_queue_t v18 = 0;
    unint64_t v19 = 0;
    *(void *)&buf[8] = 0;
    goto LABEL_25;
  }
LABEL_33:
  std::__list_imp<std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>>::clear((uint64_t *)this + 13);
  uint64_t v21 = *((void *)this + 17);
  if ((ice::Client *)v21 != (ice::Client *)((char *)this + 128))
  {
    while (1)
    {
      memset(buf, 170, 16);
      std::string v22 = (Ari *)*(unsigned int *)(v21 + 16);
      long long v23 = *(const void **)(v21 + 24);
      *(_DWORD *)buf = *(_DWORD *)(v21 + 16);
      if (!v23) {
        break;
      }
      int64_t v24 = _Block_copy(v23);
      uint64_t v25 = v24;
      *(void *)&buf[8] = v24;
      if (!v24)
      {
        std::string v27 = 0;
LABEL_40:
        std::string v28 = 0;
LABEL_41:
        char v29 = 1;
        goto LABEL_42;
      }
      uint64_t v26 = _Block_copy(v24);
      std::string v27 = v26;
      if (!v26) {
        goto LABEL_40;
      }
      std::string v28 = _Block_copy(v26);
      char v29 = 0;
LABEL_42:
      v36 = v28;
      ice::Client::regIndicationInternal((uint64_t)this, v22, &v36);
      if (v28) {
        _Block_release(v28);
      }
      if ((v29 & 1) == 0) {
        _Block_release(v27);
      }
      if (v25) {
        _Block_release(v25);
      }
      uint64_t v21 = *(void *)(v21 + 8);
      if ((ice::Client *)v21 == (ice::Client *)((char *)this + 128)) {
        goto LABEL_49;
      }
    }
    uint64_t v25 = 0;
    std::string v27 = 0;
    std::string v28 = 0;
    *(void *)&buf[8] = 0;
    goto LABEL_41;
  }
LABEL_49:
  std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear((uint64_t *)this + 16);
  v30 = *((void *)this + 5);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = (uint64_t)(*((void *)this + 20) - *((void *)this + 19)) >> 2;
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v31;
    _os_log_impl(&dword_21C702000, v30, OS_LOG_TYPE_DEFAULT, "#I Registering for %zu waking indications", buf, 0xCu);
  }
  v32 = (unsigned int *)*((void *)this + 19);
  v33 = (unsigned int *)*((void *)this + 20);
  if (v32 != v33)
  {
    do
      ice::Client::setIndShouldWake(this, (Ari *)*v32++, 1);
    while (v32 != v33);
    v32 = (unsigned int *)*((void *)this + 19);
  }
  *((void *)this + 20) = v32;
  std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(buf, (void *)this + 1);
  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  if (v34) {
    atomic_fetch_add_explicit(&v34->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  if (AriHost::SetRTEventHandler())
  {
    v35 = *((void *)this + 5);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C702000, v35, OS_LOG_TYPE_DEFAULT, "#N Could not register for AriHost::ARI_RT_ERROR runtime event handler", buf, 2u);
    }
  }
  if (v34)
  {
    std::__shared_weak_count::__release_weak(v34);
    std::__shared_weak_count::__release_weak(v34);
  }
}

void sub_21C705E94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,char a26)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  _Unwind_Resume(exception_object);
}

void ice::Client::regEventHandlerInternal(uint64_t a1, unsigned int a2, const void **a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 72) == -1)
  {
    int v8 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a2 > 3) {
        long long v9 = "???";
      }
      else {
        long long v9 = (&off_26441A0E8)[a2];
      }
      int buf = 136315138;
      *(void *)buf_4 = v9;
      _os_log_impl(&dword_21C702000, v8, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, deferring %s event registration until it has", (uint8_t *)&buf, 0xCu);
    }
    int v10 = *a3;
    int v11 = operator new(0x20uLL);
    *int v11 = 0;
    v11[1] = 0;
    *((_DWORD *)v11 + 4) = a2;
    if (v10) {
      uint64_t v12 = _Block_copy(v10);
    }
    else {
      uint64_t v12 = 0;
    }
    v11[3] = v12;
    uint64_t v13 = *(void *)(a1 + 104);
    *int v11 = v13;
    v11[1] = a1 + 104;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 104) = v11;
    ++*(void *)(a1 + 120);
  }
  else
  {
    int v6 = *(NSObject **)(a1 + 40);
    if (a2 < 4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (a2 > 3) {
          long long v7 = "???";
        }
        else {
          long long v7 = (&off_26441A0E8)[a2];
        }
        int buf = 136315138;
        *(void *)buf_4 = v7;
        _os_log_impl(&dword_21C702000, v6, OS_LOG_TYPE_DEFAULT, "#I Registering for event %s", (uint8_t *)&buf, 0xCu);
      }
      std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(&buf, (void *)(a1 + 8));
      dispatch_queue_t v14 = *(std::__shared_weak_count **)&buf_4[4];
      if (*(void *)&buf_4[4])
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 16), 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v15 = (void *)*a3;
      if (*a3) {
        uint64_t v15 = _Block_copy(v15);
      }
      aBlock = v15;
      int v16 = AriHost::SetRTEventHandler();
      long long v17 = *(NSObject **)(a1 + 40);
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          int buf = 67109120;
          *(_DWORD *)buf_4 = a2;
          unint64_t v19 = "#N Could not register for %u runtime event handler";
          char v20 = v17;
          uint32_t v21 = 8;
LABEL_33:
          _os_log_impl(&dword_21C702000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&buf, v21);
        }
      }
      else if (v18)
      {
        if (a2 > 3) {
          std::string v22 = "???";
        }
        else {
          std::string v22 = (&off_26441A0E8)[a2];
        }
        int buf = 136315138;
        *(void *)buf_4 = v22;
        unint64_t v19 = "#I Registered for %s successfully";
        char v20 = v17;
        uint32_t v21 = 12;
        goto LABEL_33;
      }
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v14)
      {
        std::__shared_weak_count::__release_weak(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
      return;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int buf = 136315138;
      *(void *)buf_4 = "???";
      _os_log_error_impl(&dword_21C702000, v6, OS_LOG_TYPE_ERROR, "Unhandled event: %s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void sub_21C7062DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, void *aBlock)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>::~pair(uint64_t a1)
{
  int v2 = *(const void **)(a1 + 8);
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

void ice::Client::regIndicationInternal(uint64_t a1, Ari *a2, const void **a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unsigned int v6 = a2 >> 26;
  unsigned int v7 = (a2 >> 15) & 0x3FF;
  if (*(unsigned char *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8) == 2)
  {
    if (*(_DWORD *)(a1 + 72) == -1)
    {
      long long v17 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 136315138;
        *(void *)&buf[4] = Ari::MsgNameById(a2);
        _os_log_impl(&dword_21C702000, v17, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, deferring [%s] indication registration until it has", buf, 0xCu);
      }
      BOOL v18 = *a3;
      unint64_t v19 = operator new(0x20uLL);
      void *v19 = 0;
      v19[1] = 0;
      *((_DWORD *)v19 + 4) = a2;
      if (v18) {
        char v20 = _Block_copy(v18);
      }
      else {
        char v20 = 0;
      }
      v19[3] = v20;
      uint64_t v26 = *(void *)(a1 + 128);
      void *v19 = v26;
      v19[1] = a1 + 128;
      *(void *)(v26 + 8) = v19;
      *(void *)(a1 + 128) = v19;
      ++*(void *)(a1 + 144);
    }
    else
    {
      std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(buf, (void *)(a1 + 8));
      uint64_t v9 = *(void *)buf;
      int v8 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 1174405120;
      uint64_t v31 = ___ZN3ice6Client21regIndicationInternalEjN8dispatch5blockIU13block_pointerFiPhjEEE_block_invoke;
      v32 = &__block_descriptor_tmp_6;
      uint64_t v33 = a1;
      uint64_t v34 = v9;
      v35 = v8;
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      int v37 = (int)a2;
      int v10 = (void *)*a3;
      if (*a3) {
        int v10 = _Block_copy(v10);
      }
      aBlock = v10;
      int v11 = AriHost::RegIndication();
      uint64_t v12 = *(NSObject **)(a1 + 40);
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          uint64_t v14 = Ari::MsgNameById(a2);
          *(_DWORD *)int buf = 136315650;
          *(void *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v6;
          __int16 v39 = 1024;
          unsigned int v40 = v7;
          _os_log_impl(&dword_21C702000, v12, OS_LOG_TYPE_DEFAULT, "#N Could not register indication: %s (%u, 0x%x)", buf, 0x18u);
        }
      }
      else
      {
        if (v13)
        {
          uint64_t v21 = Ari::MsgNameById(a2);
          *(_DWORD *)int buf = 136315650;
          *(void *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v6;
          __int16 v39 = 1024;
          unsigned int v40 = v7;
          _os_log_impl(&dword_21C702000, v12, OS_LOG_TYPE_DEFAULT, "#I Successfully registered for indication: %s (%u, 0x%x)", buf, 0x18u);
        }
        std::string v22 = *(uint64_t **)(a1 + 88);
        if (v22)
        {
          while (1)
          {
            while (1)
            {
              long long v23 = (uint64_t **)v22;
              unsigned int v24 = *((_DWORD *)v22 + 7);
              if (v24 <= a2) {
                break;
              }
              std::string v22 = *v23;
              uint64_t v25 = v23;
              if (!*v23) {
                goto LABEL_30;
              }
            }
            if (v24 >= a2) {
              break;
            }
            std::string v22 = v23[1];
            if (!v22)
            {
              uint64_t v25 = v23 + 1;
              goto LABEL_30;
            }
          }
        }
        else
        {
          uint64_t v25 = (uint64_t **)(a1 + 88);
          long long v23 = (uint64_t **)(a1 + 88);
LABEL_30:
          std::string v27 = (uint64_t *)operator new(0x20uLL);
          *((_DWORD *)v27 + 7) = a2;
          std::__tree<unsigned int>::__insert_node_at((uint64_t **)(a1 + 80), (uint64_t)v23, v25, v27);
        }
        if (*(char *)(a1 + 71) < 0) {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
        }
        else {
          std::string __p = *(std::string *)(a1 + 48);
        }
        ice::notifySnifferIndicationRegistered((_anonymous_namespace_ *)&__p, (uint64_t)a2);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v35) {
        std::__shared_weak_count::__release_weak(v35);
      }
      if (v8) {
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  else
  {
    uint64_t v15 = Ari::MsgNameById(a2);
    int v16 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      *(void *)&buf[4] = v15;
      _os_log_error_impl(&dword_21C702000, v16, OS_LOG_TYPE_ERROR, "%s is not an indication, not registering it", buf, 0xCu);
    }
  }
}

void sub_21C706740(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (a21) {
    std::__shared_weak_count::__release_weak(a21);
  }
  if (v22) {
    std::__shared_weak_count::__release_weak(v22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>::~pair(uint64_t a1)
{
  int v2 = *(const void **)(a1 + 8);
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

BOOL ice::Client::setIndShouldWake(ice::Client *this, Ari *a2, int a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v6 = *(unsigned __int8 *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8);
  if (v6 == 2)
  {
    if (*((_DWORD *)this + 18) == -1)
    {
      uint64_t v11 = Ari::MsgNameById(a2);
      uint64_t v12 = (char *)*((void *)this + 20);
      BOOL v13 = wmemchr(*((__int32 **)this + 19), (__int32)a2, (uint64_t)&v12[-*((void *)this + 19)] >> 2);
      if (v13) {
        uint64_t v12 = (char *)v13;
      }
      uint64_t v14 = (char *)*((void *)this + 20);
      if (a3)
      {
        if (v12 == v14)
        {
          uint64_t v15 = *((void *)this + 5);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 136315394;
            uint64_t v34 = v11;
            __int16 v35 = 1024;
            int v36 = (int)a2;
            _os_log_impl(&dword_21C702000, v15, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, deferring indication %s (0x%x) from waking until it has", buf, 0x12u);
            uint64_t v12 = (char *)*((void *)this + 20);
          }
          unint64_t v16 = *((void *)this + 21);
          if ((unint64_t)v12 >= v16)
          {
            unint64_t v19 = (char *)*((void *)this + 19);
            uint64_t v20 = (v12 - v19) >> 2;
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 62) {
              std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v22 = v16 - (void)v19;
            if (v22 >> 1 > v21) {
              unint64_t v21 = v22 >> 1;
            }
            BOOL v23 = (unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL;
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
            if (!v23) {
              unint64_t v24 = v21;
            }
            if (v24)
            {
              unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v24);
              unint64_t v19 = (char *)*((void *)this + 19);
              uint64_t v12 = (char *)*((void *)this + 20);
            }
            else
            {
              uint64_t v25 = 0;
            }
            uint64_t v26 = (_DWORD *)(v24 + 4 * v20);
            unint64_t v27 = v24 + 4 * v25;
            *uint64_t v26 = a2;
            long long v17 = v26 + 1;
            while (v12 != v19)
            {
              int v28 = *((_DWORD *)v12 - 1);
              v12 -= 4;
              *--uint64_t v26 = v28;
            }
            *((void *)this + 19) = v26;
            *((void *)this + 20) = v17;
            *((void *)this + 21) = v27;
            if (v19) {
              operator delete(v19);
            }
          }
          else
          {
            *(_DWORD *)uint64_t v12 = a2;
            long long v17 = v12 + 4;
          }
          *((void *)this + 20) = v17;
        }
      }
      else if (v12 != v14)
      {
        BOOL v18 = *((void *)this + 5);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 136315394;
          uint64_t v34 = v11;
          __int16 v35 = 1024;
          int v36 = (int)a2;
          _os_log_impl(&dword_21C702000, v18, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, removing previous wake request for %s (0x%x)", buf, 0x12u);
          uint64_t v14 = (char *)*((void *)this + 20);
        }
        if (v14 != v12 + 4) {
          memmove(v12, v12 + 4, v14 - (v12 + 4));
        }
        *((void *)this + 20) = v14 - 4;
      }
    }
    else
    {
      std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(&v29, (void *)this + 1);
      LODWORD(v30) = a2;
      *((void *)&v30 + 1) = this;
      v32 = 0;
      unsigned int v7 = (char *)operator new(0x28uLL);
      *(void *)unsigned int v7 = &unk_26CCFC7F8;
      *(_OWORD *)(v7 + 8) = v29;
      long long v29 = 0uLL;
      *(_OWORD *)(v7 + 24) = v30;
      v32 = v7;
      AriHost::SetMsgWakeable();
      std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v31);
      if (*((void *)&v29 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v29 + 1));
      }
    }
  }
  else
  {
    uint64_t v8 = Ari::MsgNameById(a2);
    uint64_t v9 = *((void *)this + 5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      uint64_t v34 = v8;
      _os_log_error_impl(&dword_21C702000, v9, OS_LOG_TYPE_ERROR, "%s is not an indication, not registering it to wake AP", buf, 0xCu);
    }
  }
  return v6 == 2;
}

void sub_21C706B2C(_Unwind_Exception *a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((uint64_t *)va);
  if (a3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a3);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ice6Client5startEv_block_invoke(void *a1)
{
  int v2 = (std::__shared_weak_count *)a1[6];
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = a1[4];
  int v4 = std::__shared_weak_count::lock(v2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  if (a1[5])
  {
    int v6 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_21C702000, v6, OS_LOG_TYPE_DEFAULT, "#I Got AriHost::ARI_RT re-init", v9, 2u);
    }
    AriHost::ReRegisterClient();
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  return v7;
}

void sub_21C706C18(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ice::Client::~Client(ice::Client *this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26CCFC508;
  uint64_t v2 = (AriHost *)*((unsigned int *)this + 18);
  if (v2 != -1)
  {
    uint64_t v3 = (char *)*((void *)this + 10);
    int v4 = (char *)this + 88;
    if (v3 != (char *)this + 88)
    {
      do
      {
        AriHost::DeregIndication((AriHost *)*((unsigned int *)v3 + 7));
        int v5 = (char *)*((void *)v3 + 1);
        if (v5)
        {
          do
          {
            int v6 = v5;
            int v5 = *(char **)v5;
          }
          while (v5);
        }
        else
        {
          do
          {
            int v6 = (char *)*((void *)v3 + 2);
            BOOL v7 = *(void *)v6 == (void)v3;
            uint64_t v3 = v6;
          }
          while (!v7);
        }
        uint64_t v3 = v6;
      }
      while (v6 != v4);
      uint64_t v2 = (AriHost *)*((unsigned int *)this + 18);
    }
    uint64_t v8 = *((void *)this + 5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 67109120;
      unsigned int v12 = (v2 >> 8) & 0x7F;
      _os_log_impl(&dword_21C702000, v8, OS_LOG_TYPE_DEFAULT, "#I Deregistering client %d", buf, 8u);
      uint64_t v2 = (AriHost *)*((unsigned int *)this + 18);
    }
    AriHost::DeregisterClient(v2);
    if (*((char *)this + 71) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)this + 6), *((void *)this + 7));
    }
    else {
      std::string __p = *(std::string *)((unsigned char *)this + 2);
    }
    ice::notifySnifferClientDeregistered((_anonymous_namespace_ *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v9 = (void *)*((void *)this + 19);
  if (v9)
  {
    *((void *)this + 20) = v9;
    operator delete(v9);
  }
  std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear((uint64_t *)this + 16);
  std::__list_imp<std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>>::clear((uint64_t *)this + 13);
  std::__tree<unsigned int>::destroy(*((void **)this + 11));
  if (*((char *)this + 71) < 0) {
    operator delete(*((void **)this + 6));
  }
  MEMORY[0x21D4ADF60]((char *)this + 40);
  ctu::SharedSynchronizable<ice::Client>::~SharedSynchronizable((void *)this + 1);
}

{
  uint64_t vars8;

  ice::Client::~Client(this);

  JUMPOUT(0x21D4AE270);
}

void sub_21C706E20(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

BOOL ice::Client::isIndication(ice::Client *this, unsigned int a2)
{
  return *(unsigned char *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8) == 2;
}

uint64_t ___ZN3ice6Client21regIndicationInternalEjN8dispatch5blockIU13block_pointerFiPhjEEE_block_invoke(uint64_t a1, ctu *a2, unsigned int a3)
{
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  int v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v4) {
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = std::__shared_weak_count::lock(v4);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  if (*(void *)(a1 + 40))
  {
    int v10 = *(NSObject **)(v7 + 40);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = *(_DWORD *)(v7 + 72);
      ctu::to_rle(a2, (const void *)a3);
      if (v18 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      *(_DWORD *)int buf = 67109634;
      *(_DWORD *)uint64_t v20 = (v13 >> 8) & 0x7F;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = a3;
      v21[0] = 2080;
      *(void *)&v21[1] = p_p;
      _os_log_debug_impl(&dword_21C702000, v10, OS_LOG_TYPE_DEBUG, "#D recv: ClientID:%d Length:%u [%s]", buf, 0x18u);
      if (v18 < 0) {
        operator delete(__p);
      }
      int v10 = *(NSObject **)(v7 + 40);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(int *)(v7 + 72);
      uint64_t v16 = Ari::MsgNameById((Ari *)*(unsigned int *)(a1 + 64));
      *(_DWORD *)int buf = 134218242;
      *(void *)uint64_t v20 = v15;
      *(_WORD *)&v20[8] = 2080;
      *(void *)unint64_t v21 = v16;
      _os_log_debug_impl(&dword_21C702000, v10, OS_LOG_TYPE_DEBUG, "#D %lu: received %s", buf, 0x16u);
    }
    uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v11 = 0;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  return v11;
}

void sub_21C707068(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(void *a1, void *a2)
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

void __destroy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(uint64_t a1)
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

BOOL ice::Client::deregIndication(ice::Client *this, Ari *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v4 = Ari::MsgNameById(a2);
  if (*(unsigned char *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8) != 2)
  {
    uint64_t v8 = *((void *)this + 5);
    BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)uint64_t v41 = 136315138;
    *(void *)&v41[4] = v4;
    uint64_t v9 = "%s is not an indication, unable to deregister";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 18) == -1)
  {
    int v10 = (char *)this + 128;
    uint64_t v11 = (char *)*((void *)this + 17);
    if (v11 != (char *)this + 128)
    {
      uint64_t v12 = *((void *)this + 17);
      while (*(_DWORD *)(v12 + 16) != a2)
      {
        uint64_t v12 = *(void *)(v12 + 8);
        if ((char *)v12 == v10) {
          goto LABEL_12;
        }
      }
      unint64_t v27 = *((void *)this + 5);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v41 = 136315138;
        *(void *)&v41[4] = v4;
        _os_log_impl(&dword_21C702000, v27, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started. Removing queued registration for [%s] indication", v41, 0xCu);
        uint64_t v11 = (char *)*((void *)this + 17);
      }
      *(void *)uint64_t v41 = v41;
      *(_OWORD *)&v41[8] = (unint64_t)v41;
      if (v11 != v10)
      {
        uint64_t v28 = 0;
        int v29 = *(_DWORD *)(v12 + 16);
        do
        {
          uint64_t v30 = *((void *)v11 + 3);
          uint64_t v31 = (char *)*((void *)v11 + 1);
          BOOL v32 = *((_DWORD *)v11 + 4) == v29 && v30 == *(void *)(v12 + 24);
          if (v32)
          {
            if (v31 == v10)
            {
              char v34 = 1;
LABEL_63:
              uint64_t v31 = (char *)this + 128;
            }
            else
            {
              while (1)
              {
                BOOL v33 = *((_DWORD *)v31 + 4) == v29 && *((void *)v31 + 3) == v30;
                char v34 = v33;
                if (!v33) {
                  break;
                }
                uint64_t v31 = (char *)*((void *)v31 + 1);
                if (v31 == v10) {
                  goto LABEL_63;
                }
              }
            }
            if (v11 != v31)
            {
              uint64_t v35 = *(void *)v31;
              if (v41 != v10)
              {
                uint64_t v36 = 1;
                if ((char *)v35 != v11)
                {
                  uint64_t v37 = v11;
                  do
                  {
                    uint64_t v37 = (char *)*((void *)v37 + 1);
                    ++v36;
                  }
                  while (v37 != (char *)v35);
                }
                *((void *)this + 18) -= v36;
                v28 += v36;
                *(void *)&v41[16] = v28;
              }
              uint64_t v38 = *(void *)v11;
              *(void *)(v38 + 8) = *(void *)(v35 + 8);
              **(void **)(v35 + 8) = v38;
              uint64_t v39 = *(void *)v41;
              *(void *)(*(void *)v41 + 8) = v11;
              *(void *)uint64_t v11 = v39;
              *(void *)uint64_t v41 = v35;
              *(void *)(v35 + 8) = v41;
            }
            if ((v34 & 1) == 0) {
              uint64_t v31 = (char *)*((void *)v31 + 1);
            }
          }
          uint64_t v11 = v31;
        }
        while (v31 != v10);
      }
      std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear((uint64_t *)v41);
      return 1;
    }
LABEL_12:
    uint64_t v8 = *((void *)this + 5);
    BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)uint64_t v41 = 136315138;
    *(void *)&v41[4] = v4;
    uint64_t v9 = "Client has not yet started. Cannot deregister [%s] indication as there has been no attempt to register it.";
LABEL_14:
    _os_log_error_impl(&dword_21C702000, v8, OS_LOG_TYPE_ERROR, v9, v41, 0xCu);
    return 0;
  }
  int v5 = AriHost::DeregIndication(a2);
  int v6 = *((void *)this + 5);
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (result)
    {
      *(_DWORD *)uint64_t v41 = 136315650;
      *(void *)&v41[4] = v4;
      *(_WORD *)&v41[12] = 1024;
      *(_DWORD *)&v41[14] = a2 >> 26;
      *(_WORD *)&v41[18] = 1024;
      *(_DWORD *)&v41[20] = (a2 >> 15) & 0x3FF;
      _os_log_impl(&dword_21C702000, v6, OS_LOG_TYPE_DEFAULT, "#I Successfully deregistered indication: %s (%u, 0x%x)", v41, 0x18u);
    }
    uint64_t v14 = (char *)this + 88;
    unsigned int v13 = (uint64_t *)*((void *)this + 11);
    if (v13)
    {
      uint64_t v15 = (char *)this + 88;
      uint64_t v16 = (char *)*((void *)this + 11);
      do
      {
        unsigned int v17 = *((_DWORD *)v16 + 7);
        BOOL v18 = v17 >= a2;
        if (v17 >= a2) {
          unint64_t v19 = (char **)v16;
        }
        else {
          unint64_t v19 = (char **)(v16 + 8);
        }
        if (v18) {
          uint64_t v15 = v16;
        }
        uint64_t v16 = *v19;
      }
      while (*v19);
      if (v15 != v14 && *((_DWORD *)v15 + 7) <= a2)
      {
        uint64_t v20 = (char *)this + 88;
        unint64_t v21 = (char *)*((void *)this + 11);
        do
        {
          unsigned int v22 = *((_DWORD *)v21 + 7);
          BOOL v23 = v22 >= a2;
          if (v22 >= a2) {
            unint64_t v24 = (char **)v21;
          }
          else {
            unint64_t v24 = (char **)(v21 + 8);
          }
          if (v23) {
            uint64_t v20 = v21;
          }
          unint64_t v21 = *v24;
        }
        while (*v24);
        if (v20 != v14 && *((_DWORD *)v20 + 7) <= a2)
        {
          uint64_t v25 = (char *)*((void *)v20 + 1);
          if (v25)
          {
            do
            {
              uint64_t v26 = v25;
              uint64_t v25 = *(char **)v25;
            }
            while (v25);
          }
          else
          {
            unsigned int v40 = v20;
            do
            {
              uint64_t v26 = (char *)*((void *)v40 + 2);
              BOOL v32 = *(void *)v26 == (void)v40;
              unsigned int v40 = v26;
            }
            while (!v32);
          }
          if (*((char **)this + 10) == v20) {
            *((void *)this + 10) = v26;
          }
          --*((void *)this + 12);
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, (uint64_t *)v20);
          operator delete(v20);
        }
      }
    }
    return 1;
  }
  if (result)
  {
    *(_DWORD *)uint64_t v41 = 136315650;
    *(void *)&v41[4] = v4;
    *(_WORD *)&v41[12] = 1024;
    *(_DWORD *)&v41[14] = a2 >> 26;
    *(_WORD *)&v41[18] = 1024;
    *(_DWORD *)&v41[20] = (a2 >> 15) & 0x3FF;
    _os_log_impl(&dword_21C702000, v6, OS_LOG_TYPE_DEFAULT, "#N Could not deregister indication: %s (%u, 0x%x)", v41, 0x18u);
    return 0;
  }
  return result;
}

const char *ice::asString(unsigned int a1)
{
  if (a1 > 3) {
    return "???";
  }
  else {
    return (&off_26441A0E8)[a1];
  }
}

uint64_t ___ZN3ice6Client23regEventHandlerInternalENS0_5EventEN8dispatch5blockIU13block_pointerFiP16dispatch_group_sEEE_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = std::__shared_weak_count::lock(v2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  if (*(void *)(a1 + 40))
  {
    int v6 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(int *)(a1 + 64);
      if (v7 > 3) {
        uint64_t v8 = "???";
      }
      else {
        uint64_t v8 = (&off_26441A0E8)[v7];
      }
      int v11 = 136315138;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21C702000, v6, OS_LOG_TYPE_DEFAULT, "#I Got %s callback", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  return v9;
}

void sub_21C7076A8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c61_ZTSN8dispatch5blockIU13block_pointerFiP16dispatch_group_sEEE(void *a1, void *a2)
{
  uint64_t v3 = a2[6];
  a1[5] = a2[5];
  a1[6] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  BOOL result = (void *)a2[7];
  if (result) {
    BOOL result = _Block_copy(result);
  }
  a1[7] = result;
  return result;
}

void __destroy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c61_ZTSN8dispatch5blockIU13block_pointerFiP16dispatch_group_sEEE(uint64_t a1)
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

void ice::Client::getRegisteredIndications(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      int v6 = v5;
      (*(void (**)(void *, void *))(*a2 + 24))(a2, v5);
    }
    else
    {
      int v6 = (void *)(*(uint64_t (**)(void *))(*v3 + 16))(v3);
    }
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    if (std::__shared_weak_count::lock(v4)) {
      operator new();
    }
  }
  std::__throw_bad_weak_ptr[abi:ne180100]();
}

void sub_21C707950(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ice::Client::stop(uint64_t this, group *a2)
{
  unsigned int v2 = *(_DWORD *)(this + 72);
  if (v2 != -1) {
    return MEMORY[0x270F90290]((v2 >> 8) & 0x7F, a2->gr_name);
  }
  return this;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
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
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *ctu::SharedSynchronizable<ice::Client>::~SharedSynchronizable(void *a1)
{
  unsigned int v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  size_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear(uint64_t *a1)
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
        size_t v5 = (uint64_t *)v3[1];
        int v6 = (const void *)v3[3];
        if (v6) {
          _Block_release(v6);
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__list_imp<std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>>::clear(uint64_t *a1)
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
        size_t v5 = (uint64_t *)v3[1];
        int v6 = (const void *)v3[3];
        if (v6) {
          _Block_release(v6);
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void *std::__function::__value_func<void ()(std::set<unsigned int>)>::~__value_func[abi:ne180100](void *a1)
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

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC650;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC650;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D4AE270);
}

uint64_t std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler::~make_shared_enabler(ice::Client *a1)
{
  ice::Client::~Client(a1);

  JUMPOUT(0x21D4AE270);
}

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC6D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC6D8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D4AE270);
}

uint64_t std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void ice::Client::create(dispatch::queue,char const*)::make_shared_enabler::~make_shared_enabler(ice::Client *a1)
{
  ice::Client::~Client(a1);

  JUMPOUT(0x21D4AE270);
}

void std::__shared_ptr_emplace<std::promise<int>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC760;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::promise<int>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCFC760;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D4AE270);
}

uint64_t std::__shared_ptr_emplace<std::promise<int>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    if ((*(unsigned char *)(result + 136) & 1) == 0)
    {
      v7[0].__vftable = 0;
      uint64_t v3 = *(void *)(result + 16);
      std::exception_ptr::~exception_ptr((std::exception_ptr *)v7);
      uint64_t result = *(void *)(a1 + 24);
      if (!v3 && *(uint64_t *)(result + 8) >= 1)
      {
        uint64_t v4 = std::future_category();
        MEMORY[0x21D4AE160](v7, 4, v4);
        exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
        int v6 = std::logic_error::logic_error(exception, v7);
        v6->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C2E0] + 16);
        v6[1] = v7[1];
        __cxa_throw(v6, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(result + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
    }
  }
  return result;
}

void sub_21C707F8C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__assoc_sub_state *a9, char a10)
{
  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
  v11.__ptr_ = (void *)(v10 - 24);
  std::__assoc_sub_state::set_exception(a9, v11);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v10 - 24));
  MEMORY[0x21D4AE170](&a10);
  JUMPOUT(0x21C707EDCLL);
}

void std::__assoc_state<int>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);

  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);

  JUMPOUT(0x21D4AE270);
}

uint64_t std::__assoc_state<int>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  exception = __cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::future_category();
  MEMORY[0x21D4AE160](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_21C708130(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::~__func(void *a1)
{
  *a1 = &unk_26CCFC7F8;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::~__func(void *a1)
{
  *a1 = &unk_26CCFC7F8;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x21D4AE270);
}

__n128 std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)uint64_t v2 = &unk_26CCFC7F8;
  *((void *)v2 + 1) = v4;
  *((void *)v2 + 2) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::__clone(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)a2 = &unk_26CCFC7F8;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(a2 + 24) = result;
  return result;
}

void std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::operator()(uint64_t a1, int *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = *a2;
  uint64_t v4 = Ari::MsgNameById((Ari *)*(unsigned int *)(a1 + 24));
  uint64_t v5 = *(void *)(a1 + 8);
  if (v3)
  {
    int v6 = *(NSObject **)(v5 + 40);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(v11.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v11.__r_.__value_.__r.__words + 4) = v4;
    uint64_t v7 = "#N Setting indication %s to wake AP failed";
    uint64_t v8 = &v11;
    goto LABEL_11;
  }
  if (*(char *)(v5 + 71) < 0) {
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(v5 + 48), *(void *)(v5 + 56));
  }
  else {
    std::string v11 = *(std::string *)(v5 + 48);
  }
  ice::notifySnifferIndicationCanWake((_anonymous_namespace_ *)&v11, *(unsigned int *)(a1 + 24));
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  int v6 = *(NSObject **)(*(void *)(a1 + 8) + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = v4;
    uint64_t v7 = "#I Successfully registered indication %s to wake AP";
    uint64_t v8 = (std::string *)&v9;
LABEL_11:
    _os_log_impl(&dword_21C702000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v8, 0xCu);
  }
}

void sub_21C708430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

uint64_t std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t *std::unique_ptr<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1},std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    MEMORY[0x21D4AE270](v2, 0x60C40A44E5E0CLL);
  }
  return a1;
}

uint64_t *dispatch::async<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>)::{lambda(void *)#1}::__invoke(void **a1)
{
  uint64_t v1 = *a1;
  unint64_t v21 = a1;
  unsigned int v22 = v1;
  uint64_t v2 = *v1;
  unint64_t v24 = 0;
  uint64_t v25 = 0;
  BOOL v23 = &v24;
  uint64_t v3 = *(void **)(v2 + 80);
  uint64_t v4 = (void *)(v2 + 88);
  if (v3 != (void *)(v2 + 88))
  {
    uint64_t v5 = 0;
    int v6 = &v24;
    while (1)
    {
      unsigned int v7 = *((_DWORD *)v3 + 7);
      uint64_t v8 = &v24;
      if (v6 == &v24) {
        break;
      }
      int v9 = v5;
      uint64_t v10 = &v24;
      if (v5)
      {
        do
        {
          uint64_t v8 = (uint64_t **)v9;
          int v9 = (uint64_t *)v9[1];
        }
        while (v9);
      }
      else
      {
        do
        {
          uint64_t v8 = (uint64_t **)v10[2];
          BOOL v11 = *v8 == (uint64_t *)v10;
          uint64_t v10 = v8;
        }
        while (v11);
      }
      if (*((_DWORD *)v8 + 7) < v7) {
        break;
      }
      uint64_t v13 = &v24;
      uint64_t v12 = &v24;
      if (!v5) {
        goto LABEL_25;
      }
      uint64_t v14 = v5;
      while (1)
      {
        while (1)
        {
          uint64_t v12 = (uint64_t **)v14;
          unsigned int v15 = *((_DWORD *)v14 + 7);
          if (v15 <= v7) {
            break;
          }
          uint64_t v14 = *v12;
          uint64_t v13 = v12;
          if (!*v12) {
            goto LABEL_25;
          }
        }
        if (v15 >= v7) {
          break;
        }
        uint64_t v14 = v12[1];
        if (!v14)
        {
          uint64_t v13 = v12 + 1;
          goto LABEL_25;
        }
      }
LABEL_28:
      unsigned int v17 = (void *)v3[1];
      if (v17)
      {
        do
        {
          BOOL v18 = v17;
          unsigned int v17 = (void *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          BOOL v18 = (void *)v3[2];
          BOOL v11 = *v18 == (void)v3;
          uint64_t v3 = v18;
        }
        while (!v11);
      }
      if (v18 == v4) {
        goto LABEL_35;
      }
      int v6 = v23;
      uint64_t v5 = v24;
      uint64_t v3 = v18;
    }
    if (v5) {
      uint64_t v12 = v8;
    }
    else {
      uint64_t v12 = &v24;
    }
    if (v5)
    {
      uint64_t v13 = v8 + 1;
    }
    else
    {
      uint64_t v8 = (uint64_t **)&v23;
      uint64_t v13 = &v24;
    }
    if (v8[1]) {
      goto LABEL_28;
    }
LABEL_25:
    uint64_t v16 = operator new(0x20uLL);
    v16[7] = v7;
    *(void *)uint64_t v16 = 0;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = v12;
    *uint64_t v13 = (uint64_t *)v16;
    if (*v23)
    {
      BOOL v23 = (uint64_t **)*v23;
      uint64_t v16 = *v13;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v24, (uint64_t *)v16);
    ++v25;
    goto LABEL_28;
  }
LABEL_35:
  uint64_t v19 = v1[4];
  if (!v19) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, uint64_t ***))(*(void *)v19 + 48))(v19, &v23);
  std::__tree<unsigned int>::destroy(v24);
  std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>::~unique_ptr[abi:ne180100]((uint64_t *)&v22);
  return std::unique_ptr<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1},std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&>>::~unique_ptr[abi:ne180100]((uint64_t *)&v21);
}

void sub_21C7087C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

uint64_t *std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::__function::__value_func<void ()(std::set<unsigned int>)>::~__value_func[abi:ne180100]((void *)(v2 + 8));
    MEMORY[0x21D4AE270](v2, 0x1060C40C8AF3C64);
  }
  return a1;
}

uint64_t ice::SendProxy::SendProxy(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3 = a2[1];
  *(void *)__n128 result = *a2;
  *(void *)(result + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  *(unsigned char *)(result + 36) = 0;
  return result;
}

{
  uint64_t v3;

  uint64_t v3 = a2[1];
  *(void *)__n128 result = *a2;
  *(void *)(result + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  *(unsigned char *)(result + 36) = 0;
  return result;
}

__n128 ice::SendProxy::SendProxy(__n128 *a1, __n128 *a2)
{
  unint64_t v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  a1[2].n128_u8[4] = a2[2].n128_u8[4];
  return result;
}

{
  unint64_t v2;
  __n128 result;

  unint64_t v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  a1[2].n128_u8[4] = a2[2].n128_u8[4];
  return result;
}

void ice::SendProxy::~SendProxy(ice::SendProxy *this)
{
  ice::SendProxy::send((uint64_t *)this);
  unint64_t v2 = (const void *)*((void *)this + 3);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t *ice::SendProxy::send(uint64_t *this)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v1 = *this;
  if (*this)
  {
    uint64_t v2 = (uint64_t)this;
    if (*((_DWORD *)this + 8) == -1)
    {
      uint64_t v14 = *(NSObject **)(v1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v51 = (void *)(v1 + 48);
        if (*(char *)(v1 + 71) < 0) {
          v51 = (void *)*v51;
        }
        *(_DWORD *)int buf = 136315138;
        *(void *)&uint8_t buf[4] = v51;
        _os_log_error_impl(&dword_21C702000, v14, OS_LOG_TYPE_ERROR, "Client %s has not yet registered with ARI host runtime", buf, 0xCu);
      }
      int Gmid = AriMsg::getGmid(*(AriMsg **)(v2 + 16));
      uint64_t v17 = *(void *)v2;
      uint64_t v16 = *(void *)(v2 + 8);
      if (v16) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
      }
      BOOL v18 = *(const void **)(v2 + 24);
      if (v18)
      {
        uint64_t v19 = _Block_copy(v18);
      }
      int v31 = -1;
    }
    else
    {
      uint64_t v3 = (std::__shared_weak_count *)this[1];
      uint64_t v4 = (AriMsg *)this[2];
      if (v3) {
        atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v5 = (Ari *)(AriMsg::getGmid(v4) >> 26);
      unsigned int v6 = (AriMsg::getGmid(v4) >> 15) & 0x3FF;
      uint64_t v7 = Ari::MsgDefById(v5);
      uint64_t v8 = v7;
      if (v7)
      {
        int v9 = *(_DWORD **)(v7 + 24);
        if (*v9)
        {
          uint64_t v10 = (const char **)(v9 + 8);
          while (strcmp(*(v10 - 1), "nInstance_t1"))
          {
            int v11 = *(_DWORD *)v10;
            v10 += 4;
            if (!v11) {
              goto LABEL_10;
            }
          }
          int v35 = v34;
          int v13 = 0;
          if (v34 != -77 && v34)
          {
            uint64_t v36 = *(NSObject **)(v1 + 40);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = *(void *)(v8 + 48);
              *(_DWORD *)int buf = 136316162;
              *(void *)&uint8_t buf[4] = v37;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v5;
              __int16 v58 = 1024;
              *(_DWORD *)v59 = v6;
              *(_WORD *)&v59[4] = 2080;
              *(void *)&v59[6] = asString();
              __int16 v60 = 1024;
              int v61 = v35;
              _os_log_impl(&dword_21C702000, v36, OS_LOG_TYPE_DEFAULT, "#N Could not pack SIM instance parameter in request %s (%u, 0x%x) result %s (%d)", buf, 0x28u);
            }
            int v13 = v35;
          }
        }
        else
        {
LABEL_10:
          uint64_t v12 = *(NSObject **)(v1 + 40);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v5;
            _os_log_debug_impl(&dword_21C702000, v12, OS_LOG_TYPE_DEBUG, "#D Not packing SIM instance TLV for request 0x%x", buf, 8u);
          }
          int v13 = 0;
        }
      }
      else
      {
        uint64_t v20 = *(NSObject **)(v1 + 40);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v5;
          _os_log_impl(&dword_21C702000, v20, OS_LOG_TYPE_DEFAULT, "#N Could not get message definition for packing SIM instance for gid 0x%x", buf, 8u);
        }
        int v13 = -71;
      }
      if (v3) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      }
      unint64_t v21 = *(AriMsg **)(v2 + 16);
      if (!v13)
      {
        int v25 = *((_DWORD *)v21 + 17);
        if (!v25)
        {
          unint64_t v56 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v39 = *(void *)v2;
          uint64_t v38 = *(std::__shared_weak_count **)(v2 + 8);
          if (v38) {
            atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          unsigned int v40 = *(const void **)(v2 + 24);
          if (v40) {
            uint64_t v41 = _Block_copy(v40);
          }
          else {
            uint64_t v41 = 0;
          }
          *(void *)int buf = v41;
          if (v41) {
            _Block_release(v41);
          }
          if (v38) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v38);
          }
          int v42 = AriHost::Send();
          if (v42)
          {
            v43 = (Ari *)AriMsg::getGmid(*(AriMsg **)(v2 + 16));
            uint64_t v44 = *(void *)v2;
            v45 = *(NSObject **)(*(void *)v2 + 40);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              uint64_t v52 = Ari::MsgNameById(v43);
              int v53 = *(_DWORD *)(v2 + 32);
              uint64_t v54 = asString();
              *(_DWORD *)int buf = 136316162;
              *(void *)&uint8_t buf[4] = v52;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v43;
              __int16 v58 = 1024;
              *(_DWORD *)v59 = v53;
              *(_WORD *)&v59[4] = 2080;
              *(void *)&v59[6] = v54;
              __int16 v60 = 1024;
              int v61 = v42;
              _os_log_error_impl(&dword_21C702000, v45, OS_LOG_TYPE_ERROR, "Cannot send request %s (0x%x) for client %d: %s (%d)", buf, 0x28u);
              uint64_t v44 = *(void *)v2;
            }
            uint64_t v46 = *(void *)(v2 + 8);
            if (v46) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v46 + 8), 1uLL, memory_order_relaxed);
            }
            v47 = *(const void **)(v2 + 24);
            if (v47)
            {
              v48 = _Block_copy(v47);
            }
          }
          v49 = *(AriMsg **)(v2 + 16);
          LODWORD(__sz[0]) = 0;
          memset(buf, 170, 16);
          uint64_t EncodedBuf = AriMsg::getEncodedBuf(v49, (unsigned int *)__sz);
          std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,void (*)(unsigned char *),void>(buf, EncodedBuf);
        }
        int v26 = AriMsg::getGmid(v21);
        uint64_t v28 = *(void *)v2;
        uint64_t v27 = *(void *)(v2 + 8);
        if (v27) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v27 + 8), 1uLL, memory_order_relaxed);
        }
        int v29 = *(const void **)(v2 + 24);
        if (v29)
        {
          uint64_t v30 = _Block_copy(v29);
        }
        int v31 = v25;
        int v32 = v26;
        int v33 = v28;
LABEL_36:
      }
      int Gmid = AriMsg::getGmid(v21);
      uint64_t v17 = *(void *)v2;
      uint64_t v22 = *(void *)(v2 + 8);
      if (v22) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
      }
      BOOL v23 = *(const void **)(v2 + 24);
      if (v23)
      {
        unint64_t v24 = _Block_copy(v23);
      }
      int v31 = v13;
    }
    int v32 = Gmid;
    int v33 = v17;
    goto LABEL_36;
  }
  return this;
}

void sub_21C709010(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  if (v18) {
    _Block_release(v18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ice::SendProxy::transaction(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

uint64_t ice::SendProxy::callback(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  uint64_t v4 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = v3;
  if (v4) {
    _Block_release(v4);
  }
  return a1;
}

{
  uint64_t v3;
  const void *v4;

  uint64_t v3 = *a2;
  *a2 = 0;
  uint64_t v4 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = v3;
  if (v4) {
    _Block_release(v4);
  }
  return a1;
}

uint64_t ice::SendProxy::ackRequired(uint64_t result, char a2)
{
  *(unsigned char *)(result + 36) = a2;
  return result;
}

{
  *(unsigned char *)(result + 36) = a2;
  return result;
}

uint64_t ice::SendProxy::getLogger(ice::SendProxy *this)
{
  return *(void *)this + 40;
}

void anonymous namespace'::callbackWithFailure(int a1, int a2, int a3, void *aBlock)
{
  if (aBlock) {
    _Block_copy(aBlock);
  }
  operator new();
}

uint64_t ice::SendMsgBaseProxy::SendMsgBaseProxy(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3 = a2[1];
  *(void *)__n128 result = *a2;
  *(void *)(result + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  return result;
}

{
  uint64_t v3;

  uint64_t v3 = a2[1];
  *(void *)__n128 result = *a2;
  *(void *)(result + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  return result;
}

__n128 ice::SendMsgBaseProxy::SendMsgBaseProxy(__n128 *a1, __n128 *a2)
{
  unint64_t v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  return result;
}

{
  unint64_t v2;
  __n128 result;

  unint64_t v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  return result;
}

void ice::SendMsgBaseProxy::~SendMsgBaseProxy(std::__shared_weak_count **this)
{
  ice::SendMsgBaseProxy::send((ice::SendMsgBaseProxy *)this);
  unint64_t v2 = this[3];
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = this[1];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void ice::SendMsgBaseProxy::send(ice::SendMsgBaseProxy *this)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(AriSdk::MsgBase **)this;
  if (!*(void *)this) {
    return;
  }
  if (*((_DWORD *)this + 8) == -1)
  {
    unsigned int v6 = *((void *)v1 + 5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = (void *)((char *)v1 + 48);
      if (*((char *)v1 + 71) < 0) {
        uint64_t v28 = (void *)*v28;
      }
      *(_DWORD *)int buf = 136315138;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_21C702000, v6, OS_LOG_TYPE_ERROR, "Client %s has not yet registered with ARI host runtime", buf, 0xCu);
    }
    unint64_t GMID = AriSdk::MsgBase::getGMID(*((AriSdk::MsgBase **)this + 2));
    int v8 = (GMID >> 17) & 0xFFFF8000 | (GMID << 26);
    uint64_t v10 = *(AriSdk::MsgBase **)this;
    uint64_t v9 = *((void *)this + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    int v11 = (const void *)*((void *)this + 3);
    if (v11)
    {
      uint64_t v12 = _Block_copy(v11);
    }
  }
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = (const void *)*((void *)this + 3);
  if (v4) {
    uint64_t v5 = _Block_copy(v4);
  }
  else {
    uint64_t v5 = 0;
  }
  *(void *)int buf = v5;
  if (v5) {
    _Block_release(v5);
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  int v13 = (const void *)v37;
  int v14 = AriSdk::MsgBase::send();
  if (v14)
  {
    unint64_t v15 = AriSdk::MsgBase::getGMID(*((AriSdk::MsgBase **)this + 2));
    uint64_t v16 = (Ari *)((v15 >> 17) & 0xFFFF8000 | (v15 << 26));
    uint64_t v17 = *(AriSdk::MsgBase **)this;
    BOOL v18 = *(NSObject **)(*(void *)this + 40);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = Ari::MsgNameById(v16);
      int v26 = *((_DWORD *)this + 8);
      uint64_t v27 = asString();
      *(_DWORD *)int buf = 136316162;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v16;
      __int16 v39 = 1024;
      *(_DWORD *)unsigned int v40 = v26;
      *(_WORD *)&v40[4] = 2080;
      *(void *)&v40[6] = v27;
      __int16 v41 = 1024;
      int v42 = v14;
      _os_log_error_impl(&dword_21C702000, v18, OS_LOG_TYPE_ERROR, "Cannot send request %s (0x%x) for client %d: %s (%d)", buf, 0x28u);
      uint64_t v17 = *(AriSdk::MsgBase **)this;
    }
    uint64_t v19 = *((void *)this + 1);
    if (v19) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v20 = (const void *)*((void *)this + 3);
    if (v20)
    {
      unint64_t v21 = _Block_copy(v20);
    }
  }
  *(void *)int buf = 0;
  *(void *)&buf[8] = 0;
  AriSdk::MsgBase::getRawBytes();
  int v35 = 0;
  uint64_t v36 = 0;
  std::string __p = 0;
  if (*(void *)buf) {
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, **(const void ***)buf, *(void *)(*(void *)buf + 8), *(void *)(*(void *)buf + 8) - **(void **)buf);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  uint64_t v22 = *(NSObject **)(*(void *)this + 40);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  unint64_t v24 = __p;
  if (v23)
  {
    unsigned int v29 = *((_DWORD *)this + 8);
    int64_t v30 = v35 - (unsigned char *)__p;
    ctu::to_rle((ctu *)__p, (const void *)(v35 - (unsigned char *)__p));
    if (v33 >= 0) {
      int v31 = &v32;
    }
    else {
      int v31 = v32;
    }
    *(_DWORD *)int buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = (v29 >> 8) & 0x7F;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = v30;
    __int16 v39 = 2080;
    *(void *)unsigned int v40 = v31;
    _os_log_debug_impl(&dword_21C702000, v22, OS_LOG_TYPE_DEBUG, "#D send: ClientID:%d Length:%zu [%s]", buf, 0x1Cu);
    if (v33 < 0) {
      operator delete(v32);
    }
    unint64_t v24 = __p;
    if (!__p) {
      goto LABEL_32;
    }
  }
  else if (!__p)
  {
    goto LABEL_32;
  }
  int v35 = v24;
  operator delete(v24);
LABEL_32:
  if (v13) {
    _Block_release(v13);
  }
}

void sub_21C70972C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t ice::SendMsgBaseProxy::transaction(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

uint64_t ice::SendMsgBaseProxy::callback(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  uint64_t v4 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = v3;
  if (v4) {
    _Block_release(v4);
  }
  return a1;
}

{
  uint64_t v3;
  const void *v4;

  uint64_t v3 = *a2;
  *a2 = 0;
  uint64_t v4 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = v3;
  if (v4) {
    _Block_release(v4);
  }
  return a1;
}

uint64_t ice::SendMsgBaseProxy::getLogger(ice::SendMsgBaseProxy *this)
{
  return *(void *)this + 40;
}

uint64_t *std::unique_ptr<anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0,std::default_delete<anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(const void **)(v2 + 8);
    if (v3) {
      _Block_release(v3);
    }
    MEMORY[0x21D4AE270](v2, 0x1080C4057E67DB5);
  }
  return a1;
}

void dispatch::async<anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0>(dispatch_queue_s *,std::unique_ptr<anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0,std::default_delete<anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0>>)::{lambda(void *)#1}::__invoke(int32x2_t *a1)
{
  uint64_t v3 = a1;
  int32x2_t v8 = vrev64_s32(*a1);
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[2] = v1;
  v6[3] = v1;
  v6[0] = v1;
  v6[1] = v1;
  MEMORY[0x21D4ADFE0](v6, 67600384);
  AriMsg::packParam((AriMsg *)v6, 1, &v8);
  unsigned int v5 = 0;
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t EncodedBuf = AriMsg::getEncodedBuf((AriMsg *)v6, &v5);
  std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,void (*)(unsigned char *),void>(v4, EncodedBuf);
}

void sub_21C709970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, char a13)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  AriMsg::~AriMsg((AriMsg *)&a13);
  _Unwind_Resume(a1);
}

void std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,void (*)(unsigned char *),void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_21C709A24(void *a1)
{
  __cxa_begin_catch(a1);
  AriMsg::ReleaseEncodedMessage(v1, v2);
  __cxa_rethrow();
}

void sub_21C709A38(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<unsigned char *,void (*)(unsigned char *),std::allocator<unsigned char>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D4AE270);
}

uint64_t std::__shared_ptr_pointer<unsigned char *,void (*)(unsigned char *),std::allocator<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<unsigned char *,void (*)(unsigned char *),std::allocator<unsigned char>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 32;
  else {
    return 0;
  }
}

void anonymous namespace'::wrapSendCallback(void **a1, uint64_t a2, std::__shared_weak_count *a3, void **a4, int a5)
{
  if (a3) {
    atomic_fetch_add_explicit(&a3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  *a1 = (void *)0xAAAAAAAAAAAAAAAALL;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1174405120;
  v8[2] = ___ZN12_GLOBAL__N_116wrapSendCallbackENSt3__110shared_ptrIN3ice6ClientEEEN8dispatch5blockIU13block_pointerFiPhjEEEi_block_invoke;
  v8[3] = &__block_descriptor_tmp_1;
  v8[4] = a2;
  uint64_t v9 = a3;
  if (a3) {
    atomic_fetch_add_explicit(&a3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v11 = a5;
  unint64_t v7 = *a4;
  if (*a4) {
    unint64_t v7 = _Block_copy(v7);
  }
  aBlock = v7;
  *a1 = _Block_copy(v8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  if (a3) {
    std::__shared_weak_count::__release_weak(a3);
  }
}

uint64_t ___ZN12_GLOBAL__N_116wrapSendCallbackENSt3__110shared_ptrIN3ice6ClientEEEN8dispatch5blockIU13block_pointerFiPhjEEEi_block_invoke(uint64_t a1, ctu *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (v4)
  {
    unint64_t v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      int32x2_t v8 = v7;
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v9)
      {
LABEL_27:
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        return 0;
      }
      uint64_t v10 = *(NSObject **)(v9 + 40);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v23 = *(_DWORD *)(a1 + 56);
        ctu::to_rle(a2, (const void *)a3);
        unint64_t v24 = v34[3] >= 0 ? buf : *(unsigned char **)buf;
        *(_DWORD *)unint64_t v37 = 67109634;
        *(_DWORD *)&v37[4] = (v23 >> 8) & 0x7F;
        *(_WORD *)&v37[8] = 1024;
        *(_DWORD *)&v37[10] = a3;
        *(_WORD *)&v37[14] = 2080;
        *(void *)&long long v38 = v24;
        _os_log_debug_impl(&dword_21C702000, v10, OS_LOG_TYPE_DEBUG, "#D recv: ClientID:%d Length:%u [%s]", v37, 0x18u);
        if ((v34[3] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
      }
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      int v11 = *(const void **)(a1 + 48);
      if (v11) {
        uint64_t v12 = _Block_copy(v11);
      }
      else {
        uint64_t v12 = 0;
      }
      unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v39 = v13;
      long long v40 = v13;
      *(_OWORD *)unint64_t v37 = v13;
      long long v38 = v13;
      MEMORY[0x21D4ADFD0](v37, a2, a3);
      int v14 = HIDWORD(v41);
      if (HIDWORD(v41))
      {
        Bufint Gmid = AriMsg::GetBufGmid(a2, (const unsigned __int8 *)a3);
        uint64_t v16 = *(NSObject **)(v9 + 40);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = asString();
          *(_DWORD *)int buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = BufGmid >> 26;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = (BufGmid >> 15) & 0x3FF;
          *(_WORD *)char v33 = 1024;
          *(_DWORD *)&v33[2] = v14;
          *(_WORD *)int v34 = 2080;
          *(void *)&v34[2] = v17;
          _os_log_impl(&dword_21C702000, v16, OS_LOG_TYPE_DEFAULT, "#N Could not construct response (%u, 0x%x) error=%d (%s)", buf, 0x1Eu);
        }
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        if (v12)
        {
          BOOL v18 = _Block_copy(v12);
        }
      }
      if (!AriMsg::isValid((AriMsg *)v37))
      {
        unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
        if (AriMsg::unparam((AriMsg *)v37, 1, &v31))
        {
          uint64_t v19 = *(NSObject **)(v9 + 40);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int buf = 0;
            uint64_t v20 = "#N Got NACK from baseband without status TLV";
            unint64_t v21 = v19;
            uint32_t v22 = 2;
LABEL_25:
            _os_log_impl(&dword_21C702000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
          }
        }
        else
        {
          uint64_t v25 = (Ari *)v31;
          int v26 = *(NSObject **)(v9 + 40);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = Ari::MsgNameById(v25);
            int v28 = HIDWORD(v31);
            uint64_t v29 = asString();
            *(_DWORD *)int buf = 136316162;
            *(void *)&uint8_t buf[4] = v27;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)char v33 = v25 >> 26;
            *(_WORD *)&v33[4] = 1024;
            *(_DWORD *)int v34 = (v25 >> 15) & 0x3FF;
            *(_WORD *)&v34[4] = 1024;
            *(_DWORD *)&v34[6] = v28;
            __int16 v35 = 2080;
            uint64_t v36 = v29;
            uint64_t v20 = "#N Got NACK for %s (%u, 0x%x) error=%d error description: %s";
            unint64_t v21 = v26;
            uint32_t v22 = 40;
            goto LABEL_25;
          }
        }
      }
      (*((void (**)(void *, ctu *, uint64_t))v12 + 2))(v12, a2, a3);
      AriMsg::~AriMsg((AriMsg *)v37);
      _Block_release(v12);
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      goto LABEL_27;
    }
  }
  return 0;
}

void sub_21C709F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  AriMsg::~AriMsg((AriMsg *)va);
  if (v10) {
    _Block_release(v10);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE48c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(void *a1, void *a2)
{
  uint64_t v3 = a2[5];
  a1[4] = a2[4];
  a1[5] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  __n128 result = (void *)a2[6];
  if (result) {
    __n128 result = _Block_copy(result);
  }
  a1[6] = result;
  return result;
}

void __destroy_helper_block_e8_32c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE48c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(uint64_t a1)
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

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    unsigned int v6 = result;
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

void sub_21C70A100(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t asString()
{
  return MEMORY[0x270F8CB48]();
}

uint64_t Ari::MsgDefById(Ari *this)
{
  return MEMORY[0x270F8CCE0](this);
}

uint64_t Ari::MsgNameById(Ari *this)
{
  return MEMORY[0x270F8CCE8](this);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x270F972B0]();
}

{
  return MEMORY[0x270F972B8]();
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::to_rle(ctu *this, const void *a2)
{
  return MEMORY[0x270F976E0](this, a2);
}

uint64_t AriMsg::GetBufGmid(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD58](this, a2);
}

uint64_t AriMsg::ReleaseEncodedMessage(AriMsg *this, unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD68](this, a2);
}

uint64_t AriMsg::packParam(AriMsg *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x270F8CD98](this, a2, a3);
}

void AriMsg::AriMsg(AriMsg *this, const unsigned __int8 *a2)
{
}

void AriMsg::AriMsg(AriMsg *this)
{
}

void AriMsg::~AriMsg(AriMsg *this)
{
}

uint64_t AriSdk::MsgBase::getRawBytes()
{
  return MEMORY[0x270F90240]();
}

uint64_t AriSdk::MsgBase::send()
{
  return MEMORY[0x270F90248]();
}

uint64_t AriHost::RegIndication()
{
  return MEMORY[0x270F90258]();
}

uint64_t AriHost::RegisterClient(AriHost *this, const char *a2, int *a3, dispatch_queue_s *a4)
{
  return MEMORY[0x270F90260](this, a2, a3, a4);
}

uint64_t AriHost::SetMsgWakeable()
{
  return MEMORY[0x270F90270]();
}

uint64_t AriHost::DeregIndication(AriHost *this)
{
  return MEMORY[0x270F90278](this);
}

uint64_t AriHost::DeregisterClient(AriHost *this)
{
  return MEMORY[0x270F90280](this);
}

uint64_t AriHost::ReRegisterClient()
{
  return MEMORY[0x270F90288]();
}

uint64_t AriHost::SetRTEventHandler()
{
  return MEMORY[0x270F90298]();
}

uint64_t AriHost::ContinueTransactions(AriHost *this)
{
  return MEMORY[0x270F902A0](this);
}

uint64_t AriHost::Send()
{
  return MEMORY[0x270F902B8]();
}

uint64_t AriMsg::getEncodedBuf(AriMsg *this, unsigned int *a2)
{
  return MEMORY[0x270F902D0](this, a2);
}

uint64_t AriMsg::getGmid(AriMsg *this)
{
  return MEMORY[0x270F902D8](this);
}

uint64_t AriMsg::isValid(AriMsg *this)
{
  return MEMORY[0x270F902E0](this);
}

uint64_t AriMsg::unparam(AriMsg *this, uint64_t a2, void *a3)
{
  return MEMORY[0x270F902E8](this, a2, a3);
}

uint64_t AriSdk::MsgBase::getGMID(AriSdk::MsgBase *this)
{
  return MEMORY[0x270F903E8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98340](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x270F98E98]();
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

void operator new()
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}
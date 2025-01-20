void sub_23C9AAFA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_23C9ABA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_23C9ABF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_23C9AC1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23C9AC310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_23C9AC3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23C9AD1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51)
{
  std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&a47, (void *)a48);
  std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&a50, (void *)a51);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __clang_call_terminate(void *a1)
{
}

void std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<Espresso::blob<float,2>>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<Espresso::blob<float,2>>>,0>(uint64_t a1)
{
  v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    v3 = *(void **)a1;
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

void *std::allocate_shared[abi:ne180100]<Espresso::blob<float,2>,std::allocator<Espresso::blob<float,2>>,int &,int &,int &,int &,void>@<X0>(int *a1@<X1>, int *a2@<X2>, int *a3@<X3>, int *a4@<X4>, void *a5@<X8>)
{
  v10 = operator new(0x58uLL);
  result = std::__shared_ptr_emplace<Espresso::blob<float,2>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,2>>,0>(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_23C9AD704(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<Espresso::blob<float,2>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,2>>,0>(void *a1, int *a2, int *a3, int *a4, int *a5)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26F09DCF8;
  std::allocator<Espresso::blob<float,2>>::construct[abi:ne180100]<Espresso::blob<float,2>,int &,int &,int &,int &>((uint64_t)&v7, (uint64_t)(a1 + 3), a2, a3, a4, a5);
  return a1;
}

void sub_23C9AD780(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<Espresso::blob<float,2>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F09DCF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Espresso::blob<float,2>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F09DCF8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x23ECEAF60);
}

uint64_t std::__shared_ptr_emplace<Espresso::blob<float,2>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t std::allocator<Espresso::blob<float,2>>::construct[abi:ne180100]<Espresso::blob<float,2>,int &,int &,int &,int &>(uint64_t a1, uint64_t a2, int *a3, int *a4, int *a5, int *a6)
{
  int v7 = *a3;
  int v8 = *a4;
  uint64_t v9 = *a5;
  uint64_t v10 = *a6;
  *(void *)a2 = &unk_26F09DD48;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_DWORD *)(a2 + 8) = v7;
  *(_DWORD *)(a2 + 12) = v8;
  uint64_t result = Espresso::kern_alloc((Espresso *)(4 * v7 * (uint64_t)v8 * v9 * v10));
  *(void *)(a2 + 16) = result;
  *(unsigned char *)(a2 + 24) = 1;
  return result;
}

void sub_23C9AD8A8(_Unwind_Exception *a1)
{
  v3 = (std::__shared_weak_count *)*((void *)v1 + 7);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  v4 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  Espresso::blob_rtti_root::~blob_rtti_root(v1);
  _Unwind_Resume(a1);
}

void Espresso::blob<float,2>::~blob(Espresso::blob_rtti_root *this, void *a2)
{
  *(void *)this = &unk_26F09DD48;
  if (*((unsigned char *)this + 24))
  {
    v3 = (Espresso *)*((void *)this + 2);
    if (v3) {
      Espresso::kern_dealloc(v3, a2);
    }
  }
  *((void *)this + 2) = 0;
  v4 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  v5 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  Espresso::blob_rtti_root::~blob_rtti_root(this);
}

{
  Espresso *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t vars8;

  *(void *)this = &unk_26F09DD48;
  if (*((unsigned char *)this + 24))
  {
    v3 = (Espresso *)*((void *)this + 2);
    if (v3) {
      Espresso::kern_dealloc(v3, a2);
    }
  }
  *((void *)this + 2) = 0;
  v4 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  v5 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  Espresso::blob_rtti_root::~blob_rtti_root(this);

  JUMPOUT(0x23ECEAF60);
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
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264E79C90, MEMORY[0x263F8C060]);
}

void sub_23C9ADB04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

_OWORD *std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  v6 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x48uLL);
    v12[1] = a1 + 1;
    uint64_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *uint64_t v9 = 0;
    *((void *)v7 + 7) = 0;
    *((void *)v7 + 8) = 0;
    char v13 = 1;
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    v6 = a2;
  }
  else {
    v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            v2 = (uint64_t *)*v3;
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
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

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<Espresso::blob<float,2>>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void *std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>@<X0>(int *a1@<X1>, int *a2@<X2>, int *a3@<X3>, int *a4@<X4>, void *a5@<X8>)
{
  int v10 = operator new(0x58uLL);
  uint64_t result = std::__shared_ptr_emplace<Espresso::blob<float,1>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,1>>,0>(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_23C9ADFCC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<Espresso::blob<float,1>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,1>>,0>(void *a1, int *a2, int *a3, int *a4, int *a5)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26F09DD80;
  std::allocator<Espresso::blob<float,1>>::construct[abi:ne180100]<Espresso::blob<float,1>,int &,int &,int &,int &>((uint64_t)&v7, (uint64_t)(a1 + 3), a2, a3, a4, a5);
  return a1;
}

void sub_23C9AE048(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<Espresso::blob<float,1>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F09DD80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Espresso::blob<float,1>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F09DD80;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x23ECEAF60);
}

uint64_t std::__shared_ptr_emplace<Espresso::blob<float,1>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t std::allocator<Espresso::blob<float,1>>::construct[abi:ne180100]<Espresso::blob<float,1>,int &,int &,int &,int &>(uint64_t a1, uint64_t a2, int *a3, int *a4, int *a5, int *a6)
{
  int v7 = *a3;
  int v8 = *a4;
  uint64_t v9 = *a5;
  uint64_t v10 = *a6;
  *(void *)a2 = &unk_26F09DDD0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_DWORD *)(a2 + 8) = v7;
  uint64_t result = Espresso::kern_alloc((Espresso *)(4 * v7 * (uint64_t)v8 * v9 * v10));
  *(void *)(a2 + 16) = result;
  *(unsigned char *)(a2 + 24) = 1;
  return result;
}

void sub_23C9AE170(_Unwind_Exception *a1)
{
  int v3 = (std::__shared_weak_count *)*((void *)v1 + 7);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  int v4 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  Espresso::blob_rtti_root::~blob_rtti_root(v1);
  _Unwind_Resume(a1);
}

void Espresso::blob<float,1>::~blob(Espresso::blob_rtti_root *this, void *a2)
{
  *(void *)this = &unk_26F09DDD0;
  if (*((unsigned char *)this + 24))
  {
    int v3 = (Espresso *)*((void *)this + 2);
    if (v3) {
      Espresso::kern_dealloc(v3, a2);
    }
  }
  *((void *)this + 2) = 0;
  int v4 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  size_t v5 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  Espresso::blob_rtti_root::~blob_rtti_root(this);
}

{
  Espresso *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t vars8;

  *(void *)this = &unk_26F09DDD0;
  if (*((unsigned char *)this + 24))
  {
    int v3 = (Espresso *)*((void *)this + 2);
    if (v3) {
      Espresso::kern_dealloc(v3, a2);
    }
  }
  *((void *)this + 2) = 0;
  int v4 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  size_t v5 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  Espresso::blob_rtti_root::~blob_rtti_root(this);

  JUMPOUT(0x23ECEAF60);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_23C9AFF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23C9B0550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_23C9B0770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23C9B07D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23C9B081C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t Espresso::kern_alloc(Espresso *this)
{
  return MEMORY[0x270F279C0](this);
}

uint64_t Espresso::kern_dealloc(Espresso *this, void *a2)
{
  return MEMORY[0x270F279C8](this, a2);
}

void Espresso::blob_rtti_root::~blob_rtti_root(Espresso::blob_rtti_root *this)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}
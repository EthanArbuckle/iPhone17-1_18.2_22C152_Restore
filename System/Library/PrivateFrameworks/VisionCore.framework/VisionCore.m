void sub_22B18CB78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id VisionCoreFrameworkBundle()
{
  if (VisionCoreFrameworkBundle_onceToken != -1) {
    dispatch_once(&VisionCoreFrameworkBundle_onceToken, &__block_literal_global_1004);
  }
  v0 = (void *)VisionCoreFrameworkBundle_bundle;
  return v0;
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

uint64_t VisionCoreHasANE()
{
  if (VisionCoreHasANE::once_token != -1) {
    dispatch_once(&VisionCoreHasANE::once_token, &__block_literal_global_111);
  }
  return VisionCoreHasANE::hasANESupport;
}

void sub_22B18D370(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_22B18D388(_Unwind_Exception *a1)
{
}

BOOL _classImplementsSelector(objc_class *a1, const char *a2)
{
  unsigned int outCount = 0;
  v3 = class_copyMethodList(a1, &outCount);
  if (!v3) {
    return 0;
  }
  size_t v4 = v3;
  if (outCount)
  {
    uint64_t v5 = 0;
    while (1)
    {
      SEL Name = method_getName(v4[v5]);
      BOOL v7 = Name == a2;
      if (Name == a2) {
        break;
      }
      if (++v5 >= (unint64_t)outCount) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    BOOL v7 = 0;
  }
  free(v4);
  return v7;
}

void sub_22B18D58C(void *a1)
{
  objc_begin_catch(a1);
  free(v1);
  objc_exception_rethrow();
}

void sub_22B18D5A0(_Unwind_Exception *a1)
{
}

void sub_22B18DC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B18E114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37)
{
  _Unwind_Resume(a1);
}

uint64_t __VisionCoreHasANE_block_invoke()
{
  uint64_t result = MGIsQuestionValid();
  if (result)
  {
    uint64_t result = MGGetBoolAnswer();
    VisionCoreHasANE::hasANESupport = result;
  }
  return result;
}

uint64_t __VisionCoreFrameworkBundle_block_invoke()
{
  VisionCoreFrameworkBundle_bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.VisionCore"];
  return MEMORY[0x270F9A758]();
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
  MEMORY[0x230F41340](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_22B18E6BC(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x230F413B0](v1);
  _Unwind_Resume(a1);
}

void sub_22B18ECD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

double VisionCoreBoundingBoxForQuadrilateralPoints(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a7 >= a5) {
    double v7 = a5;
  }
  else {
    double v7 = a7;
  }
  if (a1 >= a3) {
    double v8 = a3;
  }
  else {
    double v8 = a1;
  }
  if (v8 >= v7) {
    return v7;
  }
  else {
    return v8;
  }
}

double VisionCoreQuadrilateralGetBoundingBox(void *a1)
{
  id v1 = a1;
  [v1 topLeft];
  double v3 = v2;
  double v5 = v4;
  [v1 topRight];
  double v7 = v6;
  double v9 = v8;
  [v1 bottomRight];
  double v11 = v10;
  double v13 = v12;
  [v1 bottomLeft];
  double v15 = v14;

  return VisionCoreBoundingBoxForQuadrilateralPoints(v3, v5, v7, v9, v11, v13, v15);
}

void sub_22B18F780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26488B008, MEMORY[0x263F8C060]);
}

void sub_22B18F8C4(_Unwind_Exception *a1)
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

void sub_22B18F9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B18FAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B18FB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B18FC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B18FD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B190078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B190394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1904E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromVisionCoreTensorDataType(uint64_t a1)
{
  if (a1 <= 131103)
  {
    if (a1 <= 65567)
    {
      if (!a1)
      {
        id v1 = @"VisionCoreTensorDataTypeUnknown";
        goto LABEL_27;
      }
      if (a1 == 65552)
      {
        id v1 = @"VisionCoreTensorDataTypeFloat16";
        goto LABEL_27;
      }
    }
    else
    {
      switch(a1)
      {
        case 65568:
          id v1 = @"VisionCoreTensorDataTypeFloat32";
          goto LABEL_27;
        case 65600:
          id v1 = @"VisionCoreTensorDataTypeFloat64";
          goto LABEL_27;
        case 131080:
          id v1 = @"VisionCoreTensorDataTypeInt8";
          goto LABEL_27;
      }
    }
  }
  else if (a1 > 983047)
  {
    switch(a1)
    {
      case 983048:
        id v1 = @"VisionCoreTensorDataTypePlanar8Image";
        goto LABEL_27;
      case 983056:
        id v1 = @"VisionCoreTensorDataTypePlanar16HalfImage";
        goto LABEL_27;
      case 983072:
        id v1 = @"VisionCoreTensorDataTypePlanarFloat32Image";
        goto LABEL_27;
    }
  }
  else
  {
    switch(a1)
    {
      case 131104:
        id v1 = @"VisionCoreTensorDataTypeInt32";
        goto LABEL_27;
      case 196616:
        id v1 = @"VisionCoreTensorDataTypeUInt8";
        goto LABEL_27;
      case 196640:
        id v1 = @"VisionCoreTensorDataTypeUInt32";
        goto LABEL_27;
    }
  }
  id v1 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"VisionCoreTensorDataType_(%lX)", a1);
LABEL_27:
  return v1;
}

uint64_t VisionCoreTensorDataTypeGetElementSize(unsigned __int16 a1)
{
  return a1 >> 3;
}

uint64_t VisionCoreANESubtype()
{
  if (VisionCoreANESubtype::once_token != -1) {
    dispatch_once(&VisionCoreANESubtype::once_token, &__block_literal_global_3);
  }
  return VisionCoreANESubtype::aneSubtype;
}

uint64_t __VisionCoreANESubtype_block_invoke()
{
  uint64_t result = MGGetSInt64Answer();
  VisionCoreANESubtype::aneSubtype = result;
  return result;
}

void sub_22B191920(void *a1)
{
}

void sub_22B19192C(_Unwind_Exception *a1)
{
}

void Geometry2D_mallocCart2D(void *a1, int a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2 >= 1)
  {
    size_t v4 = 4 * a2;
    double v5 = malloc_type_malloc(v4, 0x100004052888210uLL);
    *a1 = v5;
    if (v5 && (double v6 = malloc_type_malloc(v4, 0x100004052888210uLL), (a1[1] = v6) != 0))
    {
      *((_DWORD *)a1 + 4) = a2;
    }
    else
    {
      free(v5);
      *a1 = 0;
      a1[1] = 0;
      *((_DWORD *)a1 + 4) = 0;
    }
  }
}

void Geometry2D_freeCart2D(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)a1);
    *(void *)a1 = 0;
    free(*(void **)(a1 + 8));
    *(void *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = 0;
  }
}

uint64_t Geometry2D_copyCart2D(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 1917;
  }
  size_t v4 = *(const void **)a1;
  if (!*(void *)a1 || !*(void *)(a1 + 8)) {
    return 1917;
  }
  uint64_t result = 1917;
  if (a2)
  {
    uint64_t v6 = *(unsigned int *)(a1 + 16);
    if ((int)v6 >= 1)
    {
      if (*(void *)a2)
      {
        if (*(void *)(a2 + 8))
        {
          int v7 = *(_DWORD *)(a2 + 16);
          if (v7 >= 1)
          {
            if (v6 != v7) {
              return 1916;
            }
            memcpy(*(void **)a2, v4, 4 * v6);
            memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), 4 * *(int *)(a2 + 16));
            return 1920;
          }
        }
      }
      return 1917;
    }
  }
  return result;
}

void Geometry2D_cloneUsingFlagCart2D(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 < 1)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = 0;
    double v8 = a3;
    do
    {
      int v9 = *v8++;
      v7 += v9;
      --v6;
    }
    while (v6);
  }
  Geometry2D_mallocCart2D(a1, v7);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  if (*a1) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && *((_DWORD *)a1 + 4) >= 1)
  {
    uint64_t v14 = *(unsigned int *)(a2 + 16);
    if ((int)v14 >= 1)
    {
      uint64_t v15 = 0;
      int v16 = 0;
      do
      {
        if (a3[v15])
        {
          uint64_t v17 = *(void *)(a2 + 8);
          *(_DWORD *)(v10 + 4 * v16) = *(_DWORD *)(*(void *)a2 + 4 * v15);
          *(_DWORD *)(v11 + 4 * v16++) = *(_DWORD *)(v17 + 4 * v15);
        }
        ++v15;
      }
      while (v14 != v15);
    }
  }
}

void VisionCoreHomography::VisionCoreHomography(VisionCoreHomography *this)
{
  this->var0.var0 = 0;
  this->var0.var1 = 0;
  this->var1.var0 = 0;
  p_var1 = &this->var1;
  this->var0.var2 = 0;
  this->var1.var1 = 0;
  this->var1.var2 = 0;
  this->var2.var1 = 0;
  this->var2.var2.var0 = 0;
  this->var2.var0 = 0;
  double v3 = (char *)operator new(0x24uLL);
  this->var2.var1 = (float *)(v3 + 36);
  this->var2.var2.var0 = (float *)(v3 + 36);
  *((_DWORD *)v3 + 8) = 1065353216;
  *(_OWORD *)double v3 = xmmword_22B1BF5C0;
  *((_OWORD *)v3 + 1) = unk_22B1BF5D0;
  this->var2.var0 = (float *)v3;
  *(_OWORD *)&this->var3.var0 = 0u;
  *(_OWORD *)&this->var3.var2.var0 = 0u;
  *(_OWORD *)&this->var4.var1 = 0u;
  size_t v4 = (char *)operator new(0x24uLL);
  *((_DWORD *)v4 + 8) = 1065353216;
  *(_OWORD *)size_t v4 = xmmword_22B1BF5C0;
  *((_OWORD *)v4 + 1) = unk_22B1BF5D0;
  this->var4.var0 = (float *)v4;
  this->var4.var1 = (float *)(v4 + 36);
  this->var0.var1 = 0;
  *(void *)&this->var0.var2 = 0;
  this->var0.var0 = 0;
  p_var1->var1 = 0;
  *(void *)&p_var1->var2 = 0;
  p_var1->var0 = 0;
  *(void *)&this->var5.var2 = 0x3F000000000003E8;
  this->var4.var2.var0 = (float *)(v4 + 36);
  *(void *)&this->var5.var0 = 0x3BA3D70A00000004;
}

void sub_22B192424(_Unwind_Exception *a1)
{
  *(void *)(v1 + 56) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

char *VisionCoreHomography::copyHomography(VisionCoreHomography *this, const VisionCoreHomography *a2, VisionCoreHomography *a3)
{
  Geometry2D_mallocCart2D(&v11, this->var0.var2);
  a2->var0 = v11;
  Geometry2D_mallocCart2D(&v11, this->var1.var2);
  a2->unint64_t var1 = v11;
  Geometry2D_copyCart2D((uint64_t)this, (uint64_t)a2);
  uint64_t result = (char *)Geometry2D_copyCart2D((uint64_t)&this->var1, (uint64_t)&a2->var1);
  if (a2 != this)
  {
    unint64_t var1 = this->var3.var1;
    if (var1)
    {
      p_var3 = &a2->var3;
      if (var1 > a2->var3.var2.var0 << 6)
      {
        if (p_var3->var0)
        {
          operator delete(p_var3->var0);
          p_var3->var0 = 0;
          a2->var3.unint64_t var1 = 0;
          a2->var3.var2.var0 = 0;
          unint64_t var1 = this->var3.var1;
        }
        std::vector<BOOL>::__vallocate[abi:ne180100](&a2->var3.var0, var1);
        unint64_t var1 = this->var3.var1;
      }
      memmove(p_var3->var0, this->var3.var0, (((var1 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8) + 8);
      unint64_t v8 = this->var3.var1;
    }
    else
    {
      unint64_t v8 = 0;
    }
    a2->var3.unint64_t var1 = v8;
    var0 = this->var2.var0;
    uint64_t v10 = this->var2.var1;
    return std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&a2->var2, (char *)var0, (uint64_t)v10, v10 - var0);
  }
  return result;
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  int v7 = result;
  uint64_t v8 = *((void *)result + 2);
  int v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *int v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    double v13 = (char *)v7[1];
    BOOL v12 = (void **)(v7 + 1);
    int v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  BOOL v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  int v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    int v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *BOOL v12 = &v9[v17];
  return result;
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(4 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * a2];
  return result;
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void VisionCoreHomography::VisionCoreHomography(VisionCoreHomography *this, VisionCoreHomography *a2)
{
  this->var0.var0 = 0;
  this->var0.unint64_t var1 = 0;
  this->var0.var2 = 0;
  this->var1.var0 = 0;
  this->var1.unint64_t var1 = 0;
  this->var1.var2 = 0;
  this->var2.var0 = 0;
  p_var2 = &this->var2;
  this->var2.unint64_t var1 = 0;
  this->var2.var2.var0 = 0;
  double v5 = (float *)operator new(0x24uLL);
  p_var2->var0 = v5;
  v5[8] = 1.0;
  *(_OWORD *)double v5 = xmmword_22B1BF5C0;
  *((_OWORD *)v5 + 1) = unk_22B1BF5D0;
  this->var2.unint64_t var1 = v5 + 9;
  this->var2.var2.var0 = v5 + 9;
  *(_OWORD *)&this->var3.var0 = 0u;
  *(_OWORD *)&this->var3.var2.var0 = 0u;
  *(_OWORD *)&this->var4.unint64_t var1 = 0u;
  uint64_t v6 = (char *)operator new(0x24uLL);
  *((_DWORD *)v6 + 8) = 1065353216;
  *(_OWORD *)uint64_t v6 = xmmword_22B1BF5C0;
  *((_OWORD *)v6 + 1) = unk_22B1BF5D0;
  this->var4.var0 = (float *)v6;
  this->var4.unint64_t var1 = (float *)(v6 + 36);
  *(void *)&this->var5.var0 = 0;
  *(void *)&this->var5.var2 = 0;
  this->var4.var2.var0 = (float *)(v6 + 36);
  VisionCoreHomography::copyHomography(a2, this, v7);
}

void sub_22B1927C8(_Unwind_Exception *exception_object)
{
  double v5 = (void *)v1[12];
  if (v5)
  {
    v1[13] = v5;
    operator delete(v5);
  }
  if (*v3) {
    operator delete(*v3);
  }
  uint64_t v6 = *v2;
  if (*v2)
  {
    v1[7] = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VisionCoreHomography::operator=(uint64_t a1, long long *a2)
{
  double v5 = (void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    *(void *)(a1 + 56) = v4;
    operator delete(v4);
    *double v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
  }
  *(_OWORD *)(a1 + 48) = a2[3];
  *(void *)(a1 + 64) = *((void *)a2 + 8);
  *((void *)a2 + 6) = 0;
  *((void *)a2 + 7) = 0;
  *((void *)a2 + 8) = 0;
  long long v6 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v6;
  long long v7 = *(long long *)((char *)a2 + 24);
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  *(_OWORD *)(a1 + 24) = v7;
  free(*(void **)a2);
  *(void *)a2 = 0;
  free(*((void **)a2 + 1));
  *((void *)a2 + 1) = 0;
  *((_DWORD *)a2 + 4) = 0;
  free(*((void **)a2 + 3));
  *((void *)a2 + 3) = 0;
  free(*((void **)a2 + 4));
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  *((_DWORD *)a2 + 4) = 0;
  *((void *)a2 + 3) = 0;
  *((void *)a2 + 4) = 0;
  *((_DWORD *)a2 + 10) = 0;
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void VisionCoreHomography::~VisionCoreHomography(VisionCoreHomography *this)
{
  Geometry2D_freeCart2D((uint64_t)this);
  free(this->var1.var0);
  this->var1.var0 = 0;
  free(this->var1.var1);
  this->var1.unint64_t var1 = 0;
  this->var1.var2 = 0;
  var0 = this->var4.var0;
  if (var0)
  {
    this->var4.unint64_t var1 = var0;
    operator delete(var0);
  }
  double v3 = this->var3.var0;
  if (v3) {
    operator delete(v3);
  }
  uint64_t v4 = this->var2.var0;
  if (v4)
  {
    this->var2.unint64_t var1 = v4;
    operator delete(v4);
  }
}

uint64_t VisionCoreHomography::CalculateReprojectionError(VisionCoreHomography *this, uint64_t a2)
{
  unint64_t v3 = *(int *)(a2 + 16);
  this->var0.unint64_t var1 = 0;
  *(void *)&this->var0.var2 = 0;
  this->var0.var0 = 0;
  if (v3)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, v3);
    unint64_t var1 = this->var0.var1;
    bzero(var1, 4 * v3);
    this->var0.unint64_t var1 = &var1[v3];
    var0 = this->var0.var0;
  }
  else
  {
    var0 = 0;
  }
  long long v7 = *(float **)(a2 + 48);
  return Geometry2D_symmetricReprojectionErrorHomography(a2, v7, (const float **)(a2 + 24), var0);
}

void sub_22B1929D4(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::reserve(uint64_t a1, unint64_t a2)
{
  if (a2 <= *(void *)(a1 + 16) << 6) {
    return;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v19 = 0;
  long long v20 = 0uLL;
  std::vector<BOOL>::__vallocate[abi:ne180100](&v19, a2);
  unint64_t v3 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = v20;
  unint64_t v6 = v20 + v4;
  *(void *)&long long v20 = v20 + v4;
  if (!v5)
  {
    unint64_t v7 = v6 - 1;
    goto LABEL_7;
  }
  unint64_t v7 = v6 - 1;
  if (((v6 - 1) ^ (v5 - 1)) > 0x3F)
  {
LABEL_7:
    uint64_t v8 = v19;
    unint64_t v9 = v7 >> 6;
    if (v6 >= 0x41) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = 0;
    }
    *(void *)(v19 + 8 * v10) = 0;
    goto LABEL_11;
  }
  uint64_t v8 = v19;
LABEL_11:
  int v11 = v4 & 0x3F;
  if (v4 > 0x3F || (v4 & 0x3F) != 0)
  {
    int v12 = 0;
    double v13 = &v3[v4 >> 6];
    int v14 = v5 & 0x3F;
    unint64_t v15 = (uint64_t *)(v8 + 8 * (v5 >> 6));
    do
    {
      uint64_t v16 = 1 << v14;
      if ((*v3 >> v12)) {
        uint64_t v17 = *v15 | v16;
      }
      else {
        uint64_t v17 = *v15 & ~v16;
      }
      *unint64_t v15 = v17;
      v3 += v12 == 63;
      if (v12 == 63) {
        int v12 = 0;
      }
      else {
        ++v12;
      }
      v15 += v14 == 63;
      if (v14 == 63) {
        int v14 = 0;
      }
      else {
        ++v14;
      }
    }
    while (v3 != v13 || v12 != v11);
  }
  v18 = *(void **)a1;
  *(void *)a1 = v8;
  *(_OWORD *)(a1 + 8) = v20;
  if (v18) {
    operator delete(v18);
  }
}

void sub_22B192B20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::push_back(uint64_t *a1, unsigned char *a2)
{
  unint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64) {
      unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    }
    if (v4 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    std::vector<BOOL>::reserve((uint64_t)a1, v7);
    unint64_t v4 = a1[1];
  }
  a1[1] = v4 + 1;
  uint64_t v8 = *a1;
  unint64_t v9 = v4 >> 6;
  uint64_t v10 = 1 << v4;
  if (*a2) {
    uint64_t v11 = *(void *)(v8 + 8 * v9) | v10;
  }
  else {
    uint64_t v11 = *(void *)(v8 + 8 * v9) & ~v10;
  }
  *(void *)(v8 + 8 * v9) = v11;
}

void sub_22B192FE0(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a1);
}

void sub_22B193380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1934E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(*((void *)a1 + 1));
    double v2 = (void *)*((void *)a1 + 12);
    if (v2)
    {
      *((void *)a1 + 13) = v2;
      operator delete(v2);
    }
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

void *std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>(uint64_t a1, void *a2)
{
  double v2 = (void *)(a1 + 8);
  unint64_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = (void *)(a1 + 8);
  do
  {
    char v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0) {
      unint64_t v7 = v3;
    }
    else {
      unint64_t v7 = v3 + 1;
    }
    if (v6 >= 0) {
      uint64_t v5 = v3;
    }
    unint64_t v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x230F41350](a1 + 2);
  std::istream::~istream();
  MEMORY[0x230F413B0](a1 + 53);
  return a1;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void *a2)
{
  size_t v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    size_t v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (void *)*a1;
    size_t v3 = v2;
  }
  size_t v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (void *)*a2;
    size_t v5 = v4;
  }
  if (v5 >= v3) {
    size_t v6 = v3;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (v3 == v5) {
      return 0;
    }
    if (v3 >= v5) {
      return 1;
    }
  }
  return 255;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26488B010, MEMORY[0x263F8C068]);
}

void sub_22B193798(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_22B193C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22B193E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B194008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B194274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B194320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1943CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1944A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19455C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B194630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B194714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1947CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B194940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B194B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id _dictionaryOfTensorDescriptors(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    size_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v2];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          unint64_t v9 = objc_msgSend(v8, "name", (void)v11);
          [v3 setValue:v8 forKey:v9];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  else
  {
    size_t v3 = (void *)MEMORY[0x263EFFA78];
  }

  return v3;
}

void sub_22B194D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B194F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1951D0(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

id _obtainDescriptors(objc_class *a1, objc_selector *a2, ...)
{
  va_start(va, a2);
  v42[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  va_copy(v40, va);
  if (a2)
  {
    while (1)
    {
      ClassMethod = class_getClassMethod(a1, (SEL)a2);
      if (!ClassMethod) {
        break;
      }
      IMP Implementation = method_getImplementation(ClassMethod);
      if (!Implementation)
      {
        uint64_t v10 = NSStringFromClass(a1);
        long long v11 = NSStringFromSelector((SEL)a2);
        VisionCoreValidatedLog(4, @"Could not resolve implementation for +[%@ %@]", v18, v19, v20, v21, v22, v23, (uint64_t)v10);
        goto LABEL_8;
      }
      id v41 = 0;
      int v7 = ((void (*)(objc_class *, objc_selector *, id *))Implementation)(a1, a2, &v41);
      id v8 = v41;
      unint64_t v9 = v8;
      if (!v7)
      {
        v25 = NSStringFromClass(a1);
        v26 = NSStringFromSelector((SEL)a2);
        v39 = [v9 localizedDescription];
        VisionCoreValidatedLog(4, @"+[%@ %@] did not provide a descriptor: %@", v27, v28, v29, v30, v31, v32, (uint64_t)v25);

        goto LABEL_9;
      }

      [v4 addObject:v7];
LABEL_10:
      v24 = va_arg(v40, objc_selector *);
      a2 = v24;

      if (!v24) {
        goto LABEL_13;
      }
    }
    uint64_t v10 = NSStringFromClass(a1);
    long long v11 = NSStringFromSelector((SEL)a2);
    VisionCoreValidatedLog(4, @"+[%@ %@] does not exist", v12, v13, v14, v15, v16, v17, (uint64_t)v10);
LABEL_8:

LABEL_9:
    int v7 = 0;
    goto LABEL_10;
  }
LABEL_13:
  id v33 = objc_alloc(MEMORY[0x263F08B30]);
  v34 = +[VisionCoreResourceVersion newerFirstComparator];
  v35 = (void *)[v33 initWithKey:@"version" ascending:1 comparator:v34];

  v42[0] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
  [v4 sortUsingDescriptors:v36];

  v37 = (void *)[v4 copy];
  return v37;
}

void sub_22B1954A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B195690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B195758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B195878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1959BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v16 = v15;

  _Unwind_Resume(a1);
}

void sub_22B195B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B195C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B195C90(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_22B195CA4(_Unwind_Exception *a1)
{
}

void sub_22B196228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,std::locale a25,uint64_t a26)
{
  __cxa_end_catch();
  std::ifstream::~ifstream(&a26);
  if (a24 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_22B196374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _noBlobInNetworkModelError(NSURL *a1, NSString *a2)
{
  size_t v3 = a2;
  id v4 = [(NSURL *)a1 lastPathComponent];
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"%@ does not contain the blob \"%@\"", v4, v3];
  uint64_t v6 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v5];

  return v6;
}

void sub_22B196DFC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22B196FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B1971B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1972B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1973F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B197554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VisionCoreEspressoStorageTypeForTensorDataType(uint64_t a1)
{
  if (a1 <= 131079)
  {
    uint64_t v1 = 65552;
    if (a1 == 65552) {
      return v1;
    }
    if (a1 == 65568) {
      return 65568;
    }
    return 0;
  }
  if (a1 == 131080) {
    return 131080;
  }
  if (a1 == 131104) {
    return 131104;
  }
  if (a1 != 196616) {
    return 0;
  }
  return 262152;
}

void sub_22B197A68(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x22B197970);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B197E84(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22B197F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B197FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B198118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _repeatedCharacterString(unsigned int a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int16x8_t v11 = vdupq_n_s16(a1);
  LOWORD(v12) = a1;
  WORD1(v12) = a1;
  size_t v3 = (void *)[[NSString alloc] initWithCharactersNoCopy:&v11 length:10 freeWhenDone:0];
  unint64_t v4 = objc_msgSend(v3, "length", *(_OWORD *)&v11, v12, v13);
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  for (i = v5; ; id v5 = i)
  {
    unint64_t v7 = [v5 length];
    if (v7 >= a2) {
      break;
    }
    if (a2 - v7 >= v4) {
      unint64_t v8 = v4;
    }
    else {
      unint64_t v8 = a2 - v7;
    }
    unint64_t v9 = [v3 substringToIndex:v8];
    [i appendString:v9];
  }
  return i;
}

void sub_22B1990E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void *__getANSTObjectCategoryHandSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ANSTKitLibrary();
  uint64_t result = dlsym(v2, "ANSTObjectCategoryHand");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getANSTObjectCategoryHandSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ANSTKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ANSTKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __ANSTKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26488B1E8;
    uint64_t v5 = 0;
    ANSTKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = ANSTKitLibraryCore_frameworkLibrary;
    if (ANSTKitLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return ANSTKitLibraryCore_frameworkLibrary;
}

void *__getANSTObjectCategoryFullBodySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ANSTKitLibrary();
  uint64_t result = dlsym(v2, "ANSTObjectCategoryFullBody");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getANSTObjectCategoryFullBodySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ANSTKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ANSTKitLibraryCore_frameworkLibrary = result;
  return result;
}

id getANSTISPInferenceDescriptorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getANSTISPInferenceDescriptorClass_softClass;
  uint64_t v7 = getANSTISPInferenceDescriptorClass_softClass;
  if (!getANSTISPInferenceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getANSTISPInferenceDescriptorClass_block_invoke;
    v3[3] = &unk_26488B4B8;
    v3[4] = &v4;
    __getANSTISPInferenceDescriptorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22B199754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getANSTISPInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary();
  Class result = objc_getClass("ANSTISPInferenceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTISPInferenceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    size_t v3 = (void *)abort_report_np();
    return (Class)+[VisionCoreISPInferenceNetworkDescriptor descriptorForIdentifier:v5 version:v6 error:v7];
  }
  return result;
}

void sub_22B1999B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getANSTISPInferenceConfigurationClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTISPInferenceConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTISPInferenceConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = (VisionCoreE5RTModelSource *)abort_report_np();
    [(VisionCoreE5RTModelSource *)v2 .cxx_destruct];
  }
}

uint64_t Geometry2D_computeAdjointAndDeterminant(float *a1, float *a2, float *a3)
{
  if (!a3) {
    return 1917;
  }
  float v3 = (float)(a1[4] * a1[8]) - (float)(a1[5] * a1[7]);
  *a2 = v3;
  a2[1] = (float)(a1[2] * a1[7]) - (float)(a1[1] * a1[8]);
  a2[2] = (float)(a1[1] * a1[5]) - (float)(a1[2] * a1[4]);
  float v4 = (float)(a1[5] * a1[6]) - (float)(a1[3] * a1[8]);
  a2[3] = v4;
  a2[4] = (float)(*a1 * a1[8]) - (float)(a1[2] * a1[6]);
  a2[5] = (float)(a1[2] * a1[3]) - (float)(*a1 * a1[5]);
  float v5 = (float)(a1[3] * a1[7]) - (float)(a1[6] * a1[4]);
  a2[6] = v5;
  a2[7] = (float)(a1[1] * a1[6]) - (float)(*a1 * a1[7]);
  a2[8] = (float)(*a1 * a1[4]) - (float)(a1[1] * a1[3]);
  *a3 = (float)((float)(*a1 * v3) - (float)(a1[1] * v4)) - (float)(a1[2] * v5);
  return 1920;
}

uint64_t Geometry2D_estimateWorkBufferSize(int a1)
{
  __CLPK_integer __n = 9;
  __CLPK_integer __lda = 2 * a1;
  __CLPK_integer __lwork = -1;
  __CLPK_real __work = 0.0;
  __CLPK_integer __info = 0;
  sgelqf_(&__lda, &__n, 0, &__lda, 0, &__work, &__lwork, &__info);
  if (__info) {
    return 0xFFFFFFFFLL;
  }
  else {
    return (int)__work;
  }
}

uint64_t Geometry2D_estimateHomographyMSS(uint64_t a1, uint64_t a2, __CLPK_real *a3, __CLPK_integer a4, uint64_t a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  __CLPK_integer __n = 9;
  __CLPK_integer __lda = 8;
  __CLPK_integer __info = 0;
  if (!a1 || !*(void *)a1 || !*(void *)(a1 + 8)) {
    return 1917;
  }
  int v6 = *(_DWORD *)(a1 + 16);
  if (v6 < 1 || a2 == 0) {
    return 1917;
  }
  if (!*(void *)a2) {
    return 1917;
  }
  if (!*(void *)(a2 + 8)) {
    return 1917;
  }
  int v8 = *(_DWORD *)(a2 + 16);
  if (v8 < 1) {
    return 1917;
  }
  uint64_t result = 1916;
  if (v6 == 4 && v8 == 4)
  {
    if (a5)
    {
      Geometry2D_assembleMeasurementMatrix(a1, (float **)a2, (uint64_t)__a);
      __CLPK_integer __lwork = a4;
      sgelqf_(&__lda, &__n, __a, &__lda, __tau, a3, &__lwork, &__info);
      if (__info) {
        return 1903;
      }
      char __side = 76;
      char __trans = 84;
      __CLPK_integer __n = 1;
      __CLPK_integer __lda = 9;
      __CLPK_integer __k = 8;
      *(_OWORD *)a5 = 0u;
      *(_OWORD *)(a5 + 16) = 0u;
      *(_DWORD *)(a5 + 32) = 1065353216;
      sormlq_(&__side, &__trans, &__lda, &__n, &__k, __a, &__k, __tau, (__CLPK_real *)a5, &__lda, a3, &__lwork, &__info);
      if (__info) {
        return 1903;
      }
      else {
        return 1920;
      }
    }
    return 1917;
  }
  return result;
}

uint64_t Geometry2D_assembleMeasurementMatrix(uint64_t result, float **a2, uint64_t a3)
{
  uint64_t v3 = *(int *)(result + 16);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned int *)(result + 16);
    int v6 = *a2;
    uint64_t v7 = a2[1];
    int v8 = *(float **)result;
    unint64_t v9 = *(float **)(result + 8);
    uint64_t v10 = 8 * v5;
    uint64_t v11 = a3 + 64 * v3 + 4;
    uint64_t v12 = a3 + 56 * v3;
    uint64_t v13 = a3 + 48 * v3;
    uint64_t v14 = a3 + 40 * v3;
    uint64_t result = a3 + 32 * v3;
    uint64_t v15 = a3 + 24 * v3;
    uint64_t v16 = a3 + 16 * v3;
    uint64_t v17 = a3 + 8 * v5;
    do
    {
      uint64_t v18 = (_DWORD *)(a3 + v4);
      _DWORD *v18 = *(_DWORD *)v8;
      v18[1] = 0;
      uint64_t v19 = (_DWORD *)(v17 + v4);
      _DWORD *v19 = 0;
      v19[1] = *(_DWORD *)v8;
      uint64_t v20 = (float *)(v16 + v4);
      *uint64_t v20 = -(float)(*v8 * *v6);
      float v21 = *v8++;
      v20[1] = -(float)(v21 * *v7);
      uint64_t v22 = (_DWORD *)(v15 + v4);
      *uint64_t v22 = *(_DWORD *)v9;
      v22[1] = 0;
      uint64_t v23 = (_DWORD *)(result + v4);
      *uint64_t v23 = 0;
      v23[1] = *(_DWORD *)v9;
      v24 = (float *)(v14 + v4);
      float *v24 = -(float)(*v9 * *v6);
      float v25 = *v9++;
      v24[1] = -(float)(v25 * *v7);
      *(void *)(v13 + v4) = 1065353216;
      *(void *)(v12 + v4) = 0x3F80000000000000;
      float v26 = *v6++;
      uint64_t v27 = (float *)(v11 + v4);
      *(v27 - 1) = -v26;
      float v28 = *v7++;
      float *v27 = -v28;
      v4 += 8;
    }
    while (v10 != v4);
  }
  return result;
}

uint64_t Geometry2D_symmetricReprojectionErrorHomography(uint64_t a1, float *a2, const float **a3, float *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v8 = (float *)malloc_type_malloc(4 * *(int *)(a1 + 16), 0x100004052888210uLL);
  if (!v8)
  {
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v9 = (float *)malloc_type_malloc(4 * *(int *)(a1 + 16), 0x100004052888210uLL);
  if (!v9)
  {
LABEL_11:
    uint64_t v10 = 1915;
    goto LABEL_12;
  }
  int v17 = 0;
  memset(v16, 0, sizeof(v16));
  int v19 = 0;
  memset(v18, 0, sizeof(v18));
  float v15 = 0.0;
  uint64_t v10 = Geometry2D_computeAdjointAndDeterminant(a2, (float *)v18, &v15);
  if ((v10 & 0x80) != 0)
  {
    float v11 = v15;
    if (fabsf(v15) <= 0.00000011921)
    {
      uint64_t v10 = 1902;
    }
    else
    {
      for (uint64_t i = 0; i != 36; i += 4)
        *(float *)((char *)v16 + i) = *(float *)((char *)v18 + i) / v11;
      uint64_t v10 = Geometry2D_reprojectionErrorHomography(a1, (uint64_t)a2, a3, v8);
      if ((v10 & 0x80) != 0)
      {
        uint64_t v10 = Geometry2D_reprojectionErrorHomography((uint64_t)a3, (uint64_t)v16, (const float **)a1, v9);
        if ((v10 & 0x80) != 0)
        {
          float __C = 0.5;
          vDSP_vasm(v8, 1, v9, 1, &__C, a4, 1, *(int *)(a1 + 16));
        }
      }
    }
  }
LABEL_12:
  free(v8);
  free(v9);
  return v10;
}

uint64_t Geometry2D_reprojectionErrorHomography(uint64_t a1, uint64_t a2, const float **a3, float *a4)
{
  float __C = 0;
  __D = 0;
  uint64_t v27 = 0;
  Geometry2D_mallocCart2D(&__C, *(_DWORD *)(a1 + 16));
  if (__C) {
    BOOL v8 = __D == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || (int)v27 < 1) {
    goto LABEL_9;
  }
  if (&__C == (float **)a1) {
    goto LABEL_30;
  }
  if (!*(void *)a1) {
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 8)) {
    goto LABEL_9;
  }
  int v11 = *(_DWORD *)(a1 + 16);
  if (v11 < 1) {
    goto LABEL_9;
  }
  if (v11 != v27)
  {
LABEL_30:
    uint64_t v10 = 1916;
    goto LABEL_31;
  }
  if (!a2)
  {
LABEL_9:
    uint64_t v10 = 1917;
    goto LABEL_31;
  }
  float v12 = *(float *)(a2 + 32);
  if (fabsf((float)(*(float *)a2 / v12) + -1.0) <= 0.00000011921
    && fabsf(*(float *)(a2 + 4)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 8)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 12)) <= 0.00000011921
    && fabsf((float)(*(float *)(a2 + 16) / v12) + -1.0) <= 0.00000011921
    && fabsf(*(float *)(a2 + 20)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 24)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 28)) <= 0.00000011921)
  {
    uint64_t v10 = Geometry2D_copyCart2D(a1, (uint64_t)&__C);
    if ((v10 & 0x80) == 0) {
      goto LABEL_31;
    }
    goto LABEL_35;
  }
  uint64_t v13 = (float *)malloc_type_malloc(4 * v27, 0x100004052888210uLL);
  if (v13)
  {
    uint64_t v14 = v13;
    vDSP_Length v15 = *(unsigned int *)(a1 + 16);
    if ((int)v15 > 8)
    {
      vDSP_vfill((const float *)(a2 + 32), v13, 1, v15);
      vDSP_vsma(*(const float **)a1, 1, (const float *)(a2 + 8), v14, 1, v14, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)(a1 + 8), 1, (const float *)(a2 + 20), v14, 1, v14, 1, *(int *)(a1 + 16));
      vDSP_vfill((const float *)(a2 + 24), __C, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)a1, 1, (const float *)a2, __C, 1, __C, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)(a1 + 8), 1, (const float *)(a2 + 12), __C, 1, __C, 1, *(int *)(a1 + 16));
      vDSP_vdiv(v14, 1, __C, 1, __C, 1, *(int *)(a1 + 16));
      vDSP_vfill((const float *)(a2 + 28), __D, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)a1, 1, (const float *)(a2 + 4), __D, 1, __D, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)(a1 + 8), 1, (const float *)(a2 + 16), __D, 1, __D, 1, *(int *)(a1 + 16));
      vDSP_vdiv(v14, 1, __D, 1, __D, 1, *(int *)(a1 + 16));
    }
    else if ((int)v15 >= 1)
    {
      uint64_t v16 = *(float **)a1;
      int v17 = *(float **)(a1 + 8);
      uint64_t v18 = __C;
      int v19 = __D;
      do
      {
        float v20 = *(float *)(a2 + 32) + (float)((float)(*(float *)(a2 + 20) * *v17) + (float)(*(float *)(a2 + 8) * *v16));
        *v18++ = (float)(*(float *)(a2 + 24)
                       + (float)((float)(*v17 * *(float *)(a2 + 12)) + (float)(*(float *)a2 * *v16)))
               / v20;
        float v21 = *v16++;
        float v22 = v21;
        float v23 = *v17++;
        *v19++ = (float)(*(float *)(a2 + 28)
                       + (float)((float)(*(float *)(a2 + 16) * v23) + (float)(*(float *)(a2 + 4) * v22)))
               / v20;
        --v15;
      }
      while (v15);
    }
    free(v14);
    uint64_t v10 = 1920;
LABEL_35:
    vDSP_vpythg(__C, 1, __D, 1, *a3, 1, a3[1], 1, a4, 1, *(int *)(a1 + 16));
    goto LABEL_31;
  }
  uint64_t v10 = 1915;
LABEL_31:
  free(__C);
  float __C = 0;
  free(__D);
  return v10;
}

void sub_22B19AA64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19AB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *std::vector<half>::__assign_with_size[abi:ne180100]<half *,half *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *((void *)result + 2);
  unint64_t v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(void *)result) >> 1)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if (v8 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v8 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t result = std::vector<half>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    float v12 = (void **)(v7 + 1);
    unint64_t v9 = v13;
LABEL_17:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      int v19 = __src;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  float v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 1;
  if (v15 >= a4) {
    goto LABEL_17;
  }
  uint64_t v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    unint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    int v19 = v16;
LABEL_19:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_20:
  *float v12 = &v9[v17];
  return result;
}

char *std::vector<half>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(void *result, char *__src, char *a3, unint64_t a4)
{
  int v6 = __src;
  uint64_t v7 = result;
  uint64_t v8 = result[2];
  unint64_t v9 = (char *)*result;
  if (a4 > (v8 - *result) >> 3)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      goto LABEL_23;
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    unint64_t v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v10;
    if (v11 >> 61) {
LABEL_23:
    }
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    uint64_t result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v11);
    unint64_t v9 = (char *)result;
    *uint64_t v7 = result;
    v7[1] = result;
    v7[2] = &result[v12];
    size_t v13 = a3 - v6;
    if (v13) {
      uint64_t result = memmove(result, v6, v13);
    }
    uint64_t v14 = (void **)(v7 + 1);
    goto LABEL_22;
  }
  uint64_t v14 = (void **)(result + 1);
  unint64_t v15 = (unsigned char *)result[1];
  unint64_t v16 = (v15 - v9) >> 3;
  if (v16 >= a4)
  {
    size_t v13 = a3 - __src;
    if (a3 == __src) {
      goto LABEL_22;
    }
    uint64_t v18 = (void *)*result;
LABEL_21:
    uint64_t result = memmove(v18, __src, v13);
    goto LABEL_22;
  }
  size_t v17 = &__src[8 * v16];
  if (v15 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v15 - v9);
    unint64_t v9 = (char *)*v14;
  }
  size_t v13 = a3 - v17;
  if (v13)
  {
    uint64_t v18 = v9;
    __src = v17;
    goto LABEL_21;
  }
LABEL_22:
  *uint64_t v14 = &v9[v13];
  return result;
}

void sub_22B19B574(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p)
{
  if (v13) {
    operator delete(v13);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned long>::__throw_out_of_range[abi:ne180100]()
{
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(_WORD *a1, _WORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    int v6 = *(_WORD **)(a3 + 8);
    do
    {
      unint64_t v7 = *(void *)(a3 + 16);
      if ((unint64_t)v6 >= v7)
      {
        unint64_t v9 = *(_WORD **)a3;
        uint64_t v10 = (uint64_t)v6 - *(void *)a3;
        if (v10 <= -3) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v11 = v10 >> 1;
        unint64_t v12 = v7 - (void)v9;
        if (v12 <= (v10 >> 1) + 1) {
          unint64_t v13 = v11 + 1;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v14 = v13;
        }
        if (v14)
        {
          uint64_t v14 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v14);
          unint64_t v9 = *(_WORD **)a3;
          int v6 = *(_WORD **)(a3 + 8);
        }
        else
        {
          uint64_t v15 = 0;
        }
        unint64_t v16 = (_WORD *)(v14 + 2 * v11);
        *unint64_t v16 = *v5;
        uint64_t v8 = v16 + 1;
        while (v6 != v9)
        {
          __int16 v17 = *--v6;
          *--unint64_t v16 = v17;
        }
        *(void *)a3 = v16;
        *(void *)(a3 + 8) = v8;
        *(void *)(a3 + 16) = v14 + 2 * v15;
        if (v9) {
          operator delete(v9);
        }
      }
      else
      {
        _WORD *v6 = *v5;
        uint64_t v8 = v6 + 1;
      }
      *(void *)(a3 + 8) = v8;
      ++v5;
      int v6 = v8;
    }
    while (v5 != a2);
  }
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned long *>,std::__wrap_iter<unsigned long *>,std::back_insert_iterator<std::vector<unsigned long>>,0>(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    int v6 = *(void **)(a3 + 8);
    do
    {
      unint64_t v7 = *(void *)(a3 + 16);
      if ((unint64_t)v6 >= v7)
      {
        unint64_t v9 = *(void **)a3;
        uint64_t v10 = ((uint64_t)v6 - *(void *)a3) >> 3;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = v7 - (void)v9;
        if (v12 >> 2 > v11) {
          unint64_t v11 = v12 >> 2;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v11;
        }
        if (v13)
        {
          unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v13);
          unint64_t v9 = *(void **)a3;
          int v6 = *(void **)(a3 + 8);
        }
        else
        {
          uint64_t v14 = 0;
        }
        uint64_t v15 = (void *)(v13 + 8 * v10);
        *uint64_t v15 = *v5;
        uint64_t v8 = v15 + 1;
        while (v6 != v9)
        {
          uint64_t v16 = *--v6;
          *--uint64_t v15 = v16;
        }
        *(void *)a3 = v15;
        *(void *)(a3 + 8) = v8;
        *(void *)(a3 + 16) = v13 + 8 * v14;
        if (v9) {
          operator delete(v9);
        }
      }
      else
      {
        void *v6 = *v5;
        uint64_t v8 = v6 + 1;
      }
      *(void *)(a3 + 8) = v8;
      ++v5;
      int v6 = v8;
    }
    while (v5 != a2);
  }
}

void std::vector<half>::__insert_with_size[abi:ne180100]<std::__wrap_iter<half *>,std::__wrap_iter<half *>>(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  if (a5 < 1) {
    return;
  }
  int v6 = __src;
  unint64_t v10 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (a5 > (uint64_t)(v9 - v10) >> 1)
  {
    unint64_t v11 = *(char **)a1;
    if (a5 + ((uint64_t)(v10 - *(void *)a1) >> 1) < 0) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = (__dst - v11) >> 1;
    unint64_t v13 = v9 - (void)v11;
    if (v13 <= a5 + ((uint64_t)(v10 - *(void *)a1) >> 1)) {
      unint64_t v14 = a5 + ((uint64_t)(v10 - *(void *)a1) >> 1);
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
    if (v15) {
      uint64_t v15 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v15);
    }
    else {
      uint64_t v16 = 0;
    }
    float v26 = (_WORD *)(v15 + 2 * v12);
    uint64_t v27 = (char *)&v26[a5];
    uint64_t v28 = 2 * a5;
    uint64_t v29 = v26;
    do
    {
      __int16 v30 = *(_WORD *)v6;
      v6 += 2;
      *v29++ = v30;
      v28 -= 2;
    }
    while (v28);
    uint64_t v31 = *(char **)a1;
    if (*(char **)a1 != __dst)
    {
      uint64_t v32 = __dst;
      do
      {
        __int16 v33 = *((_WORD *)v32 - 1);
        v32 -= 2;
        *--float v26 = v33;
      }
      while (v32 != v31);
    }
    uint64_t v34 = v15 + 2 * v16;
    v35 = *(unsigned char **)(a1 + 8);
    uint64_t v36 = v35 - __dst;
    if (v35 != __dst) {
      memmove(v27, __dst, v35 - __dst);
    }
    v37 = *(char **)a1;
    *(void *)a1 = v26;
    *(void *)(a1 + 8) = &v27[v36];
    *(void *)(a1 + 16) = v34;
    if (v37)
    {
      operator delete(v37);
    }
    return;
  }
  uint64_t v17 = v10 - (void)__dst;
  uint64_t v18 = (uint64_t)(v10 - (void)__dst) >> 1;
  if (v18 >= a5)
  {
    int v19 = &__src[2 * a5];
    float v21 = *(char **)(a1 + 8);
LABEL_18:
    float v22 = &__dst[2 * a5];
    float v23 = &v21[-2 * a5];
    v24 = v21;
    if ((unint64_t)v23 < v10)
    {
      v24 = v21;
      do
      {
        __int16 v25 = *(_WORD *)v23;
        v23 += 2;
        *(_WORD *)v24 = v25;
        v24 += 2;
      }
      while ((unint64_t)v23 < v10);
    }
    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v21[-2 * ((v21 - v22) >> 1)], __dst, v21 - v22);
    }
    if (v19 != v6)
    {
      memmove(__dst, v6, v19 - v6);
    }
    return;
  }
  int v19 = &__src[2 * v18];
  int64_t v20 = a4 - v19;
  if (a4 != v19) {
    memmove(*(void **)(a1 + 8), &__src[2 * v18], a4 - v19);
  }
  float v21 = (char *)(v10 + v20);
  *(void *)(a1 + 8) = v10 + v20;
  if (v17 >= 1) {
    goto LABEL_18;
  }
}

void sub_22B19BF54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19C220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19C2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B19C32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)VisionCoreSparseOpticalFlowSession;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22B19C460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19C564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, VisionCoreHomography *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  VisionCoreHomography::~VisionCoreHomography((VisionCoreHomography *)&a9);
  VisionCoreHomography::~VisionCoreHomography((VisionCoreHomography *)&a26);

  _Unwind_Resume(a1);
}

void sub_22B19C784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, VisionCoreHomography *a18)
{
  _Unwind_Resume(a1);
}

void sub_22B19C940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19CA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19D4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,VisionCoreHomography *a21,VisionCoreHomography *a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  STACK[0x230] = (unint64_t)&a63;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x230]);
  if (__pa)
  {
    a68 = __pa;
    operator delete(__pa);
  }

  _Unwind_Resume(a1);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    unint64_t v7 = &end[__n];
    std::vector<int>::size_type v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_22B19D688(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (VisionCoreHomography *)**a1;
  if (v2)
  {
    uint64_t v4 = (VisionCoreHomography *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        VisionCoreHomography::~VisionCoreHomography(v4 - 1);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *std::vector<int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void sub_22B19E6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,VisionCoreHomography *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,uint64_t a40,VisionCoreHomography *a41)
{
  if (v42) {
    operator delete(v42);
  }

  a41 = a21;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&a41);

  _Unwind_Resume(a1);
}

VisionCoreHomography **std::vector<VisionCoreHomography>::vector(VisionCoreHomography **a1, unint64_t a2, VisionCoreHomography *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0x1E1E1E1E1E1E1E2) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a2;
    uint64_t v6 = 136 * a2;
    unint64_t v7 = (VisionCoreHomography *)operator new(136 * a2);
    *a1 = v7;
    a1[1] = v7;
    std::vector<int>::size_type v8 = &v7[v5];
    a1[2] = v8;
    do
    {
      VisionCoreHomography::VisionCoreHomography(v7++, a3);
      v6 -= 136;
    }
    while (v6);
    a1[1] = v8;
  }
  return a1;
}

void sub_22B19EA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22B19EA94(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B19EB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B19EED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  __p = (void *)(v18 - 112);
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void sub_22B19F1F0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B19F940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *__pa, void *a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, char a19, uint64_t a20,void *a21,VisionCoreHomography *a22,void *a23,void *a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,void **a30,void **a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,uint64_t a49,void *a50,void *a51)
{
  if (__pa) {
    operator delete(__pa);
  }
  if (a15) {
    operator delete(a15);
  }
  if (a18) {
    operator delete(a18);
  }
  if (a21) {
    operator delete(a21);
  }
  if (a24) {
    operator delete(a24);
  }
  if (a30)
  {
    a31 = a30;
    operator delete(a30);
  }
  a30 = (void **)&a27;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100](&a30);
  if (v51) {
    operator delete(v51);
  }
  if (a47) {
    operator delete(a47);
  }
  if (a50)
  {
    a51 = a50;
    operator delete(a50);
  }
  VisionCoreHomography::~VisionCoreHomography((VisionCoreHomography *)(v52 - 240));
  _Unwind_Resume(a1);
}

void sub_22B19FEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  __p = &a28;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  uint64_t v32 = *(void **)v30;
  if (*(void *)v30)
  {
    *(void *)(v30 + 8) = v32;
    operator delete(v32);
  }
  __int16 v33 = *(void **)(v30 + 24);
  if (v33)
  {
    *(void *)(v30 + 32) = v33;
    operator delete(v33);
  }
  uint64_t v34 = *(void **)(v30 + 48);
  if (v34)
  {
    *(void *)(v30 + 56) = v34;
    operator delete(v34);
  }
  v35 = *(void **)(v30 + 72);
  if (v35)
  {
    *(void *)(v30 + 80) = v35;
    operator delete(v35);
  }
  uint64_t v36 = *(void **)(v30 + 96);
  if (v36)
  {
    *(void *)(v30 + 104) = v36;
    operator delete(v36);
  }

  _Unwind_Resume(a1);
}

void *std::vector<CGPoint>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 60) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v4 = 16 * a2;
    uint64_t v5 = (char *)operator new(16 * a2);
    *a1 = v5;
    a1[2] = &v5[16 * a2];
    bzero(v5, 16 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_22B1A0070(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<half>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<half>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 2 * a2);
    a1[1] = &v4[2 * a2];
  }
  return a1;
}

void sub_22B1A00E8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B1A0D88(_Unwind_Exception *a1)
{
  *(void *)(v1 + 56) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_22B1A10E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

uint64_t VisionCoreEqualOrNilObjects(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

uint64_t VisionCoreEquivalentOrNilUnorderedArrays(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (v3 && v4)
    {
      uint64_t v7 = [v3 count];
      if (v7 == [v5 count])
      {
        size_t v8 = (void *)MEMORY[0x230F41A40]();
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v3];
        unint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v5];
        uint64_t v6 = [v9 isEqualToSet:v10];
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
  }

  return v6;
}

id VisionCoreFourCharCodeToString(uint64_t a1)
{
  uint64_t v2 = ((int)a1 >> 24);
  uint64_t v3 = MEMORY[0x263EF8318];
  if ((a1 & 0x80000000) != 0)
  {
    if (!__maskrune((int)a1 >> 24, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v2 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  if (((a1 << 8) & 0x80000000) != 0)
  {
    if (!__maskrune((int)(a1 << 8) >> 24, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(v3 + 4 * ((int)(a1 << 8) >> 24) + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  if (((a1 << 16) & 0x80000000) != 0)
  {
    if (!__maskrune((__int16)a1 >> 8, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(v3 + 4 * ((__int16)a1 >> 8) + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  if ((a1 & 0x80) != 0)
  {
    if (__maskrune((char)a1, 0x40000uLL)) {
      goto LABEL_15;
    }
  }
  else if ((*(_DWORD *)(v3 + 4 * (char)a1 + 60) & 0x40000) != 0)
  {
LABEL_15:
    id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"'%c%c%c%c'", v2, ((int)(a1 << 8) >> 24), ((__int16)a1 >> 8), (char)a1);
    goto LABEL_18;
  }
LABEL_17:
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%08X", a1, v6, v7, v8);
LABEL_18:
  return v4;
}

double VisionCoreNormalizedPointForImagePoint(unint64_t a1, uint64_t a2, double a3)
{
  if (a1 && a2) {
    return a3 / (double)a1;
  }
  else {
    return *MEMORY[0x263F00148];
  }
}

double VisionCoreImagePointForNormalizedPoint(unint64_t a1, double a2)
{
  return a2 * (double)a1;
}

uint64_t VisionCorePerformWithLockedIOSurface(__IOSurface *a1, IOSurfaceLockOptions a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  uint64_t v8 = IOSurfaceLock(a1, a2, 0);
  if (v8)
  {
    if (a4)
    {
      uint64_t v9 = v8;
      id v10 = [NSString alloc];
      unint64_t v11 = [NSNumber numberWithInt:v9];
      uint64_t v12 = (void *)[v10 initWithFormat:@"Could not lock IOSurfaceRef %p (%@)", a1, v11];

      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForKernelReturnCode:v9 localizedDescription:v12];

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = v7[2](v7, a1, a4);
    uint64_t v13 = IOSurfaceUnlock(a1, a2, 0);
    if (v13)
    {
      float v21 = [NSNumber numberWithInt:v13];
      VisionCoreValidatedLog(4, @"Could not unlock IOSurfaceRef %p (%@)", v14, v15, v16, v17, v18, v19, (uint64_t)a1);
    }
  }

  return a4 & 1;
}

void sub_22B1A1540(_Unwind_Exception *a1)
{
}

__CFString *VisionCoreANEArchitectureName()
{
  if (VisionCoreHasANE::once_token != -1) {
    dispatch_once(&VisionCoreHasANE::once_token, &__block_literal_global_111);
  }
  if (VisionCoreHasANE::hasANESupport)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2050000000;
    uint64_t v0 = (void *)get_ANEDeviceInfoClass_softClass;
    uint64_t v9 = get_ANEDeviceInfoClass_softClass;
    if (!get_ANEDeviceInfoClass_softClass)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __get_ANEDeviceInfoClass_block_invoke;
      v5[3] = &unk_26488B4B8;
      v5[4] = &v6;
      __get_ANEDeviceInfoClass_block_invoke((uint64_t)v5);
      uint64_t v0 = (void *)v7[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v6, 8);
    uint64_t v2 = [v1 aneSubType];
    uint64_t v3 = [v2 uppercaseString];
  }
  else
  {
    uint64_t v3 = &stru_26DE66AF0;
  }
  return v3;
}

void sub_22B1A1698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AppleNeuralEngineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleNeuralEngineLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t VisionCoreCurrentANEGeneration()
{
  if (VisionCoreCurrentANEGeneration_onceToken != -1) {
    dispatch_once(&VisionCoreCurrentANEGeneration_onceToken, &__block_literal_global_22);
  }
  return VisionCoreCurrentANEGeneration_currentANEGeneration;
}

void __VisionCoreCurrentANEGeneration_block_invoke()
{
  VisionCoreANEArchitectureName();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 componentsSeparatedByString:@"H"];
  id v1 = [v0 lastObject];
  VisionCoreCurrentANEGeneration_currentANEGeneration = [v1 integerValue];
}

id VisionCoreTensorDescriptorsFromANSTDescriptors(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v24 = 0;
        __int16 v25 = &v24;
        uint64_t v26 = 0x2050000000;
        uint64_t v7 = (void *)getANSTTensorDescriptorClass_softClass;
        uint64_t v27 = getANSTTensorDescriptorClass_softClass;
        if (!getANSTTensorDescriptorClass_softClass)
        {
          uint64_t v19 = MEMORY[0x263EF8330];
          uint64_t v20 = 3221225472;
          float v21 = __getANSTTensorDescriptorClass_block_invoke;
          float v22 = &unk_26488B4B8;
          float v23 = &v24;
          __getANSTTensorDescriptorClass_block_invoke((uint64_t)&v19);
          uint64_t v7 = (void *)v25[3];
        }
        id v8 = v7;
        _Block_object_dispose(&v24, 8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [[VisionCoreTensorDescriptor alloc] initWithANSTTensorDescriptor:v6];
          [v2 addObject:v9];
        }
        uint64_t v24 = 0;
        __int16 v25 = &v24;
        uint64_t v26 = 0x2050000000;
        id v10 = (void *)getANSTPixelBufferDescriptorClass_softClass;
        uint64_t v27 = getANSTPixelBufferDescriptorClass_softClass;
        if (!getANSTPixelBufferDescriptorClass_softClass)
        {
          uint64_t v19 = MEMORY[0x263EF8330];
          uint64_t v20 = 3221225472;
          float v21 = __getANSTPixelBufferDescriptorClass_block_invoke;
          float v22 = &unk_26488B4B8;
          float v23 = &v24;
          __getANSTPixelBufferDescriptorClass_block_invoke((uint64_t)&v19);
          id v10 = (void *)v25[3];
        }
        id v11 = v10;
        _Block_object_dispose(&v24, 8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [[VisionCoreImageTensorDescriptor alloc] initWithANSTPixelBufferDescriptor:v6];
          [v2 addObject:v12];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v3);
  }

  return v2;
}

void sub_22B1A1BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getANSTTensorDescriptorClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_1042();
  Class result = objc_getClass("ANSTTensorDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTTensorDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getANSTPixelBufferDescriptorClass_block_invoke(v3);
  }
  return result;
}

void __getANSTPixelBufferDescriptorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTPixelBufferDescriptor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTPixelBufferDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    ANSTKitLibrary_1042();
  }
}

void ANSTKitLibrary_1042()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!ANSTKitLibraryCore_frameworkLibrary_1045)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __ANSTKitLibraryCore_block_invoke_1046;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26488B260;
    uint64_t v3 = 0;
    ANSTKitLibraryCore_frameworkLibrary_1045 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (ANSTKitLibraryCore_frameworkLibrary_1045)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __ANSTKitLibraryCore_block_invoke_1046()
{
  uint64_t result = _sl_dlopen();
  ANSTKitLibraryCore_frameworkLibrary_1045 = result;
  return result;
}

void sub_22B1A3388(void *a1)
{
}

void sub_22B1A3698(void *a1)
{
}

void sub_22B1A3C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getANSTViSegHQInitialFrameInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_1208();
  Class result = objc_getClass("ANSTViSegHQInitialFrameInferenceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)getANSTViSegHQRegularFrameInferenceDescriptorClass(v3);
  }
  return result;
}

id getANSTViSegHQRegularFrameInferenceDescriptorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass;
  uint64_t v7 = getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass;
  if (!getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getANSTViSegHQRegularFrameInferenceDescriptorClass_block_invoke;
    v3[3] = &unk_26488B4B8;
    v3[4] = &v4;
    __getANSTViSegHQRegularFrameInferenceDescriptorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22B1A3DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getANSTViSegHQUpdateFrameInferenceDescriptorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass;
  uint64_t v7 = getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass;
  if (!getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getANSTViSegHQUpdateFrameInferenceDescriptorClass_block_invoke;
    v3[3] = &unk_26488B4B8;
    v3[4] = &v4;
    __getANSTViSegHQUpdateFrameInferenceDescriptorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22B1A3EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getANSTViSegHQUpdateFrameInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTViSegHQUpdateFrameInferenceDescriptor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  }
  else
  {
    abort_report_np();
    ANSTKitLibrary_1208();
  }
}

void ANSTKitLibrary_1208()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!ANSTKitLibraryCore_frameworkLibrary_1211)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __ANSTKitLibraryCore_block_invoke_1212;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26488B2E0;
    uint64_t v3 = 0;
    ANSTKitLibraryCore_frameworkLibrary_1211 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (ANSTKitLibraryCore_frameworkLibrary_1211)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __ANSTKitLibraryCore_block_invoke_1212()
{
  uint64_t result = _sl_dlopen();
  ANSTKitLibraryCore_frameworkLibrary_1211 = result;
  return result;
}

Class __getANSTViSegHQRegularFrameInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_1208();
  Class result = objc_getClass("ANSTViSegHQRegularFrameInferenceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)+[VisionCoreVideoSegmentationInferenceNetworkDescriptor _configurationForIdentifer:v5 version:v6];
  }
  return result;
}

id getANSTViSegHQInferenceConfigurationClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getANSTViSegHQInferenceConfigurationClass_softClass;
  uint64_t v7 = getANSTViSegHQInferenceConfigurationClass_softClass;
  if (!getANSTViSegHQInferenceConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getANSTViSegHQInferenceConfigurationClass_block_invoke;
    v3[3] = &unk_26488B4B8;
    v3[4] = &v4;
    __getANSTViSegHQInferenceConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22B1A4470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getANSTViSegHQInferenceConfigurationClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_1208();
  Class result = objc_getClass("ANSTViSegHQInferenceConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQInferenceConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (VisionCoreValueConfidenceCurve *)abort_report_np();
    return (Class)[(VisionCoreValueConfidenceCurve *)v3 .cxx_construct];
  }
  return result;
}

void sub_22B1A4D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<VisionCoreValueConfidencePoint>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    SEL v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(a2);
    id v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v7 = &v4[8 * v6];
    uint64_t v9 = (char *)*a1;
    id v8 = (char *)a1[1];
    id v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      id v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void sub_22B1A5260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _tenthsForValue(float a1)
{
  if (_tenthsForValue(float)::onceToken != -1) {
    dispatch_once(&_tenthsForValue(float)::onceToken, &__block_literal_global_1277);
  }
  uint64_t v2 = *(void *)(_tenthsForValue(float)::tenthsMap + 8);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = _tenthsForValue(float)::tenthsMap + 8;
  do
  {
    SEL v4 = (uint64_t *)(v2 + 8);
    if (*(float *)(v2 + 28) >= a1)
    {
      SEL v4 = (uint64_t *)v2;
      uint64_t v3 = v2;
    }
    uint64_t v2 = *v4;
  }
  while (*v4);
  if (v3 == _tenthsForValue(float)::tenthsMap + 8 || *(float *)(v3 + 28) > a1) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(v3 + 32);
  }
}

void ___ZL15_tenthsForValuef_block_invoke()
{
}

void sub_22B1A565C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(*(void **)(v1 + 8));
  MEMORY[0x230F413E0](v1, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(*a1);
    std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void sub_22B1A57A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1A5888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1A5CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1A5DF0()
{
}

void sub_22B1A5FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(float *result, float *a2, float *a3)
{
  float v3 = *a2;
  float v4 = *a3;
  if (*a2 >= *result)
  {
    if (v4 < v3)
    {
      uint64_t v6 = *(void *)a2;
      *(void *)a2 = *(void *)a3;
      *(void *)a3 = v6;
      if (*a2 < *result)
      {
        uint64_t v7 = *(void *)result;
        *(void *)Class result = *(void *)a2;
        *(void *)a2 = v7;
      }
    }
  }
  else
  {
    uint64_t v5 = *(void *)result;
    if (v4 >= v3)
    {
      *(void *)Class result = *(void *)a2;
      *(void *)a2 = v5;
      if (*a3 >= *(float *)&v5) {
        return result;
      }
      *(void *)a2 = *(void *)a3;
    }
    else
    {
      *(void *)Class result = *(void *)a3;
    }
    *(void *)a3 = v5;
  }
  return result;
}

float *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(float *a1, float *a2, float *a3, void *a4)
{
  Class result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)a1 _finalizeInitialization];
  if (*(float *)a4 < *a3)
  {
    uint64_t v9 = *(void *)a3;
    *(void *)a3 = *a4;
    *a4 = v9;
    if (*a3 < *a2)
    {
      uint64_t v10 = *(void *)a2;
      *(void *)a2 = *(void *)a3;
      *(void *)a3 = v10;
      if (*a2 < *a1)
      {
        uint64_t v11 = *(void *)a1;
        *(void *)a1 = *(void *)a2;
        *(void *)a2 = v11;
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*(float *)(a2 - 8) < *(float *)a1)
      {
        uint64_t v6 = *(void *)a1;
        *(void *)a1 = *(void *)(a2 - 8);
        *(void *)(a2 - 8) = v6;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)a1 _finalizeInitialization];
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)a1 _finalizeInitialization];
      return 1;
    case 5:
      long long v16 = (float *)(a1 + 16);
      long long v17 = (uint64_t *)(a1 + 24);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)a1 _finalizeInitialization];
      if (*(float *)(a2 - 8) < *(float *)(a1 + 24))
      {
        uint64_t v18 = *v17;
        *long long v17 = *(void *)(a2 - 8);
        *(void *)(a2 - 8) = v18;
        if (*(float *)v17 < *v16)
        {
          uint64_t v19 = *(void *)v16;
          uint64_t v20 = *v17;
          *(void *)long long v16 = *v17;
          *long long v17 = v19;
          if (*(float *)(a1 + 8) > *(float *)&v20)
          {
            uint64_t v21 = *(void *)(a1 + 8);
            *(void *)(a1 + 8) = v20;
            *(void *)(a1 + 16) = v21;
            if (*(float *)a1 > *(float *)&v20)
            {
              uint64_t v22 = *(void *)a1;
              *(void *)a1 = v20;
              *(void *)(a1 + 8) = v22;
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v7 = (float *)(a1 + 16);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)a1 _finalizeInitialization];
      uint64_t v8 = a1 + 24;
      if (a1 + 24 == a2) {
        return 1;
      }
      uint64_t v9 = 0;
      int v10 = 0;
      break;
  }
  while (1)
  {
    float v11 = *(float *)v8;
    if (*(float *)v8 < *v7)
    {
      int v12 = *(_DWORD *)(v8 + 4);
      uint64_t v13 = v9;
      while (1)
      {
        *(void *)(a1 + v13 + 24) = *(void *)(a1 + v13 + 16);
        if (v13 == -16) {
          break;
        }
        float v14 = *(float *)(a1 + v13 + 8);
        v13 -= 8;
        if (v14 <= v11)
        {
          uint64_t v15 = a1 + v13 + 24;
          goto LABEL_13;
        }
      }
      uint64_t v15 = a1;
LABEL_13:
      *(float *)uint64_t v15 = v11;
      *(_DWORD *)(v15 + 4) = v12;
      if (++v10 == 8) {
        return v8 + 8 == a2;
      }
    }
    uint64_t v7 = (float *)v8;
    v9 += 8;
    v8 += 8;
    if (v8 == a2) {
      return 1;
    }
  }
}

void sub_22B1A6B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Geometry2D_normalizePoints(uint64_t a1, float *a2, uint64_t a3, float *__C, float *a5, float *a6)
{
  if (!a1) {
    return 1917;
  }
  uint64_t v7 = *(const float **)a1;
  if (!*(void *)a1 || !*(void *)(a1 + 8)) {
    return 1917;
  }
  uint64_t result = 1917;
  if (a3)
  {
    vDSP_Length v10 = *(unsigned int *)(a1 + 16);
    if ((int)v10 >= 1)
    {
      if (*(void *)a3)
      {
        if (*(void *)(a3 + 8))
        {
          int v11 = *(_DWORD *)(a3 + 16);
          if (v11 >= 1)
          {
            if (v10 != v11) {
              return 1916;
            }
            vDSP_meanv(v7, 1, __C, *(unsigned int *)(a1 + 16));
            vDSP_meanv(*(const float **)(a1 + 8), 1, a5, v10);
            float v16 = -*__C;
            float v18 = -*a5;
            float __B = v16;
            vDSP_vsadd(*(const float **)a1, 1, &__B, *(float **)a3, 1, v10);
            vDSP_vsadd(*(const float **)(a1 + 8), 1, &v18, *(float **)(a3 + 8), 1, v10);
            vDSP_vdist(*(const float **)a3, 1, *(const float **)(a3 + 8), 1, a2, 1, v10);
            float __Ca = 0.0;
            vDSP_meanv(a2, 1, &__Ca, v10);
            if (fabsf(__Ca) < 0.00000011921) {
              return 1901;
            }
            *a6 = 1.4142 / __Ca;
            vDSP_vsmul(*(const float **)a3, 1, a6, *(float **)a3, 1, v10);
            vDSP_vsmul(*(const float **)(a3 + 8), 1, a6, *(float **)(a3 + 8), 1, v10);
            return 1920;
          }
        }
      }
      return 1917;
    }
  }
  return result;
}

void sub_22B1A8DB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B1A8FD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B1A9050(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B1A97C8(_Unwind_Exception *a1)
{
}

void sub_22B1A97E8(void *a1)
{
}

uint64_t ___releaseAllNamedIOPortHandles_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return e5rt_io_port_release();
}

void sub_22B1AAB8C(_Unwind_Exception *a1)
{
}

void sub_22B1AABC8(void *a1)
{
}

void sub_22B1AABD8(void *a1)
{
}

void sub_22B1AAE14(_Unwind_Exception *a1)
{
}

void sub_22B1AAE34(void *a1)
{
}

void sub_22B1AAF1C(_Unwind_Exception *a1)
{
}

void sub_22B1AAF3C(void *a1)
{
}

void sub_22B1AB130(_Unwind_Exception *a1)
{
}

void sub_22B1AB290(void *a1)
{
}

void sub_22B1AB29C(_Unwind_Exception *a1)
{
}

void sub_22B1AB5E0(void *a1)
{
}

void sub_22B1AB5EC(_Unwind_Exception *a1)
{
}

void sub_22B1ABDB4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x22B1ABCACLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B1AC0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void std::vector<long>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v7 = &v4[8 * v6];
    uint64_t v8 = (char *)*a1;
    uint64_t v9 = (char *)a1[1];
    vDSP_Length v10 = v5;
    if (v9 != *a1)
    {
      vDSP_Length v10 = v5;
      do
      {
        uint64_t v11 = *((void *)v9 - 1);
        v9 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v9 != v8);
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void sub_22B1AC2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B1AC39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1AC440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1AC764(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B1AC9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22B1ACB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B1AE23C(void *a1)
{
}

void sub_22B1AEA60(void *a1)
{
}

void sub_22B1AEC88(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_22B1AECA8(void *a1)
{
}

void sub_22B1AF264(void *exc_buf)
{
  if (v1) {
    objc_end_catch();
  }
  objc_begin_catch(exc_buf);
  JUMPOUT(0x22B1AF1F8);
}

void sub_22B1AF2B4(_Unwind_Exception *a1)
{
}

void sub_22B1AF494(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_22B1AF4B4(void *a1)
{
}

void sub_22B1B0198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getANSTPixelBufferClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTPixelBuffer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTPixelBufferClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    ANSTKitLibrary_2454();
  }
}

void ANSTKitLibrary_2454()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!ANSTKitLibraryCore_frameworkLibrary_2457)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __ANSTKitLibraryCore_block_invoke_2458;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26488B4D8;
    uint64_t v3 = 0;
    ANSTKitLibraryCore_frameworkLibrary_2457 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (ANSTKitLibraryCore_frameworkLibrary_2457)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __ANSTKitLibraryCore_block_invoke_2458()
{
  uint64_t result = _sl_dlopen();
  ANSTKitLibraryCore_frameworkLibrary_2457 = result;
  return result;
}

void sub_22B1B04E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getANSTTensorDataClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_2454();
  Class result = objc_getClass("ANSTTensorData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getANSTTensorDataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (VisionCoreANSTInferenceNetworkDescriptor *)abort_report_np();
    return (Class)[(VisionCoreANSTInferenceNetworkDescriptor *)v3 _outputDescriptorWithName:v5 postProcessor:v6];
  }
  return result;
}

CFTypeRef CreatePixelBuffer(int a1, int a2, OSType a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t v12 = *MEMORY[0x263F04130];
  v13[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  CVReturn v7 = CVPixelBufferCreate(0, a1, a2, a3, v6, (CVPixelBufferRef *)&cf);
  CFTypeRef v8 = cf;
  if (v7) {
    BOOL v9 = cf == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    CFRelease(cf);
    CFTypeRef v8 = 0;
    CFTypeRef cf = 0;
  }

  return v8;
}

void sub_22B1B39C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  objc_begin_catch(a1);
  free(v14);
  objc_exception_rethrow();
}

void sub_22B1B39EC(_Unwind_Exception *a1)
{
}

uint64_t ___enumerateProcessSubclasses_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void sub_22B1B42A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromVisionCoreSceneNetInferenceNetworkModel(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1) {
      long long v2 = @"VisionCoreSceneNetInferenceNetworkModelSceneNetV3";
    }
    else {
      long long v2 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"VisionCoreSceneNetInferenceNetworkModel%lu", a1);
    }
  }
  else
  {
    long long v2 = @"VisionCoreSceneNetInferenceNetworkModelUndefined";
  }
  return v2;
}

void sub_22B1B6DE8(_Unwind_Exception *a1)
{
}

void sub_22B1B6E08(void *a1)
{
}

void sub_22B1B7898(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B1B7C18(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_22B1B7C4C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_22B1B803C(void *a1)
{
}

void sub_22B1B8A48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void VisionCoreValidatedLog(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2)
  {
    char v10 = a1;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __VisionCoreValidatedLog_block_invoke;
    v13[3] = &__block_descriptor_36_e24_v24__0____CFString__8_16l;
    int v14 = a1;
    uint64_t v11 = MEMORY[0x230F41C60](v13);
    uint64_t v12 = (void (**)(void, void, void))v11;
    if ((v10 & 6) != 0)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t *))(v11 + 16))(v11, a2, &a9);
    }
    else
    {
      if (_LogAllMessages_onceToken != -1) {
        dispatch_once(&_LogAllMessages_onceToken, &__block_literal_global_6);
      }
      if (_LogAllMessages__logAllMessages) {
        ((void (**)(void, uint64_t, uint64_t *))v12)[2](v12, a2, &a9);
      }
    }
  }
}

void sub_22B1B8D48(void *a1)
{
}

void sub_22B1B8D58(_Unwind_Exception *a1)
{
}

void __VisionCoreValidatedLog_block_invoke(uint64_t a1, CFStringRef format, va_list arguments)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFStringRef v4 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, format, arguments);
  if (v4)
  {
    CFStringRef v5 = v4;
    CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
    if (CStringPtr)
    {
      CVReturn v7 = CStringPtr;
      if (_VisionCoreLogger_onceToken != -1) {
        dispatch_once(&_VisionCoreLogger_onceToken, &__block_literal_global_3205);
      }
      CFTypeRef v8 = (id)_VisionCoreLogger__visionLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = *(_DWORD *)(a1 + 32) - 1;
        if (v9 > 3) {
          char v10 = "VisionCore: ";
        }
        else {
          char v10 = off_26488B6F8[v9];
        }
        int v11 = 136315394;
        uint64_t v12 = v10;
        __int16 v13 = 2080;
        int v14 = v7;
        _os_log_impl(&dword_22B18B000, v8, OS_LOG_TYPE_DEFAULT, "%s%s\n", (uint8_t *)&v11, 0x16u);
      }

      CFRelease(v5);
    }
  }
}

id _VisionCoreSignpostLog()
{
  if (_VisionCoreSignpostLog_onceToken != -1) {
    dispatch_once(&_VisionCoreSignpostLog_onceToken, &__block_literal_global_3288);
  }
  uint64_t v0 = (void *)_VisionCoreSignpostLog____VisionCoreSignpostLog;
  return v0;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x270EEA008](buffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x270EEA230]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4D58](buffer, planeIndex);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x270EF4DC8]();
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4DF0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x270F96018]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x270ED7C68](libraryName);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return MEMORY[0x270ED7C70](libraryName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t Espresso::load_network_shape()
{
  return MEMORY[0x270F279D8]();
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

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x270F98508](this, __pos, __n1, __s, __n2);
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

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

void std::locale::~locale(std::locale *this)
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C668](adler, buf, *(void *)&len);
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x270F9A430](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x270F9A4A0](cls);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x270F27AE8]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x270F27B20]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x270F27B30]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x270F27B48]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x270F27B60]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x270F27B68]();
}

uint64_t e5rt_e5_compiler_options_set_compute_device_types_mask()
{
  return MEMORY[0x270F27B70]();
}

uint64_t e5rt_e5_compiler_options_set_custom_ane_compiler_options()
{
  return MEMORY[0x270F27B78]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x270F27B80]();
}

uint64_t e5rt_error_code_get_string()
{
  return MEMORY[0x270F27B88]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x270F27BD0]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x270F27C28]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x270F27C40]();
}

uint64_t e5rt_execution_stream_prewire_in_use_allocations()
{
  return MEMORY[0x270F27C50]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x270F27C70]();
}

uint64_t e5rt_execution_stream_submit_async()
{
  return MEMORY[0x270F27C80]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x270F27CB0]();
}

uint64_t e5rt_io_port_is_surface()
{
  return MEMORY[0x270F27CC0]();
}

uint64_t e5rt_io_port_is_tensor()
{
  return MEMORY[0x270F27CC8]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x270F27CE8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x270F27D00]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x270F27D08]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x270F27D18]();
}

uint64_t e5rt_program_library_create()
{
  return MEMORY[0x270F27D28]();
}

uint64_t e5rt_program_library_get_build_info()
{
  return MEMORY[0x270F27D30]();
}

uint64_t e5rt_program_library_get_function_metadata()
{
  return MEMORY[0x270F27D38]();
}

uint64_t e5rt_program_library_get_segmentation_analytics()
{
  return MEMORY[0x270F27D58]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x270F27D60]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x270F27D70]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x270F27D80]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x270F27D90]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x270F27DA0]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x270F27DB0]();
}

uint64_t e5rt_surface_format_to_cvpb_4cc()
{
  return MEMORY[0x270F27DC0]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x270F27DD8]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x270F27DE8]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x270F27E10]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x270F27E20]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x270F27E38]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x270F27E58]();
}

uint64_t e5rt_tensor_desc_get_size()
{
  return MEMORY[0x270F27E60]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x270F27E68]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x270F27E88]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x270F27F68]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x270F280A8]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x270F9A4F8](m);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

const char **__cdecl objc_copyImageNames(unsigned int *outCount)
{
  return (const char **)MEMORY[0x270F9A5D8](outCount);
}

void objc_end_catch(void)
{
}

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x270F9A668](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x270F9AA68](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

int sgelqf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE750](__m, __n, __a, __lda, __tau, __work, __lwork, __info);
}

int sgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__s, __CLPK_real *__u, __CLPK_integer *__ldu, __CLPK_real *__vt, __CLPK_integer *__ldvt, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE7B8](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

int sormlq_(char *__side, char *__trans, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__k, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__c__, __CLPK_integer *__ldc, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE838](__side, __trans, __m, __n, __k, __a, __lda, __tau);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vasm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vdist(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vpythg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}
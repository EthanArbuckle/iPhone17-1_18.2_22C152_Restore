@interface VKIconModifiers
- (BOOL)elevated;
- (BOOL)interactive;
- (BOOL)isSearchResult;
- (BOOL)navMode;
- (BOOL)nightMode;
- (BOOL)transitMode;
- (VKIconModifiers)init;
- (VKIconModifiers)initWithModifiers:(const void *)a3;
- (id).cxx_construct;
- (int64_t)zoom;
- (unint64_t)countryCode;
- (unint64_t)secondaryVariant;
- (unint64_t)variant;
- (void)cppModifiers;
- (void)setCountryCode:(unint64_t)a3;
- (void)setElevated:(BOOL)a3;
- (void)setGlyphOnly:(BOOL)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setNavMode:(BOOL)a3;
- (void)setNightMode:(BOOL)a3;
- (void)setSearchResult:(BOOL)a3;
- (void)setSecondaryVariant:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)setTransitLineColor:(id)a3;
- (void)setTransitMode:(BOOL)a3;
- (void)setVariant:(unint64_t)a3;
- (void)setZoom:(int64_t)a3;
@end

@implementation VKIconModifiers

- (id).cxx_construct
{
  *(void *)&self->_iconModifiers._isClusterIcon = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&self->_iconModifiers._opacity = _D0;
  self->_iconModifiers._pathScale._hasValue = 0;
  LOWORD(self->_iconModifiers._pathScale._value.type) = 0;
  self->_iconModifiers._pathScale._value.data[6] = 0;
  *(&self->_iconModifiers._component + 4) = 0;
  *(&self->_iconModifiers._customColor._hasValue + 4) = 0;
  self->_iconModifiers._shapeColor._hasValue = 0;
  self->_iconModifiers._tailDirection._value.type = 0.0;
  p_value = &self->_iconModifiers._tailDirection._value;
  *(void *)&self->_iconModifiers._textLocale._hasValue = grl::Allocator::instance((grl::Allocator *)self);
  self->_iconModifiers._textLocale._value.type = 0.0;
  *(void *)&self->_iconModifiers._tailDirection._hasValue = p_value;
  *(void *)&self->_anon_80[72] = 0;
  *(_OWORD *)self->_anon_80 = 0u;
  *(_OWORD *)&self->_anon_80[16] = 0u;
  *(_OWORD *)&self->_anon_80[32] = 0u;
  return self;
}

- (void).cxx_destruct
{
}

- (void)setTransitMode:(BOOL)a3
{
  self->_transitMode = a3;
}

- (void)setGlyphOnly:(BOOL)a3
{
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (int64_t)zoom
{
  return self->_zoom;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (unint64_t)secondaryVariant
{
  return self->_secondaryVariant;
}

- (void)cppModifiers
{
  return &self->_iconModifiers;
}

- (BOOL)transitMode
{
  return self->_transitMode;
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (BOOL)navMode
{
  return self->_navMode;
}

- (BOOL)isSearchResult
{
  return self->_searchResult;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (BOOL)elevated
{
  return self->_elevated;
}

- (VKIconModifiers)init
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)VKIconModifiers;
  v2 = [(VKIconModifiers *)&v26 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v27[0] = 0;
    memset(&v27[1], 0, 32);
    memset(v32, 0, sizeof(v32));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    *((void *)&v27[0] + 1) = _D0;
    BYTE14(v27[1]) = 0;
    long long v31 = 0uLL;
    *((void *)&v31 + 1) = grl::Allocator::instance((grl::Allocator *)v2);
    memset(v32, 0, 56);
    *((void *)&v30 + 1) = &v31;
    v33 = 0;
    *(_OWORD *)&v3->_iconModifiers._isClusterIcon = v27[0];
    BOOL hasValue = v3->_iconModifiers._pathScale._hasValue;
    if (LOBYTE(v27[1]))
    {
      *((_DWORD *)&v3->_iconModifiers._pathScale._hasValue + 1) = DWORD1(v27[1]);
      if (!hasValue) {
        v3->_iconModifiers._pathScale._BOOL hasValue = 1;
      }
    }
    else if (v3->_iconModifiers._pathScale._hasValue)
    {
      v3->_iconModifiers._pathScale._BOOL hasValue = 0;
    }
    v3->_iconModifiers._pathScale._value.data[0] = BYTE8(v27[1]);
    int v10 = v3->_iconModifiers._pathScale._value.data[1];
    if (BYTE9(v27[1]))
    {
      *(_DWORD *)((char *)&v3->_iconModifiers._pathScale._value.type + 2) = *(_DWORD *)((char *)&v27[1] + 10);
      if (!v10) {
        v3->_iconModifiers._pathScale._value.data[1] = 1;
      }
    }
    else if (v3->_iconModifiers._pathScale._value.data[1])
    {
      v3->_iconModifiers._pathScale._value.data[1] = 0;
    }
    int v11 = v3->_iconModifiers._pathScale._value.data[6];
    if (BYTE14(v27[1]))
    {
      *(_DWORD *)((char *)&v3->_iconModifiers._pathScale._value.type + 7) = *(_DWORD *)((char *)&v27[1] + 15);
      if (!v11) {
        v3->_iconModifiers._pathScale._value.data[6] = 1;
      }
    }
    else if (v3->_iconModifiers._pathScale._value.data[6])
    {
      v3->_iconModifiers._pathScale._value.data[6] = 0;
    }
    int v12 = *(&v3->_iconModifiers._component + 4);
    if (BYTE4(v27[2]))
    {
      *(_DWORD *)&v3->_iconModifiers._customColor._BOOL hasValue = DWORD2(v27[2]);
      if (!v12) {
        *(&v3->_iconModifiers._component + 4) = 1;
      }
    }
    else if (*(&v3->_iconModifiers._component + 4))
    {
      *(&v3->_iconModifiers._component + 4) = 0;
    }
    int v13 = *((unsigned __int8 *)&v3->_iconModifiers._customColor._hasValue + 4);
    if (BYTE12(v27[2]))
    {
      LODWORD(v3->_iconModifiers._customColor._value.type) = v28;
      if (!v13) {
        *(&v3->_iconModifiers._customColor._hasValue + 4) = 1;
      }
    }
    else if (*(&v3->_iconModifiers._customColor._hasValue + 4))
    {
      *(&v3->_iconModifiers._customColor._hasValue + 4) = 0;
    }
    if (BYTE8(v28))
    {
      if (v3->_iconModifiers._shapeColor._hasValue)
      {
        p_value = (void **)&v3->_iconModifiers._shapeColor._value;
        if ((char)v3->_iconModifiers._fontSize._value.data[7] < 0) {
          operator delete(*p_value);
        }
        long long v15 = v29;
        *(void *)&v3->_iconModifiers._fontSize._value.type = v30;
        *(_OWORD *)p_value = v15;
        BYTE7(v30) = 0;
        LOBYTE(v29) = 0;
      }
      else
      {
        double v16 = *(double *)&v30;
        *(_OWORD *)v3->_iconModifiers._shapeColor._value.data = v29;
        v3->_iconModifiers._fontSize._value.type = v16;
        *(void *)&long long v30 = 0;
        long long v29 = 0uLL;
        v3->_iconModifiers._shapeColor._BOOL hasValue = 1;
      }
    }
    else if (v3->_iconModifiers._shapeColor._hasValue)
    {
      if ((char)v3->_iconModifiers._fontSize._value.data[7] < 0) {
        operator delete(*(void **)&v3->_iconModifiers._shapeColor._value.type);
      }
      v3->_iconModifiers._shapeColor._BOOL hasValue = 0;
    }
    v17 = &v3->_iconModifiers._tailDirection._value;
    std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,std::string>,grl::Allocator>>::destroy((uint64_t)&v3->_iconModifiers._tailDirection, *(void *)&v3->_iconModifiers._tailDirection._value.type);
    *(void *)&v3->_iconModifiers._tailDirection._BOOL hasValue = *((void *)&v30 + 1);
    uint64_t v18 = v31;
    *(void *)&v3->_iconModifiers._tailDirection._value.type = v31;
    uint64_t v19 = *(void *)&v32[0];
    v3->_iconModifiers._textLocale._value.type = *(double *)v32;
    if (v19)
    {
      *(void *)(v18 + 16) = v17;
      *((void *)&v30 + 1) = &v31;
      *(void *)&long long v31 = 0;
      *(void *)&v32[0] = 0;
    }
    else
    {
      *(void *)&v3->_iconModifiers._tailDirection._BOOL hasValue = v17;
    }
    v20 = *(void **)v3->_anon_80;
    if (v20)
    {
      *(void *)&v3->_anon_80[8] = v20;
      operator delete(v20);
    }
    *(_OWORD *)v3->_anon_80 = *(_OWORD *)((char *)v32 + 8);
    *(void *)&v3->_anon_80[16] = *((void *)&v32[1] + 1);
    memset((char *)v32 + 8, 0, 24);
    v21 = *(void **)&v3->_anon_80[24];
    if (v21)
    {
      *(void *)&v3->_anon_80[32] = v21;
      operator delete(v21);
    }
    *(_OWORD *)&v3->_anon_80[24] = v32[2];
    *(void *)&v3->_anon_80[40] = *(void *)&v32[3];
    memset(&v32[2], 0, 24);
    v22 = &v3->_anon_80[48];
    v23 = *(VKIconModifiers **)&v3->_anon_80[72];
    *(void *)&v3->_anon_80[72] = 0;
    if (v23 == (VKIconModifiers *)&v3->_anon_80[48])
    {
      (*(void (**)(unsigned __int8 *))(*(void *)v22 + 32))(&v3->_anon_80[48]);
      v24 = v33;
      if (v33)
      {
LABEL_53:
        if (v24 == (_OWORD *)((char *)&v32[3] + 8))
        {
          *(void *)&v3->_anon_80[72] = v22;
          (*(void (**)(void))(*((void *)&v32[3] + 1) + 24))();
        }
        else
        {
          *(void *)&v3->_anon_80[72] = v24;
          v33 = 0;
        }
        goto LABEL_58;
      }
    }
    else
    {
      if (v23) {
        (*((void (**)(VKIconModifiers *))v23->super.isa + 5))(v23);
      }
      v24 = v33;
      if (v33) {
        goto LABEL_53;
      }
    }
    *(void *)&v3->_anon_80[72] = 0;
LABEL_58:
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)v27);
    *(_WORD *)&v3->_transitMode = 0;
    v3->_navMode = 0;
    v3->_interactive = 0;
    v3->_zoom = -1;
    v3->_variant = 0;
    v3->_secondaryVariant = 0;
    v3->_countryCode = 0xFFFFLL;
  }
  return v3;
}

- (unint64_t)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(unint64_t)a3
{
  self->_countryCode = a3;
}

- (void)setSecondaryVariant:(unint64_t)a3
{
  self->_secondaryVariant = a3;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (void)setZoom:(int64_t)a3
{
  self->_zoom = a3;
}

- (void)setSearchResult:(BOOL)a3
{
  self->_searchResult = a3;
}

- (void)setNavMode:(BOOL)a3
{
  self->_navMode = a3;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (void)setElevated:(BOOL)a3
{
  self->_elevated = a3;
}

- (void)setTransitLineColor:(id)a3
{
  float var1 = a3.var1;
  uint64_t v4 = *(void *)&a3.var2;
  int16x8_t v5 = (int16x8_t)vcvtq_s32_f32(vmulq_f32((float32x4_t)a3, (float32x4_t)vdupq_n_s32(0x437F0000u)));
  *(int16x4_t *)v5.i8 = vmovn_s32((int32x4_t)v5);
  unsigned __int32 v6 = vmovn_s16(v5).u32[0];
  grl::IconModifiers::setTransitLineColor((uint64_t)&self->_iconModifiers, &v6);
}

- (void)setText:(id)a3
{
  id v4 = a3;
  int16x8_t v5 = v4;
  if (!v4 || ![v4 length]) {
    goto LABEL_13;
  }
  unsigned __int32 v6 = (const char *)[v5 UTF8String];
  size_t v7 = strlen(v6);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  std::string::size_type v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    p_dst = (std::string *)operator new(v10 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_10;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v7;
  p_dst = &__dst;
  if (v7) {
LABEL_10:
  }
    memmove(p_dst, v6, v8);
  p_dst->__r_.__value_.__s.__data_[v8] = 0;
  grl::IconModifiers::setText(&self->_iconModifiers._isClusterIcon, &__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
LABEL_13:
}

- (VKIconModifiers)initWithModifiers:(const void *)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v114.receiver = self;
  v114.super_class = (Class)VKIconModifiers;
  id v4 = [(VKIconModifiers *)&v114 init];
  i = v4;
  unsigned __int32 v6 = v4;
  if (!v4) {
    return (VKIconModifiers *)v6;
  }
  *(_OWORD *)(v4 + 8) = *(_OWORD *)a3;
  int v7 = v4[24];
  if (*((unsigned char *)a3 + 16))
  {
    *((_DWORD *)v4 + 7) = *((_DWORD *)a3 + 5);
    if (!v7) {
      v4[24] = 1;
    }
  }
  else if (v4[24])
  {
    v4[24] = 0;
  }
  v4[32] = *((unsigned char *)a3 + 24);
  if (*((unsigned char *)a3 + 25))
  {
    if (v4[33])
    {
      v4[34] = *((unsigned char *)a3 + 26);
      v4[35] = *((unsigned char *)a3 + 27);
      v4[36] = *((unsigned char *)a3 + 28);
      v4[37] = *((unsigned char *)a3 + 29);
    }
    else
    {
      *(_DWORD *)(v4 + 34) = *(_DWORD *)((char *)a3 + 26);
      v4[33] = 1;
    }
  }
  else if (v4[33])
  {
    v4[33] = 0;
  }
  if (*((unsigned char *)a3 + 30))
  {
    if (v4[38])
    {
      v4[39] = *((unsigned char *)a3 + 31);
      v4[40] = *((unsigned char *)a3 + 32);
      v4[41] = *((unsigned char *)a3 + 33);
      v4[42] = *((unsigned char *)a3 + 34);
    }
    else
    {
      *(_DWORD *)(v4 + 39) = *(_DWORD *)((char *)a3 + 31);
      v4[38] = 1;
    }
  }
  else if (v4[38])
  {
    v4[38] = 0;
  }
  int v8 = v4[44];
  if (*((unsigned char *)a3 + 36))
  {
    *((_DWORD *)v4 + 12) = *((_DWORD *)a3 + 10);
    if (!v8) {
      v4[44] = 1;
    }
  }
  else if (v4[44])
  {
    v4[44] = 0;
  }
  int v9 = v4[52];
  if (*((unsigned char *)a3 + 44))
  {
    *((_DWORD *)v4 + 14) = *((_DWORD *)a3 + 12);
    if (!v9) {
      v4[52] = 1;
    }
  }
  else if (v4[52])
  {
    v4[52] = 0;
  }
  geo::optional<std::string>::operator=((uint64_t)(v4 + 64), (uint64_t)a3 + 56);
  if (i + 1 != a3)
  {
    uint64_t v10 = (void **)(i + 12);
    uint64_t v11 = (char *)*((void *)a3 + 11);
    int v12 = (char *)a3 + 96;
    if (*((void *)v6 + 15))
    {
      v113 = i;
      v14 = (uint64_t **)(v6 + 104);
      uint64_t v13 = *((void *)v6 + 13);
      uint64_t v15 = *((void *)v6 + 12);
      *((void *)v6 + 12) = v6 + 104;
      *(void *)(v13 + 16) = 0;
      *((void *)v6 + 13) = 0;
      *((void *)v6 + 15) = 0;
      if (*(void *)(v15 + 8)) {
        uint64_t v16 = *(void *)(v15 + 8);
      }
      else {
        uint64_t v16 = v15;
      }
      if (v16)
      {
        v17 = *(void **)(v16 + 16);
        if (v17)
        {
          uint64_t v18 = (void *)*v17;
          if (*v17 == v16)
          {
            void *v17 = 0;
            while (1)
            {
              v63 = (void *)v17[1];
              if (!v63) {
                break;
              }
              do
              {
                v17 = v63;
                v63 = (void *)*v63;
              }
              while (v63);
            }
          }
          else
          {
            for (v17[1] = 0; v18; uint64_t v18 = (void *)v17[1])
            {
              do
              {
                v17 = v18;
                uint64_t v18 = (void *)*v18;
              }
              while (v18);
            }
          }
        }
        if (v11 == v12)
        {
          long long v30 = (char **)v11;
          uint64_t v19 = v16;
        }
        else
        {
          do
          {
            uint64_t v19 = (uint64_t)v17;
            *(_WORD *)(v16 + 32) = *((_WORD *)v11 + 16);
            if ((char *)v16 != v11)
            {
              v20 = (void **)(v16 + 40);
              char v21 = v11[63];
              if (*(char *)(v16 + 63) < 0)
              {
                if (v21 >= 0) {
                  v23 = v11 + 40;
                }
                else {
                  v23 = (void *)*((void *)v11 + 5);
                }
                if (v21 >= 0) {
                  size_t v24 = v11[63];
                }
                else {
                  size_t v24 = *((void *)v11 + 6);
                }
                std::string::__assign_no_alias<false>(v20, v23, v24);
              }
              else if (v11[63] < 0)
              {
                std::string::__assign_no_alias<true>(v20, *((void **)v11 + 5), *((void *)v11 + 6));
              }
              else
              {
                long long v22 = *(_OWORD *)(v11 + 40);
                *(void *)(v16 + 56) = *((void *)v11 + 7);
                *(_OWORD *)v20 = v22;
              }
            }
            v25 = *v14;
            objc_super v26 = (uint64_t *)(v6 + 104);
            v27 = (uint64_t *)(v6 + 104);
            if (*v14)
            {
              do
              {
                while (1)
                {
                  objc_super v26 = v25;
                  if (*(unsigned __int16 *)(v16 + 32) >= *((unsigned __int16 *)v25 + 16)) {
                    break;
                  }
                  v25 = (uint64_t *)*v25;
                  v27 = v26;
                  if (!*v26) {
                    goto LABEL_63;
                  }
                }
                v25 = (uint64_t *)v25[1];
              }
              while (v25);
              v27 = v26 + 1;
            }
LABEL_63:
            *(void *)uint64_t v16 = 0;
            *(void *)(v16 + 8) = 0;
            *(void *)(v16 + 16) = v26;
            uint64_t *v27 = v16;
            long long v28 = (void *)**v10;
            if (v28)
            {
              *uint64_t v10 = v28;
              uint64_t v16 = *v27;
            }
            std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v6 + 13), (uint64_t *)v16);
            ++*((void *)v6 + 15);
            if (v17)
            {
              v17 = (void *)v17[2];
              if (v17)
              {
                v32 = (void *)*v17;
                if (*v17 == v19)
                {
                  void *v17 = 0;
                  while (1)
                  {
                    v33 = (void *)v17[1];
                    if (!v33) {
                      break;
                    }
                    do
                    {
                      v17 = v33;
                      v33 = (void *)*v33;
                    }
                    while (v33);
                  }
                }
                else
                {
                  for (v17[1] = 0; v32; v32 = (void *)v17[1])
                  {
                    do
                    {
                      v17 = v32;
                      v32 = (void *)*v32;
                    }
                    while (v32);
                  }
                }
              }
            }
            else
            {
              v17 = 0;
            }
            long long v29 = (char *)*((void *)v11 + 1);
            if (v29)
            {
              do
              {
                long long v30 = (char **)v29;
                long long v29 = *(char **)v29;
              }
              while (v29);
            }
            else
            {
              do
              {
                long long v30 = (char **)*((void *)v11 + 2);
                BOOL v31 = *v30 == v11;
                uint64_t v11 = (char *)v30;
              }
              while (!v31);
            }
            if (!v19) {
              break;
            }
            uint64_t v16 = v19;
            uint64_t v11 = (char *)v30;
          }
          while (v30 != (char **)v12);
        }
        std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,std::string>,grl::Allocator>>::destroy((uint64_t)v10, v19);
        if (v17)
        {
          uint64_t v34 = (void *)v17[2];
          for (i = v113; v34; uint64_t v34 = (void *)v34[2])
            v17 = v34;
          std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,std::string>,grl::Allocator>>::destroy((uint64_t)v10, (uint64_t)v17);
          if (v30 == (char **)v12) {
            goto LABEL_115;
          }
          goto LABEL_95;
        }
      }
      else
      {
        long long v30 = (char **)v11;
      }
      i = v113;
      if (v30 == (char **)v12) {
        goto LABEL_115;
      }
    }
    else
    {
      long long v30 = (char **)*((void *)a3 + 11);
      if (v11 == v12) {
        goto LABEL_115;
      }
    }
LABEL_95:
    v35 = (uint64_t **)(i + 13);
    do
    {
      uint64_t v36 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)v6 + 14) + 16))(*((void *)v6 + 14), 64, 8);
      *(_WORD *)(v36 + 32) = *((_WORD *)v30 + 16);
      v37 = (std::string *)(v36 + 40);
      if (*((char *)v30 + 63) < 0)
      {
        std::string::__init_copy_ctor_external(v37, v30[5], (std::string::size_type)v30[6]);
      }
      else
      {
        long long v38 = *(_OWORD *)(v30 + 5);
        *(void *)(v36 + 56) = v30[7];
        *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      }
      v39 = *v35;
      v40 = i + 13;
      v41 = i + 13;
      if (*v35)
      {
        do
        {
          while (1)
          {
            v40 = v39;
            if (*(unsigned __int16 *)(v36 + 32) >= *((unsigned __int16 *)v39 + 16)) {
              break;
            }
            v39 = (uint64_t *)*v39;
            v41 = v40;
            if (!*v40) {
              goto LABEL_107;
            }
          }
          v39 = (uint64_t *)v39[1];
        }
        while (v39);
        v41 = v40 + 1;
      }
LABEL_107:
      *(void *)uint64_t v36 = 0;
      *(void *)(v36 + 8) = 0;
      *(void *)(v36 + 16) = v40;
      uint64_t *v41 = v36;
      v42 = (void *)**v10;
      if (v42)
      {
        *uint64_t v10 = v42;
        uint64_t v36 = *v41;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v6 + 13), (uint64_t *)v36);
      ++*((void *)v6 + 15);
      v43 = v30[1];
      if (v43)
      {
        do
        {
          v44 = v43;
          v43 = *(char **)v43;
        }
        while (v43);
      }
      else
      {
        do
        {
          v44 = v30[2];
          BOOL v31 = *(void *)v44 == (void)v30;
          long long v30 = (char **)v44;
        }
        while (!v31);
      }
      long long v30 = (char **)v44;
    }
    while (v44 != v12);
LABEL_115:
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>(i + 16, *((char **)a3 + 15), *((char **)a3 + 16), (uint64_t)(*((void *)a3 + 16) - *((void *)a3 + 15)) >> 2);
    v45 = (unsigned char *)*((void *)v6 + 19);
    v46 = (long long *)*((void *)a3 + 18);
    v47 = (int *)*((void *)a3 + 19);
    uint64_t v48 = (char *)v47 - (char *)v46;
    unint64_t v49 = ((char *)v47 - (char *)v46) >> 2;
    uint64_t v50 = *((void *)v6 + 21);
    if (v49 > (v50 - (uint64_t)v45) >> 2)
    {
      if (v45)
      {
        *((void *)v6 + 20) = v45;
        operator delete(v45);
        uint64_t v50 = 0;
        *((void *)v6 + 19) = 0;
        *((void *)v6 + 20) = 0;
        *((void *)v6 + 21) = 0;
      }
      if (v48 < 0) {
        goto LABEL_185;
      }
      uint64_t v51 = v50 >> 1;
      if (v50 >> 1 <= v49) {
        uint64_t v51 = ((char *)v47 - (char *)v46) >> 2;
      }
      unint64_t v52 = (unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v51;
      if (v52 >> 62) {
LABEL_185:
      }
        abort();
      v53 = operator new(4 * v52);
      v45 = v53;
      *((void *)v6 + 20) = v53;
      v54 = (unsigned char **)(v6 + 160);
      *((void *)v6 + 19) = v53;
      *((void *)v6 + 21) = &v53[4 * v52];
      v55 = v53;
      if (v46 != (long long *)v47)
      {
        memcpy(v53, v46, ((v48 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
        v55 = &v45[((v48 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4];
      }
      goto LABEL_150;
    }
    v54 = (unsigned char **)(v6 + 160);
    v56 = (unsigned char *)*((void *)v6 + 20);
    uint64_t v57 = v56 - v45;
    unint64_t v58 = (v56 - v45) >> 2;
    if (v58 < v49)
    {
      v59 = (int *)v46 + v58;
      if (v56 == v45) {
        goto LABEL_162;
      }
      unint64_t v60 = v57 - 4;
      if ((unint64_t)(v57 - 4) < 0x1C)
      {
        v61 = (int *)*((void *)a3 + 18);
        goto LABEL_160;
      }
      if (v45 < (unsigned char *)v46 + (v57 & 0xFFFFFFFFFFFFFFFCLL))
      {
        v61 = (int *)*((void *)a3 + 18);
        if (&v45[v57 & 0xFFFFFFFFFFFFFFFCLL] > (unsigned char *)v46) {
          goto LABEL_160;
        }
      }
      uint64_t v64 = (v60 >> 2) + 1;
      if (v60 >= 0x7C)
      {
        uint64_t v65 = v64 & 0x7FFFFFFFFFFFFFE0;
        v81 = v46 + 4;
        v82 = v45 + 64;
        uint64_t v83 = v64 & 0x7FFFFFFFFFFFFFE0;
        do
        {
          long long v85 = *(v81 - 4);
          long long v84 = *(v81 - 3);
          long long v86 = *(v81 - 1);
          long long v88 = *v81;
          long long v87 = v81[1];
          long long v90 = v81[2];
          long long v89 = v81[3];
          *(v82 - 2) = *(v81 - 2);
          *(v82 - 1) = v86;
          *(v82 - 4) = v85;
          *(v82 - 3) = v84;
          v82[2] = v90;
          v82[3] = v89;
          v81 += 8;
          _OWORD *v82 = v88;
          v82[1] = v87;
          v82 += 8;
          v83 -= 32;
        }
        while (v83);
        if (v64 == v65) {
          goto LABEL_161;
        }
        if ((v64 & 0x18) == 0)
        {
          uint64_t v98 = 4 * v65;
          v61 = (int *)((char *)v46 + v98);
          v45 += v98;
          goto LABEL_160;
        }
      }
      else
      {
        uint64_t v65 = 0;
      }
      uint64_t v91 = 4 * (v64 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v92 = v65 - (v64 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v93 = 4 * v65;
      v94 = (long long *)((char *)v46 + 4 * v65);
      v95 = &v45[v93];
      do
      {
        long long v96 = *v94;
        long long v97 = v94[1];
        v94 += 2;
        _OWORD *v95 = v96;
        v95[1] = v97;
        v95 += 2;
        v92 += 8;
      }
      while (v92);
      if (v64 == (v64 & 0x7FFFFFFFFFFFFFF8)) {
        goto LABEL_161;
      }
      v61 = (int *)((char *)v46 + v91);
      v45 += v91;
      do
      {
LABEL_160:
        unsigned char *v45 = *(unsigned char *)v61;
        v45[1] = *((unsigned char *)v61 + 1);
        v45[2] = *((unsigned char *)v61 + 2);
        v45[3] = *((unsigned char *)v61++ + 3);
        v45 += 4;
      }
      while (v61 != v59);
LABEL_161:
      v45 = *v54;
LABEL_162:
      v99 = v45;
      if (v59 != v47)
      {
        v100 = (char *)v46 + v57;
        unint64_t v101 = (char *)v47 - ((char *)v46 + v57) - 4;
        if (v101 < 0x1C)
        {
          v99 = v45;
        }
        else
        {
          unint64_t v102 = v45 - v100;
          v99 = v45;
          if (v102 >= 0x20)
          {
            uint64_t v103 = (v101 >> 2) + 1;
            uint64_t v104 = 4 * (v103 & 0x7FFFFFFFFFFFFFF8);
            v59 = (int *)((char *)v59 + v104);
            v105 = v45 + 16;
            v106 = (long long *)((char *)v46 + 4 * v58 + 16);
            uint64_t v107 = v103 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v108 = *v106;
              *(v105 - 1) = *(v106 - 1);
              _OWORD *v105 = v108;
              v105 += 2;
              v106 += 2;
              v107 -= 8;
            }
            while (v107);
            v99 = &v45[v104];
            if (v103 == (v103 & 0x7FFFFFFFFFFFFFF8)) {
              goto LABEL_171;
            }
          }
        }
        do
        {
          int v109 = *v59++;
          *(_DWORD *)v99 = v109;
          v99 += 4;
        }
        while (v59 != v47);
      }
LABEL_171:
      uint64_t v80 = v99 - v45;
      goto LABEL_172;
    }
    if (v46 == (long long *)v47)
    {
      v55 = (unsigned char *)*((void *)v6 + 19);
    }
    else
    {
      unint64_t v62 = v48 - 4;
      if ((unint64_t)(v48 - 4) >= 0x7C)
      {
        unint64_t v66 = (v62 & 0xFFFFFFFFFFFFFFFCLL) + 4;
        if (v45 >= (unsigned char *)v46 + v66 || (v67 = (long long *)&v45[v66], v55 = (unsigned char *)*((void *)v6 + 19), v67 <= v46))
        {
          uint64_t v68 = (v62 >> 2) + 1;
          uint64_t v69 = 4 * (v68 & 0x7FFFFFFFFFFFFFE0);
          v55 = &v45[v69];
          v70 = v46 + 4;
          v71 = v45 + 64;
          uint64_t v72 = v68 & 0x7FFFFFFFFFFFFFE0;
          do
          {
            long long v74 = *(v70 - 4);
            long long v73 = *(v70 - 3);
            long long v75 = *(v70 - 1);
            long long v77 = *v70;
            long long v76 = v70[1];
            long long v79 = v70[2];
            long long v78 = v70[3];
            *(v71 - 2) = *(v70 - 2);
            *(v71 - 1) = v75;
            *(v71 - 4) = v74;
            *(v71 - 3) = v73;
            v71[2] = v79;
            v71[3] = v78;
            v70 += 8;
            _OWORD *v71 = v77;
            v71[1] = v76;
            v71 += 8;
            v72 -= 32;
          }
          while (v72);
          if (v68 == (v68 & 0x7FFFFFFFFFFFFFE0)) {
            goto LABEL_150;
          }
          v46 = (long long *)((char *)v46 + v69);
        }
      }
      else
      {
        v55 = (unsigned char *)*((void *)v6 + 19);
      }
      do
      {
        unsigned char *v55 = *(unsigned char *)v46;
        v55[1] = *((unsigned char *)v46 + 1);
        v55[2] = *((unsigned char *)v46 + 2);
        v55[3] = *((unsigned char *)v46 + 3);
        v55 += 4;
        v46 = (long long *)((char *)v46 + 4);
      }
      while (v46 != (long long *)v47);
    }
LABEL_150:
    uint64_t v80 = v55 - v45;
LABEL_172:
    *v54 = &v45[v80];
  }
  v110 = (char *)*((void *)a3 + 24);
  if (v110)
  {
    if (v110 == (char *)a3 + 168)
    {
      v116 = v115;
      (*(void (**)(char *, void *))(*((void *)a3 + 21) + 24))((char *)a3 + 168, v115);
      goto LABEL_179;
    }
    uint64_t v111 = (*(uint64_t (**)(void))(*(void *)v110 + 16))(*((void *)a3 + 24));
  }
  else
  {
    uint64_t v111 = 0;
  }
  v116 = (void *)v111;
LABEL_179:
  std::__function::__value_func<CGImage * ()(gm::Matrix<unsigned int,2,1>,float)>::swap[abi:nn180100](v115, i + 22);
  if (v116 == v115)
  {
    (*(void (**)(void *))(v115[0] + 32))(v115);
  }
  else if (v116)
  {
    (*(void (**)(void))(*v116 + 40))();
  }
  *((_WORD *)v6 + 106) = 0;
  v6[211] = 0;
  v6[209] = 0;
  *((void *)v6 + 27) = -1;
  *((void *)v6 + 28) = 0;
  *((void *)v6 + 29) = 0;
  *((void *)v6 + 30) = 0xFFFFLL;
  return (VKIconModifiers *)v6;
}

@end